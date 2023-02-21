﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout/AdminMain.Master" AutoEventWireup="true" CodeBehind="StudentRegistrationForm.aspx.cs" Inherits="RealProjectB2.Student.StudentRegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Student Registration</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
    </div>

    <div class="card shadow">
        <div class="card-header bg-gradient-primary text-light">Personal Details</div>
        <div class="card-body">
            <div class="row">
                
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
            
            <div class="row">
                <div class="col-md-3">
                    <label>Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Contact Mobile Number</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div> </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label>Date Of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    Register
                    <dib></dib>
                    <dib></dib>
                    <label>Gender</label>
                    <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Student Type</label>
                    <asp:DropDownList ID="DDLStudentType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">New</asp:ListItem>
                        <asp:ListItem Value="2">Old</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Post Code</label>
                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label>Address</label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow mt-2">
        <div class="card-header bg-gradient-primary text-light">Parents Info</div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Father's Name</label>
                    <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Occupation</label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="5" CellSpacing="2" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Private Service</asp:ListItem>
                        <asp:ListItem Value="2">Govt. Service</asp:ListItem>
                        <asp:ListItem Value="3">Business</asp:ListItem>
                        <asp:ListItem Value="4">Farmer</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Contact Number</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Father Email</label>
                    <asp:TextBox ID="txtFatherEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-md-12">
                    <label>Address</label>
                    <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="card shadow mt-3">
        <div class="card-header bg-gradient-primary text-light">Educational Details</div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label>Level/Cirtificate</label>
                   <asp:DropDownList ID="DDLLevel" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">SSC</asp:ListItem>
                        <asp:ListItem Value="2">HSC</asp:ListItem>
                        <asp:ListItem Value="3">Graduations</asp:ListItem>
                        <asp:ListItem Value="4">Masters</asp:ListItem>
                        <asp:ListItem Value="5">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Passing Year</label>
                    <asp:TextBox ID="txtPassingYear" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Result</label>
                    <asp:TextBox ID="txtResult" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Board</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Dhaka</asp:ListItem>
                        <asp:ListItem Value="2">Chittagong</asp:ListItem>
                        <asp:ListItem Value="3">Khulna</asp:ListItem>
                        <asp:ListItem Value="4">Comilla</asp:ListItem>
                        <asp:ListItem Value="5">Barishal</asp:ListItem>
                        <asp:ListItem Value="6">Rajshahi</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server"  CssClass="form-control"/>
                </div>
                <div class="col-md-6">
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="Button" CssClass="btn btn-primary form-control mt-2"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
