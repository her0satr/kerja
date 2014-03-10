<?php
	$array_tree = $this->User_model->get_tree(array( 'koordinator_id' => 0, 'user_type_id' => USER_ID_SALES ));
	/*
	
	$array_tree = array(
		array(
			'title' => 'Parent No 1', 'label' => 'Goes somewhere', 'child' => array(
				array( 'title' => 'Child No 1', 'label' => 'Child Goes somewhere' ),
				array( 'title' => 'Child No 2', 'label' => 'Child Goes somewhere' ),
				array( 'title' => 'Child No 3', 'label' => 'Child Goes somewhere' )
			)
		),
		array(
			'title' => 'Parent No 2', 'label' => 'Goes somewhere', 'child' => array()
		)
	);
	/*	*/
	
	function show_tree($array_tree) {
		$result = '';
		foreach ($array_tree as $row) {
			$child_tree = '';
			if (isset($row['child']) && is_array($row['child']) && count($row['child']) > 0) {
				$child_tree = show_tree($row['child']);
			}
			
			// class html
			$style_class = (empty($child_tree)) ? 'fa-leaf' : 'fa-folder-open';
			
			$result .= '
				<li>
					<span class="cursor tree-option" data-row=\''.json_encode($row).'\'><i class="fa '.$style_class.'"></i></span>
					<a class="cursor tree-option tree-edit" data-row=\''.json_encode($row).'\'>'.$row['title'].'</a>
					'.$child_tree.'
				</li>
			';
		}
		
		// fix template tree
		$result = '<ul>'.$result.'</ul>';
		
		return $result;
	}
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Koordinator Sales' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Koordinator Sales</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="cnt-tree">
					<div class="tree well">
						<?php echo show_tree($array_tree); ?>
					</div>
				</div>
				
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

<script>
$(document).ready(function() {
	Func.init_tree({ cnt: '.cnt-tree' });
});
</script>
</body>
</html>