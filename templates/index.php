<!doctype html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>UK floods 2014 data feeds</title>
  <style></style>
</head>
<body>
<div id="header">
  <h1>UK floods 2014 data feeds</h1>
  <p>A set of data feeds to accompany the <a href="https://www.gov.uk/government/publications/uk-floods-2014-data">UK floods 2014 data</a> published by the Environment Agency on GOV.UK.</p>
</div>

<div id="river-levels">
  <h2>River levels</h2>
  <p>Hydrometric data gathered from stations around the UK, updated several times an hour:<p>
  <ul>
    <li><a href="stations.tsv.gz">stations.tsv.gz</a> — latest river levels from stations</li>
<?php
    if ($handle = opendir('stations')) {
        while (false !== ($entry = readdir($handle))) {
            if (!preg_match("/^\./", $entry)) {
                echo "    <li><a href=\"$entry ?>\">$entry</a></li>\n";
            }
        }
        closedir($handle);
   }
?>
  </ul>
</div>

<div id="footer">
<p>This data is published under the <a href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2">Open Government Licence v2.0</a>
    and will be available from <a href="http://flooddata.alphagov.co.uk">flooddaata.alphagov.co.uk</a> until May 2014.</p>
<p>An archive of the data along with the code used to generate this page is available from <a href="">github.com/alphagov/flooddata</a>.
</div>
</p>
</body>
</html>
