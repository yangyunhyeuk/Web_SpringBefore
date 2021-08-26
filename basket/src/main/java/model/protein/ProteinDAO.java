package model.protein;

import java.util.ArrayList;

public class ProteinDAO {
	ArrayList<ProteinVO> datas;

	public ProteinDAO() {
		datas = new ArrayList<ProteinVO>();
		datas.add(new ProteinVO("��Ʈ���ڸ�",10000));
		datas.add(new ProteinVO("��������ũ��",20000));
		datas.add(new ProteinVO("�����",30000));
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
