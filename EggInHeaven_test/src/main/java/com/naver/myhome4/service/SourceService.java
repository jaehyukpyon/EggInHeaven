package com.naver.myhome4.service;


import com.naver.myhome4.domain.Source;

public interface SourceService {

	//양념등록
	public abstract void insertSource(Source source);
	
	//양념 수정
	public abstract int sourceModify(Source modifymaterial);
			
	//양념 삭제
	public abstract int sourceDelete(int source_num);
			
	//양념 내용 보기
	public abstract Source getDetail(int source_num); 

}
