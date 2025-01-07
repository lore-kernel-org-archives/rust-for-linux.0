Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DD1EE7A8
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248947; cv=none; b=mbfPyDCXccfGrYTwvqlSI/P/b+5MY5o/k2jxS0p1CkswCVW54ZlFRq57bZhbR2y9uFw0xuciifyO+r9JPglw35yBUwGJVVlYAaQnUxQK9xeR5MUrr9hia+PttRVVqn29075l6X5QJEdMI9aAYCWBfgIXfv/lFE29S+Bv0Vh6mp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248947; c=relaxed/simple;
	bh=x1jppnh7F+u/qb+q16Mwk7GksVsIqsWg9PfFNzKZF6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SUpVwkWcri89+tft8Lcngh45FY5hsiGZD0iUt4AhnMWVrHj1GmjS9jR882cPNDRgSBEOtOJdBmYFcHtEf6ru1wb1nSB2en25BYbeUl5wirQXjL3HxRRPJRINah6hauXsx0WK2PZVW5Q7q52lGdFlVnsR7htMfLwhNUxCkc6ImiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXNMdG+b; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXNMdG+b"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso22511178a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 03:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248942; x=1736853742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxcq9I4UQnaTuD1adWbQtLusduX9hVdyMIuXwSadLE4=;
        b=MXNMdG+b3PiJRWJFcN7ZZD7k6KM/XDi7lsfWsk3EYXhYUHVU6cqZgRzW4klJCsWabt
         WLPZ92C1UerbPsgbiKdFpbVzNDC/S1eVgRiFW1XdI44SF4T+bPMgIyRbj7pzMUtmfk8Z
         BP6AdZmNIKuF7ESqR7d1v3B2qEywtw/JEkx8csMyG8haec8QitVJj/e1uVMDnJcz0UBC
         wVopEVSGvPoCAemf188ie1tmts+bYtG3v5s1i7YLyvKOUHhq6fxWOu51nm36WnIjTg/z
         k8knBJzL62jK4ArRZ6+QUopgp4BYUCmOJDIgsc1dxm1am+GYT/gpK916/CgG2xdNga+z
         Lk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248942; x=1736853742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxcq9I4UQnaTuD1adWbQtLusduX9hVdyMIuXwSadLE4=;
        b=aC8UC8hN0uRnMInQW1pKQF5zft54OQuitazhnA2xPlIk3mW06djruOg7wXcWQBf3TA
         qskBlyD7ReCiKEPF6WqSMwgMtLn5bnbD/6IzPwaEXN69aWyd8OkNLM+tgfoz+9QF/xtE
         SPkl7FC4Zo4FkSgmjMR8Ww2a7D7FyGjNt/oBaWlpkqtJyBMqm9MkFQDTGkyyZ4b0bNmm
         U8V3P6WRc+H+t29Tv/qTmmaAkqwc0Qq3sMDHWxpF2xi9qv2IwIarHcqYQs6JuW7pLpT1
         IijqhiMVCZhClVbwZKyyo+aitScXVW0VKHbHc+ZbKvOhgm3046qYgOAipmE6P2CMoRwq
         +aPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV0750fFMxBfkCgWbuWmwYaoLbMiCWYyNlR8swEZAIyxKYDlgL4AekbXefYkaVJ6WKRswmusrNqdu8Vp041w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4IDz6+WNWHRdd4Oz5oX9nqEu4f/u/KIgmqjJJycmlPqtZcK0A
	X7jqHxGNtYit+K4o2KGQRXHvNvPMWTrdWZSV8FwawIopBR5fXIrgzI5P/1JqEnI=
X-Gm-Gg: ASbGncv9PMIvr4cbOv6P8jUKrYmd9jqB0uIYfTCZHKyb2NP+CLzZvmICT99Xd6zPUE4
	+OdLXqCmDUp1EH3+k4DQ7yv4J914eux1ChvxCQZJOV+yRwTdPcjO+Uj8rqOAkhUCnweVDMm90SA
	xovjdSbjoDxKvY26z0+dVBX7J3CQQ6xTGURJ6zsHCDE50QvIB04nntX9r+IYck6TrejdmuLXz0N
	UuHK7qtaLV0nGCW4zb5JyVy2pebRiLLE7n6lQa+ghLh7LuupIzW2W8dnFE=
X-Google-Smtp-Source: AGHT+IHOEcakQrEY0NFbsraOZsTPh16b6theN19EscXJIXJjZKGEh1xL6JV3tVS4LFiWXJdG5cNq/Q==
X-Received: by 2002:a17:90b:270d:b0:2ee:6736:8512 with SMTP id 98e67ed59e1d1-2f452e1636emr116424204a91.12.1736248942581;
        Tue, 07 Jan 2025 03:22:22 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fc22sm37567007a91.51.2025.01.07.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:22:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 04/15] rust: device: Add few helpers
Date: Tue,  7 Jan 2025 16:51:37 +0530
Message-Id: <429b7539f787ad360cd28fd1db6dc3d6c1fe289d.1736248242.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736248242.git.viresh.kumar@linaro.org>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add from_cpu() and property_present() helpers to the device bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/device.rs           | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 43f5c381aab0..70e4b7b0f638 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -31,6 +31,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/security.h>
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index d5e6a19ff6b7..5bfbc4bdfadc 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,6 +6,9 @@
 
 use crate::{
     bindings,
+    error::Result,
+    prelude::ENODEV,
+    str::CString,
     types::{ARef, Opaque},
 };
 use core::{fmt, ptr};
@@ -59,6 +62,18 @@ pub unsafe fn get_device(ptr: *mut bindings::device) -> ARef<Self> {
         unsafe { Self::as_ref(ptr) }.into()
     }
 
+    /// Creates a new ref-counted instance of device of a CPU.
+    pub fn from_cpu(cpu: u32) -> Result<ARef<Self>> {
+        // SAFETY: It is safe to call `get_cpu_device()` for any CPU number.
+        let ptr = unsafe { bindings::get_cpu_device(cpu) };
+        if ptr.is_null() {
+            return Err(ENODEV);
+        }
+
+        // SAFETY: By the safety requirements, ptr is valid.
+        Ok(unsafe { Device::get_device(ptr) })
+    }
+
     /// Obtain the raw `struct device *`.
     pub(crate) fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
@@ -180,6 +195,12 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             )
         };
     }
+
+    /// Checks if property is present or not.
+    pub fn property_present(&self, name: &CString) -> bool {
+        // SAFETY: `name` is null-terminated. `self.as_raw` is valid because `self` is valid.
+        unsafe { bindings::device_property_present(self.as_raw(), name.as_ptr() as *const _) }
+    }
 }
 
 // SAFETY: Instances of `Device` are always reference-counted.
-- 
2.31.1.272.g89b43f80a514

