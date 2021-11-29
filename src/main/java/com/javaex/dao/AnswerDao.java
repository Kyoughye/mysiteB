package com.javaex.dao;

import java.util.List;

import com.javaex.vo.AnswerVo;


public interface AnswerDao {
	public int insert(AnswerVo vo);//등록 
	public int delete(int aNo);//삭제 -- update로 avail 변경
	public List<AnswerVo> getList (int page, int limit, int qNo);//<<리스트>>
	public int getListCount(int aNo);//리스트 갯수
	//public int admincheck();//관리자인지 확인
}
