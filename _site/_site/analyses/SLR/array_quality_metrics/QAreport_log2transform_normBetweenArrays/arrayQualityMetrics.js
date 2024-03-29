// (C) Wolfgang Huber 2010-2011

// Script parameters - these are set up by R in the function 'writeReport' when copying the 
//   template for this script from arrayQualityMetrics/inst/scripts into the report.

var highlightInitial = [ false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ];
var arrayMetadata    = [ [ "1", "1_4", " 1", "63600_2013-05-24_250_array4.gpr", "5/24/2013", "2", "South", "4", "Oct12" ], [ "2", "1_3", " 1", "63600_2013-05-24_300_array3.gpr", "5/24/2013", "5", "Ledge", "3", "Jun12" ], [ "3", "1_2", " 1", "63600_2013-05-24_370_arrays1,2.gpr", "5/24/2013", "5", "South", "2", "Jun12" ], [ "4", "1_1", " 1", "63600_2013-05-24_250_array1.gpr", "5/24/2013", "5", "Ledge", "1", "JanFeb13" ], [ "5", "2_4", " 2", "63600_2013-12-05_0220_array4.gpr", "12/5/2013", "4", "Central", "4", "JanFeb13" ], [ "6", "2_3", " 2", "63600_2013-12-05_0220_array3.gpr", "12/5/2013", "5", "South", "3", "Oct12" ], [ "7", "2_2", " 2", "63600_2013-12-05_0300_arrays1,2.gpr", "12/5/2013", "3", "Ledge", "2", "JanFeb13" ], [ "8", "2_1", " 2", "63600_2013-12-05_0300_arrays1,2.gpr", "12/5/2013", "5", "Ledge", "1", "Oct12" ], [ "9", "3_4", " 3", "63601_2013-06-06_0240_array4.gpr", "6/6/2013", "8", "Ledge", "4", "Oct12" ], [ "10", "3_3", " 3", "63601_2013-06-06_300_arrays1,2,3.gpr", "6/6/2013", "4", "South", "3", "Oct12" ], [ "11", "3_2", " 3", "63601_2013-06-06_300_arrays1,2,3.gpr", "6/6/2013", "2", "Central", "2", "JanFeb13" ], [ "12", "3_1", " 3", "63601_2013-06-06_300_arrays1,2,3.gpr", "6/6/2013", "6", "Ledge", "1", "Oct12" ], [ "13", "4_4", " 4", "63605_2013-06-11_array4.gpr", "6/11/2013", "2", "Central", "4", "Jun12" ], [ "14", "4_3", " 4", "63605_2013-06-11_array3.gpr", "6/11/2013", "5", "South", "3", "Jun12" ], [ "15", "4_2", " 4", "63605_2013-06-11_300_arrays1,2.gpr", "6/11/2013", "5", "Ledge", "2", "Jun12" ], [ "16", "4_1", " 4", "63605_2013-06-11_300_arrays1,2.gpr", "6/11/2013", "1", "South", "1", "Jun12" ], [ "17", "5_4", " 5", "63606_2013-06-11_240_array4.gpr", "6/11/2013", "2", "South", "4", "JanFeb13" ], [ "18", "5_3", " 5", "63606_2013-06-11_0270_array3.gpr", "6/11/2013", "4", "South", "3", "JanFeb13" ], [ "19", "5_2", " 5", "63606_2013-06-11_300_arrays1,2.gpr", "6/11/2013", "6", "Ledge", "2", "JanFeb13" ], [ "20", "5_1", " 5", "63606_2013-06-11_300_arrays1,2.gpr", "6/11/2013", "5", "South", "1", "JanFeb13" ], [ "21", "6_4", " 6", "63608_2013-12-05_0270_array4.gpr", "12/5/2013", "2", "Ledge", "4", "Jun12" ], [ "22", "6_3", " 6", "63608_2013-12-05_0270_array3.gpr", "12/5/2013", "1", "South", "3", "Jun12" ], [ "23", "6_2", " 6", "63608_2013-12-05_0280_arrays1,2.gpr", "12/5/2013", "6", "Central", "2", "JanFeb13" ], [ "24", "6_1", " 6", "63608_2013-12-05_0280_arrays1,2.gpr", "12/5/2013", "8", "Ledge", "1", "JanFeb13" ], [ "25", "7_4", " 7", "63710_2013-05-24_array4.gpr", "5/24/2013", "6", "Central", "4", "Jun12" ], [ "26", "7_3", " 7", "63710_2013-05-24_300_array3.gpr", "5/24/2013", "2", "Central", "3", "Jun12" ], [ "27", "7_2", " 7", "63710_2013-05-24_350_arrays1,2.gpr", "5/24/2013", "2", "South", "2", "Jun12" ], [ "28", "7_1", " 7", "63710_2013-05-24_350_arrays1,2.gpr", "5/24/2013", "6", "Ledge", "1", "Jun12" ], [ "29", "8_4", " 8", "63768_2013-05-30_230_array4.gpr", "5/30/2013", "5", "South", "4", "JanFeb13" ], [ "30", "8_3", " 8", "63768_2013-05-30_250_array3.gpr", "5/30/2013", "6", "Ledge", "3", "JanFeb13" ], [ "31", "8_2", " 8", "63768_2013-05-30_300_arrays1,2.gpr", "5/30/2013", "2", "South", "2", "JanFeb13" ], [ "32", "8_1", " 8", "63768_2013-05-30_300_arrays1,2.gpr", "5/30/2013", "4", "South", "1", "JanFeb13" ], [ "33", "9_4", " 9", "63769_2013-05-30_230_arrays3,4.gpr", "5/30/2013", "6", "Ledge", "4", "Oct12" ], [ "34", "9_3", " 9", "63769_2013-05-30_230_arrays3,4.gpr", "5/30/2013", "2", "Central", "3", "JanFeb13" ], [ "35", "9_2", " 9", "63769_2013-05-30_300_arrays1,2.gpr", "5/30/2013", "4", "South", "2", "Oct12" ], [ "36", "9_1", " 9", "63769_2013-05-30_300_arrays1,2.gpr", "5/30/2013", "8", "Ledge", "1", "Oct12" ], [ "37", "10_4", "10", "63770_2013-06-05_0220_all.gpr", "6/5/2013", "8", "Ledge", "4", "Oct12" ], [ "38", "10_3", "10", "63770_2013-06-05_0220_all.gpr", "6/5/2013", "4", "South", "3", "Jun12" ], [ "39", "10_2", "10", "63770_2013-06-05_0220_all.gpr", "6/5/2013", "2", "Central", "2", "Jun12" ], [ "40", "10_1", "10", "63770_2013-06-05_0220_all.gpr", "6/5/2013", "6", "Ledge", "1", "Jun12" ], [ "41", "11_4", "11", "63771_2013-06-06_220_array4.gpr", "6/6/2013", "2", "South", "4", "JanFeb13" ], [ "42", "11_3", "11", "63771_2013-06-06_0250_arrays1,2,3.gpr", "6/6/2013", "4", "South", "3", "JanFeb13" ], [ "43", "11_2", "11", "63771_2013-06-06_0250_arrays1,2,3.gpr", "6/6/2013", "6", "Ledge", "2", "JanFeb13" ], [ "44", "11_1", "11", "63771_2013-06-06_0250_arrays1,2,3.gpr", "6/6/2013", "5", "South", "1", "JanFeb13" ] ];
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
