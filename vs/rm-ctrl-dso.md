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
