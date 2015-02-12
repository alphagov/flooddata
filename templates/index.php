<!doctype html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>UK floods 2014 data feeds</title>
  <style>
*{
  margin:0;
  padding:0;
}
body{
  margin:0;
  padding:0;
  border:none;
  font-family:Arial, sans-serif;
  font-size:19px;
  line-height:1.31579;
  font-weight:400;
  text-transform:none;
  color:#292929;
  -webkit-font-smoothing:antialiased;
}
#wrapper{
  position:relative;
  margin:0 auto 40px;
}
#page{
  position:relative;
  margin:0 auto;
  width:auto;
}
#title{
  background:#2b8cc4;
  color:#fff;
  padding:40px 30px;
}
#title h1{
  font-size:48px;
  line-height:1.04167;
  text-transform:none;
  font-weight:bold;
  color:#fff;
}
#title p{
  margin:15px 0 20px;
}
#content{
  margin:0 30px;
  padding-bottom:80px;
}
h2{
  margin-top:30px;
}
p{
  margin:20px 0;
}

#footer{
  width:100%;
  color:#454a4c;
  font-size: 16px;
}
.footer-wrapper{
  background-color:#dee0e2;
  border-top:1px solid #a1acb2;
  padding: 60px 0;
}
.footer-meta{
  max-width:70em;
  margin:0 auto;
}

#footer .footer-meta .footer-meta-inner{
  display:inline-block;
  vertical-align:bottom;
  padding-left:30px;
}

#footer .footer-meta .copyright{
  display:inline-block;
  padding-top:15px;
  padding-left:30px;
}

#footer .footer-meta .copyright a{
  display:block;
  padding:115px 0 0 0;
  background:transparent url(https://assets.digital.cabinet-office.gov.uk/static/images/govuk-crest.png) no-repeat 100% 0;
  text-align:right;
  text-decoration:none;
}
#footer a{
    color:#454a4c;
}
#footer a:hover{
    color:#171819;
}
#footer h2{
  font-size:24px;
  line-height:1.25;
  font-weight:400;
  text-transform:none;
  font-weight:bold;
  margin:16px 0
}
#footer .footer-meta .footer-meta-inner ul{
  font-size:16px;
  line-height:1.5;
  font-weight:300;
  text-transform:none;
  display:inline-block;
  list-style:none;
  margin:0 0 1em;
  padding:0
}
#footer .footer-meta .footer-meta-inner .open-government-licence{
  clear:left;
  position:relative;
}
#footer .footer-meta .footer-meta-inner .open-government-licence h2 a,#footer .footer-meta .footer-meta-inner .open-government-licence h2 img{
  display:block;
  width:43px;
  height:17px
}
#footer .footer-meta .footer-meta-inner .open-government-licence p{
  font-size:16px;
  line-height:1.25;
  font-weight:300;
  text-transform:none;
  margin:0;
  padding-top:0.1em
}

@media (min-width:640px){
  #page{
    max-width:1020px;
  }
  #title h1{
    margin:5px 0 15px;
  }
  #title{
    margin:1em 0;
    padding:75px 30px 40px;
  }
  #content{
    margin:0;
    width:75%;
    float:right;
  }
  h2{
    margin-top:80px;
  }
  #footer{
    clear:both;
  }
  #footer h2{
    margin:0;
  }
  #footer .footer-meta .footer-meta-inner{
    width: 75%;
  }
  #footer .footer-meta .footer-meta-inner .open-government-licence{
    clear:left;
    position:relative;
    padding-left:53px
  }
  #footer .footer-meta .footer-meta-inner .open-government-licence h2{
    position:absolute;
    left:0;
    top:0;
    width:41px;
    height:100%
  }
  #footer .footer-meta .footer-meta-inner ul li{
    display:inline-block;
    margin:0 15px 0 0;
  }
}
  </style>
</head>
<body>
<div id="wrapper">
  <div id="page">

  <div id="title">
    <div class="headings">
        <h1>Data feeds for the UK floods 2014</h1>
        <p>Published <abbr class="published-at date" title="<?= gmdate("Y-m-d\TH:i:00+00:00"); ?>"><?= gmdate("j F Y"); ?></abbr></p>
    </div>
  </div>

<?php
  function list_files($dir) {
    $files = array();
    if ($handle = opendir($dir)) {
      while (false !== ($file = readdir($handle))) {
        if (!preg_match("/^\./", $file)) {
          $files[] = $file;
        }
      }
      closedir($handle);
      natsort($files);
      $files = array_reverse($files, true);
      foreach($files as $file) {
        echo "    <li><a href=\"$dir/$file\">$file</a></li>\n";
      }
    }
  }
?>
  <div id="content">

  <p>A set of data feeds to accompany the <a href="https://www.gov.uk/government/publications/uk-floods-2014-data">UK floods 2014 data</a> published by the <a href="https://www.gov.uk/government/organisations/environment-agency">Environment Agency</a> on <a href="https://www.gov.uk">GOV.UK</a>.</p>

  <p>This page and data will be available from <a href="http://flooddata.alphagov.co.uk">flooddata.alphagov.co.uk</a> until May 2014.</p>


  <div id="river-levels">
    <h2>River levels</h2>
    <p>Hydrometric data including river levels and groundwater gathered from stations around the UK and updated up to several times an hour:<p>
    <ul>
      <li><a href="stations.tsv">stations.tsv</a> — latest</li>
<?php list_files('stations') ?>
    </ul>
  </div>

  <div id="3df">
    <h2>Three day forecast</h2>
    <p>A forecast for weather and flooding for the next three days, published daily:</p>
    <ul>
      <li><a href="3df.xml">3df.xml</a> — latest</li>
<?php list_files('3df') ?>
    </ul>
  </div>
</div>

 </div>
</div>

<div id="footer" role="contentinfo">
  <div class="footer-wrapper">
    <div class="footer-meta">
      <div class="footer-meta-inner">
        <ul>
          <li><a title="View and suggest changes to the source code on GitHub" href="https://github.com/alphagov/flooddata">Source code</a></li>
          <li>Built by the <a href="https://gds.blog.gov.uk/">Government Digital Service</a></li>
        </ul>
        <div class="open-government-licence">
          <h2><a href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2"><img src="https://assets.digital.cabinet-office.gov.uk/static/open-government-licence_2x.png" alt="OGL"></a></h2>
          <p>All content is available under the <a href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2">Open Government Licence v2.0</a>, except where otherwise stated</p>
        </div>
      </div>
      <div class="copyright">
        <a href="http://www.nationalarchives.gov.uk/information-management/our-services/crown-copyright.htm">© Crown Copyright</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>
