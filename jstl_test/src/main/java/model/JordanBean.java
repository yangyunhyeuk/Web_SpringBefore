package model;

public class JordanBean {
	private String[] dataList = { "jordan1 10만원", "jordan2 20만원", "jordan3 30만원" };
	private int[] priceList = { 100000, 200000, 300000};
	private int[] cntList = { 1,2,3,4,5 };


	public String[] getDataList() {
		return dataList;
	}


	public int[] getPriceList() {
		return priceList;
	}


	public int[] getCntList() {
		return cntList;
	}

	public int Calc(String name,int cnt) {
		int total = 0;
		
		for(int i =0;i<dataList.length;i++) {
			if(dataList[i].equals(name)) {
				total = priceList[i]*cnt;
			}
		}
		
		return total;
	}



}
