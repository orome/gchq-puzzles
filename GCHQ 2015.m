(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



unknown ="-";
cellGraphics = {
1->Graphics[{Black,Rectangle[]},ImageSize->20],unknown->Graphics[{GrayLevel[.95],Rectangle[]},ImageSize->20],0->Graphics[{White,Rectangle[]},ImageSize->20]};
gridSpecs = Sequence[Frame->None,Alignment->Center,ItemSize->{1.25,1.25},Spacings->{0.2,0.2}];


showTable[t_]:=Grid[Join[
Join[ConstantArray["",{9,9}],(Style[#,Bold]&/@PadLeft[#,9,""]&/@clueCols)]\[Transpose],
(Thread[f[(Style[#,Bold]&/@PadLeft[#,9,""]&/@clueRows),(t/.cellGraphics)]]/.f->Join)
], gridSpecs];


(*showTable[t_]:=Grid[t/.cellGraphics, gridSpecs];*)


dim=25;


clueRows={{7,3,1,1,7},{1,1,2,2,1,1},{1,3,1,3,1,1,3,1},{1,3,1,1,6,1,3,1},{1,3,1,5,2,1,3,1},{1,1,2,1,1},{7,1,1,1,1,1,7},{3,3},{1,2,3,1,1,3,1,1,2},{1,1,3,2,1,1},{4,1,4,2,1,2},{1,1,1,1,1,4,1,3},{2,1,1,1,2,5},{3,2,2,6,3,1},{1,9,1,1,2,1},{2,1,2,2,3,1},{3,1,1,1,1,5,1},{1,2,2,5},{7,1,2,1,1,1,3},{1,1,2,1,2,2,1},{1,3,1,4,5,1},{1,3,1,3,10,2},{1,3,1,1,6,6},{1,1,2,1,1,2},{7,2,1,2,5}};

clueCols={{7,2,1,1,7},{1,1,2,2,1,1},{1,3,1,3,1,3,1,3,1},{1,3,1,1,5,1,3,1},{1,3,1,1,4,1,3,1},{1,1,1,2,1,1},{7,1,1,1,1,1,7},{1,1,3},{2,1,2,1,8,2,1},{2,2,1,2,1,1,1,2},{1,7,3,2,1},{1,2,3,1,1,1,1,1},{4,1,1,2,6},{3,3,1,1,1,3,1},{1,2,5,2,2},{2,2,1,1,1,1,1,2,1},{1,3,3,2,1,8,1},{6,2,1},{7,1,4,1,1,3},{1,1,1,1,4},{1,3,1,3,7,1},{1,3,1,1,1,2,1,1,4},{1,3,1,4,3,3},{1,1,2,2,2,6,1},{7,1,3,2,1,1}};


constraintTable = ConstantArray[unknown, {dim, dim}];
(constraintTable[[Sequence@@#]]=1)&/@{
{4,4},{4,5},{4,13},{4,14},{4,22},
{9,7},{9,8},{9,11},{9,15},{9,16},{9,19},
{17, 7}, {17, 12}, {17, 17},{17, 21},
{22, 4},{22, 5},{22, 10},{22, 11},{22, 16},{22, 21},{22, 22}
};
showTable[constraintTable]


genSpecsN[clue_,n_]:=
Switch[n,1,#,-1,Join[{0},#,{0}],0,{Append[#,0],Prepend[#,0]}]&/@ 
(Union@@(Permutations/@(IntegerPartitions[dim-Plus@@clue, {Length[clue]+n}])));genSpecs[clue_]:= Riffle[#,clue]&/@Union[genSpecsN[clue,-1],Union@@genSpecsN[clue,0], genSpecsN[clue,1]]


genCells[spec_]:=Flatten[{ConstantArray[0,#[[1]]],ConstantArray[1,#[[2]]]}&/@
 Partition[Append[spec,0],2]]


isDone[strip_] := FreeQ[strip,unknown];


constraintStrip[_,constraint_]:= constraint/;isDone[constraint];constraintStrip[cells_,constraint_]:=
Module[{constrainedCells=Cases[cells,constraint/.unknown->_]},
Switch[#,Length[constrainedCells],1,0,0,_,unknown]&/@(Thread[Total[#]&@constrainedCells])]



