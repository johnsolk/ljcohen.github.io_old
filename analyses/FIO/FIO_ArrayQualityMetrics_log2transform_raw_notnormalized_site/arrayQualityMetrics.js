// (C) Wolfgang Huber 2010-2011

// Script parameters - these are set up by R in the function 'writeReport' when copying the 
//   template for this script from arrayQualityMetrics/inst/scripts into the report.

var highlightInitial = [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ];
var arrayMetadata    = [ [ "1", "1_1", "2", "A", "A2", "WL103", "WL", "pink zip", "B", "O", "C", "BOC" ], [ "2", "1_2", "2", "A", "A2", "WL102", "WL", "black zip", "B", "O", "C", "BOC" ], [ "3", "1_3", "2", "A", "A2", "WL104", "WL", "orange", "B", "O", "C", "BOC" ], [ "4", "1_4", "2", "A", "A2", "WL105", "WL", "neon yellow", "B", "O", "C", "BOC" ], [ "5", "1_5", "7", "A", "A7", "WL101", "WL", "green zip", "H", "U", "D", "HUD" ], [ "6", "1_6", "7", "A", "A7", "WL102", "WL", "black zip", "H", "U", "D", "HUD" ], [ "7", "1_7", "7", "A", "A7", "WL103", "WL", "pink zip", "H", "U", "D", "HUD" ], [ "8", "1_8", "7", "A", "A7", "WL104", "WL", "orange", "H", "U", "D", "HUD" ], [ "9", "2_1", "1", "A", "A1", "WL105", "WL", "neon yellow", "B", "O", "D", "BOD" ], [ "10", "2_2", "1", "A", "A1", "WL104", "WL", "orange", "B", "O", "D", "BOD" ], [ "11", "2_3", "7", "B", "B7", "EL105", "EL", "full red", "H", "O", "D", "HOD" ], [ "12", "2_4", "7", "B", "B7", "EL104", "EL", "full blue", "H", "O", "D", "HOD" ], [ "13", "2_5", "7", "B", "B7", "WW102", "WW", "1/2 purple", "H", "O", "D", "HOD" ], [ "14", "2_6", "7", "B", "B7", "WW101", "WW", "1/2 white", "H", "O", "D", "HOD" ], [ "15", "2_7", "7", "B", "B7", "WW104", "WW", "1/2 blue", "H", "O", "D", "HOD" ], [ "16", "2_8", "7", "B", "B7", "WW103", "WW", "1/2 yellow", "H", "O", "D", "HOD" ], [ "17", "3_1", "6", "B", "B6", "WW102", "WW", "1/2 purple", "H", "U", "D", "HUD" ], [ "18", "3_2", "6", "B", "B6", "WW101", "WW", "1/2 white", "H", "U", "D", "HUD" ], [ "19", "3_3", "6", "B", "B6", "WW104", "WW", "1/2 blue", "H", "U", "D", "HUD" ], [ "20", "3_4", "6", "B", "B6", "WW103", "WW", "1/2 yellow", "H", "U", "D", "HUD" ], [ "21", "3_5", "6", "B", "B6", "WL105", "WL", "neon yellow", "H", "U", "D", "HUD" ], [ "22", "3_6", "6", "B", "B6", "WW105", "WW", "1/2 red", "H", "U", "D", "HUD" ], [ "23", "3_7", "8", "A", "A8", "EL101", "EL", "full white", "B", "U", "C", "BUC" ], [ "24", "3_8", "7", "A", "A7", "WL105", "WL", "neon yellow", "H", "U", "D", "HUD" ], [ "25", "4_1", "4", "A", "A4", "EL103", "EL", "full yellow", "H", "U", "C", "HUC" ], [ "26", "4_2", "7", "B", "B7", "EL102", "EL", "full purple", "H", "O", "D", "HOD" ], [ "27", "4_3", "4", "A", "A4", "WW101", "WW", "1/2 white", "H", "U", "C", "HUC" ], [ "28", "4_4", "4", "A", "A4", "EL104", "EL", "full blue", "H", "U", "C", "HUC" ], [ "29", "4_5", "4", "A", "A4", "WW105", "WW", "1/2 red", "H", "U", "C", "HUC" ], [ "30", "4_6", "4", "A", "A4", "WW104", "WW", "1/2 blue", "H", "U", "C", "HUC" ], [ "31", "4_7", "5", "C", "C5", "WL103", "WL", "pink zip", "H", "O", "D", "HOD" ], [ "32", "4_8", "5", "C", "C5", "WL102", "WL", "black zip", "H", "O", "D", "HOD" ], [ "33", "5_1", "6", "B", "B6", "EL101", "EL", "full white", "H", "U", "D", "HUD" ], [ "34", "5_2", "6", "B", "B6", "EL102", "EL", "full purple", "H", "U", "D", "HUD" ], [ "35", "5_3", "6", "B", "B6", "EL104", "EL", "full blue", "H", "U", "D", "HUD" ], [ "36", "5_4", "4", "A", "A4", "EL101", "EL", "full white", "H", "U", "C", "HUC" ], [ "37", "5_5", "4", "A", "A4", "WW102", "WW", "1/2 purple", "H", "U", "C", "HUC" ], [ "38", "5_6", "5", "A", "A5", "WW102", "WW", "1/2 purple", "H", "O", "D", "HOD" ], [ "39", "5_7", "5", "C", "C5", "WL104", "WL", "orange", "H", "O", "D", "HOD" ], [ "40", "5_8", "4", "A", "A4", "WW103", "WW", "1/2 yellow", "H", "U", "C", "HUC" ], [ "41", "6_1", "5", "A", "A5", "EL102", "EL", "full purple", "H", "O", "D", "HOD" ], [ "42", "6_2", "5", "A", "A5", "EL104", "EL", "full blue", "H", "O", "D", "HOD" ], [ "43", "6_3", "5", "C", "C5", "WW105", "WW", "1/2 red", "H", "O", "D", "HOD" ], [ "44", "6_4", "5", "C", "C5", "EL103", "EL", "full yellow", "H", "O", "D", "HOD" ], [ "45", "6_5", "4", "A", "A4", "WL104", "WL", "orange", "H", "U", "C", "HUC" ], [ "46", "6_6", "5", "C", "C5", "WW101", "WW", "1/2 white", "H", "O", "D", "HOD" ], [ "47", "6_7", "5", "C", "C5", "EL104", "EL", "full blue", "H", "O", "D", "HOD" ], [ "48", "6_8", "5", "C", "C5", "WW102", "WW", "1/2 purple", "H", "O", "D", "HOD" ], [ "49", "7_1", "4", "A", "A4", "WL103", "WL", "pink zip", "H", "U", "C", "HUC" ], [ "50", "7_2", "5", "A", "A5", "WL101", "WL", "green zip", "H", "O", "D", "HOD" ], [ "51", "7_3", "5", "A", "A5", "WW104", "WW", "1/2 blue", "H", "O", "D", "HOD" ], [ "52", "7_4", "5", "A", "A5", "EL103", "EL", "full yellow", "H", "O", "D", "HOD" ], [ "53", "7_5", "5", "C", "C5", "EL102", "EL", "full purple", "H", "O", "D", "HOD" ], [ "54", "7_6", "4", "A", "A4", "WL101", "WL", "green zip", "H", "U", "C", "HUC" ], [ "55", "7_7", "5", "A", "A5", "EL105", "EL", "full red", "H", "O", "D", "HOD" ], [ "56", "7_8", "5", "C", "C5", "WW103", "WW", "1/2 yellow", "H", "O", "D", "HOD" ], [ "57", "8_1", "5", "C", "C5", "EL101", "EL", "full white", "H", "O", "D", "HOD" ], [ "58", "8_2", "6", "B", "B6", "EL103", "EL", "full yellow", "H", "U", "D", "HUD" ], [ "59", "8_3", "5", "C", "C5", "WW104", "WW", "1/2 blue", "H", "O", "D", "HOD" ], [ "60", "8_4", "5", "C", "C5", "EL105", "EL", "full red", "H", "O", "D", "HOD" ], [ "61", "8_5", "5", "A", "A5", "EL101", "EL", "full white", "H", "O", "D", "HOD" ], [ "62", "8_6", "4", "A", "A4", "WL102", "WL", "black zip", "H", "U", "C", "HUC" ], [ "63", "8_7", "5", "A", "A5", "WL104", "WL", "orange", "H", "O", "D", "HOD" ], [ "64", "8_8", "7", "B", "B7", "EL103", "EL", "full yellow", "H", "O", "D", "HOD" ], [ "65", "9_1", "5", "C", "C5", "WL105", "WL", "neon yellow", "H", "O", "D", "HOD" ], [ "66", "9_2", "5", "C", "C5", "WL101", "WL", "green zip", "H", "O", "D", "HOD" ], [ "67", "9_3", "7", "C", "C7", "WL101", "WL", "green zip", "H", "O", "C", "HOC" ], [ "68", "9_4", "7", "C", "C7", "WW101", "WW", "1/2 white", "H", "O", "C", "HOC" ], [ "69", "9_5", "7", "C", "C7", "WL103", "WL", "pink zip", "H", "O", "C", "HOC" ], [ "70", "9_6", "7", "C", "C7", "WL102", "WL", "black zip", "H", "O", "C", "HOC" ], [ "71", "9_7", "7", "C", "C7", "WL105", "WL", "neon yellow", "H", "O", "C", "HOC" ], [ "72", "9_8", "7", "C", "C7", "WL104", "WL", "orange", "H", "O", "C", "HOC" ], [ "73", "10_1", "6", "A", "A6", "WW102", "WW", "1/2 purple", "H", "O", "C", "HOC" ], [ "74", "10_2", "7", "A", "A7", "WW103", "WW", "1/2 yellow", "H", "U", "D", "HUD" ], [ "75", "10_3", "5", "A", "A5", "WW105", "WW", "1/2 red", "H", "O", "D", "HOD" ], [ "76", "10_4", "6", "A", "A6", "EL104", "EL", "full blue", "H", "O", "C", "HOC" ], [ "77", "10_5", "1", "C", "C1", "EL101", "EL", "full white", "H", "U", "D", "HUD" ], [ "78", "10_6", "3", "B", "B3", "WL102", "WL", "black zip", "B", "O", "C", "BOC" ], [ "79", "10_7", "1", "C", "C1", "EL103", "EL", "full yellow", "H", "U", "D", "HUD" ], [ "80", "10_8", "1", "C", "C1", "EL102", "EL", "full purple", "H", "U", "D", "HUD" ], [ "81", "11_1", "1", "B", "B1", "WW105", "WW", "1/2 red", "B", "U", "D", "BUD" ], [ "82", "11_2", "7", "B", "B7", "EL101", "EL", "full white", "H", "O", "D", "HOD" ], [ "83", "11_4", "6", "B", "B6", "WL103", "WL", "pink zip", "H", "U", "D", "HUD" ], [ "84", "11_5", "3", "B", "B3", "EL103", "EL", "full yellow", "B", "O", "C", "BOC" ], [ "85", "11_6", "7", "B", "B7", "WL101", "WL", "green zip", "H", "O", "D", "HOD" ], [ "86", "11_7", "4", "B", "B4", "EL102", "EL", "full purple", "B", "U", "C", "BUC" ], [ "87", "12_1", "7", "B", "B7", "WL103", "WL", "pink zip", "H", "O", "D", "HOD" ], [ "88", "12_3", "7", "B", "B7", "WL104", "WL", "orange", "H", "O", "D", "HOD" ], [ "89", "12_5", "6", "B", "B6", "WL102", "WL", "black zip", "H", "U", "D", "HUD" ], [ "90", "12_6", "7", "B", "B7", "WL105", "WL", "neon yellow", "H", "O", "D", "HOD" ], [ "91", "12_7", "6", "B", "B6", "WL101", "WL", "green zip", "H", "U", "D", "HUD" ], [ "92", "13_1", "6", "C", "C6", "WW101", "WW", "1/2 white", "B", "O", "C", "BOC" ], [ "93", "13_2", "3", "A", "A3", "WL101", "WL", "green zip", "B", "U", "D", "BUD" ], [ "94", "13_3", "6", "C", "C6", "WL101", "WL", "green zip", "B", "O", "C", "BOC" ], [ "95", "13_4", "6", "C", "C6", "WW102", "WW", "1/2 purple", "B", "O", "C", "BOC" ], [ "96", "13_5", "1", "A", "A1", "WL101", "WL", "green zip", "B", "O", "D", "BOD" ], [ "97", "13_6", "1", "A", "A1", "WW105", "WW", "1/2 red", "B", "O", "D", "BOD" ], [ "98", "13_7", "1", "A", "A1", "WL103", "WL", "pink zip", "B", "O", "D", "BOD" ], [ "99", "13_8", "1", "A", "A1", "WL102", "WL", "black zip", "B", "O", "D", "BOD" ], [ "100", "14_1", "1", "A", "A1", "EL102", "EL", "full purple", "B", "O", "D", "BOD" ], [ "101", "14_2", "1", "A", "A1", "EL101", "EL", "full white", "B", "O", "D", "BOD" ], [ "102", "14_3", "6", "A", "A6", "WL101", "WL", "green zip", "H", "O", "C", "HOC" ], [ "103", "14_4", "4", "B", "B4", "WW102", "WW", "1/2 purple", "B", "U", "C", "BUC" ], [ "104", "14_5", "6", "A", "A6", "WW104", "WW", "1/2 blue", "H", "O", "C", "HOC" ], [ "105", "14_6", "6", "A", "A6", "WL104", "WL", "orange", "H", "O", "C", "HOC" ], [ "106", "14_7", "6", "A", "A6", "EL103", "EL", "full yellow", "H", "O", "C", "HOC" ], [ "107", "14_8", "7", "A", "A7", "EL101", "EL", "full white", "H", "U", "D", "HUD" ], [ "108", "15_1", "2", "A", "A2", "WW105", "WW", "1/2 red", "B", "O", "C", "BOC" ], [ "109", "15_2", "2", "A", "A2", "WW104", "WW", "1/2 blue", "B", "O", "C", "BOC" ], [ "110", "15_3", "3", "A", "A3", "EL104", "EL", "full blue", "B", "U", "D", "BUD" ], [ "111", "15_4", "3", "A", "A3", "EL103", "EL", "full yellow", "B", "U", "D", "BUD" ], [ "112", "15_5", "4", "C", "C4", "EL101", "EL", "full white", "B", "O", "D", "BOD" ], [ "113", "15_6", "3", "C", "C3", "WL103", "WL", "pink zip", "B", "U", "C", "BUC" ], [ "114", "15_7", "4", "C", "C4", "EL103", "EL", "full yellow", "B", "O", "D", "BOD" ], [ "115", "15_8", "4", "C", "C4", "EL102", "EL", "full purple", "B", "O", "D", "BOD" ], [ "116", "16_1", "3", "B", "B3", "WL104", "WL", "orange", "B", "O", "C", "BOC" ], [ "117", "16_2", "3", "B", "B3", "WL101", "WL", "green zip", "B", "O", "C", "BOC" ], [ "118", "16_3", "1", "B", "B1", "WL101", "WL", "green zip", "B", "U", "D", "BUD" ], [ "119", "16_4", "4", "B", "B4", "WL104", "WL", "orange", "B", "U", "C", "BUC" ], [ "120", "16_5", "1", "B", "B1", "WW102", "WW", "1/2 purple", "B", "U", "D", "BUD" ], [ "121", "16_6", "1", "B", "B1", "WW101", "WW", "1/2 white", "B", "U", "D", "BUD" ], [ "122", "16_7", "1", "B", "B1", "WL105", "WL", "neon yellow", "B", "U", "D", "BUD" ], [ "123", "16_8", "1", "B", "B1", "WW103", "WW", "1/2 yellow", "B", "U", "D", "BUD" ], [ "124", "17_1", "5", "B", "B5", "WW101", "WW", "1/2 white", "B", "O", "D", "BOD" ], [ "125", "17_2", "5", "B", "B5", "WW104", "WW", "1/2 blue", "B", "O", "D", "BOD" ], [ "126", "17_3", "5", "B", "B5", "WW103", "WW", "1/2 yellow", "B", "O", "D", "BOD" ], [ "127", "17_4", "5", "B", "B5", "WW102", "WW", "1/2 purple", "B", "O", "D", "BOD" ], [ "128", "17_5", "5", "B", "B5", "WL103", "WL", "pink zip", "B", "O", "D", "BOD" ], [ "129", "17_6", "5", "B", "B5", "WW105", "WW", "1/2 red", "B", "O", "D", "BOD" ], [ "130", "17_7", "5", "B", "B5", "WL105", "WL", "neon yellow", "B", "O", "D", "BOD" ], [ "131", "17_8", "5", "B", "B5", "WL104", "WL", "orange", "B", "O", "D", "BOD" ], [ "132", "18_1", "6", "A", "A6", "WW105", "WW", "1/2 red", "H", "O", "C", "HOC" ], [ "133", "18_2", "6", "A", "A6", "EL105", "EL", "full red", "H", "O", "C", "HOC" ], [ "134", "18_3", "6", "A", "A6", "WL102", "WL", "black zip", "H", "O", "C", "HOC" ], [ "135", "18_4", "6", "A", "A6", "EL101", "EL", "full white", "H", "O", "C", "HOC" ], [ "136", "18_5", "6", "A", "A6", "WL105", "WL", "neon yellow", "H", "O", "C", "HOC" ], [ "137", "18_6", "6", "A", "A6", "WL103", "WL", "pink zip", "H", "O", "C", "HOC" ], [ "138", "18_7", "7", "A", "A7", "EL103", "EL", "full yellow", "H", "U", "D", "HUD" ], [ "139", "18_8", "7", "A", "A7", "WW102", "WW", "1/2 purple", "H", "U", "D", "HUD" ], [ "140", "19_1", "8", "B", "B8", "WL101", "WL", "green zip", "H", "U", "C", "HUC" ], [ "141", "19_2", "2", "B", "B2", "WL104", "WL", "orange", "H", "O", "C", "HOC" ], [ "142", "19_3", "2", "B", "B2", "EL104", "EL", "full blue", "H", "O", "C", "HOC" ], [ "143", "19_4", "8", "B", "B8", "WL102", "WL", "black zip", "H", "U", "C", "HUC" ], [ "144", "19_5", "6", "A", "A6", "WW103", "WW", "1/2 yellow", "H", "O", "C", "HOC" ], [ "145", "19_6", "2", "B", "B2", "WW105", "WW", "1/2 red", "H", "O", "C", "HOC" ], [ "146", "19_7", "7", "C", "C7", "WW103", "WW", "1/2 yellow", "H", "O", "C", "HOC" ], [ "147", "19_8", "6", "A", "A6", "WW101", "WW", "1/2 white", "H", "O", "C", "HOC" ], [ "148", "20_1", "7", "C", "C7", "EL104", "EL", "full blue", "H", "O", "C", "HOC" ], [ "149", "20_2", "7", "C", "C7", "EL103", "EL", "full yellow", "H", "O", "C", "HOC" ], [ "150", "20_3", "2", "C", "C2", "WL105", "WL", "neon yellow", "H", "U", "C", "HUC" ], [ "151", "20_4", "7", "C", "C7", "EL102", "EL", "full purple", "H", "O", "C", "HOC" ], [ "152", "20_5", "7", "C", "C7", "EL105", "EL", "full red", "H", "O", "C", "HOC" ], [ "153", "20_6", "7", "C", "C7", "WW104", "WW", "1/2 blue", "H", "O", "C", "HOC" ], [ "154", "20_7", "7", "C", "C7", "WW102", "WW", "1/2 purple", "H", "O", "C", "HOC" ], [ "155", "20_8", "7", "C", "C7", "EL101", "EL", "full white", "H", "O", "C", "HOC" ], [ "156", "21_1", "8", "B", "B8", "WW103", "WW", "1/2 yellow", "H", "U", "C", "HUC" ], [ "157", "21_2", "8", "B", "B8", "WW105", "WW", "1/2 red", "H", "U", "C", "HUC" ], [ "158", "21_3", "2", "C", "C2", "WL102", "WL", "black zip", "H", "U", "C", "HUC" ], [ "159", "21_4", "2", "C", "C2", "WL103", "WL", "pink zip", "H", "U", "C", "HUC" ], [ "160", "21_5", "8", "B", "B8", "WW102", "WW", "1/2 purple", "H", "U", "C", "HUC" ], [ "161", "21_6", "8", "B", "B8", "WW104", "WW", "1/2 blue", "H", "U", "C", "HUC" ], [ "162", "21_7", "8", "B", "B8", "WL103", "WL", "pink zip", "H", "U", "C", "HUC" ], [ "163", "21_8", "8", "B", "B8", "WL104", "WL", "orange", "H", "U", "C", "HUC" ], [ "164", "22_1", "2", "B", "B2", "WW103", "WW", "1/2 yellow", "H", "O", "C", "HOC" ], [ "165", "22_2", "2", "B", "B2", "WL105", "WL", "neon yellow", "H", "O", "C", "HOC" ], [ "166", "22_3", "2", "B", "B2", "WL103", "WL", "pink zip", "H", "O", "C", "HOC" ], [ "167", "22_4", "2", "B", "B2", "EL102", "EL", "full purple", "H", "O", "C", "HOC" ], [ "168", "22_5", "2", "B", "B2", "WL102", "WL", "black zip", "H", "O", "C", "HOC" ], [ "169", "22_6", "2", "C", "C2", "WL101", "WL", "green zip", "H", "U", "C", "HUC" ], [ "170", "22_7", "2", "C", "C2", "WL104", "WL", "orange", "H", "U", "C", "HUC" ], [ "171", "22_8", "2", "C", "C2", "WW105", "WW", "1/2 red", "H", "U", "C", "HUC" ], [ "172", "23_1", "2", "C", "C2", "WW102", "WW", "1/2 purple", "H", "U", "C", "HUC" ], [ "173", "23_2", "7", "C", "C7", "WW105", "WW", "1/2 red", "H", "O", "C", "HOC" ], [ "174", "23_3", "8", "B", "B8", "EL104", "EL", "full blue", "H", "U", "C", "HUC" ], [ "175", "23_4", "4", "A", "A4", "WL105", "WL", "neon yellow", "H", "U", "C", "HUC" ], [ "176", "23_5", "2", "B", "B2", "WW102", "WW", "1/2 purple", "H", "O", "C", "HOC" ], [ "177", "23_6", "2", "B", "B2", "WW104", "WW", "1/2 blue", "H", "O", "C", "HOC" ], [ "178", "23_7", "2", "B", "B2", "EL105", "EL", "full red", "H", "O", "C", "HOC" ], [ "179", "23_8", "1", "C", "C1", "EL105", "EL", "full red", "H", "U", "D", "HUD" ], [ "180", "24_1", "2", "C", "C2", "WW104", "WW", "1/2 blue", "H", "U", "C", "HUC" ], [ "181", "24_2", "5", "A", "A5", "WW101", "WW", "1/2 white", "H", "O", "D", "HOD" ], [ "182", "24_3", "7", "B", "B7", "WW105", "WW", "1/2 red", "H", "O", "D", "HOD" ], [ "183", "24_4", "1", "C", "C1", "WW102", "WW", "1/2 purple", "H", "U", "D", "HUD" ], [ "184", "24_5", "1", "C", "C1", "WW103", "WW", "1/2 yellow", "H", "U", "D", "HUD" ], [ "185", "24_6", "4", "A", "A4", "EL102", "EL", "full purple", "H", "U", "C", "HUC" ], [ "186", "24_7", "8", "B", "B8", "EL105", "EL", "full red", "H", "U", "C", "HUC" ], [ "187", "24_8", "8", "B", "B8", "WW101", "WW", "1/2 white", "H", "U", "C", "HUC" ], [ "188", "25_1", "2", "C", "C2", "EL103", "EL", "full yellow", "H", "U", "C", "HUC" ], [ "189", "25_2", "6", "A", "A6", "EL102", "EL", "full purple", "H", "O", "C", "HOC" ], [ "190", "25_3", "2", "B", "B2", "EL103", "EL", "full yellow", "H", "O", "C", "HOC" ], [ "191", "25_4", "2", "C", "C2", "EL104", "EL", "full blue", "H", "U", "C", "HUC" ], [ "192", "25_5", "1", "C", "C1", "WL104", "WL", "orange", "H", "U", "D", "HUD" ], [ "193", "25_6", "5", "A", "A5", "WL105", "WL", "neon yellow", "H", "O", "D", "HOD" ], [ "194", "25_7", "2", "B", "B2", "EL101", "EL", "full white", "H", "O", "C", "HOC" ], [ "195", "26_1", "8", "B", "B8", "EL101", "EL", "full white", "H", "U", "C", "HUC" ], [ "196", "26_2", "8", "B", "B8", "WL105", "WL", "neon yellow", "H", "U", "C", "HUC" ], [ "197", "26_3", "2", "C", "C2", "WW103", "WW", "1/2 yellow", "H", "U", "C", "HUC" ], [ "198", "26_4", "1", "C", "C1", "WW101", "WW", "1/2 white", "H", "U", "D", "HUD" ], [ "199", "26_5", "2", "B", "B2", "WL101", "WL", "green zip", "H", "O", "C", "HOC" ], [ "200", "26_6", "2", "B", "B2", "WW101", "WW", "1/2 white", "H", "O", "C", "HOC" ], [ "201", "26_7", "2", "C", "C2", "WW101", "WW", "1/2 white", "H", "U", "C", "HUC" ], [ "202", "26_8", "2", "C", "C2", "EL105", "EL", "full red", "H", "U", "C", "HUC" ], [ "203", "27_1", "1", "C", "C1", "EL104", "EL", "full blue", "H", "U", "D", "HUD" ], [ "204", "27_2", "1", "C", "C1", "WW104", "WW", "1/2 blue", "H", "U", "D", "HUD" ], [ "205", "27_3", "8", "B", "B8", "EL103", "EL", "full yellow", "H", "U", "C", "HUC" ], [ "206", "27_4", "1", "C", "C1", "WL101", "WL", "green zip", "H", "U", "D", "HUD" ], [ "207", "27_5", "1", "C", "C1", "WL102", "WL", "black zip", "H", "U", "D", "HUD" ], [ "208", "27_6", "8", "B", "B8", "EL102", "EL", "full purple", "H", "U", "C", "HUC" ], [ "209", "27_7", "2", "C", "C2", "EL102", "EL", "full purple", "H", "U", "C", "HUC" ], [ "210", "27_8", "2", "C", "C2", "EL101", "EL", "full white", "H", "U", "C", "HUC" ], [ "211", "28_1", "8", "A", "A8", "EL103", "EL", "full yellow", "B", "U", "C", "BUC" ], [ "212", "28_2", "1", "B", "B1", "EL102", "EL", "full purple", "B", "U", "D", "BUD" ], [ "213", "28_3", "8", "A", "A8", "EL105", "EL", "full red", "B", "U", "C", "BUC" ], [ "214", "28_4", "8", "A", "A8", "EL104", "EL", "full blue", "B", "U", "C", "BUC" ], [ "215", "28_5", "8", "A", "A8", "WL103", "WL", "pink zip", "B", "U", "C", "BUC" ], [ "216", "28_6", "8", "A", "A8", "WL102", "WL", "black zip", "B", "U", "C", "BUC" ], [ "217", "28_7", "8", "A", "A8", "WL105", "WL", "neon yellow", "B", "U", "C", "BUC" ], [ "218", "28_8", "8", "A", "A8", "WL104", "WL", "orange", "B", "U", "C", "BUC" ], [ "219", "29_2", "2", "A", "A2", "WW101", "WW", "1/2 white", "B", "O", "C", "BOC" ], [ "220", "29_3", "3", "C", "C3", "WL104", "WL", "orange", "B", "U", "C", "BUC" ], [ "221", "29_4", "2", "A", "A2", "WW103", "WW", "1/2 yellow", "B", "O", "C", "BOC" ], [ "222", "29_5", "3", "C", "C3", "WW104", "WW", "1/2 blue", "B", "U", "C", "BUC" ], [ "223", "29_6", "3", "C", "C3", "WL105", "WL", "neon yellow", "B", "U", "C", "BUC" ], [ "224", "29_7", "4", "C", "C4", "EL105", "EL", "full red", "B", "O", "D", "BOD" ], [ "225", "29_8", "4", "C", "C4", "EL104", "EL", "full blue", "B", "O", "D", "BOD" ], [ "226", "30_1", "8", "C", "C8", "WL105", "WL", "neon yellow", "B", "U", "D", "BUD" ], [ "227", "30_2", "6", "C", "C6", "EL101", "EL", "full white", "B", "O", "C", "BOC" ], [ "228", "30_3", "3", "C", "C3", "WW102", "WW", "1/2 purple", "B", "U", "C", "BUC" ], [ "229", "30_4", "3", "C", "C3", "WW103", "WW", "1/2 yellow", "B", "U", "C", "BUC" ], [ "230", "30_5", "3", "C", "C3", "WW105", "WW", "1/2 red", "B", "U", "C", "BUC" ], [ "231", "30_6", "3", "C", "C3", "WL101", "WL", "green zip", "B", "U", "C", "BUC" ], [ "232", "30_7", "3", "B", "B3", "WL105", "WL", "neon yellow", "B", "O", "C", "BOC" ], [ "233", "30_8", "3", "C", "C3", "WL102", "WL", "black zip", "B", "U", "C", "BUC" ], [ "234", "31_1", "3", "B", "B3", "WW103", "WW", "1/2 yellow", "B", "O", "C", "BOC" ], [ "235", "31_2", "3", "B", "B3", "WW101", "WW", "1/2 white", "B", "O", "C", "BOC" ], [ "236", "31_3", "3", "B", "B3", "WW105", "WW", "1/2 red", "B", "O", "C", "BOC" ], [ "237", "31_4", "3", "B", "B3", "WW104", "WW", "1/2 blue", "B", "O", "C", "BOC" ], [ "238", "31_5", "3", "B", "B3", "EL101", "EL", "full white", "B", "O", "C", "BOC" ], [ "239", "31_6", "8", "C", "C8", "WW101", "WW", "1/2 white", "B", "U", "D", "BUD" ], [ "240", "31_7", "5", "B", "B5", "EL105", "EL", "full red", "B", "O", "D", "BOD" ], [ "241", "31_8", "8", "A", "A8", "EL102", "EL", "full purple", "B", "U", "C", "BUC" ], [ "242", "32_1", "6", "C", "C6", "EL103", "EL", "full yellow", "B", "O", "C", "BOC" ], [ "243", "32_2", "6", "C", "C6", "EL102", "EL", "full purple", "B", "O", "C", "BOC" ], [ "244", "32_3", "8", "C", "C8", "WW102", "WW", "1/2 purple", "B", "U", "D", "BUD" ], [ "245", "32_4", "6", "C", "C6", "WW105", "WW", "1/2 red", "B", "O", "C", "BOC" ], [ "246", "32_5", "8", "C", "C8", "WW105", "WW", "1/2 red", "B", "U", "D", "BUD" ], [ "247", "32_6", "8", "C", "C8", "WW104", "WW", "1/2 blue", "B", "U", "D", "BUD" ], [ "248", "33_1", "6", "C", "C6", "EL104", "EL", "full blue", "B", "O", "C", "BOC" ], [ "249", "33_2", "3", "C", "C3", "EL103", "EL", "full yellow", "B", "U", "C", "BUC" ], [ "250", "33_3", "8", "C", "C8", "EL103", "EL", "full yellow", "B", "U", "D", "BUD" ], [ "251", "33_4", "8", "C", "C8", "EL101", "EL", "full white", "B", "U", "D", "BUD" ], [ "252", "33_5", "8", "C", "C8", "WL101", "WL", "green zip", "B", "U", "D", "BUD" ], [ "253", "33_6", "8", "C", "C8", "EL105", "EL", "full red", "B", "U", "D", "BUD" ], [ "254", "33_7", "8", "C", "C8", "WW103", "WW", "1/2 yellow", "B", "U", "D", "BUD" ], [ "255", "33_8", "8", "C", "C8", "WL104", "WL", "orange", "B", "U", "D", "BUD" ], [ "256", "34_1", "3", "C", "C3", "EL102", "EL", "full purple", "B", "U", "C", "BUC" ], [ "257", "34_2", "3", "C", "C3", "EL101", "EL", "full white", "B", "U", "C", "BUC" ], [ "258", "34_3", "3", "C", "C3", "EL105", "EL", "full red", "B", "U", "C", "BUC" ], [ "259", "34_4", "3", "C", "C3", "EL104", "EL", "full blue", "B", "U", "C", "BUC" ], [ "260", "34_5", "8", "C", "C8", "EL102", "EL", "full purple", "B", "U", "D", "BUD" ], [ "261", "34_6", "3", "C", "C3", "WW101", "WW", "1/2 white", "B", "U", "C", "BUC" ], [ "262", "34_7", "8", "C", "C8", "WL103", "WL", "pink zip", "B", "U", "D", "BUD" ], [ "263", "34_8", "8", "C", "C8", "EL104", "EL", "full blue", "B", "U", "D", "BUD" ], [ "264", "35_1", "6", "B", "B6", "EL105", "EL", "full red", "H", "U", "D", "HUD" ], [ "265", "35_2", "4", "A", "A4", "EL105", "EL", "full red", "H", "U", "C", "HUC" ], [ "266", "35_3", "5", "A", "A5", "WL102", "WL", "black zip", "H", "O", "D", "HOD" ], [ "267", "35_4", "5", "A", "A5", "WW103", "WW", "1/2 yellow", "H", "O", "D", "HOD" ], [ "268", "35_5", "1", "C", "C1", "WW105", "WW", "1/2 red", "H", "U", "D", "HUD" ], [ "269", "35_6", "5", "A", "A5", "WL103", "WL", "pink zip", "H", "O", "D", "HOD" ], [ "270", "35_7", "1", "C", "C1", "WL105", "WL", "neon yellow", "H", "U", "D", "HUD" ], [ "271", "35_8", "1", "C", "C1", "WL103", "WL", "pink zip", "H", "U", "D", "HUD" ], [ "272", "36_1", "3", "A", "A3", "WL103", "WL", "pink zip", "B", "U", "D", "BUD" ], [ "273", "36_2", "3", "A", "A3", "WL102", "WL", "black zip", "B", "U", "D", "BUD" ], [ "274", "36_3", "4", "B", "B4", "EL105", "EL", "full red", "B", "U", "C", "BUC" ], [ "275", "36_4", "1", "B", "B1", "WL104", "WL", "orange", "B", "U", "D", "BUD" ], [ "276", "36_5", "4", "B", "B4", "WL103", "WL", "pink zip", "B", "U", "C", "BUC" ], [ "277", "36_6", "4", "B", "B4", "WL101", "WL", "green zip", "B", "U", "C", "BUC" ], [ "278", "36_7", "4", "C", "C4", "WL104", "WL", "orange", "B", "O", "D", "BOD" ], [ "279", "36_8", "5", "B", "B5", "EL103", "EL", "full yellow", "B", "O", "D", "BOD" ], [ "280", "37_1", "2", "A", "A2", "EL101", "EL", "full white", "B", "O", "C", "BOC" ], [ "281", "37_2", "1", "A", "A1", "WW102", "WW", "1/2 purple", "B", "O", "D", "BOD" ], [ "282", "37_3", "2", "A", "A2", "EL103", "EL", "full yellow", "B", "O", "C", "BOC" ], [ "283", "37_4", "2", "A", "A2", "EL102", "EL", "full purple", "B", "O", "C", "BOC" ], [ "284", "37_5", "2", "A", "A2", "EL105", "EL", "full red", "B", "O", "C", "BOC" ], [ "285", "37_6", "2", "A", "A2", "EL104", "EL", "full blue", "B", "O", "C", "BOC" ], [ "286", "37_7", "3", "A", "A3", "WW101", "WW", "1/2 white", "B", "U", "D", "BUD" ], [ "287", "37_8", "2", "A", "A2", "WL101", "WL", "green zip", "B", "O", "C", "BOC" ], [ "288", "38_1", "4", "C", "C4", "WW102", "WW", "1/2 purple", "B", "O", "D", "BOD" ], [ "289", "38_2", "4", "C", "C4", "WW101", "WW", "1/2 white", "B", "O", "D", "BOD" ], [ "290", "38_3", "4", "C", "C4", "WW104", "WW", "1/2 blue", "B", "O", "D", "BOD" ], [ "291", "38_4", "4", "C", "C4", "WW103", "WW", "1/2 yellow", "B", "O", "D", "BOD" ], [ "292", "38_5", "4", "C", "C4", "WL101", "WL", "green zip", "B", "O", "D", "BOD" ], [ "293", "38_6", "4", "C", "C4", "WW105", "WW", "1/2 red", "B", "O", "D", "BOD" ], [ "294", "38_7", "4", "C", "C4", "WL103", "WL", "pink zip", "B", "O", "D", "BOD" ], [ "295", "38_8", "4", "C", "C4", "WL102", "WL", "black zip", "B", "O", "D", "BOD" ], [ "296", "39_1", "1", "B", "B1", "WL103", "WL", "pink zip", "B", "U", "D", "BUD" ], [ "297", "39_2", "1", "B", "B1", "WL102", "WL", "black zip", "B", "U", "D", "BUD" ], [ "298", "39_3", "3", "A", "A3", "WL104", "WL", "orange", "B", "U", "D", "BUD" ], [ "299", "39_4", "1", "B", "B1", "WW104", "WW", "1/2 blue", "B", "U", "D", "BUD" ], [ "300", "39_5", "5", "B", "B5", "WL101", "WL", "green zip", "B", "O", "D", "BOD" ], [ "301", "39_6", "3", "A", "A3", "WL105", "WL", "neon yellow", "B", "U", "D", "BUD" ], [ "302", "39_7", "5", "B", "B5", "WL102", "WL", "black zip", "B", "O", "D", "BOD" ], [ "303", "39_8", "3", "A", "A3", "EL105", "EL", "full red", "B", "U", "D", "BUD" ], [ "304", "40_1", "3", "A", "A3", "WW105", "WW", "1/2 red", "B", "U", "D", "BUD" ], [ "305", "40_2", "3", "A", "A3", "WW104", "WW", "1/2 blue", "B", "U", "D", "BUD" ], [ "306", "40_3", "1", "A", "A1", "EL103", "EL", "full yellow", "B", "O", "D", "BOD" ], [ "307", "40_4", "2", "A", "A2", "WW102", "WW", "1/2 purple", "B", "O", "C", "BOC" ], [ "308", "40_5", "1", "A", "A1", "WW101", "WW", "1/2 white", "B", "O", "D", "BOD" ], [ "309", "40_6", "1", "A", "A1", "EL104", "EL", "full blue", "B", "O", "D", "BOD" ], [ "310", "40_7", "1", "A", "A1", "WW104", "WW", "1/2 blue", "B", "O", "D", "BOD" ], [ "311", "40_8", "1", "A", "A1", "WW103", "WW", "1/2 yellow", "B", "O", "D", "BOD" ], [ "312", "41_1", "6", "C", "C6", "WW103", "WW", "1/2 yellow", "B", "O", "C", "BOC" ], [ "313", "41_2", "6", "C", "C6", "EL105", "EL", "full red", "B", "O", "C", "BOC" ], [ "314", "41_3", "1", "B", "B1", "EL105", "EL", "full red", "B", "U", "D", "BUD" ], [ "315", "41_4", "6", "C", "C6", "WW104", "WW", "1/2 blue", "B", "O", "C", "BOC" ], [ "316", "41_5", "3", "A", "A3", "WW102", "WW", "1/2 purple", "B", "U", "D", "BUD" ], [ "317", "41_6", "3", "A", "A3", "EL101", "EL", "full white", "B", "U", "D", "BUD" ], [ "318", "41_7", "3", "A", "A3", "WW103", "WW", "1/2 yellow", "B", "U", "D", "BUD" ], [ "319", "41_8", "8", "C", "C8", "WL102", "WL", "black zip", "B", "U", "D", "BUD" ], [ "320", "42_1", "6", "C", "C6", "WL103", "WL", "pink zip", "B", "O", "C", "BOC" ], [ "321", "42_2", "6", "C", "C6", "WL102", "WL", "black zip", "B", "O", "C", "BOC" ], [ "322", "42_3", "6", "C", "C6", "WL105", "WL", "neon yellow", "B", "O", "C", "BOC" ], [ "323", "42_4", "6", "C", "C6", "WL104", "WL", "orange", "B", "O", "C", "BOC" ], [ "324", "42_5", "3", "B", "B3", "WW102", "WW", "1/2 purple", "B", "O", "C", "BOC" ], [ "325", "42_6", "4", "B", "B4", "WW101", "WW", "1/2 white", "B", "U", "C", "BUC" ], [ "326", "42_7", "4", "B", "B4", "WW104", "WW", "1/2 blue", "B", "U", "C", "BUC" ], [ "327", "42_8", "4", "B", "B4", "WW103", "WW", "1/2 yellow", "B", "U", "C", "BUC" ], [ "328", "43_1", "6", "B", "B6", "WL104", "WL", "orange", "H", "U", "D", "HUD" ], [ "329", "43_2", "3", "B", "B3", "EL105", "EL", "full red", "B", "O", "C", "BOC" ], [ "330", "43_3", "3", "B", "B3", "EL102", "EL", "full purple", "B", "O", "C", "BOC" ], [ "331", "43_4", "7", "B", "B7", "WL102", "WL", "black zip", "H", "O", "D", "HOD" ], [ "332", "43_5", "4", "B", "B4", "EL103", "EL", "full yellow", "B", "U", "C", "BUC" ], [ "333", "43_6", "3", "B", "B3", "EL104", "EL", "full blue", "B", "O", "C", "BOC" ], [ "334", "43_7", "4", "B", "B4", "EL101", "EL", "full white", "B", "U", "C", "BUC" ], [ "335", "43_8", "4", "B", "B4", "EL104", "EL", "full blue", "B", "U", "C", "BUC" ], [ "336", "44_1", "7", "A", "A7", "EL104", "EL", "full blue", "H", "U", "D", "HUD" ], [ "337", "44_2", "7", "A", "A7", "EL102", "EL", "full purple", "H", "U", "D", "HUD" ], [ "338", "44_3", "7", "A", "A7", "WW101", "WW", "1/2 white", "H", "U", "D", "HUD" ], [ "339", "44_4", "7", "A", "A7", "EL105", "EL", "full red", "H", "U", "D", "HUD" ], [ "340", "44_5", "1", "B", "B1", "EL103", "EL", "full yellow", "B", "U", "D", "BUD" ], [ "341", "44_6", "7", "A", "A7", "WW105", "WW", "1/2 red", "H", "U", "D", "HUD" ], [ "342", "44_7", "5", "B", "B5", "EL101", "EL", "full white", "B", "O", "D", "BOD" ], [ "343", "44_8", "1", "B", "B1", "EL104", "EL", "full blue", "B", "U", "D", "BUD" ], [ "344", "45_1", "4", "B", "B4", "WW105", "WW", "1/2 red", "B", "U", "C", "BUC" ], [ "345", "45_2", "3", "A", "A3", "EL102", "EL", "full purple", "B", "U", "D", "BUD" ], [ "346", "45_3", "8", "A", "A8", "WW103", "WW", "1/2 yellow", "B", "U", "C", "BUC" ], [ "347", "45_4", "4", "B", "B4", "WL102", "WL", "black zip", "B", "U", "C", "BUC" ], [ "348", "45_5", "8", "A", "A8", "WL101", "WL", "green zip", "B", "U", "C", "BUC" ], [ "349", "45_6", "8", "A", "A8", "WW105", "WW", "1/2 red", "B", "U", "C", "BUC" ], [ "350", "45_7", "1", "A", "A1", "EL105", "EL", "full red", "B", "O", "D", "BOD" ], [ "351", "45_8", "1", "B", "B1", "EL101", "EL", "full white", "B", "U", "D", "BUD" ], [ "352", "46_1", "8", "A", "A8", "WW104", "WW", "1/2 blue", "B", "U", "C", "BUC" ], [ "353", "46_2", "8", "A", "A8", "WW101", "WW", "1/2 white", "B", "U", "C", "BUC" ], [ "354", "46_3", "3", "B", "B3", "WL103", "WL", "pink zip", "B", "O", "C", "BOC" ], [ "355", "46_4", "8", "A", "A8", "WW102", "WW", "1/2 purple", "B", "U", "C", "BUC" ], [ "356", "46_6", "4", "B", "B4", "WL105", "WL", "neon yellow", "B", "U", "C", "BUC" ], [ "357", "46_7", "5", "B", "B5", "EL104", "EL", "full blue", "B", "O", "D", "BOD" ], [ "358", "46_8", "5", "B", "B5", "EL102", "EL", "full purple", "B", "O", "D", "BOD" ] ];
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
