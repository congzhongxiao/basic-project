package com.basic.controller.product;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import com.basic.entity.ProductImage;
import com.basic.entity.UploadFiles;
import com.basic.service.ProductImageService;
import com.basic.service.UploadFilesService;
import org.apache.logging.log4j.message.ReusableMessage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.common.base.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.Product;
import com.basic.service.ProductService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 产品控制器
 *
 * @author: lee
 * @time: 2020-04-27 10:58:14
 */

@Controller
@RequestMapping("/product")
public class ProductController extends BasicController {
    String prefix = "product";
    @Autowired
    ProductService productService;
    @Autowired
    UploadFilesService uploadFilesService;
    @Autowired
    ProductImageService productImageService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/product_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            IPage<Map<String, Object>> page = productService.getPageInfo(map);
            return Result.success(installPageData(page));
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {
        return prefix + "/product_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Product product,
                        @RequestParam(name = "shortImageId",required = false) String shortImageId,
                        @RequestParam(name = "mainImageId",required = false) List<String> mainImageIds,
                        @RequestParam(name = "tempFileId",required = false) List<String> tempFileIds) {
        try {

            if(StringUtils.isBlank(shortImageId)) {
                return Result.fail("请上传缩略图");
            }
            if(mainImageIds == null || mainImageIds.size() <= 0 ) {
                return Result.fail("请上传相册图片");
            }
            if(tempFileIds == null || tempFileIds.size() <= 0) {
                return Result.fail("请上传附件");
            }
            UploadFiles image =  uploadFilesService.getById(shortImageId);
            if(image != null) {
                product.setShortId(shortImageId);
                product.setShortImage(image.getUrl());
            }
            product.setCreateBy(getCurrentUser().getUsername());
            product.setCreateTime(new Date());
            boolean result =  productService.addProduct(product,mainImageIds,tempFileIds);
            if(result) {
                return Result.success();
            } else {
                return Result.fail("保存异常");
            }

        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Product product = productService.getById(id);
        List<UploadFiles> mainImages = uploadFilesService.selectImageByProductId(id);
        model.addAttribute("mainImages",mainImages);
        List<UploadFiles> files = uploadFilesService.selectFileByProductId(id);
        model.addAttribute("files",files);
        if (product != null) {
            model.addAttribute("product", product);
        } else {
            return redirectNoPage();
        }
        return prefix + "/product_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadProduct") Product product,
                           @RequestParam(name = "shortImageId",required = false) String shortImageId,
                           @RequestParam(name = "mainImageId",required = false) List<String> mainImageIds,
                           @RequestParam(name = "tempFileId",required = false) List<String> tempFileIds) {


        try {
            if(StringUtils.isBlank(shortImageId)) {
                return Result.fail("请上传缩略图");
            }
            if(mainImageIds == null || mainImageIds.size() <= 0 ) {
                return Result.fail("请上传相册图片");
            }
            if(tempFileIds == null || tempFileIds.size() <= 0) {
                return Result.fail("请上传附件");
            }
            product.setShortImage("");
            product.setShortImage("");
            UploadFiles image =  uploadFilesService.getById(shortImageId);
            if(image != null) {
                product.setShortId(shortImageId);
                product.setShortImage(image.getUrl());
            }
            product.setUpdateBy(getCurrentUser().getUsername());
            product.setUpdateTime(new Date());
            boolean result =  productService.updateProduct(product,mainImageIds,tempFileIds);
            if(result) {
                return Result.success();
            } else {
                return Result.fail("更新异常");
            }
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                productService.removeProduct(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    @GetMapping("cropper")
    public String picCut(){
        return prefix + "/product_cropper";
    }

    //预加载对象数据
    @ModelAttribute("preloadProduct")
    public Product preloadProduct(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return productService.getById(id.trim());
        }
        return null;
    }
}