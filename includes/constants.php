<?php
/**
@Author: Life & Flash
@version: 06/12/26
@copyright: MapleTip.com
*/
if($_SERVER['HTTP_HOST'] == "chisocdev01pp.chi.orbitz.net")
define('ROOT', 'http://chisocdev01pp.chi.orbitz.net/~sliang');
else 
define('ROOT', 'http://chisoc01pp.chi.orbitz.net/ops/hourlytool2');

$ext = '.tpl'; // Required for template files.


//SQL Codes
define('BEGIN_TRANSACTION', 1);
define('END_TRANSACTION', 2);

?>