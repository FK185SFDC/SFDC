<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Staff_Payroll.aspx.vb" Inherits="Admin_Staff_Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <h3 class="cntl_h3">Add/Update Staff and Payroll Information</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Admin_Staff" runat="server"></asp:Label><br /><br />

    <%End If%>
     <asp:Button ID="btb_Staff" runat="server" Text="Staff" Width="105px" Height="32px" />
     <asp:Button ID="btn_Payroll" runat="server" Text="Payroll" Width="105px" Height="32px" />



    <asp:MultiView ID="Staff_Multiview" runat="server">


        <asp:View ID="Staff_View" runat="server">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [STAFF] WHERE [Staff_ID] = @Staff_ID" InsertCommand="INSERT INTO [STAFF] ([Staff_ID], [F_Name], [L_Name], [Title], [Address], [City], [State], [Zip_Code], [Phone], [Start_Date], [End_Date], [Gender], [Class_ID]) VALUES (@Staff_ID, @F_Name, @L_Name, @Title, @Address, @City, @State, @Zip_Code, @Phone, @Start_Date, @End_Date, @Gender, @Class_ID)" SelectCommand="SELECT * FROM [STAFF]" UpdateCommand="UPDATE [STAFF] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Title] = @Title, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Phone] = @Phone, [Start_Date] = @Start_Date, [End_Date] = @End_Date, [Gender] = @Gender, [Class_ID] = @Class_ID WHERE [Staff_ID] = @Staff_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Staff_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Staff_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Start_Date" Type="DateTime" />
                    <asp:Parameter Name="End_Date" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Start_Date" Type="DateTime" />
                    <asp:Parameter Name="End_Date" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Staff_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Staff_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Staff_ID" HeaderText="Staff ID" ReadOnly="True" SortExpression="Staff_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Start_Date" HeaderText="Start Date" SortExpression="Start_Date" />
                    <asp:BoundField DataField="End_Date" HeaderText="End Date" SortExpression="End_Date" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" SortExpression="Class_ID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Staff_ID" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="Staff_ID" HeaderText="Staff ID" ReadOnly="True" SortExpression="Staff_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Start_Date" HeaderText="Start Date" SortExpression="Start_Date" />
                    <asp:BoundField DataField="End_Date" HeaderText="End Date" SortExpression="End_Date" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" SortExpression="Class_ID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

        </asp:View>

        <asp:View ID="Payroll_View" runat="server">

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [PAYROLL] WHERE [Payroll_ID] = @Payroll_ID" InsertCommand="INSERT INTO [PAYROLL] ([Payroll_ID], [Check_In], [Check_Out], [Hours], [Salary], [Staff_ID]) VALUES (@Payroll_ID, @Check_In, @Check_Out, @Hours, @Salary, @Staff_ID)" SelectCommand="SELECT * FROM [PAYROLL]" UpdateCommand="UPDATE [PAYROLL] SET [Check_In] = @Check_In, [Check_Out] = @Check_Out, [Hours] = @Hours, [Salary] = @Salary, [Staff_ID] = @Staff_ID WHERE [Payroll_ID] = @Payroll_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Payroll_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Payroll_ID" Type="Int32" />
                    <asp:Parameter Name="Check_In" Type="DateTime" />
                    <asp:Parameter Name="Check_Out" Type="DateTime" />
                    <asp:Parameter Name="Hours" Type="Decimal" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="Staff_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Check_In" Type="DateTime" />
                    <asp:Parameter Name="Check_Out" Type="DateTime" />
                    <asp:Parameter Name="Hours" Type="Decimal" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="Staff_ID" Type="Int32" />
                    <asp:Parameter Name="Payroll_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Payroll_ID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Payroll_ID" HeaderText="Payroll ID" ReadOnly="True" SortExpression="Payroll_ID" />
                    <asp:BoundField DataField="Check_In" HeaderText="Check In" SortExpression="Check_In" />
                    <asp:BoundField DataField="Check_Out" HeaderText="Check Out" SortExpression="Check_Out" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Staff_ID" HeaderText="Staff ID" SortExpression="Staff_ID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Payroll_ID" DataSourceID="SqlDataSource2">
                <Fields>
                    <asp:BoundField DataField="Payroll_ID" HeaderText="Payroll ID" ReadOnly="True" SortExpression="Payroll_ID" />
                    <asp:BoundField DataField="Check_In" HeaderText="Check In" SortExpression="Check_In" />
                    <asp:BoundField DataField="Check_Out" HeaderText="Check Out" SortExpression="Check_Out" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Staff_ID" HeaderText="Staff ID" SortExpression="Staff_ID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

        </asp:View>











    </asp:MultiView>






















</asp:Content>

