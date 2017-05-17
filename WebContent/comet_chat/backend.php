<?php

$filename  = dirname(__FILE__).'/data.txt';

// store new message in the file
$msgs = isset($_REQUEST['msgs']) ? $_REQUEST['msgs'] : '';
if ($msgs != '') {
  file_put_contents($filename,$_REQUEST['name'].': '.$msgs);
  die();
}

// infinite loop until the data file is not modified
$lastmodif    = isset($_REQUEST['timestamp']) ? $_REQUEST['timestamp'] : 0;
$currentmodif = filemtime($filename);
while ($currentmodif <= $lastmodif) // check if the data file has been modified
{
  usleep(10000); // sleep 10ms to unload the CPU
  clearstatcache();
  $currentmodif = filemtime($filename);
}

// return a json array
$response = array();
$response['msgs']       = file_get_contents($filename);
$response['timestamp'] = $currentmodif;
echo json_encode($response);
flush();

?>