### ScoscheViewController
Below is a list of data that can be used in any ScoscheView Controller Simply by passing in `monitor: ScoscheMonitor = chosen sensor`. Monitor is a shared object and can be set internally or globally as needed.
```
/// Sport modes
public var sportMode: SportModeType
    
/// Heart Rate 0-250
public var heartRate: Int
    
/// Reseting Heart Rate
public var restingHeartRate: Double

/// Is signal quality acceptable?
public var signalQuality: Bool

/// Battery Levels (0-100)
public var batteryLevel: Int

/// UserInfo (See User Info below)
public var userInfo: ScoscheUserInfo!

/// FITFile List
public var fitFileList: [FitFileMetaData] = []

/// Valencell Signal Strength
public var vdcSignal: Int

/// Valencell Optical
public var vdcOptical: Int

/// Valencell Specific Heart Rate
public var vdcHeartRate: Int

/// Valencell Step Count
public var vdcSteps: Int

/// Valencell Step Rate
public var vdcStepRate: Int

/// Valencell Stride Rate
public var vdcStrideRate: Int

/// Valencell Distance
public var vdcDistance: Int

/// Valencell Total Calories
public var vdcTotalCalories: Int

/// Valencell Calories Rate
public var vdcCalorieRate: Int

/// Valencell AC Signal
public var vdcACSignal: Int

/// Valencell Speed
public var vdcSpeed: Int

/// Valencell Ambient Light
public var vdcAmbientLight: Int

/// Valencell RRI Status
public var vdcRRIStatus: Int

/// Valencell RRI Timestamp
public var vdcRRITimestamp: Int

/// Valencell RRI Data 1
public var vdcRRIDataRegister1: Int

/// Valencell RRI Data 2
public var vdcRRIDataRegister2: Int

/// Valencell RRI Data 3
public var vdcRRIDataRegister3: Int

/// Valencell RRI Data 4
public var vdcRRIDataRegister4: Int

/// Valencell RRI Data 5
public var vdcRRIDataRegister5: Int
```

### User Data
```
/// User Name String
public var name: String

/// User Weight 
public var weight: Double

/// User Height 
public var height: Double

/// User Resting Heart Rate 
public var restinghr: Int

/// User Max Heart Rate 
public var maxhr: Int

/// User Date Of Birth 
public var dob: String

/// User Age in Months 
public var age: Int

/// User Gender (0=male, 1=female)
public var gender: Int

/// User Units of Measure (0=Imperial, 1=Metric) 
public var unit: Int

/// User Heart Rate Zone 1 
public var hrZoneOne: Int

/// User Heart Rate Zone 2
public var hrZoneTwo: Int

/// User Heart Rate Zone 3 
public var hrZoneThree: Int

/// User Heart Rate Zone 4 
public var hrZoneFour: Int
```