



# Charts ideas:

- Errors per component
- eg. see https://vega.github.io/vega-lite/examples/circle_natural_disasters.html

- Volume per scenario, or
- Cumulative size per scenario
- https://vega.github.io/vega-lite/examples/stacked_area_stream.html


- GC scatterplot +
- pie or bar breakdown full GC causes, vs minor vs free time 
- https://vega.github.io/vega-lite/examples/interactive_seattle_weather.html


# Debugging from console

## View data as table

   console.table(VEGA_DEBUG.view.data('edges')) 


## View state of a signal

    VEGA_DEBUG.view.signal('height')


## View scale internal values with 

```javascript
VEGA_DEBUG.view._runtime.scales.y
```



# Special variables

  - context (filter, etc)
  - timefield: name of field in this index which represents the timestamp
  - timefilter: 
  - autointerval: 
  - 


# Query ES Data


## Aggregation

```json
{
  $schema: https://vega.github.io/schema/vega-lite/v2.json
  title: Event count

  // Define the data source
  data: {
    url: {
      %context%: true
      %timefield%: Timestamp
      index: tn-bizdoc-*
      // Aggregate data by the time field into time buckets, counting the number of documents in each bucket.
      body: {
        aggs: {
          time_buckets: {
            date_histogram: {
              field: Timestamp
              interval: {%autointerval%: true}
              extended_bounds: {
                // Use the current time range's start and end
                min: {%timefilter%: "min"}
                max: {%timefilter%: "max"}
              }
              // Use this for linear (e.g. line, area) graphs.  Without it, empty buckets will not show up
              min_doc_count: 0
            }
          }
        }

        // Speed up the response by only including only aggregation results, and no individual documents
        size: 0
      }
    }
```


## Individual docs
(eg. for scatter plots)



## Scatter Plot


{
  "$schema": "https://vega.github.io/schema/vega/v4.json",
  "padding": 5,



  "data": [
    {
      "name": "source",
      "url": "https://vega.github.io/vega/data/cars.json",
      "transform": [
        {
          "type": "filter",
          "expr": "datum['Horsepower'] != null && datum['Miles_per_Gallon'] != null && datum['Acceleration'] != null"
        }
      ]
    },
    {
      name: "docs",  
      url: {
        %context%: true
        %timefield%: Timestamp
        index: tn-bizdoc-*
        body: {
          _source: [
            "Timestamp", 
            "Sender", 
            "Receiver", 
            "DocumentType", 
            "SystemStatus", 
            "UserStatus", 
            "Attributes.Priority", 
            "Attributes.Scenario", 
            "Attributes.ProcessingTime", 
            "Attributes.DeliveryTime", 
            "Attributes.TotalTime"
          ] 
          size: 10000
        }
      }
      format: { property: "hits.hits" }
      transform: [
        {
          type: "formula"
          expr: "toDate(datum._source.Timestamp)"
          as: "time"
        }
      ]
    }
    {
      "name": "selected",
      "on": [
        {"trigger": "clear", "remove": true},
        {"trigger": "!shift", "remove": true},
        {"trigger": "!shift && clicked", "insert": "clicked"},
        {"trigger": "shift && clicked", "toggle": "clicked"}
      ]
    }    
  ],

  

  

  signals: [
    {
      "name": "clear", "value": true,
      "on": [
        {
          "events": "mouseup[!event.item]",
          "update": "true",
          "force": true
        }
      ]
    },
    {
      "name": "shift", "value": false,
      "on": [
        {
          "events": "@legendSymbol:click, @legend_scenario_label:click",
          "update": "event.shiftKey",
          "force":  true
        }
      ]
    },
    {
      "name": "clicked", "value": null,
      "on": [
        {
          "events": "@legendSymbol:click, @legend_scenario_label:click",
          "update": "{value: datum.value}",
          "force":  true
        }
      ]
    }
  ]





  "scales": [
/*    {
      "name": "x",
      "type": "linear",
      "round": true,
      "nice": true,
      "zero": true,
      "domain": {"data": "source", "field": "Horsepower"},
      "range": "width"
    },
    {
      "name": "y",
      "type": "linear",
      "round": true,
      "nice": true,
      "zero": true,
      "domain": {"data": "source", "field": "Miles_per_Gallon"},
      "range": "height"
    },*/
    {
      "name": "size",
      "type": "linear",
      "round": true,
      "nice": false,
      "zero": true,
      "domain": {"data": "source", "field": "Acceleration"},
      "range": [4,361]
    }
    {
      "name": "xdoc",
      "type": "time",
      "round": true,
      "nice": true,
      "zero": false,
/*      "nice": "day"*/
      "domain": {"data": "docs", "field": "time"},
      "range": "width"

    }
    {
      "name": "ydoc",
      "type": "log",
      "base": 20
/*      "type": "pow"
      "exponent": .005 */
      "round": true,
      "nice": false,
      "zero": false,
      "domain": {"data": "docs", "field": "_source.Attributes.TotalTime"},
      "range": "height"
    },
    {
      name: "priority_size_scale"
      type: "ordinal",
      domain: { data: "docs", field: "_source.Attributes.Priority", sort: true }
      range: [ 500, 100, 10]
    }
    {
      name: "scenario_color_scale"
      type: "ordinal",
      domain: { data: "docs", field: "_source.Attributes.Scenario" }
      range: { scheme: "dark2" }
    }    
  ],





  "axes": [
    {
      "scale": "xdoc",
      "grid": false,
      "domain": true,
      "orient": "bottom",
      "format": "%Y %B %d %I:%M:%S"
    },
    {
      scale: "ydoc"
      grid: true
      domain: true
      orient: "left"
      tickCount: 20
      tickBand: "extent"
      titlePadding: 5
      title": "Total Time"
/*      format: "%a"
      formatType: "time"
      timeUnit: "milliseconds"*/
    }
  ],




  "legends": [
    {
      size: "priority_size_scale"
      title: "Priority",
      format: ".1",
      symbolStrokeWidth: 2
      symbolOpacity: 0.9
      symbolType: "circle"
    }
    {
      fill: "scenario_color_scale"
      title: "Scenario",
      symbolStrokeWidth: 2
      symbolType: "circle"
      encode: {
        labels: {
          name: "legend_scenario_label"
          interactive: true,
          update: {
            "opacity": [
              {"test": "!length(data('selected')) || indata('selected', 'value', datum.value)", "value": 1},
              {"value": 0.25}
            ]          
          }
        }
      }
    }    
  ]



  "marks": [
    {
      "name": "marks2",
      "type": "symbol",
      "from": {"data": "docs"},
      "encode": {
        "enter": {

        }
        "update": {
         "tooltip": {
            "signal": "{title: datum._source.Sender + ' | ' + datum._source.Receiver + ' | ' + datum._source.DocumentType, Priority: datum._source.Attributes.Priority, Scenario: datum._source.Attributes.Scenario, Status: datum._source.SystemStatus + ' ' + datum._source.UserStatus, Processing: datum._source.Attributes.ProcessingTime, Delivery: datum._source.Attributes.DeliveryTime, Total: datum._source.Attributes.TotalTime }"
          }        
          "x": { 
            "scale": "xdoc", 
            "field": "time", 
            "type": "temporal",
          },
          "y": { 
            "scale": "ydoc", 
            "field": "_source.Attributes.TotalTime", 
            "type": "quantitative"
          },
          "size": { "scale": "priority_size_scale", field: "_source.Attributes.Priority" },
          "shape": {"value": "circle"},
          "strokeWidth": {"value": 3},
          "opacity": [
            {"test": "(!length(data('selected')) || indata('selected', 'value', datum._source.Attributes.Scenario))", "value": 0.7 },
            {"value": 0.15}
          ],
          "stroke": [
            {"test": "(!length(data('selected')) || indata('selected', 'value', datum._source.Attributes.Scenario))", "scale": "scenario_color_scale", "field": "_source.Attributes.Scenario"},
            {"value": "#ccc"}
          ],

/*          
          "opacity": {"value": 0.5},
          "stroke": {"scale": "scenario_color_scale", "field": "_source.Attributes.Scenario"},
*/
          "fill": {"value": "transparent"}
        },
        hover: {
          text: { value: "hi" }
          stroke: { value: "red" }
          fill: { value: "red" }
          opacity: 1
          zindex: { value: 20000 }
        }
      }
    }    
  ]
}

