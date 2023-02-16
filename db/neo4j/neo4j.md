



tgf format

```bash

<node-id> <node-name>             # node definition
#                                 # <== demarcates node definitions from edge definitions
<node-id-1> <node-id-2>           # edge definition (directed or undirected)
```



# cypher

create

```bash
#                Node             Relationship  Node
#        -----------------------  -----------   ---- 
# MATCH (:Person { name: "Dan" }) -[:LOVES]->  (whom) RETURN whom
#        ------- ---------------                ----
#         Label     Property                  Variable


# ()              Anonymous node
# (p:Person)      variable p, label Person
# (:Technology)   no variable, label Technology
# 


# create node
CREATE (n:Package {name: ..., mvnid: ..., org: ..., build: ..., version: ...});
CREATE (n:Service {name: ..., package: ..., version: ...});


# create edge
MATCH (a:Package),(b:Package) WHERE a.mvnid = <a-id> AND b.mvnid = <b-id> CREATE (a)-[r: <version?> ]->(b);
CREATE (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
CREATE (svc-a)-[:DEPENDS_ON {version:['1.0.0']}]->(svc-b)

# node - service
CREATE (n:Service {name: ..., package: ..., version: ...});
CREATE (n:Package {name: ..., version: ...});

# edge - service dependency

MATCH (a:Service),(b:Service) WHERE a.name = <svc-a> AND b.name = <svc-b> CREATE (a)-[r: <version?> ]->(b);


# Creating Nodes
# ==============
# Service
CREATE (n:Service {name: ..., package: ..., version: ...});
# n is a variable only relevant name in the query scope

# Package
CREATE (n:Package {name: ..., version: ...});

# Interface
CREATE (n:Interface {name: ..., sender: ..., receiver: ..., doctype: ..., });

# Config
CREATE (n:Config {name: ...);
CREATE (n:GlobVar {name: ...);


# create both nodes and set relationship
# this isn't really useful since - but left here for reference
CREATE (receive7:Service {name:'receive7'})-[:DEPENDS_ON {version:['1.0.0']}]->(receive9:Service {name:'receive9'})

# match existing nodes and set relationship
MATCH (a:Service),(b:Service) WHERE a.name = 'receive7' AND b.name = 'receive9' 
CREATE (a)-[:DEPENDS_ON {version: '1.0.0'}]->(b);
# without the {version:'1.0.0'}, depenencies will keep on adding. but with {version... } it will add once and then hit constraint violations on re-adding




```



## query

```bash
# recursive query to find subtree 
# descendants of a node
MATCH path = (n:Service {name: "receive7"})-[:DEPENDS_ON*]->(child)
RETURN path

# ancestors of a node
MATCH path = (parent:Service {name: "receive7"})<-[:DEPENDS_ON*]-(child)
RETURN path

# union of ancestors and descendants (I think this works... not sure)
MATCH children = (parent:Service {name: "oh.runtime_receive.pub.services:receive"})-[r:INVOKES*]->(child)
RETURN parent, r, child
UNION
MATCH parents = (parent2:Service {name: "oh.runtime_receive.pub.services:receive"})<-[r2:INVOKES*]-(child2)
RETURN parent2 as parent, r2 as r, child2 as child
```



```bash
# csv to cql - nodes
cat service_dependencies2.csv | awk -v FPAT='([^,]*)|("[^"]*")' '{ print "CREATE (:Service { package: \"" $1 "\", package_version: \"1.0.0\", name: \"" $2 "\" }); "}' > create_service_nodes.cql

# csv to cql - relationships
cat service_dependencies2.csv | awk -v FPAT='([^,]*)|("[^"]*")' '{ sub("\r","",$3); print "MATCH (a:Service),(b:Service) WHERE a.name=\"" $2 "\" AND b.name=\"" $3 "\"CREATE (a)-[:INVOKES \{version: \"1.0.0\"\}]->(b); "}' > create_service_relationships.cql

```





# import

cypher

```bash
# tgf -> nodes
cat nodes.tgf | awk -F "[ :]" '{print "CREATE (n:Package {name:'"'"'"$3"'"'"', mvnid:'"'"'"$1"'"'"', org:'"'"'"$2"'"'"', build:'"'"'"$4"'"'"', version:'                   "'"'"$5"'"'"'});" }' > nodes.cypher


# tgf -> edges
cat edges.tgf | awk '{print "MATCH (a:Package),(b:Package) WHERE a.mvnid = '"'"'"$1"'"'"' AND b.mvnid = '"'"'"$2"'"'"' CREATE (a)-[r:"$3"]->(b);"}' > edges.cypher

```









queries

```bash
# show top 250 nodes and edges?
MATCH (n1)-[r]->(n2) RETURN r, n1, n2 LIMIT 250;


```



# settings

```properties
# security
dbms.security.auth_enabled=false            # disable auth
```



# grass

```bash
modifying the style.grass file. Here is how to:

- type ":style" into the Neo4j Browser.
- Save the output in a file with the ending ".grass".
- Edit the file in a text editor (move entries up and down). The entries that are further down are "more important".
- Insert the file back in the Neo4j browser (drag and drop into the Neo4j Browser)

```


