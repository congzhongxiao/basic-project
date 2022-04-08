package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Ztree;
import com.basic.common.utils.StringUtils;
import com.basic.entity.SysArea;
import com.basic.entity.User;
import com.basic.mapper.UserMapper;
import com.basic.service.UserDutyService;
import com.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.SysOrganization;
import com.basic.service.SysOrganizationService;
import com.basic.mapper.SysOrganizationMapper;

import java.util.*;
import java.util.stream.Collectors;

/**
*组织架构ServiceImpl
*@author: lee
*@time: 2021-03-17 15:22:02
*/
@Service
public class SysOrganizationServiceImpl extends ServiceImpl<SysOrganizationMapper, SysOrganization> implements SysOrganizationService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    SysOrganizationMapper sysOrganizationMapper;
    @Autowired
    UserDutyService userDutyService;
    @Autowired
    UserService userService;
    @Autowired
    SysOrganizationService sysOrganizationService;

    public List<SysOrganization> findListByPid(String pid){
        return baseMapper.getListByPid(pid);
    }

    public int addOrganization(SysOrganization organization){
        SysOrganization parent = baseMapper.selectById(organization.getPid());
        if(parent != null) {
            organization.setAncestors(parent.getAncestors() + "," + organization.getPid());
        } else {
            organization.setAncestors("0");
        }
        return baseMapper.insert(organization);
    }

    public void updateOrganization(SysOrganization organization) {
        try {
            SysOrganization currentParent = baseMapper.selectById(organization.getPid());
            String oldAncestors =baseMapper.selectById(organization.getId()).getAncestors();
            if(currentParent != null) {
                String newAncestors = currentParent.getAncestors() + "," + currentParent.getId();
                organization.setAncestors(newAncestors);
                updateChildrenAncestors(organization.getId(),newAncestors,oldAncestors);
            }
            baseMapper.updateById(organization);
            userDutyService.updateUserDutyCompany(organization.getId());
            userService.updateUserCompany(organization.getId());
        } catch (Exception e) {
            log.error("修改组织架构数据异常{}：",e);
            throw new RuntimeException("修改组织架构数据失败");
        }
    }

    /**
     * 更新所有子部门的祖先数据
     * @param parentId
     * @param newAncestors
     * @param oldAncestors
     */
    private void updateChildrenAncestors(String parentId,String newAncestors,String oldAncestors){
        List<SysOrganization> children = baseMapper.getChildrenById(parentId);
        if(children != null && children.size() >0){
            for(SysOrganization child:children) {
                child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
                baseMapper.updateById(child);
            }
        }
    }


    public int deleteById(String id) {
        SysOrganization organization = baseMapper.selectById(id);
        if (organization != null) {
            List<SysOrganization> children = baseMapper.selectList(new QueryWrapper<SysOrganization>().eq("pid", id));
            if (children != null && children.size() > 0) {
                return -1;//存在子信息
            } else {
                List<User> userList = userMapper.selectList(new QueryWrapper<User>().eq("dept_id",id).or().eq("company_id",id));
                if (userList != null && userList.size() > 0) {
                    return -2;//所在组织存在用户信息
                }else {
                    this.baseMapper.deleteById(id);
                }
            }
        }
        return 1;
    }
    @Override
    public List<Ztree> getAllTree(User user) {
        /*QueryWrapper wrapper =  new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<SysOrganization> organizations = baseMapper.selectList(wrapper);*/
        List<SysOrganization> organizations = baseMapper.getOrgListByCompanyId(user.getCompanyId());
        return installTree(organizations, null);
    }


    /**
     * 获取当前用户所在企业的树，不添加子企业
     * @param user
     * @return
     */
    @Override
    public List<Ztree> getCurrentCompanyTree(User user) {
        String orgType = "1";
        List<SysOrganization> organizations = baseMapper.getCurrentCompanyByCompanyId(user.getCompanyId(), orgType);
        return installTree(organizations, null);
    }

    /**
     * 查询整个集团的树
     *
     * @return
     */
    @Override
    public List<Ztree> getAllGroupTree() {
        QueryWrapper<SysOrganization> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysOrganization::getPid, "0");
        List<SysOrganization> organizations = list(queryWrapper);
        return installTree(organizations, null, true, true);
    }

    /**
     * 根据父节点查询子节点树
     *
     * @param orgId
     * @return
     */
    @Override
    public List<Ztree> getChildTreeByPid(String orgId) {
        QueryWrapper<SysOrganization> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysOrganization::getPid, orgId);
        List<SysOrganization> childList = list(queryWrapper);
        return installTree(childList, null, true, true);
    }

    /**
     *
     * 根据变部门id找到上级公司id
     * @param departmentId
     * @return company name
     */
    public SysOrganization getUpperCompany(String departmentId) {
        SysOrganization department = sysOrganizationMapper.selectById(departmentId);
        if ("0".equals(department.getOrgType())) {
            return null;
        }
        List<String> ancestorList = Arrays.asList(department.getAncestors().split(","));
        for (int i = ancestorList.size() - 1; i > 0; i--) {
            SysOrganization sysOrg = sysOrganizationMapper.selectById(ancestorList.get(i));
            if ("0".equals(sysOrg.getOrgType())) {
                return sysOrg;
            }
        }
        return null;
    }
    private List<Ztree> installTree(List<SysOrganization> organizationList, List<SysOrganization> checkedList) {
        return installTree(organizationList, checkedList, false, false);
    }

    private List<Ztree> installTree(List<SysOrganization> organizationList, List<SysOrganization> checkedList, boolean isParent, boolean nocheck) {
        List<Ztree> treeList = new ArrayList<Ztree>();
        if (organizationList != null && organizationList.size() > 0) {
            for (SysOrganization organization : organizationList) {
                Ztree tree = new Ztree();
                tree.setId(organization.getId());
                tree.setPId(organization.getPid());
                tree.setTitle(organization.getName());
                tree.setName(organization.getName());
                tree.setType(organization.getOrgType());
                // 异步展开时为了标记这个节点能够展开，需要标记该字段为true
                if (isParent) {
                    tree.setIsParent(1);
                }
                // 标记节点为无复选框样式
                if (nocheck) {
                    tree.setNocheck(true);
                }
                if (checkedList != null && checkedList.size() > 0) {
                    for (SysOrganization check : checkedList) {
                        if (check.getId().equals(organization.getId())) {
                            tree.setChecked(true);
                        }
                    }
                }
                treeList.add(tree);
            }
        }
        treeList = treeList.stream().sorted(Comparator.comparing(Ztree::getSort)).collect(Collectors.toList());
        return treeList;
    }

    /**
     * 根据公司id返回全部下属公司
     *
     * @param companyId
     * @return list
     */
    public List<SysOrganization> findChildrenCompanyByCompanyId(String companyId){
        return baseMapper.getChildrenCompanyByCompanyId(companyId);
    }

    /**
     * 根据公司id返回全部该公司的全部下属部门,包括下级公司的部门
     *
     * @param companyId
     * @return list
     */
    public List<SysOrganization> findAllChildrenDeptByCompanyId(String companyId){
        return baseMapper.getChildrenDeptByCompanyId(companyId);
    }

    /**
     * 根据公司id返回属于该公司的所有部门
     *
     * @param companyId
     * @return list
     */
    public List<SysOrganization> findDirectChildrenDeptByCompanyId(String companyId){
        QueryWrapper qw = new QueryWrapper();
        qw.eq("pid", companyId);
        qw.eq("org_type", "1");
        qw.orderByDesc("sort");
        qw.orderByDesc("id");
        List<SysOrganization> depts = baseMapper.selectList(qw);
        List<SysOrganization> result = new ArrayList<>();
        if(depts!=null && depts.size()>0){
            result.addAll(depts);
            for(SysOrganization dept : depts){
                List<SysOrganization> childrenDepts = baseMapper.getChildrenByDepartmentId(dept.getId());
                if(childrenDepts!=null && childrenDepts.size()>0){
                    result.addAll(childrenDepts);

                }
            }
        }
        if(result!=null && result.size()>0){
            result = result.stream().distinct().collect(Collectors.toList());
        }
        return result;
    }

    /**
     * 根据部门id返回本部门及下属部门
     *
     * @param deptId
     * @return list
     */
    public List<SysOrganization> findChildrenDeptByDeptId(String deptId){
        return baseMapper.getChildrenByDepartmentId(deptId);
    }

    /**
     * 查询用户所属组织的组织架构以及组织架构下的企业，显示部门
     *
     * @param currentUser
     * @return
     */
    @Override
    public List<Ztree> getUserControlTreeByUser(User currentUser) {
        List<Ztree> tree = new ArrayList<>();
        List<SysOrganization> companyList = userDutyService.findAllAccessibleCompanyByUser(currentUser);
        if(companyList!=null && companyList.size()>0){
            for(SysOrganization company: companyList){
                tree.add(convertOrgToZtree(company));
                List<SysOrganization> deptList = sysOrganizationService.findDirectChildrenDeptByCompanyId(company.getId());
                if(deptList!=null && deptList.size()>0){
                    for(SysOrganization dept : deptList){
                        tree.add(convertOrgToZtree(dept));
                    }
                }
            }
        }
        else{
            SysOrganization company = sysOrganizationService.getById(currentUser.getCompanyId());
            if(company!=null){
                tree.add(convertOrgToZtree(company));
                List<SysOrganization> deptList = sysOrganizationService.findDirectChildrenDeptByCompanyId(company.getId());
                if(deptList!=null && deptList.size()>0){
                    for(SysOrganization dept : deptList){
                        tree.add(convertOrgToZtree(dept));
                    }
                }
            }
        }
        tree = tree.stream().sorted(Comparator.comparing(Ztree::getSort)).collect(Collectors.toList());
        return tree;
    }

    /**
     * 查询用户所属组织的组织架构以及组织架构下的企业，显示部门
     *
     * @param currentUser
     * @return
     */
    @Override
    public List<Ztree> getCompanyTreeByUser(User currentUser) {
        List<Ztree> tree = new ArrayList<>();
        List<SysOrganization> companyList = userDutyService.findAllAccessibleCompanyByUser(currentUser);
        if(companyList!=null && companyList.size()>0){
            for(SysOrganization company: companyList){
                tree.add(convertOrgToZtree(company));
            }
        }
        else{
            SysOrganization company = sysOrganizationService.getById(currentUser.getCompanyId());
            if(company!=null){
                tree.add(convertOrgToZtree(company));
            }
        }
        tree = tree.stream().sorted(Comparator.comparing(Ztree::getSort)).collect(Collectors.toList());
        return tree;
    }

    /**
     * 查询用户所属组织的组织架构以及组织架构下的企业，不显示部门
     *
     * @param currentUser
     * @return
     */
    @Override
    public List<Ztree> getOrganizationTreeByUser(User currentUser) {
        List<Ztree> tree = new ArrayList<>();
        List<SysOrganization> companyList = userDutyService.findAllAccessibleCompanyByUser(currentUser);
        List<SysOrganization>deptList = userDutyService.findAllAccessibleDeptByUser(currentUser);
        List<SysOrganization> finalCompanyList = new ArrayList<>();
        List<SysOrganization> finalDeptList = new ArrayList<>();

        if(companyList == null||companyList.size()<1){
            SysOrganization company = sysOrganizationService.getById(currentUser.getCompanyId());
            if(company!=null){
                finalCompanyList.add(company);
            }
        }
        else{
            for(SysOrganization company: companyList){
                finalCompanyList.add(company);
            }
        }
        if(deptList ==null||deptList.size()<1){
            SysOrganization dept = sysOrganizationService.getById(currentUser.getDeptId());
            if(dept!=null){
                finalDeptList.add(dept);

                //为保证树形图不出现割裂情况，会确保能够浏览的自己部门的上级部门都处于树形图中
                String ancestor = dept.getAncestors();
                if(StringUtils.isNotBlank(ancestor)){
                    List<String> ancestors = Arrays.asList(ancestor.split(","));
                    if(ancestors!=null && ancestors.size()>0){
                        Collections.reverse(ancestors);
                        for(String id : ancestors){
                            SysOrganization org = sysOrganizationService.getById(id);

                            //只将部门加入集合
                            if(org==null){
                                continue;
                            }
                            if("0".equals(org.getOrgType())){
                                break;
                            }
                            if("1".equals(org.getOrgType())){
                                finalDeptList.add(org);
                            }
                        }
                    }
                }

            }
        }
        else{
            deptList = deptList.stream().distinct().collect(Collectors.toList());
            for(SysOrganization dept: deptList){
                finalDeptList.add(dept);

                //为保证树形图不出现割裂情况，会确保能够浏览的自己部门的上级部门都处于树形图中
                String ancestor = dept.getAncestors();
                if(StringUtils.isNotBlank(ancestor)){
                    List<String> ancestors = Arrays.asList(ancestor.split(","));
                    if(ancestors!=null && ancestors.size()>0){
                        Collections.reverse(ancestors);
                        for(String id : ancestors){
                            SysOrganization org = sysOrganizationService.getById(id);

                            //只将部门加入集合
                            if(org==null){
                                continue;
                            }
                            if("0".equals(org.getOrgType())){
                                break;
                            }
                            if("1".equals(org.getOrgType())){
                                finalDeptList.add(org);
                            }
                        }
                    }
                }
            }
        }

        //统一对最终的结果集合进行去重
        finalCompanyList = finalCompanyList.stream().distinct().collect(Collectors.toList());
        finalDeptList = finalDeptList.stream().distinct().collect(Collectors.toList());

        for(SysOrganization org :finalCompanyList){
            tree.add(convertOrgToZtree(org));
        }

        for(SysOrganization org :finalDeptList){
            tree.add(convertOrgToZtree(org));
        }

        tree = tree.stream().sorted(Comparator.comparing(Ztree::getSort)).collect(Collectors.toList());
        return tree;
    }

    /**
     * 根据code查询组织架构
     * @param code
     * @return
     */
    @Override
    public SysOrganization findByCode(String code) {
        QueryWrapper<SysOrganization> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(SysOrganization::getCode,code)
                .orderByDesc(SysOrganization::getId);
        queryWrapper.last(" limit 1");
        return this.baseMapper.selectOne(queryWrapper);
    }

    /**
     * 组织架构信息转化为ztree节点
     * @param e
     * @return
     */
    private Ztree convertOrgToZtree(SysOrganization e) {
        Ztree ztree = new Ztree();
        ztree.setId(e.getId());
        ztree.setPId(e.getPid());
        ztree.setName(e.getName());
        ztree.setTitle(e.getName());
        ztree.setSort(e.getSort());
        return ztree;
    }

}
