# reCamera_Gimbal-OpenClaw

![reCamera_Gimbal&OpenClaw](https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/raw/main/reCamera_Gimbal%26OpenClaw.png)

**简体中文** | [English](./README.md)

---

### 简介
使用 **OpenClaw** 来控制 **reCamera Gimbal** 的电机、扬声器、麦克风、LED 和摄像头。

### Node-RED 集成
本项目提供了一个适用于 reCamera Gimbal 的 JSON 文件，您可以直接将其导入到 Node-RED 中。该配置开放了两个 HTTP 接口以供调用：

* **控制双电机角度**（请将 `192.168.31.198` 替换为您 reCamera Gimbal 的真实 IP 地址）：
    ```http
    http://192.168.31.198:1880/api/gimbal?yaw=90&pitch=45
    ```
* **控制拍照**（请将 `192.168.31.198` 替换为您 reCamera Gimbal 的真实 IP 地址）：
    ```http
    http://192.168.31.198:1880/api/photo
    ```

### Skills 配置
目前提供的 Skills 是中文版本的，但这并不影响 OpenClaw 的正常运行。您可以直接使用英文或其他语言与 OpenClaw 交流，同样可以实现对 reCamera Gimbal 的控制。

如果您想自己编写和自定义 Skills，请查阅 [AgentSkills 编写规范](https://agentskills.io/specification#allowed-tools-field)。
