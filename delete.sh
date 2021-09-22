#!/bin/bash
echo $(curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.)'
