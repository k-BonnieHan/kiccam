package pack;

import java.util.List;

public class Main {

	public static void main(String[] args) {
		ProcessDao dao = ProcessDao.getInstance();

		try {
			//상품 추가
		/*	SangpumDto insdto = new SangpumDto();
			insdto.setCode("7");
			insdto.setSang("오징스");
			insdto.setSu("10");
			insdto.setDan("65000");
			dao.insData(insdto); */
			
			//상품 수정
			/*SangpumDto updto = new SangpumDto();
			updto.setCode("7");
			updto.setSang("바나나우융");
			dao.upData(updto);
			*/
			
			//상품 삭제
			/*boolean b = dao.delData(6);
			if(b) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}*/
			
			System.out.println("-------");
			// 상품 자료 전체 읽기
			List<SangpumDto> list = dao.selectAll();
			for (SangpumDto s : list) {
				System.out.println(s.getCode() + " " + 
									s.getSang() + " " + 
									s.getSu() + " " + 
									s.getDan());
			}
			
			System.out.println("-----------");
			// 상품 부분자료 읽기
			SangpumDto dto = dao.selectDataPart("2");
			System.out.println(dto.getCode() + " " + 
								dto.getSang() + " " + 
								dto.getSu() + " " + 
								dto.getDan());

		} catch (Exception e) {
			System.out.println("err: " + e);
		}

	}

}
