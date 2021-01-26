package pack.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private static ProcessDao dao = new ProcessDao();

	public static ProcessDao getInstance() {
		return dao;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List selectAll() throws SQLException {
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDataAll");
		sqlSession.close();
		return list;
	}

	public SangpumDto selectDataPart(String arg) throws SQLException {
		SqlSession sqlSession = factory.openSession();
		SangpumDto dto = sqlSession.selectOne("selectDataById",arg); 
		sqlSession.close();
		return dto;
	}
	
	public void insData(SangpumDto dto) throws SQLException{
		//SqlSession sqlSession = factory.openSession(); //수동 transaction이라 commit필요
		SqlSession sqlSession = factory.openSession(true); //자동 transaction
		sqlSession.insert("insertData", dto);
		//sqlSession.commit();
		sqlSession.close();
	}
	
	public void upData(SangpumDto  dto) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("updateData", dto);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public boolean delData(int arg) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int cou = sqlSession.delete("deleteData", arg);
			if(cou > 0) b=true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("delData err: " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		} return b;
	}
}
