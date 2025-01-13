Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF823874A
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767426; cv=none; b=cud/6rMy9socEge+JnkU5byN8EwIAFKKXIuPXH3aFBB7YoX6OBLiBloEaXQ8Fz1kTv8Q5XUrTn3xMcb0hmLCqrzYRF8EA2M0//lm4T/fJUrNkXY9k9oSxPslsh0Vqj4C9hov9KM00ja+lY0W02rzg2GELwND7mR1vsjiwGzowYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767426; c=relaxed/simple;
	bh=Log7cXXjzMiJkcv5gL5n5WiPvymmPQBug9ZqKR86Yek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MExGiOOHEkZq8qKd+2onu5fdgAoQrl6N9l3DgBkow919EsKChuwQyOC5vyAXu8dO+CvJRFMwkwkIn3CC+CsnUSZFkoKvFM4mX++vx5oZ6PyLtBW8X/A4qkW5uNIbnNWlywVEQxYUEUKpjZs0KHQTYNTblpeUNJvGfnKmWk0PmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNDWtdYm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNDWtdYm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2162c0f6a39so90526535ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767424; x=1737372224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdn4m6dKlofswR8ctFShfrfS5TKeZlPBTra3kXQON/0=;
        b=mNDWtdYmQwesy81qm8USSreo7D38hLW3H26UTPJDW0KT9V4Xc2yow55rOKD8HrGwKK
         EA89HIE4gczQjdiWGS5a9AsRpkfk6j0xbI+aYf6jqAsuLfNEcazhlfzwSdE06+WJ96jh
         UOJdd7UGyVAKCY8h/cHkx6nyFlQOmDH8zV0nCkoL3eMUNVbCWGrO5IOKLEjtMKh2Hqge
         1EbsTpNptfIbgBBoWfBocZ78KE/fNrq1JuygiMlnDwefnvKOv8k0/iPgsNQB9Y9TGum8
         mIzHEIpT4Dt1F/PCVFV9nQfeMusgo3KKdQR9AU/kLpQkL4oS0WkRL7dkq+EfaXYNKCBV
         faBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767424; x=1737372224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdn4m6dKlofswR8ctFShfrfS5TKeZlPBTra3kXQON/0=;
        b=occnHntD+d/VxWPWfn/nX/3bLOWV0FFNMoqCAaAHtmms1fyvmz/oAMDufVn73fusem
         QqZZ2BxS9hwycmmNdX5adZmwvqbPsIQCxAlJaivrengWxjRz4yD9nbaQVX8E+tQ8oYjS
         tS/1fQk2lGzErpsu76js0UpuH9SwAkuDPggifz+zSL1kUTojSAF+mIRrKCkp1LmEJt0F
         hZiBM5LTlLANt+pcnQJxaWHwnrakDaql+CFzcwCge68nQfbq4Lgw7JFMo63Ohevx/kHu
         H2iZ1i51flP2cK6dWzXZWR510mMNay9yzzwq4HKrR/15KrTfLKJhxVkLnJ9OaFkkJnfD
         EUmg==
X-Forwarded-Encrypted: i=1; AJvYcCWflLHaUCs+cUgU8ut5UOauTlERv2uaav5zT/FtDSxjRAMT0yGIfVMz7qneYkuSRho+7Yc4G+gbAavflunE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsdD79BxijlvbIRZAo0ko22qwk6EzT3nCQkS+hfjSd3ywm1sb
	D8dsXu6Isw7idPYEWEb3Wxvak20Biv63aH12Ouz207eNLpIL9fTiLb+WgpQWhGY=
X-Gm-Gg: ASbGncvfAOWz1cZOCRy8rrBIAOf0BARXdi7qHcomywzwUyxddVijQl7lHh6oSqv4om3
	V/8ye92kEPFJPGPVIurifKQLKqYFnhbZA+GfAionsKoDYcFYEZ2Bo9TkcdRmsQZf890+/BDSGFi
	hRGGpqptyiqLzxFe45S4LeDAgXGikhOwEYLWdd5V+dcImfFJy2gDWblOqGAWZZoadBOKa7yCdBO
	kNJuYyICwOTICKHM3tq09VNYDF7CZAkOcTJxf8F353VHaqGXattkzU1mAU=
X-Google-Smtp-Source: AGHT+IF0Y5yG1c5M9n48ix5v1C+TyVEgXKMj6yF6bVdvpXIdxxQSPZGVPl+AyedZLky2FVhj80qa6A==
X-Received: by 2002:a05:6a00:3bc9:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-72d30301d86mr19474714b3a.1.1736767424079;
        Mon, 13 Jan 2025 03:23:44 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e591sm5677575b3a.126.2025.01.13.03.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:43 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V7 03/16] rust: cpu: Add from_cpu()
Date: Mon, 13 Jan 2025 16:52:58 +0530
Message-Id: <854f7b8c9cbcc7f38fe5ed548290f41224478b40.1736766672.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736766672.git.viresh.kumar@linaro.org>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements cpu::from_cpu(), which returns a reference to
Device for a CPU. The C struct is created at initialization time for
CPUs and is never freed and so ARef isn't returned from this function.

The new helper will be used by Rust based cpufreq drivers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/cpu.rs              | 26 ++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e9fdceb568b8..d63e7f6d10ea 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/cpu.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
new file mode 100644
index 000000000000..422e874627d2
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic CPU definitions.
+//!
+//! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::Result,
+    prelude::ENODEV,
+};
+
+/// Creates a new instance of CPU's device.
+pub fn from_cpu(cpu: u32) -> Result<&'static Device> {
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    let ptr = unsafe { bindings::get_cpu_device(cpu) };
+    if ptr.is_null() {
+        return Err(ENODEV);
+    }
+
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    Ok(unsafe { Device::as_ref(ptr) })
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 2d5c3d7d2e21..e9106b29c359 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -39,6 +39,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod cpu;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

