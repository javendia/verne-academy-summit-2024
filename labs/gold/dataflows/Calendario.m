let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMjDUByIjAwMDpdhYAA==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [StartDate = _t]),
  #"Añadida fecha de fin" = Table.AddColumn(Source, "EndDate", each Date.From(DateTime.LocalNow())),
  #"Tipo de columna cambiado" = Table.TransformColumnTypes(#"Añadida fecha de fin", {{"StartDate", type date}, {"EndDate", type date}}),
  #"Añadido array de fechas" = Table.AddColumn(#"Tipo de columna cambiado", "Date", each {Number.From([StartDate])..Number.From([EndDate])}),
  #"Se expandió Dates" = Table.ExpandListColumn(#"Añadido array de fechas", "Date"),
  #"Tipo de columna cambiado 1" = Table.TransformColumnTypes(#"Se expandió Dates", {{"Date", type date}}),
  #"Columnas quitadas" = Table.RemoveColumns(#"Tipo de columna cambiado 1", {"StartDate", "EndDate"}),
  #"Añadido Año" = Table.AddColumn(#"Columnas quitadas", "Year", each Date.Year([Date]), Int64.Type),
  #"Añadido num_mes" = Table.AddColumn(#"Añadido Año", "Month", each Date.Month([Date]), Int64.Type),
  #"Añadido Nombre del mes" = Table.AddColumn(#"Añadido num_mes", "MonthName", each Date.MonthName([Date]), type text)
in
    #"Añadido Nombre del mes"