function Visible(){var Grps=app.activeDocument.layerSets;for(var i=0;i<Grps.length;i++){var tmp=app.activeDocument.layerSets[i].layers.length;app.activeDocument.layerSets[i].visible=true;var groupChildArr=app.activeDocument.layerSets[i].layers;var randLays=Math.floor(Math.random()*tmp);groupChildArr[randLays].visible=true;Save();}
Revert();}
function Save(){var outFolder=app.activeDocument;var outPath=outFolder.path;var fName="PNG";var f=new Folder(outPath+"/"+fName);if(!f.exists){f.create()}
var saveFile=new File(outPath+"/"+fName+"/"+"HEAD_"+num+".png");pngSaveOptions=new PNGSaveOptions();pngSaveOptions.interlaced=false;app.activeDocument.saveAs(saveFile,pngSaveOptions,true,Extension.LOWERCASE);}
function Revert(){var idRvrt=charIDToTypeID("Rvrt");executeAction(idRvrt,undefined,DialogModes.NO);}
var count=prompt("How many versions you want","");for(var x=0;x<count;x++){var num=x+1;Visible();}