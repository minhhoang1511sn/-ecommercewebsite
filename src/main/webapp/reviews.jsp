<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/sellercenter.css"/>
    <title>DHS Reviews Seller</title>
</head>
<body>
<header class="header-root">
    <section class="header-container">
        <a href="${pageContext.request.contextPath}/home" class="content-logo"><img src="SellerCenter/img/android-chrome-192x192.png" alt=""></a>
        <a href="${pageContext.request.contextPath}/summary" class="style-content">
            <span>Seller Center</span>
        </a>

        <div class="account-avatar">
            <img class="avt" src="SellerCenter/img/avatar.jfif" alt="">
            <span>Lê Trần Minh Nhựt</span>
        </div>
    </section>
</header>
<main>
    <section class="layout-container">
        <aside class="styles-left-SideBar">
            <ul class="nav-bar-account">
                <li>
                    <a href="${pageContext.request.contextPath}/summary">
                        <span>Doanh Thu</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/product">
                        <span>Sản Phẩm</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/bill">
                        <span>Đơn hàng</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/delivery">
                        <span>Vận chuyển</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/reviews" class="is-active">
                        <span>Đánh giá</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/account">
                        <span>Tài khoản</span>
                    </a>
                </li>
            </ul>
        </aside>
        <section class="styles-middle-container has-sidebar">
            <div class="layout-menu">
                <div class="main-content">
                    <h3 class="title">Đánh giá của khách hàng</h3>
                    <div class="inner">
                        <c:if test="${empty listreview}">
                            <span>Load Failed</span>
                        </c:if>
                        <c:if test="${not empty listreview}">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Tiêu đề nhận xét</th>
                                        <th>Nhận xét</th>
                                        <th>Tên khách hàng</th>
                                        <th>Ngày tạo</th>
                                    </tr>
                                    </thead>
                            <c:forEach items="${listreview}" var="element">
                                    <tbody>
                                    <tr>
                                        <td>${element[0]}</td>
                                        <td>${element[2]}</td>
                                        <td>${element[1]}</td>
                                        <td>${element[5]}</td>
                                        <td>${element[7]}</td>
                                        <td>${element[6]}</td>
                                    </tr>
                                    </tbody>
                            </c:forEach>
                            </table>

                        </c:if>
                    </div>
                </div>
            </div>
        </section>
    </section>
</main>
</body>
</html>

