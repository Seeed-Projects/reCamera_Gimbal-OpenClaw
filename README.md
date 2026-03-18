# reCamera_Gimbal-OpenClaw

![reCamera_Gimbal&OpenClaw](https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/raw/main/reCamera_Gimbal%26OpenClaw.png)

[简体中文](./README_zh.md) | **English**

---

### Overview / 概述
Use **OpenClaw** to control the motor, speaker, microphone, LED, and camera of the **reCamera Gimbal**.
使用 **OpenClaw** 来控制 **reCamera 万向节（云台）**的电机、扬声器、麦克风、LED和相机。

### Node-RED Integration / Node-RED 集成
I have uploaded a JSON file for the reCamera Gimbal, which you can easily import into Node-RED. This configuration exposes two HTTP interfaces for device control:
我已经为 reCamera 云台上传了一个 JSON 文件，你可以轻松地将其导入 Node-RED。这个配置公开了两个用于设备控制的 HTTP 接口：

* **Control Dual-Motor Angle / 控制双电机角度** (Please replace `192.168.31.198` with the actual IP address of your reCamera Gimbal / 请将 `192.168.31.198` 替换为您云台的实际 IP 地址):
    ```http
    http://192.168.31.198:1880/api/gimbal?yaw=90&pitch=45
    ```

* **Take Photos / 拍照** (Please replace `192.168.31.198` with the actual IP address of your reCamera Gimbal / 请将 `192.168.31.198` 替换为云台的实际 IP 地址):
    ```http
    http://192.168.31.198:1880/api/photo
    ```

### Skills Configuration / 技能配置
The Skills currently provided are written in Chinese, but this does not affect the core operation of OpenClaw. You can interact with OpenClaw in English or any other language to control the reCamera Gimbal without any issues. 
目前提供的技能是中文编写的，但这并不影响 OpenClaw 的核心操作。您可以用英语或任何其他语言与 OpenClaw 进行交互，无障碍地控制相机云台。

If you want to write and customize your own Skills, please refer to the [AgentSkills Specification](https://agentskills.io/specification#allowed-tools-field).
如果您想编写和定制自己的技能，请参阅 [AgentSkills规范](https://agentskills.io/specification#allowed-tools-field)。
