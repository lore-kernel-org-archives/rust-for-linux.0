Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43121421D
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220193; cv=none; b=lNqxKo/jzRZUmgW8warhpzk26JUZwl/Z3rPL/RwotOOGbtZoIZ4BZ8bi+99cTwqtqxembqTOvD7QkAdP/UHbZnKqqoYBBn0lmzSJD06TUwa2PWOAmSNoZZsAt+BGmipL0HCsEGC+hpVDDZmDvaIORcuO4L/Tkvs84hFivEn7uBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220193; c=relaxed/simple;
	bh=FXN7MqRrTtWb3HqWkB4bVWXQmRagu7xa10NZ2Fw72s8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EAvJsl3EjdGZLdHfq2sM/sujEpfw2NWyO7wV+sEgKrR3x+lJoFvZQ/DhujfpuckVxOOdK7d2VEFQ49NlDKkIs8hBplCMSgql0EkRTfHWfPscWaWggItRfjU5dcNbpZTDxPNyRRyGv8/NfkXk6umFyR26gaDJN3Hpw8qyZqC+rOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qf3q1yQd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qf3q1yQd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c3407a87aso55769945ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220190; x=1745824990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I9rp3cxJf7RfTSYMTTz5L7zI5/p8FTKb0IR9cJ6SsU=;
        b=Qf3q1yQdG3zOTxzKwSb/7kSsynDOuFd7KyStFoald5YZ9HEYBQjsujcoUb63oiBfQi
         lIF+xvFkh9oBKAfpOiHrdx77rdkcHBv9Xz64SUXQbqYCD4fh9LDBlrR69FJ0puI7F1AZ
         kV0n4Wkb5JNE4ggOM7f5W/rPowm9C652x+wxICsk3uyiihUgkJJHNIM2BVGx7Ysi5ZO1
         hxUMvmJD8C/Kcyky262ts2R/JInlnG2X2f5YD5A4YbYnDpaujnL7BmfnxlXXb9xI70j5
         gif2VDwjLTV9MMgA8BF2XYh1c8I1UpbiUVQ9Yypy/m0U4yjUtQIW4C472YzcTmkAQxfB
         /V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220190; x=1745824990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I9rp3cxJf7RfTSYMTTz5L7zI5/p8FTKb0IR9cJ6SsU=;
        b=JiM6GDLfNXo9cGTdPrLf+sOhNHboU/crGaXHYyk3UIvfUo4wGPf/IgNSPlWOQT/iRv
         dPhOff4ljq0uggwrVC7Peh9jDjkJ+5+RudMWvCnbGJ4gcKC7kbeyzI+vZvb+o2csstiB
         zdF7873krqE+HvncXGRmPdA9RpP9NoNSQhlltL62btsXwzwD7vGu+lufAXhHledb9mTC
         Urea11xzY9ejdmN/ydAHmkcXAeudwj6TxmPZHVkjLOHakQ/hwAwgMr1Tg8kbSBmagVqT
         5E/1QhcmuRTdf7e3Aeb/RDJbi9dkT8jb4BZLHEtarEdKr6cLnudLdleAYETv6pWcQXhh
         JbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCFwMYSMtt3zyTgvxaUZkKdaIIUOYosX83v1xkjfZiAluGIJ6L0TnXiKLTL/NkEBlUnRmpMiFicd+A5K9i5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUINEoXaXpUbiaf/VD+5xNaypxJ3f1d+AYDupfohX85P2chX4y
	VatFT/VHeithtFnXxoUMNEOjk/eeUXL3PAt+7s1gfGJj4EJByl4DMUYgtCpA/bs=
X-Gm-Gg: ASbGncv6MGK8gu5GeaQGT4S2DduaNdG74ZQkBMSixUHLAgDCh3P4V08RMzGWJfzq36O
	3Eh2SdebggG6ruawxRE/aVF1Uktfxi/8IJUhdVo6O7dBDn4/rKrXC7XpZUQYbkxDo0seLUERCjz
	bxZatwMmUQWXOfpk1T5qKkBi9jFdUzPmZcjlGroMSNHx82StuRqbSd8jxMT7uGoOx62VsgXRMux
	AITBZl3jPBmQxYW/CHck2HAiIRvJC6srGm8m06vyjNYJxNAmtlKq5GqR6bKjpWry9accW78uKuO
	p5xZMvy+269PkrgTsrrSarTgZeK1eQwMuHbzB738zg==
X-Google-Smtp-Source: AGHT+IHFViiSqvN/JjpJph9siMmkqqAkklZQddDpCT/0uxRK48dl3jb0Ucb0eHxYFvXN2Sctr5P1hQ==
X-Received: by 2002:a17:902:c40f:b0:227:e74a:a05a with SMTP id d9443c01a7336-22c5361d29emr158103045ad.44.1745220190470;
        Mon, 21 Apr 2025 00:23:10 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf5589sm59396595ad.102.2025.04.21.00.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:23:09 -0700 (PDT)
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
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 07/15] rust: cpu: Add from_cpu()
Date: Mon, 21 Apr 2025 12:52:14 +0530
Message-Id: <cf7c84e4fcd5ef0430d11e02cd727120ba94a248.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
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
 rust/kernel/cpu.rs              | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 33 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 12cde55579a0..475abf72869c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6155,6 +6155,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index f53d6e1a21f2..ac92c67d2c38 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/clk.h>
+#include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
new file mode 100644
index 000000000000..10c5c3b25873
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,30 @@
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
+    // SAFETY: It is safe to call `get_cpu_device()` for any CPU.
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
index f4dcfefe94be..db372f806875 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -44,6 +44,7 @@
 pub mod build_assert;
 #[cfg(CONFIG_COMMON_CLK)]
 pub mod clk;
+pub mod cpu;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514

