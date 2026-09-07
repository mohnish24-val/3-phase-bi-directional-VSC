# Bidirectional 3-Phase VSC – Closed-Loop AC Current Control

## 📌 Overview

This project presents the modelling and closed-loop simulation of a **10 kVA, 3-phase, 2-level bidirectional Voltage Source Converter (VSC)** connected to a **400 V, 50 Hz ideal AC grid**.

The VSC is operated in both **rectifier and inverter modes** by controlling the direction of active power flow. A **dq0-based AC current control strategy** is implemented with PI controllers, while **sine-triangle PWM** is used for switching.

The objective is to achieve controlled active-power transfer at **unity power factor (iq = 0)** while maintaining the DC-link voltage at **800 V**.

---

## Key Features
-Developed the dq0 mathematical model of the 3-phase VSC and L-filter.
-Designed closed-loop AC current control using d–q axis PI controllers with pole-zero cancellation.
-Set iq = 0 for unity power factor and controlled active power through the d-axis current (id).
-Implemented 35 kHz sine-triangle PWM for switching control.
-Simulated bidirectional active-power flow with power references of −5 kW, +1 kW, +5 kW and −5 kW at 0, 0.25, 0.5 and 0.75 s, respectively.
-Verified transitions between rectifier and inverter operation through reversal of active power. 

---

## ⚙️ System Configuration

```text
          400 V, 50 Hz
          3-Phase Grid
                │
                │
          ┌─────▼─────┐
          │ L-Filter  │
          │  2 mH     │
          │ ESR=10mΩ  │
          └─────┬─────┘
                │
        ┌───────▼───────┐
        │   2-Level     │
        │     VSC       │
        │   6 MOSFETs   │
        └───────┬───────┘
                │
                │
        ┌───────▼───────┐
        │   DC Link     │
        │    800 V      │
        └───────────────┘
