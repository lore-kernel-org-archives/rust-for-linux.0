Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33883F0744
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218025; cv=none; b=EQHOXw5CwGW2UUy1If0zWj/M5D3USWtyFLJg9T1QhTboD/4P8DafEwP9SLvVTEg4Wjt2dLYUvs0s3r94C3t4QcUXv2XuawhJPriDv01YNVgTGxzlPoH/gbDzkpIgo4FXQYJxLymYMaufs9cs6nSUYe1RY8kXLnbdxVYgB3ZmwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218025; c=relaxed/simple;
	bh=w79yUOdI2hQLJL4IbCf3z4kqwz8B5oITUq/IrpAqPBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3i2nl+ZkoFk0GV/h4VaEnGoe+YyxUQSxAmufRhoKlnM1a+TTVEgbxm2d8vgZS3fti4CC7EOhg7NaBXO7P3KwLZvvFvxUROEjm2NwOG/q0PN+6elNQxie7Dz1ptKmuW23I+gqp+u4iIbjpBpCSZAG/uXZnFuNzu+deEVubeLvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=vazgPwZ1; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="vazgPwZ1"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbeea240819so980761a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787218017; x=1787822817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1AhOQzF6qMwl/x9fl17N+mSr6gwpeCsEPQzUK1y+w4=;
        b=vazgPwZ1tR7UJPV5aWqeYb+rMt4DTIeMonvazbNChyGUIHfJMthoJMtSPZTXZxaHIh
         t3NcD2LWZLMLdJl970JNAbz/yr1nYDvuTKKBi8bGmUqrUtYMGhQTic2eadIxlcghvyNc
         KDF3T9kqiyAwDYOV1g+CPbMz2DDLmcAjgXL4pYx04oR/f+RptKed90ZkV4bf53mcZfDc
         4DF0EIgwIzNi4L0zpATJB7dfFLfr/X16dKuGEB/9ThRgFaq4/r8ZyOJQN/vbhLQ02BIP
         sCoCCoJ6la+8ouBZsUqIU1mOQdPP4XXDpiYum6W0IuPNi3AIgeyYOnjECiZtDoPr3sUS
         Y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218017; x=1787822817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1AhOQzF6qMwl/x9fl17N+mSr6gwpeCsEPQzUK1y+w4=;
        b=nOlPj1dpVNAH85cgOcD/PMTZNkGq8gB9/iQnwvl29ENVTnHYYoPijBo6rtqMjU2mQ3
         0pOtQz7jWx4TpiNEnzSRkQ+el37/WSocLMJ/yYqy0KyaGS1vhm8om1h5DgtzRego22sC
         57pfYlvdxi4RzE9VHqWDxBNwxI9dxw7aplTVzApXHQ97i9F3L617PY3ndqBtDJ8bTFdU
         7h4+xfqATthH7P/+WpFkip+72cBkqyA0zskFGa0dB6dajJ+8NdFd7vvgLrU+Cv8xDGYq
         8zb59U4pVVSa6g/t6J7ne0kgbOq18DhET8Lbh97xsHXR9BCY8jJ2eP+cfdt7XuuqgXqP
         hTrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAyEJcKq7ajL1JrBX/VwVrP3UQXw+45RGbkZOK2/wzHmLQakWrfu9wcwKfXJl1F3QNxxWFUOodcdf8u7eUCw==@vger.kernel.org
X-Gm-Message-State: AFuF++lePktBMmzvmhSd9H/WdsYJiDSSFsa2+uJq0hfGvaEQY63RzGxC
	RDDhBnMZqDzr1M2jg4c3AKh7CfgnEnFzwyUgdmK11TuV5naYJBzRD0aEKI4qixK1hA==
X-Gm-Gg: AR+sD11uosqKWpOhO8AitYLyHmOpoLFl8+L9aFkv4Wdo3bEowD54UMKKqFp7YRNA3Jf
	wKjnE04rxt5a0OoD/vuKBbbIyDERe9HV5rXZGXiR5Pmh9CzLBRw6zdUvE5cohJevmEgT5FFuY0x
	YFgsWdtHw7zTR3HItu3sa8v17bOLDg9Wpu3toUsw1UeBLYe7qll76DmZyElrlTYsHav9UZAw5ZC
	LZpBXKvJi+EyRfZSPKg8aM67xf6pmtwi8Itwj6jbnT0OM8EMcuhpbuu6GM+b1uR4aHupyeoguIG
	pF5QCeCnhN4o1nvoCOXYrnlDEYdQxhltWvI+7qJ3ydMMyOYllLMjlIIx8OCB5DA+FEJXAOFRZ+H
	ihmA+9AnjYdXa9zJZxQETOhzwfCGYggbARgbNAA5/yInRngU1YU5tQhotUNVebJS3hv4URusrJP
	MlGxJ+clWfZRH7IVN9p0ls6yV4Y6C/s66PK8qUVOIy3RbN1GfssYC3YLjt4xse5GZ5oCaCK1U=
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39580840397mr21463129a91.2.1787218016816;
        Thu, 20 Aug 2026 02:26:56 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm25903254c88.6.2026.08.20.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:26:56 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 20 Aug 2026 14:55:49 +0530
Subject: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
In-Reply-To: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=w79yUOdI2hQLJL4IbCf3z4kqwz8B5oITUq/IrpAqPBg=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqhsgdk+2/YoCnAykJc4VseJbyp9e2JuEppqzLM
 dOwze3SfKaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaobIHQAKCRAFzvXHieVa
 dIydEACs+TOA7byKJIBq0ZJy9AhQD9KKPx8TPCq3IFCyu+RhFza/NuLVOW/hlxGBt872nBLOmGE
 g29SbEJ+IZPUE2kylIK0T2c42AwlEVuqFcGo3avVQFnuoytZZiLP/pualcCBE0ARsiFsLfTdYLV
 IV34kfl/Xq0hZLPPbjZrfE0VRrNCbZ8MhqHnoC+N4oyyop99U3KVOm6AMAEg3f/x59S0n06wFS5
 R2d+tV0YtGmnlL8mNYdKmFTlkdpN3CHbuSJbiq31XuxD1kAKJ8FqoIOMdWVbsKHP0FkFL7e6iYY
 DHeUcsYgBGrsrJhSbC+pncFA96kf+YxK8+KJN1co9oakx5K6BuX6X0ynOyzVIHY+IKLjHjIn8gI
 i2fOBiqjmH08Om+QiLzT+33bY+MvHpghAie8h19jrJvmkOYzxJNjccqUB2iKXiPUb4MqkLJYuZE
 pmi4CvQ/rY7bLZq3H+HirrPuQNY1I6VE1QNQscJ4vsNjQyJg8DaIJ5mxENKxrIZp2MG3dILDgm7
 Znyzz1+quLi8SmIy0Hc3kOvqCHTNJ5WTNjltYE9ZHdeN9mtue231kIhlz3pBtuclduahHIfa86t
 e23ZAvsQqM3gFUiDR/0m6moQhTPNJx5r6rK5mb4N8JDqAJgtGo2tG0qAhgvZdFC+ZhJ0zfRYOMK
 N68ke+r7bFWexAA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 30 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..5a246f81261e
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeagleBoard.org BeagleConnect Freedom
+
+description:
+  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
+
+maintainers:
+  - Ayush Singh <ayush@beagleboard.org>
+
+properties:
+  compatible:
+    const: beagle,beagleconnect-freedom
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+      mcu {
+        compatible = "beagle,beagleconnect-freedom";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 037a87b74800..49c6dac72748 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11338,6 +11338,7 @@ GREYBUS UART NODE DRIVERS
 M:	Ayush Singh <ayush@beagleboard.com>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
 F:	drivers/greybus/gb_uart_node.rs
 
 GREYBUS SUBSYSTEM

-- 
2.55.0

