<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BatchData.aspx.cs" Inherits="ExaminationSystem.BatchData" %>

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
                <label for="exampleBatchName">Batch Name <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtBatchName" class="form-control" runat="server" placeholder="Batch Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBatchName" ValidationGroup="Save" runat="server" ControlToValidate="txtBatchName" ErrorMessage="Please enter batch name" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleCourse">Course <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtCourse" class="form-control" runat="server" placeholder="Course"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCourse" ValidationGroup="Save" runat="server" ControlToValidate="txtCourse" ErrorMessage="Please enter course" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputNoOfCandidate">No Of Candidate</label>
                <asp:TextBox ID="txtNoOfCandidate" class="form-control" runat="server" placeholder="No Of Candidate"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNoOfCandidate" runat="server" ValidationGroup="Save" ControlToValidate="txtNoOfCandidate" ErrorMessage="Please enter no of candidate" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Submit" ValidationGroup="Save" runat="server" class="btn btn-primary" Text="Submit" OnClick="Submit_Click" />
            <asp:Button ID="Reset" runat="server" class="btn btn-danger" Text="Reset" OnClick="Reset_Click" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="BatchName" HeaderText="Batch Name" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="NoOfCandidate" HeaderText="No Of Candidate" />
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
