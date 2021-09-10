package day14;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


/**
 * Application Lifecycle Listener implementation class TestListener
 *
 */
@WebListener
public class TestListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public TestListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { // �ʱ� ������ ����, �������� ���ø����̼�
    	ServletContext context = sce.getServletContext();
    	ArrayList<CoffeeVO> datas = new ArrayList<CoffeeVO>();
    	datas.add(new CoffeeVO("��������"));
    	datas.add(new CoffeeVO("�Ƹ޸�ī��"));
    	datas.add(new CoffeeVO("��Ʈ����"));
    	
		context.setAttribute("datas", datas);


    	
    }
	
}
