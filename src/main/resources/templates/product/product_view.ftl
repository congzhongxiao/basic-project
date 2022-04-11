<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="详情示例"/>
    <@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="detail-view-box">
        <div class="detail-view-header">
            <div class="title">项目详情</div>
            <div class="tools">
                <a href="javascript:;">查看完整信息></a>
            </div>
        </div>
        <div class="detail-view-body">

            <div class="detail-view-sub-title">
                项目基本信息
            </div>
            <table class="detail-view-table">
                <tr>
                    <td class="title">项目名称：</td>
                    <td>JNZFTZ202203090001</td>
                    <td class="title">一级项目名称：</td>
                    <td>XXXXXXXXXX投资项目</td>
                    <td class="title">二级项目名称：</td>
                    <td>XXXXXXXXXX投资项目</td>
                    <td class="title">项目性质：</td>
                    <td>政府直接投资项目</td>
                </tr>
                <tr>
                    <td class="title">资金规模：</td>
                    <td>2000万</td>
                    <td class="title">资金来源：</td>
                    <td>县级投资</td>
                    <td class="title">立项手续：</td>
                    <td>
                        <a href="javascript:;">xxxx立项手续.pdf</a>
                    </td>
                    <td class="title">项目性质：</td>
                    <td>政府直接投资项目</td>
                </tr>
                <tr>
                    <td class="title">资金规模：</td>
                    <td>2000万</td>
                    <td class="title">资金来源：</td>
                    <td>县级投资</td>
                    <td class="title">立项手续：</td>
                    <td>
                        <a href="javascript:;">xxxx立项手续.pdf</a>
                    </td>
                    <td class="title">项目性质：</td>
                    <td>政府直接投资项目</td>
                </tr>
            </table>

            <div class="detail-view-sub-title">
                项目进度
            </div>
            <div class="progress">
                <div style="width: 43%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="43" role="progressbar"
                     class="progress-bar bg-green"></div>
            </div>

            <ul class="nav nav-tabs ">
                <li class="active"><a href="#tab1" data-toggle="tab" aria-expanded="true">事项信息</a></li>
                <li class=""><a href="#tab2" data-toggle="tab" aria-expanded="false">参与人员</a></li>
                <li class=""><a href="#tab3" data-toggle="tab" aria-expanded="false">拨款情况</a></li>
                <li class=""><a href="#tab4" data-toggle="tab" aria-expanded="false">中介月报</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div class="tab-content-info">
                        <span class="text-primary">已累计拨款：200万元</span>
                        &nbsp;&nbsp;
                        <span class="text-danger">已累计拨款：200万元</span>
                    </div>
                    <div class=" table-striped no-tools">
                        <table id="bootstrap-table"></table>
                    </div>
                </div>
                <div class="tab-pane" id="tab2">
                    叶子和花仿佛在牛乳中洗过一样；又像笼着轻纱的梦。虽然是满月，天上却有一层淡淡的云，所以不能朗照；但我以为这恰是到了好处——酣眠固不可少，小睡也别有风味的。
                </div>
                <div class="tab-pane" id="tab3">
                    叶子和花仿佛在牛乳中洗过一样；又像笼着轻纱的梦。虽然是满月，天上却有一层淡淡的云，所以不能朗照；但我以为这恰是到了好处——酣眠固不可少，小睡也别有风味的。
                </div>
                <div class="tab-pane" id="tab4">
                    <p>
                        月光如流水一般，静静地泻在这一片叶子和花上。薄薄的青雾浮起在荷塘里。叶子和花仿佛在牛乳中洗过一样；又像笼着轻纱的梦。虽然是满月，天上却有一层淡淡的云，所以不能朗照；但我以为这恰是到了好处——酣眠固不可少，小睡也别有风味的。月光是隔了树照过来的，高处丛生的灌木，落下参差的斑驳的黑影，峭楞楞如鬼一般；弯弯的杨柳的稀疏的倩影，却又像是画在荷叶上。塘中的月色并不均匀；但光与影有着和谐的旋律，如梵婀玲上奏着的名曲。</p>
                </div>
            </div>

        </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/product";

    $(function () {
        var options = {
            url: prefix + "/findList",
            modalName: "产品",
            uniqueId: "id",
            showRefresh:false,
            showSearch:false,
            columns: [
                {
                    checkbox: true
                },
                {
                    title: '序号',
                    width: 5,
                    align: "center",
                    formatter: function (value, row, index) {
                        return $.table.serialNumber(index);
                    }
                },
                {
                    field: 'name',
                    title: '作品名称'
                },
                {
                    field: 'author',
                    title: '作者'
                },
                {
                    field: 'createBy',
                    title: '创建人'
                },
                {
                    field: 'createTime',
                    title: '创建时间'
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-info btn-xs " href="javascript:void(0)" onclick="viewTab()"><i class="fa fa-edit"></i>详情</a> ');
                        return actions.join('');
                    }
                }]
        };
        $.table.init(options);
    });
</script>
</body>
</html>