package com.naver.myhome4.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome4.domain.CategoryRecipeView;
import com.naver.myhome4.domain.CerealsCategory;
import com.naver.myhome4.domain.Material;
import com.naver.myhome4.domain.MeatCategory;
import com.naver.myhome4.domain.MilkCategory;
import com.naver.myhome4.domain.MySaveFolder;
import com.naver.myhome4.domain.Recipe;
import com.naver.myhome4.domain.Sauce;
import com.naver.myhome4.domain.SeafoodCategory;
import com.naver.myhome4.domain.VegetableCategory;
import com.naver.myhome4.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MySaveFolder mysavefolder;
	
	@RequestMapping("/list")
	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		mv.setViewName("board/board_list");
		
		return mv;
	}
	
	@RequestMapping(value = "/view_test")
	public ModelAndView boardViewTest(ModelAndView mv) {
		mv.setViewName("board/board_view_test");
		
		return mv;
	}
	
	@GetMapping(value = "/view")
	public ModelAndView boardView(@RequestParam(value = "num", required = true) int num, ModelAndView modelAndView) {
		
		Recipe recipe = boardService.getDetail(num);
		List<Sauce> sauces = boardService.getSauce(num); 
		List<Material> materials = boardService.getMaterial(num);
		
		List<CategoryRecipeView> categories = boardService.getCategories(num);
		
		List<MeatCategory> meatCategories = new ArrayList<>();
		List<MilkCategory> milkCategories = new ArrayList<>();
		List<CerealsCategory> cerealsCategories = new ArrayList<>();
		List<SeafoodCategory> seafoodCategories = new ArrayList<>();
		List<VegetableCategory> vegetableCategories = new ArrayList<>();
		
		for (CategoryRecipeView c : categories) {
			if (c.getCategory() == 1) {
				meatCategories.add(new MeatCategory(c.getMatall_name()));
			} else if (c.getCategory() == 2) {
				seafoodCategories.add(new SeafoodCategory(c.getMatall_name()));
			} else if (c.getCategory() == 3) {
				vegetableCategories.add(new VegetableCategory(c.getMatall_name()));
			} else if (c.getCategory() == 4) {
				milkCategories.add(new MilkCategory(c.getMatall_name()));
			} else if (c.getCategory() == 5) {
				cerealsCategories.add(new CerealsCategory(c.getMatall_name()));
			}
		}
		
		modelAndView.addObject("recipe", recipe);
		modelAndView.addObject("sauces", sauces);
		modelAndView.addObject("materials", materials);
		
		modelAndView.addObject("meatCategories", meatCategories);
		modelAndView.addObject("milkCategories", milkCategories);
		modelAndView.addObject("cerealsCategories", cerealsCategories);
		modelAndView.addObject("seafoodCategories", seafoodCategories);
		modelAndView.addObject("vegetableCategories", vegetableCategories);
		
		modelAndView.setViewName("board/board_view");		
		return modelAndView;
	}
	
	@GetMapping(value = "/isAddedToLikeListTable")
	@ResponseBody
	public int isAddedToLikeListTable(@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		return boardService.isAddedToLikeListTable(member_id, recipe_num);
	}
	
	@GetMapping(value = "/removeFromLikeListTable")
	@ResponseBody
	public int removeFromLikeListTable(@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		return boardService.removeFromLikeListTable(member_id, recipe_num);
	}
	
	@GetMapping(value = "/addToLikeListTable")
	@ResponseBody
	public int addToLikeListTable(@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		return boardService.addToLikeListTable(member_id, recipe_num);
	}
	
	
	@GetMapping(value = "/isBested")
	@ResponseBody
	public int isBested(@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		return boardService.isBested(member_id, recipe_num);
	}
	
	@GetMapping(value = "/removeFromBestListTable")
	@ResponseBody
	public int removeFromBestListTable (@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		boardService.removeFromBestListTable(member_id, recipe_num);
		return boardService.getRecipeBestCount(recipe_num);
	}
	
	@GetMapping(value = "/addToBestListTable")
	@ResponseBody
	public int addToBestListTable (@RequestParam(value = "member_id") String member_id, @RequestParam(value = "recipe_num") int recipe_num) {
		boardService.addToBestListTable(member_id, recipe_num);
		return boardService.getRecipeBestCount(recipe_num);
	}
	
}
