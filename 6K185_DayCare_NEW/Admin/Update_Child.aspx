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
            <asp:DetailsView ID="Mother_DV" runat="server" Height="50px" Width="226px" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="Mother_ID" DataSourceID="SqlDataSource1" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother_ID" ReadOnly="True" 
                        SortExpression="Mother_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="L_Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>

            <br />
            <asp:GridView ID="Mother_GV" runat="server" AllowPaging="True" AllowSorting="True" 
                DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Mother_ID" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Mother_ID" HeaderText="Mother_ID" ReadOnly="True" 
                        SortExpression="Mother_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="L_Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
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
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Father_ID" HeaderText="Father_ID" ReadOnly="True" SortExpression="Father_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_NAme" HeaderText="L_NAme" SortExpression="L_NAme" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Father_ID" DataSourceID="SqlDataSource2">
                <Fields>
                    <asp:BoundField DataField="Father_ID" HeaderText="Father_ID" ReadOnly="True" SortExpression="Father_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_NAme" HeaderText="L_NAme" SortExpression="L_NAme" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Emergency_Contact_ID" ReadOnly="True" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="L_Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Phone_Home" HeaderText="Phone_Home" SortExpression="Phone_Home" />
                    <asp:BoundField DataField="Phone_Work" HeaderText="Phone_Work" SortExpression="Phone_Work" />
                    <asp:BoundField DataField="Phone_Cell" HeaderText="Phone_Cell" SortExpression="Phone_Cell" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Emergency_Contact_ID" DataSourceID="SqlDataSource3">
                <Fields>
                    <asp:BoundField DataField="Emergency_Contact_ID" HeaderText="Emergency_Contact_ID" ReadOnly="True" SortExpression="Emergency_Contact_ID" />
                    <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="L_Name" HeaderText="L_Name" SortExpression="L_Name" />
                    <asp:BoundField DataField="Phone_Home" HeaderText="Phone_Home" SortExpression="Phone_Home" />
                    <asp:BoundField DataField="Phone_Work" HeaderText="Phone_Work" SortExpression="Phone_Work" />
                    <asp:BoundField DataField="Phone_Cell" HeaderText="Phone_Cell" SortExpression="Phone_Cell" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Medical_Contact_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView3" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Gaurdian_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView4" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Class_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView5" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
        </asp:View>

        <asp:View ID="Child_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView6" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView6" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
        </asp:View>

        







    </asp:MultiView>




</asp:Content>

