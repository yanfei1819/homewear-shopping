package org.shopping.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.shopping.entity.Homewear;
import org.shopping.entity.User;
import org.shopping.service.HomewearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by dell on 2018-04-27.
 */
@Controller
@RequestMapping("/homewear")
public class HomewearController {

    @Autowired
    private HomewearService service;

    @ResponseBody
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public List<Homewear> findAll() {
        List<Homewear> list = service.findAll();
        return service.findAll();
    }

    @ResponseBody
    @RequestMapping(value = "/findHomewearById", method = RequestMethod.GET)
    public Homewear findHomewearById(int id) {
        return service.findById(id);
    }

//    @ResponseBody
//    @RequestMapping(value = "/addHomewear", method = RequestMethod.POST)
//    public int addHomewear(MultipartFile picture, HttpServletRequest request, Homewear homewear) {
//
//        try (BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File("/" + picture.getOriginalFilename())))) {
//            out.write(picture.getBytes());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return service.add(homewear);
//    }


//    @ResponseBody
    @RequestMapping(value = "/addHomewear", method = RequestMethod.POST)
    public String addHomewear(MultipartFile picture, HttpServletRequest request, String name,String type,String color,String size,String price) throws IOException {
        String localPath="G:\\File\\";
        //homewear-shopping\src\main\webapp\static\goodsImages
       // System.out.println(request.getContextPath());

//        String filePath = request.getContextPath()+"\\src\\main\\webapp\\static\\goodsImages\\"+picture.getOriginalFilename();
//        File saveDir = new File(filePath);
//        if (!saveDir.getParentFile().exists()) {
//            saveDir.getParentFile().mkdirs();
//        }
//        picture.transferTo(saveDir);

        //----------------------------------
//        String origin = picture.getOriginalFilename();
//        String newFileName = UUID.randomUUID()+origin;
//
//        File target = new File(localPath,newFileName);
//        if(!target.exists()){
//            target.mkdir();
//        }
//        picture.transferTo(target);
//        System.out.println(newFileName);
//
//        String filename=null;
//        //-----------------------
//        if(!picture.isEmpty()){
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
//            String contentType=picture.getContentType();
//            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            filename=uuid+"."+suffixName;
//            picture.transferTo(new File(localPath+filename));
//        }

        try (BufferedOutputStream out = new BufferedOutputStream(
                new FileOutputStream(
                        new File(localPath + picture.getOriginalFilename())))) {
            out.write(picture.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }

        Homewear homewear = new Homewear();
        homewear.setColor(color);
        homewear.setName(name);
        homewear.setPicture(localPath + picture.getOriginalFilename());
        homewear.setPrice(price);
        homewear.setType(type);
        homewear.setSize(size);
        service.add(homewear);


        return "redirect:/user/homewear";  // 跳转到订单页面
    }

    @ResponseBody
    @RequestMapping(value = "/updateHomewear", method = RequestMethod.POST)
    public int updateHomewear(Homewear homewear) {
        return service.update(homewear);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteHomewear", method = RequestMethod.GET)
    public int deleteHomewear(int id) {
        return service.deleteById(id);
    }

    @RequestMapping(value = "/findPageAll",method = RequestMethod.GET)
    public String findPageAll(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request, Model model){
        PageHelper.startPage(page,100);
        List<Homewear> orderList = service.findAll();
        PageInfo<Homewear> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("orderList",orderList);
        return "homewear";
    }
}
