# Supplier Caused Mfg Defects Plan

## Identify Data Sources based requirements request

### int_wip_assembly_completions
* Columns
assembly completions

### src_wip_requirements_operations
* Columns
components making up assembly

### Midas Receiving Inspections
* Columns
Supplier name, Lab Office Code, QMS Code, Folder Notes

### Midas Defect Details
* Columns
Defect Code, Defect Code Meaning, Affected Assembly Level
dt caused by, dd op seq num, dd op desc, created by, creation date
defect qtys

### Midas AR Requests and Tasks
* Columns
count of ARs on part number

## Dimensional Design

### Business Process
Measure supplier-attributed defects against completed assemblies over time to
quantify and trend the supplier defect rate.
### Define Fact table grain
one row per wip job per affected assembly

### Identify Dimensions
dim wip jobs, dim operations and descriptions, dim suppliers, dim commodity
dim item master, dim dates

### Identify Facts
defect qtys, assembly completion qtys, defect counts, ar counts (action requests)

Note: cannot relate a receiving inspection result directly to a wip job.
Relating defect details to a wip job and identify supplier-related defects.

## Data Model

### Report format
| wip job id       | wip job assembly      | affected assembly      | job start scheduled qty      | job actual completed qty      | defect qtys      |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |



## tests
job name, job id
5793862,  7897037