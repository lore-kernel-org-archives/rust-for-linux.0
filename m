Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250356;
	b=tooiyR2UH8FEx11fSbwoUKQgz+DJpKlsqDWFt4dqAdw9erPkZkV4t2tLXf//4cCbEpA4
	 qDiRgFviz78TQ4FXQo8UmkRGuMI9CVUZx/FEBnidDL7lQ6QkFfzkn6as3LXIsJY56gjZI
	 u/hs5upCTv99JFM/QBAwZfANU/5LWBYyeYtG1G9Yxe5ZOITEsQh4s5N3K2kSMWlDV96D+
	 USs6K+u2MdYQGZu1hNaMvs3hHsS1j/iUYkK18/paLvxNEC6jP1Jva7hlJixMluYf47uq2
	 B51cbDysC0vziPVjar8ewqDlcffo5Y3Wl4u9jpmM165PA1isLWXFqOxbUQy/I6l4vRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=qzyK/sep4k0pgE8m3Kj8rFxd4gj+fEVyhh5FmlJnLT4=;
	b=aSUSzLPV3Wg7/CJ0W70IGCI53qiUdUs7NQK0I5lZ7zPFTj13CSr2HI5V8PnpvAfeE0wq
	 LYtNMwvb2i18+ZYzjMY6QMDKxcCY5Kchg5aqRxiHuCbwRFyXuFYu4J+uvZv77VIulfSpE
	 HnV2p8yHjfcfin5waMZzbuqvdQahF7MDX94p846Hs0yUnjwyiBmFV5r3pBBwM4TvQr+5s
	 VLMjRChV6zVkTHGHG3xGbm5cZz/FABtD8eg/26qGEzBAGkRSP3YfTORoTm8P3geQNYYeT
	 0fzZi6ePwbqZMiaLzMMJEvuP1RNLooYJBmX2J8wV0WXDdBj6lAec5aoWLR+fE4xeXoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=If3Xgjta;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61411606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61411606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=If3Xgjta
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1665462a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250355; x=1793855155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qzyK/sep4k0pgE8m3Kj8rFxd4gj+fEVyhh5FmlJnLT4=;
        b=If3XgjtaRu0jjJanap+LIdclkOSsGDozBMQjUhhi0DZKT6XoadeXOYBixTQ3hbQRIL
         NBNjcTU09Jc102qL/PavE3OOkzvpbnFyFWhMRb68Es6+JMpgmJc4/izTGUTq90BcXTR3
         MKd6bgSoe6osDyeEYSwYPa4F3DwL2LHNFW+1vsTfwU8engZ8qtf5sC3tdJyp8e751DM1
         eesZ7OM6Afhm8vqNxrhRkC8muaarybhUX8uQsOoFIo4PE8H/xzAw8pBJkYCyX7Hz2Zo4
         p1I3P4zwd0Ysq1u35IdcewQBFN/0NUZtaNzyjy42mRVVKaooyKdiM41Mz7BocsBZlfjd
         3Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250355; x=1793855155;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzyK/sep4k0pgE8m3Kj8rFxd4gj+fEVyhh5FmlJnLT4=;
        b=hiWRkQ4iFNqavZtThRqjrQhTqgcZB4HXIlXEA9reN8sVHkDiWJ78KTpqH8N8xTkuXk
         Aag1gNTjyhivc3kh3Dth5JALo5FFA63p/JYnrlDNqaPVwqBQ72HEE93gT5NEmfTXOigC
         ZBWLUTJ6WV5/TY5rGgkJTMPcbMz1wxhwVJV+rzixZ/hkFXUQm46wrqcp5wfd2PDxOFVx
         9dqHRp1Y8SOY8Lsd5nUrGUadvgpjZEy08ZvM/c7NHlgidcbB8HFxu8Tw6LeIXaHjQOyW
         ItA5Yb2l8VlDzhSh64grJPzl2NFl9g8/T5MGFm3Ku1Yu/GVSU4Cg7O46VAf2Y+sHW4pS
         1CmQ==
X-Forwarded-Encrypted: i=1; AKwUvByoHuaanQD0zHPUyYFG+4WPXDDTFohZkzvi0GS1XlFxG2eaE+8YrKpF8APKgfVSETamTA9hjw/zEASuJur0Og==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwLYaMxUBH8P/+wB+fGWPv8MnOmQnFxE1ZN4ZCpbu2GZOjxnca
	5tDANwbW6t1jcRw78NFyyRdOYm5rpW+Fh9AnXlpk/kbt5p498k+oGjpB
X-Gm-Gg: AYBFou2Bnrmp90xqhYCmi5wrynlY0UjeusXBuq4+rJxb/tcZnFNNMjiw/D9DJCi4uW+
	aaAH/YwAFaXM9tcLZOFPd3G0FUk9zhsnXeftr/lAGcYZw1kf2Td9M6nHRXP3JSR8WcUxTVqtaoJ
	1WkaJwMwWWCD/Z+Ds4R/3j2lBewQZ1N7kO05HTn9VODDAjM1QPySMQ2BzqIzw+yi52FIO/aBNV3
	Mudjy8ITOMVoJGNlCRUhAbgYCPiPUE1mpwUnPpV44pW00yXvBPN22A4ToVwqTvCWN5Ca6EnX4NE
	k3VgCN1e1oQCPzQGE+HQTOUYSf90KyCiDj/d5YIivyuZfWJ0M2RGJmHAeORXsgAHeeFZ5Hqwn9l
	rqfNEkUyDrOkEZTtkH27rrIyYkTzSp+Oty4sQiKccssSVn7OcKXtA9VsDYcFgCJJeoPzhw7ySe8
	2DyTJv5QnvhjI11UgBVmOQ2TNxjR1+aeRQXZ8pzMYGd3ciIoRK3SxQ61u0znteyba/0QtSBbaxA
	NB84Do7zoNlwlx6TQIdlhkaRVZrIWH/W2Z9VPa2dkadD6xQNjqRjP3SQXwN2ZTATgjun90B1lpZ
	yJ7Bv+Hb/x2apihPnXtrRkg3FArU
X-Received: by 2002:a17:90b:562e:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ae580dd6d0mr3805262a91.46.1793250354465;
        Wed, 28 Oct 2026 22:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:05:53 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Subject: [PATCH RFC 00/12] Add BL808 UART3 support with a Rust serial-core
 polling console
Date: Thu, 29 Oct 2026 01:05:41 -0400
Message-Id: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXU4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNT3aLS4hLdpBwLAwvd5Py84vycVF3DtKRUw8Q0YxNjkxQloMaCotS
 0zAqwodFKQW7OSrG1tQDtuKqpaQAAAA==
X-Change-ID: 20261025-rust-bl808-console-1fbe1af3434d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Introduce minimal Rust serial-core abstractions and a single UART3 polling
printk console for the BL808 D0 and Sipeed M1s Dock.

The BL808 is a RISC-V SoC used in boards such as the Sipeed M1s Dock
and PINE64 Ox64 [1].

The serial abstractions and their BL808 consumer are adjacent patches.
Port registration is owned and device-managed. The adapters provide UART
locking for termios changes and normal console writes. Userspace TTY I/O,
RX, interrupt-driven transfers and DMA are not included.

I kept the driver limited to polling console output for now, so the
initial driver and Rust abstractions stay small. Does this seem like a
reasonable starting point?

The Rust abstractions cover only what this driver needs. Is there
anything missing that should be addressed at this stage? I'd especially
appreciate feedback on the port ownership and locking interfaces.

UART3 is registered as ttyBFLB0, using line 0 of a one-port driver. The
board selects it through a full stdout-path at 115200 8N1 without aliases.
Firmware initializes clock routing, gates, reset and pinmux; the board
provides the existing 40 MHz fixed baud clock.

Jisheng Zhang previously submitted BL808 platform support with a C UART
driver in 2023 [2]. The UART compatible, bflb,uart, is reused from
Zephyr [3].

This series depends on the exclusive MMIO reservation fix posted at [4].

[1] https://pine64.org/devices/ox64/
[2] https://lore.kernel.org/r/20230518152244.2178-5-jszhang@kernel.org/
[3] https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
[4] https://lore.kernel.org/rust-for-linux/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com/T/#u

---
Kwanghoon Son (12):
      dt-bindings: vendor-prefixes: Add Bouffalo Lab
      dt-bindings: interrupt-controller: Add BL808 PLIC
      dt-bindings: timer: Add BL808 CLINT
      dt-bindings: riscv: Add Bouffalo Lab BL808
      dt-bindings: serial: Add BL808 UART
      rust: serial: Add minimal serial-core polling console support
      serial: bflb: Add Rust BL808 polling console
      riscv: Add Bouffalo Lab SoC selection
      riscv: dts: bouffalolab: Add BL808 SoC
      riscv: dts: bouffalolab: Add Sipeed M1s Dock
      riscv: defconfig: Enable Bouffalo Lab SoCs
      MAINTAINERS: Add Bouffalo Lab BL808 support

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/bflb.yaml  |  21 +
 .../devicetree/bindings/serial/bflb,uart.yaml      |  57 +++
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  13 +
 arch/riscv/Kconfig.socs                            |   8 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/bouffalolab/Makefile           |   2 +
 .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts |  18 +
 .../boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi     |  19 +
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi         |  70 +++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/tty/serial/Kconfig                         |  16 +
 drivers/tty/serial/Makefile                        |   2 +
 drivers/tty/serial/bflb_uart.rs                    | 334 ++++++++++++++
 rust/bindings/bindings_helper.h                    |   2 +
 rust/helpers/helpers.c                             |   3 +
 rust/helpers/serial.c                              |  33 ++
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/serial.rs                              | 505 +++++++++++++++++++++
 rust/kernel/serial/console.rs                      | 107 +++++
 rust/kernel/serial/termios.rs                      | 104 +++++
 23 files changed, 1322 insertions(+)
---
base-commit: b7ac81a9d691d0af65a5e1d3e16ef03d5dc8f2b4
change-id: 20261025-rust-bl808-console-1fbe1af3434d

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

