<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout/AdminMain.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RealProjectB2.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <asp:Label CssClass="h3 mb-0 text-gray-800" ID="Label1" runat="server" Text="Contact Info"></asp:Label>
    </div>
    <!-- warning message -->
    <div id="divMsg" runat="server" class="alert alert-danger">
        <asp:Label ID="lblMsg" Text="" CssClass="text-danger" runat="server"></asp:Label>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label>Name</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter your name" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Contact Number</label>
                    <asp:TextBox ID="txtContactNumber" CssClass="form-control" Placeholder="Enter your contact number" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-3">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Enter your Email" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-3">
                    <label>Social Link</label>
                    <asp:TextBox ID="txtSocial" CssClass="form-control" Placeholder="Enter your Social link" runat="server"></asp:TextBox>
                </div>

                <div class="justify-content-between row">
                    <asp:HiddenField ID="hdnEditCid" runat="server" />
                    <asp:Button ID="submitBtn" CssClass="btn btn-primary col-md-5 mt-4 ml-3" runat="server" Text="Submit" OnClick="submitBtn_Click" />
                    <asp:Button ID="cancelBtn" CssClass="btn btn-primary col-md-5 mt-4 ml-3" runat="server" Text="Canel" OnClick="cancelBtn_Click"/>
                </div>


            </div>
        </div>


        <asp:Label ID="show" CssClass="card-header bg-gradient-primary text-light" runat="server" Text="Contact Info"></asp:Label>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblDataNotice" runat="server" Text=""></asp:Label>
                    <asp:GridView CssClass="table table-borderless table-striped table-hover" ID="ContactInfo" runat="server" AutoGenerateColumns="False" OnRowCommand="ContactInfo_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Contact" DataField="Contact" />
                            <asp:BoundField HeaderText="Email" DataField="Email" />
                            <asp:BoundField HeaderText="Social" DataField="Social" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnCid" runat="server" Value='<%#Eval("CID") %>' />
                                    <asp:ImageButton ID="ibEdit" runat="server" CommandName="editContact" CommandArgument="<%#Container.DataItemIndex %>" AlternateText="Edit" ImageUrl="~/Asset/img/logo/editLogo.jpg" Width="20px" />
                                    <asp:ImageButton ID="ibDelete" runat="server" CommandName="deleteContact" CommandArgument="<%#Container.DataItemIndex %>" AlternateText="Delete" ImageUrl="~/Asset/img/logo/deleteLogo.png" Width="15px" CssClass="ml-3" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>

    </div>
</asp:Content>
