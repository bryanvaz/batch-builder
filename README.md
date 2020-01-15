# Batch Builder 📋🔨

General purpose builder for AWS Batch jobs. Created because sometimes dev laptops don't have enough cores 🏎️🏎️🏎️.

Used in conjuction with AWS Batch or Fargate to automate long-running/manycore build tasks.

## Required input variables

* `SOURCE_BUNDLE` (*required): URL of zipped bundle to start the build
* `ENTRYPOINT` (default: `entrypoint.sh`): The filename of the entrypoint job script relative to the root of the source bundle

## Bootstrap process
1. `SOURCE_BUNDLE` is downloaded
2. Source Bundle is unzipped into `/app`
3. The file `${SOURCE_BUNDLE}/${ENTRYPOINT}` is executed

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
* Add support for other zip/tar types


## Author
Bryan Vaz - `@bryanvaz`