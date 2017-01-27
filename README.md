# pump-monitor-ci40

This application is intended to run on a Creator Ci40 board with the overflow switch of a waterpump attached between 3v3 and the interrupt line on the Ci40's mikrobus1 port. The original implementation is to hook this up to a Hi-flow condensate pump, this pump has a normally closed switch mounted on a float that is design to open the switch if the water level rises as a result of the main pump failing.

The pump monitor application on Ci40 uses the Creator IoT framework to make a digital input object available for the switch, when the overflow switch is triggered to open the interrupt will be raised (pull up to 3v3) and the app will update the digital input's state. The application is intended to be used with the Creator device server and node.js application [here](https://github.com/DuncanFrazer/pump-monitor-webapp) that receives notification of the switch's activation and in turn fires an event into IFTTT so that email/sms/etc alerts can be sent.

An overview of the pump and IoT application is shown in the diagram below


 ![](./images/Boiler_pump_monitor.png)