package Pluto.admin;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import Pluto.DBConnection;
import Pluto.function;

import com.opensymphony.xwork2.ActionSupport;

public class deluser extends ActionSupport {
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String execute() throws Exception {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		ServletActionContext.getResponse().setHeader("Pragma", "No-cache");
		ServletActionContext.getResponse().setHeader("Cache-Control",
				"no-cache");
		ServletActionContext.getResponse().setDateHeader("Expires", 0);
		
		if(function.isInvalid(id)){
			out.println(function.PlutoJump("fail!", "user.jsp"));
		}
		
		DBConnection conn = new DBConnection();
		
		boolean del = conn.execute("delete from user where id="+id+" limit 1");
		if(del){
			out.println(function.PlutoJump("success!", "user.jsp"));
		}else {
			out.println(function.PlutoJump("fail!", "user.jsp"));
		}
		
		return null;
	}

}
