package com.basic.controller.product;

import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;
import com.basic.controller.common.BasicController;
import com.basic.entity.Product;
import com.basic.entity.UploadFiles;
import com.basic.service.ProductImageService;
import com.basic.service.ProductService;
import com.basic.service.UploadFilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
            return productService.getPageInfo(map);
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
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
                        @RequestParam(name = "shortImageId", required = false) String shortImageId,
                        @RequestParam(name = "mainImageId", required = false) List<String> mainImageIds,
                        @RequestParam(name = "tempFileId", required = false) List<String> tempFileIds) {
        try {

            if (StringUtils.isBlank(shortImageId)) {
                return Result.fail("请上传缩略图");
            }
            if (mainImageIds == null || mainImageIds.size() <= 0) {
                return Result.fail("请上传相册图片");
            }
            if (tempFileIds == null || tempFileIds.size() <= 0) {
                return Result.fail("请上传附件");
            }
            UploadFiles image = uploadFilesService.getById(shortImageId);
            if (image != null) {
                product.setShortId(shortImageId);
                product.setShortImage(image.getUrl());
            }
            productService.addProduct(product, mainImageIds, tempFileIds);
            return Result.success();

        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Product product = productService.getById(id);
        List<UploadFiles> mainImages = uploadFilesService.selectImageByProductId(id);
        model.addAttribute("mainImages", mainImages);
        List<UploadFiles> files = uploadFilesService.selectFileByProductId(id);
        model.addAttribute("files", files);
        if (product != null) {
            model.addAttribute("product", product);
        } else {
            return ErrorPage(model);
        }
        return prefix + "/product_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadProduct") Product product,
                           @RequestParam(name = "shortImageId", required = false) String shortImageId,
                           @RequestParam(name = "mainImageId", required = false) List<String> mainImageIds,
                           @RequestParam(name = "tempFileId", required = false) List<String> tempFileIds) {


        try {
            if (StringUtils.isBlank(shortImageId)) {
                return Result.fail("请上传缩略图");
            }
            if (mainImageIds == null || mainImageIds.size() <= 0) {
                return Result.fail("请上传相册图片");
            }
            if (tempFileIds == null || tempFileIds.size() <= 0) {
                return Result.fail("请上传附件");
            }
            product.setShortImage("");
            product.setShortImage("");
            UploadFiles image = uploadFilesService.getById(shortImageId);
            if (image != null) {
                product.setShortId(shortImageId);
                product.setShortImage(image.getUrl());
            }
            productService.updateProduct(product, mainImageIds, tempFileIds);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
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
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR,e);
        }
    }

    @GetMapping("cropper")
    public String cropper(@RequestParam(name = "imgUrl", required = false) String imgUrl, Model model) {
        model.addAttribute("imgUrl", imgUrl);
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