{*****************************************************************************}
{                                                                             }
{  GisApp program                                                             }
{                                                                             }
{  Copyright(C) 2003                                                          }
{  Ecological Software Solutions  (ESS)                                       }
{  All rights reserved.                                                       }
{                                                                             }
{  This unit is provided "as is" without warrantee of any kind.  Use at own   }
{  risk.  See the license agreement for further details.                      }
{                                                                             }
{  The code provided in this unit is NOT open source and all copyrights are   }
{  maintained without exception by Ecological Software Solutions.  The right  }
{  to distribute the source code is maintained exclusively by Ecological      }
{  Software Solutions, and you may not distribute the source code, in part    }
{  or in whole, to any third party.                                           }
{                                                                             }
{  Ecological Software Solutions provides to the user a non-exclusive world   }
{  wide right to alter the source code in this unit as much desired and use   }
{  any source code, in part or in whole, from this unit in any part of their  }
{  application free of any and all roylaty payments.  In short, you may use   }
{  the source code for free.  However, inclusion of any source code from      }
{  this unit must retain this copyright notice.                               }
{                                                                             }
{  The source code in this unit can not be sold, leased or otherwise          }
{  distributed in any way, except in a compiled application, without prior    }
{  written permission from Ecological Software Solutions.                     }
{                                                                             }
{  Contact by email at: mail@ecostats.com                                     }
{                                                                             }
{  This unit is provided "as is" without warrantee of any kind.  Use at own   }
{  risk.  See the license agreement for further details.                      }
{                                                                             }
{*****************************************************************************}

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GISImage, ExtCtrls, StdCtrls, SVOLegend, GISReadWrite, ComCtrls, ImgList,
  ToolWin, GISShape, Menus, ExtDlgs, DataFields {, GraphicEx};

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    SVOGISReadWrite1: TSVOGISReadWrite;
    OpenDialog1: TOpenDialog;
    SVOLegend: TSVOLegend;
    Splitter1: TSplitter;
    SVOGISImage1: TSVOGISImage;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Points1: TMenuItem;
    Lines1: TMenuItem;
    Polygons1: TMenuItem;
    N1: TMenuItem;
    EditShapes1: TMenuItem;
    Rectangles1: TMenuItem;
    Ellipses1: TMenuItem;
    PopupMenuCanvas: TPopupMenu;
    UndoCanvasEdit2: TMenuItem;
    Copytoclipboard1: TMenuItem;
    SaveAsMetaFile1: TMenuItem;
    CanvasColor1: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    ColorDialog1: TColorDialog;
    StatusBar1: TStatusBar;
    OpenPictureDialog: TOpenPictureDialog;
    ToolBar1: TToolBar;
    ToolButtonExit: TToolButton;
    ToolButton13: TToolButton;
    ToolButtonOpenGIS: TToolButton;
    ToolButton6: TToolButton;
    ToolButtonCloseGIS: TToolButton;
    ToolButtonSaveGIS: TToolButton;
    ToolButton10: TToolButton;
    ToolButtonCopyCanvas: TToolButton;
    ToolButtonGrid: TToolButton;
    ToolButtonPrint: TToolButton;
    ToolButton11: TToolButton;
    ToolButtonDefault: TToolButton;
    ToolButtonShapeInfo: TToolButton;
    ToolButtonGrab: TToolButton;
    ToolButtonZoomIn: TToolButton;
    ToolButtonZoomOut: TToolButton;
    ToolButtonFullExtent: TToolButton;
    ToolButtonMeasure: TToolButton;
    ToolButton8: TToolButton;
    ToolButtonUndo: TToolButton;
    ToolButtonDraw: TToolButton;
    ToolButton4: TToolButton;
    ToolButtonStratify: TToolButton;
    ToolButtonUnion: TToolButton;
    ToolButtonSaveAsHtml: TToolButton;
    MainMenu1: TMainMenu;
    SVOTools1: TMenuItem;
    Intersections1: TMenuItem;
    CreateShapes1: TMenuItem;
    Points2: TMenuItem;
    Lines2: TMenuItem;
    Polygons2: TMenuItem;
    Projections1: TMenuItem;
    CanvasProjections1: TMenuItem;
    FileProjections1: TMenuItem;
    Canvas1: TMenuItem;
    DefaultPointer1: TMenuItem;
    ShapeInformation1: TMenuItem;
    Pan1: TMenuItem;
    ZoomIn1: TMenuItem;
    ZoomOut1: TMenuItem;
    DefaultExtent1: TMenuItem;
    N2: TMenuItem;
    UndoChanges1: TMenuItem;
    EditShape1: TMenuItem;
    MoveShapesShapeNodes1: TMenuItem;
    DeleteShapeNodes1: TMenuItem;
    AddShapeNodes1: TMenuItem;
    NewShapes1: TMenuItem;
    Points3: TMenuItem;
    Lines3: TMenuItem;
    Ellipses2: TMenuItem;
    Rectangles2: TMenuItem;
    Polygons3: TMenuItem;
    BufferPoints1: TMenuItem;
    StratifyShapes1: TMenuItem;
    FilterShapes1: TMenuItem;
    Extras1: TMenuItem;
    FindNearestShape1: TMenuItem;
    PromoteDemoteShape1: TMenuItem;
    ToPoints1: TMenuItem;
    ToLine1: TMenuItem;
    ToPolygon1: TMenuItem;
    N3: TMenuItem;
    OrderedPoints1: TMenuItem;
    ToolButtonFilter: TToolButton;
    SaveasHTML1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure ToolButtonOpenGISClick(Sender: TObject);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonCopyCanvasClick(Sender: TObject);
    procedure ToolButtonShapeInfoClick(Sender: TObject);
    procedure ToolButtonZoomInClick(Sender: TObject);
    procedure ToolButtonZoomOutClick(Sender: TObject);
    procedure ToolButtonPrintClick(Sender: TObject);
    procedure ToolButtonCloseGISClick(Sender: TObject);
    procedure ToolButtonGrabClick(Sender: TObject);
    procedure ToolButtonGridClick(Sender: TObject);
    procedure ToolButtonDefaultClick(Sender: TObject);
    procedure ToolButtonFullExtentClick(Sender: TObject);
    procedure SVOGISImage1ShapeID(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; var Handled: Boolean);
    procedure ToolButtonSaveGISClick(Sender: TObject);
    procedure ToolButtonUndoClick(Sender: TObject);
    procedure ToolButtonMeasureClick(Sender: TObject);
    procedure Points1Click(Sender: TObject);
    procedure Lines1Click(Sender: TObject);
    procedure Ellipses1Click(Sender: TObject);
    procedure Rectangles1Click(Sender: TObject);
    procedure Polygons1Click(Sender: TObject);
    procedure EditShapes1Click(Sender: TObject);
    procedure SVOLegendClick(Sender: TObject);
    procedure SVOGISImage1AddShape(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; var Handled: Boolean);
    procedure ToolButtonStratifyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SaveAsMetaFile1Click(Sender: TObject);
    procedure Copytoclipboard1Click(Sender: TObject);
    procedure CanvasColor1Click(Sender: TObject);
    procedure ToolButtonUnionClick(Sender: TObject);
    procedure SVOGISImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton6Click(Sender: TObject);
    procedure SVOGISImage1AfterShapeAdded(Sender: TObject;
      AShapeObject: TSVOShapeObject);
    procedure SVOGISImage1AddShapeList(Sender: TObject; AShapeList : TSVOShapeList);
    procedure Points2Click(Sender: TObject);
    procedure Lines2Click(Sender: TObject);
    procedure Polygons2Click(Sender: TObject);
    procedure FindNearestShape1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SVOGISImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToPoints1Click(Sender: TObject);
    procedure ToLine1Click(Sender: TObject);
    procedure ToPolygon1Click(Sender: TObject);
    procedure PromoteDemoteShape1Click(Sender: TObject);
    procedure ToolButtonSaveAsHtmlClick(Sender: TObject);
    procedure FileProjections1Click(Sender: TObject);
    procedure CanvasProjections1Click(Sender: TObject);
    procedure ToolButtonFilterClick(Sender: TObject);
    procedure SVOTools1Click(Sender: TObject);
    procedure BufferPoints1Click(Sender: TObject);
    procedure DeleteShapeNodes1Click(Sender: TObject);
    procedure AddShapeNodes1Click(Sender: TObject);
    procedure Intersections1Click(Sender: TObject);
    procedure BuildPolygon(PolyType, Offset: Integer; ShapeList:TSVOShapeList);
    procedure DoIntersection(BaseShapes, OverlappingShapes: TSVOShapeList);

{$ifdef TFileFormatList} // if you have GraphicEx installed.
    procedure SVOGISImage1LoadImage(Sender: TObject;
      AnImage: TSVOImageLayer; var CancelImage: Boolean);
{$endif} // if you have GraphicEx installed.

    procedure SVOGISReadWrite1ErrorMessage(Sender: TObject;
      const ErrorStr: String; AnException: Exception;
      var Handled: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    FFindNearestNeighbor : Boolean;
    procedure AddFields(DataFields : TSVODataFields);
    procedure ClassBreakChange(Sender: TObject);
    procedure FindNearestNeighbor(X, Y: Integer);
    procedure NewShapeList(AShapeType: TSVOShapeType);
    procedure ShowShapeInfo;
    procedure UnionShape;
    function  OpenDataFile(const AFile: String; DataType: TSVOShapeFileType): Boolean;
  public
    { Public declarations }
    FKaynakCount : Integer;
   FPreviousPT  : Integer;
   FLastPT : Integer; //for WHAT?
   FLayerOfKaynak : Integer;
procedure Draw_Shape;//(Add AShapeList
  end;

var
  Form1: TForm1;


{ **** GETTING STARTED ****

There are up sides and down sides to all things in life.  The up side is that
Shape Viewer Objects is free.  Use it however you wish without cost.  However,
the down side is that the help are not updated to reflect all the changes with
SVO over the past year.  In many cases the help is still accurate, in other
areas it is just plain wrong.  MOST notable is the TSVOLegend which is
completely different now to deal with Image layers.  Eventually I will redo the
help.  But you have all the source code and I hope you can follow most of my
logic to get yourself going without too much trouble.

I have updated this demo application to give you examples and detailed
descriptions of how to do things with SVO.  These examples come from frequently
asked questions from users.  Other details can learned at any SVO training
seminar.  For more informatin see :

   http//www.ecostats.com/software/shapeviewer/svotraining.htm

Feel free to write me at the ESS e-mail address in the file header above if
you get stuck, have questions or want to report a bug.  SVO is a very active
and viable project and I encourage user comments.

Thanks...

Kevin Sallee
Ecological Software Solutions
October 3, 2003

}

implementation

{$R *.DFM}

uses GridUnit, MemoUnit, StrataUnit, BitmapFormatUnit, SVODbfUnit,
  JpegFormatUnit, JPEG, ConvertProjectionsForm, SelectXYFieldsForm,
  TextFileParser, DynamicArrayUnit, DrawMarkUnit, ShapeFunctions,
  ShellApi, DatumsUnit, FilterForm;

  
procedure TForm1.FormCreate(Sender: TObject);
begin
  FFindNearestNeighbor := False;
end;

procedure TForm1.ToolButtonOpenGISClick(Sender: TObject);
var
  ContinueToOpen : Boolean;
  i : Integer;
  NewShapeList : TSVOShapeList;
begin
  IF OpenDialog1.InitialDir = '' THEN
    OpenDialog1.InitialDir := ExtractFileDir(Application.ExeName);
  ContinueToOpen := True;
  IF OpenDialog1.Execute THEN BEGIN
    IF OpenDialog1.FilterIndex = 1 THEN
      SVOGISReadWrite1.FileType := sftArcView
    ELSE IF OpenDialog1.FilterIndex = 2 THEN
      SVOGISReadWrite1.FileType := sftDXF
    ELSE IF OpenDialog1.FilterIndex = 3 THEN
      SVOGISReadWrite1.FileType := sftMapInfo
    ELSE IF OpenDialog1.FilterIndex = 4 THEN
      ContinueToOpen := OpenDataFile(OpenDialog1.Files[0], sftDatabase)
    ELSE IF OpenDialog1.FilterIndex = 5 THEN
      ContinueToOpen := OpenDataFile(OpenDialog1.Files[0], sftText);
    IF ContinueToOpen THEN BEGIN
      FOR i := 0 TO OpenDialog1.Files.Count - 1 DO BEGIN
        NewShapeList := TSVOShapeList.Create;
        SVOGISReadWrite1.ShapeList := NewShapeList;
        SVOGISReadWrite1.ImportFileName := OpenDialog1.Files[i];
        SVOGISReadWrite1.ReadFile;
        IF SVOGISReadWrite1.FileType IN [sftDatabase, sftText] THEN
          Break; // Only open a sigle database or text file at one time.
      END;
      ToolButtonDefault.Down := True;
      SVOGISImage1.Mode := moDefault;
      OpenDialog1.InitialDir := ExtractFileDir(OpenDialog1.FileName);
    END;
  END;
end;

function TForm1.OpenDataFile(const AFile: String; DataType: TSVOShapeFileType): Boolean;
var
  SVODbfTable : TSVODbf;
  StringParser : TTextFileParser;
begin
  // can also modify to suit your Database source.
  Result := False;
  SelectXYFields := TSelectXYFields.Create(Self);
  TRY
    IF DataType = sftDatabase THEN // can also modify to suit your Database source.
      BEGIN
        SVODbfTable := TSVODbf.Create;  // In unit SVODbfUnit.pas for dBase Files
        SVODbfTable.OpenDbfTable(AFile);
        SelectXYFields.ListBoxX.Items.AddStrings(SVODbfTable.DataFields.FieldNames);
        SelectXYFields.ListBoxY.Items.AddStrings(SVODbfTable.DataFields.FieldNames);
        SVODbfTable.CloseDbfTable;
      END
    ELSE IF DataType = sftText THEN // dofTextFormat THEN
      BEGIN  // Text files
        StringParser := TTextFileParser.Create; // In unit TextFileParser.pas
        StringParser.LoadFromFile(AFile);
        SelectXYFields.ListBoxX.Items.AddStrings(StringParser.FieldNames);
        SelectXYFields.ListBoxY.Items.AddStrings(StringParser.FieldNames);
        StringParser.Free;
      END;
    IF SelectXYFields.ShowModal = mrOK THEN BEGIN
      SVOGISReadWrite1.XAxisVariable := SelectXYFields.XAxis;
      SVOGISReadWrite1.YAxisVariable := SelectXYFields.YAxis;
      SVOGISReadWrite1.FileType := DataType;
      Result := True;
    END;
  FINALLY
    SelectXYFields.Free;
  END;
end;

procedure TForm1.ToolButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ToolButtonCopyCanvasClick(Sender: TObject);
begin
  SVOGisImage1.CopyToClipboard;
end;

procedure TForm1.ToolButtonShapeInfoClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moIDShape;
end;

procedure TForm1.ToolButtonZoomInClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moZoomIn;
end;

procedure TForm1.ToolButtonZoomOutClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moZoomOut;
end;

procedure TForm1.DeleteShapeNodes1Click(Sender: TObject);
begin
  // Note, undo will not undo deleted nodes at this time.
  // It may in a future version of SVO.
  SvoGisImage1.Mode := moNodeDelete;
end;

procedure TForm1.AddShapeNodes1Click(Sender: TObject);
begin
  // Note, undo will not undo Added nodes at this time.
  // It may in a future version of SVO.
  SvoGisImage1.Mode := moNodeAdd;
end;

procedure TForm1.ToolButtonPrintClick(Sender: TObject);
begin
  // Note : Print does not work yet for images.
  SVOGisImage1.PrintPreview;
end;

procedure TForm1.ToolButtonCloseGISClick(Sender: TObject);
begin
  IF Not Assigned(SVOLegend.SelectedPanel) THEN Exit;
  SVOLegend.SelectedPanel.Free;
  SVOLegend.Repaint;
  SVOGISImage1.Draw;
end;

procedure TForm1.ToolButtonGrabClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moOpenHand;
end;

procedure TForm1.ToolButtonGridClick(Sender: TObject);
begin
  IF Not Assigned(SVOLegend.SelectedShapes) THEN Exit;
  FormGrid.SVODataGrid1.DataFields := SVOLegend.SelectedShapes.DataFields;
  FormGrid.Show;
end;

procedure TForm1.ToolButtonDefaultClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moDefault;
end;

procedure TForm1.ToolButtonFullExtentClick(Sender: TObject);
begin
  SVOGISImage1.UpdateCanvas;
end;

procedure TForm1.SVOGISImage1ShapeID(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; var Handled: Boolean);
var
  AShapeList : TSVOShapeList;
begin
  IF Not Assigned(SVOLegend.SelectedShapes) THEN Exit; // No shape selected
  AShapeList := SVOLegend.SelectedShapes;
  ShowShapeInfo;
  SVOGISImage1.SelectedShape.GraphicStyles.Brush.Color := clred;
  SvoGisImage1.SelectedShape.Draw(SvoGisImage1.Canvas, SvoGisImage1.ScaleParams);
end;

procedure TForm1.ShowShapeInfo;
// Start Sub Procedure to add data to the memo
  procedure AddData(ShapeIndex: Integer; AShapeList: TSVOShapeList);
  var
    j : Integer;
    AField, AValue : String;
  begin
    AShapeList.DataFields.RecordNum := ShapeIndex;
    FOR j := 0 TO AShapeList.DataFields.Count - 1 DO BEGIN
      AField := AShapeList.DataFields.FieldNames[j];
      AValue := AShapeList.DataFields.Items[j].Value;
      FormShapeInfo.Memo.Lines.Add(AField + ' : ' + AValue);
    END;
    FormShapeInfo.Memo.Lines.Add('');
  end;
// End Sub Procedure
var
  i, ShapeIndex : Integer;
  AShapeList: TSVOShapeList;
begin
  AShapeList := SVOGisImage1.SelectedShapeList;
  FormShapeInfo.Memo.Lines.Clear;
  IF AShapeList.SelectedShapes.Count > 0 THEN
    BEGIN
      FOR i := 0 TO AShapeList.SelectedShapes.count - 1 DO BEGIN
        ShapeIndex := AShapeList.IndexOfShape(AShapeList.SelectedShapes[i]);
        AddData(ShapeIndex, AShapeList);
      END;
    END
  ELSE
    BEGIN
      ShapeIndex := AShapeList.IndexOfShape(SVOGISImage1.SelectedShape);
      AddData(ShapeIndex, AShapeList);
    END;
  FormShapeInfo.Show;
end;

procedure TForm1.ToolButtonSaveGISClick(Sender: TObject);
var
  AShapeList : TSVOShapeList;
begin
  // Here we use the SVOLegend to get the selected shapelist to save.
  // There are three methods to reference shapes in the SVOLegend.
  // 1. SelectedShapes returns any TSVOShapeList that is selected or Nil if none
  //    is selected.
  // 2. SelectedImages returns any TSVOImageLayer (i.e. a picture) that is selected
  //    or Nil if none is selected.
  // 3. SelectedPanel returns a TSVOGisObject that is the parent class of
  //    both TSVOShapeList and TSVOImageLayer.  This is useful if you only want
  //    to access TSVOGisObject properties such as "Show", "DisplayName",
  //    "ShapeType", etc. or to call the "Draw" method.
  //
  // Note: You do not add items to the TSVOLegend.  It only displays what is in
  //       its associated TSVOGisImage.
  IF Not Assigned(SVOLegend.SelectedShapes) THEN Exit; // No shape selected
  IF SaveDialog1.Execute THEN BEGIN
    AShapeList := SVOLegend.SelectedShapes;
    SVOGISReadWrite1.FileType := sftArcView;
    SVOGISReadWrite1.ShapeList := AShapeList;
    SVOGISReadWrite1.ImportFileName := AShapeList.Source;
    SVOGISReadWrite1.ExportFileName := SaveDialog1.FileName;
    Screen.Cursor := crHourGlass;
    TRY
      SVOGISReadWrite1.WriteFile;
    FINALLY
      Screen.Cursor := crDefault;
    END;
  END;
end;

procedure TForm1.ToolButtonUndoClick(Sender: TObject);
begin
  SVOGisImage1.Undo;
end;

procedure TForm1.ToolButtonMeasureClick(Sender: TObject);
begin
  SVOGisImage1.Mode := moDistance;
end;

procedure TForm1.Points1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moNewPoint;
  NewShapeList(stPoint);
end;

procedure TForm1.Lines1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moNewLine;
  NewShapeList(stLine);
end;

procedure TForm1.Ellipses1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moNewEllipse;
  NewShapeList(stPolygon);
end;

procedure TForm1.Rectangles1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moNewRect;
  NewShapeList(stPolygon);
end;

procedure TForm1.Polygons1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moNewPolygon;
  NewShapeList(stPolygon);
end;

procedure TForm1.NewShapeList(AShapeType: TSVOShapeType);
var
  AShapeList : TSVOShapeList;
begin
  IF (SVOLegend.SelectedShapes <> Nil) AND (SVOGisImage1.Legend.SelectedShapes.ShapeType = AShapeType) AND (MessageDlg('Add to current shapes?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) THEN
    SVOGisImage1.SelectedShapeList := SVOGisImage1.Legend.SelectedShapes
  ELSE
    BEGIN
      AShapeList := TSVOShapeList.Create;
      AShapeList.Source := 'New Shape';
      AShapeList.ShapeType := AShapeType;
      AShapeList.CalculateMetrics := True;
      SVOGisImage1.AddShapeList(AShapeList); // True adds it to the legend
    END;
end;

procedure TForm1.EditShapes1Click(Sender: TObject);
begin
  SVOGisImage1.Mode := moPick;
end;

procedure TForm1.SVOLegendClick(Sender: TObject);
begin
  IF (SVOLegend.SelectedShapes <> Nil) THEN
    FormGrid.SVODataGrid1.DataFields := SVOLegend.SelectedShapes.DataFields;
end;

procedure TForm1.SVOGISImage1AddShape(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Handled: Boolean);
begin  
  FormGrid.SVODataGrid1.Invalidate;
end;

procedure TForm1.ToolButtonStratifyClick(Sender: TObject);
begin
  IF (SVOLegend.SelectedShapes <> Nil) THEN
  BEGIN
    FormStratify := TFormStratify.Create(Self);
    TRY
      FormStratify.AShapeList := SVOGisImage1.Legend.SelectedShapes;
      FormStratify.OnClassBreakChange := ClassBreakChange;
      FormStratify.ShowModal;
    FINALLY
      FormStratify.Free;
    END;
  END
  ELSE
    ShowMessage('No shape selected in the legend.');
end;

procedure TForm1.ClassBreakChange(Sender: TObject);
begin
  SVOGISImage1.Draw;
  SVOLegend.Invalidate;
  SVOLegend.Repaint;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  WHILE SVOGisImage1.ShapeLists.Count > 0 DO BEGIN
    i := SVOGisImage1.ShapeLists.Count - 1;
    SVOGisImage1.ShapeList[i].Free;
  END;
end;

procedure TForm1.SaveAsMetaFile1Click(Sender: TObject);
begin
  WITH SavePictureDialog1 DO BEGIN
    IF Execute THEN BEGIN
       CASE FilterIndex OF
          1 : BEGIN
                BitmapFormatForm.LabelHeight.Caption       := IntToStr(SVOGISImage1.Height);
                BitmapFormatForm.SpinEditBitmapWidth.Value := SVOGISImage1.Width;
                IF BitmapFormatForm.ShowModal = mrOK THEN
                  SVOGISImage1.SaveAsBitmap(FileName, Round(BitmapFormatForm.SpinEditBitmapWidth.Value), StrToInt(BitmapFormatForm.LabelHeight.Caption));
              END;
          2 : BEGIN
                JPEGFormatForm.LabelHeight.Caption      := IntToStr(SVOGISImage1.Height);
                JPEGFormatForm.SpinEditImageWidth.Value := SVOGISImage1.Width;
                IF JPEGFormatForm.ShowModal = mrOK THEN
                  SVOGISImage1.SaveAsJPEG(FileName, Round(JPEGFormatForm.SpinEditImageWidth.Value), Round(JPEGFormatForm.SpinEditCompression.Value), TJPEGPerformance(JPEGFormatForm.RadioGroupPerformance.ItemIndex), TJPEGPixelFormat(JPEGFormatForm.RadioGroupPixelFormat.ItemIndex), False, JPEGFormatForm.CheckBoxGrayScale.Checked);
              END;
          3 : SVOGISImage1.SaveAsMetafile(FileName);
      END;
    END;
  END;
end;

procedure TForm1.Copytoclipboard1Click(Sender: TObject);
begin
  SVOGISImage1.CopyToClipboard;
end;

procedure TForm1.CanvasColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := SVOGISImage1.Color;
  IF ColorDialog1.Execute THEN BEGIN
    SVOGISImage1.Color := ColorDialog1.Color;
    SVOGISImage1.UpdateCanvas;
    TMenuItem(Sender).Checked := NOT TMenuItem(Sender).Checked;
  END;
end;

procedure TForm1.ToolButtonUnionClick(Sender: TObject);
begin
  UnionShape;
end;

procedure TForm1.UnionShape;
var i , j : integer;
    ShapeIndex    : array of integer;
    AShape        : TSVOShapeObject;
    TempShapeList : TSVOShapeList;
    AShapeList    : TSVOShapeList;
    UnionShapeList : TSVOShapeList;
begin
  AShapeList := SVOGisImage1.SelectedShapeList;
  IF (AShapeList = Nil) OR (AShapeList.SelectedShapes.Count = 0) THEN BEGIN
    MessageDlg('No shape parts selected.', mtError, [mbOK], 0);
    Exit;
  END;
  IF AShapeList.SelectedShapes.Count > 0 THEN BEGIN
    setLength(ShapeIndex, AShapeList.SelectedShapes.Count);
    FOR i := 0 TO AShapeList.SelectedShapes.count - 1 DO
      ShapeIndex[i] := AShapeList.IndexOfShape(AShapeList.SelectedShapes[i]);
  END;
  Try
    TempShapeList := TSVOShapeList.Create;
    TempShapeList.ShapeType := stPolygon;
    for j := 0 to Length(ShapeIndex) - 1 do begin
      AShape := AShapeList[ShapeIndex[j]];
      TempShapeList.AddShapeObjectCopy(AShape);
    end;
    TempShapeList.ShapeOverlap.OverlapShapeList := Nil;
    // we will "Merge" the shapes, so set the IntersectMethod to imMerge.
    // See the GisShape.pas file for all the IntersectMethods you can use.
    TempShapeList.ShapeOverlap.IntersectMethod := imMerge;
    TempShapeList.ShapeOverlap.OnProgress := AShapeList.ShapeOverlap.OnProgress;
    TempShapeList.ShapeOverlap.MergeShapes;
    UnionShapeList := TSVOShapeList.Create;
    UnionShapeList.ShapeType := stPolygon;
    // All merge functions place the resulting shape as the last SubShapeList
    // in the Shapelist you performed the Merge on.  Here we just Assign (i.e. Copy)
    // the values to our UnionShapeList which we will display in the GisCanvas.
    // We later free the TempShapeList used to create the merge since we no longer
    // need it.
    UnionShapeList.Assign(TSVOShapeList(TempShapeList.SubShapeLists.Last));
    UnionShapeList.Source := 'Unioned Shape';
    UnionShapeList.ParentShapeList := Nil;
  Finally
    TempShapeList.Free;
    SVOGisImage1.AddShapeList(UnionShapeList);
    SVOGisImage1.Draw;
  End;
end;


procedure TForm1.SVOGISImage1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  StatusBar1.SimpleText := 'X : ' + FloatToStrF(SVOGISImage1.MouseXYPoint.X, ffFixed, 15, 5) + '  Y : ' + FloatToStrF(SVOGISImage1.MouseXYPoint.Y, ffFixed, 15, 5);
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  // Note that if the image layer does not have a world file SVO will not
  // load the layer.
  IF OpenPictureDialog.Execute THEN
    SVOGISImage1.LoadImageLayer(OpenPictureDialog.FileName);
end;

// If you have a third party graphics unit installed you can use it to load
// additional image formats such as TIFF files. SVO does not support GeoTiff
// files internally at this time, but you can add this implementation here
// and in the OnGetImageBitmap event.  You should also use the OnGetImageBitmap
// if you use very large image files, you should also use the OnGetImageBitmap and
// OnStretchImage events to get only the needed piece.

{$ifdef TFileFormatList}

procedure TForm1.SVOGISImage1LoadImage(Sender: TObject;
  AnImage: TSVOImageLayer; var CancelImage: Boolean);
var
  FileExt : String;
  APicture : TPicture;
begin
  IF AnImage.HasWorldFile THEN
    BEGIN
      FileExt := ExtractFileExt(AnImage.Filename);
      IF (FileExt = '.bmp') THEN
        Exit;  // GraphicEx does not support Bitmap files.  Let SVO handle it.
      APicture := TPicture.Create;
      TRY
        APicture.LoadFromFile(AnImage.FileName);
        AnImage.Image.Assign(APicture.Graphic);
      FINALLY
        APicture.Free;
      END;
    END
  ELSE
    CancelImage := True;  // Or insert your own georeference routean.
end;
{$endif}

// Here we show an example how to add a custom feature to a newly added shape list.
// Note we will be adding a few data fields to any ShapeList added to the GISImage
// just as an example to also show how to associate a "database" with the shape list.
// Note that with SVO the "database" is stored in a memory table, not on disk.
procedure TForm1.SVOGISImage1AddShapeList(Sender: TObject; AShapeList: TSVOShapeList);
var
  ADataField : TSVODataField;
  AGisImage  : TSvoGisImage;
begin
  AGisImage := Sender AS TSvoGisImage;
  // Add a string field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'A String Field';
  ADataField.FieldType := ctString;
  ADataField.Size := 40;
  // Add an integer field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'An Integer Field';
  ADataField.FieldType := ctInteger;
  // Add a float field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'A Float Field';
  ADataField.FieldType := ctFloat;
  ADataField.Size := 15;
  ADataField.FieldDecimals := 4;
  // Add a DateTime Field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'A DateTime Field';
  ADataField.FieldType := ctDateTime;
  // Add a Date Field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'A Date Field';
  ADataField.FieldType := ctDate;
  // Add a Time Field
  ADataField := AShapeList.Datafields.AddField;
  ADataField.Caption := 'A Time Field';
  ADataField.FieldType := ctTime;
end;

// Here we fill each new Shape's data field values with some generic data
// This is just to show how to add data to the shape's record.  When a shape is
// created, it has a generic record allready associated with it.  It normally
// uses the owning ShapeList's DataFields to control data entry.  But note that
// a shape has both a GisOwner and DataOwner Property.  Normally the DataOwner is
// the parent ShapeList's DataFields, but it need not be.  This is an advanced
// topic, and in most cases you can access a shape's data in one of the ways
// shown below.
//
// When you run the example program:
// 1. Open up a Shape file as a background layer.
// 2. Select to make new shapes (either, point, ellipse, rectangle, line, polygon).
//    Select this option from the "Pencil" toolbar button.
// 3. Open the data grid window as you add shapes and watch the data appear in
//    the data grid.
procedure TForm1.SVOGISImage1AfterShapeAdded(Sender: TObject;
  AShapeObject: TSVOShapeObject);
var
  i : Integer;
//  DataFields : TSVODataFields;
begin
  IF Assigned(AShapeObject.FieldByName('A String Field')) THEN
    AShapeObject.FieldByName('A String Field').AsString := 'A string value';
  IF Assigned(AShapeObject.FieldByName('An Integer Field')) THEN
    AShapeObject.FieldByName('An Integer Field').AsInteger := Random(10000);
  IF Assigned(AShapeObject.FieldByName('A Float Field')) THEN
    AShapeObject.FieldByName('A Float Field').AsFloat := Random;
  IF Assigned(AShapeObject.FieldByName('A DateTime Field')) THEN
    AShapeObject.FieldByName('A DateTime Field').AsDateTime := Now;
  IF Assigned(AShapeObject.FieldByName('A Date Field')) THEN
    AShapeObject.FieldByName('A Date Field').AsDateTime := Now;
  IF Assigned(AShapeObject.FieldByName('A Time Field')) THEN
    AShapeObject.FieldByName('A Time Field').AsDateTime := Now;

//  Shape Viewer Objects has many ways to reach the same information making
// it very flexible to your needs.
// Note that we could also access the shape's ShapeList and its DataFields property
{  DataFields := AShapeObject.GisOwner.DataFields;
  IF Assigned(DataFields.FieldByName('A String Field')) THEN
    Datafields.FieldByName('A String Field').AsString := 'A string value';
  IF Assigned(DataFields.FieldByName('An Integer Field')) THEN
    Datafields.FieldByName('An Integer Field').AsInteger := 1001;
  IF Assigned(DataFields.FieldByName('A Float Field')) THEN
    Datafields.FieldByName('A Float Field').AsFloat := 2002.555}

// Finally, note that we can also reference the field values by their index.
{  DataFields := AShapeObject.GisOwner.DataFields;
  FOR i := 0 TO DataFields.Count - 1 DO BEGIN
    CASE DataFields[i].FieldType OF
      ctString   : DataFields[i].AsString := 'String Field';
      ctWord,
      ctInteger  : DataFields[i].AsInteger := 1001;
      ctFloat,
      ctBCD,
      ctCurrency : DataFields[i].AsFloat := 202.555;
      ctDate,
      ctTime,
      ctDateTime : DataFields[i].AsDateTime := Now;
    END;
  END;     }
end;

// ***** Note that any one ShapeList can contain only one shape type ******

procedure TForm1.Points2Click(Sender: TObject);
var
  i : Integer;
  MinXVal, MinYVal : Double;
  PntRangeX, PntRangeY : Integer;
  ALocation : TDoublePoint;
  AShapeList : TSVOShapeList;
  APointShape : TSVOPointShape;
begin
  // Create the ShapeList and add it to the canvas.  This can be done later
  // after the shapes are added, but it is done here first just to load the
  // ShapeList's data fields since this is tied to the GisImage's OnAddShapeList
  // event.  You can also create data fields here or in another procedure.
  AShapeList := TSvoShapeList.Create;
  AShapeList.DisplayName := 'Points';
  SvoGisImage1.AddShapeList(AShapeList);
  MinXVal := SvoGisImage1.GetDataMouseXY(0, 0).X;
  MinYVal := SvoGisImage1.GetDataMouseXY(0, SvoGisImage1.Height).Y;
  PntRangeX := Round(SvoGisImage1.GetDataMouseXY(SvoGisImage1.Width, 0).X - MinXVal);
  PntRangeY := Round(SvoGisImage1.GetDataMouseXY(0, 0).Y - MinYVal);
  FOR i := 0 TO 100 DO BEGIN
    // The shape's constructor automatically adds the shape to the ShapeList.
    // Note that the SVOGISImage1AfterShapeAdded above fires for each shapes added
    APointShape := TSVOPointShape.Create(AShapeList);
    // MakeDoublePoint is in the DynamicArrayUnit.Pas file, be sure to add it to your uses clause.
    ALocation := MakeDoublePoint(MinXVal + Random(PntRangeX),
                                 MinYVal + Random(PntRangeY));
    APointShape.SetShape(ALocation);
    // Lets just randomize the point's size and type.
    APointShape.GraphicStyles.MarkSize := Random(6);
    APointShape.GraphicStyles.Mark := TPointTypes(Random(17));
  END;
  SvoGisImage1.Draw;
end;

procedure TForm1.Lines2Click(Sender: TObject);
var
  i, j : Integer;
  MinXVal, MinYVal : Double;
  PntRangeX, PntRangeY : Integer;
  ALocation  : TDoublePoint; // Defined in DynamicArrayUnit.pas
  AShapeList : TSVOShapeList;
  ADoublePointArray : TDoublePointArray; // Defined in DynamicArrayUnit.pas
  ALineShape : TSVOLineShape;
begin
  AShapeList := TSvoShapeList.Create;
  AShapeList.DisplayName := 'Lines';
  SvoGisImage1.AddShapeList(AShapeList);
  MinXVal := SvoGisImage1.GetDataMouseXY(0, 0).X;
  MinYVal := SvoGisImage1.GetDataMouseXY(0, SvoGisImage1.Height).Y;
  PntRangeX := Round(SvoGisImage1.GetDataMouseXY(SvoGisImage1.Width, 0).X - MinXVal);
  PntRangeY := Round(SvoGisImage1.GetDataMouseXY(0, 0).Y - MinYVal);
  FOR i := 0 TO 9 DO BEGIN
    // To create a polyline shape, you must either pass an SVO array class to
    // the line being created or pass a Nil array object and add the line array
    // later using the TSVOLineShape.SetShape method.  For this example, we will
    // first create the line's array, then create the line at once with this
    // array being passed to the constructor.  See the polygon example below
    // for an example of the SetShape method.

    // TDoublePointArray is not just an array, but a special class with many
    // built in functions allowing you to manipulate the array points such as
    // NearestNeighbor, Sort, Mean, MaxX, MaxY, Insert, FirstMatch, KeepRange,
    // DeleteRange, Resize, SwapItems and much more.  See the
    // DynamicArrayUnit.pas for all these methods.
    // When you create a TDoublePointArray, pass the size of the array to the
    /// constructor.  The array size will be 10.
    ADoublePointArray := TDoublePointArray.Create(10);
    TRY
      FOR j := 0 TO 9 DO BEGIN
        ALocation := MakeDoublePoint(MinXVal + Random(PntRangeX),
                                     MinYVal + Random(PntRangeY));
        ADoublePointArray[j] := ALocation;
      END;
      ALineShape := TSVOLineShape.Create(AShapeList, ADoublePointArray);
      // Lets just add some random colors and widths to the lines.
      ALineShape.GraphicStyles.Pen.Color := Random(MaxInt);
      ALineShape.GraphicStyles.Pen.Width := Random(4);
    FINALLY
      // A Line will only load the line array's values, it will not directly
      // use this object, so we should destroy it.
      ADoublePointArray.Free;
    END
  END;
  SvoGisImage1.Draw;
end;

procedure TForm1.Polygons2Click(Sender: TObject);
var
  i : Integer;
  MinXVal, MinYVal : Double;
  PntRangeX, PntRangeY : Integer;
  ALocation  : TDoublePoint; // Defined in DynamicArrayUnit.pas
  AShapeList : TSVOShapeList;
  ShapePointArray : TSVOShapePointArray; // Defined in GisShape.pas file
  APolygonShape : TSVOPolygonShape;
begin
  AShapeList := TSvoShapeList.Create;
  AShapeList.DisplayName := 'Polygon';
  SvoGisImage1.AddShapeList(AShapeList);
  MinXVal := SvoGisImage1.GetDataMouseXY(0, 0).X;
  MinYVal := SvoGisImage1.GetDataMouseXY(0, SvoGisImage1.Height).Y;
  PntRangeX := Round(SvoGisImage1.GetDataMouseXY(SvoGisImage1.Width, 0).X - MinXVal);
  PntRangeY := Round(SvoGisImage1.GetDataMouseXY(0, 0).Y - MinYVal);

  // In this case, we will delay the SVOGISImage1AfterShapeAdded event and
  // add the APolygonShape to the ShapeList only after it is fully created.
  // This is just to show the different ways to create shapes.

  // First, create the shape without a shapelist owner or array data.
  APolygonShape := TSVOPolygonShape.Create(Nil, Nil);

  // Note here we are creating a special point array that will be used and
  // owned by whatever shape we set it to, so we should not later free it as
  // we did above.
  // Here we will also use an alternate method to add data to this array.  We
  // set the size to Zero and use the Add method to add points.
  // TSVOShapePointArray, like TDoublePointArray, inherits from TSVOCustomArray
  // so it also has embedded features like: Insert, FirstMatch, KeepRange,
  // DeleteRange, Resize and much more.  See the GisShape.pas and
  // DynamicArrayUnit.pas units for all its methods.

  ShapePointArray := TSVOShapePointArray.Create(0);

  // We will not just create a simple polygon shape, but rather a complex one
  // that has two parts.
  // This polygon will be a rectangle within a rectangle that will look
  // like a rectangle with a hole in the middle.  Mouse clicks "within" this
  // hole will not be registered as being inside the polygon.  SVO fully
  // supports nested polygons of this type.
  ALocation := MakeDoublePoint(MinXVal + PntRangeX / 4,
                               MinYVal + PntRangeY / 4);
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + 3 * (PntRangeX / 4),
                               MinYVal + PntRangeY / 4);
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + 3 * (PntRangeX / 4),
                               MinYVal + 3 * (PntRangeX / 4));
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + PntRangeX / 4,
                               MinYVal + 3 * (PntRangeX / 4));
  ShapePointArray.AddPoint(ALocation);
  ShapePointArray.AddPoint(ShapePointArray[0]); // close the polygon

  // Add the first array to the polygon
  APolygonShape.SetShape(ShapePointArray);

  // We have to create another instance of ShapePointArray to add a second,
  // unique array to the polygon.  Notice again we do not free the last
  // instance of ShapePointArray.  The polygon will do this for us when it
  // is freed since it is the special TSVOShapePointArray class used by SVO shapes.
  ShapePointArray := TSVOShapePointArray.Create(0);
  ALocation := MakeDoublePoint(MinXVal + 2 * (PntRangeX / 6),
                               MinYVal + 2 * (PntRangeX / 6));
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + 4 * (PntRangeX / 6),
                               MinYVal + 2 * (PntRangeX / 6));
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + 4 * (PntRangeX / 6),
                               MinYVal + 4 * (PntRangeX / 6));
  ShapePointArray.AddPoint(ALocation);
  ALocation := MakeDoublePoint(MinXVal + 2 * (PntRangeX / 6),
                               MinYVal + 4 * (PntRangeX / 6));
  ShapePointArray.AddPoint(ALocation);
  ShapePointArray.AddPoint(ShapePointArray[0]); // close the polygon

  // Add the first shape to the polygon
  APolygonShape.SetShape(ShapePointArray);
  // Add a random fill style.  Note their are 25 extended brush styles in the
  // DrawMarkUnit.pas file.
  APolygonShape.GraphicStyles.Brush.ExtStyle := TSVOBrushStyle(Random(25));

  // Add the polygon to the ShapeList.
  // Note that since we did not create the polygon shape with the owner as the
  // shape list, the add shape event of the GisImage will not be called.
  AShapeList.Add(APolygonShape);
  // We assign the polygonshape's graphic style to the parent Shapelist so that
  // this color pattern will show in the legend.  Note to reset all shapes to
  // the Shapelist's default graphicstyles, use the ShapeList.DefaultGraphicStyles
  // method.
  AShapeList.GraphicStyles.Assign(APolygonShape.GraphicStyles);

  SvoGisImage1.Draw;
  // you can later reference both polygon arrays first polygon shape with:
  //
  // APolygonShape1 := AShapeList.ShapeAsPolygon(0).PartsList[0];
  // APolygonShape2 := AShapeList.ShapeAsPolygon(0).PartsList[1];
  //
  // Notice that shapes and shape parts are reference counted starting at Zero.
end;

procedure TForm1.FindNearestShape1Click(Sender: TObject);
begin
  // See the FindNearestNeighbor procedure that is envoked with the MouseUp event
  FindNearestShape1.Checked := Not FindNearestShape1.Checked;
  FFindNearestNeighbor := FindNearestShape1.Checked;
  IF FFindNearestNeighbor THEN
    SvoGisImage1.Mode := moNone // the moDefault mode has a built in shape selection that we must disable.
  ELSE
    SvoGisImage1.Mode := moDefault;
end;

procedure TForm1.SVOGISImage1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  APnt : TDoublePoint;
  i, ShapeListIndex, ShapeNumber, ShapeSavenum : Integer;
  Distance, TestDistance : Double;
  AShapeList : TSvoShapelist;
begin
  IF FFindNearestNeighbor THEN
    FindNearestNeighbor(X, Y);

{  APnt:=SvoGisImage1.GetActualDataMouseXY(X, Y);

  AShapeList := SvoGisImage1.SelectedShapes[SvoGisImage1.SelectedShapes.Count - 1];
  AShapeList.SelectedShape.GraphicStyles.Brush.color := clRed;
  SvoGisImage1.RemoveShapeHighlight([]);
 
  Distance := 0;
  ShapeListIndex:=-1;
  FOR i:=0 TO SvoGisImage1.ShapeLists.Count-1 DO BEGIN
    AShapeList:=SvoGisImage1.ShapeList[i];
    IF AShapeList.Show THEN BEGIN // only examine visible Shapelists.
      CASE AShapeList.ShapeType OF
        stPoint           :TestDistance:=ShapeFunctions.NearestPoint(ShapeNumber, APnt.X, APnt.Y, AShapeList);
        stLine, stPolygon :TestDistance:=ShapeFunctions.NearestArc(ShapeNumber, APnt.X, APnt.Y, AShapeList);
      END;
      IF (Distance=0) OR (TestDistance<Distance) THEN BEGIN
        Distance:=TestDistance;
        ShapeListIndex:=i;
        ShapeSavenum:=Shapenumber;
      END;
    END;
  END;

  // Finally highlight the nearest shape
  IF (ShapeListIndex>=0) THEN BEGIN
    AShapeList:=SvoGisImage1.ShapeList[ShapeListIndex];
    AShapeList.Items[ShapeSavenum].GraphicStyles.Brush.color := clRed;//PickShape(ShapeSavenum);
    try
    except
    end;
  END;               }
  SvoGisImage1.Draw;


end;

// This shows how to use additional functions located in the ShapeFunctions.pas
// file.  Both the NearestPoint and NearestArc functins are in
// ShapeFunctions.pas unit. Note that this will find the nearest shape, even if
// the mouse is outside the shape, as in the case of a polygon
procedure TForm1.FindNearestNeighbor(X, Y: Integer);
var
  i, ShapeListIndex, ShapeNumber : Integer;
  Distance, TestDistance : Double;
  APnt : TDoublePoint;
  AShapeList : TSVOShapeList;
  ShapeFunctions : TSVOShapeFunctions;
begin
  // First get the data relative location of the mouse click on the canvas.
  // We use GetActualDataMouseXY instead of GetDataMouseXY since GetDataMouseXY
  // will return the location relative to the current canvas projection, but we
  // want the raw data point location relative to the actual file's data
  APnt := SvoGisImage1.GetActualDataMouseXY(X, Y);
  // Next remove any currently highlighted shapes
  SvoGisImage1.RemoveShapeHighlight([]);
  // Next, find the nearest shapelist and its shape (i.e. by number as ShapeNumber)
  // on the canvas.
  Distance := 0;
  ShapeListIndex := -1;
  ShapeFunctions := TSVOShapeFunctions.Create;
  TRY
  FOR i := 0 TO SvoGisImage1.ShapeLists.Count - 1 DO BEGIN
    AShapeList := SvoGisImage1.ShapeList[i];
    IF AShapeList.Show THEN BEGIN // only examine visible Shapelists.
      CASE AShapeList.ShapeType OF
        stPoint           : TestDistance := AShapeList.NearestPoint(ShapeNumber, APnt.X, APnt.Y);
        stLine, stPolygon : TestDistance := AShapeList.NearestLine(ShapeNumber, APnt.X, APnt.Y);
      END;
      IF (Distance = 0) OR (TestDistance < Distance) THEN BEGIN
        Distance := TestDistance;
        ShapeListIndex := i;
      END;
    END;
  END;
  // Finally highlight the nearest shape
  IF ShapeListIndex >= 0 THEN BEGIN
    AShapeList := SvoGisImage1.ShapeList[ShapeListIndex];
    AShapeList.PickShape(ShapeNumber);
  END;
  // Redraw the map to show the selections, if any.
  SvoGisImage1.Draw;
  FINALLY
    ShapeFunctions.Free;
  END;
end;

// The GIS Image canvas has built in features to move user selected shapes
// on the GIS Image's canvas to other shapes types.
// Note that since a TSVOShapeList can hold only one shape type, a new shapelist
// is created and added to the canvas.  To use these methods, select the default
// canvas pointer (the "+" in the toolbar) and left click and drag the mouse to
// Select some shapes.
procedure TForm1.ToPoints1Click(Sender: TObject);
var
  AShapeList : TSVOShapeList;
begin
  AShapeList := TSVOShapeList.Create;
  AShapeList.ShapeType := stPoint;
  AShapeList.DisplayName := 'Points';
  SvoGisImage1.SelectedShapesToPoints(AShapeList, OrderedPoints1.Checked);
  SvoGisImage1.AddShapeList(AShapeList);
  SvoGisImage1.Draw;
end;

procedure TForm1.ToLine1Click(Sender: TObject);
var
  AShapeList : TSVOShapeList;
begin
  // SelectedShapesToLine will also auto create the AShapeList. But then we
  // should give the newly added shape list a friendly name.  Also, if
  // OrderedPoints is false, then the method will try to create a
  IF SvoGisImage1.SelectedShapesToLine(Nil, OrderedPoints1.Checked) = True THEN BEGIN
    AShapeList := SvoGisImage1.ShapeLists[0]; // new Shapelists are inserted at index 0 by default.
    AShapeList.Displayname := 'Line';
    SvoGisImage1.Draw;
  END;
end;

procedure TForm1.ToPolygon1Click(Sender: TObject);
var
  AShapeList : TSVOShapeList;
begin
  // SelectedShapesToLine will also auto create the AShapeList. But then we
  // should give the newly added shape list a friendly name.  Also, if
  // OrderedPoints is false, then the method will try to create a polygon based
  // on the centroid of the selected points.  This can create strange results but
  // can also be very useful.
  IF SvoGisImage1.SelectedShapesToPolygon(Nil, OrderedPoints1.Checked) = True THEN BEGIN
    AShapeList := SvoGisImage1.ShapeLists[0]; // new Shapelists are inserted at index 0 by default.
    AShapeList.Displayname := 'Line';
    SvoGisImage1.Draw;
  END;
end;

procedure TForm1.PromoteDemoteShape1Click(Sender: TObject);
var
  EnableMenu : Boolean;
begin
  EnableMenu := SvoGisImage1.SelectedShape <> Nil;
  ToPoints1.Enabled   := EnableMenu AND (SvoGisImage1.SelectedShape.ShapeType IN [stLine, stPolygon]);
  ToLine1.Enabled    := EnableMenu AND (SvoGisImage1.SelectedShape.ShapeType IN [stPoint, stPolygon]);
  ToPolygon1.Enabled := EnableMenu AND (SvoGisImage1.SelectedShape.ShapeType IN [stPoint, stLine]);
end;

// This is a very brief and simple example how to use SVO as engine to produce
// mapping content for a web site.  You can also leverage the Delphi Internet
// components to build your page and stream the page and image to the client.
// But here, we will just create a simple page using a disk based approach
// using some constants for the web page Html.  Note that you can also use
// filters or strata to show parts of the map before exporting.  Also you can
// zoom to whatever section you want using the SvoGisImage.ZoomTo method before
// exporting the map as an image. This exercise will be left to you to work out
// further details.
procedure TForm1.ToolButtonSaveAsHtmlClick(Sender: TObject);
const
  HtmlHeadStart = '<html><head>';
  HtmlHeadEnd   = '</head>';
  HtmlBodyStart = '<body bgcolor="#FFFFFF">';
  HtmlBodyEnd   = '</body></html>';
  ProgressiveDisplay = False;
  GrayScale = False;
var
  FileName : String;
  AStringList : TStringList;
  FileParams : Array[0..0] of Char;
begin
  AStringList := TStringList.Create;
  TRY
    // Save the map as an image.
    FileName := ExtractFilePath(Application.ExeName) + 'svo_map.jpg';
    SvoGisImage1.SaveAsJpeg(FileName, 300, 100, jpBestQuality, jf24Bit, ProgressiveDisplay, GrayScale);

    // Next create and save the html page text
    AStringList.Add(HtmlHeadStart);
    AStringList.Add('<title>SVO Html Page Example</title>');
    AStringList.Add(HtmlHeadEnd);
    AStringList.Add(HtmlBodyStart);
    AStringList.Add(' <table width="50%" border="0">');
    AStringList.Add('  <tr>');
    AStringList.Add('    <td><font face="Arial">ESS Shape Viewer Objects map export example</font></td>');
    AStringList.Add('  </tr>');
    AStringList.Add('  <tr>');
    AStringList.Add('    <td><img src="file:' + FileName + '" width="300"></td>');
    AStringList.Add('  </tr>');
    AStringList.Add('  <tr>');
    AStringList.Add('    <td><font face="Arial" size=2>Figure 1. My map.</font></td>');
    AStringList.Add('  </tr>');
    AStringList.Add('</table>');
    AStringList.Add(HtmlBodyEnd);
    FileName := ExtractFilePath(Application.ExeName) + 'svo_web.htm';
    AStringList.SaveToFile(FileName);
    ShellExecute(Application.Handle, nil, PChar(FileName+#0), FileParams, FileParams, SW_SHOW);
  FINALLY
    AStringList.Free;
  END;
end;

procedure TForm1.FileProjections1Click(Sender: TObject);
begin
  FormConvertProjections:= TFormConvertProjections.Create(Self);
  TRY
    FormConvertProjections.CurrCanvas := SVOGisImage1;
    FormConvertProjections.ShowModal;
  FINALLY
    FormConvertProjections.Free;
  END;
end;

procedure TForm1.CanvasProjections1Click(Sender: TObject);
var
  FormProjections: TFormProjections; // In DatumsUnit.pas
begin
  FormProjections := TFormProjections.Create(self);
  TRY
    FormProjections.ProjectionParams := SVOGisImage1.TransformProjection;
    IF FormProjections.ShowModal = mrOK THEN
      SVOGisImage1.ProjectionActive := True
    ELSE
      SVOGisImage1.ProjectionActive := False;
  FINALLY
    FormProjections.Free;
  END;
end;

procedure TForm1.ToolButtonFilterClick(Sender: TObject);
begin
  IF SVOLegend.SelectedShapes = Nil THEN
    MessageDlg('You must first select a shape in the legend.', mtError, [mbOk], 0)
  ELSE BEGIN
    FormFilter := TFormFilter.Create(Self);
    TRY
      FormFilter.ShapeList := SVOLegend.SelectedShapes;
      FormFilter.ShowModal;
      SvoGisImage1.Draw;
    FINALLY
      FormFilter.Free;
    END;
  END;
end;

procedure TForm1.SVOTools1Click(Sender: TObject);
var
  AShapeList : TSVOShapeList;
begin
  BufferPoints1.Enabled := False;
  AShapeList := SVOLegend.SelectedShapes;
  IF Assigned(AShapeList) THEN
    BufferPoints1.Enabled := AShapeList.ShapeType = stPoint;
end;

procedure TForm1.BufferPoints1Click(Sender: TObject);
var
  i, InsertAt : Integer;
  Radius : Double;
  AShapeList, ResultShapeList : TSVOShapeList;
begin
  // Buffering can take some time.  Be patient. The routean is not fully optomized yet.
  AShapeList := SVOLegend.SelectedShapes;
  // Normally, you should ask the user for their buffer radius in some window.
  Radius := (AShapeList.BoundaryBox.XMax - AShapeList.BoundaryBox.XMin) / 30;
  Screen.Cursor := crHourGlass;
  // We will insert the buffers just underneath the point layer in Z order.  So
  // we must find the point shapes Z order in the GisImage canvas using IndexOf
  InsertAt := SvoGisImage1.ShapeLists.IndexOf(AShapeList);
  TRY
    FOR i := 3 DOWNTO 1 DO BEGIN
      Screen.Cursor := crHourGlass;
      ResultShapeList := TSVOShapeList.Create;
      ResultShapeList.ShapeType := stPolygon;
      // the buffer method for any shapelist is:
      // Buffer(Radius: Double; BufferType: TBufferType; ResultShapeList: TSVOShapeList)
      // TBufferType includes btExterior, btInterior and btBoth.
      // Here we use btBoth.  But try also the other options and see how the
      // results differ.  
      AShapeList.Buffer(Radius * i, btBoth, ResultShapeList);
      ResultShapeList.Source := 'Buffer ' + FloatToStrF((i * Radius), ffFixed, 15, 2);
      // Inserting the shapelist instead of adding it to the GisImage means
      // the buffers will not cover the point shapes.
      SVOGisImage1.InsertShapeList(InsertAt, ResultShapeList);
    END;
  FINALLY
    Screen.Cursor := crDefault;
  END;
end;

procedure TForm1.Intersections1Click(Sender: TObject);
var
  ShapeList1, ShapeList2 : TSVOShapeList;
begin
  // We will create two polygon shapes and then intersect them
  // Two rectangles are created here, but any convex or concave polygon will
  // also work.
  ShapeList1 := TSvoShapeList.Create;
  ShapeList1.DisplayName := 'Polygon Base';
  ShapeList1.GraphicStyles.Brush.Style := bsClear; // make it clear so we can see the intersection
  SvoGisImage1.AddShapeList(ShapeList1);
  BuildPolygon(1, 2, ShapeList1);

  ShapeList2 := TSvoShapeList.Create;
  ShapeList2.DisplayName := 'Polygon Overlap';
  ShapeList2.GraphicStyles.Brush.Style := bsClear; // make it clear so we can see the intersection
  SvoGisImage1.AddShapeList(ShapeList2);
  BuildPolygon(1, 4, ShapeList2);

  SvoGisImage1.Draw;
  DoIntersection(ShapeList1, ShapeList2);
end;

procedure TForm1.BuildPolygon(PolyType, Offset: Integer; ShapeList:TSVOShapeList);
var
  j, PntRangeX, PntRangeY : Integer;
  MinXVal, MinYVal : Double;
  ALocation : TDoublePoint;
  ShapePointArray : TSVOShapePointArray;
begin
  MinXVal := SvoGisImage1.GetDataMouseXY(0, 0).X;
  MinYVal := SvoGisImage1.GetDataMouseXY(0, SvoGisImage1.Height).Y;
  PntRangeX := Round(SvoGisImage1.GetDataMouseXY(SvoGisImage1.Width, 0).X - MinXVal);
  PntRangeY := Round(SvoGisImage1.GetDataMouseXY(0, 0).Y - MinYVal);
  ShapePointArray := TSVOShapePointArray.Create(0);
  IF PolyType = 1 THEN
    BEGIN
      // This will build two rectangles to intersect.  Any convex or concave
      // polygon shape will work.  You are not limited to rectangles.
      // Intersections will also work with lines and point shape lists.  You
      // are not limited to just polygons, however not all intersection methods
      // are available for all shape types.
      ALocation := MakeDoublePoint(MinXVal + PntRangeX / 6,
                                   MinYVal + PntRangeY / 6);
      ShapePointArray.AddPoint(ALocation);
      ALocation := MakeDoublePoint(MinXVal + Offset * (PntRangeX / 6),
                                   MinYVal + PntRangeY / 6);
      ShapePointArray.AddPoint(ALocation);
      ALocation := MakeDoublePoint(MinXVal + Offset * (PntRangeX / 6),
                                   MinYVal + Offset * (PntRangeX / 6));
      ShapePointArray.AddPoint(ALocation);
      ALocation := MakeDoublePoint(MinXVal + PntRangeX / 6,
                                   MinYVal + Offset * (PntRangeX / 6));
      ShapePointArray.AddPoint(ALocation);
    END
  ELSE
    BEGIN
      // This will build a complex, overlapping polygon.  The Intersect method
      // is best applied to only convex or concave polygons which are the only
      // two polygon types you will use in real GIS applications.  But SVO will
      // still intersect even these non-traditional shapes.  You will notice that
      // since the polygons are not true convex or concave polygons, that the
      // intersection will seem to "miss" some overlap.  What happens is that
      // SVO is rotating what is "in" and "out" between successive overlaps.
      // This is normal as it is written, and is not a flaw in the software.
      FOR j := 0 TO 9 DO BEGIN
        ALocation := MakeDoublePoint(MinXVal + Random(PntRangeX),
                                 MinYVal + Random(PntRangeY));
        ShapePointArray.AddPoint(ALocation);
      END;
    END;

  ShapePointArray.AddPoint(ShapePointArray[0]); // close the polygon

  TSVOPolygonShape.Create(ShapeList, ShapePointArray);
end;

procedure TForm1.DoIntersection(BaseShapes, OverlappingShapes: TSVOShapeList);
var
  NewShapes : TSVOShapeList;
begin
  // Overlapping shapes is done using the ShapeOverlap class that is part of
  // each ShapeList.

  IF OverlappingShapes = BaseShapes THEN Exit;  // don't intersect itself.

  // Calling the MergeShapes method of the ShapeOverlap class creates the new
  // shape based on the "IntersectMethod" property.  Possible options for this
  // include: imIntersection, imInclusive, imExclusive, imContained, imVertices,
  //          imMerge, imOverlay, imUnion, imNone
  BaseShapes.ShapeOverlap.IntersectMethod := imIntersection;

  // You must assign the Shapelist that functions as the "overlapping" list of
  // Shapes.  Normally, the BaseShape will give its GraphicStyles to the
  // Intersected result while OverlappingShapes list will not.  If you are
  // intersecting a polygons Shapelist with a Lines Shapelist, normally the
  // overlapping shape list will the be lines Shapelist.
  BaseShapes.ShapeOverlap.OverlapShapeList := OverlappingShapes;
  // All intersections are added as the last subshape of the ShapeList.
  BaseShapes.ShapeOverlap.AddShapes := True;
  // All intersections are just highlighted.  No new shapes created.
{  BaseShapes.ShapeOverlap.HighlightOnly := True;}

  BaseShapes.ShapeOverlap.MergeShapes;
  // So we can reference this by using the "Last" method of the SubShapeList.
  NewShapes := TSVOShapeList(BaseShapes.SubShapeLists.Last);
  NewShapes.Source := BaseShapes.DisplayName + ' Intersection';
  NewShapes.GraphicStyles.Brush.Style := bsSolid;
  NewShapes.GraphicStyles.Brush.Color := clYellow;
  // This makes all the shapes in the shape list have the same graphic styles
  // as the shapelist's main GraphicStyles.
  NewShapes.DefaultGraphicStyles;
  // Add the shape list to the GISImage. SVO does not do this automatically since
  // you may just want to analyze features of the intersected shape out of view
  // of the user.
  SvoGisImage1.AddShapeList(NewShapes);
  // Redraw the canvas to show the shape.
  SvoGisImage1.Draw;
end;

procedure TForm1.SVOGISReadWrite1ErrorMessage(Sender: TObject;
  const ErrorStr: String; AnException: Exception; var Handled: Boolean);
begin
  ShowMessage('hi');
  Handled := True;

end;

procedure TForm1.ToolButton1Click(Sender: TObject);
var
  i : Integer;
  AFieldName, InputReturn : String;
  AShapeList : TSVOShapeList;
  AShape : TSVOShapeObject;
begin
  AShapeList := SVOGISImage1.SelectedShapeList;
  IF Assigned(AShapeList) THEN BEGIN
    AShape := AShapeList.SelectedShape;
    IF Assigned(AShape) THEN BEGIN
      AddFields(AShapeList.DataFields);
      // Like with a database we need to position the record pointer 
      // on the correct record before modifying it.  There are 
      // many ways to do this, but since we have the Shape, we 
      // can use its ShapeInfo property  to set itself as 
      // the current record.
      AShapeList.Records.CurrentRecord := AShape.ShapeInfo;
      FOR i := 0 TO AShapeList.DataFields.Count - 1 DO BEGIN
        AFieldName := AShapeList.DataFields[i].Caption;
        InputReturn := AShapeList.DataFields[i].AsString;
        IF InputQuery('Field Data', AFieldName + ' Field Value:', InputReturn) = True THEN
          TRY
            AShapeList.DataFields.FieldByName(AFieldName).Value := InputReturn;
          EXCEPT
            ON E:Exception DO ShowMessage(E.Message);
          END;
      END 
    END
    ELSE
      ShowMessage('No selected shape.');
  END
  ELSE
    ShowMessage('No selected shape list.');

end;

procedure TForm1.AddFields(DataFields : TSVODataFields);
var
  ADataField : TSVODataField;
begin
  IF NOT Assigned(DataFields.FieldByName('A String Field')) THEN BEGIN
    ADataField := DataFields.AddField;
    ADataField.Caption := 'A String Field';
    ADataField.FieldType := ctString;
    ADataField.Size := 40;
  END;
  IF NOT Assigned(DataFields.FieldByName('An Integer Field')) THEN BEGIN
    ADataField := DataFields.AddField;
    ADataField.Caption := 'An Integer Field';
    ADataField.FieldType := ctInteger
  END;
end;


procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  Draw_Shape;
end;

//ESS--------------------------------------------------
procedure TForm1.Draw_Shape;//(Add AShapeList
//-----------------------------------------------------
const
   Y5 = 0.1;   //min. distance on the shape
   m   = Y5; //multiplier
//-----------
   Y2 = 15*m;
   Y3 = 51*m;
   Y4 = 3*m;
   X2 = 10*m;
   X3 = 13*m;
   X4 = 57*m;
   X5 = 17*m;
   X6 = 66*m;
var
  i(*,userX,userY*) : Integer;
  (*minX, minY,*) L, dX, dY : Double;
  PntRangeX, PntRangeY : Integer;
  vPos  : TDoublePoint; // Defined in DynamicArrayUnit.pas
  vShapeList : TSVOShapeList;
  vArray : TSVOShapePointArray; // Defined in GisShape.pas file
  vManson : TSVOPolygonShape;
begin
   //Count kaynaks
   Inc(FKaynakCount);
   FPreviousPT:= FLastPT; //for WHAT?

   //Create kaynaks' layer on the first kaynak-shape
   if (FKaynakCount = 1) then begin
      FLayerOfKaynak:= SVOGISImage1.ShapeLists.Count; //0-based
      NewShapeList(stPolygon);
   end;

   dX:= 100;//pKay.xLoc;
   dY:= 100;//pKay.yLoc;

   //Open Layer
   vShapeList:= SVOGISImage1.SelectedShapeList;
   if NOT Assigned(vShapeList) then exit;//-->

   //Converts (x,y) to data relative point values -DEL!
//   userX:= StrToInt(edX.text);
//   userY:= StrToInt(edY.text);
//   minX := GIS1.GetDataMouseXY(userX, userY).X;
//   minY := GIS1.GetDataMouseXY(userX, userY).Y;
 
   // Add the PolygonShape to the ShapeList only
   // after it is fully created
   // First, create the shape without a shapelist owner
   // or array data.
   vManson := TSVOPolygonShape.Create(Nil, Nil);

   // Note here we are creating a special point array that will be
   // used and owned by whatever shape we set it to, so we should
   // not later free it as we did in Line Shape!
   //
   // Here we will also use an alternate method to add data to this array.
   // We set the size to Zero and use the Add method to add points.
   // TSVOShapePointArray, like TDoublePointArray, inherits from TSVOCustomArray
   // so it also has embedded features like: Insert, FirstMatch, KeepRange,
   // DeleteRange, Resize and much more.  See the GisShape.pas and
   // DynamicArrayUnit.pas units for all its methods.
   vArray := TSVOShapePointArray.Create(0);
 
   //Now draw the manson
   //MoveTo(Xs,Ys)
   L:= X2+X3+X4+X3+X2; //Length
   vPos := MakeDoublePoint(dX, dY);//0
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2, dY+Y5);//1
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2, dY+Y5+Y2);//2
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3, dY+Y5+Y2);//3
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3, dY+Y5);//4
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3+X4, dY+Y5);//5
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3+X4, dY+Y5+Y2);//6
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3+X4+X3, dY+Y5+Y2);//7
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+X2+X3+X4+X3, dY+Y5);//8
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+L, dY);//9
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+L, dY-Y3);//10
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+L-X5, dY-Y3-Y4);//11
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX+L-X5-X6, dY-Y3-Y4);//12
   vArray.AddPoint(vPos);
   vPos := MakeDoublePoint(dX, dY-Y3);//13
   vArray.AddPoint(vPos);
   //Close the polygon
   vArray.AddPoint(vArray[0]);//14->0

   // Add the first array to the polygon
   vManson.SetShape(vArray);
 
   // Add a fill style.
   // NOTE! there are 25 extended brush styles in DrawMarkUnit.pas file.
   vManson.GraphicStyles.Brush.ExtStyle := TSVOBrushStyle(1);//(Spin1.Value);

   // Add the polygon to the ShapeList.
   // NOTE! that since we did not create the polygon shape with
   // the owner as the shape list, GisImage.AddShape will not be called.
   vShapeList.Add(vManson);

   // We assign the polygonshape's graphic style to the parent
   // Shapelist so that this color pattern will show in the legend.
   // NOTE! to reset all shapes to the Shapelist's default
   // graphicstyles, use the ShapeList.DefaultGraphicStyles method.
   vShapeList.GraphicStyles.Assign(vManson.GraphicStyles);
   vShapeList.CalculateMetrics := True;
   SVOGISImage1.Draw;
end;//Draw_Shape


initialization

  Randomize;

end.
