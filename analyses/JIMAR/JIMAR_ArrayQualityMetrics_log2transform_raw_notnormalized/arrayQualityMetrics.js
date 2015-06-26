// (C) Wolfgang Huber 2010-2011

// Script parameters - these are set up by R in the function 'writeReport' when copying the 
//   template for this script from arrayQualityMetrics/inst/scripts into the report.

var highlightInitial = [ false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ];
var arrayMetadata    = [ [ "1", "1_3", "1", "9/13/12", "253295110064", "3", "H", "JOH-07", "HI-1001-017A" ], [ "2", "1_4", "1", "9/13/12", "253295110064", "4", "DZ", "JOH-10", "HI-1001-028" ], [ "3", "1_5", "1", "9/13/12", "253295110064", "5", "H-DZ", "JOH-11", "HI-1001-021" ], [ "4", "1_6", "1", "9/13/12", "253295110064", "6", "H-DZ", "JOH-10", "HI-1001-002" ], [ "5", "1_7", "1", "9/13/12", "253295110064", "7", "H-DZ", "JOH-11", "HI-1001-030" ], [ "6", "1_8", "1", "9/13/12", "253295110064", "8", "H", "JOH-07", "HI-1001-017B" ], [ "7", "2_1", "2", "8/16/12", "253295110067", "1", "DZ", "JOH-10", "HI-1001-002" ], [ "8", "2_2", "2", "8/16/12", "253295110067", "2", "H", "JOH-07", "HI-1001-017C" ], [ "9", "2_3", "2", "8/16/12", "253295110067", "3", "D-DZ", "JOH-11", "HI-1001-012" ], [ "10", "2_4", "2", "8/16/12", "253295110067", "4", "H", "JOH-10", "HI-1001-022" ], [ "11", "2_5", "2", "8/16/12", "253295110067", "5", "H", "JOH-11", "HI-1001-021" ], [ "12", "2_6", "2", "8/16/12", "253295110067", "6", "DZ", "JOH-11", "HI-1001-013" ], [ "13", "2_7", "2", "8/16/12", "253295110067", "7", "H-DZ", "JOH-18", "HI-1001-008" ], [ "14", "2_8", "2", "8/16/12", "253295110067", "8", "DZ", "JOH-18", "HI-1001-004" ], [ "15", "3_1", "3", "8/9/12", "253295110050", "1", "DZ", "JOH-18", "HI-1001-006" ], [ "16", "3_2", "3", "8/9/12", "253295110050", "2", "H", "JOH-07", "HI-1001-018A" ], [ "17", "3_3", "3", "8/9/12", "253295110050", "3", "H", "JOH-10", "HI-1001-024" ], [ "18", "3_4", "3", "8/9/12", "253295110050", "4", "DZ", "JOH-11", "HI-1001-023" ], [ "19", "3_5", "3", "8/9/12", "253295110050", "5", "DZ", "JOH-18", "HI-1001-008" ], [ "20", "3_6", "3", "8/9/12", "253295110050", "6", "H-DZ", "JOH-11", "HI-1001-013 " ], [ "21", "3_7", "3", "8/9/12", "253295110050", "7", "DZ", "JOH-11", "HI-1001-012" ], [ "22", "3_8", "3", "8/9/12", "253295110050", "8", "DZ", "JOH-10", "HI-1001-027" ] ];
var svgObjectNames   = [ "pca", "dens" ];

var cssText = ["stroke-width:1; stroke-opacity:0.4",
               "stroke-width:3; stroke-opacity:1" ];

// Global variables - these are set up below by 'reportinit'
var tables;             // array of all the associated ('tooltips') tables on the page
var checkboxes;         // the checkboxes
var ssrules;


function reportinit() 
{
 
    var a, i, status;

    /*--------find checkboxes and set them to start values------*/
    checkboxes = document.getElementsByName("ReportObjectCheckBoxes");
    if(checkboxes.length != highlightInitial.length)
	throw new Error("checkboxes.length=" + checkboxes.length + "  !=  "
                        + " highlightInitial.length="+ highlightInitial.length);
    
    /*--------find associated tables and cache their locations------*/
    tables = new Array(svgObjectNames.length);
    for(i=0; i<tables.length; i++) 
    {
        tables[i] = safeGetElementById("Tab:"+svgObjectNames[i]);
    }

    /*------- style sheet rules ---------*/
    var ss = document.styleSheets[0];
    ssrules = ss.cssRules ? ss.cssRules : ss.rules; 

    /*------- checkboxes[a] is (expected to be) of class HTMLInputElement ---*/
    for(a=0; a<checkboxes.length; a++)
    {
	checkboxes[a].checked = highlightInitial[a];
        status = checkboxes[a].checked; 
        setReportObj(a+1, status, false);
    }

}


function safeGetElementById(id)
{
    res = document.getElementById(id);
    if(res == null)
        throw new Error("Id '"+ id + "' not found.");
    return(res)
}

/*------------------------------------------------------------
   Highlighting of Report Objects 
 ---------------------------------------------------------------*/
function setReportObj(reportObjId, status, doTable)
{
    var i, j, plotObjIds, selector;

    if(doTable) {
	for(i=0; i<svgObjectNames.length; i++) {
	    showTipTable(i, reportObjId);
	} 
    }

    /* This works in Chrome 10, ssrules will be null; we use getElementsByClassName and loop over them */
    if(ssrules == null) {
	elements = document.getElementsByClassName("aqm" + reportObjId); 
	for(i=0; i<elements.length; i++) {
	    elements[i].style.cssText = cssText[0+status];
	}
    } else {
    /* This works in Firefox 4 */
	var success = false;
	i = 0; 
	/* Some of this looping could already be cached in reportInit() */
	while( (!success) & (i < ssrules.length) ) {
	    selector = ssrules[i].selectorText;  // The selector 
            if (!selector) 
		continue; // Skip @import and other nonstyle rules
            if (selector == (".aqm" + reportObjId)) {
		success = true; 
		ssrules[i].style.cssText = cssText[0+status];
	    } else {
		i++;
	    }
	}
    }

}

/*------------------------------------------------------------
   Display of the Metadata Table
  ------------------------------------------------------------*/
function showTipTable(tableIndex, reportObjId)
{
    var rows = tables[tableIndex].rows;
    var a = reportObjId - 1;

    if(rows.length != arrayMetadata[a].length)
	throw new Error("rows.length=" + rows.length+"  !=  arrayMetadata[array].length=" + arrayMetadata[a].length);

    for(i=0; i<rows.length; i++) 
 	rows[i].cells[1].innerHTML = arrayMetadata[a][i];
}

function hideTipTable(tableIndex)
{
    var rows = tables[tableIndex].rows;

    for(i=0; i<rows.length; i++) 
 	rows[i].cells[1].innerHTML = "";
}


/*------------------------------------------------------------
  From module 'name' (e.g. 'density'), find numeric index in the 
  'svgObjectNames' array.
  ------------------------------------------------------------*/
function getIndexFromName(name) 
{
    var i;
    for(i=0; i<svgObjectNames.length; i++)
        if(svgObjectNames[i] == name)
	    return i;

    throw new Error("Did not find '" + name + "'.");
}


/*------------------------------------------------------------
  SVG plot object callbacks
  ------------------------------------------------------------*/
function plotObjRespond(what, reportObjId, name)
{

    var a, i, status;

    switch(what) {
    case "show":
	i = getIndexFromName(name);
	showTipTable(i, reportObjId);
	break;
    case "hide":
	i = getIndexFromName(name);
	hideTipTable(i);
	break;
    case "click":
        a = reportObjId - 1;
	status = !checkboxes[a].checked;
	checkboxes[a].checked = status;
	setReportObj(reportObjId, status, true);
	break;
    default:
	throw new Error("Invalid 'what': "+what)
    }
}

/*------------------------------------------------------------
  checkboxes 'onchange' event
------------------------------------------------------------*/
function checkboxEvent(reportObjId)
{
    var a = reportObjId - 1;
    var status = checkboxes[a].checked;
    setReportObj(reportObjId, status, true);
}


/*------------------------------------------------------------
  toggle visibility
------------------------------------------------------------*/
function toggle(id){
  var head = safeGetElementById(id + "-h");
  var body = safeGetElementById(id + "-b");
  var hdtxt = head.innerHTML;
  var dsp;
  switch(body.style.display){
    case 'none':
      dsp = 'block';
      hdtxt = '-' + hdtxt.substr(1);
      break;
    case 'block':
      dsp = 'none';
      hdtxt = '+' + hdtxt.substr(1);
      break;
  }  
  body.style.display = dsp;
  head.innerHTML = hdtxt;
}
