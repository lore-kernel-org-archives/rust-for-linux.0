Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250398;
	b=iCvAbWW8memPgfWLknRtEYilamLbKUS4XuNrFwfZMQLkD+ZHoSFG5j46mNwBiClB7VeK
	 QnsnmXKe/dsaFFFIijjTcV/gvXmy09MUkcGZ4sJL3c7WXOO9q6M6ll3jPxL6pwpsiuraI
	 oFMnJUCN4zsfYyaY+amaPmGzGLfW6XE6npdOfWIAjWJgwBOWvX6zF3/d++Q1SBXeznagP
	 lLmRx7+e8lSvkv1ogseNhCZaUdGzGDC0sA4el/dnFl7XNIwglfozyo+mBEu8t0QLDDtW1
	 7l8FGAmaG7eKTDX5j4yf+3fOKXcAVezVo7ehboMZqn31IE56N50A5cmSyiusEnYnsIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
	b=YmQSCZL79UcJohelRDRxfsep6PNDFWWxezC+ET2BYnPhGwyGBh8ICSXIWUbFqvJVU2kF
	 l7+b2CWoefxKWZ3qKG9MAF8zII88sag6yLU/8uvzz/ldXNKJkQKCdOJQHj3dWCdJMtoQ/
	 skvM5JnnwKN4GXNE2EY3SbOTSIWPE+1QIvNAljPYndxoYag/qbLyzMlhgsoHymc+ph5nl
	 10Yreg7o+GdryLppDSUE7T/uAPQcFY0Ye00Hq8Xy5AZCEbZyCXiZRKZIg8TO6fbnz/m4x
	 /+4wNPjcC1V38rNPuHvg4JG8CHZ1/oxCTeesoRyyzcbS574rZ2uuF1r0zy1RxedkfBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyvQrkiJ;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB14606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyvQrkiJ
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so6054915ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250397; x=1793855197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=UyvQrkiJwzXJc8eMaaaK0LEUM9ppujErOpcxkDs/qShRsUCj1CjjOu6r/RFkbgvpkw
         QctJjzbyQLUI8ZXwCQxMglGw4gtkQVeMNh9hY3f+RUCopw4KstBuNDYMr1l5wioScD1j
         y0MZb6EMJnGwHVtU/36GzFx1fsHUwFz4yWo5Ftfl/zyFrigUwFAn0ACxAjmF9c7848EO
         wC1Mw9jYPSgzUBApr8acU3ELgKEDVQap3NcnC74E+LuZo9/EElYA6bTPeG5puNbohGnp
         GuVeOOs307BbGvPyriIRh/nr2EjkiRrSJYceMkkaj8qu0nV/BpY0ZTtPUk8ef67g68cS
         4xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250397; x=1793855197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=N5qx5IkfYIYFXnsNoK1K6kDrQzaiXhQqB7eHfn9yr5N2orkYNd8V6hBDiWPAK/OsO5
         /cYmdKhtN9RKs/WU4xjSbzlEMfCa5jhe1af5TruHnUywoJrpSPoZECLzAt2PLRoW7/S8
         wRo6I072OW+OS9mKBPXWiNdVoIoY+y2RbzD2GWHYuH4TdUQLNcrIvTJ4jU7HzxfeJZyL
         Hu6VU3okDjyge9Yn37+LbwUb+jLo1yKCp9yLdUrzBpdvzMu19QY1EcKMHQZTdHC8pKcM
         545XYI7iKf3uY6+g4OnuTGgVLOgjlYfLz5O4bAfNiMnHu5WoUXjGBzcJxMRv4UgGBSid
         QBLg==
X-Forwarded-Encrypted: i=1; AKwUvBxgauTJ2ppB5BdgP+lYhcU9ZUHh0gXwxsNFHEXKXJJnv8HGH/70BjAXZBqgvqSqTZu/Axiq28bN+L5MQDMd3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4wQQ/ZllJ24/U2L8UygKJTnyhF6OOx+kpJRQtzYNTgxSXRiY/
	xyNbZCPfO/aYfb3k+o3yC4cT/RqR5/eQIy8S+savUo+h4cEcEBB/0xyE
X-Gm-Gg: AYBFou10Anjd7tZouA1yEFy3jJIWro9DVjjIeVLWesHbZzhfTI+Xa3ArAc0BdkJeJnd
	MnapjH+ghvKM8b+TyQolIsTlsUJq3hlVeHkLeSIOsC4CyRdqaPeTVf6ZbJFCO6jkNpgAdmGyxa1
	/b1gkMdL7YjBujYiVJrhGEWICOjeW+HoADlTcbZZRv+7BsN7CeK6hgqQ58R/lyj49NuWvyVhvtt
	patp/grvqZ12TuV+eNU+ByG6SW6wSfZnIURN3r4Oc5Jqyh3hfUJvcuTWWemJxPQI4kJdBiDKl0s
	Bh3q3vVn/21DMXIZ7lEFCFsVovTa4m7HzlhZhfgDP2MJZ8TYopDS5kAUNJlEq15xnqEPe+zIIlC
	zeXugduZ/F8iRIlwFF5yd6/ZWJMCI6jIvQuCTXh7YBgXiH5ntvVEnShNhXLCK7pv72/3vihKA1L
	BJDTWyJF2pxYcTwiALBxjIfiY55t5GSeQNE2E/TGNtrL1QSdCa4CQ3oAygAjGZqurSI1TfqP2yg
	QHV+7nz0/6dCDP/ez24bb9Np6CJ5JDhRES1FnmL+czzmgR2LCQfEYr2iN3TrB4Mcu7RjvZlpM5I
	+gp46s9XhRBMbBIQov+o+3oz3ZI+
X-Received: by 2002:a17:903:3bc3:b0:2e9:5ec6:bfc9 with SMTP id d9443c01a7336-2eb00338d1emr39201665ad.9.1793250396614;
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:46 -0400
Subject: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
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
Message-Id: <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
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

Describe the UART register range, interrupt and baud clock input.
Initial Linux support targets the BL808 32-byte FIFO and reuses
Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19c4157436991b64b
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab UART Controller
+
+description: |
+  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
+  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: bflb,uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Baud rate generator clock
+
+  clock-names:
+    items:
+      - const: baud
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    uart3: serial@30002000 {
+        compatible = "bflb,uart";
+        reg = <0x30002000 0x1000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uart_baud>;
+        clock-names = "baud";
+    };
+...

-- 
2.47.3

