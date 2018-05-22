<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminBookStatus.aspx.cs" Inherits="eBookweb.AdminBookStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
        <div class="container">
            <h2>書庫狀態</h2>
            <hr />
        </div>
        <div class = "panel panel-default">
            <div class = "panel-heading">檔名分類</div>
            <asp:GridView ID="gvBookStatus" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" Height="200px" Width="100%" >
                <Columns>
                    <asp:TemplateField HeaderText="檔案名稱">
                        <ItemTemplate>
                            <asp:Label ID="lbFileCat" runat="server" Text='<%# Eval("FileCat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="檔案數量">
                        <ItemTemplate>
                            <asp:Label ID="lbTotalNum" runat="server" Text='<%# Eval("TotalNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

</asp:Content>
