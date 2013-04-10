<%@page import="java.util.ArrayList"%>
<%@ page import="dashboard.dashboardController" %>>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link type="text/css" rel="Stylesheet" href="/sttc/upgrade.css">
	<script type="text/javascript" src="/js/Tracking.js"></script>
	<script type="text/javascript" src="/sttc/upgrade.js"></script>
	<script type='text/javascript'>
		var tk = false
	</script>
	<title>Dashboad</title> <!-- DIALOG BOX -->
	<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css" />

	<style>
body {
	font-size: 62.5%;
}

label,input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

#lightbox{
    visibility:hidden;
    position:absolute;
    background:white;
    border:2px solid #3c3c3c;
    color:black;
    z-index:100;
    width: 250px;
    height:100px;
    padding:20px;
    font-family: "Verdana";
    font-size: 12px;
    }

    .dimmer{
        background: #000;
        position: absolute;
        opacity: .5;
        top: 0;
        z-index:99;
    }

    .black_overlay{
    display: none;
    position: absolute;
    top: 0%;
    left: 0%;
    width: 100%;
    height: 100%;
    background-color: black;
    z-index:100001;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);
    }
 
  .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 25%;
            height: 25%;
            padding: 16px;
            border: 2px solid #3c3c3c;
            background-color: white;
            z-index:100002;
            font-family: "Verdana";
            font-size: 12px;
            overflow: auto;
        }

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td,div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
	<!-- END OF DIALOG BOX -->

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="title" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta property="fb:app_id" content="163149743769497" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="" />
	<meta property="og:description" content="" />
	<meta property="og:image" content="" />
	<meta property="og:site_name" content="" />
	<meta property="fb:admins" content="192580217445561" />
	<meta name="HandheldFriendly" content="true" />
	<meta name="viewport"
		content="width=980, height=900, minimum-scale=0.25, maximum-scale=3" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style"
		content="black-translucent" />
	<meta name="viewport" content="target-densitydpi=device-dpi" />
	<link id="favicon" rel="shortcut icon" href="" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/jslib/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/sttc/jquery.form.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/sttc/contact.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Menu/minimalDropdown.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Item/itemDesign.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Item/slideDesign.js"></script>
	<link type="text/css" rel="Stylesheet"
		href="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Item/itemDesign.css" />
	<link type="text/css" rel="Stylesheet"
		href="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Item/slideDesign.css" />
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/sttc/slideshow.js"></script>
	<script type="text/javascript"
		src="http://d2c8yne9ot06t4.cloudfront.net/static/sttc/jquery.scrollTo-min.js"></script>
	<link type="text/css" rel="Stylesheet"
		href="http://d2c8yne9ot06t4.cloudfront.net/static/fonts/stylesheet.css" />
	<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-39280910-1' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
	<script>
		function init() {
			slideshow.init();
		}
		</script>
		<script type="text/javascript">
			function createProject() {
				var name;
				var project = prompt("Project Name: ", "");
				name = project;
			}
			function openDimmer()
		      {
		        /*
		        var lightbox = document.getElementById("lightbox"),
		            dimmer = document.createElement("div");

		        dimmer.style.width =  window.innerWidth + 'px';
		        dimmer.style.height = window.innerHeight + 'px';
		        dimmer.className = 'dimmer';

		        dimmer.onclick = function(){
		            document.body.removeChild(this);   
		            lightbox.style.visibility = 'hidden';
		        }

		        document.body.appendChild(dimmer);

		        lightbox.style.visibility = 'visible';
		        lightbox.style.top = window.innerHeight/2 - 50 + 'px';
		        lightbox.style.left = window.innerWidth/2 - 100 + 'px';
		        return false;
		        */

		        document.getElementById('light').style.display='block';
		        document.getElementById('fade').style.display='block';
		      }
			function closeDimmer()
		      {
		        document.getElementById('light').style.display='none';
		        document.getElementById('fade').style.display='none';
		      }
		</script>
<!-- <script type="text/javascript">
		/*function createProject(fileName,userName) {
			
			
			var value = fileName.toString();
			
			
			
			/*
			 var fileName = document.getElementById("filename").value.concat(".",document.getElementById("filetype").value);
			 var new_file= {id: fileName, text: "", syntax: document.getElementById("filetype").value};
			 editAreaLoader.openFile('mycode', new_file);

			 var lightbox = document.getElementById("lightbox");
			 lightbox.style.visibility= 'hidden';
			 lightbox.close();
			 document.body.removeChild('dimmer');

			 document.getElementById('light').style.display='none';
			 document.getElementById('fade').style.display='none';
			 */
		}
	</script>

	<!-- DIALOG BOX -->
	<script>/*
		$(function() {
			var name = $("#file-name"), tips = $(".validateTips");
			
			function updateTips(t) {
				tips.text(t).addClass("ui-state-highlight");
				setTimeout(function() {
					tips.removeClass("ui-state-highlight", 1500);
				}, 500);
			}

			function checkLength(o, n, min, max) {
				if (o.val().length > max || o.val().length < min) {
					o.addClass("ui-state-error");
					updateTips("Length of " + n + " must be between " + min
							+ " and " + max + ".");
					return false;
				} else {
					return true;
				}
			}

			function checkRegexp(o, regexp, n) {
				if (!(regexp.test(o.val()))) {
					o.addClass("ui-state-error");
					updateTips(n);
					return false;
				} else {
					return true;
				}
}

	$( "#dialog-form" ).dialog({
														autoOpen : false,
								height : 300,
								width : 350,
								modal : true,
								buttons : {
									"Create new File" : function() {
										var bValid = true;

										bValid = bValid
												&& checkLength(name,
														"file-name", 3, 16);
										bValid = bValid
												&& checkRegexp(name,
														/^[a-z]([0-9a-z_])+$/i,
														"Username may consist of a-z, 0-9, underscores, begin with a letter.");

										console.log(name.val());
										var url = window.location.href;
										console.log(url);
										var regex = new RegExp("id=(.+)&");
										var username = url.split('id=')[1];
										var concatIDFN = username + name.val(); 
										console.log(concatIDFN);
										//createProject(Sname.val(),username);
										
										

										$("#para-block").show();
										$("#image-block").show();
										$("#pic-block").show();
									},
									Cancel : function() {
										$("#para-block").show();
										$("#image-block").show();
										$("#pic-block").show();
										$(this).dialog("close");
									}
								},
								close : function() {
									$("#para-block").show();
									$("#image-block").show();
									$("#pic-block").show();
									$(this).dialog("close");
								}
							});

			$("#create-new").button().click(function() {
				$("#para-block").hide();
				$("#image-block").hide();
				$("#pic-block").hide();
				$("#dialog-form").dialog("open");
			});
		});*/
		</script>
		<script>
		/*var request;
		$("#dialog-form").submit(function(event){
		    // abort any pending request
		    if (request) {
		        request.abort();
		    }
		    // setup some local variables
		    var $form = $(this);
		    // let's select and cache all the fields
		    var $inputs = $form.find("input, select, button, textarea");
		    // serialize the data in the form
		    var serializedData = $form.serialize();

		    // let's disable the inputs for the duration of the ajax request
		    $inputs.prop("disabled", true);

		    // fire off the request to /form.php
		    var request = $.ajax({
		        url: "/form.php",
		        type: "post",
		        data: serializedData
		    });
			
		    // callback handler that will be called on success
		    request.done(function (response, textStatus, jqXHR){
		        // log a message to the console
		        console.log("Hooray, it worked!");
		    });

		    // callback handler that will be called on failure
		    request.fail(function (jqXHR, textStatus, errorThrown){
		        // log the error to the console
		        console.error(
		            "The following error occured: "+
		            textStatus, errorThrown
		        );
		    });

		    // callback handler that will be called regardless
		    // if the request failed or succeeded
		    request.always(function () {
		        // reenable the inputs
		        $inputs.prop("disabled", false);
		    });

		    // prevent default posting of form
		    event.preventDefault();
		});*/
	</script>
	<!-- END OF DIALOG BOX -->



	<link type="text/css" rel="Stylesheet"
		href="http://d2c8yne9ot06t4.cloudfront.net/static/sttc/slideshow.css" />
	<link type="text/css" rel="Stylesheet"
		href="http://d2c8yne9ot06t4.cloudfront.net/static/js/Skins/Menu/minimalDropdown.css" />
</head>
<body vbid='B758A66638A84C89A90C026D41B2629E'
	domain='http://app.imcreator.com' onload=''
	style='background-color: rgb(255, 255, 255); background-position-x: left; background-position-y: top; background-repeat: repeat; background-attachment: scroll; position: absolute; width: 100%; height: 100%; margin: 0px;'>
	<!-- DIALOG BOX -->
	<!-- <div id="dialog-form" title="Create new File">
		<p class="validateTips">All form fields are required.</p>
		<form action="project">
			<fieldset>
				<label for="file-name">Name</label> <input type="text"
					name="file-name" id="file-name"
					class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</form>
	</div> -->
	<!-- END DIALOG BOX -->
	<div class='wrapperer'>
		<div class='page'
			style='position: relative; margin: 0px auto; width: 980px; height: 900px; overflow: hidden; background-color: rgb(255, 255, 255); background-position-x: undefined; background-position-y: undefined; background-repeat: undefined; background-attachment: undefined;'>
			<div class='WebsiteMenuBox '
				style='position: absolute; left: 722px; top: 36px; z-index: 20000; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 263px; height: 34px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; left: 682px; width: 292px; left: 682px; height: 34px;'>
				<style>
.WebsiteMenuBox li,a {
	-webkit-transition-property: color, background;
	-webkit-transition-duration: 0.2s, 0.2s;
	-webkit-transition-timing-function: linear, ease-in;
}

.WebsiteMenuBox li {
	float: left;
	text-decoration: none;
	padding-bottom: 6px;
	padding-top: 6px;
	padding-right: 10px;
	padding-left: 10px;
	margin-bottom: 1px;
	margin-right: 1px;
	font-size: 11px;
	color: rgb(255, 255, 255);
	font-family: arial, ArialRegular, helvetica, sans-serif;
	letter-spacing: 0px;
	background-color: rgb(0, 0, 0);
	direction: ltr;
}

.WebsiteMenuBox li:hover {
	color: rgb(32, 32, 32);
	background-color: rgb(144, 144, 144);
}

.WebsiteMenuBox li a:link {
	color: rgb(255, 255, 255);
}

.WebsiteMenuBox li a:visited {
	color: rgb(255, 255, 255);
}

.WebsiteMenuBox li a:hover {
	color: rgb(32, 32, 32);
}

.WebsiteMenuBox li a:active {
	color: rgb(255, 255, 255);
}

.WebsiteMenuBox li:hover a {
	color: rgb(32, 32, 32) !important;
}
</style>
				<ul id='topnav' style='float: right; padding: 0px; margin: 0px;'>
					<a
						style='text-decoration: none; color: rgb(32, 32, 32); font-family: arial, ArialRegular, helvetica, sans-serif; font-weight: Normal; letter-spacing: 0px;'
						title='Dashboad' href='dashboad.html'><li
						style='background-color: rgb(144, 144, 144); color: rgb(32, 32, 32);'>Dashboad</li></a>
					<a
						style='text-decoration: none; color: rgb(255, 255, 255); font-family: arial, ArialRegular, helvetica, sans-serif; font-weight: Normal; letter-spacing: 0px;'
						title='Editor' href='test/index.jsp'><li style=''>Editor</li></a>
					<a
						style='text-decoration: none; color: rgb(255, 255, 255); font-family: arial, ArialRegular, helvetica, sans-serif; font-weight: Normal; letter-spacing: 0px;'
						title='Feedback' href='feedback.html'><li style=''>Feedback</li></a>
				</ul>
			</div>
			<div class='PictureBox ' itemclicktype='none' social='false'
				id='image-block'
				style='position: absolute; left: -75px; top: -1px; z-index: 10001; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; width: 673px; height: 193px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 642px; height: 193px;'>
				<div class='inner-visible'
					style='position: relative; width: 642px; height: 193px;'>
					<IMG realWidth='640' cropX='41.5' cropY='-0.007421874999998579'
						realHeight='221'
						originalSrc='http://lh4.ggpht.com/4QnCJftQT8fTjt-tBhCYE3l1x6kVWf2M2WiJWZHAGqGvXTLefMpOXIDvuB9S7eT8vgvr7MTWSy7RT571CsY=s559'
						src='http://lh4.ggpht.com/4QnCJftQT8fTjt-tBhCYE3l1x6kVWf2M2WiJWZHAGqGvXTLefMpOXIDvuB9S7eT8vgvr7MTWSy7RT571CsY=s559'
						style='position: absolute; left: 42px; top: 0px; width: 559px; height: 193px;'></IMG>
				</div>
			</div>
			<div class='PictureBox ' itemclicktype='none' social='false'
				id='pic-block'
				style='position: absolute; left: 119px; top: 180px; z-index: 10002; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; width: 419px; height: 204px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 400px; height: 204px;'>
				<div class='inner-visible'
					style='position: relative; width: 400px; height: 204px;'>
					<IMG realWidth='612' cropX='98' cropY='0' realHeight='612'
						originalSrc='http://lh4.ggpht.com/hmldREctheSXXVcgxxn6NLRqf-U8MHr-PJjquuZoVYUCDqw6VHfVLY1I7c_2k1vWq9d-tp4DaSqqgehWuis=s204'
						src='http://lh4.ggpht.com/hmldREctheSXXVcgxxn6NLRqf-U8MHr-PJjquuZoVYUCDqw6VHfVLY1I7c_2k1vWq9d-tp4DaSqqgehWuis=s204'
						style='position: absolute; left: 98px; top: 0px; width: 204px; height: 204px;'></IMG>
				</div>
			</div>
			<div class='ParagraphBox ' id='para-block'
				style='position: absolute; left: 440px; top: 221px; z-index: 10003; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 408px; height: 194px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 392px; height: 194px; overflow: hidden;'>
				<div class='innerText'>
					<p style="text-align: left; margin: 0px;">
						<span
							style="font-family: BebasRegular; font-size: 28px; color: #000000; letter-spacing: 0em; line-height: 1em;">USER:
							BENJAMIN CHAN</span>
					</p>
					<p style="text-align: left; margin: 0px;">&nbsp;</p>
					<p style="text-align: left; margin: 0px;">
						<span
							style="color: #008080; letter-spacing: 0em; line-height: 1em;"><strong><span
								style="font-family: arial, ArialRegular, helvetica, sans-serif; font-size: 14px;">About
									me: Or so they say. This weekend, Dazed flew out to Lagos,
									Nigeria for the third annual MTV Africa Music.</span></strong></span>
					</p>
					<p style="text-align: left; margin: 0px;">&nbsp;</p>
				</div>
			</div>
			<div class=''
				style='position: absolute; left: 3px; top: 408px; z-index: 10004; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 1020px; height: 26px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 972px; height: 26px;'>
				<div class='dotted'
					style='position: absolute; left: 0px; top: 13px; width: 973px; height: 50%; border-top: 1px solid; border-color: rgb(128, 128, 128)'></div>
			</div>
			<div class=''
				style='position: absolute; left: 65px; top: 488px; z-index: 10005; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 878px; height: 385px; overflow: hidden; background-color: rgb(48, 48, 48); background-position-x: undefined; background-position-y: undefined; background-repeat: undefined; background-attachment: undefined; border-width: 0px; border-style: solid; border-color: transparent; border-color: rgb(0, 0, 0); -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 837px; height: 385px;'>
			</div>
			<div class='ParagraphBox '
				style='position: absolute; left: 64px; top: 520px; z-index: 10006; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px; width: 878px; height: 332px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 839px; height: 332px; overflow: hidden;'>
				<div class='innerText'>
					<p style="margin: 0px; text-align: center;">
						<span
							style="font-family: BebasRegular; font-size: 28px; letter-spacing: 0em; line-height: 1em; color: #ffffff;">
							<% 
							out.println("benaijf"); %></span>	 
					</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">
						<span
							style="font-family: BebasRegular; font-size: 16px; letter-spacing: 0em; line-height: 1em; color: #ffffff;">Description
							: Describes &nbsp; Project 1</span>
					</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">
						<span
							style="font-family: BebasRegular; color: #ffffff; font-size: 28px;">Name:
							Project 2</span>
					</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">
						<span style="font-family: BebasRegular; color: #ffffff;">Description
							: Describes &nbsp; Project 2</span>
					</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">
						<span
							style="font-family: BebasRegular; color: #ffffff; font-size: 28px;">Name:
							Project 3</span>
					</p>
					<p style="text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">
						<span style="font-family: BebasRegular; color: #ffffff;">Description
							: Describes Project 3</span>
					</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="margin: 0px; text-align: center;">&nbsp;</p>
					<p style="text-align: left; margin: 0px;">&nbsp;</p>
				</div>
			</div>
			<div id="light" class="white_content">
			<form action="dashboard" method="post">
				Name your project:
					<input type="text" name="projectname" /><input type="submit" name="Submit">
				</form>
			</div>
			<div id="fade" class="black_overlay"></div>
			
				<div class='TitleBox '
					style='position: absolute; left: 256px; top: 427px; z-index: 10007; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; width: 485px; height: 100px; overflow: hidden; border-width: 0px; border-style: solid; border-color: transparent; border-color: #000000; -webkit-border-radius: 0px; -moz-border-radius: 0px; border-radius: 0px; width: 463px; height: 100px;'>
					<div class='innerText'>
						<span class="textAreaWrapper" style="font-size: 1776px;"
							originalfontsize="444px">
							<p style="font-family: arial; font-size: 1776px; margin: 0px;"
								originalfontsize="444px">
								<span style="font-family: 'Quicksand regular'; font-size: 40px;"
									originalfontsize="10px">
									<!-- <button type="button" id="create-new">+Create a new
										project</button> -->
										<a href="#" onclick="openDimmer()">+Create a new
										project</a>
										
								</span>
							</p>
						</span>
					</div>
				</div>
			

		</div>
</body>
</html>