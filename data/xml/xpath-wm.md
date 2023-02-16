# Strategy

- input is list of rules, each rule having
  - an ID
  - an xpath expression
  - a remedy
  - a severity
- list of active rules can be combined to generate a meta XSLT
  - see: https://stackoverflow.com/questions/19191786/annotating-an-xml-instance-from-a-list-of-xpath-statements-with-xslt
- the XSLT will annotate the source file with failures
  - represented as 
    - node attributes?
    - node children? could then be queried for accounting, and transformed 
    - comments?
  - or as a child array of violations
- The transformed source can then be converted to a visual or text representation



- great if can run directly against SVN (download code, run analysis, output results/report)

# Command Line

```bash
# xpath options
#   -p text   prepends text to the match (can be used to later grep
#
# grep options:
#   -n     shows line numbers
#   -A 1   show 1 subsequent line of context
xpath -q -p "RULE_VIOLATION: " -e "(//SEQUENCE|//LOOP|//REPEAT)/COMMENT[not(text())]/parent::*" AN_BADP_CRM_MasterData/ns/an/badp_crm_masterdata/mercury/pub/services/mapPODData/flow.xml | grep -n -A 1 RULE_VIOLATION
```





# Rule Definition

```bash
#
id: "disallowed-service-pipeline"

# XPath
# =====
xpath: "..."

# Type
# ====
# - bug
# - smell
# - security
# - vulnerability
category: code_smell

# Severity
# ========
# - blocker
# - critical
# - major
# - minor
severity: (ERROR|WARN)

#
description_one_line:

description_full: |
  |
  |
  
remedy: "Remove calls to save/restore/trace pipeline"

# Context
# =======
# Number of lines of additional context to include
context: 0
```



# Rules

## Flow Service Metrics

```bash
# Non-Map Steps (TODO - not sure this works...)
(//MAP | //INVOKE | //SEQUENCE | //RETRY)[$maxStepCount]
- or -
count(//SEQUENCE|//LOOP|//REPEAT|//INVOKE|//BRANCH|//EXIT)

# Map Steps
# TODO

# Complexity
# - Definition: number of branch children + (number of boolean operators*2)
# - count(tokenize(., '&&'))
# - count(tokenize(., '||'))
# - TODO - include: other sources of conditional flow
# - TODO - include: conditional maps
# Branch children (not including COMMENT tags)
# why the +1 ?
count(//BRANCH/*[not(self::COMMENT)])+1

```

# 

## Flow Service Rules

```bash
# (OK) Disallowed Services - Pipeline
//INVOKE[contains(@SERVICE, 'pub.flow:savePipeline')]
//INVOKE[contains(@SERVICE, 'pub.flow:savePipelineToFile')]
//INVOKE[contains(@SERVICE, 'pub.flow:restorePipeline')]
//INVOKE[contains(@SERVICE, 'pub.flow:restorePipelineFromFile')]
//INVOKE[contains(@SERVICE, 'pub.flow:tracePipeline')]

# Disallowed Services - WmRoot
# TODO


# Disallowed Services - WmPublic
# TODO pub.jms:send - code should never call this directly



# (OK) Debug Log without setting 'Level'
//INVOKE[@SERVICE='pub.flow:debugLog'][not(MAP/MAPSET[starts-with(@FIELD, '/level;')])]

# (OK) Debug Log without setting 'Facility'
//INVOKE[@SERVICE='pub.flow:debugLog'][not(MAP/MAPSET[starts-with(@FIELD, '/facility;')])]

# (OK) Disabled Step
//*[lower-case(@DISABLED)="true"]

# (OK) Uncommented Block
(//SEQUENCE|//BRANCH|//LOOP|//REPEAT)/COMMENT[not(text())]/parent::*
or
(//SEQUENCE|//BRANCH|//LOOP|//REPEAT)[not(COMMENT/text())]

# (OK) Branch with no children 
# NOTE: COMMENT is an xml child node and is always there, so must exclude
//BRANCH[count(*[not(name()='COMMENT')]) = 0]

# Hardcoded partner name in Framework package
# Need to create separate set of rules that are only run on framework pkgs
# TODO look for existence of "EXT_" or "AN_" in 
# @NAME is where label values are stored
//*[contains(@NAME, 'EXT_')]
//*[contains(@NAME, 'AN_')]
or
//*[contains(@NAME, 'EXT_') or contains(@NAME, 'AN_')]


# (Possible) improper usage of "Environment" Global Variable. Service logic must not branch or behave differently based on value of %Environment% variable. 
//MAPSET[lower-case(@GLOBALVARIABLES='true')]//value[contains(text(), '%Environment%')]
# TODO - also check for BRANCH children with label names containing "UAT" or "PROD"



# Disallowed Dependency
# TODO - identify references to other packages that are not part of framework
# create list of framework package prefixes (oh_runtime_* etc)
# also pass in own package prefix as param
# if invoke reference doesn't contain any of those prefixes then it is an
# invalid dependency reference to another package
//INVOKE[not(starts-with(@SERVICE, '...') or starts-with(@SERVICE, '...') or starts-with(@SERVICE, '...'))]









# Empty try-catch
TODO





# Hardcoded queue names
# TODO look for queue name pattern in code.


# 


# Hardcoded hostname
# TODO look for "hwuu" or "amdvn" prefix in code (case insensitive)

# Hardcoded IP address
# TODO look for [0-255].[0-255].[0-255].[0-255]

# Hardcoded file path
# TODO look for "//[a-zA-Z]/" (consider alternative file path separators)






# Environment branch
BRANCH %Environment%
TODO - recognize branch on global var environment value
TODO - identify code with words like "prod", "sit", "dev"







```



## Node NDF Rules

```bash

# Uncommented Service
# TODO

# Uncommented Service Input or Output
# TODO


```



## JMS Trigger Rules

```bash
# JMS Trigger Disabled
//Values/record[@name="trigger"]/Boolean[@name="enabled" and text() = 'false']

# JMS Trigger Auto-Acknowledge
//Values/record[@name="trigger"]/value[@name="acknowledgeMode" and text() = '1']

# JMS Trigger too many processing threads 
//Values/record[@name="trigger"]/value[@name="maxConcurrentThreads" and text() > 5]

# JMS Trigger Serial
//Values/record[@name="trigger"]/value[@name="concurrent" and text()='false']

# JMS Trigger Ordering
//Values/record[@name="trigger"]/value[@name="ordering" and not(text()='0')]
```



JDBC Adapter Service Rules

```bash
# Table name must start with dbo
# TODO


```



## Configuration Rules

```bash
# Clear-text Password
# TODO

# 
```



# Reference

## Flow Service XML

### SEQUENCE

```xml
<SEQUENCE NAME="$null" TIMEOUT="" EXIT-ON="FAILURE">
  <COMMENT></COMMENT>
  ...
</SEQUENCE
```

### BRANCH

```xml
<BRANCH TIMEOUT="" SWITCH="/flag">
...
</BRANCH>
```



### INVOKE

```xml
<INVOKE TIMEOUT="" SERVICE="pub.xml:xmlNodeToDocument" VALIDATE-IN="$none" VALIDATE-OUT="$none">
  <MAP>
    ...
    <MAPSET NAME="Setter" OVERWRITE="true" VARIABLES="false" GLOBALVARIABLES="false" FIELD="/preserve;1;1">
    </MAPSET>
  </MAP>
</INVOKE>
```

### TRANSFORMER

```bash
```

### LOOP

```xml
<LOOP TIMEOUT="" IN-ARRAY="/mercuryPOD/SalesOrderpackingSlip/Items/Item" OUT-ARRAY="/PODDataCRM/items">
...
</LOOP>
```

### MAP

```xml
<MAP TIMEOUT="" MODE="STANDALONE">
  <COMMENT></COMMENT>
  <MAPTARGET>

<Values version="2.0">
  <record name="xml" javaclass="com.wm.util.Values">
    <value name="node_type">record</value>
    <value name="is_public">false</value>
    <value name="field_type">record</value>
    <value name="field_dim">0</value>
    <value name="nillable">true</value>
    <value name="form_qualified">false</value>
    <value name="is_global">false</value>
    <array name="rec_fields" type="record" depth="1">
      <record javaclass="com.wm.util.Values">
        <value name="node_type">record</value>
        <value name="is_public">false</value>
        <value name="field_name">mercuryPOD</value>
        <value name="field_type">recref</value>
        <value name="field_dim">0</value>
        <value name="nillable">true</value>
        <value name="form_qualified">false</value>
        <value name="is_global">false</value>
        <value name="modifiable">true</value>
        <value name="rec_ref">an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD</value>
      </record>
      <record javaclass="com.wm.util.Values">
        <value name="node_type">record</value>
        <value name="is_public">false</value>
        <value name="field_name">PODDataCRM</value>
        <value name="field_type">recref</value>
        <value name="field_dim">0</value>
        <value name="nillable">true</value>
        <value name="form_qualified">false</value>
        <value name="is_global">false</value>
        <value name="modifiable">true</value>
        <value name="rec_ref">an.badp_crm_masterdata.crm.priv.documents:PODDataCRM</value>
      </record>
    </array>
    <value name="modifiable">true</value>
  </record>
</Values>
</MAPTARGET>
  <MAPSOURCE>

<Values version="2.0">
  <record name="xml" javaclass="com.wm.util.Values">
    <value name="node_type">record</value>
    <value name="is_public">false</value>
    <value name="field_type">record</value>
    <value name="field_dim">0</value>
    <value name="nillable">true</value>
    <value name="form_qualified">false</value>
    <value name="is_global">false</value>
    <array name="rec_fields" type="record" depth="1">
      <record javaclass="com.wm.util.Values">
        <value name="node_type">record</value>
        <value name="is_public">false</value>
        <value name="field_name">mercuryPOD</value>
        <value name="field_type">recref</value>
        <value name="field_dim">0</value>
        <value name="nillable">true</value>
        <value name="form_qualified">false</value>
        <value name="is_global">false</value>
        <value name="modifiable">true</value>
        <value name="rec_ref">an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD</value>
      </record>
      <record javaclass="com.wm.util.Values">
        <value name="node_type">record</value>
        <value name="is_public">false</value>
        <value name="field_name">PODDataCRM</value>
        <value name="field_type">recref</value>
        <value name="field_dim">0</value>
        <value name="nillable">true</value>
        <value name="form_qualified">false</value>
        <value name="is_global">false</value>
        <value name="modifiable">true</value>
        <value name="rec_ref">an.badp_crm_masterdata.crm.priv.documents:PODDataCRM</value>
      </record>
      <record javaclass="com.wm.util.Values">
        <value name="node_type">unknown</value>
        <value name="is_public">false</value>
        <value name="field_name">$iteration</value>
        <value name="field_type">string</value>
        <value name="field_dim">0</value>
        <value name="nillable">true</value>
        <value name="form_qualified">false</value>
        <value name="is_global">false</value>
      </record>
    </array>
    <value name="modifiable">true</value>
  </record>
</Values>
</MAPSOURCE>

  <!-- nodes -->

<MAPCOPY FROM="/mercuryPOD;4;0;an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD/SalesOrderpackingSlip;2;0/Items;2;0/Item;2;0/ItemName;1;0" TO="/PODDataCRM;4;0;an.badp_crm_masterdata.crm.priv.documents:PODDataCRM/items;2;0/description;1;0">
</MAPCOPY>

<MAPCOPY FROM="/mercuryPOD;4;0;an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD/SalesOrderpackingSlip;2;0/Items;2;0/Item;2;0/Quantity;1;0" TO="/PODDataCRM;4;0;an.badp_crm_masterdata.crm.priv.documents:PODDataCRM/items;2;0/quantity;3.7;0">
</MAPCOPY>

<MAPCOPY FROM="/mercuryPOD;4;0;an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD/SalesOrderpackingSlip;2;0/Items;2;0/Item;2;0/ItemId;1;0" TO="/PODDataCRM;4;0;an.badp_crm_masterdata.crm.priv.documents:PODDataCRM/items;2;0/item_number;1;0">
</MAPCOPY>

<MAPCOPY FROM="/mercuryPOD;4;0;an.badp_crm_masterdata.mercury.priv.documents:mercuryPOD/SalesOrderpackingSlip;2;0/Items;2;0/Item;2;0/Remain;1;0" TO="/PODDataCRM;4;0;an.badp_crm_masterdata.crm.priv.documents:PODDataCRM/items;2;0/remain;1;0">
</MAPCOPY>
</MAP>



# Conditional Map
```

### REPEAT

```bash
```

### EXIT

```xml
<EXIT FROM="$flow" SIGNAL="FAILURE" FAILURE-MESSAGE="%lastError/error%">
  <COMMENT></COMMENT>
</EXIT>
```





## Trigger XML

```bash
<Values version="2.0">
  <value name="node_type">webMethods/trigger</value>
  <value name="node_nsName">oh.runtime.priv.triggers.AAC.IN:AN_OH_B2B_AAC_LSPQ</value>
  <value name="node_pkg">OH_Runtime</value>
  <value name="node_comment"></value>
  <value name="is_public">false</value>
  <value name="trigger_type">jms-trigger</value>
  <record name="trigger" javaclass="com.wm.util.Values">
    <value name="serialSuspendOnError">false</value>
    <value name="concurrent">true</value>
    <value name="ordering">0</value>
    <value name="auditOption">0</value>
    <record name="auditSettings" javaclass="com.wm.util.Values">
      <value name="document_data">0</value>
      <value name="startExecution">false</value>
      <value name="stopExecution">false</value>
      <value name="onError">true</value>
    </record>
    <record name="redeliveryOptions" javaclass="com.wm.util.Values">
      <value name="max">0</value>
      <value name="delayInterval">10000</value>
      <value name="onRedeliveryFailure">0</value>
    </record>
    <value name="joinTimeout">86400000</value>
    <value name="maxConcurrentThreads">5</value>
    <value name="inDoubtDetection">true</value>
    <value name="resolveWithHistory">true</value>
    <value name="resolutionHistoryTTL">14400000</value>
    <value name="uniqueId">/emkKVMqk65aOQvozT0feHpElEo=</value>
    <value name="aliasName">NirvanaJmsConnection</value>
    <number name="jmsTriggerType" type="Integer">0</number>
    <Boolean name="enabled">true</Boolean>
    <value name="prefetchSize">10</value>
    <value name="connectionCount">1</value>
    <value name="inactiveWaitTime">1500</value>
    <value name="batchSize">1</value>
    <value name="acknowledgeMode">2</value>
    <value name="includeOriginalMessage">false</value>
    <value name="joinType">3</value>
    <value name="executeUser">Administrator</value>
    <array name="routingRules" type="record" depth="1">
      <record javaclass="com.wm.util.Values">
        <value name="ruleName">Rule1</value>
        <value name="serviceName">oh.runtime.pub.services:processQueue</value>
        <value name="filter"></value>
      </record>
    </array>
    <array name="destinations" type="record" depth="1">
      <record javaclass="com.wm.util.Values">
        <value name="destination">AN/OH/B2B/AAC/IN/LSPQ</value>
        <null name="messageSelector"/>
        <number name="destinationType" type="Integer">0</number>
      </record>
    </array>
  </record>
</Values>

```



## Node NDF

```bash
```



## Adapter Service

```bash
```



# XSLT

## sample rules file

```xml
<rules>

<rule name="Disallowed Service - Pipeline" location="//INVOKE[contains(@SERVICE, 'pub.flow:savePipeline')]" severity="1">
<description>
Code which saves and restores pipelines should not remain in production code. Saving and restoring of pipelines should be done only by a central IS or framework function
</description>
</rule>

<rule name="Disabled Step" location="//*[@DISABLED='true']" severity="2">
<description>
Code should not contain any disabled steps
</description>
</rule>

<rule name="Non-commented Block" location="(//SEQUENCE|//BRANCH|//LOOP|//REPEAT)[not(COMMENT/text())]" severity="3">
<description>
Blocks are collapsed by default in Designer. In order to remain readable, all blocks should be commented summarizing the function performed within, in order to remain readable when collapsed.
</description>
</rule>

<rule name="Branch with no children" location="//BRANCH[count(*[not(name()='COMMENT')]) = 0]" severity="4">
<description>
Branches only exist to determine the flow of control between multiple children. a Branch with no children is invalid.
</description>
</rule>

</rules>
```



## meta XSLT

Transforms rules file into another XSLT which can then be used to transform/annotate the actual source file

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/rules">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">1.0</xsl:attribute>
      <xsl:element name="xsl:output">
        <xsl:attribute name="method">xml</xsl:attribute>
        <xsl:attribute name="indent">yes</xsl:attribute>
      </xsl:element>
      <xsl:call-template name="gen_identity_template"/>
      <xsl:apply-templates select="rule"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="gen_identity_template">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">node()|@*</xsl:attribute>
      <xsl:element name="xsl:copy">
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select">node()|@*</xsl:attribute>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="rule">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">
        <xsl:value-of select="@location"/>
      </xsl:attribute>
      <xsl:element name="xsl:comment">
        <xsl:text>Rule Violation.</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>, </xsl:text>
        <xsl:text>Severity: </xsl:text>
        <xsl:value-of select="@severity"/>
        <xsl:text>. Description: </xsl:text>
        <xsl:value-of select="description"/>
      </xsl:element>
      <xsl:element name="xsl:text">
        <xsl:text disable-output-escaping="yes">&amp;#xa;</xsl:text>
      </xsl:element>
      <xsl:element name="xsl:copy">
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select">node()|@*</xsl:attribute>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
```







