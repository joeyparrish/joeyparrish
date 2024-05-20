#!/bin/bash

set -e
set -x

cd $(dirname "$0")

bundle install
bundle exec jekyll serve
