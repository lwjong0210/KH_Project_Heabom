package com.heabom.board.model.service;

import java.net.ConnectException;
import java.sql.Connection;

import com.heabom.board.model.vo.Answer;
import static com.heabom.common.JDBCTemplate.*;

public class AnswerService {
	public Answer selectAnswer(Answer memNo) {
		Connection conn = getConnection();
		
	}
}
