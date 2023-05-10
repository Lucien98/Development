For previous information, please refer to [rm-ctrl-dso](./rm-ctrl-dso.md).
## 5 May
### What is the relationship between Ivi.Visa.dll and `using Ivi.Visa` in the c# code
And there are at least two folder contain Ivi.Visa.dll
  - findResources.2015 project, the lacation of this dll is C:\Program Files (x86)\IVI Foundation\VISA\Microsoft.NET\Framework32\v2.0.50727\VISA.NET Shared Components 7.2.0\Ivi.Visa.dll
  - I created a new project named LecroyAcquisition, the used dll locates at C:\Program Files\IVI Foundation\VISA\Microsoft.NET\Framework64\v2.0.50727\VISA.NET Shared Components 7.2.0\Ivi.Visa.dll
The Ivi.Visa.dll

The location of `NationalInstruments.Visa.dll` in LecroyAcquisition and findResources are both `C:\Program Files (x86)\IVI Foundation\VISA\Microsoft.NET\Framework32\v4.0.30319\NI VISA.NET 23.3\NationalInstruments.Visa.dll`

And there is a NationalInstruments.Comm issue. To be explained.(TODO)

## 6 May
### The installation of NI Package
First, I install NI-VISA via the program `ni-visa_23.3_online.exe`. Before the installation, I was asked to agree 2 license but I didn't see through it.

4 steps to install NI-VISA.

  - Select (Additional items you may with to install)
  	+ NI Cerificates Installer
  	+ NI I/O Trace
  	+ NI-VISA .NET Development Support 
  	+ NI-VISA .NET Runtime
  	+ NI-VISA C Examples
  	+ NI-VISA Configuration Support
  	+ NI-VISA Driver Development Wizard
  	+ NI-VISA Interactive Control
  	+ PXI Platform Services Runtime
  	+ other things
  - Agree
  	+ 3 license, respectively for
  		* NI: NI Update Service, LabVIEW Runtime(64-bit), LabVIEW Runtime(32-bit), NI-License manager, NI-VISA
  		* .NET 6.0: NI System Components
  		* IVI: NI System Components
  - Review
  	+ just review what additional item you have checked
  - Finish

Note:
[VISA and VISA.NET Shared Components不能直接安装，是在供应商的软件里实现的](https://blog.csdn.net/qq_23958061/article/details/109117339).

Would this affect the usage of NI-VISA (in different version of .NET)?

### findResources Example in NI-VISA
If the the program gives a message "The protocol specified is invalid", please startDSO.
No matter what protocol it is(TCPIP, LXI, USBTMC), the resource could still be found.
When the protocol is right, we could communicate with DSO and make it beep.

After installed the NI-VISA, I ran findResources. And it gives "Insufficient location information or the device pr resource is not present in the system". And in output window, "Exception thrown: 'Ivi.Visa.NativeVisaException' in NationalInstruments.Visa.dll"

It turns out when NI-VISA is installed,  if we did not open ni-max to add device, we cannot connet with the oscilloscope.
