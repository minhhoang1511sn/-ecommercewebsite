package User;

import Data.addressIO;
import Data.cartIO;
import Data.productIO;
import Model.Account;
import Model.Cart;
import Model.CartItem;
import Model.Product;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        ServletContext sc = getServletContext();
        String action = request.getParameter("action");
        if (action == null) {
            action = "cart"; // default action
        }
        String url = "/cart.jsp";
        if (action.equals("cart")) {
         String productCode = request.getParameter("productCode");
         String amountString = request.getParameter("amount");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            int amount;
            try {
                amount = Integer.parseInt(amountString);
                if (amount < 0) {
                    amount = 1;
                }
            } catch (NumberFormatException nfe) {
                amount = 1;
            }


//            long id = Long.parseLong(productCode);
            long id =1;
            Product product = productIO.selectProduct(id);


            CartItem cartItem = new CartItem();
            cartItem.setProductByProductId(product);
            cartItem.setAmount(amount);
            if (amount > 0) {
               cart.addCartItem(cartItem);
            } else if (amount == 0) {
                cart.removeCartItem(cartItem);
            }
            Account acc = (Account) request.getSession().getAttribute("account");
            long id1 = acc.getId();
            List listcart = cartIO.selectCart(id1);
            List listaddress = addressIO.selectUserAdress(id1);
            request.getSession().setAttribute("listaddress", listaddress);
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
}
