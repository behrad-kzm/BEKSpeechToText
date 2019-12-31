# BEKSpeechToText
A Swift Library to Convert Speech to Text Using Google API

Using the configuration you can change the language from the default (Persian) to all google's supported languages.

<img src="https://github.com/behrad-kzm/BEKDesing/blob/master/Images/BEKHeader.png">

[![CI Status](http://img.shields.io/travis/popwarsweet/JellySlider.svg?style=flat)](https://travis-ci.org/popwarsweet/JellySlider)
[![License](https://img.shields.io/cocoapods/l/JellySlider.svg?style=flat)](http://cocoapods.org/pods/JellySlider)
[![Platform](https://img.shields.io/cocoapods/p/JellySlider.svg?style=flat)](http://cocoapods.org/pods/JellySlider)

## Example

__1- Google API Key:__

First of all, set your Google API key to BEKSpeech instance like below:

```swift

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let googleAPIKey = "Your-Google-API-Key"
        BEKSpeech().setAPIKey(string: googleAPIKey)
        return true
    }

```
__2- Add key to Info.plist:__

Before you start recording the user's voice you need to grant access to the device's microphone, so add 
``` Privacy - Microphone Usage Description ```  into your ``` Info.plist ```  file.

__3- Create an instance of BEKSpeech:__

Create an instance of BEKSpeech inside your view controller.

```swift

  private let speechToTextManager = BEKSpeech()

```

__4- Set BEKSpeech delegate:__
BEKSpeech will receive you the responses through 2 functions of ``` speech(didReceiveContectText: String) ``` for the result and ``` speech(didReceiveError:Error) ``` if there was an error occurred.

set the instance's delegate to your view controller and make your view controller to confirm it.

```swift

  speechToTextManager.delegate = self

```

__5- Request recording permission:__


```swift

  speechToTextManager.requestPermission { (allowed) in
       if allowed {
           //Do Something
       }else {
           //Do Somthing else
       }
  }

```

__6- Record voice:__

```swift

    @IBAction func startRecording(_ sender: Any) {
        speechToTextManager.startRecording()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        speechToTextManager.stopRecording()
    }

```

## Configuration
BEKSpeech can modify easily with the configuration property.
__Important Note:__
Current cofiguration is set for "Persian" language, if you want to change the language to you custom defined language create a config that confirms  ``` BEKSpeechConfigType ``` so you can create your configuration and change language, audio quality, etc.

__Custom configuration:__

```swift
import AVFoundation
import BEKSpeechToText
struct MyConfiguration: BEKSpeechConfigType {
    let audioFormatString = "flac"
    let keyRate = 16000
    let audioFormat = kAudioFormatFLAC
    let contentType = "audio/x-flac"
    let language = "fa-IR"
    let quality = AVAudioQuality.high
}

```

Then set your custom config to the BEKSpeech configuration property:

```swift

speechToTextManager.configuration = MyConfiguration()

```

## Installation
```

     pod 'BEKSpeechToText', :git => 'https://github.com/behrad-kzm/BEKSpeechToText.git'

```


## Author
Behrad Kazemi, Behradkzm@gmail.com, bekapps.com
<a href="https://bekapps.com"> Visit Web Site </a>
## License

BEKCurveTabbar is available under the MIT license. See the LICENSE file for more info.
