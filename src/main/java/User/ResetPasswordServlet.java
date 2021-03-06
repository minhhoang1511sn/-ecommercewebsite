package User;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Data.accountIO;
import Model.Account;
import email.Utility;


@WebServlet(name = "reset_password" , value = "/reset_password")
public class ResetPasswordServlet extends HttpServlet {
    private String host;
    private String port;
    private String username;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        username = context.getInitParameter("username");
        pass = context.getInitParameter("pass");

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        String action = request.getParameter("action");
        String url = "/resetpassword.jsp";
        if (action == null) {
            action = "join";  // default action
        }
        if (action.equals("join")) {
            action = "changingpassword"; // default action
        }
        String message5 = "";
        if (action.equals("resetpass"))
        {
            String email = request.getParameter("email");
            if(accountIO.selectAcc(email) != null)
            {

                Account i = accountIO.selectAcc(email);
                String code = Utility.getRandom();
                request.getSession().setAttribute("code", code);
                request.getSession().setAttribute("account", i);
                boolean test;
                try {
                    test = Utility.sendEmail(host, port, username, pass, email, "M?? X??c Th???c",
                            "Xin h??y nh???p ??o???n m?? n??y v??o trang Verify ????? c?? th??? ?????t m???t kh???u m???i: " +code);
                } catch (MessagingException e) {
                    e.printStackTrace();
                    test = false;
                }


                if(test){
                    HttpSession session  = request.getSession();
                    url="/verifyresetpass.jsp";
                    message5 = "Ch??ng t??i ???? g???i cho b???n 1 m?? x??c th???c ??? trong email.";
                } else{
                    message5 = "???? c?? l???i x???y ra. Xin h??y th??? l???i!";
                    url="/resetpassword.jsp";
                }
            }
            else {
                message5 = "t??i kho???n kh??ng t???n t???i";
            }


        }
        request.setAttribute("message5", message5);
        getServletContext()
                .getRequestDispatcher(url).forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }

            doGet(request,response);
}}
