



grafana sqlite datasource plugin

```bash
# grafana unit file needs this to access dbs in /var, /tmp

[Service]
PrivateTmp=false
```





# Record.csv

- By far this dataset is where most apple health data is stored

```bash
# fields
- creationDate: "2015-01-17T11:50:13+02:00"
- startDate: "2014-01-03T11:42:02+02:00"
- endDate: "2014-01-03T11:42:02+02:00"

- device: ""
- sourceName: "Health Mate"
- sourceVersion: ""

- type: "HKQuantityTypeIdentifierBodyMassIndex"
- value: 26.6503
- unit: "count"


# sqlite schema
CREATE TABLE IF NOT EXISTS record (
  creationDate           TEXT,
  startDate              TEXT,
  endDate                TEXT,
  device                 TEXT,
  sourceName             TEXT,
  sourceVersion          TEXT,
  type                   TEXT,
  value                  REAL,
  unit                   TEXT
);




main values for field 'type':
- HKQuantityTypeIdentifierStepCount
- HKQuantityTypeIdentifierHeartRate
- HKQuantityTypeIdentifierRestingHeartRate
- HKQuantityTypeIdentifierDistanceWalkingRunning
- HKQuantityTypeIdentifierWalkingHeartRateAverage
- HKQuantityTypeIdentifierHeartRateVariabilitySDNN
- HKQuantityTypeIdentifierBodyMass
- HKQuantityTypeIdentifierBasalEnergyBurned
- HKQuantityTypeIdentifierActiveEnergyBurned
- HKQuantityTypeIdentifierHeadphoneAudioExposure
- HKQuantityTypeIdentifierVO2Max
- HKCategoryTypeIdentifierSleepAnalysis




all values for fields 'type':
567194 HKQuantityTypeIdentifierActiveEnergyBurned
404723 HKQuantityTypeIdentifierStepCount
246728 HKQuantityTypeIdentifierHeartRate
192547 HKQuantityTypeIdentifierDistanceWalkingRunning
171210 HKQuantityTypeIdentifierBasalEnergyBurned
 50335 HKQuantityTypeIdentifierAppleStandTime
 31089 HKQuantityTypeIdentifierAppleExerciseTime
 30465 HKQuantityTypeIdentifierFlightsClimbed
 29732 HKQuantityTypeIdentifierEnvironmentalAudioExposure
 15258 HKCategoryTypeIdentifierAppleStandHour
  7650 HKQuantityTypeIdentifierWalkingStepLength
  7650 HKQuantityTypeIdentifierWalkingSpeed
  5007 HKQuantityTypeIdentifierHeartRateVariabilitySDNN
  3806 HKQuantityTypeIdentifierWalkingDoubleSupportPercentage
  2428 HKQuantityTypeIdentifierStairAscentSpeed
  2169 HKCategoryTypeIdentifierSleepAnalysis
  1446 HKQuantityTypeIdentifierStairDescentSpeed
  1357 HKQuantityTypeIdentifierBodyMassIndex
  1357 HKQuantityTypeIdentifierBodyMass
  1101 HKQuantityTypeIdentifierBodyFatPercentage
  1024 HKQuantityTypeIdentifierWalkingAsymmetryPercentage
   868 HKQuantityTypeIdentifierRestingHeartRate
   711 HKQuantityTypeIdentifierWalkingHeartRateAverage
   673 HKQuantityTypeIdentifierHeadphoneAudioExposure
   347 HKQuantityTypeIdentifierVO2Max
    61 HKCategoryTypeIdentifierMindfulSession
    47 HKQuantityTypeIdentifierSixMinuteWalkTestDistance
    45 HKQuantityTypeIdentifierBloodPressureSystolic
    45 HKQuantityTypeIdentifierBloodPressureDiastolic
    28 HKQuantityTypeIdentifierAppleWalkingSteadiness
    14 HKQuantityTypeIdentifierDietaryVitaminC
    14 HKQuantityTypeIdentifierDietaryIron
    14 HKQuantityTypeIdentifierDietaryCalcium
    13 HKQuantityTypeIdentifierDietarySugar
    13 HKQuantityTypeIdentifierDietarySodium
    13 HKQuantityTypeIdentifierDietaryProtein
    13 HKQuantityTypeIdentifierDietaryPotassium
    13 HKQuantityTypeIdentifierDietaryFiber
    13 HKQuantityTypeIdentifierDietaryFatTotal
    13 HKQuantityTypeIdentifierDietaryFatSaturated
    13 HKQuantityTypeIdentifierDietaryFatPolyunsaturated
    13 HKQuantityTypeIdentifierDietaryFatMonounsaturated
    13 HKQuantityTypeIdentifierDietaryEnergyConsumed
    13 HKQuantityTypeIdentifierDietaryCholesterol
    13 HKQuantityTypeIdentifierDietaryCarbohydrates
     8 HKQuantityTypeIdentifierDistanceCycling
     4 HKQuantityTypeIdentifierHeight
     1 type
     1 HKQuantityTypeIdentifierWaistCircumference

```



reports

```bash
# heart rate
mlr filter '$type=="HKQuantityTypeIdentifierHeartRate"' then cut -o -f startDate,value,unit

# weight
mlr filter '$type=="HKQuantityTypeIdentifierBodyMass"' then cut -o -f startDate,value,unit

# energy
mlr filter '$type=="HKQuantityTypeIdentifierActiveEnergyBurned"' then cut -o -f startDate,value,unit


```




# Workout.csv

```bash
# fields
- creationDate: "2019-02-18T19:03:50+02:00"
- startDate: "2019-02-18T18:55:29+02:00"
- endDate: "2019-02-18T19:03:50+02:00"

- device: ""
- sourceName: "Fitbod"
- sourceVersion: 3

- workoutActivityType: "HKWorkoutActivityTypeRunning"

- duration: 8.1                       # minutes
- durationUnit: "min"

- totalDistance": 0                   # miles
- totalDistanceUnit: "mi"

- totalEnergyBurned: 42               # calories
- totalEnergyBurnedUnit: "Cal"

# sqlite table schema
-- apple health - workout table
CREATE TABLE IF NOT EXISTS workout (
  creationDate           TEXT,
  startDate              TEXT,
  endDate                TEXT,
  device                 TEXT,
  sourceName             TEXT,
  sourceVersion          TEXT,
  workoutActivityType    TEXT,
  duration               REAL,
  durationUnit           TEXT,
  totalDistance          REAL,
  totalDistanceUnit      TEXT,
  totalEneryBurned       REAL, 
  totalEnergyBurnedUnit  TEXT
);
```



```bash
# running entries
mlr filter '$workoutActivityType=="HKWorkoutActivityTypeRunning"' \
    then cut -o -f startDate,duration,totalDistance,totalEnergyBurned

 444 HKWorkoutActivityTypeRunning
  44 HKWorkoutActivityTypeCrossTraining
  29 HKWorkoutActivityTypeTraditionalStrengthTraining
  24 HKWorkoutActivityTypeWalking
   1 workoutActivityType
   1 HKWorkoutActivityTypeFunctionalStrengthTraining
   1 HKWorkoutActivityTypeCycling
```





average heart rate per run

```sql
with runs as
(select w.startDateSec as time,
    --w.totalDistance as distance,
    --w.duration/w.totalDistance as pace,
    --avg(r.value) as hr, 
    100*((avg(r.value)-140)/40)*(((w.duration/w.totalDistance)-6)/3) as fitness 

from workout w 
join record r 
on w.workoutActivityType="HKWorkoutActivityTypeRunning" 
and r.type="HKQuantityTypeIdentifierHeartRate" 
and w.startDateSec >= $__from / 1000  
and w.startDateSec < $__to / 1000
and r.startDateSec >= w.startDateSec 
and r.endDateSec <= w.endDateSec 
and r.value > 120 group by 1)

select * from runs where fitness > 0
```

