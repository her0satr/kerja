<?php
	// user
	$user = $this->user_model->get_session();
?>
<?php $this->load->view( 'common/meta', array( 'title' => 'Selamat Datang' ) ); ?>

<body>
<?php $this->load->view( 'common/header'); ?>

<style>
.well h2 { padding: 0px; margin: 0px; line-height: 20px; }
.well h2 span { font-size: 20px; }

#main-menu .bg-info { padding: 15px 0 0 0; }
#main-menu .bg-info a { background: none; }
#main-menu .bg-info a img { margin: 0 0 10px 0; }
</style>

<div class="content enlarged">
	<?php $this->load->view( 'common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left">Selamat Datang</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
            
               <?php if (in_array($user['user_type_id'], array(USER_ID_ADMINISTRATOR))) { ?>
               <a href="<?php echo base_url('user/user'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />User</a> <br />
               <?php } ?>
               
	           <a href="<?php echo base_url('master/agama'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Agama</a> <br />
               <a href="<?php echo base_url('master/index_surat'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Index Surat</a> <br />
               <a href="<?php echo base_url('master/jenis_kepegawaian'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Jenis Kepegawaian</a> <br />
               <a href="<?php echo base_url('master/pangkat'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Pangkat</a> <br />
               <a href="<?php echo base_url('master/sifat_arsip'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Sifat Arsip</a> <br />
               <a href="<?php echo base_url('master/skpd'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />SKPD</a> <br />
               <a href="<?php echo base_url('master/status_kepegawaian'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Status Kepegawaian</a> <br />
               <a href="<?php echo base_url('master/status_perkawinan'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Status Perkawinan</a> <br />
               <a href="<?php echo base_url('master/surat_destination'); ?>"><img src="<?php echo base_url('static/img/icons/master.png'); ?>" />Tujuan Surat</a> <br />
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'common/footer' ); ?>
<?php $this->load->view( 'common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
		}
	}
	page.init();
});
</script>
</body>
</html>