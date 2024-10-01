# Block 1: Introduction to Data Science
> [Mohamed Alderazi]: I do not believe that the entirety of this Block is important to go over since all it essentially does is set you up for the rest of the module's content.
## What Is Data?
Data is defined as a set of values of subjects with respect to qualitative or quantitative variables. Data can take various forms, such as:
- Vectors or matrices
- Tensors (high-order matrices)
- Images or text

## What Is Data Science?
Data science is the application of computational and statistical techniques on data to gain insights into real-world problems. It involves:
- Data collection
- Data processing
- Statistical inference
- Machine learning
- Data visualization

**Data Science is Not:**
- **Just Machine Learning:** Data science also includes data collection, defining the problem, interpreting results, and deciding on actions.
- **Just Statistics:** Unlike statistics, data science is practical and involves topics like data scraping and processing, often associated with computer science.
- **Just Data or Big Data:** It goes beyond collecting and managing data to include analysis, inference, and visualization.

### Data vs. Information
- **Data:** Raw, unorganized facts that need to be processed and are unusable until organized.
- **Information:** Created when data is processed, organized, and structured to become useful in a specific context.

## Examples of Data Science Tasks
1. **Email Spam Detection:** Analyzing word frequencies in emails to design a spam filter.
2. **Real Estate Analysis:** Identifying neighborhood characteristics that drive house prices.
3. **Handwritten Digit Recognition:** Identifying numbers in digitized images using machine learning.

## Computer Programming and Data Science
Programming is essential for data science tasks such as data collection, processing, visualization, and applying algorithms. In this course, we focus on R and Python, both of which are open-source programming languages with powerful ecosystems tailored for data science.

## Tools for Programming in Data Science
- **IDEs (Integrated Development Environments):** Facilitate coding and software development. Examples include RStudio and Spyder.
- **Version Control:** Managed via Git to track changes, branch out work, and collaborate on projects.
- **GitHub:** A code hosting platform that supports version control and collaboration.

## Interacting With R
1. **Assignment Operator:** Use `<-` to assign values, e.g., `a <- 5`.
2. **Methods of Using R:**
   - **Terminal:** Basic command-line interface for typing and executing R commands.
   - **Default R GUI:** Built-in interface with an editor, graphics, and command history.
   - **RStudio:** An IDE with a four-pane interface for creating scripts, typing commands, managing objects, and viewing plots.
3. **Working Directory:** Use `setwd()` to set the working directory and `getwd()` to retrieve the current directory.
4. **Installing Packages:** Install packages using `install.packages("packageName")`.
5. **Getting Help:** Use `help(functionName)` or `?functionName` to access documentation.

## R Markdown and R Notebooks
- **Markdown:** A lightweight markup language to add formatting to plain text documents.
- **R Markdown:** Combines text, code, and results in a single document, allowing for easy conversion to various formats (e.g., HTML, PDF).
- **R Notebooks:** Interactive documents allowing code chunks to be executed independently, showing the output immediately beneath each chunk.

## Working With Python
1. **Setup:** Install Anaconda, which includes Python and data science tools like pandas and Jupyter Notebook.
2. **Python Environments:**
   - **QtConsole:** Provides an interactive Python session.
   - **Spyder:** An IDE with an editor, console, and variable explorer for scientific computing.
   - **Jupyter Notebooks:** Web-based application integrating code, visualizations, and text into a single document.
3. **Writing Python Scripts:** Scripts are text files ending with `.py`. Example:
   ```python
   print('Hello, Python')
   ```
---
# Version Control

## What is Git?
Git is a distributed version control system used to track changes in files, support collaboration, and manage project development. GitHub is a platform for hosting Git repositories and facilitating collaborative work.

## Basic Git Concepts
- **Repository:** A storage for project files and their entire history.
- **Commit:** A snapshot of changes in the repository at a specific point in time.
- **Branch:** A parallel line of development. The default branch is usually called `master` or `main`.
- **Staging Area:** Where files are placed before committing.

## Common Git Commands
- **Initialize a Repository:** Create a new Git repository in the current directory.
    ```bash
    git init
    ```
- **Check Status:** View changes to files in the working directory.
    ```bash
    git status
    ```
- **Staging:** Add changes to the staging area.
    ```bash
    git add filename
    git add .
    ```
- **Committing:** Save changes in the repository with a message describing the change.
    ```bash
    git commit -m "Commit message"
    ```
- **Viewing Commit History:** Display a log of commits made in the repository.
    ```bash
    git log
    ```
- **Branching:** Create a new branch to work on a different version of the project.
    ```bash
    git branch branchName
    ```
- **Switching Branches:** Switch to another branch.
    ```bash
    git checkout branchName
    ```
- **Merging:** Combine changes from one branch into another (e.g., merging `branchName` into `master`).
    ```bash
    git merge branchName
    ```
- **Pushing to Remote Repository:** Upload local repository content to a remote repository, such as GitHub.
    ```bash
    git push origin branchName
    ```
- **Cloning:** Create a local copy of a remote repository.
    ```bash
    git clone https://github.com/username/repository.git
    ```
- **Pulling:** Update the local repository with changes from the remote repository.
    ```bash
    git pull origin branchName
    ```

## Git Best Practices
- **Commit Often:** Make frequent commits with descriptive messages to track changes effectively.
- **Use Branches:** Isolate new features or bug fixes in separate branches before merging them into the main codebase.
- **Pull Before Push:** Always pull the latest changes from the remote repository before pushing your work to avoid conflicts.
