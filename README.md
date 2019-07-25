# Cocoapod SDK for Scosche Rhythm series sensors


### Rhythm+ And Rhythm 24 Sensors

Rhythm24™ optically measures blood flow and body movement to ensure the most accurate data possible. With its dual-mode radio you can simultaneously transmit your heart rate to multiple ANT+ displays (Garmin® watches, cycling computers, fitness equipment and more) and to your favorite Bluetooth® Smart enabled watch or smartphone app. [More Info](https://www.scosche.com/rhythm24)

### Bluetooth® Smart and ANT+
Great for use with smartphones, tablets, smart and sport watches, exercise equipment and many other devices that support Bluetooth® Smart or ANT+ heart rate data.

# Getting Started
This repositorty contains the ScoscheSDK24 Framework. This framework may be used to integrate Scosche Rhythm 24 and Rhythm+ activity sensor data into iOS apps.

### Build dependancies
* Xcode 10.1 and above
* Cocoapods 1.0 and above
* Physical iOS 11.0 & above device with Bluetooth to test (Note: Simulator does not have a BLE radio, and can not be used to test communication)
* Scosche Rhythm+ or Rhythm 24 sensor


### PodFile
```
platform :ios, '12.0'

target 'YourAppNameHere' do
  use_frameworks!

  pod 'ScoscheSDK24', :git => 'https://github.com/scosche/ScoscheSDK24.git'
  pod 'BluetoothMessageProtocol', '0.18.0'
  pod 'DataDecoder', '4.3'
  pod 'GBVersionTracking'

end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
```
After modifying the podfile. Open Terminal and type the following commands into Terminal.

* __cd__ /User/You/Development/Path/ (Note: you can drag and drop the podfile into terminal to generate the path. You will just need to remove the `/podfile` from the path after it appears)

* pod install


### ScoscheViewController
The ScoscheViewController UIViewController class is an extention of a standard view controller with all the required fuctions and variables needed to communicate with Scosche Rhythm 24 and + sensors.

Use the ScoscheViewController class whenever you wish to communicate or display data from the sensors. See the Scosche Demo App here: [More Info](https://github.com/scosche/DemoSDK24App)

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
### Functions
```
/// ScoscheDeviceConnect: Connects a device to ScoscheViewController
///
/// - Precondition: ScoscheDeviceScan(monitorView: SchoscheViewController), a monitor must be found in the scan to connect to.
///
/// - Parameter monitor: ScoscheMonitor
/// - Parameter monitorView: SchoscheViewController
///
/// - Returns monitorView: fitFileList
/// - Returns monitorView: onBluetoothDataUpdate
/// - Returns monitorView: onModeChangeAction
/// - Returns monitorView: connected
public func ScoscheDeviceConnect(monitor: ScoscheMonitor, monitorView: SchoscheViewController)

/// Update Loop
public var onBluetoothDataUpdate: ((_: CBUUID) -> Void)?
    
/// When a Mode is changed by the User
public var onModeChangeAction: ((_:CharacteristicScoscheRhythm24SportMode.SportModeType) -> Void)?
    
/// When a Mode is changed by the BLE Service
public var onModeAutoChangeAction: ((_:CharacteristicScoscheRhythm24SportMode.SportModeType) -> Void)?


/// ScoscheDeviceReset: Removes shared resources attached to Central Manager
public func ScoscheDeviceReset()

/// ScoscheDeviceUpdateInfo: Sends data to device listed as monitor
///
/// - Parameter monitor: ScoscheMonitor
/// - Parameter userInfo: ScoscheUserInfo
///
/// - SeeAlso: `ScoscheUserInfo()`
public func ScoscheDeviceUpdateInfo(monitor: ScoscheMonitor, userInfo: ScoscheUserInfo)

/// ScoscheDeviceScan: Starts scanning BLE for known UUIDs for Scosche Devices. Returns results of scan as list of monitors.
///
/// - Parameter monitorView:  SchoscheViewController
/// - Returns monitor: Starts scanning procedure
/// - Returns monitorView: reloadTableData()
public func ScoscheDeviceScan(monitorView: SchoscheViewController)

/// ScoscheDeviceStopScan: Removes shared resources attached to Central Manager
public func ScoscheDeviceStopScan(monitorView: SchoscheViewController)

/// removeBluetoothObservers: Removes shared resources attached to SchoscheViewController
public func removeBluetoothObservers(monitorView: SchoscheViewController)

/// setupBluetoothObservers: Attaches shared resources to SchoscheViewController
public func setupBluetoothObservers(monitorView: SchoscheViewController)

/// ScoscheGetAgeInMonths: Age is stored in Scosche devices as months. This funcion transforms Date of Birth to months.
///
/// - Parameter date: String `MM/dd/yyyy`
///
/// - Returns Int: Number of months
public func ScoscheGetAgeInMonths(date: String) -> Int 

/// ScoscheUserInfoRead: Used to return a ScoscheUserInfo object from UserDefaults storage or create a new object with defaults.
///
/// - Returns ScoscheUserInfo
public func ScoscheUserInfoRead() -> ScoscheUserInfo

/// ScoscheUserInfoWrite: Used to store ScoscheUserInfo in UserDefaults.
///
/// - Parameter userInfo: ScoscheUserInfo
public func ScoscheUserInfoWrite(userInfo: ScoscheUserInfo)



```