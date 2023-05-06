For previous information, please refer to [rm-ctrl-dso](./rm-ctrl-dso.md).
## 5 May
### What is the relationship between Ivi.Visa.dll and `using Ivi.Visa` in the c# code
And there are at least two folder contain Ivi.Visa.dll
  - findResources.2015 project, the lacation of this dll is C:\Program Files (x86)\IVI Foundation\VISA\Microsoft.NET\Framework32\v2.0.50727\VISA.NET Shared Components 7.2.0\Ivi.Visa.dll
  - I created a new project named LecroyAcquisition, the used dll locates at C:\Program Files\IVI Foundation\VISA\Microsoft.NET\Framework64\v2.0.50727\VISA.NET Shared Components 7.2.0\Ivi.Visa.dll
The Ivi.Visa.dll

LecroyAcquisition -  C:\Program Files (x86)\IVI Foundation\VISA\Microsoft.NET\Framework32\v4.0.30319\NI VISA.NET 23.3\NationalInstruments.Visa.dll
findResources.2015 - C:\Program Files (x86)\IVI Foundation\VISA\Microsoft.NET\Framework32\v4.0.30319\NI VISA.NET 23.3\NationalInstruments.Visa.dll

And there is a NationalInstruments.Comm issue. To be explained.

## 6 May
### The installation of NI Package
First, I install NI-VISA via the program `ni-visa_23.3_online.exe`. Before the installation, I was asked to agree 2 license but I didn't see through it.

4 steps to install NI-VISA.

  - Select
  - Agree
  - Review
  - Finish
