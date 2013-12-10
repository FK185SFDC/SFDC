<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Attendance_n_Reports.aspx.vb" Inherits="Staff_Attendance_n_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3 class="cntl_h3">Add/Update a Child Attendance, Meal, and Accident Reports</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Staff" runat="server"></asp:Label><br /><br />

    <%End If%>




    <asp:Button ID="btn_Child_Info" runat="server" Text="View Child Information" Width="142px" Height="32px" />
    <asp:Button ID="btn_Child_Attendance" runat="server" Text="Child Attendance" Width="115px" Height="32px" />
    <asp:Button ID="btn_Meal_Report" runat="server" Text="Meal Report" Width="115px" Height="32px" />
    <asp:Button ID="btn_Accident_Type" runat="server" Text="Accident Type" Width="115px" Height="32px" />
    <asp:Button ID="btn_Accident_Report" runat="server" Text="Accident Report" Width="115px" Height="32px" />




    <asp:MultiView ID="Attendance_Reports_MultiView" runat="server">


    <asp:View ID="Child_Information_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" SelectCommand="SELECT * FROM [CHILD]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Child_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" ReadOnly="True" SortExpression="Child_ID" />
                <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                <asp:BoundField DataField="L_Name" HeaderText="L_Name" SortExpression="L_Name" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Physician_ID" HeaderText="Physician_ID" SortExpression="Physician_ID" />
                <asp:BoundField DataField="Class_ID" HeaderText="Class_ID" SortExpression="Class_ID" />
                <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Emergency_Contact_ID" SortExpression="Emergency_Contact_ID" />
                <asp:BoundField DataField="Mother_ID" HeaderText="Mother_ID" SortExpression="Mother_ID" />
                <asp:BoundField DataField="Father_ID" HeaderText="Father_ID" SortExpression="Father_ID" />
                <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian_ID" SortExpression="Gaurdian_ID" />
                <asp:BoundField DataField="Address_Note" HeaderText="Address_Note" SortExpression="Address_Note" />
            </Columns>
        </asp:GridView>
        </asp:View>

    <asp:View ID="Child_Attendance_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CHILD_ATTENDANCE] WHERE [Attendance_ID] = @Attendance_ID" InsertCommand="INSERT INTO [CHILD_ATTENDANCE] ([Attendance_ID], [Start_Date], [Child_ID], [Check_In], [Check_Out], [End_Date]) VALUES (@Attendance_ID, @Start_Date, @Child_ID, @Check_In, @Check_Out, @End_Date)" SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]" UpdateCommand="UPDATE [CHILD_ATTENDANCE] SET [Start_Date] = @Start_Date, [Child_ID] = @Child_ID, [Check_In] = @Check_In, [Check_Out] = @Check_Out, [End_Date] = @End_Date WHERE [Attendance_ID] = @Attendance_ID">
            <DeleteParameters>
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
                <asp:Parameter Name="Start_Date" Type="DateTime" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Check_In" Type="DateTime" />
                <asp:Parameter Name="Check_Out" Type="DateTime" />
                <asp:Parameter Name="End_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Start_Date" Type="DateTime" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Check_In" Type="DateTime" />
                <asp:Parameter Name="Check_Out" Type="DateTime" />
                <asp:Parameter Name="End_Date" Type="DateTime" />
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Attendance_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Attendance_ID" HeaderText="Attendance_ID" ReadOnly="True" SortExpression="Attendance_ID" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Check_In" HeaderText="Check_In" SortExpression="Check_In" />
                <asp:BoundField DataField="Check_Out" HeaderText="Check_Out" SortExpression="Check_Out" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CHILD_ATTENDANCE] WHERE [Attendance_ID] = @Attendance_ID" InsertCommand="INSERT INTO [CHILD_ATTENDANCE] ([Attendance_ID], [Start_Date], [Child_ID], [Check_In], [Check_Out], [End_Date]) VALUES (@Attendance_ID, @Start_Date, @Child_ID, @Check_In, @Check_Out, @End_Date)" SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]" UpdateCommand="UPDATE [CHILD_ATTENDANCE] SET [Start_Date] = @Start_Date, [Child_ID] = @Child_ID, [Check_In] = @Check_In, [Check_Out] = @Check_Out, [End_Date] = @End_Date WHERE [Attendance_ID] = @Attendance_ID">
            <DeleteParameters>
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
                <asp:Parameter Name="Start_Date" Type="DateTime" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Check_In" Type="DateTime" />
                <asp:Parameter Name="Check_Out" Type="DateTime" />
                <asp:Parameter Name="End_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Start_Date" Type="DateTime" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Check_In" Type="DateTime" />
                <asp:Parameter Name="Check_Out" Type="DateTime" />
                <asp:Parameter Name="End_Date" Type="DateTime" />
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Attendance_ID" DataSourceID="SqlDataSource6" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Attendance_ID" HeaderText="Attendance_ID" ReadOnly="True" SortExpression="Attendance_ID" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Check_In" HeaderText="Check_In" SortExpression="Check_In" />
                <asp:BoundField DataField="Check_Out" HeaderText="Check_Out" SortExpression="Check_Out" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Meal_Report_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [MEAL_REPORT] WHERE [Meal_ID] = @Meal_ID" InsertCommand="INSERT INTO [MEAL_REPORT] ([Meal_ID], [Meal_Name], [Description], [Child_ID]) VALUES (@Meal_ID, @Meal_Name, @Description, @Child_ID)" SelectCommand="SELECT * FROM [MEAL_REPORT]" UpdateCommand="UPDATE [MEAL_REPORT] SET [Meal_Name] = @Meal_Name, [Description] = @Description, [Child_ID] = @Child_ID WHERE [Meal_ID] = @Meal_ID">
            <DeleteParameters>
                <asp:Parameter Name="Meal_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Meal_ID" Type="Int32" />
                <asp:Parameter Name="Meal_Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Meal_Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Meal_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Meal_ID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Meal_ID" HeaderText="Meal_ID" ReadOnly="True" SortExpression="Meal_ID" />
                <asp:BoundField DataField="Meal_Name" HeaderText="Meal_Name" SortExpression="Meal_Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [MEAL_REPORT] WHERE [Meal_ID] = @Meal_ID" InsertCommand="INSERT INTO [MEAL_REPORT] ([Meal_ID], [Meal_Name], [Description], [Child_ID]) VALUES (@Meal_ID, @Meal_Name, @Description, @Child_ID)" SelectCommand="SELECT * FROM [MEAL_REPORT]" UpdateCommand="UPDATE [MEAL_REPORT] SET [Meal_Name] = @Meal_Name, [Description] = @Description, [Child_ID] = @Child_ID WHERE [Meal_ID] = @Meal_ID">
            <DeleteParameters>
                <asp:Parameter Name="Meal_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Meal_ID" Type="Int32" />
                <asp:Parameter Name="Meal_Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Meal_Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Meal_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Meal_ID" DataSourceID="SqlDataSource7" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Meal_ID" HeaderText="Meal_ID" ReadOnly="True" SortExpression="Meal_ID" />
                <asp:BoundField DataField="Meal_Name" HeaderText="Meal_Name" SortExpression="Meal_Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
                <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Accident_Type_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_TYPE] WHERE [Type_ID] = @Type_ID" InsertCommand="INSERT INTO [ACCIDENT_TYPE] ([Type_ID], [Short_Description], [Long_Description]) VALUES (@Type_ID, @Short_Description, @Long_Description)" SelectCommand="SELECT * FROM [ACCIDENT_TYPE]" UpdateCommand="UPDATE [ACCIDENT_TYPE] SET [Short_Description] = @Short_Description, [Long_Description] = @Long_Description WHERE [Type_ID] = @Type_ID">
            <DeleteParameters>
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type_ID" Type="Int32" />
                <asp:Parameter Name="Short_Description" Type="String" />
                <asp:Parameter Name="Long_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Short_Description" Type="String" />
                <asp:Parameter Name="Long_Description" Type="String" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Type_ID" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" ReadOnly="True" SortExpression="Type_ID" />
                <asp:BoundField DataField="Short_Description" HeaderText="Short_Description" SortExpression="Short_Description" />
                <asp:BoundField DataField="Long_Description" HeaderText="Long_Description" SortExpression="Long_Description" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_TYPE] WHERE [Type_ID] = @Type_ID" InsertCommand="INSERT INTO [ACCIDENT_TYPE] ([Type_ID], [Short_Description], [Long_Description]) VALUES (@Type_ID, @Short_Description, @Long_Description)" SelectCommand="SELECT * FROM [ACCIDENT_TYPE]" UpdateCommand="UPDATE [ACCIDENT_TYPE] SET [Short_Description] = @Short_Description, [Long_Description] = @Long_Description WHERE [Type_ID] = @Type_ID">
            <DeleteParameters>
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type_ID" Type="Int32" />
                <asp:Parameter Name="Short_Description" Type="String" />
                <asp:Parameter Name="Long_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Short_Description" Type="String" />
                <asp:Parameter Name="Long_Description" Type="String" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Type_ID" DataSourceID="SqlDataSource8" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" ReadOnly="True" SortExpression="Type_ID" />
                <asp:BoundField DataField="Short_Description" HeaderText="Short_Description" SortExpression="Short_Description" />
                <asp:BoundField DataField="Long_Description" HeaderText="Long_Description" SortExpression="Long_Description" />
                <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Accident_Report_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_REPORT] WHERE [Report_ID] = @Report_ID" InsertCommand="INSERT INTO [ACCIDENT_REPORT] ([Report_ID], [Date], [Note], [Child_ID], [Type_ID]) VALUES (@Report_ID, @Date, @Note, @Child_ID, @Type_ID)" SelectCommand="SELECT * FROM [ACCIDENT_REPORT]" UpdateCommand="UPDATE [ACCIDENT_REPORT] SET [Date] = @Date, [Note] = @Note, [Child_ID] = @Child_ID, [Type_ID] = @Type_ID WHERE [Report_ID] = @Report_ID">
            <DeleteParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Report_ID" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Report_ID" HeaderText="Report_ID" ReadOnly="True" SortExpression="Report_ID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" SortExpression="Type_ID" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_REPORT] WHERE [Report_ID] = @Report_ID" InsertCommand="INSERT INTO [ACCIDENT_REPORT] ([Report_ID], [Date], [Note], [Child_ID], [Type_ID]) VALUES (@Report_ID, @Date, @Note, @Child_ID, @Type_ID)" SelectCommand="SELECT * FROM [ACCIDENT_REPORT]" UpdateCommand="UPDATE [ACCIDENT_REPORT] SET [Date] = @Date, [Note] = @Note, [Child_ID] = @Child_ID, [Type_ID] = @Type_ID WHERE [Report_ID] = @Report_ID">
            <DeleteParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Type_ID" Type="Int32" />
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Report_ID" DataSourceID="SqlDataSource9">
            <Fields>
                <asp:BoundField DataField="Report_ID" HeaderText="Report_ID" ReadOnly="True" SortExpression="Report_ID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child_ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" SortExpression="Type_ID" />
                <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    



    </asp:MultiView>









</asp:Content>

