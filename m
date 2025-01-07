Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9D8C1E
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248955; cv=none; b=KjMhe8HPzp1fzDqWJxPRyymqgtW4wLGGOmg07lgb1U+wdVIu5c9IDUu/ROKHgdOWyyVHp+lE9XnXwDn+Cl0bdWg6W2iiHnK1YDrtn9R5bXgC8v2ekdoxe9O308tBCknAjZgaigUUZ5KIHAnJCxJenRdTDtRrHqp9BMLSM5SGNZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248955; c=relaxed/simple;
	bh=Fx9XB5ts9sXUh9O3/l7pGwJGGgpdlk1bk0cEGYOweMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifE9xo4+3AxFjoCIN9RYUdRgqaer2dQrjiDtPDe7NQsNGGPY8C97qh0G4vYFf2GhgBJzdbxzS3xI0qYM8xu0+Fjt+BIOktx3tIa7/mN0w55GH4DbnMeuR6CFDCOp/IwXeYbMP9xk39BWTEXp4/2+tdSoI7fRXc416o36LPRXWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woKW3rU8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woKW3rU8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166f1e589cso5046135ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 03:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248950; x=1736853750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK9fggKbnQIV5hRTBl9969qRmfCDXZjN5H+SCocLudA=;
        b=woKW3rU8YbZ5atMKY6K4VJZqd6hKuqCVyZm4TOmkD5rPd7CuwKTsuEfct98/SqwCqT
         jbGZzjLUWdLm6knoU5ZOUKLYpd+LiEP7OJUY/H0tdN1TT4/7ayyDlHEyuWFAAB58HlNs
         8FY7Mrh0/B9o5GC1Wsnsl+rdghWJDivOnGKF8haK9atbMygeTNHvUgP05IfrAHb7y0Dh
         XCNXHJJ/+DlcSREBoIv78EBQAfVAzfI1OkY/e3pEye4uQmijN79xb52IpQn0YqeG7w6y
         s3CG6zHaLoRhHdeEUdAICp6lJZXUhwzosnIkZz2ENh3rq4r/WmOdaV1EfK2xdP21hpko
         EJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248950; x=1736853750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jK9fggKbnQIV5hRTBl9969qRmfCDXZjN5H+SCocLudA=;
        b=pdErWi+NK53st2BlA07+mTfhLgj0KENycHL19EI+d1nYt3JrWb1mxykdgTyxxM4umi
         9HOHsHB/jiEP8fFgGybhR1CyqILMEFMwv2pm8IUvvb3L5a4UU/ZwaxRP5RMM6sE//noN
         dp0gNvmOMJZhoYHu7hZGY6E88PdW4w7ndJ5TcyVasQrpwfMrnVbtoNtiQvb7qU43e2Kp
         ZmDSXBH6cxjZIN6A5XwLS5X2zHrDDBTVvgq0H60LNIKUaJuk42upbrfLqaZXmf3PANWR
         IjOCwtR2oEWEHeB3Tx+bh6e9XEVYz8igbunanxo9WFgl/4CUL3a+c3RIxewlsAERDGRM
         L2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXnKWIIjfqnuYo3At7nFasamEgB6dwN+W6DxtkFM6zf1KZiz3pg8QGJbSKEfDvR36upI8V/2mkS/uka95qXMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0BhOCwL7l1pxWmVqHiGdST6l12GMyL1lbs0icn/ozCPbDGmx
	BW0sWMnjrhAGCDhQgDPeoIY+h20TEvIBFlsA26jFfm6DoxSwG2TLgf/+jHotC7w=
X-Gm-Gg: ASbGncuG84JO0WHU2N6HDM3iyurT2q3ijYSCR83tcyx5mpJRSn9s4RuxGAVnCUw0Xat
	dR4XllfV1qLVVMWJgHf4c545EHkQ6sEFtYm3Ur7zh8/lQ728Fcbyh5n5ZXOlOD8ETCD4f1xhVJE
	OdXH0T2AnXUxMtk7S7Tg5Ge+XQ4zxtRbJ6uvn889u7nKfkCFlM9Fetgczu8OGmAoqUdTFMOaTmT
	O0BAtiWovTz10elkFk9E/57fpaGCZb0T3UnfwXVQpr5RCc8OrAgYPRiayY=
X-Google-Smtp-Source: AGHT+IF9FSxiUi6E3vyUCMwDEsv53WHI4nW1IVtUaahS5ofFQcTzHYCfQCLCjg0emu7ogoZdphf3/A==
X-Received: by 2002:a17:902:da8e:b0:215:b058:28a5 with SMTP id d9443c01a7336-219e6ea2855mr823470415ad.18.1736248950516;
        Tue, 07 Jan 2025 03:22:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962940sm307240865ad.34.2025.01.07.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:22:30 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>
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
Subject: [PATCH V6 06/15] rust: Add bare minimal bindings for clk framework
Date: Tue,  7 Jan 2025 16:51:39 +0530
Message-Id: <d5c8f6f8d16ce9d95ea1715641597f78e7c0e845.1736248242.git.viresh.kumar@linaro.org>
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

This adds very basic bindings for the clk framework, implements only
clk_get() and clk_put(). These are the bare minimum bindings required
for many users and are simple enough to add in the first attempt.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/clk.rs              | 48 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3225379abd2b..7a95d999ead8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..123cdb43b115
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, Result},
+    prelude::*,
+};
+
+use core::ptr;
+
+/// A simple implementation of `struct clk` from the C code.
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Creates `Clk` instance for a device and a connection id.
+    pub fn new(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get()`, on a device pointer earlier received from the C
+        // code.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw `struct clk *`.
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::clk_put(self.0) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 8a0cd60eb6cc..70694becc9ff 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,7 @@
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 mod build_assert;
+pub mod clk;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514

