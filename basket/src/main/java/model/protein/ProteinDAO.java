package model.protein;

import java.util.ArrayList;

public class ProteinDAO {
	ArrayList<ProteinVO> datas;

	public ProteinDAO() {
		datas = new ArrayList<ProteinVO>();
		datas.add(new ProteinVO("¹ÎÆ®ÃÊÄÚ¸À",10000));
		datas.add(new ProteinVO("ÃÊÄÚÄÉÀÌÅ©¸À",20000));
		datas.add(new ProteinVO("µş±â¸À",30000));
	}
	public int select(String name) {
		for(ProteinVO v:datas) {
			if(v.getName().equals(name)) {
				return v.getPrice();
			}
		}
		return 0;
	}
}
