
<!DOCTYPE html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style type="text/css">

    body{
    margin:0;
    padding:0;
    line-height: 1.5em;
    }

    b{font-size: 110%;}
    em{color: red;}


    #topsection{
    background: #EAEAEA;
    height: 50px; /*Height of top section*/
    font-style: normal;
    }

    #topsection h1{
    margin: 0;
    padding-top: 15px;
    font-style: normal;
    }

    #contentwrapper{
    float: left;
    width: 100%;
    }

    #contentcolumn{
    margin-right: 500px; /*Set right margin to RightColumnWidth*/
    }

    #rightcolumn{
    float: left;
    width: 500px; /*Width of right column in pixels*/
    margin-left: -500px; /*Set left margin to -(RightColumnWidth) */
    
    }

    #footer{
    clear: left;
    width: 100%;
    background: black;
    color: #FFF;
    text-align: center;
    padding: 4px 0;
    }

    #footer a{
    color: #FFFF80;
    }

    .innertube{
    margin: 10px; /*Margins for inner DIV inside each column (to provide padding)*/
    margin-top: 0;
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
    z-index:1001;
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
            z-index:1002;
            font-family: "Verdana";
            font-size: 12px;
            overflow: auto;
        }
    </style>
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
    <script language="Javascript" type="text/javascript" src="../edit_area/edit_area_full.js"></script>
    <script language="Javascript" type="text/javascript">
      // initialisation
      editAreaLoader.init({
        id: "mycode" // id of the textarea to transform    
        ,start_highlight: true  // if start with highlight
        ,allow_resize: "both"
        ,allow_toggle: true
        ,word_wrap: true
        ,language: "en"
        ,syntax: "html"
        ,replace_tab_by_spaces: 4
        ,toolbar:  "fullscreen, |, undo, redo, |, select_font, syntax_selection,|" 
        ,syntax_selection_allow: "css,html,js,php,xml"
        ,allow_toggle: false
        ,is_multiple_files: true
      });
      
      
      // callback functions
      function my_save(id, content){
        alert("Here is the content of the EditArea '"+ id +"' as received by the save callback function:\n"+content);
      }
      
      function my_load(id){
        editAreaLoader.setValue(id, "The content is loaded from the load_callback function into EditArea");
      }
      
      function test_setSelectionRange(id){
        editAreaLoader.setSelectionRange(id, 100, 150);
      }
      
      function test_getSelectionRange(id){
        var sel =editAreaLoader.getSelectionRange(id);
        alert("start: "+sel["start"]+"\nend: "+sel["end"]); 
      }
      
      function test_setSelectedText(id){
        text= "[REPLACED SELECTION]"; 
        editAreaLoader.setSelectedText(id, text);
      }
      
      function test_getSelectedText(id){
        alert(editAreaLoader.getSelectedText(id)); 
      }
      
      function editAreaLoaded(id){
        if(id=="example_2")
        {
          open_file1();
          open_file2();
        }
      }


      function createFile()
      {
        var fileName = document.getElementById("filename").value.concat(".",document.getElementById("filetype").value);

        var new_file= {id: fileName, text: "", syntax: document.getElementById("filetype").value};
        editAreaLoader.openFile('mycode', new_file);

        /*
        var lightbox = document.getElementById("lightbox");
        lightbox.style.visibility= 'hidden';
        lightbox.close();
        document.body.removeChild('dimmer');
        */
        document.getElementById('light').style.display='none';
        document.getElementById('fade').style.display='none';

      }

      
      
      
      
      function toogle_editable(id)
      {
        editAreaLoader.execCommand(id, 'set_editable', !editAreaLoader.execCommand(id, 'is_editable'));
      }
    </script>
    <script language="Javascript" type="text/javascript">

      //Code for dimmer
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
    
    <script>
      function update()
      {
         //var x = document.getElementById('mycode').value;
         var x = editAreaLoader.getValue("mycode");
         var s = document.getElementById('display');
         s.contentDocument.documentElement.innerHTML=x
         //frames['display'].document.documentElement.innerHTML = x;
      }
    </script>

  </head>
  
  <body>
    <div id="maincontainer">

      <div id="topsection">
        <div class="innertube">
          <div id="light" class="white_content">
            <h3>Create a new file</h3>
            <form name="newfile">
              <table>
                <tr>
                  <td>File Name: </td>
                  <td><input type=text size=20 id=filename></td>
                </tr>
                <tr>
                  <td>File Type: </td>
                  <td>
                    <select id="filetype">
                      <option value="html">HTML</option>
                      <option value="css">CSS</option>
                      <option value="js">Javascript</option>
                      <option value="xml">XML</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td><button type="button" onClick="createFile()">Create</button></td>
                  <td><button type="button" onClick="closeDimmer()">Cancel</button></td>
                </tr>

              </table>
            </form>

          </div>
          <div id="fade" class="black_overlay"></div>
          <button type="button" onClick="openDimmer()">New File</button>
        </div>
      </div>

      <div id="contentwrapper">
      <div id="contentcolumn">
        <div class="innertube"><textarea id="mycode" style="height: 560px; width: 100%;"></textarea> 
          </div>
      </div>
      </div>
      
      
      <div id="rightcolumn">
      <div class="innertube">
        <input onclick="update();" value="Show Me!" type="button">
        <iframe id="display" style="display:block; width:100%; height:535px;"></iframe></div>
      </div>

    </div>
  </body>
  
</html>