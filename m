Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09AD3DDDBE
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295526; cv=none; b=nFLfGBFHd8U8b75DUCIeMyzL/vCWYzyIZfB++Oe5p8/3+7Iowo6smfaERPRet/ZV4JuK+SaiQpO4qGffyF2zD6wYDncVDA2nt6oGERJqXttJNJceKl6MeaAHqjxbNLteHuOHIAQBvuS6WlKnyc/xLtEmXngqxNV9Q8V+C1BR7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295526; c=relaxed/simple;
	bh=6lHvRBJVTFISgQuhcMFypyadWLPXF+SYk/dEigk1U3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7JtX3KKKb4+E9P+DwFMEzwBUOtTL9aIzrukbvsgZWsT99se9EOmx7lhbfuBu2njBKjeI1VteL7IO38XHLE+MCk0x0+c8zpnJ/jd0BfMKHfil3yDogCKekQQr0SmmdShvB/qCQNLET9mO/HvMYkXVT11EnPQL62q4qVlXEZAbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxaGkrXG; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxaGkrXG"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38c01150eb2so27225921fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295523; x=1774900323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5L/uO+Cwo0tKAvA8esxWTY+PEV+J2o8TPXsnbML/a8=;
        b=JxaGkrXGWbiaDEpLGgDy2BtoiH8lIUGwuKlaNFuFPGaIu8aaXrQHOURBlJ/lTSotZL
         h1CrhJMZzIrvZrOrXqw6pDXJfG32Um19gJn3K7ZJtQQ4Ss5IdgUZtT7Ze2KFaRIli1K5
         /emIyP/g81bqeVbY4TyouKfwTWHUFefAisGkS1tkekjN/G1MdHM8ZieHA96xeBUsLNOK
         /zrXXhWiYStQQncA0rEgVm6cDJrYXvopgauLfNuhXnkti5CGq+lrGNVPzgZPfTizmnLP
         +zvIoUi49vuYG/bEPI0Zv1cLuyyB4soNcJHsC2zRcA0O+4u4UaUhYgrAgfLSSpI2OSrc
         OKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295523; x=1774900323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V5L/uO+Cwo0tKAvA8esxWTY+PEV+J2o8TPXsnbML/a8=;
        b=QEHeavEpbdAJxPOTmWhINtMss3xkZGhNzvPam+wbU5ydKvmgSiw0IcqfqPmHVNeBvg
         VFf1HgNewcjV3eLB4q3xXx87ngXblk+VY9XVf08uhV/BfsUs5Y+jUETwzqYMjsHBWefA
         TmLLqwgl7iPqiB1cYkBoiIPLXWyiaBElLq5VNnNSeTbFJY9y4fNnLHPiQF8EnLErhGNc
         M4MLbDip9dxXN6+ddEFkKc87tZ17Jd++3afAwfU5jXijBg9ZTneLF9HZiqNFPwuO3Ah3
         0ArTz8Z8bnAYdYseBN6m9OBQ5rFoo88QBEHrvOXPrFFyFjbOpWAHSfZFRKbHWUGy2z7h
         bCfg==
X-Forwarded-Encrypted: i=1; AJvYcCVoccxN+QZorMEaDUeuLR/LMNP4MHqm+jd7bjnTzDuk3Pf2rrlu00j49esYZZTZnUYcQ52jzYq/IWXziuoQDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2mfSgqqbQAGDYpV27k1oKIHYNhUaWo5OrU2dtOVnnHZhwjbe
	SnXVgbsWeTS8U91pLg9zvMV/cCRsnPRJo/fOE657ZDgcrQK/S69Xd5Bj
X-Gm-Gg: ATEYQzzjpgXmv0ww5cJqnjFMPRk6f+RzkJAmU3T2ltSbe6ljybGIuWdQ3BvBHtwTO2w
	g1Qk6hWqNAY7Q3XR/iC0gOPnl7yxyvoOMOyLbqqdlDKRoiobxwe7LIERkPWexzMzPEiYMw3+kQl
	6WaprOXw2hMvI4R/PchEIVTubX99afKXh/MogvcqFhzDYE4TDNgOlbkyAd2OmNr5exklxmUdGEg
	07nm/9CD/Til3ATanvdW2kMrLgj86J95wn2ZBTvkuVcoMFm/ipIb4AiZSa+N1jlUjZ/A/kY6vxv
	EfY0O62UeOPUEPGHoNhWJig/6OsZIEaIQI5mq477NHqjlvWF5Sg5LLIpfVLb3tc5cDntkjfJeIH
	BoTSRANjQWWUTnfe43GSYs49RuWfa+g5RZN46U4tcCES6meZHo+e//hkPCrQPnukt1e5JeJrhgv
	+Qv6H5avadfsdDQGbDw6OKKSlN2zIYb55sPMkhi7JtyHnweZsD0OvEbOyijlyvi3rZ4bgCqWLbu
	cnLz9w3NH50hBylZJ2DL/eJKmjS
X-Received: by 2002:a05:6512:32c6:b0:5a1:44ba:c96e with SMTP id 2adb3069b0e04-5a285b6db31mr4256387e87.38.1774295522694;
        Mon, 23 Mar 2026 12:52:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520734csm2753527e87.53.2026.03.23.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:52:02 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-watchdog@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: wim@linux-watchdog.org,
	linux@roeck-us.net,
	ojeda@kernel.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	lossin@kernel.org
Subject: [PATCH 2/2] watchdog: softdog_rs: add Rust software watchdog driver
Date: Mon, 23 Mar 2026 22:51:38 +0300
Message-ID: <20260323195138.5541-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323195138.5541-1-iprintercanon@gmail.com>
References: <20260323195138.5541-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust software watchdog driver that uses the new Rust watchdog
abstraction. This demonstrates that the abstraction is functional and
can be used to write real watchdog drivers.

The driver implements start and stop operations. Unlike the C softdog,
this simplified version does not use hrtimers for the actual countdown
-- the watchdog core handles the timeout expiry and keepalive
management. This makes it suitable as a proof-of-concept driver for the
Rust watchdog abstraction.

The driver registers as "Rust Software Watchdog" with a default timeout
of 60 seconds, matching the C softdog's defaults.

The Kconfig option SOFT_WATCHDOG_RS depends on !SOFT_WATCHDOG to
prevent both drivers from being enabled simultaneously.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/watchdog/Kconfig       | 12 +++++
 drivers/watchdog/Makefile      |  1 +
 drivers/watchdog/softdog_rs.rs | 88 ++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/watchdog/softdog_rs.rs

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d3b9df7d466b0..b7aad39f0de01 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -160,6 +160,18 @@ config SOFT_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called softdog.
 
+config SOFT_WATCHDOG_RS
+	tristate "Rust software watchdog"
+	depends on RUST && !SOFT_WATCHDOG
+	select WATCHDOG_CORE
+	help
+	  A software watchdog driver written in Rust using the Rust watchdog
+	  device abstraction. This is a simplified Rust equivalent of the
+	  C softdog driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called softdog_rs.
+
 config SOFT_WATCHDOG_PRETIMEOUT
 	bool "Software watchdog pretimeout governor support"
 	depends on SOFT_WATCHDOG && WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ba52099b12539..3039e5068f835 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -239,6 +239,7 @@ obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
 obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
+obj-$(CONFIG_SOFT_WATCHDOG_RS) += softdog_rs.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
 obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
diff --git a/drivers/watchdog/softdog_rs.rs b/drivers/watchdog/softdog_rs.rs
new file mode 100644
index 0000000000000..c8ff125e817bc
--- /dev/null
+++ b/drivers/watchdog/softdog_rs.rs
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust software watchdog driver.
+//!
+//! A simplified Rust implementation of the software watchdog, demonstrating
+//! the Rust watchdog device abstraction.
+
+use kernel::prelude::*;
+use kernel::watchdog;
+
+const DEFAULT_MARGIN: u32 = 60;
+const MAX_MARGIN: u32 = 65535;
+
+module! {
+    type: SoftdogModule,
+    name: "softdog_rs",
+    authors: ["Artem Lytkin"],
+    description: "Rust Software Watchdog Device Driver",
+    license: "GPL",
+}
+
+struct SoftdogOps;
+
+#[vtable]
+impl watchdog::WatchdogOps for SoftdogOps {
+    fn start(dev: &mut watchdog::Device) -> Result {
+        pr_info!("watchdog started (timeout={}s)\n", dev.timeout());
+        Ok(())
+    }
+
+    fn stop(_dev: &mut watchdog::Device) -> Result {
+        pr_info!("watchdog stopped\n");
+        Ok(())
+    }
+}
+
+static SOFTDOG_INFO: bindings::watchdog_info = bindings::watchdog_info {
+    options: bindings::WDIOF_SETTIMEOUT
+        | bindings::WDIOF_KEEPALIVEPING
+        | bindings::WDIOF_MAGICCLOSE,
+    firmware_version: 0,
+    identity: {
+        let mut id = [0u8; 32];
+        let s = b"Rust Software Watchdog";
+        let mut i = 0;
+        while i < s.len() {
+            id[i] = s[i];
+            i += 1;
+        }
+        id
+    },
+};
+
+static mut SOFTDOG_OPS: bindings::watchdog_ops =
+    watchdog::create_watchdog_ops::<SoftdogOps>();
+
+struct SoftdogModule {
+    _reg: watchdog::Registration,
+}
+
+impl kernel::Module for SoftdogModule {
+    fn init(module: &'static ThisModule) -> Result<Self> {
+        // SAFETY: SOFTDOG_OPS is only mutated here, before registration,
+        // and this function is called exactly once during module init.
+        let ops = unsafe { &mut *core::ptr::addr_of_mut!(SOFTDOG_OPS) };
+
+        let reg = watchdog::Registration::register(
+            module,
+            None,
+            &SOFTDOG_INFO,
+            ops,
+            DEFAULT_MARGIN,
+            1,
+            MAX_MARGIN,
+            false,
+        )?;
+
+        pr_info!("initialized (timeout={}s)\n", DEFAULT_MARGIN);
+
+        Ok(SoftdogModule { _reg: reg })
+    }
+}
+
+impl Drop for SoftdogModule {
+    fn drop(&mut self) {
+        pr_info!("exit\n");
+    }
+}
-- 
2.43.0

