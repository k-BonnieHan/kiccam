package pack.business;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface SqlMapperInter {
	@Select("select jikwon_no, jikwon_name, buser_name, jikwon_jik from jikwon inner join buser on buser_num=buser_no")
	public List<JikwonDto> selectDataAll();
	
	@Select("select gogek_no, gogek_name, gogek_tel from gogek where gogek_damsano=#{jikwon_no}")
	public List<GogekDto> selectGogek(String no);
	
	@Select("select count(*) count from gogek where gogek_damsano=#{jikwon_no}")
	public String selCount(String no);
}
