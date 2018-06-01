package org.shopping.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * 文件上传
 *
 * Created by Administrator on 2018/5/1.
 */
@Controller
@RequestMapping("/file")
public class FileUploadController {

    @ResponseBody
    @RequestMapping("/fileUpLoad")
    public String upLoad(MultipartFile file, HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/goodsImages");
        String fileName = file.getOriginalFilename();
        File dir = new File(path, fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        try {
            file.transferTo(dir);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }

//    <form id="test">
//    选择文件:<input data-role="none" type="file" name="file" width="120px">
//    <button data-role="none" onclick="testUpload();">测试</button>
//</form>

//    function testUpload(){
//        var form = new FormData(document.getElementById("test"));
//        var url = 项目访问路径 + "/file/test.do";    //这里的“项目访问路径”要改为你自己的路径
//        $.ajax({
//                url : url,
//                data : form,
//                type : 'post',
//                processData:false,
//                contentType:false,
//                success : function(data){
//            alert("成功")
//        },
//        error : function(data){
//
//        }
//    });
//    }

}
