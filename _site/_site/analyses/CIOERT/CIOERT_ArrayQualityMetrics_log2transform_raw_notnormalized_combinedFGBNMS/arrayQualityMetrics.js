// (C) Wolfgang Huber 2010-2011

// Script parameters - these are set up by R in the function 'writeReport' when copying the 
//   template for this script from arrayQualityMetrics/inst/scripts into the report.

var highlightInitial = [ true, false, false, false, false, false, false, false, true, true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true, false, false, false ];
var arrayMetadata    = [ [ "1", "1_1", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "1", "FGBNMS-West", "2011", "depth100-200", "WL14T" ], [ "2", "1_2", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "2", "FGBNMS-East", "2011", "depth100-200", "EH46T-4" ], [ "3", "1_3", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "3", "FGBNMS-West", "2010", "depth50-100", "WBHR2" ], [ "4", "1_4", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "4", "FGBNMS-East", "2010", "depth50-100", "EBHR11" ], [ "5", "1_5", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "5", "FGBNMS-East", "2011", "depth100-200", "EH54T" ], [ "6", "1_6", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "6", "FGBNMS-East", "2011", "depth100-200", "EL25T" ], [ "7", "1_7", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "7", "FGBNMS-West", "2011", "depth100-200", "WH10T" ], [ "8", "1_8", "1", "8/30/12", "253295110035_2012-08-30_0470_0002.gpr", "8", "FGBNMS-West", "2011", "depth100-200", "WH19T" ], [ "9", "2_1", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "1", "FGBNMS-East", "2011", "depth100-200", "EH40T" ], [ "10", "2_2", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "2", "FGBNMS-East", "2011", "depth100-200", "EH49T" ], [ "11", "2_3", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "3", "FGBNMS-West", "2011", "depth100-200", "WL6T-3" ], [ "12", "2_4", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "4", "FGBNMS-West", "2011", "depth100-200", "WH9T-2" ], [ "13", "2_5", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "5", "FGBNMS-West", "2010", "depth50-100", "WBHR11" ], [ "14", "2_6", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "6", "FGBNMS-East", "2010", "depth50-100", "EBHR8" ], [ "15", "2_7", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "7", "FGBNMS-West", "2011", "depth100-200", "WH17T" ], [ "16", "2_8", "2", "9/6/12", "253295110059_2012-09-06_0430_0002.gpr", "8", "FGBNMS-West", "2011", "depth100-200", "WH9T-1" ], [ "17", "3_1", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "1", "FGBNMS-East", "2010", "depth50-100", "EBHR18" ], [ "18", "3_2", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "2", "FGBNMS-East", "2010", "depth50-100", "EBHR21" ], [ "19", "3_3", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "3", "FGBNMS-East", "2011", "depth100-200", "EH24T" ], [ "20", "3_4", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "4", "FGBNMS-West", "2010", "depth50-100", "WBHR24" ], [ "21", "3_5", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "5", "FGBNMS-East", "2010", "depth50-100", "EBHR17" ], [ "22", "3_6", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "6", "FGBNMS-West", "2011", "depth100-200", "WL6T-4" ], [ "23", "3_7", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "7", "FGBNMS-East", "2011", "depth100-200", "EH46T-3" ], [ "24", "3_8", "3", "8/30/12", "253295110062_2012-08-30_0470_0002.gpr", "8", "FGBNMS-West", "2010", "depth50-100", "WBHR18_1" ], [ "25", "4_1", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "1", "tortugas", "2010", "depth100-200", "12-VII-10-1-6" ], [ "26", "4_2", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "2", "tortugas", "2010", "depth100-200", "12-VII-10-1-5" ], [ "27", "4_3", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "3", "pulley", "2010", "depth200-300", "4-VIII-10-1-1" ], [ "28", "4_4", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "4", "tortugas", "2010", "depth100-200", "12-VII-10-4-1" ], [ "29", "4_5", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "5", "tortugas", "2010", "depth100-200", "12-VII-10-1-2" ], [ "30", "4_6", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "6", "tortugas", "2010", "depth100-200", "12-VII-10-1-3" ], [ "31", "4_7", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "7", "tortugas", "2010", "depth100-200", "12-VII-10-1-4a" ], [ "32", "4_8", "4", "10/9/13", "253295110069_2013-10-09_0420.gpr", "8", "tortugas", "2010", "depth100-200", "12-VII-10-1-4b" ], [ "33", "5_1", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "1", "pulley", "2012", "depth200-300", "22-VIII-12-4-017" ], [ "34", "5_2", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "2", "pulley", "2012", "depth200-300", "22-VIII-12-4-014" ], [ "35", "5_3", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "3", "pulley", "2012", "depth200-300", "23-VIII-12-1-010D" ], [ "36", "5_4", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "4", "pulley", "2012", "depth200-300", "23-VIII-12-3-005" ], [ "37", "5_5", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "5", "pulley", "2011", "depth200-300", "15-IX-11-2-3" ], [ "38", "5_6", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "6", "pulley", "2011", "depth200-300", "16-IX-11-2-2" ], [ "39", "5_7", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "7", "pulley", "2011", "depth200-300", "15-IX-11-2-1" ], [ "40", "5_8", "5", "10/4/13", "253295110070_2013-10-04_0420.gpr", "8", "pulley", "2012", "depth200-300", "19-VIII-12-4-008" ], [ "41", "6_1", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "1", "tortugas", "2010", "depth100-200", "12-VII-10-1-1" ], [ "42", "6_2", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "2", "pulley", "2012", "depth200-300", "19-VIII-12-4-9" ], [ "43", "6_3", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "3", "pulley", "2012", "depth200-300", "22-VIII-12-4-019" ], [ "44", "6_4", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "4", "pulley", "2011", "depth200-300", "16-IX-11-1-5" ], [ "45", "6_5", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "5", "pulley", "2012", "depth200-300", "22-VIII-12-4-021" ], [ "46", "6_6", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "6", "pulley", "2012", "depth200-300", "22-VIII-12-4-018" ], [ "47", "6_7", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "7", "pulley", "2012", "depth200-300", "23-VIII-12-1-010" ], [ "48", "6_8", "6", "9/26/13", "253295110080_2013-09-26_0400.gpr", "8", "pulley", "2012", "depth200-300", "22-VIII-12-4-024" ], [ "49", "7_1", "7", "9/13/12", "253295110064_2012-09-13_0430_FGB(arrays1-2)_JIMAR(arrays3-8).gpr", "1", "FGBNMS-West", "2010", "depth50-100", "WBLRa2" ], [ "50", "7_2", "7", "9/13/12", "253295110064_2012-09-13_0430_FGB(arrays1-2)_JIMAR(arrays3-8).gpr", "2", "FGBNMS-West", "2010", "depth50-100", "WBH18_2" ] ];
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
