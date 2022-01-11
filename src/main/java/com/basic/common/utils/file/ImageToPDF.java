package com.basic.common.utils.file;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class ImageToPDF {
    /**
     * 将图片转换成PDF
     *
     * @param source 文件路径的集合 可以调用 FileUtil.getFileList() 方法
     * @param target PDF的名字和位置
     */
    public static void covertImageToPDF(List<String> source, String target) {
        //创建一个文档对象
        Document doc = new Document();
        doc.setMargins(0, 0, 0, 0);
        try {
            //定义输出文件的位置
            PdfWriter.getInstance(doc, new FileOutputStream(target));
            //开启文档
            doc.open();
            // 循环获取图片文件夹内的图片
            for (String imagePath : source) {
                if (imagePath == null) {      //前面的方法默认了数组长度是1024，所以这里就让它提前退出循环
                    break;
                }
                Image img = Image.getInstance(imagePath);
                Float h = img.getHeight();
                Float w = img.getWidth();
                Rectangle one = new Rectangle(w, h);
                doc.setPageSize(one);

                doc.newPage();

                doc.add(img);
            }
            // 关闭文档
            if (doc != null) {
                doc.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (BadElementException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
