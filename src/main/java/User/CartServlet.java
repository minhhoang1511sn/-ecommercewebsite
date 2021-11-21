package User;

import Data.accountIO;
import Data.addressIO;
import Data.cartIO;
import Data.productIO;
import Model.Account;
import Model.Cart;
import Model.CartItem;
import Model.Product;
import util.CookieUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "cart", value = "/cart")
public class CartServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        String productCode;
        String amountString;
        ServletContext sc = getServletContext();
        String action = request.getParameter("action");
        String url = null;
         if(action.equals("checkUser"))
        {
          url =  checkUser(request,response);
        }
         else {
             Account acc = (Account) request.getSession().getAttribute("account");
             long id1 = acc.getId();
             List listcart = cartIO.selectCart(id1);
             List listaddress = addressIO.selectUserAdress(id1);
             request.getSession().setAttribute("listaddress", listaddress);

             Cart cart = null;
             int amount = 0;
             HttpSession session = request.getSession();
             if (action == null) {
                 action = "watchcart"; // default action
             }

             if (action.equals("cart")) {
                 productCode = request.getParameter("productCode");
                 amountString = request.getParameter("amount");


                 cart = (Cart) session.getAttribute("cart");
                 if (cart == null) {
                     cart = new Cart();
                 }

                 try {
                     amount = Integer.parseInt(amountString);
                     if (amount < 0) {
                         amount = 1;
                     }
                 } catch (NumberFormatException nfe) {
                     amount = 1;
                 }
                 long id = Long.parseLong(productCode);
                 Product product = productIO.selectProductByid(id);
                 CartItem cartItem = new CartItem();
                 cartItem.setProductByProductId(product);
                 cartItem.setAmount(amount);
                 if (amount > 0) {
                     cart.addItem(cartItem);
                 } else {
                     cart.removeItem(cartItem);
                 }

             }
             session.setAttribute("cart", cart);
             request.setAttribute("amount", amount);
             request.getSession().setAttribute("listcart", listcart);
             request.getSession().setAttribute("amount", amount);
             url = "/cart.jsp";
         }


        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    private String checkUser(HttpServletRequest request,
                             HttpServletResponse response) {

        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        session.setAttribute("productCode", productCode);
        Account user = (Account) session.getAttribute("email");

        String url;
        // if User object doesn't exist, check email cookie
        if (user == null) {
            Cookie[] cookies = request.getCookies();
            String emailAddress = CookieUtil.getCookieValue(cookies, "emailCookie");
            String email =  request.getParameter("email");
            String password =  request.getParameter("password");
            // if cookie doesn't exist, go to Registration page
            if (email == null || email.equals("")) {
                url = "/login.jsp";
            }
            // if cookie exists, create User object and go to Downloads page
            else {
                ServletContext sc = getServletContext();
                Account  account = (Account) request.getSession().getAttribute("account");
                long id = account.getId();
                Account   account1 = accountIO.getAccountById(id);
                session.setAttribute("account", account1);
                url = "/cart.jsp";
            }
        }
        // if User object exists, go to Downloads page
        else {
            url = "/cart.jsp";
        }
        return url;
    }
}
