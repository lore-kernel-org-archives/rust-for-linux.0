Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403D32FA2A;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774044648; cv=none; b=LeR4CLItZvUHuNEL1jG7p7GiQRGneywbrNCbUWvf5msngFX0LMPjfTgs0SHqMSi9zE+YRa80/w0gpDmcx/vaH+Uoi6afnp/yjYNMCtyEBkP2lvxXmKvkfS6IHaGPff48jMFWjQRXi/RGpAuJVxAKa0mERWB7j+NqZQWpADueh9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774044648; c=relaxed/simple;
	bh=GZcTYbDOBUJPmx07O1DUAwzW+OByj/dQ7qU6ay1K2fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCUjNWXcx42vs4k1ljBkOk+6kkJ04IinsNHxIxGmffdKhdqtG4FDyCg9B7FUIxlbPaKO6Tvvd265fsa24/5eLfHs3WzQHJVRaUZ8v7HibxdHPQxetKAGLSr6Vbv2M2v24vVJ40fApK1HPTnDLboL9fEo7TzjWp428PKP+qMy9P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckm0YqBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckm0YqBp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BE4C2BC9E;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044647;
	bh=GZcTYbDOBUJPmx07O1DUAwzW+OByj/dQ7qU6ay1K2fY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ckm0YqBpYed98Kz8Lz2L3KPqU5eJJXoHBByZvmJjWtFw3aApN2xfSnjkT6bZu+6uZ
	 GrGzyx2CiaW+V8CcgsSpwENDjclqxq4Wjpp/gkfbrOdrCWqkMNWPalCeFiah0wnWd9
	 Ba+uLZVA4m+zwO+FdI5GGy3L2FcX02ZDYh8olEjm5DvHX7nOcFOCjghAqzORs0JN97
	 FaFX+m1Nh6YQO5zZIkLDqqyJccSBYK7sWH7b3E1gKepMv8ZgC7ssVA+lCjLGccHfGx
	 tt/+bklvYDS8cnTi70qX4vJSEAiBB8HaSiPhRoo1mHqcIlBOvhNHVhJU2dwL528V4O
	 fGtppRmIiaHkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5AF1099B41;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 20 Mar 2026 23:09:53 +0100
Subject: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
In-Reply-To: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=LpsLV+PtJsvp3bFmqlbGf98MY1TUHG8bfm5oAyDigeE=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpvcXgRgjqTZrKGss4psDMJbSgpmwLljPO/uzRG
 C6pfff9WgGJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCab3F4BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9Jsdw//bYfL3OjCaMvyGfdRKr4sRhL4LUG1OVv
 h7pBSmNl0gn67uVM73gK8oKraDlkvUxYmUG+WXB5Rojc25e6bCkRIFpYkSG6FaU292Ta4rYg2gr
 uvRjX7Ro6ry1a84XiOeOz6O2gTlez4d20Jry4qS7eN5GDGwj5BsJkigbxUl06U9OaM80jFXzbaH
 eJ0XDlUkQuVnkTEB4LUnmCrlYLdREqFXnsaKQw2RQP35xbk1yfOy3VqqUhqveyTrzuHT7GVUItH
 iLQCBe+wmm78LUSbwKRXTedJgPM7pSZL5sNuCGUC75OPwVs3RGCar0ZYNke+A5P/lv3muIpsI2Q
 EoZrwLcwnsfAHyiWUfLvb8m9exKGdkihR8Pxjz9k8l2OrrThH2J9TtAKrK0C+v7l21ObOLxRxG1
 TKwRMiXsGXGMUFSpHktuTzg4nbOXJSg9waiFZBC6zJrO705u3EoJh/afSAlTocM1v3dgSaOME14
 gwhprfqDy0GOvrggEN5bYSAU+0zlDLQK0OtrtJXqEK/VMrVbHqq+Iv3qer0O+7ss/BXEyn/EBj/
 MwOOVK0XVRQmGwkjQ2rr+b3k7anUZ/3Y7TbeAhk0gLwgOvnn2CWKbYaV1YYKkl2qtNk2T3c5OkW
 FFftp4xoUKhqejxGiezgKtmjF/1izsPGIkBhB59UQqOlFZX+JUQA=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de

From: Markus Probst <markus.probst@posteo.de>

Add the Synology Microp devicetree bindings. Those devices are
microcontrollers found on Synology NAS devices. They are connected to a
serial port on the host device.

Those devices are used to control certain LEDs, fan speeds, a beeper, to
handle buttons, fan failures and to properly shutdown and reboot the
device.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../embedded-controller/synology,microp.yaml       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,microp.yaml
new file mode 100644
index 000000000000..3068da6f2a6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/synology,microp.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/synology,microp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synology NAS on-board Microcontroller
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description: |
+  Synology Microp is a microcontroller found in Synology NAS devices.
+  It is connected to a serial port on the host device.
+
+  It is necessary to properly shutdown and reboot the NAS device and
+  provides additional functionality such as led control, fan speed control,
+  a beeper and buttons on the NAS device.
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
+    embedded-controller {
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


