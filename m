Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B739522D4C4
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834148; cv=none; b=qFE39GuCmLCP3ihe4nv0ciTUa7qF+jeH+Ll2H1egsFQJ4alq3TAcVXw3Nk+de7FsYZ2HzG04rz/7T/jZMIo0DCX7Tgkcc3eLt9Uia+kW249DfGgYeHIHT3cOD4yzapw16wMA0cJyScwRHyNc8v9eErmoNO+vefX7cjZ2X3dUO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834148; c=relaxed/simple;
	bh=hNxUaqce8sjnkwzAQlWMlhW9DvX+XlFNHHx9DRtSdzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0I1++mvGYhmYxU/KBdYYBn70baFc/LeQYgyTUHfnQox0VX6tJZXqKX8Rk8eXlHVtlLc7El2hV3qPg2D/h2W+clVXzYVjev72DC/YhbM/N2sQKWJTSkOQ2zE6LPLO7NZeAcJinxNtZEP0/CIlaaFjteC/NuElh2/XUjGGhns0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJwe2eN9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJwe2eN9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f40deb941so2739615ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834145; x=1739438945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G2VXwMXVVwTjOULFIF4Y5hQffUd1BBYLZ5S5agX+0E=;
        b=GJwe2eN9R6OS5SV+yyTFO9EaC9rcaVkKbk1AbGKR/GRW0MAQtw/AP5VuDnq7I16ceR
         Gg2u92epq0vMtGdRboNkMm1AXjOKDdVqDloKntpGvuRWcPY+U7iK+/pjwxA2kkRz0r/O
         2tv39HFfoHKReiXN9HkQDCiL/pOFvl/aDR1cM/t+MFUZwRJ2BiiMxDMboDzaF+77mpU4
         IpY/yOdUD3lv4IRB7lEmagk+LAQ/ntV0Myk0j8bCBXKkuSROMa1Iwc4mLupSViXvG8Qp
         3gzTGMAp07WeYyhYh1hZbSgYYQvd3lIIKWPNw/S57tx0ruOy0NnVAsf8Lc2hBgNuXcVp
         bN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834145; x=1739438945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G2VXwMXVVwTjOULFIF4Y5hQffUd1BBYLZ5S5agX+0E=;
        b=I26K7jZcfkcRQpoV5VZ3gpTQiGIBpXydJJw9m/7oGJq7fAZZX/0yRqT5Jv++ynI9qo
         YJPaWpdhKa5S+HDVoIB5LfmQHlJ+KctVamHnLR4C9wAM+EzFeMccJL9xU33mYkDO/U+m
         bIsb/I0sbpoY8kL+lHU0xoBF8NjKEY49JZ8xf2/yN1fAfbD5kg2caDSzmnyFQUAHWru3
         DO0kQge0J40XUgHlNUxqkXuwnDCRAyr5vhGiAemCucRO7medGTDNogrKqBGnHHegercZ
         XDATv7wWI3hWFAFT4an0S+3gnNSqMBOyZN8sgPWVND5Cni7SBQac1dhczNt6PncsT6v2
         DB4w==
X-Forwarded-Encrypted: i=1; AJvYcCUVCJ77LtbwyuehMWC7UYF66thRXR0LjTSI7u9tAc+nUDiCXMQrFu79qlrycU2+PzlmVWy4yPgLvzmTdsNykw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqGUQkpXYLt1BrnKxXzyuGIvgcgfTFmDPsk2j6Xrm9KWmN0R1
	L2NLaOzfnML/EL+YCwrsFSB9PZySYtptPxxNbakOz7OwKTv+ijzsSiIrBiIznsU=
X-Gm-Gg: ASbGncut6uPZ0E2BneipmRFPZ+Y01ewrwXlI+pmpWGzz1CX5kXWAIf3VHvK3QAUnJ5z
	Fd1IWwXEoXdvGMBaKeqAGrlawkdDFYBe2XCRFzH6X+NS9IYBNdXJuGhxUGyk4IDS00304tkIg7Q
	+xAINr/UkPDMpghLrzGdfK6zZkbJnxYl/gtwfIzvlxkjsyCtXGz6g2jt59owhbsZyK4HtKCn2Q9
	XYO85rgX4GC+K4MovLTnjSbfhzUQ48Q8x/n1IK51lWHqI8Y8ITq2ONdUNukf8wxb0+4fjIVM6Mp
	/TT6wM92FDDE0h9uIg==
X-Google-Smtp-Source: AGHT+IERZaH/yV6NhctlMcXLudgaGLxhDTf+gOxPascB2hUakJ8YcCEV+KZm6lvDnBVxg1aOgdZhiA==
X-Received: by 2002:a17:903:8c4:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21f17dde0c8mr99801325ad.5.1738834144997;
        Thu, 06 Feb 2025 01:29:04 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683ddc0sm8071205ad.123.2025.02.06.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:04 -0800 (PST)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
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
Subject: [PATCH V8 03/14] rust: cpu: Add from_cpu()
Date: Thu,  6 Feb 2025 14:58:24 +0530
Message-Id: <35ef3767cb9e65cb4c95df7ed50c6f3f6190066e.1738832118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1738832118.git.viresh.kumar@linaro.org>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
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
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/cpu.rs              | 31 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..ee6709599df5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6034,6 +6034,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..fda1e0d8f376 100644
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
index 000000000000..3054165d3818
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic CPU definitions.
+//!
+//! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
+
+use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+
+/// Creates a new instance of CPU's device.
+///
+/// # Safety
+///
+/// Reference counting is not implemented for the CPU device in the C code. When a CPU is
+/// hot-unplugged, the corresponding CPU device is unregistered, but its associated memory
+/// is not freed.
+///
+/// Callers must ensure that the CPU device is not used after it has been unregistered.
+/// This can be achieved, for example, by registering a CPU hotplug notifier and removing
+/// any references to the CPU device within the notifier's callback.
+pub unsafe fn from_cpu(cpu: u32) -> Result<&'static Device> {
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
index 496ed32b0911..415c500212dd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod cpu;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

