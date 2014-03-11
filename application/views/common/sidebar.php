<?php
	$user = $this->user_model->get_session();
	$array_menu = $this->user_model->get_menu(array( 'user_type_id' => $user['user_type_id'] ));
?>

<div class="sidebar" id="cnt-sidebar">
	<div class="sidebar-dropdown"><a href="#">Navigation</a></div>
	
	<form class="navbar-form" role="search">
		<div class="form-group">&nbsp;</div>
	</form>
	
	<ul id="nav">
		<li><a href="<?php echo base_url('home'); ?>"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
		
		<?php foreach ($array_menu as $parent) { ?>
		<li class="has_sub">
			<a href="#" data-link="<?php echo $parent['name']; ?>"><i class="fa fa-folder"></i><span><?php echo $parent['title']; ?></span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<?php foreach ($parent['children'] as $children) { ?>
					<?php if (isset($children['children']) && count($children['children']) > 0) { ?>
					<li class="has_sub"><a href="#" data-link="<?php echo $children['name']; ?>"><i class="fa fa-folder"></i> <?php echo $children['title']; ?> <span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
						<ul>
							<?php foreach ($children['children'] as $menu) { ?>
							<li><a href="<?php echo base_url($parent['name'].'/'.$children['name'].'/'.$menu['name']); ?>"><i class="fa fa-bell"></i> <?php echo $menu['title']; ?></a></li>
							<?php } ?>
						</ul>
					</li>
					<?php } else { ?>
					<li><a data-link="<?php echo $children['name']; ?>" href="<?php echo base_url($parent['name'].'/'.$children['name']); ?>"><i class="fa fa-bell"></i> <?php echo $children['title']; ?></a></li>
					<?php } ?>
				<?php } ?>
			</ul>
		</li>
		<?php } ?>
	</ul>
</div>

<script>
	// parent active having class "open"
	// child active having class "active"
	
	// set active menu from link location
	var link = window.location.href;
	link = link.replace(web.host, '');
	var string_match = link.match(new RegExp('([a-z0-9\_]+)(\/([a-z0-9\_]+))?', 'gi'));
	if (typeof(string_match) != 'undefined' && string_match != null) {
		var array_link = string_match[0].split('/');
		
		// set parent
		if (typeof(array_link[1]) == 'string') {
			$('a[data-link="' + array_link[1] + '"]').addClass('open');
		}
		
		// set child
		if (typeof(array_link[2]) == 'string') {
			$('a[data-link="' + array_link[2] + '"]').addClass('active');
		}
	}
</script>