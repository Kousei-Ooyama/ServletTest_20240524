package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jp.co.aforce.dao.TweetDAO;

@WebServlet("/remove_tweet")
public class RemoveTweetServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		int i=0;
		while(true) {
			String num = Integer.toString(i);
			if(request.getParameter(num) != null) {
				TweetDAO dao= new TweetDAO();
				try {
					dao.removeTweet(i);
					session.setAttribute("removeTweet_SuccessOrFailure", "success");
				}catch(Exception e) {
					e.printStackTrace();
					session.setAttribute("removeTweet_SuccessOrFailure", "failure");
				}
				break;
			}
			
			if(i>100000) {
				break;
			}
			i++;
		}
		response.sendRedirect("tweet_list");
	}
}
