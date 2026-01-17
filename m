Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35FA13D638
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610669; cv=none; b=TRBLAkPN5UHVLRgeFjvFUZup+IlVrlflR17B0YOCD7J67AA3ZkVf54gfLzxn7BzOXklllAjsXTFvvfFA9x+3o5wCWNGNokzKP4ejlE0n90/sNMiL3IqUPldPrw19mE/Q6ili0dWUz0PJnF3Z4zgdoARV+O6nHA8dMfW3NWubUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610669; c=relaxed/simple;
	bh=CgBRFm2Cv+c7Lf71Brl/A0fgWHhAto09L/NNtNH7Mrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqRzTrInqNU5edCgu15BKfQMtmMTnoX2vzQ/eintIeH3Cxd7k/plhUyXC2s0fU1q/OojwIk3e8MOiwq1V0Bt72oU7ZsxCRzRUxPlKgaaVMbvOi7wkY20Xx+cCVhqXWXXRBC7iwAbHfRnaiM2tCBxd8t88u/PCor4QkXpSRI7jHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so19114875ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610666; x=1769215466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LNGXAu1gOIuVgbKQ48AfTz/iHxZtEMCwM5bobAPUCg=;
        b=xFExMTHQ5hSuAGS8KZHO21D1Zc84tkrdrHYHOeEw7w66qPkArqSu8EzoRhOOriscgb
         b2WIMukgS42Im+tvYUwRLWjTtKleTf8DGszNtNcCEMBRZ9Zr/fIVhD0B3hN6n0yqWDue
         8oGRnsx+6V1khJQIaYwAHAK2vJtBIkETDMzSRMn4DbQb36IZap4fb5brxooGYEpmOM4q
         eTydMyg67QGZ5Qd8kh+6zWYEaJNf3iVYGI2RYahibKoCX/w1EyhyYYTHZjNiNPFdRte3
         GnqhLCdtHTht5HbAEwm1WxETgSHfW5kUo4+egg5hgd64zaImdaALaEMeirNKPY6rX6i5
         Lv5g==
X-Forwarded-Encrypted: i=1; AJvYcCUMufPzwME6djZq77a6vpgaXSfigiG5cwwoZ/nv+zFJD6FQGuTHH3uR0JHetjFbKleJQGbRkrfyLS9/5RprdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gXouejLkIZ7xGsZxEtDoyxwNDiZ5LLOKf1kAUQSYaFNccfFO
	t2omajCYzUB4Suq9wUuBqrDCgb1XNZOBSi2JHvhFuFJiEkMavH8ZaMHV
X-Gm-Gg: AY/fxX7ZE05ofnDqXnZI1DrIgf7Peh3P7ZM5LyA2oRdH78n6DVWVdeK0801IIJ32Hem
	zx6vBLEuyappebVy8pkVkfAth1lYgjahw9vIusjWQtWdqPek/TTgOe7xfHq4keUhVybplyjl+aF
	FAJlVHx+pX3ELnK8Cu/DY1YWnLa2hoeY9gOp3/hm9D/nkBYPWg/dU8ZTbKlvW8BarFF4B5PX3hl
	421l5Ce3ihp3AaMskFPl34XaOI3UHsMBg9VFn31XvXZ7m7nG6EYKLLq33xtqkaEXxUX1QLohd7C
	vYnsbMeNyz/CRQqndLYtz7XmIVe7bDXrxyHqVi8nbcIYk6p0s9zRjmrfM/+QY4CjxXLzx9kXwWR
	dV4NErlNUniKdpABxoH6lgaC8v5BdpoF0koUCxRXCW3v0EQ99zu9SVfqxTdErAY80TU61Jyl96L
	Fh28zrSWR8YOd9pfZIA0HpTiH7T9GvCRgxlb0mJylwXchF
X-Received: by 2002:a17:903:2ed0:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a71887c864mr40490835ad.20.1768610666344;
        Fri, 16 Jan 2026 16:44:26 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719406505sm30381715ad.84.2026.01.16.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:44:25 -0800 (PST)
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
Date: Sat, 17 Jan 2026 08:44:13 +0800
Message-ID: <20260117004413.449027-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-4-sunke@kylinos.cn>
References: <20260116162203.296844-4-sunke@kylinos.cn>
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
Changes:
- Add new include headers in alphabetical order
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  6 ++++++
 rust/kernel/device.rs           | 18 +++++++++++++++++-
 rust/kernel/irq/request.rs      | 17 +++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fa697287cf71b..327298fb39b00 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -72,6 +72,8 @@
 #include <linux/pid_namespace.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/poll.h>
 #include <linux/property.h>
 #include <linux/pwm.h>
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

