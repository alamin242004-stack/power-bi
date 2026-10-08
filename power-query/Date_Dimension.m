// Power Query (M): Date_Dimension
// Source: sheet 'Date_Dimension' in Itikan_Cleaned_Data_Pack.xlsx
let
    Source = Excel.Workbook(File.Contents("<path-to>/Itikan_Cleaned_Data_Pack.xlsx"), null, true),
    #"Navigation 1" = Source{[Item = "Date_Dimension", Kind = "Sheet"]}[Data],
    #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
    #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Date", Int64.Type}, {"Year", Int64.Type}, {"Month Number", Int64.Type}, {"Month Name", type text}, {"Month Year", type date}, {"Quarter", type text}, {"Day of Week", type text}, {"Week Number", Int64.Type}})
in
    #"Changed column type"
