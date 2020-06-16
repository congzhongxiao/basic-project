package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.entity.ProductFile;
import com.basic.entity.ProductImage;
import com.basic.mapper.ProductFileMapper;
import com.basic.mapper.ProductImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.Product;
import com.basic.service.ProductService;
import com.basic.mapper.ProductMapper;

import java.util.List;
import java.util.Map;
/**
*产品ServiceImpl
*@author: lee
*@time: 2020-04-27 10:58:14
*/
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {
    @Autowired
    ProductImageMapper productImageMapper;
    @Autowired
    ProductFileMapper productFileMapper;
    //分页查询
    public IPage<Map<String,Object>> getPageInfo(Map<String, Object> queryParam){
        Page<Product> page = new PageUtil<Product>(queryParam).getPage();
        QueryWrapper<Product> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return mapIPage;
        }

    @Override
    public boolean addProduct(Product product, List<String> mainImageIds, List<String> tempFileIds) {
        try {
            baseMapper.insert(product);
            if(mainImageIds != null && mainImageIds.size() >0) {
                for(String imageId : mainImageIds) {
                    ProductImage productImage = new ProductImage();
                    productImage.setImageId(imageId);
                    productImage.setProductId(product.getId());
                    productImageMapper.insert(productImage);
                }
            }
            if(tempFileIds != null && tempFileIds.size() >0) {
                for(String fileId : tempFileIds) {
                    ProductFile productFile = new ProductFile();
                    productFile.setFileId(fileId);
                    productFile.setProductId(product.getId());
                    productFileMapper.insert(productFile);
                }
            }
            return true;
        } catch ( Exception e ) {
            return false;
        }
    }

    public boolean updateProduct(Product product, List<String> mainImageIds, List<String> tempFileIds) {
        try {
            productImageMapper.delete(new QueryWrapper<ProductImage>().eq("product_id",product.getId()));
            productFileMapper.delete(new QueryWrapper<ProductFile>().eq("product_id",product.getId()));
            if(mainImageIds != null && mainImageIds.size() >0) {
                for(String imageId : mainImageIds) {
                    ProductImage productImage = new ProductImage();
                    productImage.setImageId(imageId);
                    productImage.setProductId(product.getId());
                    productImageMapper.insert(productImage);
                }
            }
            if(tempFileIds != null && tempFileIds.size() >0) {
                for(String fileId : tempFileIds) {
                    ProductFile productFile = new ProductFile();
                    productFile.setFileId(fileId);
                    productFile.setProductId(product.getId());
                    productFileMapper.insert(productFile);
                }
            }
            baseMapper.updateById(product);

            return true;
        } catch ( Exception e ) {
            return false;
        }
    }

    @Override
    public boolean removeProduct(String id) {
        try {
            productImageMapper.delete(new QueryWrapper<ProductImage>().eq("product_id",id));
            productFileMapper.delete(new QueryWrapper<ProductFile>().eq("product_id",id));
            baseMapper.deleteById(id);
            return true;
        } catch ( Exception e){
            return false;
        }
    }

}
