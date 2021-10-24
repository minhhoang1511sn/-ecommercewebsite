
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserCenter</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" href="css/newcss.css" />
    <link rel="stylesheet" href="Home/homePage.css"/>
</head>
<body>
<!---------------------------------------------------header-------------------------------------------->
<header class="style__Header">
    <section class="Container">
        <a style="color: white" href="${pageContext.request.contextPath}/summary">Kênh Người Bán</a>
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
                            <img class="Category-icon" src="https://icon-library.com/images/hamburger-icon-white/hamburger-icon-white-16.jpg"  alt="">
                        </div>
                        <div class="Category-info">
                            <div class="Category-text">Danh mục
                                <p>Sản phẩm</p>
                            </div>

                        </div>
                        <img class="arrowIcon" src="Home/img/dropdownArrow.png" alt=""/>
                    </div>
                </div>

                <div class="FormSearch__Root">
                    <div class="FormSearch__Form">
                        <input type="text" placeholder="Find somethings v............... ?" class="FormSearch__Input" value="" />
                        <button class="FormSearch__Button">
                            <img class="icon-search"
                                 src="https://salt.tikicdn.com/ts/upload/ed/5e/b8/8538366274240326978318348ea8af7c.png"  alt=""/>
                            Search
                        </button>
                    </div>
                </div>

                <div class="Userstyle__Root">
                    <div class="Userstyle__Item">
                        <img class="profile-icon" src="Home/img/user.png" alt=""/>
                        <a class="Userstyle__ItemText" >
                            <span class="Userstyle__NoWrap">Tài khoản</span>
                            <span class="account_laber">
                <div style="display: flex" class="buttonDropdown">
                <span>user-name</span>
                <img class="arrowIcon" src="Home/img/down.png" alt=""/>
                </div>
                <div style="margin-top: 20px;" class="UserHeader_UserDropDown disableForm">
                  <a rel="nofollow" href="${pageContext.request.contextPath}/customerorder">
                    <p title="Order history" class="UserHeader_UserDropDownItem">
                      Order history
                    </p>
                  </a>

                  <a rel="nofollow" href="${pageContext.request.contextPath}/customer">
                    <p title="My account" class="UserHeader_UserDropDownItem">
                      My account
                    </p>
                  </a>
                   <a rel="nofollow" href="${pageContext.request.contextPath}/changingpassword">
                    <p title="Notification" class="UserHeader_UserDropDownItem">
                      Changing password
                    </p>
                  </a>
                  <a rel="nofollow" href="${pageContext.request.contextPath}/customerReview">
                    <p title="Reviews" class="UserHeader_UserDropDownItem">
                      "Reviews"
                    </p>
                  </a>
                  <a rel="nofollow" href="">
                    <p title="Log out" class="UserHeader_UserDropDownItem">
                      Log out
                    </p>
                  </a>
                </div>
              </span>
                        </a>
                    </div>

                    <div class="Userstyle__CartItem">
                        <a href="${pageContext.request.contextPath}/cart" rel="nofollow">
                            <div class="Userstyle__Item2">
                                <div class="cart-wrapper">
                                    <img class="cart-icon"
                                         src="https://salt.tikicdn.com/ts/upload/40/44/6c/b80ad73e5e84aeb71c08e5d8d438eaa1.png"  />
                                    <span class="Userstyle__ItemCart">3</span>
                                </div>

                                <span class="cart-text">Giỏ Hàng</span>
                            </div>
                        </a>
                    </div>
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
                        <img class="avt"  id="photo" src="img/logo_ico.png">
                        <div class="Btnclick">
                            <input type="file" id="file" name="img" >
                            <label  for="file" id="uploadBtn">Choose Avatar</label>
                        </div>
                    </div>
                    <div style="margin-left: 100px" class="info">
                        Tài Khoản
                        <strong>user-name</strong>
                    </div>
                </div>

                <ul class="Account_NavBar">
                    <li><a   href="customer"><span>Thông tin tài khoản</span></a></li>
                    <li><a    href="changingpassword"><span>Đổi mật khẩu</span></a></li>
                    <li><a   href="customerorder"><span>Quản lý đơn hàng</span></a></li>
                    <li><a  href="addresslist"><span>Sổ địa chỉ</span></a></li>
                    <li><a class="is-active" href="customerReview"><span>Nhận xét sản phẩm đã mua</span></a></li>
                    <li><a   href="buyinglater"><span>Sản phẩm mua sau</span></a></li>
                </ul>
            </aside>
            <div class="Account_StylesAccountLayoutInner">
                <div class="comment formresult ">
                    <h3 class="HeadingContent">Nhận Xét Về Sản Phẩm Của Bạn</h3>
                    <div class="Content_StylesNav">
                        <form>
                            <!--                <p style="margin-left: 420px">Chưa có nhận xét nào</p>-->
                            <!--                <a href="/" class="back">Tiếp tục mua sắm</a>-->
                            <table class="comment">
                                <thead>
                                <tr>
                                    <th width="200px">Mã đơn hàng</th>
                                    <th>Sản phẩm</th>
                                    <th width="200px">Nhận xét</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <a width="100px" href="/sales/order/view/280563326">280563326</a>
                                    </td>

                                    <td>Điện thoại Vivo Y12s - Xanh dương nhạt- 4GB/128GB - Hàng Chính Hãng ...và 01 sản phẩm khác</td>
                                    <td width="100px">Sản Phẩm rất tốt aaaaaa aaaaaa aaaaaa aaa</td>
                                </tr>

                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="buying-Later formresult disableForm ">
                    <h3 class="HeadingContent">Sản Phẩm Mua Sau</h3>
                    <div class="Content_StylesNav">
                        <form>
                            <!--                <p style="margin-left: 420px">Chưa có sản phẩm nào</p>-->
                            <!--                <a href="/" class="back">Tiếp tục mua sắm</a>-->
                            <table class="comment">
                                <thead>
                                <tr>
                                    <th width="200px">Mã đơn hàng</th>
                                    <th>Sản phẩm</th>
                                    <th width="200px">Mua</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <a width="100px" href="/sales/order/view/280563326">280563326</a>
                                    </td>

                                    <td>Điện thoại Vivo Y12s - Xanh dương nhạt- 4GB/128GB - Hàng Chính Hãng ...và 01 sản phẩm khác</td>
                                    <td style="text-align: center" width="100px"><input type="checkbox" id="vehicle1" ></td>
                                </tr>

                                </tbody>
                            </table>
                            <a href="/" class="back">Mua</a>
                        </form>
                    </div>
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