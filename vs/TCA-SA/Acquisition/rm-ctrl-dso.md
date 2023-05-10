# Things about Visual Studio 
## 5th May
### How to add development environment of ActiveX into Visual Studio 2022 
[VS2022 的 MFC 安装之 Hello World ---- IT笔记之1](https://blog.csdn.net/u012040531/article/details/125375158)

### How to use visual studio to develop software to remotely control Lecroy Oscilloscope?

1.  C++

    - Use Visual Studio 2019 to open the VC++ project [Visual Studio 2022 不支持dsp(dsw)](https://www.cnblogs.com/q-z-lin/p/15375917.html)

    - Use Visual Studio 2022 directly develop the software

2.  C#

    - Use C# and VISA to remotely control Oscilloscope

### What are the differences between MFC App, MFC Dynamic-Link Library and MFC ActiveX Control

The three ActiveX project appears in [Add a class from an ActiveX control](https://learn.microsoft.com/en-us/cpp/ide/adding-a-class-from-an-activex-control-visual-cpp?view=msvc-170).

  - MFC application	
  	+ standard Windows applications - [Using the Classes to Write Applications for Windows](https://learn.microsoft.com/en-us/cpp/mfc/using-the-classes-to-write-applications-for-windows?view=msvc-170)
  	+ dialog boxes
  	+ forms-based applications
  	+ Explorer-style applications
  	+ Web browser-style applications
  - MFC DLL
  - MFC ActiveX control

I think we need the type - standard Windows applications.

<!-- **Start a project** -->
 
#### Start a project
  - Resource Editor - design user-interface elements
  - Class View - connect those elements to code
  - class library - implement application-specific logic

#### components of a project
  - application class
  - document templates
  - CWnd
  - Graphics objects

### It worked!
The VisualC++\CpommandLine example works for Visual Studio 2019 with the operation in [解决“错误 D8016 “/ZI”和“/Gy-”命令行选项不兼容 ”问题](https://blog.csdn.net/lyj_viviani/article/details/51487877).

### How to work in C#
 1. install ni-visa
    - when we did not install ni-daqmx(the driver), when running the example of ni-visa, the error "Insufficient location information or the requested device or resource is not present in the system" will be raised.
 2. install ni-daqmx
    - The web page I opened which suggestted install ni-daqmx is [[问答] NI MAX安装](https://bbs.elecfans.com/jishu_1535924_1_1.html). And that is why I install ni-daqmx. I think the comment *官网链接http://www.ni.com/download/ni-daqmx-9.8/4297/en/     你还得装VISA 不然都读不到设备，LAN通讯在labview也是配置成VISA控制* is useful.

For more information, please refer to [NI-VISA.md](./NI-VISA.md)

## 9 May
Next, I should do some investigations about `maui` 'cause I need to gather information about Lecroy scope to fill the parameters of Oscilloscope.cs.

<!-- ![Img](Img/oscilloscope.png "parameters to get")
<img src="Img/oscilloscope.png" width = "300"  alt="示波器参数" align=center />
 -->
<center>
    <img src="Img/oscilloscope.png" width="400">
    <br>
    <font size="3" face="楷体" color="#999"><u>示波器参数</u></font>
</center>

### Supported parameters
  - Supported sample rate
      +   10 G/s
      +    5 G/s
      +  2.5 G/s
      + 1.25 G/s
      +  500 M/s
      +  250 M/s
      +  100 M/s
      +   50 M/s
      +   25 M/s
      +   10 M/s
      +    5 M/s
      +  2.5 M/s
      +    1 M/s
      +  500 kS/s
      +  250 kS/s
      +  100 kS/s
      +   50 kS/s
      +   25 kS/s
      +   10 kS/s
      +    5 kS/s
      +  2.5 kS/s
      +    1 kS/s

  - Supported resolution
      + vertical resolution: 12 bits [datasheet](https://www.testequipmenthq.com/datasheets/LECROY-HDO6034-Datasheet.pdf)
#### Trigger settings
  - Supported trigger channel
      + Channel A
      + Channel B
      + Channel C
      + Channel D
  - Support trigger edge?

  - Supported trigger edge
      + Falling
      + Rising
      + FallingOrRising

  - Support trigger Level?
      + Yes
  - Support trigger Delay?
      + ???

#### Channel settings
  - Supported Channel
      + Channel A
      + Channel B
      + Channel C
      + Channel D

  - Supported coupling
      + AC
      + DC

  - Supported range
      + two many options

### Options in Textbox
  - range
  - offset
  - Trigger Level
  - Trigger timeout

### Options in Combobox
  - Coupling
  - Trigger channel
  - Trigger edge

