<?php

function error_message($msg_code, $msg_text = '', $err_line = '', $err_file = '', $sql = '')
{
	global $site_path, $db, $timer;

	$sql_line = $sql;
	if ( DEBUG && ($msg_code == SQL) )
	{

		$error = $db->sql_error($sql);

		$debug_text = '';


		$debug_text .= '<br /><br />SQL Error : <b>' . $error['code'] . '</b> ' . $error['message'];


		if ( $sql_line != '' )
		{
			$debug_text .= "<br /><br />Query : ". $sql_line;
		}

		if ( $err_line != '' && $err_file != '' )
		{
			$debug_text .= '</br /><br />Line : ' . $err_line . '<br />File : ' . $err_file.'<br  />IP Address: '. $_SERVER['REMOTE_ADDR'].'<br  />Useragent: '. $_SERVER['HTTP_USER_AGENT'];
		}

		$msg_text = $msg_text . '<br /><br /><b><u>DEBUG MODE</u></b>' . $debug_text;

		echo $msg_text;
	}
	exit;
}


function duration($secs)
{
	$vals = array('w' => (int) ($secs / 86400 / 7),	
	'd' => $secs / 86400 % 7,
	'h' => $secs / 3600 % 24,
	'm' => $secs / 60 % 60,
	's' => $secs % 60);

	$ret = array();

	$added = false;
	
	foreach ($vals as $k => $v) {		
		if ($v > 0 || $added) {
			$added = true;
			$ret[] = $v . $k;
		}
	}
	return join(' ', $ret);
}

function gethost($ipaddress)
{
   $host = `host $ipaddress 10.222.69.44`;
   
   preg_match_all("/pointer (.*)\./", $host, $results);
   
   return $results[1][0];
}

?>