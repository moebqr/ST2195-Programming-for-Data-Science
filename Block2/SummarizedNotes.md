# Block 2: Data
> [Mohamed Alderazi]: These notes are not in their final version (yet to add python related content). Feel free to contribute to the notes by making a change and a pull request.

## Table of Contents
1. [Data Types Overview](#data-types-overview)
2. [File Formats for Data Exchange](#file-formats-for-data-exchange)
3. [Import/Export of Data in R](#importexport-of-data-in-r)
4. [Data Types and Structures in R](#data-types-and-structures-in-r)
5. [Common Issues and Best Practices](#common-issues-and-best-practices)
6. [Useful R Functions](#useful-r-functions)
7. [Useful Links and Resources](#useful-links-and-resources)

---

# Data Types Overview
- **Structured Data**: Organized in tabular format (rows & columns). Examples: Stock prices, addresses, sensor data. Suitable for relational databases (RDBMS).
- **Semi-Structured Data**: Contains organizational elements like tags (e.g., XML, JSON, Markdown files) but lacks rigid structure of relational databases.
- **Unstructured Data**: No predetermined structure. Examples: Text, images, audio. Often transformed into structured data for analysis.

# File Formats for Data Exchange
## 1. **Plain Text**
- Basic, platform-independent storage (.txt).
- Example: `nile.txt` (annual flow of the river Nile data).

## 2. **Delimiter-Separated Values**
- **CSV**: Comma-separated values.
- **TSV**: Tab-separated values.
- **R Functions**: 
  - Import: `read.table()` (various delimiters), `read.csv()` (comma-separated).
  - Export: `write.table()`, `write.csv()`.
- Example Code:
    ```r
    running <- read.table("running_dat.tsv", header = TRUE, sep = "\t")
    read.csv("running_dat.csv")
    write.table(running, file = "running.dat", sep = "&&", dec = "*")
    ```

## 3. **XML (Extensible Markup Language)**
- Markup language for structured and semi-structured data. Organized into elements with tags. Suitable for hierarchical data.
- **R Functions**: 
  - Import: `xml2::read_xml()`, `XML::xmlToDataFrame()`.
  - Export: `write_xml()`.
- Example Code:
    ```r
    library("xml2")
    stats_people <- read_xml("statisticians.xml")
    surname_nodes <- xml_find_all(stats_people, ".//surname")
    xml_text(surname_nodes)
    write_xml(stats_people, "statisticians_no_bayes.xml")
    ```

## 4. **JSON (JavaScript Object Notation)**
- Human-readable and machine-readable data interchange format. Supports basic variable types: strings, numbers, arrays, Booleans, etc.
- **R Functions**: 
  - Import: `jsonlite::fromJSON()`.
  - Export: `toJSON()`.
- Example Code:
    ```r
    library("jsonlite")
    stats_people <- fromJSON("statisticians.json")
    running_json <- toJSON(running)
    ```

## 5. **Spreadsheets**
- Applications: Microsoft Excel, LibreOffice Calc, Apple Numbers.
- Formats: `.xlsx`, `.ods` (both based on XML).

## 6. **Other Data Formats**
- **Binary Formats**: HDF5, netCDF for scientific data.
- **Image Formats**: PNG, JPEG.
- **Video Formats**: MP4.

# Import/Export of Data-Exchange Files in R
## 1. **Plain Text Files**
- **Import**: `scan()` (numeric data), `scan("filename.txt", what = character())` (character data).
- **Export**: `cat()`, `write()`.
- Example Code:
    ```r
    nile <- scan("nile.txt")
    cat(nile, file = "nile1.txt", sep = ",")
    ```

# Data Formats and Common Issues
- **Delimiter Collision**: Handling delimiters within data values (e.g., commas in CSV files).
- **Binary Formats**: Suitable for large scientific data, images, and videos.

# Useful R Functions for Data Import/Export
- **`scan()`**: Reads plain text files.
- **`read.table()`, `read.csv()`**: Read delimiter-separated files.
- **`xml2::read_xml()`, `jsonlite::fromJSON()`**: Read XML and JSON files respectively.
- **`write.table()`, `write.csv()`, `write_xml()`, `toJSON()`**: Export data.

# Useful Links and Resources
- [Difference Between Data Types](https://www.forbes.com/sites/bernardmarr/2019/10/18/whats-the-difference-between-structured-semi-structured-and-unstructured-data/#2c51432a2b4d)
- [topicmodels R package](https://cran.r-project.org/package=topicmodels)
- [Introduction to JSON](https://www.w3schools.com/whatis/whatis_json.asp)
- [XML and JSON in R](https://cran.r-project.org/package=XML)

# Import/Export Best Practices
- Check data structure before and after import using `str()`.
- Use `header = TRUE` in `read.table()` when the first row contains variable names.
- Use appropriate delimiters when importing/exporting data.

# Data Types and Structures in R

## Basic Data Types

1. **Logical**
   - Values: `TRUE` or `FALSE`
   - Operators: 
     - `&` (AND)
     - `|` (OR)
     - `!` (NOT)

2. **Character (String)**
   - Created with quotes: `"Data"`
   - Concatenation:
     - `cat()`: Requires `\n` for new line
     - `paste()`: Automatically adds space between strings

3. **Numeric**
   - Decimal numbers: `2.5`

4. **Integer**
   - Created with `L` suffix: `5L`
   - Or by using `as.integer()`: `as.integer(5)`

## Data Type Operations and Functions

- **Type Checking**:
  - `typeof()`: What is it?
  - `class()`: What is it?
  - `storage.mode()`: What is it?
  - `length()`: How long is it?
  - `attributes()`: Does it have any metadata?

- **Arithmetic Operations**:
  - Addition: `+`
  - Subtraction: `-`
  - Multiplication: `*`
  - Division: `/`
  - Exponential: `^` or `**`
  - Modulo: `%%`

- **Type Coercion**:
  - `as.character()`: Convert to character
  - `as.integer()`: Convert to integer
  - `as.logical()`: Convert to logical
  - `as.numeric()`: Convert to numeric
  - `as.list()`: Convert to list

- **Type Testing**:
  - `is.character()`: Check if character
  - `is.numeric()`: Check if numeric
  - `is.complex()`: Check if complex

## Special Values

- `NA`: Not Available (undefined)
- `NaN`: Not a Number (undefined result)
- Functions:
  - `is.na()`: Check for NA
  - `is.nan()`: Check for NaN

## Note on R's Type System

R is a dynamically typed language, meaning variable types are determined at runtime and can change. This is in contrast to statically typed languages like Java.

# Import/Export Best Practices
- Check data structure before and after import using `str()`.
- Use `header = TRUE` in `read.table()` when the first row contains variable names.
- Use appropriate delimiters when importing/exporting data.

