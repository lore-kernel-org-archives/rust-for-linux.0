Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18C4279FE
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825912; cv=none; b=V6NIGYQw5hZmHVfG6urTQwdkyUqU4mrbUt1i97eC5bbtue3H48aDYj7Hyhysd97+m2WL7Al5tJhvG3stqhMGOyDYqKfcI+4AphWay0udK1CK+J5B/Bl7M+30wSqsYbg7I7BvAYI3GtQXcCcJgRmwZ8bZswJTj1MQBTv72jRa1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825912; c=relaxed/simple;
	bh=zHHOV29KIIfesKx99zFZZnx3MXzbs1mtNMLCzguKvYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hB2i5gNwYxc7ARLSsrWkVDxZp2R8Cb1AwvSJ9wcS5hYzXsSxltiFCs/m6nqCHuPud6eTJ2cuynGopKoJaJ7e099uQK1W20/iJzqmalw3weh9JSqURIDPAo8Um7DWLKfGGGLeQfRH7WGxEzNEhrv0GeBH6hC+py2s84NU3X6TVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=peqQ22jB; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="peqQ22jB"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 98111240027
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 20:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772825909; bh=LsxqaLzFPCnd5l1ujHq9VRUc7Kk6DnDqykvlCjyl0IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=peqQ22jBW7fDD4mv0lfpIE6pAIDnVlI8RGWtrExuRQv84mmryhfHGA726HdYJvRLR
	 m/Ne1cuBMRBzlfT9gZ8oLPGq8qyfOjIx11PSczZq19RZDqEdVCZvqVABuUBXlbpq/o
	 pHYfEemtppt24MN/264FVXeBDM05vXYfKCfa+qbI+Toc7xLS+a73nd9KP0YiQSPMEx
	 AR1t1to+CkyT7kdwl3719kXh1kO842obLvXx+gFHcY/GNDY/rzaHNG/jhJI9QRZR4L
	 7fLkqHpv7vWGX2g5gxbgxkiq7fBDJr+482bs6UN4yeBL0+ZKTUyI6m4p1cMCgjwqOy
	 mR2j7Yz2tm+LA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSGsv1KRlz6tvq;
	Fri,  6 Mar 2026 20:38:27 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 06 Mar 2026 19:38:28 +0000
Subject: [PATCH 1/2] dt-bindings: mfd: Add binding for synology,microp
 devices
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
In-Reply-To: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
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
 linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=zHHOV29KIIfesKx99zFZZnx3MXzbs1mtNMLCzguKvYU=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpqy0sNV/wBB/FhSux8qwvgIO4ZlnRLc1gsI91T
 OhwgMOsiIWJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaastLBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9Jd2w/+N2wxIvEjuRTyucGz1GHrowZJEHA++/u
 B1gNbzPiYnBSTjs0vXQ7cSnA3Amz/3DX1rK1M2Xy2SVbmAoSf7Mvt9ImrgBwn1tYkPwL0bC01+b
 lR4cV7GmvibZv3dJtB0Ne+1SnwvSP0Q4jOkMfhHfawJAwYChtRK+ySc6tvOUnmlHuI2cuh6yXpo
 hwPuy3k624s4AN4+FTAyk6rKCeelty2aHaOp4DOKOL/OpgNbbxknzyzwl0PTeagiYcXtWnM3UMz
 xa3MsjMenT+nxNxLllWY1g8SVPtbaTXCBrc4BHEJ5cLGHLDJlermDTd2rXFJVRK3fnVIkFzMVaT
 5a2jL4cYvzdAN17aXga1EUEQR5OyWXGPdH+T9hPsFJ8G4qzXUZQTTpOLTZsyB5xI+VvdvPiYJSB
 jvsH9HcNgjGsF7R6hDBfBoaBEGsV/0GkJs0qoQ8V4UP8HPBujvp+oCtlrZ34TRD2bLd2WLpvPfH
 ekvXD0C/wB2Qtw5bgUsMrhi6qK+kckUOp5CLcZjLylnHuHdKDcGDMOt+nd62EJwvmMiSTtKK5JY
 S6FsYBx9dNRORDuaid0I0djiHxC2CDpS5kOLC2lLpk5B0orwcmRuRxGHPXuSHbc9CPLPuZjETpz
 p0MJim3RpB+J6XXTy0UiFzuQI5wkhn5dZVoOIqfZw1/t/TAsRB18=
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
 .../devicetree/bindings/mfd/synology,microp.yaml   | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
new file mode 100644
index 000000000000..0fcb0b750bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
@@ -0,0 +1,75 @@
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
+description: |
+  Synology devices contain a microcontroller on their device to control
+  certain leds, fan speeds, a beeper, to properly handle system shutdown
+  and reboot, buttons and fan failures.
+
+properties:
+  compatible:
+    enum:
+      - synology,microp
+  power-led:
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+  status-led:
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+  alert-led:
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+  usb-led:
+    $ref: /schemas/leds/common.yaml
+    unevaluatedProperties: false
+  no-check-fan:
+    type: boolean
+    description: |
+      Disable fan failure check.
+
+      The fan failure event is triggered on the device, even if the fan
+      has been intentionally set to a low speed. This property prevents a
+      hardware protection shutdown if a fan failure event is reported.
+  no-check-cpu-fan:
+    type: boolean
+    description: |
+      Disable cpu fan failure check.
+
+      The cpu fan failure event is triggered on the device, even if the cpu
+      fan has been intentionally set to a low speed. This property prevents
+      a hardware protection shutdown if a cpu fan failure event is
+      reported.
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
+    uart {
+      microp {
+        compatible = "synology,microp";
+
+        power-led {
+          color = <LED_COLOR_ID_BLUE>;
+          function = LED_FUNCTION_POWER;
+        };
+
+        status-led {
+          color = <LED_COLOR_ID_MULTI>;
+          function = LED_FUNCTION_STATUS;
+        };
+      };
+    };

-- 
2.52.0

