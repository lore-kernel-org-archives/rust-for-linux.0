Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799C2D8387
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506813; cv=none; b=ZxBbKZtJ5VtQFRsM6FD7hO8b5BafzaZ4z6XsH3uzo7vPqXoTYHWXG/FOwh8U0gY6aj/5n2zZxUNYzsgRLEi7aIT+zNTq91dGNt0JK+2JwJtMb5sl5768nqKB9gNJF4nQv09Iri/7sios5z2rQECajV31cJgzWWsckWJQ05/Pb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506813; c=relaxed/simple;
	bh=UiKSZWJIwCpSZ0POmvhQ82fyeBB1iLLkfyPAwkgu2EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH3c6JXqWmASweTqbZvVEZmkTJVbW16AjiC2RbV0GrW2UMGhOGwi7oqwk3cO0lRwvRTX5t1pTlig534qZv6LKxvOyyiDiF7RcFbeh1nZQR8X3sKiftm0g7A4+iih8fz5E/d8UbTzzOJP/nr99k22EI27glMVaGeUQii7NEDcOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0833b5aeeso177701735ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 22:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506811; x=1768111611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+m/GtzcsiFqg7YzaIi9hheoxPoi1BFhzxVzGP1/WLd8=;
        b=ipmFdFhT3M3jmd2l/AfymEyH3ZQWTLnSouSjKyeXfW54+QJpk9RlZwma0sihgGRC9u
         7sCGw7buoHxO3br5MJIEE/WPQvuIl0rPGcLJxlT5LjmWEJ8URqeOBXcJokFloQ6gqQMR
         86inH9RYmiV9+GkNleqVTkuoNgvp4P3n+JCZ+HZH4Ha4gaK1hqFcejS8oNUjjOTkrGIk
         d3i3dYt9he75attPRZ1MSvXhPg3tteKje1AkiG4kABmIiAGiFF3gk9WvgpsZ5f80JMBH
         IWHNd++sriQiuwg0BxKLiO+JpdfiTDRT/AqNeyqoTLE4wCjFQnqYXJ9/49Y7P7pvzv7L
         H42A==
X-Forwarded-Encrypted: i=1; AJvYcCWORaPz+1eupRDgCAMLc6zO6PKnDbda9gz+/K1Mz4Rh/BsXLtssN5K7LP2zTLtMRcnCbTBKGD7ZtLIm3jSvdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUrMkhNtTfSDfqlGRD93kSLuggd8LK60uD5+EgB8Mo2TJO+WdO
	TuMBa/THavR5FYTQHUrWpBvNAwJrsdwnKx8MXCpSj/6wP0I1OSETK0PB
X-Gm-Gg: AY/fxX5Gf3sjZHFy8xJ05rbR5nGBgSjf42iGWWw/ReiOnMP+u2G4c7vXWqtXUl/kRgN
	7Awvr1RfFESu/gr6DrJTGPrhFdBPiXsxj0b4XjhFBbjR0i4+rNvCSs3fxjjyZJ0hYiTCJBPxVgM
	oMvClnzmIzYJCl/hVWyS9vQO7Yz4rHiJmJGCv+ut/kK8yUwxpaLfa8WyY1rnwz8xOIzhfk3p0yJ
	oXlrCqTLM9qeG+jo+S7Baq6uw+M/BOVOGtJFV8QYkyStAM44b6zQ81Tm7tBIFvwjmRFQRBoTTs1
	g4yfZ0yR94RtLIrtugYi1B7yssWzYqu+IXZrkuT1HnmzzMu7Wsfpg+GGThkvwwJT4Vru7f+JWzG
	zNhKlBIKXgKFmcXq2uSh6C815afI3ygkOv405IrsyoQ1+MUH3tF4JCeFdZKJ3TTbOYzX4XsJEyn
	Oac1N7UxDE4W0PdbFB0IAl
X-Google-Smtp-Source: AGHT+IGcn1o1YC/HfI0u7HpdXzspYAgOMchHcV/5rTqfmr7jUGqmUWhMt0FQ8z+bWXTpRO2llbXJQQ==
X-Received: by 2002:a05:6a20:748b:b0:366:14ac:e1e2 with SMTP id adf61e73a8af0-376ab2e78ffmr48873296637.72.1767506811365;
        Sat, 03 Jan 2026 22:06:51 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:06:49 -0800 (PST)
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
Subject: [RFC PATCH v1 2/4] rust: add device wakeup support
Date: Sun,  4 Jan 2026 14:06:19 +0800
Message-ID: <20260104060621.3757812-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104060621.3757812-1-sunke@kylinos.cn>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device wakeup initialization support to the Rust kernel:
- Add wakeup-related headers to bindings_helper.h
- Add rust_helper_devm_device_init_wakeup helper function
- Add init_wakeup() method to Device<Bound> for resource-managed
  wakeup initialization
- Add set_wake_irq() method to Device<Bound> for setting wakeup IRQ

This enables RTC drivers and other drivers to properly initialize
device wakeup capability.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/device.c           |  7 +++++++
 rust/kernel/device.rs           | 35 +++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

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
index c79be2e2bfe38..c064111a24531 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -325,6 +325,41 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
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
+    pub fn init_wakeup(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        // The function is exported from bindings_helper module via pub use.
+        let ret = unsafe { bindings::devm_device_init_wakeup(self.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(())
+    }
+
+    /// Set a device interrupt as a wake IRQ.
+    ///
+    /// Attaches the interrupt `irq` as a wake IRQ for this device. The wake IRQ is
+    /// automatically configured for wake-up from suspend. Must be called after
+    /// [`Device::init_wakeup`].
+    ///
+    /// Returns `Ok(())` on success, or an error code on failure.
+    pub fn set_wake_irq(&self, irq: i32) -> Result {
+        if irq < 0 {
+            return Err(crate::error::code::EINVAL);
+        }
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct device`.
+        let ret = unsafe { bindings::dev_pm_set_wake_irq(self.as_raw(), irq) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(())
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
-- 
2.43.0

