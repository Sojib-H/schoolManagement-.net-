<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout/AdminMain.Master" AutoEventWireup="true" CodeBehind="RegistrationList.aspx.cs" Inherits="RealProjectB2.RegistrationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <asp:Label CssClass="h3 mb-0 text-gray-800" ID="Label1" runat="server" Text="User Registration"></asp:Label>
        <%--<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>--%>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <asp:Label ID="lblReligion" CssClass="form-label" runat="server" Text="Religion"></asp:Label>
                    <asp:DropDownList ID="DDLReligion" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Islam</asp:ListItem>
                        <asp:ListItem Value="2">Hindu</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <asp:Label ID="lalGender" CssClass="form-label" runat="server" Text="Gender"></asp:Label>
                    <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <br />
                    <asp:Button ID="btnSearch" CssClass="btn btn-outline-primary" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                </div>
            </div>
        </div>
        <div class="card-header bg-gradient-primary text-light">
            User Registration Info
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView CssClass="table table-borderless table-striped table-hover" ID="gvRegList" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Action"></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblDataNotice" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
