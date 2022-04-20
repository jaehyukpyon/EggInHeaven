package com.naver.myhome4.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.naver.myhome4.domain.CategoryRecipeView;
import com.naver.myhome4.domain.CerealsCategory;
import com.naver.myhome4.domain.Details;
import com.naver.myhome4.domain.MeatCategory;
import com.naver.myhome4.domain.MilkCategory;
import com.naver.myhome4.domain.Paging;
import com.naver.myhome4.domain.Recipe;
import com.naver.myhome4.domain.RecipeCookImage;
import com.naver.myhome4.domain.RecipeMaterial;
import com.naver.myhome4.domain.RecipeSauce;
import com.naver.myhome4.domain.RecipeStep;
import com.naver.myhome4.domain.SeafoodCategory;
import com.naver.myhome4.domain.VegetableCategory;
import com.naver.myhome4.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "/view")
	public ModelAndView boardView(@RequestParam(value = "num", required = true) int recipe_num, ModelAndView modelAndView) {
		
		Recipe recipe = boardService.getDetail(recipe_num);
		List<RecipeSauce> sauces = boardService.getSauce(recipe_num); 
		List<RecipeMaterial> materials = boardService.getMaterial(recipe_num);
		
		if (sauces.size() > 0) {
			RecipeSauce sauceCommas = sauces.get(0);			
			String[] sauceNameSplits = sauceCommas.getSauce_name().split(",");
			String[] sauceAmountSplits = sauceCommas.getSauce_amount().split(",");			
			
			modelAndView.addObject("sauceNameSplits", sauceNameSplits);
			modelAndView.addObject("sauceAmountSplits", sauceAmountSplits);			
		} else {			
			modelAndView.addObject("sauceNameSplits", null);
			modelAndView.addObject("sauceAmountSplits", null);
		}
		
		if (materials.size() > 0) {
			RecipeMaterial materialCommas = materials.get(0);
			String[] materialNameSplits = materialCommas.getMaterial_name().split(",");
			String[] materialAmountSplits = materialCommas.getMaterial_amount().split(",");
			
			modelAndView.addObject("materialNameSplits", materialNameSplits);
			modelAndView.addObject("materialAmountSplits", materialAmountSplits);
		} else {
			modelAndView.addObject("materialNameSplits", null);
			modelAndView.addObject("materialAmountSplits", null);
		}		
		
		/*System.out.println(sauceNameSplits.length); // 4
		System.out.println(sauceAmountSplits.length); // 4
		System.out.println(materialNameSplits.length); // 4
		System.out.println(materialAmountSplits.length); // 4
*/		
		/*logger.info(Arrays.toString(sauceNameSplits));
		logger.info(Arrays.toString(sauceAmountSplits));
		logger.info(Arrays.toString(materialNameSplits));
		logger.info(Arrays.toString(materialAmountSplits));*/
	
		
		List<CategoryRecipeView> categories = boardService.getCategories(recipe_num);
		
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
		
		List<RecipeStep> recipeSteps = boardService.getRecipeSteps(recipe_num); 
		
		List<RecipeCookImage> cookImages = boardService.getRecipeCookImages(recipe_num);
		
		modelAndView.addObject("recipe", recipe);
		// modelAndView.addObject("sauces", sauces);
		// modelAndView.addObject("materials", materials);
		
		
		
		modelAndView.addObject("meatCategories", meatCategories);
		modelAndView.addObject("milkCategories", milkCategories);
		modelAndView.addObject("cerealsCategories", cerealsCategories);
		modelAndView.addObject("seafoodCategories", seafoodCategories);
		modelAndView.addObject("vegetableCategories", vegetableCategories);
		
		modelAndView.addObject("recipeSteps", recipeSteps);
		
		modelAndView.addObject("cookImages", cookImages);
		System.out.println("cookImages 길이: " + cookImages.size());
		
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
	
	@GetMapping("/list")
	public String list(Details det, Model model) {
		logger.info("list: {}", det);
		int totalListCount = boardService.getTotalCount(det);
		
		String order = det.getOrder();		
		
		if (order == null || order.equals("") || order.equals("latest")) {
			logger.info("newest order...");
			model.addAttribute("list", boardService.getListWithPaging(det));
		} else if (order.equals("bestest")) {
			logger.info("bestest order...");
			model.addAttribute("list", boardService.getListWithPagingBestest(det));
		}	
		
		model.addAttribute("pageMaker", new Paging(det, totalListCount));
		model.addAttribute("totalListCount", totalListCount);
		
		return "board/board_list";
	}
	
}
