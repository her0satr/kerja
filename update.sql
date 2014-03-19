2014-03-19
- CREATE TABLE IF NOT EXISTS `divisi` ( `id` int(11) NOT NULL AUTO_INCREMENT, `title` varchar(50) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
- ALTER TABLE `biodata` ADD `divisi_id` INT NOT NULL AFTER `id` ;
- ALTER TABLE `kegiatan_skp` ADD `keterangan` VARCHAR( 255 ) NOT NULL ;
- ALTER TABLE `skpd` ADD `email` VARCHAR( 50 ) NOT NULL AFTER `hp` ;
