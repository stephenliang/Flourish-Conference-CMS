<html>
<head>
<title>Hourly Tool</title>
</head>
<?php

// Ok, which page are we on? Assume 1 if there is nothing already submitted
$pageNum = isset($_POST['pageNum']) ? $_POST['pageNum'] : 0;
 
include 'xmlparser.php';
 
//Get the XML document loaded into a variable
$xml = file_get_contents('tests.xml');
//Set up the parser object
$parser = new XMLParser($xml);
 
//Work the magic...
$parser->Parse();
 
$root = $parser->document;
?>
<body>
<?php
//If this isn't the last page, show it:
if ($root->page[$pageNum]) {
    echo "<form method=\"post\" action=\"xmlforms.php\">\n";
    echo "<input type=\"hidden\" name=\"pageNum\" value=\"".($pageNum+1)."\" />\n";
    
    // View the current page
    $page = $root->page[$pageNum];

    echo "<h2>".$page->brand[0]->tagData."</h2>\n";

    foreach($page->test as $test)
    {
        //here is the loop where we draw each test
        echo "<h3>".$test->title[0]->tagData."</h3>";

        //make 'content'
        $content = $test->content[0];

        //initialize $h and $w
        $h = "200";
        $w = "800";
        if($content->tagAttrs['type'] == 'iframe')
        {
            if ($content->tagAttrs['height']) $h = $content->tagAttrs['height'];
            if ($content->tagAttrs['width']) $w = $content->tagAttrs['width'];
            echo "iframe: IFRAME HERE!<!--<iframe height=".$h." width=".$w." src=".$content->tagData."></iframe>-->";
        }
        elseif($content->tagAttrs['type'] == 'image')
        {
            echo "image: <img src=".$content->tagData.">";
        }
        else
        {
            echo "unrecognized type";
        }
        echo "<br>\n";
    }
    echo "<br />\n";
    echo "<input type=\"submit\" value=\"Submit form!\" />\n";
    echo "</form>\n";
}
else      // Otherwise, we're on the last page. Show the totals here:
{
    echo "THIS IS THE RESULTS PAGE!";    
}
?>
</body>
</html>
