Create Function fnTiraAcento (@cExpressao varchar(500))
Returns varchar(100)
as
Begin

   Declare @cRetorno varchar(500)
   
   Set @cRetorno = @cExpressao collate sql_latin1_general_cp1251_cs_as
   
   Return @cRetorno
   
End