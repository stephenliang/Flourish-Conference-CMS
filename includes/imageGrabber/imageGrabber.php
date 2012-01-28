<?php
class imageGrabber {
	function imageGrabber()
	{

	}

	/**
	 * Get Graphite images from wiki
	 *
	 * @param string $url
	 * @return array of strings
	 */

	function grabImage($url)
	{
		$contents = file_get_contents($url);
		$search = '/(<img.*?src=["\'](.*?)["\'].*?>)/';

		if(!preg_match_all($search, $contents, $results))
		{
			$search = '/(<img.*?src=["\'](.*?)\n["\'].*?>)/';

			preg_match_all($search, $contents, $results);
		}

		for($i = 0; $i != count($results[2]); $i++)
		{
			if(substr($results[2][$i], 0, 4) != "http")
			{
				//Obtain domain name
				$urlParse = parse_url($url);

				$domain = $urlParse['host'];
				$parsedURL =  $urlParse['scheme']."://".$domain.$urlParse['path'];

				$dir = pathinfo($parsedURL);

				$image = $dir['dirname']."/".($results[2][$i]);
			}else{
				$image = str_replace(" ", "%20", $results[2][$i]);
			}

			$urlParse = parse_url($image);

			if($urlParse['host'] == "graphite.prod.o.com" || $urlParse['host'] == "chisocdev01pp.chi.orbitz.net" || $urlParse['host'] == "orbzammhudpp.eg.orbitz.com" || $urlParse['host'] == "ctixammhudpp.eg.orbitz.com" || $urlParse['host'] == "egmgt06pp.eg.orbitz.com" || $urlParse['host'] == "m1161uspln2.cust.aops-eds.com" || $urlParse['host'] == "m1157uspln2.cust.aops-eds.com" || $urlParse['host'] == "graphite.orbitz.com" || $urlParse['host'] == "egobfare09pp.eg.orbitz.com" || $urlParse['host'] == "m1162uspln2.cust.aops-eds.com" )
			{
				$images[] = str_replace("&", "&amp;", $image);
			}
		}

		return $images;
	}
	
	function grabGomez($crypt)
	{
		return ROOT."/gomez.php?crypt=".$crypt;
	}
}
?>