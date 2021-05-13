#!/bin/bash -eu

## index_local
curl -X POST -d @ingestion/index_local.json http://overlord:8090/druid/indexer/v1/task --header "Content-Type:application/json"

## index_hadoop
curl -X POST -d @ingestion/index_hadoop.json http://overlord:8090/druid/indexer/v1/task --header "Content-Type:application/json"

## worldcup-count query
curl -X POST -d @query/worldcup-count.json http://broker:8082/druid/v2 --header "Content-Type:application/json"

## wikipedia-count query
curl -X POST -d @query/wikipedia-count.json http://broker:8082/druid/v2 --header "Content-Type:application/json"
