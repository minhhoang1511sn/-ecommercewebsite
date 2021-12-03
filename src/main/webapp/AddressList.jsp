<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>UserCenter</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" href="css/newcss.css"/>
    <link rel="stylesheet" href="Home/homePage.css"/>
</head>
<body>
<!---------------------------------------------------header-------------------------------------------->
<header class="style__Header">
    <section class="Container">
        <a
                style="color: white"
                href="${pageContext.request.contextPath}/summary"
        >Kênh Người Bán</a
        >
        <div class="Middle__Wrap">
            <div class="Middle__LeftContainer">
                <div class="logo-menu">
                    <div class="style_Logo">
                        <a href="home" class="dhs-logo">
                            <img src="Home/img/logo.svg" alt=""/>
                        </a>
                    </div>
                </div>

                <div class="Category__Root">
                    <div class="Category">
                        <div>
                            <img
                                    class="Category-icon"
                                    src="https://icon-library.com/images/hamburger-icon-white/hamburger-icon-white-16.jpg"
                                    alt=""
                            />
                        </div>
                        <div class="Category-info">
                            <div class="Category-text">
                                Danh mục
                                <p>Sản phẩm</p>
                            </div>
                        </div>
                        <img
                                class="arrowIcon"
                                src="Home/img/dropdownArrow.png"
                                alt=""
                        />
                    </div>
                </div>

                <div class="FormSearch__Root">
                    <div class="FormSearch__Form">
                        <input
                                type="text"
                                placeholder="Find somethings v............... ?"
                                class="FormSearch__Input"
                                value=""
                        />
                        <button class="FormSearch__Button">
                            <img
                                    class="icon-search"
                                    src="https://salt.tikicdn.com/ts/upload/ed/5e/b8/8538366274240326978318348ea8af7c.png"
                                    alt=""
                            />
                            Search
                        </button>
                    </div>
                </div>
                <% session = request.getSession(false);
                    if (session == null || session.getAttribute("loggedInUser") == null) {%>
                <a href="login" style="text-decoration: none; color: whitesmoke;"> Đăng nhập | Đăng ký</a>
                <%} else {%>
                <div class="Userstyle__Root">
                    <div class="Userstyle__Item">
                        <img class="profile-icon" src="Home/img/user.png" alt=""/>
                        <a class="Userstyle__ItemText">
                            <span class="Userstyle__NoWrap">Tài khoản</span>
                            <span class="account_laber">
										<div style="display: flex" class="buttonDropdown">
                                            <%
                                                if (session.getAttribute("username") == null || session.getAttribute("username") == "" || session == null || session.getAttribute("loggedInUser") == null) {%>
											<span>user-name</span>
                                            <%
                                            } else {
                                            %>
                                            <span>${account.username}</span>
                                            <%}%>
											<img class="arrowIcon" src="Home/img/down.png" alt=""/>
										</div>
										<div
                                                style="margin-top: 20px"
                                                class="UserHeader_UserDropDown disableForm"
                                        >
											<a
                                                    rel="nofollow"
                                                    href="${pageContext.request.contextPath}/customerorder"
                                            >
												<p
                                                        title="Order history"
                                                        class="UserHeader_UserDropDownItem"
                                                >
													Order history
												</p>
											</a>

											<a
                                                    rel="nofollow"
                                                    href="${pageContext.request.contextPath}/customer"
                                            >
												<p
                                                        title="My account"
                                                        class="UserHeader_UserDropDownItem"
                                                >
													My account
												</p>
											</a>
											<a
                                                    rel="nofollow"
                                                    href="${pageContext.request.contextPath}/changingpassword"
                                            >
												<p
                                                        title="Notification"
                                                        class="UserHeader_UserDropDownItem"
                                                >
													Changing password
												</p>
											</a>
											<a
                                                    rel="nofollow"
                                                    href="${pageContext.request.contextPath}/customerReview"
                                            >
												<p title="Reviews" class="UserHeader_UserDropDownItem">
													"Reviews"
												</p>
											</a>
											<a rel="nofollow" href="logout">
												<p title="Log out" class="UserHeader_UserDropDownItem">
													Log out
												</p>
											</a>
										</div>
									</span>
                        </a>
                    </div>

                    <div class="Userstyle__CartItem">
                        <a
                                href="${pageContext.request.contextPath}/cart"
                                rel="nofollow"
                        >
                            <div class="Userstyle__Item2">
                                <div class="cart-wrapper">
                                    <img
                                            class="cart-icon"
                                            src="https://salt.tikicdn.com/ts/upload/40/44/6c/b80ad73e5e84aeb71c08e5d8d438eaa1.png"
                                    />
                                    <span class="Userstyle__ItemCart">3</span>
                                </div>

                                <span class="cart-text">Giỏ Hàng</span>
                            </div>
                        </a>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        </div>
    </section>
</header>
<!---------------------------------------------------main-------------------------------------------->
<main>
    <section class="Container">
        <div class="Account_Layout">
            <div class="breadcrumb_Container"></div>
            <aside class="Account_StylesSideBar">
                <div class="Account_StylesAvatar">

                    <div class=" file1 temp" style="width: 10%; margin-top: 10px">
                        <form>
                            <img class="avt" style="width: 60px; height: 60px"
                                 src="${pageContext.request.contextPath}/images/${account.avatar}" alt="">
                        </form>
                    </div>
                    <div style="margin-left: 100px" class="info">
                        Tài Khoản
                        <strong>user-name</strong>
                    </div>
                </div>

                <ul class="Account_NavBar">
                    <li><a class="is-active" href="customer"><span>Thông tin tài khoản</span></a></li>
                    <li><a href="changingpassword"><span>Đổi mật khẩu</span></a></li>
                    <li><a href="customerorder"><span>Quản lý đơn hàng</span></a></li>
                    <li><a href="addresslist"><span>Sổ địa chỉ</span></a></li>
                    <li><a href="customerReview"><span>Nhận xét sản phẩm đã mua</span></a></li>
                </ul>
            </aside>
            <div class="Account_StylesAccountLayoutInner">

                <div class="adressadd formresult  ">
                    <h3 class="HeadingContent">Danh Sách Địa Chỉ</h3>
                    <div class="new addadress">
                        <a id="a" href="addaddress">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24"
                                 height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z">
                                </path>
                            </svg>
                            <span>Thêm địa chỉ mới
                  </span>
                        </a>
                    </div>
                    <div class="Content_StylesNav">
                        <form method="get">
                            <c:if test="${empty listaddress}">
                                <p style="margin-left: 420px">Chưa có địa chỉ nào</p>
                            </c:if>
                            <c:if test="${not empty listaddress}">

                                <div class="_1address">
                                    <div style="display: flex; margin-bottom: 10px;" class="addresslist">
                                        <div style="margin-right: auto;" class="info">
                                            <c:forEach items="${listaddress}" var="elements">
                                                <form style="width: 100%; margin-top: 10px;" action="addresslist">
                                                    <input type="hidden" name="madiachi" value="${elements[5]}">
                                                    <div class="name"><c:out value="${elements[0]}"/>
                                                        <span>
                                                            <svg style="color: greenyellow;" stroke="currentColor"
                                                                 fill="currentColor" stroke-width="0"
                                                                 viewBox="0 0 512 512" height="1em" width="1em"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                            </svg>
                                                        </span>
                                                    </div>
                                                    <div class="address">
                                                        <span>Địa chỉ: </span><c:out value="${elements[1]}"/>, <c:out
                                                            value="${elements[2]}"/>, <c:out value="${elements[3]}"/>
                                                    </div>
                                                    <div class="phone"><span>Điện thoại:</span><c:out
                                                            value="${elements[4]}"/></div>

                                                </form>

                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </section>
</main>
<!---------------------------------------------------footer-------------------------------------------->
<script src="js/main.js"></script>
</body>
</html>
