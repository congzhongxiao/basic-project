package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.basic.common.domain.Result;
import com.basic.entity.ProductFile;
import com.basic.entity.ProductImage;
import com.basic.mapper.ProductFileMapper;
import com.basic.mapper.ProductImageMapper;
import com.basic.service.ProductFileService;
import com.basic.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basic.common.utils.PageUtil;

import com.basic.entity.Product;
import com.basic.service.ProductService;
import com.basic.mapper.ProductMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 产品ServiceImpl
 *
 * @author: lee
 * @time: 2020-04-27 10:58:14
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ProductFileService productFileService;

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam) {
        Page<Product> page = new PageUtil<Product>(queryParam).getPage();
        QueryWrapper<Product> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage<Map<String, Object>> mapIPage = baseMapper.selectMapsPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

    @Override
    @Transactional(rollbackFor = Exception.class )
    public void addProduct(Product product, List<String> mainImageIds, List<String> tempFileIds) {
        baseMapper.insert(product);
        if (mainImageIds != null && mainImageIds.size() > 0) {
            for (String imageId : mainImageIds) {
                ProductImage productImage = new ProductImage();
                productImage.setImageId(imageId);
                productImage.setProductId(product.getId());
                productImageService.save(productImage);
            }
        }
        if (tempFileIds != null && tempFileIds.size() > 0) {
            for (String fileId : tempFileIds) {
                ProductFile productFile = new ProductFile();
                productFile.setFileId(fileId);
                productFile.setProductId(product.getId());
                productFileService.save(productFile);
            }
        }
    }
    @Transactional(rollbackFor = Exception.class )
    public void updateProduct(Product product, List<String> mainImageIds, List<String> tempFileIds) {
            productImageService.remove(new QueryWrapper<ProductImage>().eq("product_id", product.getId()));
            productFileService.remove(new QueryWrapper<ProductFile>().eq("product_id", product.getId()));
            if (mainImageIds != null && mainImageIds.size() > 0) {
                for (String imageId : mainImageIds) {
                    ProductImage productImage = new ProductImage();
                    productImage.setImageId(imageId);
                    productImage.setProductId(product.getId());
                    productImageService.save(productImage);
                }
            }
            if (tempFileIds != null && tempFileIds.size() > 0) {
                for (String fileId : tempFileIds) {
                    ProductFile productFile = new ProductFile();
                    productFile.setFileId(fileId);
                    productFile.setProductId(product.getId());
                    productFileService.save(productFile);
                }
            }
            baseMapper.updateById(product);
    }

    @Override
    public void removeProduct(String id) {
            productImageService.remove(new QueryWrapper<ProductImage>().eq("product_id", id));
            productFileService.remove(new QueryWrapper<ProductFile>().eq("product_id", id));
            baseMapper.deleteById(id);
    }

}
