<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout/AdminMain.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="RealProjectB2.StudentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Row -->

    <div class="row">
        <div class="col-xl-2 col-lg-3"></div>
        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
                    <h6 class="m-0 font-weight-bold text-primary">Student Registration Form</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter Your Name">
                    </div>
                    <div class="form-group">
                        <label for="fater_name">Fater Name</label>
                        <input type="text" class="form-control" id="fater_name" placeholder="Enter Your Father Name">
                    </div>
                    <div class="form-group">
                        <label for="mother_name">Mother Name</label>
                        <input type="text" class="form-control" id="mother_name" placeholder="Enter Your Mother Name">
                    </div>
                    <div class="form-group">
                        <label for="phone_number">Phone Number</label>
                        <input type="text" class="form-control" id="phone_number" placeholder="Enter Your Phone Number">
                    </div>
                    <div class="form-group">
                        <label for="date_of_birth">Date of Birth</label>
                        <input type="text" class="form-control" id="date_of_birth" placeholder="Enter Your Date of Birth">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="Enter Full Adress">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">City</label>
                            <input type="text" class="form-control" id="inputCity" placeholder="Enter Your City">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputDivision">Division</label>
                            <select id="inputDivision" class="form-control">
                                <option selected>Choose...</option>
                                <option>Dhaka</option>
                                <option>Barishal</option>
                                <option>Chittagong</option>
                                <option>Rajshahi</option>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="inputZip">Zip</label>
                            <input type="text" class="form-control" id="inputZip">
                        </div>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="file" id="formFile">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>

                </div>
            </div>
        </div>
        <div class="col-xl-2 col-lg-3"></div>
    </div>
</asp:Content>
