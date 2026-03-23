-----

[English   英语] | [简体中文](https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/blob/main/README_zh.md)

-----

![reCamera_Gimbal&OpenClaw](https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/raw/main/reCamera_Gimbal%26OpenClaw.png)! [reCamera_Gimbal& OpenClaw) (https://github.com/Seeed-Projects/reCamera_Gimbal-OpenClaw/raw/main/reCamera_Gimbal%26OpenClaw.png)

# reCamera_Gimbal-OpenClaw

> Use OpenClaw to control the motor, camera, LED, microphone, and speaker of a reCamera Gimbal.使用OpenClaw来控制摄像机云台的电机、相机、LED、麦克风和扬声器。

## What This Is   ##这是什么   这是什么

This project provides an **OpenClaw Skill + Node-RED flowOpenClaw技能Node-RED flow** for controlling a **reCamera Gimbal edge AI camera摄像头云台边缘AI摄像头**.这个项目提供了一个**OpenClaw Skill Node-RED flowOpenClaw技能Node-RED flow**用于控制**reCamera Gimbal edge AI camera摄像头云台边缘AI摄像头**。

It enables:   它使:

  * Motor (yaw/pitch) control via HTTP API*通过HTTP API控制电机（偏航/俯仰）
  * Image capture and retrieval*图像捕获和检索
  * LED control   * LED控制
  * Audio recording and playback*录音和回放
  * Vision-based interaction via OpenClaw*通过OpenClaw进行基于视觉的交互

**Role in OpenClaw:   在OpenClaw中的角色：** Skill (with external Node-RED runtime integration)** OpenClaw中的角色：**技能（与外部Node-RED运行时集成）

-----

## Prerequisites   # #先决条件

> [\!IMPORTANT]   在[\ !重要的)
> You need the following components (derived from project files):你需要以下组件（来自项目文件）：

  * A **reCamera Gimbal device** (RISC-V edge AI camera)** *reCamera Gimbal设备** （RISC-V edge AI camera）
  * **Node-RED** running on the device (port `1880`)** *Node-RED**在设备上运行（端口`1880`）
  * **OpenClaw** environment with `Exec` tool enabled** *OpenClaw**环境，启用`Exec`工具
  * Network access to the device (local IP like `192.168.31.xxx`)*对设备的网络访问（本地IP，如`192.168.31.xxx`）
  * PowerShell (for Windows-based skill scripts)* PowerShell（适用于基于windows的skill脚本）

-----

## Quick Start   ##快速入门

### 1\. Import Node-RED Flow# # # 1 \。导入Node-RED流

Import the provided file into Node-RED:将提供的文件导入Node-RED：

```
openclaw_V2.json
```

This creates two HTTP endpoints:这将创建两个HTTP端点：

  * Control gimbal: `http://<DEVICE_IP>:1880/api/gimbal?yaw=90&pitch=45`*控制云台：`http://<；DEVICE_IP>:1880/api/gimbal?yaw=90&pitch=45`
  * Capture photo: `http://<DEVICE_IP>:1880/api/photo`*图片：`http://<；DEVICE_IP>:1880/api/photo`

-----

### 2\. Install Skill into OpenClaw

Copy the skill folder `recamera-gimbal/` into your OpenClaw workspace:

```bash   ”“bash
~/.openclaw/workspace/skills/recamera-gimbal/~ / .openclaw /工作区/技能/ recamera-gimbal /
```

-----

### 3\. Configure openclaw.json

The `openclaw.json` file is located in your OpenClaw installation directory. This file contains all the configuration settings for connecting to AI models. You need to add the following configuration for the reCamera Gimbal into `openclaw.json`:

> [\!NOTE]
>
>   * Replace `"C:\\Users\\seeed\\.openclaw\\workspace\\skills"` with the actual path to your skills folder.
>   * Replace `"192.168.31.198"` with the actual IP address of your reCamera Gimbal.
>   * Replace `"recamera.1"` with the actual password of your reCamera Gimbal.

```json
"skills": {
  "load": {
    "extraDirs": [
      "C:\\Users\\seeed\\.openclaw\\workspace\\skills"
    ]
  },
  "entries": {
    "recamera-gimbal": {
      "enabled": true,
      "env": {
        "RECAMERA_IP": "192.168.31.198",
        "RECAMERA_PASS": "recamera.1"
      }
    }
  }
}
```

-----

### 4\. Verify

Test APIs manually:

```bash
# Move gimbal
curl "http://<DEVICE_IP>:1880/api/gimbal?yaw=120&pitch=90"

# Get image
curl "http://<DEVICE_IP>:1880/api/photo"
```

If successful:

  * Gimbal moves
  * Image returns as JPEG

-----

## Configuration

### HTTP API Parameters

From Node-RED flow:

| Field | Type   | Default | Range   |
| ----- | ------ | ------- | ------- |
| yaw   | number | 180     | 1 – 345 |
| pitch | number | 90      | 1 – 175 |

Example:

```http
/api/gimbal?yaw=120&pitch=90
```

-----

### Skill Script Paths

From `SKILL.md`:

```powershell
# LED control
scripts/control_led.ps1 -Action on|off

# Photo capture (via HTTP)
http://<DEVICE_IP>:1880/api/photo
```

-----

## How It Works

```mermaid
graph TD
    Camera[Camera] --> Model[YOLO Detection]
    Model --> SaveImage[Save Image]
    Model --> Preview[Preview Rendering]

    HTTP_Gimbal[/api/gimbal/] --> Parser[Parameter Parsing]
    Parser --> Motor[Motor Control]

    HTTP_Photo[/api/photo/] --> ServePhoto[Return Photo]

    SaveImage --> Global[(Global Cache)]
    Global --> ServePhoto
```

### Flow Summary

  * Camera captures frames
  * YOLO model processes detections
  * Latest image stored globally
  * HTTP endpoints expose motor control and image retrieval

-----

## Features

  * **Gimbal Control**: Control yaw and pitch via HTTP API.
  * **Live Image Capture**: Retrieve latest frame as JPEG.
  * **Vision Integration**: YOLO-based object detection pipeline.
  * **LED Control**: Turn light on/off via PowerShell scripts.
  * **Audio I/O**: Record and play audio via scripts.

-----

## Onboarding

From `SKILL.md`:

| Capability     | Trigger                     | Action                           |
| -------------- | --------------------------- | -------------------------------- |
| Vision capture | “look”, “see”, “take photo” | Call `/api/photo`, analyze image |
| Gimbal control | directional commands        | Call `/api/gimbal`                |
| LED control    | “turn on/off light”         | Run PowerShell script            |
| Audio          | “record/play”               | Run script                       |

-----

## Policy

From `SKILL.md`:

| Rule                | Description                                 |
| ------------------- | ------------------------------------------- |
| No file inspection  | Do not read/edit `scripts/`                 |
| Exec only           | Only use predefined commands                |
| Fixed output format | Must return image in strict markdown format |

-----

## Troubleshooting

**Gimbal does not move**

  * Check Node-RED is running on port `1880`
  * Verify device IP
  * Ensure CAN/motor nodes are connected

**No image returned**

  * Ensure model node has debug enabled
  * Check global variable `latest_image` is set

**PowerShell scripts fail**

  * Run with: `  -ExecutionPolicy Bypass `

**HTTP API not reachable**

  * Check firewall/network
  * Confirm Node-RED flow is deployed

-----

## Links

  * OpenClaw Skill Spec: [https://agentskills.io/specification\#allowed-tools-field](https://agentskills.io/specification#allowed-tools-field)

-----
