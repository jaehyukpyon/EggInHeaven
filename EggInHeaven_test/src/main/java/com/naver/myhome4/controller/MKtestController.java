package com.naver.myhome4.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.myhome4.domain.MkView;
import com.naver.myhome4.service.MkService;

@Controller
@RequestMapping(value = "test")
public class MKtestController {

   @Autowired
   private MkService mkService;
   
   @RequestMapping(value = "detailSearchList")
   public String recipe(Model model) {
      List<MkView> a = mkService.all();                  
      model.addAttribute("all",a);
      return "mk/detalSearchList";
   }

   @RequestMapping(value = "4", method = { RequestMethod.GET })
   public String recipe2(HttpServletRequest request, HttpServletResponse response, Model model, 
                    @RequestParam(value = "time") int time,@RequestParam(value = "val") String val) 
   {
      String id[] = request.getParameterValues("id");
      String name2[] = request.getParameterValues("name");
      
      List<MkView> a = mkService.search(val , time);
      List<MkView> b = mkService.all();   
         
      int result = 0;
      if(a.size() != 0) {
         model.addAttribute("search",a);
         result = 1;
      }else {
         model.addAttribute("all",b);
         result = 0;
      }

      model.addAttribute("result",result);
      model.addAttribute("id",id);
      model.addAttribute("name",name2);
      model.addAttribute("time",time);
      return "mk/detalSearchList";
   }

   @RequestMapping(value = "3")
   public String searchTest() {
      return "mk/detailSearch";
   }
   

}