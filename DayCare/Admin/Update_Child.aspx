<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" 
    CodeFile="Update_Child.aspx.vb" Inherits="Admin_Update_Child" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h3 class="cntl_h3">Add/Update a Child Information</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Admin" runat="server"></asp:Label><br /><br />

    <%End If%>
    
    <asp:Button ID="btn_Mother" runat="server" Text="Mother" Width="105px" Height="32px" />
    <asp:Button ID="btn_Father" runat="server" Text="Father" Width="105px" Height="32px" />
    <asp:Button ID="btn_Emergency" runat="server" Text="Emergency" Width="105px" Height="32px" />
    <asp:Button ID="btn_Medical" runat="server" Text="Medical" Width="105px" Height="32px" />
    <asp:Button ID="btn_Gaurdian" runat="server" Text="Gaurdian" Width="105px" Height="32px" />
    <asp:Button ID="btn_Class" runat="server" Text="Class" Width="105px" Height="32px" />
    <asp:Button ID="btn_Child" runat="server" Text="Child" Width="105px" Height="32px" />
    <br />



    <asp:MultiView ID="MultiView1" runat="server">
        


        <asp:View ID="Mother_View" runat="server"><br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" 
                DeleteCommand="DELETE FROM [MOTHER] WHERE [Mother_ID] = @Mother_ID" 
                InsertCommand="INSERT INTO [MOTHER] ([Mother_ID], [F_Name], [L_Name], [Address], [City], [State], [Zip_Code], [Email], [Phone]) VALUES (@Mother_ID, @F_Name, @L_Name, @Address, @City, @State, @Zip_Code, @Email, @Phone)" 
                SelectCommand="SELECT * FROM [MOTHER]" 
                UpdateCommand="UPDATE [MOTHER] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Email] = @Email, [Phone] = @Phone WHERE [Mother_ID] = @Mother_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource><br />
            <asp:DetailsView ID="Mother_DV" runat="server" Height="50px" Width="226px" 
                AutoGenerateRows="False" DataKeyNames="Mother_ID" DataSourceID="SqlDataSource1" CellPadding="4" 
                ForeColor="#333333" GridLines="None" DefaultMode="Insert">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother ID" ReadOnly="True" 
                        SortExpression="Mother_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ShowInsertButton="True" ButtonType="Button" InsertText="Add New" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>

            <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="*All fields are required."></asp:Label>
            <br />
            <br />

            <br />
            <asp:GridView ID="Mother_GV" runat="server" AllowPaging="True" AllowSorting="True" 
                DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Mother_ID" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother ID" ReadOnly="True" 
                        SortExpression="Mother_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </asp:View>

        <asp:View ID="Father_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [FATHER] WHERE [Father_ID] = @Father_ID" InsertCommand="INSERT INTO [FATHER] ([Father_ID], [F_Name], [L_NAme], [Address], [City], [State], [Zip_Code], [Email], [Phone]) VALUES (@Father_ID, @F_Name, @L_NAme, @Address, @City, @State, @Zip_Code, @Email, @Phone)" SelectCommand="SELECT * FROM [FATHER]" UpdateCommand="UPDATE [FATHER] SET [F_Name] = @F_Name, [L_NAme] = @L_NAme, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Email] = @Email, [Phone] = @Phone WHERE [Father_ID] = @Father_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_NAme" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_NAme" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Father_ID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Father_ID" HeaderText="Father ID" ReadOnly="True" SortExpression="Father_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_NAme" HeaderText="Last Name" SortExpression="L_NAme" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Father_ID" DataSourceID="SqlDataSource2" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Father_ID" HeaderText="Father ID" ReadOnly="True" SortExpression="Father_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_NAme" HeaderText="Last Name" SortExpression="L_NAme" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <br />
            <br />
        </asp:View>

        <asp:View ID="Emergency_Contact_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [EMERGENCY_CONTACT] WHERE [Emergency_Contact_ID] = @Emergency_Contact_ID" InsertCommand="INSERT INTO [EMERGENCY_CONTACT] ([Emergency_Contact_ID], [F_Name], [L_Name], [Phone_Home], [Phone_Work], [Phone_Cell]) VALUES (@Emergency_Contact_ID, @F_Name, @L_Name, @Phone_Home, @Phone_Work, @Phone_Cell)" SelectCommand="SELECT * FROM [EMERGENCY_CONTACT]" UpdateCommand="UPDATE [EMERGENCY_CONTACT] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Phone_Home] = @Phone_Home, [Phone_Work] = @Phone_Work, [Phone_Cell] = @Phone_Cell WHERE [Emergency_Contact_ID] = @Emergency_Contact_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Phone_Home" Type="String" />
                    <asp:Parameter Name="Phone_Work" Type="String" />
                    <asp:Parameter Name="Phone_Cell" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Phone_Home" Type="String" />
                    <asp:Parameter Name="Phone_Work" Type="String" />
                    <asp:Parameter Name="Phone_Cell" Type="String" />
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Emergency_Contact_ID" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Contact ID" ReadOnly="True" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Phone_Home" HeaderText="Phone Home" SortExpression="Phone_Home" />
                    <asp:BoundField DataField="Phone_Work" HeaderText="Phone Work" SortExpression="Phone_Work" />
                    <asp:BoundField DataField="Phone_Cell" HeaderText="Phone Cell" SortExpression="Phone_Cell" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Emergency_Contact_ID" DataSourceID="SqlDataSource3" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Contact ID" ReadOnly="True" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Phone_Home" HeaderText="Phone Home" SortExpression="Phone_Home" />
                    <asp:BoundField DataField="Phone_Work" HeaderText="Phone Work" SortExpression="Phone_Work" />
                    <asp:BoundField DataField="Phone_Cell" HeaderText="Phone Cell" SortExpression="Phone_Cell" />
                    <asp:CommandField ShowInsertButton="True" ButtonType="Button" InsertText="Add New" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Medical_Contact_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [MEDICAL_CONTACT] WHERE [Physician_ID] = @Physician_ID" InsertCommand="INSERT INTO [MEDICAL_CONTACT] ([Physician_ID], [Physician_FName], [Physician_LName], [Clinic_Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (@Physician_ID, @Physician_FName, @Physician_LName, @Clinic_Name, @Address, @City, @State, @Zip_Code, @Phone)" SelectCommand="SELECT * FROM [MEDICAL_CONTACT]" UpdateCommand="UPDATE [MEDICAL_CONTACT] SET [Physician_FName] = @Physician_FName, [Physician_LName] = @Physician_LName, [Clinic_Name] = @Clinic_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Phone] = @Phone WHERE [Physician_ID] = @Physician_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Physician_FName" Type="String" />
                    <asp:Parameter Name="Physician_LName" Type="String" />
                    <asp:Parameter Name="Clinic_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Physician_FName" Type="String" />
                    <asp:Parameter Name="Physician_LName" Type="String" />
                    <asp:Parameter Name="Clinic_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Physician_ID" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Physician_ID" HeaderText="Physician ID" ReadOnly="True" SortExpression="Physician_ID" />
                    <asp:BoundField DataField="Physician_FName" HeaderText="First Name" SortExpression="Physician_FName" />
                    <asp:BoundField DataField="Physician_LName" HeaderText="Last Name" SortExpression="Physician_LName" />
                    <asp:BoundField DataField="Clinic_Name" HeaderText="Clinic Name" SortExpression="Clinic_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [MEDICAL_CONTACT] WHERE [Physician_ID] = @Physician_ID" InsertCommand="INSERT INTO [MEDICAL_CONTACT] ([Physician_ID], [Physician_FName], [Physician_LName], [Clinic_Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (@Physician_ID, @Physician_FName, @Physician_LName, @Clinic_Name, @Address, @City, @State, @Zip_Code, @Phone)" SelectCommand="SELECT * FROM [MEDICAL_CONTACT]" UpdateCommand="UPDATE [MEDICAL_CONTACT] SET [Physician_FName] = @Physician_FName, [Physician_LName] = @Physician_LName, [Clinic_Name] = @Clinic_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Phone] = @Phone WHERE [Physician_ID] = @Physician_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Physician_FName" Type="String" />
                    <asp:Parameter Name="Physician_LName" Type="String" />
                    <asp:Parameter Name="Clinic_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Physician_FName" Type="String" />
                    <asp:Parameter Name="Physician_LName" Type="String" />
                    <asp:Parameter Name="Clinic_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Physician_ID" DataSourceID="SqlDataSource8" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Physician_ID" HeaderText="Physician ID" ReadOnly="True" SortExpression="Physician_ID" />
                    <asp:BoundField DataField="Physician_FName" HeaderText="First Name" SortExpression="Physician_FName" />
                    <asp:BoundField DataField="Physician_LName" HeaderText="Last Name" SortExpression="Physician_LName" />
                    <asp:BoundField DataField="Clinic_Name" HeaderText="Clinic Name" SortExpression="Clinic_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Gaurdian_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [GAURDIAN] WHERE [Gaurdian_ID] = @Gaurdian_ID" InsertCommand="INSERT INTO [GAURDIAN] ([Gaurdian_ID], [F_Name], [L_Name], [Address], [City], [State], [Zip_Code], [Email], [Phone]) VALUES (@Gaurdian_ID, @F_Name, @L_Name, @Address, @City, @State, @Zip_Code, @Email, @Phone)" SelectCommand="SELECT * FROM [GAURDIAN]" UpdateCommand="UPDATE [GAURDIAN] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Email] = @Email, [Phone] = @Phone WHERE [Gaurdian_ID] = @Gaurdian_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Gaurdian_ID" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian ID" ReadOnly="True" SortExpression="Gaurdian_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [GAURDIAN] WHERE [Gaurdian_ID] = @Gaurdian_ID" InsertCommand="INSERT INTO [GAURDIAN] ([Gaurdian_ID], [F_Name], [L_Name], [Address], [City], [State], [Zip_Code], [Email], [Phone]) VALUES (@Gaurdian_ID, @F_Name, @L_Name, @Address, @City, @State, @Zip_Code, @Email, @Phone)" SelectCommand="SELECT * FROM [GAURDIAN]" UpdateCommand="UPDATE [GAURDIAN] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Email] = @Email, [Phone] = @Phone WHERE [Gaurdian_ID] = @Gaurdian_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip_Code" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Gaurdian_ID" DataSourceID="SqlDataSource9" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian ID" ReadOnly="True" SortExpression="Gaurdian_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Class_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CLASS] WHERE [Class_ID] = @Class_ID" InsertCommand="INSERT INTO [CLASS] ([Class_ID], [Class_Name]) VALUES (@Class_ID, @Class_Name)" SelectCommand="SELECT * FROM [CLASS]" UpdateCommand="UPDATE [CLASS] SET [Class_Name] = @Class_Name WHERE [Class_ID] = @Class_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Class_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Class_Name" Type="String" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Class_ID" DataSourceID="SqlDataSource6" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" ReadOnly="True" SortExpression="Class_ID" />
                    <asp:BoundField DataField="Class_Name" HeaderText="Class Name" SortExpression="Class_Name" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CLASS] WHERE [Class_ID] = @Class_ID" InsertCommand="INSERT INTO [CLASS] ([Class_ID], [Class_Name]) VALUES (@Class_ID, @Class_Name)" SelectCommand="SELECT * FROM [CLASS]" UpdateCommand="UPDATE [CLASS] SET [Class_Name] = @Class_Name WHERE [Class_ID] = @Class_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Class_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Class_Name" Type="String" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Class_ID" DataSourceID="SqlDataSource10" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" ReadOnly="True" SortExpression="Class_ID" />
                    <asp:BoundField DataField="Class_Name" HeaderText="Class Name" SortExpression="Class_Name" />
                    <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Child_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CHILD] WHERE [Child_ID] = @Child_ID" InsertCommand="INSERT INTO [CHILD] ([Child_ID], [F_Name], [L_Name], [DOB], [Gender], [Physician_ID], [Class_ID], [Emergency_Contact_ID], [Mother_ID], [Father_ID], [Gaurdian_ID], [Address_Note]) VALUES (@Child_ID, @F_Name, @L_Name, @DOB, @Gender, @Physician_ID, @Class_ID, @Emergency_Contact_ID, @Mother_ID, @Father_ID, @Gaurdian_ID, @Address_Note)" SelectCommand="SELECT * FROM [CHILD]" UpdateCommand="UPDATE [CHILD] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [DOB] = @DOB, [Gender] = @Gender, [Physician_ID] = @Physician_ID, [Class_ID] = @Class_ID, [Emergency_Contact_ID] = @Emergency_Contact_ID, [Mother_ID] = @Mother_ID, [Father_ID] = @Father_ID, [Gaurdian_ID] = @Gaurdian_ID, [Address_Note] = @Address_Note WHERE [Child_ID] = @Child_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="Address_Note" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="Address_Note" Type="String" />
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="Child_ID" DataSourceID="SqlDataSource7" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Child_ID" HeaderText="Child ID" ReadOnly="True" SortExpression="Child_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Physician_ID" HeaderText="Physician ID" SortExpression="Physician_ID" />
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" SortExpression="Class_ID" />
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Emergency Contact ID" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother ID" SortExpression="Mother_ID" />
                    <asp:BoundField DataField="Father_ID" HeaderText="Father ID" SortExpression="Father_ID" />
                    <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian ID" SortExpression="Gaurdian_ID" />
                    <asp:BoundField DataField="Address_Note" HeaderText="Address Note" SortExpression="Address_Note" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CHILD] WHERE [Child_ID] = @Child_ID" InsertCommand="INSERT INTO [CHILD] ([Child_ID], [F_Name], [L_Name], [DOB], [Gender], [Physician_ID], [Class_ID], [Emergency_Contact_ID], [Mother_ID], [Father_ID], [Gaurdian_ID], [Address_Note]) VALUES (@Child_ID, @F_Name, @L_Name, @DOB, @Gender, @Physician_ID, @Class_ID, @Emergency_Contact_ID, @Mother_ID, @Father_ID, @Gaurdian_ID, @Address_Note)" SelectCommand="SELECT * FROM [CHILD]" UpdateCommand="UPDATE [CHILD] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [DOB] = @DOB, [Gender] = @Gender, [Physician_ID] = @Physician_ID, [Class_ID] = @Class_ID, [Emergency_Contact_ID] = @Emergency_Contact_ID, [Mother_ID] = @Mother_ID, [Father_ID] = @Father_ID, [Gaurdian_ID] = @Gaurdian_ID, [Address_Note] = @Address_Note WHERE [Child_ID] = @Child_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="Address_Note" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="F_Name" Type="String" />
                    <asp:Parameter Name="L_Name" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Physician_ID" Type="Int32" />
                    <asp:Parameter Name="Class_ID" Type="Int32" />
                    <asp:Parameter Name="Emergency_Contact_ID" Type="Int32" />
                    <asp:Parameter Name="Mother_ID" Type="Int32" />
                    <asp:Parameter Name="Father_ID" Type="Int32" />
                    <asp:Parameter Name="Gaurdian_ID" Type="Int32" />
                    <asp:Parameter Name="Address_Note" Type="String" />
                    <asp:Parameter Name="Child_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView6" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Child_ID" DataSourceID="SqlDataSource11" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Child_ID" HeaderText="Child ID" ReadOnly="True" SortExpression="Child_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="Last Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Physician_ID" HeaderText="Physician ID" SortExpression="Physician_ID" />
                    <asp:BoundField DataField="Class_ID" HeaderText="Class ID" SortExpression="Class_ID" />
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Emergency Contact ID" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother ID" SortExpression="Mother_ID" />
                    <asp:BoundField DataField="Father_ID" HeaderText="Father ID" SortExpression="Father_ID" />
                    <asp:BoundField DataField="Gaurdian_ID" HeaderText="Gaurdian ID" SortExpression="Gaurdian_ID" />
                    <asp:BoundField DataField="Address_Note" HeaderText="Address Note" SortExpression="Address_Note" />
                    <asp:CommandField ButtonType="Button" InsertText="Add New" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        







    </asp:MultiView>




</asp:Content>

