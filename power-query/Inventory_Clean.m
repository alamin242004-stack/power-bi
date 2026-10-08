// Power Query (M): Inventory_Clean
// Source: sheet 'Inventory_Clean' in Itikan_Cleaned_Data_Pack.xlsx
let
    Source = Excel.Workbook(File.Contents("<path-to>/Itikan_Cleaned_Data_Pack.xlsx"), null, true),
    #"Navigation 1" = Source{[Item = "Inventory_Clean", Kind = "Sheet"]}[Data],
    #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
    #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Snapshot Date", Int64.Type}, {"Inv Cat A", Int64.Type}, {"Inv Cat B", Int64.Type}, {"Inv Cat C", Int64.Type}, {"Low Stock Cat A", Int64.Type}, {"Low Stock Cat B", Int64.Type}, {"Low Stock Cat C", Int64.Type}, {"Warning Cat A", type text}, {"Warning Cat B", type text}, {"Warning Cat C", type text}, {"Inv Cat A (Flag Negative)", type logical}, {"Inv Cat A (Clipped)", Int64.Type}, {"Inv Cat B (Flag Negative)", type logical}, {"Inv Cat B (Clipped)", Int64.Type}, {"Inv Cat C (Flag Negative)", type logical}, {"Inv Cat C (Clipped)", Int64.Type}})
in
    #"Changed column type"
