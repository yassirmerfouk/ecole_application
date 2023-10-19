package listeners;

import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.EtudiantRepository;
import com.dao.Repository;
import com.entities.Etudiant;

@WebListener
public class ApplicationListner implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("application stoped");
		EtudiantRepository.emf.close();
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("application running");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beans.xml");
		sce.getServletContext().setAttribute("applicationContext", applicationContext);
	}

}
