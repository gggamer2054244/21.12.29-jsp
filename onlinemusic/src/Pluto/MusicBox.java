package Pluto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import Pluto.DBConnection;
import Pluto.function;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MusicBox extends ActionSupport {
	private String music_id;

	public String getMusic_id() {
		return music_id;
	}

	public void setMusic_id(String music_id) {
		this.music_id = music_id;
	}

	public String execute() throws IOException, SQLException {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		ServletActionContext.getResponse().setHeader("Pragma", "No-cache");
		ServletActionContext.getResponse().setHeader("Cache-Control","no-cache");
		ServletActionContext.getResponse().setDateHeader("Expires", 0);
		String userName = ServletActionContext.getContext().getSession().get("PlutoUser").toString();

		DBConnection conn = new DBConnection();
		ResultSet rs = conn.executeQuery("select music_box from user where name='"+ userName + "'");
		if (rs.next()) {
			// 检测数据库中是否存在相同音乐
			String playList = rs.getString("music_box");
			if (playList == null) {
				if (conn.execute("update user set music_box='" + music_id+ "' where name='" + userName + "' ")) {
					out.println("success!");
				} else {
					out.println("fail!");
				}
			} else {
				String[] playListArr = playList.split(",");
				for (int i = 0; i < playListArr.length; i++) {
					if (music_id.equals(playListArr[i])) {
						return null;
					}
				}
				if (function.isInvalid(playList)) { 
					if (conn.execute("update user set music_box='" + music_id+ "' where name='" + userName + "' ")) {
						out.println("success!");
					} else {
						out.println("fail!");
					}
				} else { // 存在其他音乐
					if (conn
							.execute("update user set music_box = CONCAT(music_box , ',"
									+ music_id
									+ "') where name='"
									+ userName
									+ "'")) {
						out.println("success!");
					} else {
						out.println("fail!");
					}
				}
			}
		} else {
			out.println("fail!");
			return null;
		}
		return null;
	}
}
