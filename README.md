#CWColorPicker

![Build Status](http://img.shields.io/travis/CocoaPods/CocoaPods/master.svg?style=flat)
![Lisence Version](https://img.shields.io/dub/l/vibe-d.svg)
![Code Climate](https://img.shields.io/jenkins/t/https/jenkins.qa.ubuntu.com/precise-desktop-amd64_default.svg?style=flat)

##What is CWColorPicker

CWColorPicker is a cross-platform color picker, and provide almost all colors like Adobe PhotoShop. It support Windows, iOS and will support more platforms

<table>
  <tr> 
    <td>
      <img src="https://github.com/ChangweiZhang/CWColorPicker/blob/master/Windows.gif" width=500/>
    </td>
    <td>
      <img src="https://github.com/ChangweiZhang/CWColorPicker/blob/master/iOS.gif" width=400/>
    </td>
  </tr>
</table>



##How to use it

###For Windows
You need to add the windows project to your solution and add a refrence to you own project, so that you can use the CWColorPicker control.

<img src="https://github.com/ChangweiZhang/CWColorPicker/blob/master/source/Windows%2010/snapshot.png" width=500/>


You can use it in Xaml or C# code.

In Xaml:
```Xaml
xmlns:cw="using:CWColorPicker.UI"
```
after add xmlns refrence, you can add the control in Xaml code
```Xaml
<cw:CWColorPicker Width="500" Height="500" Background="Gray" ColorSelected="CWColorPicker_ColorSelected"/>
```

###For iOS
To use the control, you need to add the CWColorPicker floder to your own project. After do that, you can use this control in your app.

<img src="https://github.com/ChangweiZhang/CWColorPicker/blob/master/source/iOS/snapshot.png" width=500/>

Add .h refrence
```oc
#import "CWColorPicker.h"
```
init the control in you project, you can get the color result by two methods, including Block and Delegate
```oc
 _colorPicker = [[CWColorPicker alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-200, 200, 200)];
   
    
    /*
     there are two methods,including block and delgate. you need to choice one method to use.
     */
    
    //delegate
    _colorPicker.delegate = self;
    
    //block
    [self setBlock:_colorPicker];
    
    [self.view addSubview:_colorPicker];
```

##Feedback & Qusetion

You can send email to me or report an issue in this project.
<br/><a href="mailto:z18205051832@hotmail.com">z18205051832@hotmail.com</a>
