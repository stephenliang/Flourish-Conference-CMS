<html>
<head>
<title>Tests2.xml Editor</title>
</head>
  <script language="JavaScript">
  <!--
    var pageNum; 
    var rowNum = new Array();
    function addPage() {
        pageNum++;
        rowNum[pageNum] = 1;
        var newdiv = document.createElement('div');
        newdiv.setAttribute('id','page'+pageNum);
        newdiv.innerHTML = '<h2>Page Number '+pageNum+' - Page name:</h2><textarea name="xml['+pageNum+'][name]" valign=middle></textarea><table border=1 id="table'+pageNum+'"><tr><td><b>#</b></td><td align=center><b>Title</b></td><td align=center><b>Type</b></td><td align=center><b>URL</b></td><td align=center><b>Height</b></td><td><b>Tall Height</b></td><td align=center><b>Width</b></td><td><b>Wide Width</b></td><td align=center><b>Notes</b></td></tr><tr><td>1</td><td align=center><textarea name="xml['+pageNum+'][title][]" cols=20></textarea></td><td align=center><textarea name="xml['+pageNum+'][type][]" cols=8></textarea></td><td align=center><textarea name="xml['+pageNum+'][url][]" cols=40></textarea></td><td align=center><textarea name="xml['+pageNum+'][height][]" cols=7></textarea></td><td align=center><textarea name="xml['+pageNum+'][theight][]" cols=7></textarea></td><td align=center><textarea name="xml['+pageNum+'][width][]" cols=7></textarea></td><td align=center><textarea name="xml['+pageNum+'][wwidth][]" cols=7></textarea></td><td align=center><textarea name="xml['+pageNum+'][note][]" cols=40></textarea></td></tr></table><br /><input type="button" value="Add Another Row!" onclick="addRow('+pageNum+')" /><br><br><hr>';
        document.getElementById('pages').appendChild(newdiv);
    }
    
    function addRow(page) {
        rowNum[page]++;
        var newtr = document.createElement('tr');
        newtr.setAttribute('id','t'+page+'r'+rowNum[page]);
        var temp = document.createElement('td');
        temp.innerHTML = '' + rowNum[page];
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][title][]" cols=20></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][type][]" cols=8></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][url][]" cols=40></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][height][]" cols=7></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][theight][]" cols=7></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][width][]" cols=7></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][wwidth][]" cols=7></textarea>';
        newtr.appendChild(temp);
        temp = document.createElement('td');
        temp.setAttribute('align','center');
        temp.innerHTML = '<textarea name="xml['+page+'][note][]" cols=40></textarea>';
        newtr.appendChild(temp);
        document.getElementById('table'+page).appendChild(newtr);
    }
    -->
</script>
<form method="post" action="output.php">
<?php
error_reporting(1);

switch($_REQUEST['action']) {
     case 'foo':
          /* do something */
          echo "foo|foo done";
          break;
}


include 'xmlparser.php';
$xmlFileName = $_GET['fileName'];
if(!$xmlFileName) $xmlFileName = "tests2.xml";

$rowNum = array();

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
    echo "<body bgcolor=\"#EEEEF0\">\n";
    echo "<div id=\"pages\">\n";

    $i = 0;
    foreach($root->page as $page){
        $i++;
        $j = 0;
        $numTests = count($page->test);

        echo "<div id=\"page$i\">\n<h2>Page Number $i - Page name:</h2><textarea name=\"xml[$i][name]\" valign=middle>".$page->name[0]->tagData."</textarea>\n";
        echo "<table border=1 id=\"table$i\"><tr>";
        echo "<td><b>#</b></td><td align=center><b>Title</b></td><td align=center><b>Type</b></td><td align=center><b>URL</b></td>\n";
        echo "<td align=center><b>Height</b></td><td><b>Tall Height</b></td><td align=center><b>Width</b></td><td><b>Wide Width</b></td><td align=center><b>Notes</b></td></tr>\n";
        foreach($page->test as $test){
            $j++;
            echo "<tr id=\"t{$i}r{$j}\"><td>".$j."</td>\n";
            echo "<td align=center><textarea name=\"xml[$i][title][]\" cols=20>".$test->title[0]->tagData.                  "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][type][]\" cols=8>".$test->content[0]->tagAttrs['type'].         "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][url][]\" cols=40>".$test->content[0]->tagData.                  "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][height][]\" cols=7>".$test->content[0]->tagAttrs['height'].     "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][theight][]\" cols=7>".$test->content[0]->tagAttrs['tallheight']."</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][width][]\" cols=7>".$test->content[0]->tagAttrs['width'].       "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][wwidth][]\" cols=7>".$test->content[0]->tagAttrs['widewidth'].  "</textarea></td>\n";
            echo "<td align=center><textarea name=\"xml[$i][note][]\" cols=40>".$test->note[0]->tagData.                    "</textarea></td></tr>\n";
        }
        echo "</table><br /><input type=\"button\" value=\"Add Another Row!\" onclick=\"addRow($i)\" /><br><br>\n<hr></div>\n";
        $rowNum[$i] = $j; 
    }
}
else {
    $fileCopyName = "tests2.xml";
    $currentDate = date("Y-m-d-H-i-s");
    $dotLoc = strrpos($fileCopyName);
    $fileCopyName = substr_replace($fileCopyName,$currentDate,$dotLoc,0);
    $file2saveCopy = fopen($fileCopyName, "w+");
    
}

echo "</div>\n<script>\n  pageNum = $i;\n";
foreach ($rowNum as $k => $v)
    echo "  rowNum[$k] = $v;\n";
echo "</script>\n";

?>
<input type="button" value="Add Another Page!" onclick="addPage()" /><br /><br />  
<input type="submit" value="SUBMIT (View Output)"></form>
</body>
</html>