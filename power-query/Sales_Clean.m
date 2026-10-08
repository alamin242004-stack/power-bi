// Power Query (M): Sales_Clean
// Source: sheet 'Sales_Clean' in Itikan_Cleaned_Data_Pack.xlsx
let
    Source = Excel.Workbook(File.Contents("<path-to>/Itikan_Cleaned_Data_Pack.xlsx"), null, true),
    #"Navigation 1" = Source{[Item = "Sales_Clean", Kind = "Sheet"]}[Data],
    #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
    #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Order ID", Int64.Type}, {"Customer Name", type text}, {"Order Date", Int64.Type}, {"Order Subtotal", type number}, {"Tax Total", type number}, {"Shipping Revenue", type number}, {"Ship Method", type text}, {"Order Total", type number}, {"Payment Method", type text}, {"Channel", type text}, {"State", type text}, {"PostCode", Int64.Type}, {"Order Profit", type number}, {"Country", type text}, {"State_Clean", type text}, {"Profit %", type number}, {"Order Total (Check)", type number}})
in
    #"Changed column type"
