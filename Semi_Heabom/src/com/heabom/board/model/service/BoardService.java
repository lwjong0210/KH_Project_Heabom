package com.heabom.board.model.service;

import static com.heabom.common.JDBCTemplate.close;
import static com.heabom.common.JDBCTemplate.commit;
import static com.heabom.common.JDBCTemplate.getConnection;
import static com.heabom.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.heabom.board.model.dao.BoardDao;
import com.heabom.board.model.vo.Board;
import com.heabom.board.model.vo.PrevNextPage;
import com.heabom.board.model.vo.Reply;
import com.heabom.common.model.vo.File;
import com.heabom.common.model.vo.HashTag;
import com.heabom.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	public int selectKeyWordCount(String keyWord) {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectKeyWordCount(conn, keyWord);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		
		System.out.println(pi.getBoardLimit());
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		return list;
	}
	public ArrayList<Board> selectList(PageInfo pi,String keyWord){
		
		System.out.println(pi.getBoardLimit());
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi, keyWord);
		
		close(conn);
		return list;
	}
	
//	public int countReply(String boardNo) {
//		Connection conn = getConnection();
//		
//		int countReply = new BoardDao().countReply(conn, boardNo);
//		close(conn);
//		return countReply;
//		
//	}
	
//	public int insertBoard(Board b) {
//		
//		Connection conn = getConnection();
//		
//		int result1 = new BoardDao().insertBoard(conn, b);
//		
//	
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//	}
//	public int insertBoard(Board b, ArrayList<File> list) {
//		
//		Connection conn = getConnection();
//		
//		int result1 = new BoardDao().insertBoard(conn, b);
//		int result2 = new BoardDao().insertAttachment(conn, list);
//		
//		if(result1 > 0 && result2>0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result1 * result2;
//	}
	public int insertBoard(Board b, ArrayList<File> list) {
		Connection conn = getConnection();
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = 1;
		if(!list.isEmpty()) {
			result2 = new BoardDao().insertFile(conn, list, b);
		}
		if(result1 * result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}
	
	public String returnBoardNo() {
		Connection conn = getConnection();
		
		String returnBoardNo = new BoardDao().returnBoardNo(conn);
		
		close(conn);
		
		return returnBoardNo;
	}
	
	public int insertHash(HashTag ht) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertHash(conn, ht);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	public int updateHash(HashTag ht) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateHash(conn, ht);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int increaseCount(String bno) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Board selectBoard(String bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		return b;
	}
	
	public ArrayList<File> selectFileList(String bno) {
		Connection conn = getConnection();
	 	ArrayList<File> list = new BoardDao().selectFileList(conn, bno);
	 	
	 	close(conn);
	 	
	 	return list;
		
	}
	
	public ArrayList<Reply> selectReplyList(String boardNo){
		
		Connection conn = getConnection();
		
		ArrayList<Reply> rlist = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return rlist;
	}
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
//	public int minBo() {
//		Connection conn = getConnection();
//		
//		int minBo = new BoardDao().minBo(conn);
//		
//		close(conn);
//		return minBo;
//	}
//	
//	public int maxBo() {
//		Connection conn = getConnection();
//		
//		int maxBo = new BoardDao().maxBo(conn);
//		close(conn);
//		return maxBo;
//	}
	
	public PrevNextPage prevNextBo(int bno) {
		
		Connection conn = getConnection();
		
		PrevNextPage p = new BoardDao().prevNextBo(conn, bno);
		
		close(conn);
		return p;
	}
	
	public ArrayList<Board> selectAllList(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllList(conn);
	
		close(conn);
		return list;
	}
	
	public int deleteBoard(String BoardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteBoard(conn, BoardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Board> myBoardSelect(String memNo){
		Connection conn = getConnection();
		ArrayList<Board> blist = new BoardDao().myBoardSelect(conn, memNo);
		close(conn);
		return blist;
	}
	
	public ArrayList<File> selectAttachmentList(String boardNo) {
		Connection conn = getConnection();
		ArrayList<File> list = new BoardDao().selectAttachmentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public HashTag selectHashTag(String boardNo) {
		Connection conn = getConnection();
		HashTag htag = new BoardDao().selectHashTag(conn, boardNo);
		close(conn);
		return htag;
		
	}
	
	public int updateBoard(Board b, ArrayList<File> list) {
		Connection conn = getConnection();
		int result1 = new BoardDao().updateBoard(conn, b);
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = new BoardDao().insertFile(conn, list, b);
		}
		
		if(result1*result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
		
	}
	
	public int deleteReply(String rpNo) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteReply(conn, rpNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int updateFile(File f) {
		Connection conn = getConnection();
		int result = new BoardDao().updateFile(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateFileStatus(File f) {
		Connection conn = getConnection();
		int result = new BoardDao().updateFileStatus(conn,f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertFile2(File f, String boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().insertFile2(conn, f,boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int replyLikeUp(String rpno,String writer) {
		Connection conn = getConnection();
		int result = new BoardDao().replyLikeUp(conn,rpno,writer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int replyLikeDown(String rpno,String writer) {
		Connection conn = getConnection();
		int result = new BoardDao().replyLikeDown(conn,rpno,writer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
//	public File selectFile(String fileNo) {
//		Connection conn = getConnection();
//		File f = new BoardDao().selectFile(conn, fileNo);
//		
//		close(conn);
//		return f;
//	}
	
	
	public int replyLikeCount(String rpno) {
		Connection conn = getConnection();
		int replyCount = new BoardDao().replyLikeCount(conn, rpno);
		
		int updateReplyCount =  new BoardDao().updateReplyCount(conn, rpno);
		
		close(conn);
		return replyCount;
	}
	
//	public int updateLike(String loginMem,String rpno) {
//		Connection conn = getConnection();
//		int result = new BoardDao().updateLike(conn,loginMem,rpno);
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//		
//	}
//	public int deleteLike(String loginMem,String rpno) {
//		Connection conn = getConnection();
//		int result = new BoardDao().deleteLike(conn,loginMem,rpno);
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//		
//	}
	
	public ArrayList selectLikeList(String mno) {
		Connection conn = getConnection();
		ArrayList lList = new BoardDao().selectLikeList(conn, mno);
		close(conn);
		return lList;
		
	}
	
	
	

	
}
