package com.javaex.dao;

import java.util.List;

import com.javaex.vo.QuestionVo;

public interface QuestionDao {
	public int insert(QuestionVo vo);//등록 
	public int delete(int qNo);//삭제 -- qavail 사용
	public int getListCount(int proNo);//리스트 갯수
	public List<QuestionVo> getList (int page, int limit, int proNo);//리스트
	
}
