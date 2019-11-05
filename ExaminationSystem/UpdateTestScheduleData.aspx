<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateTestScheduleData.aspx.cs" Inherits="ExaminationSystem.UpdateTestScheduleData" %>
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
                <asp:DropDownList ID="ddl_TestSchedule" Style="text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_TestSchedule_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="exampleCandidateID">Candidate ID <span style="color: red;">*</span></label>
                <asp:DropDownList ID="ddl_Candidate" Style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" CssClass="form-control" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="exampleBatchID">Batch ID <span style="color: red;">*</span></label>
                <asp:DropDownList ID="ddl_Batch" Style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" CssClass="form-control" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="exampleTestName">Test Name <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtTestName" class="form-control" runat="server" placeholder="Test Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTestName" ValidationGroup="Save" runat="server" ControlToValidate="txtTestName" ErrorMessage="Please enter test name" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputTimeAllowed">Time Allowed</label>
                <asp:TextBox ID="txtTimeAllowed" class="form-control" runat="server" placeholder="Time Allowed"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTimeAllowed" runat="server" ValidationGroup="Save" ControlToValidate="txtTimeAllowed" ErrorMessage="Please enter time allowed" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputNumberOfQuestions">Number Of Questions</label>
                <asp:TextBox ID="txtNumberOfQuestions" class="form-control" runat="server" placeholder="Number Of Questions"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberOfQuestions" runat="server" ValidationGroup="Save" ControlToValidate="txtNumberOfQuestions" ErrorMessage="Please enter Number Of Questions" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputTestStartDate">Test Start Date</label>
                <asp:TextBox ID="txtTestStartDate" class="form-control" runat="server" placeholder="Test Start Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTestStartDate" runat="server" ValidationGroup="Save" ControlToValidate="txtTestStartDate" ErrorMessage="Please enter mobile" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputTestEndDate">Test End Date</label>
                <asp:TextBox ID="txtTestEndDate" class="form-control" runat="server" placeholder="Test End Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTestEndDate" runat="server" ValidationGroup="Save" ControlToValidate="txtTestEndDate" ErrorMessage="Please enter Test End Date" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputMaxMarks">Max Marks</label>
                <asp:TextBox ID="txtMaxMarks" class="form-control" runat="server" placeholder="Max Marks"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMaxMarks" runat="server" ValidationGroup="Save" ControlToValidate="txtMaxMarks" ErrorMessage="Please enter Max Marks" ForeColor="#993333"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="exampleInputPassMarks">Pass Marks</label>
                <asp:TextBox ID="txtPassMarks" class="form-control" runat="server" placeholder="Pass Marks"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassMarks" runat="server" ValidationGroup="Save" ControlToValidate="txtPassMarks" ErrorMessage="Please enter Pass Marks" ForeColor="#993333"></asp:RequiredFieldValidator>
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
                    <asp:BoundField DataField="TestName" HeaderText="Test Name" />
                    <asp:BoundField DataField="TimeAllowed" HeaderText="Time Allowed" />
                    <asp:BoundField DataField="NumberOfQuestions" HeaderText="Number Of Questions" />
                    <asp:BoundField DataField="TestStartDate" HeaderText="Test Start Date" />
                    <asp:BoundField DataField="TestEndDate" HeaderText="Test End Date" />
                    <asp:BoundField DataField="MaxMarks" HeaderText="Max Marks" />
                    <asp:BoundField DataField="PassMarks" HeaderText="Pass Marks" />
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
