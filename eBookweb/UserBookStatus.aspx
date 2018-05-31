<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="UserBookStatus.aspx.cs" Inherits="eBookweb.UserBookStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CP4User" runat="server">

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
                        <asp:Label ID="lbFileCat" runat="server" Text='<%# Eval("FileCategoryIndex") %>'></asp:Label>
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
