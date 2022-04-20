package com.naver.myhome4.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome4.domain.Category;
import com.naver.myhome4.domain.Cookimg;
import com.naver.myhome4.domain.Material;
import com.naver.myhome4.domain.Recipe;
import com.naver.myhome4.domain.Sauce;
import com.naver.myhome4.domain.Step;
import com.naver.myhome4.domain.Stepsavefolder;
import com.naver.myhome4.domain.Cooksavefolder;
import com.naver.myhome4.service.CategoryService;
import com.naver.myhome4.service.CookimgService;
import com.naver.myhome4.service.MaterialService;
import com.naver.myhome4.service.RecipeService;
import com.naver.myhome4.service.SauceService;
import com.naver.myhome4.service.StepService;

@Controller
@RequestMapping(value="/recipe")
public class RecipeController {

   private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
   
   /**
    * @uml.property  name="recipeService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  RecipeService recipeService;
   
   /**
    * @uml.property  name="categoryService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  CategoryService categoryService;
   
   /**
    * @uml.property  name="materialService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  MaterialService materialService;
   
   /**
    * @uml.property  name="sauceService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  SauceService sauceService;
   
   /**
    * @uml.property  name="stepService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  StepService stepService;
   
   /**
    * @uml.property  name="cookimgService"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private  CookimgService cookimgService;
   
   /**
    * @uml.property  name="stepsavefolder"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired 
   private Stepsavefolder stepsavefolder;
   
   /**
    * @uml.property  name="cooksavefolder"
    * @uml.associationEnd  readOnly="true"
    */
   @Autowired
   private Cooksavefolder cooksavefolder;
   
   @GetMapping(value="/write")
   
   //public String recipe(HttpSession session) {
   //session.setAttribute("id", "admin");
   public String recipe(Principal userPrincipal, Model model) {
      model.addAttribute("id", userPrincipal.getName());
      return "recipe/recipe";
   }
   
   @RequestMapping(value="/add_1",method= {RequestMethod.POST})
   public String add_1(Recipe recipe,Category category,Material material,
         Sauce sauce, Step step,Cookimg cookimg,
         HttpServletRequest request) throws Exception {
         
      recipeService.insertRecipe(recipe);
          int recipe_num = recipe.getRecipe_num();
          category.setRecipe_num(recipe_num);
          categoryService.insertCategory(category);
         
          
           material.setRecipe_num(recipe_num);
           materialService.insertMaterial(material);
           
           sauce.setRecipe_num(recipe_num);
         sauceService.insertSauce(sauce);
              
       MultipartFile[] uploadfiles = step.getUploadfile();
       logger.info("step length=" + uploadfiles.length);
       String[] step_db=new String[step.getStep_content().length];
       String[] step_original=new String[step.getStep_content().length];
       int index=0;
       for(MultipartFile multi: uploadfiles) {
          
          if (!multi.isEmpty()) {
             String fileName = multi.getOriginalFilename();//원래 파일명
             step_original[index] = fileName;
             //변경
             String saveFolder = stepsavefolder.getStepsavefolder();
             
             String fileDBName = fileDBName(fileName, saveFolder);//파일이름 중복 방지위해 변경
             logger.info("fileDBName1 = " + fileDBName);
             
             // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
             multi.transferTo(new File(saveFolder + fileDBName));
             logger.info("fileDBName = " + saveFolder + fileDBName);
             // 바뀐 파일명으로 저장
             step_db[index++] = fileDBName; 
          }
       }
         step.setRecipe_num(recipe_num);
         step.setStep_db(step_db);
         step.setStep_original(step_original);
         stepService.insertStep(step); // 저장메서드 호출
         
         
         MultipartFile[] cook_uploadfiles = cookimg.getCook_uploadfile();
         int length = cook_uploadfiles.length;
          logger.info("cookimg length=" + cook_uploadfiles.length);
          String[] cook_db=new String[length];
          String[] cook_original=new String[length];
          index=0;
          for(MultipartFile multi: cook_uploadfiles) {
             
             if (!multi.isEmpty()) {
                String fileName2 = multi.getOriginalFilename();//원래 파일명
                cook_original[index] = fileName2;
                //변경
                String saveFolder2 = cooksavefolder.getCooksavefolder();
                
                String fileDBName2 = fileDBName2(fileName2, saveFolder2);//파일이름 중복 방지위해 변경
                logger.info("fileDBName1 = " + fileDBName2);
                
                // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
                multi.transferTo(new File(saveFolder2 + fileDBName2));
                logger.info("fileDBName = " + saveFolder2 + fileDBName2);
                // 바뀐 파일명으로 저장
                cook_db[index++] = fileDBName2; 
             }
          }
          
          cookimg.setCook_db(cook_db);
           cookimg.setCook_original(cook_original);
           cookimg.setRecipe_num(recipe_num);
           cookimgService.insertCookimg(cookimg,index); // 저장메서드 호출
         
         
         return "redirect:/board/list";
      }
   private String fileDBName(String fileName, String saveFolder) {
      // 새로운 폴더 명: 오늘 년+월+일
      Calendar c = Calendar.getInstance();
      int year = c.get(Calendar.YEAR);
      int month = c.get(Calendar.MONTH) + 1;
      int date = c.get(Calendar.DATE);
      
      String homedir = saveFolder + year + "-" + month + "-" + date;
      logger.info("homedir: " + homedir);
      
      File path1 = new File(homedir);
      if (!path1.exists()) {
         path1.mkdir();
      }
      
      Random r = new Random(System.currentTimeMillis());
      int random = r.nextInt(2_000);
      
      int index = fileName.lastIndexOf(".");
      String fileExtension = fileName.substring(index + 1);
      logger.info("fileExtension: " + fileExtension);
      
      String refileName = "Step" + year + month + date + random + "." + fileExtension;
      logger.info("refileName5: " + refileName);
      
      // DB에 저장될 파일 명
      // String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
      String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
      logger.info("fileDBName6: " + fileDBName);
      
      return fileDBName;   
   }
   private String fileDBName2(String fileName2, String saveFolder1) {
      // 새로운 폴더 명: 오늘 년+월+일
      Calendar c = Calendar.getInstance();
      int year = c.get(Calendar.YEAR);
      int month = c.get(Calendar.MONTH) + 1;
      int date = c.get(Calendar.DATE);
      
      String homedir = saveFolder1 + year + "-" + month + "-" + date;
      logger.info("homedir: " + homedir);
      
      File path1 = new File(homedir);
      if (!path1.exists()) {
         path1.mkdir();
      }
      
      Random r = new Random(System.currentTimeMillis());
      int random = r.nextInt(2_000_000_000);
      
      int index = fileName2.lastIndexOf(".");
      String fileExtension = fileName2.substring(index + 1);
      logger.info("fileExtension: " + fileExtension);
      
      String refileName = "Cook" + year + month + date + random + "." + fileExtension;
      logger.info("refileName5: " + refileName);
      
      // DB에 저장될 파일 명
      // String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
      String fileDBName2 = "/" + year + "-" + month + "-" + date + "/"+ refileName;
      logger.info("fileDBName6: " + fileDBName2);
      
      return fileDBName2;   
   }
@GetMapping(value="/modify_action")
   
   public ModelAndView recipe_modify(int num, ModelAndView mv, HttpServletRequest request) {
      Recipe recipe = recipeService.getDetail(num);
      List<Map<String, Object>> category  = categoryService.getDetail(num);
      Map<String, Object> material = materialService.getDetail(num);
      Map<String, Object> sauce = sauceService.getDetail(num);
      List<Map<String, Object>> step = stepService.getDetail(num);
      List<Map<String, Object>> cookimg=cookimgService.getDetail(num);
      if (recipe == null) {
         logger.info("해당 글 상세정보 로드 실패...");
         mv.setViewName("error/error");
         mv.addObject("url", request.getRequestURL());
         mv.addObject("message", "게시글 수정 페이지 로드 실패");
         return mv;
      }
      logger.info("해당 글 상세정보 로드 성공...");
      
      /*
       * 수정 폼 페이지 이동 시 원문 글 내용을 보여주기 때문에 boarddata 객체를 ModelAndView 객체에 저장
       */
      //레시피작성
      mv.addObject("recipe", recipe);
      
      //카테고리
      String c_r="";
      for(Map<String, Object> map:category) {
         c_r += map.get("CATEGORY_NUM")+",";
      }
      logger.info(c_r);
      mv.addObject("category", c_r);
      
      //재료
      List<Map<String, Object>> materiallist = new ArrayList<>();
      String[] material_name = material.get("MATERIAL_NAME").toString().split(",");
      String[] material_amount = material.get("MATERIAL_AMOUNT").toString().split(",");
      int length_m=material_name.length;
      for(int i=0;i<length_m;i++) {
         Map<String, Object> map2=new HashMap<String, Object>();
         map2.put("material_name", material_name[i]);
         map2.put("material_amount", material_amount[i]);
         materiallist.add(map2);
      }
      mv.addObject("material",materiallist);
      
      //양념
      List<Map<String, Object>> saucelist = new ArrayList<>();
      String[] sauce_name = sauce.get("SAUCE_NAME").toString().split(",");
      String[] sauce_amount = sauce.get("SAUCE_AMOUNT").toString().split(",");
      int length=sauce_name.length;
      for(int i=0;i<length;i++) {
         Map<String, Object> map1=new HashMap<String, Object>();
         map1.put("sauce_name", sauce_name[i]);
         map1.put("sauce_amount", sauce_amount[i]);
         saucelist.add(map1);
      }
      
      mv.addObject("sauce",saucelist);
      mv.addObject("step",step);
      mv.addObject("cookimg",cookimg);
      

      mv.setViewName("recipe/recipe_modify");
      
      return mv;
   }
   @PostMapping(value="/modify_action")
   public String recipemodify(Recipe recipe,Category category,Material material,
         Sauce sauce, Step step,Cookimg cookimg,String check,
         Model mv,RedirectAttributes rattr,HttpServletRequest request) throws Exception {
      String url="";
      //레시피
      int result = recipeService.recipeModify(recipe);
      int recipe_num = recipe.getRecipe_num();
      if (result == 0) {
         logger.info("게시판 수정 실패");
         mv.addAttribute("url", request.getRequestURL());
         mv.addAttribute("message", "게시판 수정 실패");
         url="error/error";
      }else {
         logger.info("게시판 수정 완료");
         // 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기위해 경로를 설정합니다.
         url =  "redirect:modify_action";
         rattr.addAttribute("num", recipe_num);
      }
      int result1 = materialService.materialModify(material);
      if (result1 == 0) {
         logger.info("게시판 수정 실패");
         mv.addAttribute("url", request.getRequestURL());
         mv.addAttribute("message", "게시판 수정 실패");
         url="error/error";
      }else {
         logger.info("게시판 수정 완료");
         // 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기위해 경로를 설정합니다.
         url =  "redirect:modify_action";
         rattr.addAttribute("num", recipe_num);
      }
      //재료
      int result2 = sauceService.sauceModify(sauce);
      if (result2 == 0) {
         logger.info("게시판 수정 실패");
         mv.addAttribute("url", request.getRequestURL());
         mv.addAttribute("message", "게시판 수정 실패");
         url="error/error";
      }else {
         logger.info("게시판 수정 완료");
         // 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기위해 경로를 설정합니다.
         url =  "redirect:/board/view";
         rattr.addAttribute("num", recipe_num);
      }
      
      //카테고리
      categoryService.categoryModify(category);
      
      //요리순서
      MultipartFile[] uploadfiles = step.getUploadfileAll();
       logger.info("step length=" + uploadfiles.length);
      String[] step_content=step.getStep_content();
      String[] step_db=new String[5];
       String[] step_original=new String[5];
       for(int index=0; index<step_content.length; index ++) {
             MultipartFile  multi = uploadfiles[index];
             if (multi!=null && !multi.isEmpty()) {
                String fileName = multi.getOriginalFilename();//원래 파일명
                step_original[index] = fileName;
                //변경
                String saveFolder = stepsavefolder.getStepsavefolder();
                
                String fileDBName = fileDBName(fileName, saveFolder);//파일이름 중복 방지위해 변경
                logger.info("fileDBName1 = " + fileDBName);
                
                // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
                multi.transferTo(new File(saveFolder + fileDBName));
                logger.info("fileDBName = " + saveFolder + fileDBName);
                // 바뀐 파일명으로 저장
                step_db[index] = fileDBName; 
             }else {
                step_original[index]=step.getStep_original()[index];
               step_db[index] = step.getStep_db()[index];
             }
          
          
       }
         step.setRecipe_num(recipe_num);
         step.setStep_db(step_db);
         step.setStep_original(step_original);
         stepService.stepModify(step); // 저장메서드 호출
         
         //요리완성
         MultipartFile[] cook_uploadfiles = cookimg.getUploadfileAll2();
         int length = cookimg.getCook_db().length;
          logger.info("cookimg length=" + cook_uploadfiles.length);
         String[] cook_db=new String[4];
          String[] cook_original=new String[4];
          for(int index=0; index<length; index ++) {
                MultipartFile  multi = cook_uploadfiles[index];
                if (multi!=null && !multi.isEmpty()) {
                   String fileName = multi.getOriginalFilename();//원래 파일명
                   cook_original[index] = fileName;
                   //변경
                   String saveFolder = cooksavefolder.getCooksavefolder();
                   
                   String fileDBName = fileDBName(fileName, saveFolder);//파일이름 중복 방지위해 변경
                   logger.info("fileDBName1 = " + fileDBName);
                   
                   // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
                   multi.transferTo(new File(saveFolder + fileDBName));
                   logger.info("fileDBName = " + saveFolder + fileDBName);
                   // 바뀐 파일명으로 저장
                   cook_db[index] = fileDBName; 
                }else {
                   cook_original[index]=cookimg.getCook_original()[index];
                  cook_db[index] = cookimg.getCook_db()[index];
                }
          }
          
          cookimg.setCook_db(cook_db);
           cookimg.setCook_original(cook_original);
           cookimg.setRecipe_num(recipe_num);
           cookimgService.cookModify(cookimg, length); // 저장메서드 호출
      
      return url;
   }
   
}