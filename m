Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E934888A
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796694; cv=none; b=RzvcaWHpOEQjrQAXddclAtU9bPebb53o0w+v7qLbulGms3yOMOVHhjb5fd1mUhGz1F2ZTTemby5aKLkm5Il1KEPiaBMRVpmw64j06M6IJbzUtFSivOkPvpQVk67p9tpJWm2LyVK6H5ZKocX8pVKKa2pTJjbMuDDWKBXObwUZhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796694; c=relaxed/simple;
	bh=Fb2qQV6SPV2yC6RSljust45oNQxitdGxMPsdX6P28qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EG2qCqYMjhKRLGw6d6K7+mFGXuoP4s//VwfK4Mgrkhdx58TKH1pbHAavHa4TtItJ3McpzayDAGTSZOGGBtljyvzQ8xJYgtQrQ4ihDCKmd6DGZ2yFAjHJ6gB70FuTg4jL09Y5+OfvuBl6iRsSZKlFeqN6SICMZITDeEwbUriGhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1500476a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 06:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796691; x=1768401491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgTNplJ8NDo29WqtkzBbM5dsPVq+nd4lQpI1B7PMUKA=;
        b=YnifaQIHOV4sxQKw2g+yl++QOd4UO8NUoDu0ANesh7qe4KYMIPpJvmfC6UvRHO/oJO
         JYC2lg2DDAtuWsQTljObV6Xv9UwDY1EP9baILezbOSNUXjSzxpqm4XdcC5zhUFEoRexM
         Vd7tlKS0R47vvMAln/0z7nO0U/NDRHDkYPeV/WBwKvrtuzufnC4p6pPOfUuBznUe/Nrf
         FG2hjSL8SylBACm9QLKrzLg+8ivKHjXl5DFlbzWAAzaaKrkBBAvUDL+7iSeenIDYuZmL
         GMms6siFP8KnwDaHeoOJrTPrPrl1Fl8F9i3fqBZG3ln2WiTW3Say8eDZ7qQ3kvt9S/pR
         Lf5w==
X-Forwarded-Encrypted: i=1; AJvYcCUS1c72s0xiXbh6YkU42DbCNdeqCcQOaYu+HSskxxRFPukO01Pj9Qm5G9BBPmCRVY/NAvWlcfQ/hR2pt152sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7kt97k1aQSB1A54j7V6ll627A3ry4SY6jhDc+lcPLxZF/JaIH
	zv0OLUVV+LFcTGK04OLPrJprmxyDRwa6Pk+47yfJKCVubXvo5WCAvL7L
X-Gm-Gg: AY/fxX6PV6iytTo8HonU+4YWOqDbsmI6Jm4/mcoBsIpgA7KnZnALfJKEBpvwmtJ9Kzf
	YX3La1eH8oQEHWmnIBoo4umwqEj6PJNewIOIlQc+hdWZWusoYESDEJRsZeL1X3euTEbPutJ3Lm0
	nx4WnSY+Id0sJ5ckoJAXppTBOMrV/lDLMD6N7R31QSErRXQayIKOgMA3MTwcvUk86pLpUh8xxOe
	rN8qyDoPtCHox13N8MpMFn8LkYNBRMQ/H0W3YqrFxS9+ZBKBBtU7l8qROCUx98bSHMWTub64yeS
	a7M9S1gF0RT+/5mu1AFOReiok/b7lHmOMXfvp2ZEU36XYHz5/OoVYuYpyr5gtYloZ27sDLou5wl
	3Axcbe7cuqeGJYrQYTMzWu3eJ7zDXnv3XoCB1PJXJpIwvQQ5aenlY/YcqCjhSLfLZeqv/P3PCuk
	RQjIREHPvehwH+7Rd0q05p
X-Google-Smtp-Source: AGHT+IGB+UzVxZCoDujJQkGD4xLs1TjaUXBYLIAMhaZ7oLqSyIgvIBUOlyCgOG+iEwDrc1cKqhT1xw==
X-Received: by 2002:a05:6a20:94cb:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-3898f9141bdmr2613443637.36.1767796691541;
        Wed, 07 Jan 2026 06:38:11 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:38:11 -0800 (PST)
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
Subject: [RFC PATCH v2 3/5] rust: add device wakeup capability support
Date: Wed,  7 Jan 2026 22:37:35 +0800
Message-ID: <20260107143738.3021892-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107143738.3021892-1-sunke@kylinos.cn>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
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
 rust/helpers/device.c           |  7 +++++++
 rust/kernel/device.rs           | 17 ++++++++++++++++-
 rust/kernel/irq/request.rs      |  7 +++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

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
index 9a4316bafedfb..cae26edd83696 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
 
 int rust_helper_devm_add_action(struct device *dev,
 				void (*action)(void *),
@@ -25,3 +27,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+int rust_helper_devm_device_init_wakeup(struct device *dev)
+{
+	return devm_device_init_wakeup(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe38..24fc69adf7bea 100644
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
@@ -325,6 +327,19 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Initialize device wakeup capability.
+    ///
+    /// Marks the device as wakeup-capable and enables wakeup. The wakeup capability is
+    /// automatically disabled when the device is removed (resource-managed).
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
index b150563fdef80..c73e0c544fec7 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -120,6 +120,13 @@ pub(crate) unsafe fn new(dev: &'a Device<Bound>, irq: u32) -> Self {
     pub fn irq(&self) -> u32 {
         self.irq
     }
+
+    /// Set the IRQ as a wake IRQ.
+    pub fn set_wake_irq(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::dev_pm_set_wake_irq(self.dev.as_raw(), self.irq as i32) };
+        to_result(ret)
+    }
 }
 
 /// A registration of an IRQ handler for a given IRQ line.
-- 
2.43.0

