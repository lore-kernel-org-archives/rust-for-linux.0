Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C658394482
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995282; cv=none; b=lpVnmB6pjBpRNx4M/1/2tF2s4hAwlSG/JYFqVH+PfxoWKFNaTvkA8Tc/6ahdV1uCvwnHEa8cf2SfxuP0rtQb5yR9feVHKhGnBKHbSo5Ypth/e4vA/fYQjxgSaQ9y6520wiXfsPw9rWYxP26AGhajVCABCYN+Z1VhyYWOXN6i5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995282; c=relaxed/simple;
	bh=nHXYuESLKr93xVIV34PnLf/bt4/S8/+tlOFebQTwCrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SysMKlL82wxj+i/XHt5mt6wUsjJPpn7xuQ0MdGZd7U61AmteaX0P1ORZup4zn62HKLwdmdSgfmyZXCFXf1Fu/SR0DqK7p12zXIx9Mi4Mtnt7s7RLvlTMBA4wOvogT7EADwdMmWCbq8NzLzBNUVhW0KJgaGUOVWF0XP3lE6Pmucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ZG8YmvCA; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ZG8YmvCA"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6C67624002D
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:41:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772995279; bh=VjkL5/W8szE3iuKsDe3K4xDA7ycY45Ophsnoqi7RSsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=ZG8YmvCAiwJGYmowl/5pp1yyE1AgbIcyOu61pxErfz/0sKTa7Xv24otiO/w7SmmeZ
	 9VkzJ+ML+jn4Skn/95Ju5D97FpYQTqmbTS1LheS5kaEJZPGlhWOg295UwEjp+Ksx9N
	 DNixFTNdN+V2Gxj2g6DmrhnUkFm6LjKvTnYsXr2yU9dcdoP4NF2uMKhSq5u8r3xOAL
	 8sCFtvd6bINtx+DBAADhA8Pk0z1yZvKSocZeIpXSzeci9U8lu+ZCTz41dqh3cZiiAE
	 5xiLu17oaQeqW01Vw/AfOm/oyMERwrDHhI0MOrHoToaNekXppeTcnv1zxj9y74mtxJ
	 EEBlW+bg9HtgQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTTW14bPgz9rxR;
	Sun,  8 Mar 2026 19:41:17 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Sun, 08 Mar 2026 18:41:18 +0000
Subject: [PATCH v2 1/2] dt-bindings: mfd: Add synology,microp device
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-synology_microp_initial-v2-1-9389963f31c5@posteo.de>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
In-Reply-To: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=nHXYuESLKr93xVIV34PnLf/bt4/S8/+tlOFebQTwCrU=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBprcLHf/aJPEHMZZlhvPYoaFsdPJ4NaHFiot4Ns
 3FVVSAruB6JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaa3CxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9JVsQ//UXQZugJEftAvs3FuLNXgbgjQ/Rt3Mt5
 0o9Nz9Sa53y0mKvu+yaou1HOgedkoNErgPvA6lAv8ve/I2v17esGuGn9OKnzUcODGn8ycobreD+
 MLHho2TodvSY11Va628c2SLivqGkSoQk5AIlmfDc2vCIBP3PEPYrbGreAlv+MoaGcmIRdcP7LlH
 aBpc8yDOh+yGiez9I0zgNQB7W9dHcD86ZqMI+CBAVL/ic5hpzYj5pF4VoxLRKIl6iN69+7IRlIR
 Jubk0S+UiFW6A0Y7q515bO9b09AA+9aOeNu0hN3xiaQCPyrWbD54MgM2UWX212TatYOjkmIa2D1
 ACDY3RtVHIUW8+8dUJ3lv6EMtFyGpmi3FXtVw0cJLPL9gqYAl4Dn8+SNORhnZ4Dt/CGRUld+6oE
 HCUbePg4deCkN9vcF/hzh60JWy84Yalx/EuzEbTHpFbzyPtcjtPknaUo3s7FxaPCrNAQH7Hq5Ma
 jrIxjSvJrhzJ97okqvfrizClz2+/l0JWWRJSFbZzKyupbFq/6g5OtIV3u9ep0MWLDAoIUk4UXlk
 XhCkcKRNBcgRWrSyqOlCjgRZCLnVqK+4hTq0Z3TPsNIEbdCGWu+2vqEOMCJvXtd/3J8YeLibXVz
 SkqaKr3z1bt8uy6TgsfADIxjKRjD4E+ABX1xQEG3NH/ssCHAR6bQ=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Add the Synology Microp devicetree bindings. Those devices are
microcontrollers found on Synology NAS devices. They are connected to a
serial port on the host device.

Those devices are used to control certain LEDs, fan speeds, a beeper, to
handle buttons, fan failures and to properly shutdown and reboot the
device.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../devicetree/bindings/mfd/synology,microp.yaml   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
new file mode 100644
index 000000000000..60609bb19b66
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/synology,microp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synology NAS on-board Microcontroller
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description:
+  Synology devices contain a microcontroller on their device to control
+  certain leds, fan speeds, a beeper, to properly handle system shutdown
+  and reboot, buttons and fan failures.
+
+properties:
+  compatible:
+    const: synology,microp
+
+patternProperties:
+  "^(power|status|alert|usb)-led$":
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - power-led
+  - status-led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mcu {
+      compatible = "synology,microp";
+
+      power-led {
+        color = <LED_COLOR_ID_BLUE>;
+        function = LED_FUNCTION_POWER;
+      };
+
+      status-led {
+        color = <LED_COLOR_ID_MULTI>;
+        function = LED_FUNCTION_STATUS;
+      };
+    };

-- 
2.52.0

