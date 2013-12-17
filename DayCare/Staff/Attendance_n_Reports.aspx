<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Attendance_n_Reports.aspx.vb" Inherits="Staff_Attendance_n_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .auto-style3 {
            width: 60%;
        }
        .auto-style5 {
            width: 347px;
        }
        .auto-style6 {
            width: 102px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3 class="cntl_h3">Add/Update a Child Attendance, Meal, and Accident Reports</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Staff" runat="server"></asp:Label><br /><br />

    <%End If%>




    <asp:Button ID="btn_Child_Info" runat="server" Text="View Child Information" Width="142px" Height="32px" CssClass="staff_btn" />
    <asp:Button ID="btn_Child_Attendance" runat="server" Text="Child Attendance" Width="115px" Height="32px" CssClass="staff_btn" />
    <asp:Button ID="btn_Meal_Report" runat="server" Text="Meal Report" Width="115px" Height="32px" CssClass="staff_btn" />
    <asp:Button ID="btn_Accident_Type" runat="server" Text="Accident Type" Width="115px" Height="32px" CssClass="staff_btn" />
    <asp:Button ID="btn_Accident_Report" runat="server" Text="Accident Report" Width="115px" Height="32px" CssClass="staff_btn" />




    <asp:MultiView ID="Attendance_Reports_MultiView" runat="server">


    <asp:View ID="Child_Information_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" SelectCommand="SELECT * FROM [CHILD]"></asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" CSSClass="staff_gv" runat="server" AutoGenerateColumns="False" DataKeyNames="Child_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" ReadOnly="True" SortExpression="Child_ID" />
                <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Physician_ID" HeaderText="Physician ID" SortExpression="Physician_ID" />
                <asp:BoundField DataField="Class_ID" HeaderText="Class ID" SortExpression="Class_ID" />
                <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Contact ID" SortExpression="Emergency_Contact_ID" />
                <asp:BoundField DataField="Mother_ID" HeaderText="Mother ID" SortExpression="Mother_ID" />
                <asp:BoundField DataField="Father_ID" HeaderText="Father ID" SortExpression="Father_ID" />
                <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian ID" SortExpression="Gaurdian_ID" />
                <asp:BoundField DataField="Address_Note" HeaderText="Address Note" SortExpression="Address_Note" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start Date" SortExpression="Start_Date" DataFormatString="{0:d}" />
            </Columns>
        </asp:GridView>
        </asp:View>

    <asp:View ID="Child_Attendance_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" 
            DeleteCommand="DELETE FROM [CHILD_ATTENDANCE] WHERE [Attendance_ID] = @Attendance_ID" 
            InsertCommand="INSERT INTO [CHILD_ATTENDANCE] ([Child_ID], [Check_In], [Check_Out], [Date]) VALUES (@Child_ID, @Check_In, @Check_Out, @Date)" 
            SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]" 
            UpdateCommand="UPDATE [CHILD_ATTENDANCE] SET [Check_Out] = @Check_Out WHERE [Attendance_ID] = @Attendance_ID">
            <DeleteParameters>
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </DeleteParameters>

            <InsertParameters>
                <asp:Parameter Name="Child_ID" Type="Int32" />
                <asp:Parameter Name="Check_In" Type="String" />
                <asp:Parameter Name="Check_Out" Type="String" />
                <asp:Parameter Name="Date" Type="DateTime" />
            </InsertParameters>

            <UpdateParameters>
                
               
                <asp:Parameter Name="Check_Out" Type="String" />
                
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>
       
        <asp:GridView ID="GridView5" CSSClass="staff_gv" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="Attendance_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" ReadOnly="True" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="True" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Check_In" HeaderText="Check-in Time" SortExpression="Check_In" ReadOnly="True" />
                <asp:TemplateField HeaderText="Check-out Time" SortExpression="Check_Out">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Check_Out") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" SetFocusOnError="True" ErrorMessage="Enter a valid time &amp;quot;hh:mm AM&amp;quot;" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Check_Out") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField EditText="Add Check-out" HeaderText="Update" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" 
            DeleteCommand="DELETE FROM [CHILD_ATTENDANCE] WHERE [Attendance_ID] = @Attendance_ID" 
            
            InsertCommand="INSERT INTO [CHILD_ATTENDANCE] ([Attendance_ID], [Start_Date], [Child_ID], [Check_In], [Check_Out], [End_Date]) VALUES (@Attendance_ID, @Start_Date, @Child_ID, @Check_In, @Check_Out, @End_Date)" 
            SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]" 
            UpdateCommand="UPDATE [CHILD_ATTENDANCE] SET [Check_Out] = @Check_Out WHERE [Attendance_ID] = @Attendance_ID">
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
                
                
                
                <asp:Parameter Name="Check_Out" Type="DateTime" />
                
                <asp:Parameter Name="Attendance_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Panel ID="Panel1" runat="server" DefaultButton="Insert_btn">
        <table class="auto-style3">
            
            <tr>
                <td class="auto-style6">Child ID:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="Child_ID_tb" runat="server" ></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Child_ID_tb" validationgroup="checkingrp" ErrorMessage="*" ></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Child_ID_tb" validationgroup="checkingrp" ErrorMessage="Enter a valid Id Number" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                      </td>
            </tr>
            <tr>
                <td class="auto-style6">Date:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="Date_tb" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Date_tb" validationgroup="checkingrp" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:ImageButton ID="Calendar_img_btn" runat="server" Height="18px" ImageUrl="~/images/calendar.jpg" Width="20px" />
                     <br />
                    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="153px" Visible="False" Width="161px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Check in Time:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="Checkin_Time_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Checkin_Time_tb" validationgroup="checkingrp" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Checkin_Time_tb" validationgroup="checkingrp" ErrorMessage="Enter a valid time &quot;hh:mm AM&quot;" SetFocusOnError="True" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <!-- <tr>
                <td class="auto-style4">
                    Check out Time:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="Checkout_Time_tb" runat="server"></asp:TextBox>
                </td>
            </tr> -->
            <tr>
                <td class="auto-style6">
                    <asp:Button ID="Insert_btn" runat="server" Text="Insert" UseSubmitBehavior="true" validationgroup="checkingrp" />
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Cancel_btn" runat="server" Text="Cancel" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">
                    
                    &nbsp;</td>
            </tr>
        </table>
            </asp:Panel>
        <br />
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
        
        <asp:GridView ID="GridView4" CSSClass="staff_gv"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Meal_ID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Meal_Name" HeaderText="Meal Name" SortExpression="Meal_Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Update" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [MEAL_REPORT] WHERE [Meal_ID] = @Meal_ID" InsertCommand="INSERT INTO [MEAL_REPORT] ([Meal_Name], [Description], [Child_ID]) VALUES (@Meal_Name, @Description, @Child_ID)" SelectCommand="SELECT * FROM [MEAL_REPORT]" UpdateCommand="UPDATE [MEAL_REPORT] SET [Meal_Name] = @Meal_Name, [Description] = @Description, [Child_ID] = @Child_ID WHERE [Meal_ID] = @Meal_ID">
            <DeleteParameters>
                <asp:Parameter Name="Meal_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
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
        <asp:DetailsView ID="DetailsView3"  CSSClass="staff_dv" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Meal_ID" DataSourceID="SqlDataSource7" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Meal_ID" HeaderText="Meal_ID" SortExpression="Meal_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Meal_Name" HeaderText="Meal Name" SortExpression="Meal_Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
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
        
        <asp:GridView ID="GridView3" CSSClass="staff_gv"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Type_ID" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Type_ID" HeaderText="Type ID" ReadOnly="True" SortExpression="Type_ID" />
                <asp:BoundField DataField="Short_Description" HeaderText="Short Description" SortExpression="Short_Description" />
                <asp:BoundField DataField="Long_Description" HeaderText="Long Description" SortExpression="Long_Description" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Update" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_TYPE] WHERE [Type_ID] = @Type_ID" InsertCommand="INSERT INTO [ACCIDENT_TYPE] ([Short_Description], [Long_Description]) VALUES (@Short_Description, @Long_Description)" SelectCommand="SELECT * FROM [ACCIDENT_TYPE]" UpdateCommand="UPDATE [ACCIDENT_TYPE] SET [Short_Description] = @Short_Description, [Long_Description] = @Long_Description WHERE [Type_ID] = @Type_ID">
            <DeleteParameters>
                <asp:Parameter Name="Type_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
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
        <asp:DetailsView ID="DetailsView4" CSSClass="staff_dv" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Type_ID" DataSourceID="SqlDataSource8" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" ReadOnly="True" SortExpression="Type_ID" InsertVisible="False" />
                <asp:BoundField DataField="Short_Description" HeaderText="Short Description" SortExpression="Short_Description" />
                <asp:BoundField DataField="Long_Description" HeaderText="Long Description" SortExpression="Long_Description" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Accident_Report_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_REPORT] WHERE [Report_ID] = @Report_ID" InsertCommand="INSERT INTO [ACCIDENT_REPORT] ([Date], [Note], [Child_ID], [Type_ID]) VALUES (@Date, @Note, @Child_ID, @Type_ID)" SelectCommand="SELECT * FROM [ACCIDENT_REPORT]" UpdateCommand="UPDATE [ACCIDENT_REPORT] SET [Date] = @Date, [Note] = @Note, [Child_ID] = @Child_ID, [Type_ID] = @Type_ID WHERE [Report_ID] = @Report_ID">
            <DeleteParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
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
        
        <asp:GridView ID="GridView2" CSSClass="staff_gv"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Report_ID" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="Report_ID" HeaderText="Report ID" InsertVisible="False" ReadOnly="True" SortExpression="Report_ID" />
                <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Type_ID" HeaderText="Type ID" SortExpression="Type_ID" />
                <asp:CommandField HeaderText="Update" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [ACCIDENT_REPORT] WHERE [Report_ID] = @Report_ID" InsertCommand="INSERT INTO [ACCIDENT_REPORT] ([Date], [Note], [Child_ID], [Type_ID]) VALUES (@Date, @Note, @Child_ID, @Type_ID)" SelectCommand="SELECT * FROM [ACCIDENT_REPORT]" UpdateCommand="UPDATE [ACCIDENT_REPORT] SET [Date] = @Date, [Note] = @Note, [Child_ID] = @Child_ID, [Type_ID] = @Type_ID WHERE [Report_ID] = @Report_ID">
            <DeleteParameters>
                <asp:Parameter Name="Report_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
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
        <asp:DetailsView ID="DetailsView1"  CSSClass="staff_dv" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Report_ID" DataSourceID="SqlDataSource9" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Report_ID" HeaderText="Report_ID" ReadOnly="True" SortExpression="Report_ID" InsertVisible="False" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" />
                <asp:BoundField DataField="Type_ID" HeaderText="Type ID" SortExpression="Type_ID" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" HeaderText="Update" />
            </Fields>
        </asp:DetailsView>
        </asp:View>

    </asp:MultiView>


</asp:Content>

