## 8 May

### How to add a child class of a windows form in TCA-SA
google `create a child class of a windows  form in c# visual studio`
and we reached the right page [Windows Forms Visual Inheritance](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/advanced/windows-forms-visual-inheritance?view=netframeworkdesktop-4.8).
Specificly, the working page is [How to: Inherit Forms Using the Inheritance Picker](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/advanced/how-to-inherit-forms-using-the-inheritance-picker-dialog-box?view=netframeworkdesktop-4.8) in the aforementioned link.

<!-- ### How many kinds of controls in a windows form? -->
[How to: Group Controls with the Windows Forms GroupBox Control](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/controls/how-to-group-controls-with-the-windows-forms-groupbox-control?view=netframeworkdesktop-4.8).

[How to: Add and Remove Items from a Windows Forms ComboBox, ListBox, or CheckedListBox Control](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/controls/add-and-remove-items-from-a-wf-combobox?view=netframeworkdesktop-4.8).

### What should we do to the property of a component added into the form
  - `ComboBox within groupBox`
    + name of groupBox
    + Text of groupBox
    + name of ComboBox
    + Date > items of ComboBox

  - `TextBox within groupBox`
    + name of groupBox
    + Text of groupBox

## 9 May
### How to cancel an event handler in C# windows form
[How to handle a control event (Windows Forms .NET)#Clear the handler](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/controls/how-to-add-an-event-handler?view=netdesktop-7.0#clear-the-handler): In step `5. Right-click on the event and choose **Reset**`, it is noteworthy that we should right-click the left-side, i.e. **Click**, rather than the right-side `Button1_Click`.

### Difference between LecroyScope and PicoScope
PicoScope don't support the offset of Y axis

### How to set the range and offset of Y axis


## 15 May
I want to add a middle class between the parent class and the child class
### item template
[How to: Create item templates](https://learn.microsoft.com/en-us/visualstudio/ide/how-to-create-item-templates?view=vs-2022).

Note we should restart VS so we could see the template in `Add > New Item`. And while loading a template, VS will throw a security warning.

### inherit?

  - the `private` member could not be inherited by child class in C#.
  - I did not delete the components which now belong to the child class of father class.

#### How to do it right

  - change the access level of components that should be inherited by child class from `private` into `protected`
  - delete the components that are not needed by the parent class.
  - in child class, comment the redeclaration of members in parent class.
