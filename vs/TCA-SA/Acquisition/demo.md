## 9 May
### Connection Exception
1. When we just installed NI-VISA in our controller PC, i.e. the computer that runs TCA-SA program, and we did not open ni-max to add device, then we cannot connet with the oscilloscope and  we got following exception:
	+ Ivi.Visa.NativeVisaException: 'Insufficient location information or the device resource is not present in the system'

2. When we just started the oscilloscope, we did not login or login but dso did not start , we will get the exception:
	+ Ivi.Visa.NativeVisaException: 'The protocol specified is invalid.'

3. When dso started with protocol other than `LXI(VXI11)` or we set the protocol into others, we won't get any response.\
    + here other protocol includes `TCPIP(VICP)`, `USBTMC`.


## 30 May
### Connection Exception
1. When the oscilloscope is powered on, we did not login, we got the message `Insufficient location information or the device resource is not present in the system`
2. we login, still `Insufficient location information or the device resource is not present in the system`
3. the oscilloscope automatically started, still `Insufficient location information or the device resource is not present in the system`
### Reason
The oscilloscope is not connected to the Ethenet.

## 31 May
### keyword `internal` in C#


