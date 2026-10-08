// Power Query (M): Shipping_Clean
// Source: sheet 'Shipping_Clean' in Itikan_Cleaned_Data_Pack.xlsx
let
    Source = Excel.Workbook(File.Contents("<path-to>/Itikan_Cleaned_Data_Pack.xlsx"), null, true),
    #"Navigation 1" = Source{[Item = "Shipping_Clean", Kind = "Sheet"]}[Data],
    #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
    #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Order ID", Int64.Type}, {"Order Date", Int64.Type}, {"Picking date", Int64.Type}, {"Shipping date", Int64.Type}, {"Ship Method", type text}, {"Days to pick", Int64.Type}, {"Days to Ship", Int64.Type}, {"Shipping Cost (Carrier)", Int64.Type}})
in
    #"Changed column type"
