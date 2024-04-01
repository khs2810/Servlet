package com.kh.board.service;


import java.sql.Connection;

import com.kh.board.model.dao.BoardDao;

import static com.kh.common.JDBCTemplate.*;
public class BoardService {

	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
}