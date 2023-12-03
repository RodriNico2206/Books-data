DECLARE
    v_sql_statement VARCHAR2(4000); -- Adjust the size as needed
BEGIN
    -- Construct a dynamic SQL statement with multiple statements
    v_sql_statement :=
    'CREATE TABLE AUX_books_03 AS ' || -- This is a coomet
    'SELECT a.author_name, b.title, ' ||
    'b.publication_date, p.publisher_name, b.num_pages ' ||
    'FROM book b ' ||
    'INNER JOIN book_language bl ON bl.language_id = b.language_id ' ||
    'INNER JOIN publisher p ON p.publisher_id = b.publisher_id ' ||
    'INNER JOIN book_author ba ON ba.book_id = b.book_id ' ||
    'INNER JOIN author a ON a.author_id = ba.author_id';

    -- Execute the dynamic SQL statement
    EXECUTE IMMEDIATE v_sql_statement;
END;
/

SELECT author_name, title, publication_date,
publisher_name, num_pages FROM AUX_books_03

DROP TABLE AUX_books_03