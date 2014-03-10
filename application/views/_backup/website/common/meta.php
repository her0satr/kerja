<?php
	$web['host'] = base_url();
?>
<title>Home</title>
<script>var web = <?php echo json_encode($web); ?></script>
<script src="<?php echo base_url('static/js/jquery.js'); ?>"></script>
<style>
body, div, a { margin: 0px; padding: 0px; border: 0px; font-size: 16px; }
body { background: #368FB7; }
a { text-decoration: none; }
.hide { display: none; }
.clear { clear: both; }
.center { text-align: center; }

.header { text-align: right; background: #368FB7; color: #FFFFFF; padding: 10px 20px; }
.header a { color: #FFFFFF; }
.header .left { float: left; }

.menu { float: left; width: 30%; }
.menu div { background: #328BB3; }
.menu a { color: #FFFFFF; padding: 20px 0 20px 20px; display: block; font-size: 20px; }
.menu a.active, .menu a:hover { background: #6FBEFB; }

.content { float: left; width: 70%; }
.content .main-title { background: #F0C30C; color: #FFFFFF; width: 100%; }
.content .main-title .pad { padding: 20px 0 20px 20px; font-size: 20px; }

.event .item { float: left; width: 50%; background: #6FBEFB; color: #FFFFFF; }
.event .item .pad { padding: 20px; }
.event .item img { float: left; padding: 0 20px 0 0; }

.gallery .item { float: left; width: 25%; text-align: center; background: #6FBEFB; }
.gallery .item .limit { padding: 15px; }
.gallery .item img { width: 85%; }

.schedule { background: #6FBEFB; }
.schedule .item { padding: 20px; color: #FFFFFF; border-bottom: 1px solid #CCCCCC; }

.error { background: #6FBEFB; }
.error .item { padding: 20px; color: #FFFFFF; border-bottom: 1px solid #CCCCCC; }

.table { padding: 20px; }
.table .reference{ border-collapse:collapse;width:100%; }
.table .reference tr:nth-child(odd)	{background-color:#F6F4F0;}
.table .reference tr:nth-child(even)	{background-color:#ffffff;}
.table .reference tr.fixzebra			{background-color:#F6F4F0;}
.table .reference th { color:#ffffff;background-color:#555555;border:1px solid #555555; padding:3px;vertical-align:top; }
.table .reference th a:link,.table .reference th a:visited{ color:#ffffff; }
.table .reference th a:hover,.table .reference th a:active{ color:#EE872A; }
.table .reference td{ border:1px solid #d4d4d4;padding:5px;padding-top:7px;padding-bottom:7px;vertical-align:top; }
.table .reference td.example_code { vertical-align:bottom; }
</style>