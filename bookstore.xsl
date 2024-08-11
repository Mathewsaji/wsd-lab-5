<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml">

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Bookstore Inventory</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f4f4f4;
                    }
                    h1 {
                        color: #333;
                    }
                    .container {
                        width: 80%;
                        margin: 0 auto;
                        background: #fff;
                        padding: 20px;
                        box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        margin-top: 20px;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                    }
                    th {
                        background-color: #4CAF50;
                        color: white;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                    tr:hover {
                        background-color: #ddd;
                    }
                    .search-container {
                        margin-bottom: 20px;
                    }
                    input[type="text"] {
                        width: 100%;
                        padding: 10px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        box-sizing: border-box;
                    }
                </style>
                <script>
                    function filterBooks() {
                        var input, filter, table, tr, td, i, txtValue;
                        input = document.getElementById("searchInput");
                        filter = input.value.toLowerCase();
                        table = document.getElementById("booksTable");
                        tr = table.getElementsByTagName("tr");
                        
                        for (i = 1; tr.length > i; i++) {
                            tr[i].style.display = "none";
                            td = tr[i].getElementsByTagName("td");
                            for (var j = 0; td.length > j; j++) {
                                if (td[j]) {
                                    txtValue = td[j].textContent || td[j].innerText;
                                    if (txtValue.toLowerCase().indexOf(filter) > -1) {
                                        tr[i].style.display = "";
                                        break;
                                    }
                                }
                            }
                        }
                    }
                </script>
            </head>
            <body>
                <div class="container">
                    <h1>Bookstore Inventory</h1>
                    <div class="search-container">
                        <input type="text" id="searchInput" onkeyup="filterBooks()" placeholder="Search for books by title, author, or publisher..."></input>
                    </div>
                    <table id="booksTable">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>Price</th>
                                <th>Year</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Apply template to each book element -->
                            <xsl:for-each select="bookstore/book">
                                <tr>
                                    <td><xsl:value-of select="title" /></td>
                                    <td><xsl:value-of select="author" /></td>
                                    <td><xsl:value-of select="publisher" /></td>
                                    <td><xsl:value-of select="price" /></td>
                                    <td><xsl:value-of select="year" /></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>