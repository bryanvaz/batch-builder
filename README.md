# Batch Builder 📋🔨

General purpose builder for AWS Batch jobs. Created because sometimes dev laptops don't have enough cores 🏎️🏎️🏎️.

Used in conjuction with AWS Batch or Fargate to automate long-running/manycore build tasks.

## Required input variables

* `S3_SOURCE_BUNDLE`: URL of zipped bundle to start the build
* `ENTRYPOINT`: The filename of the entrypoint job script relative to the root of the source bundle

## Bootstrap process
1. `S3_SOURCE_BUNDLE` is downloaded
2. Source Bundle is unzipped into `/app`
3. The file `${S3_SOURCE_BUNDLE}/${ENTRYPOINT}` is executed

## Included Build Dependancies
* AWS CLI
* Git
* Python 2 & 3 (with extra utils & pip)
* `subversion`
* `build-essential`
* `g++`
* `bash`
* `make`
* `libssl-dev`
* `patch`
* `libncurses5`
* `libncurses5-dev`
* `zlib1g-dev`
* `gawk`
* `flex`
* `gettext`
* `wget`
* `unzip`
* `xz-utils`
* `rsync`
* `curl`
* `bc`
* `time`

## TODO
* Add native support for KMS encrypted environment variables 
* Add multiple versions of dependancies to reduce image size
* Auto-build on new AWS or dependancy versions


## Author
Bryan Vaz - `@bryanvaz`