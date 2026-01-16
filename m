Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E5634107D
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580559; cv=none; b=fHQAiUWyMXF+81EtXP0hEPksRJXVgrsSCkLh3W4QwK6GeP7nGrelEcVCNGckAUTljDr/vhnwbtQ3PRQUafpH+R7BDNmWW3vJrEaJF+6XkFIapsnOfEnXyCO2NqjZXS8vhqaALhKR6DxP7Sk7UiqzX7wTgkSZ7o9MteKoM+scmMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580559; c=relaxed/simple;
	bh=KR/OsVtnW5ehiqzbPjZ+lpVANdNl8H0turDjlYKvfjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvImPe1OWzutPi3zzlvmqApySBdbM8vkJiATTMZUXBax0nWkWAwdFNiVvJDL1/mHOgw5tdcS3FXG9tGbClbSj0Fcnv8jeMFvSrFbJ4FRtAZi4zpkPVyFSVI3gohoj0VruqKGqnBri0oDmJ307NM+z0T+kdoEyxbWNdjLT73fsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f102b013fso20603485ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 08:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580557; x=1769185357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEtIiuFipIHQrQ+1C6s3Qxk1j1pmthJfwz6lNxHwlRI=;
        b=F96cgJZH0ydJMWS6KpgQSlvPFmVXgfhlhIxfb1AsA+dNcf8WaJx97IVbMvZXtq9ikK
         DG7CzthYBlO0eOolW1NGudWmBT7Bu+5k3oJHEQJtrObGGWH01hWBDKv1nEr9DIhPvhzS
         N3IBTIqdS5+XO3ghVenkgibyG9ZgOoym3yFs7FwmgYElkZ38AmfN+zTGzrfTQczZY3/9
         cgF+anM3apOhMHFiGsHDm4t/h5KwduWm1T7xCN4qOdvqoVjTmIJWN5U1ySeFaox5w18m
         mhEJNMC86sqxhILX4aKhx0lnBqgsS3THMOKJdZ45kwhBO6a8m2faCukQy/QJNmXqR9hq
         BTCw==
X-Forwarded-Encrypted: i=1; AJvYcCUrg8betK05LATFZRfc5iC1zXgjeIcIYX2ze4tCklfXMpqtFS7o8LlVb5rSgx0TXDoebatjQtT9r8qUAXdwkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQr6+bvvOs0Donofr9hl7IaPNoPKQzjh0FS8dZDlr9oSKlokd0
	5rcIGwZq8+ioiGaJ5YEkgQ06ouU/YRiL+DI7Rz1caOYPZuC6/Q6F5crH
X-Gm-Gg: AY/fxX52/Xwe0QPN7KdpdTXk3kemc6Gwn5jsJoQFia5WSEOFSQ0ufB5SX8HXao9ByVS
	U2adNm3bb8dw2hpHtMQr2Y3X5vCnJL+msjUvJw4vAzSNiyTim82nxk36pFV+C0UGV0gD43fD50O
	Ks7KQVYJRuSm/tBPoSQ1RSMHcXJtNypw3+nX0StkWgVjxi3HD6x8ecGPI/Z79PUX5u2hGxbXzSP
	op4KgWs9qh+xkCS9mXMXuBCud5+batlfkAh9JtoLYTNpyoZnaxCoHH017iEr7n7i9LQNvew6rvq
	bGM8+cOIQZ2+5tOAySx96m8+bCdWVgoMW1D3wyh/DNb7/9rSBaSClZWuVPkeYGkCeNkuHG8m9dj
	/UDk/P2FsYAwwL+JAGHxegpJaYgitVj2Y5MMiD81EAn83dduPUF4uvyX/rBFNSRPHWtiSQZK6nA
	nPaftPns4T8KL1+aQrSdkf2kcT1Ak7hYWsriialonSSS1D
X-Received: by 2002:a17:903:41d2:b0:295:62d:5004 with SMTP id d9443c01a7336-2a7188a1bb9mr34323665ad.26.1768580556640;
        Fri, 16 Jan 2026 08:22:36 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa333sm25165245ad.5.2026.01.16.08.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:22:36 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [RFC PATCH v3 3/5] rust: add device wakeup capability support
Date: Sat, 17 Jan 2026 00:22:01 +0800
Message-ID: <20260116162203.296844-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-1-sunke@kylinos.cn>
References: <20260116162203.296844-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust bindings and wrappers for device wakeup functionality,
including devm_device_init_wakeup() and dev_pm_set_wake_irq().

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  6 ++++++
 rust/kernel/device.rs           | 18 +++++++++++++++++-
 rust/kernel/irq/request.rs      | 17 +++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fa697287cf71b..d6c2b06ac4107 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -88,6 +88,8 @@
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 #include <trace/events/rust_sample.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
 
 /*
  * The driver-core Rust code needs to know about some C driver-core private
diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedfb..5e31e42e8ff00 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/pm_wakeup.h>
 
 int rust_helper_devm_add_action(struct device *dev,
 				void (*action)(void *),
@@ -25,3 +26,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+int rust_helper_devm_device_init_wakeup(struct device *dev)
+{
+	return devm_device_init_wakeup(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f400..b8f7e185e32dd 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,7 +5,9 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings, fmt,
+    bindings,
+    error::to_result,
+    fmt,
     prelude::*,
     sync::aref::ARef,
     types::{ForeignOwnable, Opaque},
@@ -324,6 +326,20 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Initialize device wakeup capability.
+    ///
+    /// Marks the device as wakeup-capable and enables wakeup. Both the
+    /// wakeup capability and wakeup enable state are automatically
+    /// cleared when the device is removed (resource-managed).
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn devm_init_wakeup(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        // The function is exported from bindings_helper module via pub use.
+        let ret = unsafe { bindings::devm_device_init_wakeup(self.as_raw()) };
+        to_result(ret)
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index b150563fdef80..2484e4b53cdc3 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -120,6 +120,23 @@ pub(crate) unsafe fn new(dev: &'a Device<Bound>, irq: u32) -> Self {
     pub fn irq(&self) -> u32 {
         self.irq
     }
+
+    /// Attach the IRQ as a device wake IRQ.
+    ///
+    /// Attaches the device IO interrupt as a wake IRQ. The wake IRQ gets
+    /// automatically configured for wake-up from suspend based on the
+    /// device's sysfs wakeup entry. Typically called during driver probe
+    /// after calling `devm_init_wakeup()`.
+    ///
+    /// The wake IRQ is automatically cleared when the device is removed
+    /// (resource-managed).
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn devm_set_wake_irq(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::devm_pm_set_wake_irq(self.dev.as_raw(), self.irq as i32) };
+        to_result(ret)
+    }
 }
 
 /// A registration of an IRQ handler for a given IRQ line.
-- 
2.43.0

