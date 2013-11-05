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
                InsertCommand="INSERT INTO [MOTHER] ([Mother_ID], 
                [F_Name], [L_Name], [Address], [City], [State], [Zip_Code], [Email], [Phone]) 
                VALUES (@Mother_ID, @F_Name, @L_Name, @Address, @City, @State, @Zip_Code, @Email, @Phone)" 
                SelectCommand="SELECT * FROM [MOTHER]" 
                UpdateCommand="UPDATE [MOTHER] SET [F_Name] = @F_Name, [L_Name] = @L_Name, [Address] = 
                @Address, [City] = @City, [State] = @State, [Zip_Code] = @Zip_Code, [Email] = @Email, 
                [Phone] = @Phone WHERE [Mother_ID] = @Mother_ID">
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
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
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
                    <asp:CommandField ButtonType="Button" HeaderText="Control" ShowDeleteButton="True" 
                        ShowEditButton="True" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
            <br />
            <br />
        </asp:View>

        <asp:View ID="Emergency_Contact_View" runat="server">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
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

