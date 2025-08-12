# Loop Detection Config Pack

## What does this Config Pack Do

This config pack creates the iba elements required to track loops.
It does the following.
* Collect the results of the command show loop-detect enhanced interface from all leaf and access devices in the blueprint.
* Raise an anomaly if the Current status field of any interface is equal to Loop-detected.
* Store the historical results so the operator can see when the anomalies occurred.


## JunOS Compatibility
This Config Pack will work with version 21.2r2 on JunOS families junos, junos-ex and junos-qfx

