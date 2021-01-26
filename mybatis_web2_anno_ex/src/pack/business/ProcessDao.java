package pack.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//직원 테이블 전체 불러오기
	public List<JikwonDto> selectDataAll(){
		SqlSession sqlSession = factory.openSession();
		
		List<JikwonDto> list = null;
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.selectDataAll();
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	public List<GogekDto> selectGogek(String no){
		SqlSession sqlSession = factory.openSession();
		List<GogekDto> list = null;
		
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			list = inter.selectGogek(no);
		} catch (Exception e) {
			System.out.println("selectGogek err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	public String selCount(String no) {
		SqlSession sqlSession = factory.openSession();
		String str = "";
		
		try {
			SqlMapperInter inter = (SqlMapperInter)sqlSession.getMapper(SqlMapperInter.class);
			str = inter.selCount(no);
		} catch (Exception e) {
			System.out.println("selCount err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return str;
	}
}
