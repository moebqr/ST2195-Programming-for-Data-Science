# Block 2: Data
> [Mohamed Alderazi]: These notes are not in their final version (yet to add python related content). Feel free to contribute to the notes by making a change and a pull request.
---
# Data Types Overview
- **Structured Data**: Organized in a tabular format (rows & columns). Examples: Stock prices, addresses, sensor data. Suitable for relational databases (RDBMS). Easier to search, organize, and analyze using statistical and machine learning tools.
- **Semi-Structured Data**: Lacks the rigid structure of relational databases but contains organizational elements like tags (e.g., XML, JSON, Markdown files).
- **Unstructured Data**: No predetermined structure. Examples: Text, images, audio. Often transformed into structured data for analysis.

# File Formats for Data Exchange
## 1. **Plain Text**
- Basic, platform-independent storage (.txt).
- Example: `nile.txt` (annual flow of the river Nile data).

## 2. **Delimiter-Separated Values**
- **CSV**: Comma-separated values.
- **TSV**: Tab-separated values.
- **Import in R**: `read.table()` for various delimiters, `read.csv()` for comma-separated.
- **Export in R**: `write.table()`, `write.csv()`.
- Example Code:
    ```r
    running <- read.table("running_dat.tsv", header = TRUE, sep = "\t")
    read.csv("running_dat.csv")
    write.table(running, file = "running.dat", sep = "&&", dec = "*")
    ```

## 3. **XML (Extensible Markup Language)**
- Markup language for structured and semi-structured data. Organized into elements with tags (e.g., `<surname>Tukey</surname>`). Suitable for hierarchical data.
- **Import in R**: `xml2` package (`read_xml()`), `XML` package (`xmlToDataFrame()`).
- **Export in R**: `write_xml()`.
- Example Code:
    ```r
    library("xml2")
    stats_people <- read_xml("statisticians.xml")
    surname_nodes <- xml_find_all(stats_people, ".//surname")
    xml_text(surname_nodes)
    write_xml(stats_people, "statisticians_no_bayes.xml")
    ```

## 4. **JSON (JavaScript Object Notation)**
- Data interchange format, human-readable and machine-readable. Supports basic variable types: strings, numbers, arrays, Booleans, etc.
- **Import in R**: `jsonlite` package (`fromJSON()`).
- **Export in R**: `toJSON()`.
- Example Code:
    ```r
    library("jsonlite")
    stats_people <- fromJSON("statisticians.json")
    running_json <- toJSON(running)
    ```

## 5. **Spreadsheets**
- Applications: Microsoft Excel, LibreOffice Calc, Apple Numbers. Used for data analysis and visualization.
- Formats: `.xlsx`, `.ods` (both based on XML).

## 6. **Other Data Formats**
- **Binary Formats**: HDF5, netCDF for scientific data.
- **Image Formats**: PNG, JPEG.
- **Video Formats**: MP4.

# Import/Export of Data-Exchange Files in R
## 1. **Plain Text Files**
- **Import**: `scan()` reads numeric data. `scan("filename.txt", what = character())` reads character data.
- **Export**: `cat()`, `write()`.
- Example Code:
    ```r
    nile <- scan("nile.txt")
    cat(nile, file = "nile1.txt", sep = ",")
    ```

## 2. **XML Files**
- Use `xml2` package for simpler operations or `XML` package for more control.
- Extract specific elements using XPath.
- Example Code:
    ```r
    library("xml2")
    stats_people <- read_xml("statisticians.xml")
    surname_nodes <- xml_find_all(stats_people, ".//surname")
    xml_text(surname_nodes)
    write_xml(stats_people, "statisticians_no_bayes.xml")
    ```

## 3. **JSON Files**
- Use `jsonlite` package for import/export.
- Example Code:
    ```r
    library("jsonlite")
    stats_people <- fromJSON("statisticians.json")
    running_json <- toJSON(running)
    ```

# Data Formats and Common Issues
- **Delimiter Collision**: Handling delimiters within data values (e.g., commas in CSV files).
- **Binary Formats**: Suitable for large scientific data, images, and videos (e.g., HDF5, netCDF).

# Useful R Functions for Data Import/Export
- **`scan()`**: Reads plain text files.
- **`read.table()`**: Reads delimiter-separated files.
- **`xml2::read_xml()`**: Reads XML files.
- **`jsonlite::fromJSON()`**: Reads JSON files.
- **`write.table()`, `write.csv()`, `write_xml()`, `toJSON()`**: For exporting data.

# Useful Links and Resources
- [Difference Between Data Types](https://www.forbes.com/sites/bernardmarr/2019/10/18/whats-the-difference-between-structured-semi-structured-and-unstructured-data/#2c51432a2b4d)
- [topicmodels R package](https://cran.r-project.org/package=topicmodels)
- [Introduction to JSON](https://www.w3schools.com/whatis/whatis_json.asp)
- [XML and JSON in R](https://cran.r-project.org/package=XML)

# Import/Export Best Practices
- Always check the structure of data before and after import using `str()`.
- Use `header = TRUE` in `read.table()` when the first row contains variable names.
- Use appropriate delimiters when importing/exporting data (e.g., commas for CSV, tabs for TSV).
