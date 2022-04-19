package com.naver.myhome4.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Community;

public interface CommuMapper {


	// 글 등록하기
	public void insertCommunity(Community community);
		
	// 조회수 업데이트
	public int setReadCountUpdate(int num);

	// 글 내용 보기
	public Community getDetail(int num);

	// 내가 쓴 글 목록 보기
	public List<Community> getMyCommuList(HashMap<String, Object> map);

	//내가 쓴 글의 갯수 구하기
	public int getMyListCount(String id);

	//글 수정하기
	public int communityModify(Community modifyboard);

	//글 삭제
	public int communityDelete(Community community);

	//글쓴이인지 확인
	public Community isCommunityWriter(HashMap<String, Object> map);

	//파일삭제 리스트
	public List<String> getDeleteFileList();

	public void deleteFileList(String filename);

	// 글의 갯수 구하기
	public int getListCount(Map<String, Object> map);

	// 글 목록
	public List<Community> getCommuList(Map<String, Object> map);
	

	
}
