package com.heabom.member.model.service;

import java.sql.Connection;

import static com.heabom.common.JDBCTemplate.*;

import com.heabom.member.model.dao.ReviewReplyDao;
import com.heabom.member.model.vo.ReviewReply;

public class ReviewReplyService {
	public ReviewReply selectReviewReply(String memNo) {
		Connection conn = getConnection();
		ReviewReply re = new ReviewReplyDao().selectReviewReply(conn, memNo);
		close(conn);
		return re;
	}

}
