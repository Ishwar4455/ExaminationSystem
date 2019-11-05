<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateCandidateData.aspx.cs" Inherits="ExaminationSystem.UpdateCandidateData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
                <h1 class="title-single">Examination System</h1>
            </div>
        </div>
        <div class="col-md-12 col-lg-4">
            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a runat="server" href="~/">Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Examination
                    </li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class=" col-md-12">
            <div class="form-group">
                <asp:DropDownList ID="ddl_Candidate" Style="text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Candidate_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="exampleRegisterationID">Registeration Id <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtRegisterationID" class="form-control" runat="server" placeholder="Registeration ID "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegisterationID" ValidationGroup="Save" runat="server" ControlToValidate="txtRegisterationID" ErrorMessage="Please enter Registeration ID" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleCourse">Candidate Name <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtCandidateName" class="form-control" runat="server" placeholder="CandidateName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCandidateName" ValidationGroup="Save" runat="server" ControlToValidate="txtCandidateName" ErrorMessage="Please enter candidate name" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputFatherName">Father Name</label>
                <asp:TextBox ID="txtFatherName" class="form-control" runat="server" placeholder="No Of Candidate"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFatherName" runat="server" ValidationGroup="Save" ControlToValidate="txtFatherName" ErrorMessage="Please enter father name" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputMotherName">Mother Name</label>
                <asp:TextBox ID="txtMotherName" class="form-control" runat="server" placeholder="Mother Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMotherName" runat="server" ValidationGroup="Save" ControlToValidate="txtMotherName" ErrorMessage="Please enter mother name" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputMobile">Mobile</label>
                <asp:TextBox ID="txtMobile" class="form-control" runat="server" placeholder="Mobile"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ValidationGroup="Save" ControlToValidate="txtMobile" ErrorMessage="Please enter mobile" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Update" ValidationGroup="Save" runat="server" class="btn btn-primary" Text="Update" OnClick="Update_Click" />
            <asp:Button ID="Delete" runat="server" class="btn btn-danger" Text="Delete" OnClick="Delete_Click" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" />
                    <asp:BoundField DataField="RegisterationID" HeaderText="Registeration ID" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                    <asp:BoundField DataField="MotherName" HeaderText="Mother Name" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
