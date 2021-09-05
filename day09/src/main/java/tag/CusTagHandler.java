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
		System.out.println("Ŀ���±��ڵ鷯 �� �±� ����");
		JspWriter out = getJspContext().getOut();
		// getJspContext() : jsp ������ �������� ��
		System.out.println(out + " �̰��� getJspContext().getOut()");

		StringBuffer sb = new StringBuffer();
		JspFragment body = getJspBody(); // body�� �±׹ٵ��� ������
		if (body != null) {
			out.println("���� ũ��� " + size);
			out.println("���� ���� " + color);

			// ��Ʈ�����۸� �̿��غ���!
			sb.append("<p style='font-size:").append(size).append("; color:").append(color).append(";\'>");
			out.println(sb.toString());
			body.invoke(null); // �±׹ٵ� �Է��� �޽���, invoke �� ���ڴ� �������̴�.
			// �±׹ٵ� �ۼ����� �ʴ°�� nullexception ���ܰ� �߻��� �� �־� ���� if���� �ۼ��Ͽ���.
			out.println("</p>");
			// ���� ���ڸ� ����������Ѵ�. �׷��� nulldmf qhsoa
			// if���� ���� �� null�� �־�����ϱ� ����
			// �ٵ� ������ h1�� ���� ���ؼ� �� �۾��� �ϴ� ���̴�.

			System.out.println("sb.toString() ��� ��");
			System.out.println(sb.toString());
			System.out.println("sb.toString() ��� ��");

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
