Use AdventureWorks2025;
go

BEGIN TRY

    SELECT 10 / 0 AS Resultado;

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS NumeroErro,
        ERROR_MESSAGE() AS MensagemErro,
        ERROR_LINE() AS LinhaErro;

END CATCH;