<html>
<head>
<title>Tests.xml Editor</title>
</head>
<script language="javascript">
function createRequestObject() {
     var ro;
     var browser = navigator.appName;
     if(browser == "Microsoft Internet Explorer"){
          ro = new ActiveXObject("Microsoft.XMLHTTP");
     }else{
          ro = new XMLHttpRequest();
     }
     return ro;
}

var http = createRequestObject();

function sndReq(action) {
     http.open('get', 'xmleditor.php?action='+action);
     http.onreadystatechange = handleResponse;
     http.send(null);
}

function handleResponse() {
     if(http.readyState == 4){
          var response = http.responseText;
          var update = new Array();

          if(response.indexOf('|') != -1) {
               update = response.split('|');
               document.getElementById(update[0]).innerHTML = update[1];
          }
     }
}
</script>
<?php

switch($_REQUEST['action']) {
     case 'foo':
          /* do something */
          echo "foo|foo done";
          break;
}


include 'xmlparser.php';
$xmlFileName = $_GET['fileName'];
if(!$xmlFileName) $xmlFileName = "tests.xml";

$xml = file_get_contents($xmlFileName);
//Set up the parser object
$parser = new XMLParser($xml);
//Work the magic...
$parser->Parse();
//make an easier to use root
$root = $parser->document;
//get a count
$numPages = count($root->page);

//code to show a bunch of text boxes for editing
if( !($_GET['save']) ){
    echo "<style type=\"text/css\">body{ font-family: verdana, helvetica, arial; font-size: 0.8em}</style>\n";
    echo "<body bgcolor=\"#EEEEFF\">\n";

    $i = 0;
    foreach($root->page as $page){
        $i++;
        $j = 0;
        $numTests = count($page->test);

        echo "<h2>Page Number ".$i." - Page name:</h2><textarea valign=middle>".$page->name[0]->tagData."</textarea>\n";
        echo "<table border=1><tr>";
        echo "<td><b>#</b></td><td align=center><b>Title</b></td><td align=center><b>Type</b></td><td align=center><b>URL</b></td>\n";
        echo "<td align=center><b>Height</b></td><td><b>Tall Height</b></td><td align=center><b>Width</b></td><td><b>Wide Width</b></td><td align=center><b>Notes</b></td></tr>\n";
        foreach($page->test as $test){
            $j++;
            echo "<tr><td>".$j."</td>\n";
            echo "<td align=center><textarea cols=20>".$test->title[0]->tagData."                 </textarea></td>\n";
            echo "<td align=center><textarea cols=8>".$test->content[0]->tagAttrs['type']."      </textarea></td>\n";
            echo "<td align=center><textarea cols=40>".$test->content[0]->tagData."               </textarea></td>\n";
            echo "<td align=center><textarea cols=7>".$test->content[0]->tagAttrs['height']."    </textarea></td>\n";
            echo "<td align=center><textarea cols=7>".$test->content[0]->tagAttrs['tallheight']."</textarea></td>\n";
            echo "<td align=center><textarea cols=7>".$test->content[0]->tagAttrs['width']."     </textarea></td>\n";
            echo "<td align=center><textarea cols=7>".$test->content[0]->tagAttrs['widewidth']." </textarea></td>\n";
            echo "<td align=center><textarea cols=40>".$test->note[0]->tagData."                  </textarea></td></tr>\n";
        }
        echo "</table><br><br>\n";
    }
}
else {
    $fileCopyName = "tests.xml";
    $currentDate = date("Y-m-d-H-i-s");
    $dotLoc = strrpos($fileCopyName);
    $fileCopyName = substr_replace($fileCopyName,$currentDate,$dotLoc,0);
    $file2saveCopy = fopen($fileCopyName, "w+");
    
}

?>

</body>
</html>