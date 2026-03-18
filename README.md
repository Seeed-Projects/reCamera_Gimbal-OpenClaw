# reCamera_Gimbal-OpenClaw

![reCamera_Gimbal&OpenClaw](https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/raw/main/reCamera_Gimbal%26OpenClaw.png)

[简体中文](./README_zh.md) | **English**

---

### Overview / 概述
Use **OpenClaw** to control the motor, speaker, microphone, LED, and camera of the **reCamera Gimbal**.

### Node-RED Integration / Node-RED 集成
I have uploaded a JSON file for the reCamera Gimbal, which you can easily import into Node-RED. This configuration exposes two HTTP interfaces for device control:

* **Control Dual-Motor Angle / 控制双电机角度** (Please replace `192.168.31.198` with the actual IP address of your reCamera Gimbal:
    ```http
    http://192.168.31.198:1880/api/gimbal?yaw=90&pitch=45
    ```

* **Take Photos / 拍照** (Please replace `192.168.31.198` with the actual IP address of your reCamera Gimbal:
    ```http
    http://192.168.31.198:1880/api/photo
    ```

### Skills Configuration
The Skills currently provided are written in Chinese, but this does not affect the core operation of OpenClaw. You can interact with OpenClaw in English or any other language to control the reCamera Gimbal without any issues. 

If you want to write and customize your own Skills, please refer to the [AgentSkills Specification](https://agentskills.io/specification#allowed-tools-field).
