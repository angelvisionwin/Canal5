#include "fivewin.ch"
#include "fivewin.ch"
#include "Informe.ch"

static nActivo := ARROW
static nIdItem := 100
static oList
static oBar


function Informes()
local oWnd, o, oSp,  oPanel, oFont, nGroup, oMenu
local hDC, aFonts
local nTop := 20
local o1, o2, o3, o4, o5, o6, o7, o8

 MENU oMenu
     MENUITEM "Archivo"
     MENUITEM "Edici�n"
     MENUITEM "Formato"
     MENUITEM "Vista"
     ENDMENU
     DEFINE FONT oFont NAME "Verdana" SIZE 0,-11

DEFINE WINDOW oWnd COLOR 0, CLR_GRAY VSCROLL HSCROLL MENU  oMenu //MDICHILD OF Aplicacion():oWnd


    oPanel := TPanel():New( 0, 0, 100, 300, oWnd )
    oWnd:oLeft := oPanel

    DEFINE BUTTONBAR oBar OF oPanel 3D SIZE 32, 32 RIGHT
    oBar:bLClicked := {||.t.}

       DEFINE BUTTON o1 OF oBar NAME "curarrow"              FLAT PRESSED ACTION (nActivo := ARROW,  o1:lPressed := !o1:lPressed, o1:Refresh())
       DEFINE BUTTON o2 OF oBar NAME "text"                  FLAT         ACTION (nActivo := TEXTO,          ResetBar(.f.), o2:lPressed := .t.)
       DEFINE BUTTON o3 OF oBar NAME "field"                 FLAT         ACTION (nActivo := FIELD,          ResetBar(.f.), o3:lPressed := .t.)
       DEFINE BUTTON o4 OF oBar NAME "image"                 FLAT         ACTION (nActivo := IMAGE,          ResetBar(.f.), o4:lPressed := .t.)
       DEFINE BUTTON o5 OF oBar NAME "line"                  FLAT         ACTION (nActivo := LINE,           ResetBar(.f.), o5:lPressed := .t.)
       DEFINE BUTTON o6 OF oBar NAME "box"                   FLAT         ACTION (nActivo := BOX,            ResetBar(.f.), o6:lPressed := .t.)
       DEFINE BUTTON o7 OF oBar NAME "base"                  FLAT GROUP   ACTION (nActivo := BASE,           ResetBar(.f.), o7:lPressed := .t.)
       DEFINE BUTTON o8 OF oBar NAME "grid"  ACTION oSp:SetGrid( !oSp:lGrid ) FLAT
       DEFINE BUTTON OF oBar                                  FLAT
       DEFINE BUTTON OF oBar





  oList := TListProp():New( 2, 2, 200, 500, , {"","",""},{20, 100, 100}, oPanel, , , ,,,, oFont )

    oPanel:oClient := oList
    oList:nLineStyle := 2

    oSp := TSoporte():New( 0, oPanel:nWidth, oWnd )

    oSp:oInspect := oList

    o := TBanda():New(                       nTop,  0, 700, 100, oSp, "PageHeader" )
    o := TBanda():New(            nTop + 100 + 20,  0, 700, 400, oSp, "Detail" )
    o := TBanda():New( nTop + 100 + 20 + 400 + 20,  0, 700, 100, oSp, "PageFooter" )

    DEFINE SCROLLBAR oWnd:oHScroll HORIZONTAL   OF oWnd ;
       RANGE 1, 100 ;
       ON UP       oSp:MoveLeft() ;
      // ON DOWN     oSp:MoveRight() ;
     //  ON PAGEUP   oSp:PanLeft() ;
     //  ON PAGEDOWN oSp:PanRight() ;
     //  ON THUMBPOS oSp:ThumbPos( ,nPos )

    DEFINE SCROLLBAR oWnd:oVScroll VERTICAL OF oWnd ;
       RANGE 1, 100 ;
       ON UP       oSp:MoveUp() ;
       ON DOWN     oSp:MoveDown()

    oSp:SetProperties()
*/











ACTIVATE WINDOW oWnd MAXIMIZED

return nil
//--------------------------------------------------//

function Inspector()
   return oList

 function ResetBar( lBar )

 local n, nLen
 DEFAULT lBar := .t.

 nLen := len( oBar:aControls )
 for n := 1 to nLen
     oBar:aControls[n]:lPressed := .f.
     oBar:aControls[n]:Refresh()
 next
 if lBar
    oBar:aControls[1]:lPressed := .t.
    oBar:aControls[1]:Refresh()
    nActivo := ARROW
 endif

return nil

function aGetFontNames()

local oInsp := Inspector()
local hDC := GetDC( oInsp:hWnd )
local aFonts := GetFontNames(hDC)
aFonts := asort( aFonts )
ReleaseDC(oInsp:hWnd,hDC)

return  aFonts





  #pragma BEGINDUMP

#include <windows.h>
#include <hbapi.h>
#include <hbapierr.h>
#include "hbapiitm.h"
#include "hbvm.h"
#include "hbapirdd.h"
#include "hbxvm.h"

    HB_FUNC( UNIONRECT )
   {

      RECT rc, rc0, rc1;


      rc0.top    = hb_parvni( 1, 1 );
      rc0.left   = hb_parvni( 1, 2 );
      rc0.bottom = hb_parvni( 1, 3 );
      rc0.right  = hb_parvni( 1, 4 );

      rc1.top    = hb_parvni( 2, 1 );
      rc1.left   = hb_parvni( 2, 2 );
      rc1.bottom = hb_parvni( 2, 3 );
      rc1.right  = hb_parvni( 2, 4 );

      UnionRect( &rc, &rc0, &rc1 );
      hb_reta(4);

      hb_storvni( rc.top    , -1, 1 );
      hb_storvni( rc.left   , -1, 2 );
      hb_storvni( rc.bottom , -1, 3 );
      hb_storvni( rc.right  , -1, 4 );

   }
 #pragma ENDDUMP
