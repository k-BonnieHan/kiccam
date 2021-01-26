package pack.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDaoTest {
	private static ProcessDaoTest daoTest = new ProcessDaoTest();

	public static ProcessDaoTest getInstance() {
		return daoTest;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List selectAll() throws SQLException {
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDataAll");
		sqlSession.close();
		return list;
	}
	
	public List selectByJik() throws SQLException {
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectByJik");
		sqlSession.close();
		return list;
	}
}
