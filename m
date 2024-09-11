Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8C19F107
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064906; cv=none; b=tuUthQPD8osJGLookrSsyxm6W2W4RQj4lxnxiScpl2r7mrN1/GXy67/a8+SdkTepexKcY5H9MK4Ysfg0mTDBB6S71+Oq9uBwgpE2rA2bsx+D0tHWCGBQNHc95puF6SUI2HHjEsUXKMsrLzjWYHZGDK/oOg74EKGwxIe4Yvm0umo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064906; c=relaxed/simple;
	bh=HWiHF2WJQe2aKVEi4bYz2zUblPTZngMcMUJTSZsaE0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mub7IlRMtEtYhNHgAVN/B52jT0ej7HcRZli0WSS2K4yn4TZrzXmHCi3eLF+rwyhUEgmIhj/v5B0a8PWNAMoqY2XEzSi5KTv/76woD2sY1jlw5jP1xC2pzr6DAuUJobC2twSIVgUYzTnKW4zy9+DrWwsPk5qAhfONjoV5sN4SFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=vn0v9lkK; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="vn0v9lkK"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6bce380eb96so4178526a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726064904; x=1726669704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/s/yZ/fu2RctQDsUCSBTBJSbx0ktmemPNhPcRZ3o84=;
        b=vn0v9lkKxmnPgdwpQBYwQXDtO8Vk54POEe75A0+cDkVKqpdDLSGjSVq5IfC/5OeRga
         5arMILcAp7xZcO7dZ+kPyNS/mqz6ShmzqXUcZIU7bEF6b/LCLrQNcO6xaN9BeGPLtS/S
         VU3Ny/ojEvBIO7/1UQgehK9A7h5+KsLAtNlJc8RLHslIEZmVjY0hSLDFb5XWYQ2pfTPC
         HGfaJz4Vo3SnAoR1mQwgU/Kslr6yC6AeBoJvndvBotV78cO82QoTMnYOK3Evy1TFDPZ8
         koJQFv/XiQ0IcA+CDgIEZiadepThPP/94hPaFC+GSsrgVQAEBC/5eI7Ol6qCvIUoPwkA
         hNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064904; x=1726669704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/s/yZ/fu2RctQDsUCSBTBJSbx0ktmemPNhPcRZ3o84=;
        b=l5met5aA0AL/ozOPUA32W1a0nKfrV1dUaE1PLW1588pf0WC++Ds57M9f3sV8mge7fQ
         fSs3erx0ri/Q0JU6l/MMdlEZFA36iy0R1EUdL1bMMAIqSgdW0GNArkvC4IlHRFBOH3+v
         D0Y8gfBcToMuUIaUUEhBunkOAKXUmFbptBj/tpqNgCM6ZVGnXdfFxJEEWFQXeYer4krF
         6jPku9bpZVkElYTR9xzK8z+TXWHR/P3uJcerYBaciF6OQJN5SrCaKpHtCSNBfksdtYmn
         XBRf7eaCQQaLbh5REThXZvF6KqnPYmbRR3Fk5aKh3hRfnSbCMAFBk+9PiTktXpecw8Qo
         X5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWRoT9SrmhANKpyPIxyhAaF6+/U+/S6rtAx50COBWDqpjZM7lL8gNdLyzplsOaNkgYUzFG98TxM/goroBI1WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hH2U2na5WOKjHU17q9C4M5LD8UuRtVaHvuFugSNqzulbaZkL
	vkB1g5oZehhaCJtkL9+vARnUHycXi5Tlp8rzf9xBdIu0MRbFYWhRceIXlal61w==
X-Google-Smtp-Source: AGHT+IHqbcVmiVTlA06ObWdR+F5XvbTWf7muQ3N8Ww5HkEnHAHU/xiG/nzHYw5l3NU9MDeCyRLMFog==
X-Received: by 2002:a05:6a21:392:b0:1cf:5b31:313a with SMTP id adf61e73a8af0-1cf5e0307abmr6964576637.1.1726064903886;
        Wed, 11 Sep 2024 07:28:23 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbfe46c9sm10639116a91.11.2024.09.11.07.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:28:23 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 11 Sep 2024 19:57:21 +0530
Subject: [PATCH 4/8] dts: ti: k3-am625-beagleplay: Enable mikroBUS
 connector
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-mikrobus-dt-v1-4-3ded4dc879e7@beagleboard.org>
References: <20240911-mikrobus-dt-v1-0-3ded4dc879e7@beagleboard.org>
In-Reply-To: <20240911-mikrobus-dt-v1-0-3ded4dc879e7@beagleboard.org>
To: fabien.parent@linaro.org, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Andrew Davis <afd@ti.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=HWiHF2WJQe2aKVEi4bYz2zUblPTZngMcMUJTSZsaE0Q=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm4ajWkpgjyK7LlSpg2LopLy7iLx8obVKJNlLKZ
 dqK5lpf5bCJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZuGo1gAKCRAFzvXHieVa
 dArQD/0cse1NKul+tL5kOruOFAWZtNGBnbuu+u6HIMhf3idPcHz4n+624u4dth5lMwH+LVbonM9
 MKxD0IofozpkpcwyrQc4DZmNfBChTUC+jZnLLX/x2o7exEzKztzjdRQjsgZ4IyRcQWjQgPs2NSY
 zCKDpadPvWuglY0yebGCXcbnKOw7K8wA2wdYRkCW+NpD9CVakgLJM/NUg05GEpf7or5Ib7iUyf5
 KCO+F68jDmUydpfuHgBV1+KfQFWITIHGIXjZcFTGvbA9jUDZ5A7m+kGian3NjLe26nydRlEVz1t
 pRwNNiS2ntjL5KkUsEYixV0njFr+Fw//KUifbsahi+pqTd4lekZUgJd9P9zep1oWJuDJwERr+zJ
 5iSMCIPd0JE/eW95LMlv3FFxuKae+ve4E2yvNQnV9i0MJNWCzrZ8fmXjRxDyImBN8xPo2SvUNzi
 bIEhmNg45+aepELQJlpPFV91NebGxPhRDmJLyYL/OqtqHySSIC7RWuToNfwQgr51YtwIyooPi8e
 4ZLXaoTyc6OLH0qExlcQtKV4i7CdchkszcBpe2vLSHksT80h+kqYQFNoEvbMFzL1WMcK5Q52XQs
 uM/dUEsgIojcEUmRYvxV2xDd43+qrG3coLEITTl8zM3Xrcx5lMqijI5WU/God4DqY4Oy6t7mfkw
 fZS+H0hdlS2SjJg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add mikroBUS connector support for Beagleplay. Acts as a nexus node for
gpios. Allows defining GPIOS relative to the connector. The pin
numbering is as follows:
  0: PWM
  1: INT
  2: RX
  3: TX
  4: SCL
  5: SDA
  6: MOSI
  7: MISO
  8: SCK
  9: CS
  10: RST
  11: AN

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 53 +++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 70de288d728e..628bcfcc4651 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -227,6 +227,21 @@ simple-audio-card,codec {
 		};
 	};
 
+	mikrobus_connector0: mikrobus-connector0 {
+		status = "disabled";
+		compatible = "mikrobus-connector";
+
+		#gpio-cells = <2>;
+		gpio-map =
+		<0 0 &main_gpio1 11 0>, <1 0 &main_gpio1 9 0>,
+		<2 0 &main_gpio1 24 0>, <3 0 &main_gpio1 25 0>,
+		<4 0 &main_gpio1 22 0>, <5 0 &main_gpio1 23 0>,
+		<6 0 &main_gpio1 7 0>, <7 0 &main_gpio1 8 0>,
+		<8 0 &main_gpio1 14 0>, <9 0 &main_gpio1 13 0>,
+		<10 0 &main_gpio1 12 0>, <11 0 &main_gpio1 10 0>;
+		gpio-map-mask = <0xf 0x0>;
+		gpio-map-pass-thru = <0x0 0x1>;
+	};
 };
 
 &main_pmx0 {
@@ -394,6 +409,25 @@ AM62X_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (B15) UART0_RTSn.I2C3_SDA */
 		>;
 	};
 
+	mikrobus_i2c_pins_gpio: mikrobus-i2c-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d0, PIN_INPUT, 7) /* (A15) UART0_CTSn.GPIO1_22 */
+			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (B15) UART0_RTSn.GPIO1_23 */
+		>;
+	};
+
+	mikrobus_pwm_pins_default: mikrobus-pwm-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a4, PIN_INPUT, 2) /* (B20) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	mikrobus_pwm_pins_gpio: mikrobus-pwm-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a4, PIN_INPUT, 7) /* (B20) MCASP0_ACLKX.GPIO1_11 */
+		>;
+	};
+
 	mikrobus_uart_pins_default: mikrobus-uart-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01d8, PIN_INPUT, 1) /* (C15) MCAN0_TX.UART5_RXD */
@@ -401,6 +435,13 @@ AM62X_IOPAD(0x01dc, PIN_OUTPUT, 1) /* (E15) MCAN0_RX.UART5_TXD */
 		>;
 	};
 
+	mikrobus_uart_pins_gpio: mikrobus-uart-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d8, PIN_INPUT, 7) /* (C15) MCAN0_TX.GPIO1_24 */
+			AM62X_IOPAD(0x01dc, PIN_INPUT, 7) /* (E15) MCAN0_RX.GPIO1_25 */
+		>;
+	};
+
 	mikrobus_spi_pins_default: mikrobus-spi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01b0, PIN_INPUT, 1) /* (A20) MCASP0_ACLKR.SPI2_CLK */
@@ -804,10 +845,8 @@ it66121_out: endpoint {
 };
 
 &main_i2c3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_i2c_pins_default>;
 	clock-frequency = <400000>;
-	status = "okay";
+	status = "disabled";
 };
 
 &main_spi2 {
@@ -876,9 +915,7 @@ &main_uart1 {
 };
 
 &main_uart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_uart_pins_default>;
-	status = "okay";
+	status = "disabled";
 };
 
 &main_uart6 {
@@ -925,3 +962,7 @@ &mcasp1 {
 	       0 0 0 0
 	>;
 };
+
+&ecap2 {
+	status = "okay";
+};

-- 
2.46.0

