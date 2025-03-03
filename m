Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FB11F2C34
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996031; cv=none; b=jL6Z6WXxP9rny103Uo675Dx3fzo3RpzaeTn9CjmZaOwWPFCKfPwYHKfB5T40d2st7O1wiHu8Z54MKLRTeF3vVxc5XC1hiZdaMypBhAh9KDFWl9WOf0nlrf5k5ARR6PDdqVMvWMs5S1uJOZ2dATrl+gl6xsMtdYccJ/nDQ08XWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996031; c=relaxed/simple;
	bh=4ePiwYSbOCYH3v1SviQDg3/HbMk9bKn0Y0srxW3uClM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bwwkvbyc405K1zOu+XcR3d2kczPqCred/y0iopMWXlfONvR/QCXJs8PJ0lsAfX6eRO1tlZUmZY7ve7M1YP/VAj3uXi2o8bPldV7xyzsYKUoEN+DCcl0+TZjlsBwyxx/iCncjlCIIkqd9EU5N470pJcsZgALxrGrrc0TBHnWuuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urmRmFxZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urmRmFxZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f44353649aso6656623a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996029; x=1741600829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCtpbarqcsWFDUrFSqXD3/5LnWihrLhv2toR5uStrCc=;
        b=urmRmFxZYbF12HuDunEnhJfhZde8ejtb3l2vNYsoImsuixO7ZPmrI1WIHeGJcVt3dl
         2aYzQV8gOoq1KBxJKuAycUErUqsx1z5elD+4QJX7LWOcb7dHSSFtFBHwziB1ZcQJSgog
         rp0F8t6Fle2x+FYztrnLRWowhSNMryZ9S5MfPJ800H/DmN/iBXwPQoMVMu5K7kcmdO94
         dDbn5Qva8xzi7NZ/fOz73GA2s2jaQrqiz8rl/vps9mkbiLbpzHOFHeoyFXswtlTcP2ZE
         8ABhtvCWlX0dLLdgiBg10kcpaahpaw03aG97Ogq9r0PIYl4hjKXTKTk4qtYKuT3GwLoZ
         liRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996029; x=1741600829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCtpbarqcsWFDUrFSqXD3/5LnWihrLhv2toR5uStrCc=;
        b=ZyN0J2At0J3ui3Tp7hqlT6QqbZsNFlmgEGWASGGjbWgWFyO8K8pIOVrmo2jnqK3TXi
         OJdPgJ3Ge7GcI7g2yboinH2MM5BoIlBWpNvORIIjwef1OkO5DHF3sLc0qvDfsmHyi6Fg
         jZtnacXygbputWDpLnBOFmLnR+N9xB+k2np4sB5w+2szPZokxmqQHHqoeMrMEmuS8cVz
         E53avNyuso1XJWxQIZUbOWhCI1Gp5BA63QjfItbHJ9YG3g88bW53Fsv6zqv8iwun0kf/
         duzwUKjWc+DzqrwLwiOeI8X4qQsBfNzYhV1wYwkm8Yr6o4/4sLt3tS2/ajQS/V4nQlDR
         mwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcNW77X/lt7AQZAqQDehf/yNk9XpFCNlZZdN3urRZRrjkiepWOG4WQla5Xmo6LmVqd9HH8R9kBd0PUztu4XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wLU5HWSl8Wza6RNkbnV6s3DrLeRzfESO5D2WP1e4DqZVIDIG
	qF2iW4UIkx1/LGpUqCZXS1g2BDu2q+mPZS8Z/1kQ0AWzGLSGQ0ZgK3fn5peE/1k=
X-Gm-Gg: ASbGncs8w0F6FERM3uEmhJz5yANyBqW9SF/ONIGi3sCuIJOtEINoIUh1Wv0E5N6ZBIU
	+vcyqCARPi4zgCycxIKMqFU+FobJ61hQYCtGMZtvcAOP3ZOtld8GdrXuZHMlkHljV6C/5mTMXPz
	38zfQ96WPYxpYW9fD62LhCTcZih4mhrhKzIUAMu9Q7oWWjDhHxysRI1yZ3VeMVrrhFrQ/aHsWd3
	93s/aEzmYqOuY/2oTqIFkRzcwg7zOlEFk8xPCmf50oTl9H7E+kY/vEbPn5De/eEXbDh8PL77nuU
	8cGZlgOggpJdo82ElPAWrdcsruH3/PtH3y1cP8L2dsvZvw==
X-Google-Smtp-Source: AGHT+IFU5ll4u6S7m0NrVB1a+FHvXW54L7A2aqExOXgrVGjy78eyLcfNYLvSU8KeXTNKCT43lKxykw==
X-Received: by 2002:a17:90b:528b:b0:2fe:a336:fe65 with SMTP id 98e67ed59e1d1-2febab3c6f0mr20234955a91.10.1740996029494;
        Mon, 03 Mar 2025 02:00:29 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6ded6ebfsm13571496a91.1.2025.03.03.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:00:28 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH V3 2/2] rust: Add initial clk abstractions
Date: Mon,  3 Mar 2025 15:28:10 +0530
Message-Id: <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1740995194.git.viresh.kumar@linaro.org>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial abstractions for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward
to introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS        |   1 +
 rust/kernel/clk.rs | 134 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 3 files changed, 136 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 726110d3c988..96e2574f41c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5779,6 +5779,7 @@ F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
 F:	rust/helpers/clk.c
+F:	rust/kernel/clk.rs
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..1fa5b7298373
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    prelude::*,
+};
+
+use core::{ops::Deref, ptr};
+
+/// Frequency unit.
+pub type Hertz = crate::ffi::c_ulong;
+
+/// A simple implementation of `struct clk` from the C code.
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Gets clock corresponding to a device and a connection id and returns `Clk`.
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get()` for a valid device pointer.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw `struct clk *`.
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+
+    /// Clock enable.
+    pub fn enable(&self) -> Result<()> {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+    }
+
+    /// Clock disable.
+    pub fn disable(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_disable(self.as_raw()) };
+    }
+
+    /// Clock prepare.
+    pub fn prepare(&self) -> Result<()> {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+    }
+
+    /// Clock unprepare.
+    pub fn unprepare(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_unprepare(self.as_raw()) };
+    }
+
+    /// Clock prepare enable.
+    pub fn prepare_enable(&self) -> Result<()> {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+    }
+
+    /// Clock disable unprepare.
+    pub fn disable_unprepare(&self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
+    }
+
+    /// Clock get rate.
+    pub fn rate(&self) -> Hertz {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_get_rate(self.as_raw()) }
+    }
+
+    /// Clock set rate.
+    pub fn set_rate(&self, rate: Hertz) -> Result<()> {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate) })
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: It is safe to call clk APIs of the C code for a clock pointer earlier returned
+        // by `clk_get()`.
+        unsafe { bindings::clk_put(self.as_raw()) };
+    }
+}
+
+/// A simple implementation of optional `Clk`.
+pub struct OptionalClk(Clk);
+
+impl OptionalClk {
+    /// Gets optional clock corresponding to a device and a connection id and returns `Clk`.
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get_optional()` for a valid device pointer.
+        Ok(Self(Clk(from_err_ptr(unsafe {
+            bindings::clk_get_optional(dev.as_raw(), con_id)
+        })?)))
+    }
+}
+
+// Make `OptionalClk` behave like `Clk`.
+impl Deref for OptionalClk {
+    type Target = Clk;
+
+    fn deref(&self) -> &Clk {
+        &self.0
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..324b86f127a0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clk;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

