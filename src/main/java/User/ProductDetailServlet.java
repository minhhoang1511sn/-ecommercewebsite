package User;

import Data.cartIO;
import Data.cartItemIO;
import Data.productIO;
import Data.reviewIO;
import Model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        String action = request.getParameter("action");
        String url = "/ProductDetail.jsp";
        if(action == null)
        {
            action = "detail";
        }
        HttpSession session = request.getSession();

        Product product=null;
        String productid = request.getParameter("productCode");
        List<?> rv;
        if(productid!=null)
        {
            long id = Long.parseLong(productid);
            product = productIO.selectProductByid(id);
        }
        int amount = 1;

        switch (action) {
            case "detail": {
                request.getSession().setAttribute("product", product);
                request.getSession().setAttribute("amount",amount);
                assert productid != null;
                long id = Long.parseLong(productid);
                rv = reviewIO.selectReviewList(id);
                request.getSession().setAttribute("reviewlist",rv);
                getServletContext()
                        .getRequestDispatcher(url)
                        .forward(request, response);
                break;
            }
            case "comment": {
                if (session.getAttribute("account") == null) {
                    url = "/login.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(request, response);
                }
                else {
                    String topic = request.getParameter("topiccomment");
                    String comment = request.getParameter("comment");
                    String rating1 = request.getParameter("stars");
                    Account acc = (Account) request.getSession().getAttribute("account");
                    Timestamp commenttime = new Timestamp(System.currentTimeMillis());
                    short rating;
                    if (rating1 == null) {
                        rating = 0;
                    } else {
                        rating = Short.parseShort(rating1);
                    }
                    Review a = new Review(product, acc, rating, topic, comment, commenttime);
                    reviewIO.insert(a);
                }
                long id = Long.parseLong(productid);
                rv = reviewIO.selectReviewList(id);
                request.getSession().setAttribute("reviewlist",rv);
                getServletContext()
                        .getRequestDispatcher(url)
                        .forward(request, response);
                break;
            }
            case "checkUser": {
                url = "/login.jsp";
                getServletContext()
                        .getRequestDispatcher(url)
                        .forward(request, response);
                break;
            }
            case "add":
                AddItem(request);
                getServletContext()
                        .getRequestDispatcher(url)
                        .forward(request, response);
                break;
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private void AddItem (HttpServletRequest request) {
        Account acc = (Account) request.getSession().getAttribute("account");
        String amount1 = request.getParameter("sl");
        int amount = Integer.parseInt(amount1);
        long productCode = Long.parseLong(request.getParameter("productCode"));
        Cart cart = (Cart) cartIO.selectCart(acc.getId());
        Product product = productIO.selectProductByid(productCode);
        Timestamp lastUpdate = new Timestamp(System.currentTimeMillis());
        assert product != null;
        product.setUpdatedAt(lastUpdate);
        productIO.update(product);
        CartItem cartItem = null;
        if (cart != null) {
            cartItem = (CartItem) cartItemIO.selectItemincart(productCode,cart.getId());
        }
        if (cartItem == null) {
            CartItem Item = new CartItem();
            Item.setAmount(amount);
            Item.setPrice(product.getPrice());
            Item.setProductByProductId(product);
            Item.setCartByCartId(cart);
            cartItemIO.insert(Item);
        }
        else {
            cartItem.setAmount(amount);
            cartItem.setPrice(amount*product.getPrice());
            cartItemIO.update(cartItem);
        }
    }
}
