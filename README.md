# reCamera_Gimbal-OpenClaw

[简体中文](./README_zh.md) | **English**

---

### Overview
Use **OpenClaw** to control the motor, speaker, microphone, LED, and camera of the **reCamera Gimbal**.

### Node-RED Integration
I have uploaded a JSON file for the reCamera Gimbal, which you can easily import into Node-RED. This configuration exposes two HTTP interfaces for device control:我已经为reCamera云台上传了一个JSON文件，你可以轻松地将其导入Node-RED。这个配置公开了两个用于设备控制的HTTP接口：

* **Control Dual-Motor Angle(Please replace 192.168.31.198 with the actual IP address of your reCamera Gimbal.)**: 
    ```http
    http://192.168.31.198:1880/api/gimbal?yaw=90&pitch=45
    ```
* **Take Photos(Please replace 192.168.31.198 with the actual IP address of your reCamera Gimbal.)**: 
    ```http
    http://192.168.31.198:1880/api/photo
    ```

### Skills Configuration
The Skills currently provided are written in Chinese, but this does not affect the core operation of OpenClaw. You can interact with OpenClaw in English or any other language to control the reCamera Gimbal without any issues. 

If you want to write and customize your own Skills, please refer to the [AgentSkills Specification](https://agentskills.io/specification#allowed-tools-field).
