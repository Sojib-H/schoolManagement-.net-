<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RealProjectB2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Custom fonts for this template-->
    <link href="../Asset/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <!-- Custom styles for this template-->
    <link href="../Asset/css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="../Asset/css/customCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid bg-gradient-info">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-4 mt-5">
                        <div class="site_logo text-center">
                            <img class="img-fluid w-25" src="Asset/img/logo/logo.png" alt="Alternate Text" />
                        </div>

                    </div>
                    <div class="col-md-10 mb-5">
                        <div id="divMsg" runat="server" class="alert alert-danger">
                            <asp:Label ID="lblMsg" Text="" CssClass="text-danger" runat="server"></asp:Label>
                        </div>
                        <div class="card shadow">
                            <div class="card-header bg-gradient-primary text-light">Personal Details</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="form-label">User Name</label>
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">Middle Name</label>
                                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Phone Number</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Date Of Birth</label>
                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">Male</asp:ListItem>
                                            <asp:ListItem Value="2">Female</asp:ListItem>
                                            <asp:ListItem Value="3">Others</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Religion</label>
                                        <asp:DropDownList ID="DDLReligion" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">Islam</asp:ListItem>
                                            <asp:ListItem Value="2">Hindu</asp:ListItem>
                                            <asp:ListItem Value="3">Others</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Student Image</label>
                                        <asp:FileUpload ID="FlUserImage" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Address</label>
                                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row justify-content-center">
                                    <asp:Button ID="submitBtn" CssClass="btn btn-info col-md-11 my-3" runat="server" Text="Submit" OnClick="submitBtn_Click" />
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
