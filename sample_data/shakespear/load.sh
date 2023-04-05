#es sample data load

echo "Elastic IP Format Example: 172.18.3.51:9200"
read -p "Enter IP : " esip
export es=$esip

curl -XPUT "$es/shakespeare" -H 'Content-Type: application/json' -d'
{
 "mappings" : {
   "properties" : {
    "speaker" : {"type": "text"},
    "play_name" : {"type": "text"},
    "line_id" : { "type" : "integer"},
    "speech_number" : { "type" : "integer" }
   }
 }
}
'

curl -XPUT "$es/logstash-2015.05.18" -H 'Content-Type: application/json' -d'
{
  "mappings": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
  }
}
'

curl -XPUT "$es/logstash-2015.05.19" -H 'Content-Type: application/json' -d'
{
  "mappings": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
  }
}
'

curl -XPUT "$es/logstash-2015.05.20" -H 'Content-Type: application/json' -d'
{
  "mappings": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
  }
}
'


#curl -H 'Content-Type: application/x-ndjson' -XPOST "$es/_bulk?pretty" --data-binary @accounts.json
#curl -H 'Content-Type: application/x-ndjson' -XPOST "$es/shakespeare/_bulk?pretty" --data-binary @shakespeare.json
#curl -H 'Content-Type: application/x-ndjson' -XPOST "$es/_bulk?pretty" --data-binary @logs.json
# curl -XGET /_sql/translate
# {
#   "query": "SELECT max(score) FROM test"
# }


# curl -XPOST "$es/test_index/_search" -H 'Content-Type: application/json' -d'
# {
#   "query": {
#     "match": {
#       "title": "Elasticsearch"
#     }
#   }
# }'


# curl -XGET "$es/_sql/translate" -H 'Content-Type: application/json' -d'
# {
#   "query": "SELECT * FROM test_index"
# }'