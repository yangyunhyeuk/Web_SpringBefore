package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import model.DataBean;

public class CusTagHandler extends SimpleTagSupport {

	private String size;
	private String color;

	public void doTag() throws IOException, JspException {
		System.out.println("커스태그핸들러 두 태그 도착");
		JspWriter out = getJspContext().getOut();
		// getJspContext() : jsp 데이터 가져오는 것
		System.out.println(out + " 이것은 getJspContext().getOut()");

		StringBuffer sb = new StringBuffer();
		JspFragment body = getJspBody(); // body는 태그바디의 데이터
		if (body != null) {
			out.println("글자 크기는 " + size);
			out.println("글자 색은 " + color);

			// 스트링버퍼를 이용해보자!
			sb.append("<p style='font-size:").append(size).append("; color:").append(color).append(";\'>");
			out.println(sb.toString());
			body.invoke(null); // 태그바디에 입력한 메시지, invoke 안 인자는 라이터이다.
			// 태그바디를 작성하지 않는경우 nullexception 예외가 발생할 수 있어 위에 if문을 작성하였다.
			out.println("</p>");
			// 위는 인자를 꼭보내줘야한다. 그래서 nulldmf qhsoa
			// if문이 없을 시 null을 넣어줘야하기 때문
			// 바디가 있으면 h1을 쓰기 위해서 위 작업을 하는 것이다.

			System.out.println("sb.toString() 출력 전");
			System.out.println(sb.toString());
			System.out.println("sb.toString() 출력 후");

		}

	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
