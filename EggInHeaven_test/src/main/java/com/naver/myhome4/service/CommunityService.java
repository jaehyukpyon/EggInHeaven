package com.naver.myhome4.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.naver.myhome4.domain.Community;


public interface CommunityService {

	// 글의 갯수 구하기
	int getListCount(String index, String search_word);

	// 글 목록 보기
	public List<Community> getCommuList(String index, String search_word, int page, int limit);

	// 글 등록하기
	public void insertCommunity(Community community);

	// 조회수 업데이트
	public int setReadCountUpdate(int num);

	// 글 내용 보기
	public Community getDetail(int num);
	
	// 내가 쓴 글 목록 보기
	public List<Community> getMyCommuList(int page, int limit);

	//내가 쓴 글의 갯수 구하기
	int getMyListCount();
	
	// 글 수정
	public int communityModify(Community modifyboard);
		
	// 글 삭제
	public int communityDelete(int num);
		
	//글쓴이인지 확인
	public boolean isCommunityWriter(int num, String pass);
	
	public List<String> getDeleteFileList();

	public void deleteFileList(String filename);



}
