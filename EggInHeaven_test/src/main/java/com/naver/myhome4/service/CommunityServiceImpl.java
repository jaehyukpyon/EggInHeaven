package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Community;

@Service
public class CommunityServiceImpl implements CommunityService {
	private static final Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);
	@Autowired
	private com.naver.myhome4.mybatis.mapper.CommuMapper dao;
	// private BoardDAO dao;

	@Override
	public int getListCount(String index, String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!index.equals("")) {
			String[] search_field = index.split("");
			logger.info("search_field.length:" + search_field.length);
			for (int i = 0; i < search_field.length; i++) {
				logger.info(search_field[i]);
			}
			map.put("search_field", search_field);
			map.put("search_word", "%" + search_word + "%");
		}
		return dao.getListCount(map);
	}

	@Override
	public List<Community> getCommuList(String index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!index.equals("")) {
			String[] search_field = index.split("");
			logger.info("search_field.length:" + search_field.length);
			for (int i = 0; i < search_field.length; i++) {
				logger.info(search_field[i]);
			}
			map.put("search_field", search_field);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommuList(map);
	}

	@Override
	public void insertCommunity(Community community) {
		dao.insertCommunity(community);

	}

	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}

	@Override
	public Community getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public List<Community> getMyCommuList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getMyCommuList(map);
	}

	@Override
	public int getMyListCount() {
		return dao.getMyListCount();
	}

	@Override
	public int communityModify(Community modifyboard) {
		return dao.communityModify(modifyboard);
	}

	@Override
	public int communityDelete(int num) {
		int result = 0;
		Community community = dao.getDetail(num);
		if (community != null) {
			result = dao.communityDelete(community);
		}
		return result;
	}

	@Override
	public boolean isCommunityWriter(int num, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("pass", pass);
		Community result = dao.isCommunityWriter(map);
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public List<String> getDeleteFileList() {
		return dao.getDeleteFileList();
	}

	@Override
	public void deleteFileList(String filename) {
		dao.deleteFileList(filename);

	}

}
