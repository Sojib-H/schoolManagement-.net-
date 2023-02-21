<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RealProjectB2.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Custom fonts for this template-->
    <link href="../Asset/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <!-- Custom styles for this template-->
    <link href="../Asset/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="../Asset/css/customCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid bg-gradient-info vh-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-4 mt-5">
                        <div class="site_logo text-center">
                            <img class="img-fluid w-25" src="Asset/img/logo/logo.png" alt="Alternate Text" />
                        </div>
                        <div id="divMsg" runat="server" class="alert alert-danger">
                            <asp:Label ID="lblMsg" Text="" CssClass="text-danger"  runat="server" ></asp:Label>
                        </div>

                        <div class="card shadow mt-3">
                            <h5 class="text-center pt-2">Login</h5>
                            <div class="card-body">
                                <div class="input-group flex-nowrap">
                                    <span class="input-group-text" id="Email"><i class="fas fa-user"></i></span>
                                    <asp:TextBox CssClass="form-control" Placeholder="Enter Your Email" ID="txtEmail" runat="server"></asp:TextBox>
                                </div>

                                <div class="input-group flex-nowrap mt-4">
                                    <span class="input-group-text" id="Password"><i class="fas fa-lock"></i></span>
                                    <asp:TextBox CssClass="form-control" Placeholder="Enter Your Password" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="mt-3 px-2">
                                    <asp:CheckBox ID="CheckBoxRemember" Text="&nbsp;Remeber Me"  runat="server" />
                                </div>
                                <div class="input-group flex-nowrap mt-1">
                                    <span class="input-group-text" id="button"><i class="fas fa-paper-plane"></i></span>
                                    <asp:Button CssClass="form-control btn btn-info"  Text="Log In" ID="btnLogin" runat="server" OnClick="btnLogin_Click"  />
                                    
                                </div>

                                <div class="login_links my-4">
                                    <a href="#">Forgot Password</a>
                                    <a class="float-end" href="Register.aspx">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap core JavaScript-->
    <script src="../Asset/vendor/jquery/jquery.min.js"></script>
    <script src="../Asset/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../Asset/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../Asset/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../Asset/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../Asset/js/demo/chart-area-demo.js"></script>
    <script src="../Asset/js/demo/chart-pie-demo.js"></script>
</body>
</html>
