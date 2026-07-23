Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738C4963A9
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823375; cv=none; b=dFlA6Fh4KleM8TUn04lbHQpGo60oyan3zyw+YdKdu4BXT/BPak2iujOkS/wd2rHx7VEKa5JN6xEvG4j56JEnWYryD+MjEvuiMY5s1v51VYvJkVo+h3udGM74IaOAVJ0R7AQh19DT7tXGjxQ4ON0dj2zhr2FCadMv54b55cLsL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823375; c=relaxed/simple;
	bh=aF9Eskw4wP/Mk/gPSa+pEH/ArdSYufriaP9yc1cpeXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTau6gXBuruW7x4C7cG8y0hr69wvOqo5a5DpZuixkjy4+E5OaYNn2jId6Wr+mSy1T8xd+TBzktklCZ529cL8GkcPWsHYHl6wgXLc+C6v5kdPgVJUgNEnXLFy1Yur/rO66NaLJi5JkAY2+Wzg+z36coaiyJM9VM1czdzYvTBNZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhXUGKDn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhXUGKDn"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso838870e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823356; x=1785428156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSFkoNus/+V1J3x0Yh+fiQrb5iWsjELtWkobo5nQNog=;
        b=YhXUGKDnYPOidm1tunISKVa8tG5krDw3PGbI0TrgM3XCrpwHXRtDymperxSuyQRnGj
         HSV2YrfKo1N+dwTK8b48HOwTW6DuVy9S67wUq30n97Ax2nie9WV9ln5NNLZNFQckHlry
         wR9u16NGY1Ob2KXL5KysaH1+Gh5YjIB7AcQW50d5ch9ctjQfWN3YmUTQEY3XnT/m1wZr
         18tpfQVjDo2AaC8mad+xwM8UoaBbXOsiyxaDkr0YW+K3yjM43+DM4P/z6+SyGTDLuyRE
         AH4fooC+vZLaGc48tHLS8C+jfqnu0Q0tpYKL4eNOqmcBoiH4cfuD7CP7bKr7GMwLMxv7
         gpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823356; x=1785428156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSFkoNus/+V1J3x0Yh+fiQrb5iWsjELtWkobo5nQNog=;
        b=VmlzPu+z65ohkmB44OoRENy2YsXP27tOr2GK1Ox5pc9lLHQCc4DzZ+AfffDlIBu2Ve
         PSz0EytX5Q/mOZnDLFUQ//RXCkcFvW1EpDsJzNAgSyV0Vi5OmOF9GAXyBJF9hK2CQn70
         HkdICPDcQwnfoGW4XaWbKEvZQ8wW6wOSY19693TLlhwXg1EqmqA5BnhTYNs3mJeU0Dvf
         e2vEtIpYo22KknEio4HAkTjnZ5xigeBi3EyW2bT4+RLfyrxepggbM9B9QGfWCLHkctCD
         sDNsyECZ0pW70cJn/5LN+5tnxnl4bCGWjrz2toUrCP7o45wRkFuAJPXk4x3DEYu9KqL2
         11kw==
X-Forwarded-Encrypted: i=1; AHgh+RqWDcjPArQFNlvFK96LHaYaf6E3Xr4HBPwDPcTHSE7bdsK2gcyMWWWNj+61bjb1JKTCC2S03g+EoYNa9x/sxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJuKVDximTvVWZq1KH9coq/od6l65QUT3Apuv49rIPu1wWy0k2
	2M4M0+YcXA6vq4LohGnZXT2mq1TVTKrgmcwiG7eJgoaLnj1Bm/ExjAog
X-Gm-Gg: AR+sD10Hs/78VwLB4ZpptmguUa4ATob3qoXngEIEizCtf3HwucsHgoZ01yy83CPyz6o
	bbdDIiseVXmdOnRjzj7IEOYqnJsXAvkIDG+Z1zLH19G0UuGhQv3DEgZwuXQ2YefI3FEhfwSflRI
	V2Q3W5aIS47goBJx+mZbLCrJP0K0442I4dsmYvAJO2e5O2tYnM0coe8xynaEr+lzsbiGmwsUzVb
	tFwQNcZpjtoV/gexaNmOpoh9hrE4iCEoSAG+Ds3hScgdVvlotMBW+b3MHkcFbvyf+xb0lNVAPUu
	3/L9evK4Xkbwy3yfUyhGjA+6ysUBGJqAo8mCzfxc/jTXexgcgKQujM6gO8KxBKf/WNahrE9xivT
	zkcTgvLO5tQOkROHOAxDDymJlzdmhctt0Em3o3hBaWiayisBp+sQ8WoNAVf6gKjv+DJwlE4TYMW
	FWHfoI22OZEZioVejEftuIAZQfvvFgJ0UmWTpNmvh+sklnN53nvy2mnoVcbFY9BhZ3ATaiYJfsr
	6Z7
X-Received: by 2002:a05:6512:3d21:b0:5b1:5fe4:6f64 with SMTP id 2adb3069b0e04-5b2b2f77bddmr912875e87.45.1784823355629;
        Thu, 23 Jul 2026 09:15:55 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm9875561fa.41.2026.07.23.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:15:55 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-watchdog@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ojeda@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	lossin@kernel.org
Subject: [PATCH v2 3/3] watchdog: softdog_rs: add Rust software watchdog driver
Date: Thu, 23 Jul 2026 19:15:29 +0300
Message-ID: <20260723161529.23759-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723161529.23759-1-iprintercanon@gmail.com>
References: <20260723161529.23759-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust software watchdog driver using the Rust watchdog
abstraction, functionally equivalent to the core of the C softdog
driver.

An hrtimer is armed on start and re-armed on every keepalive ping for
the currently configured timeout. If userspace stops pinging, the
timer expires and the system is restarted via emergency_restart(),
matching the C softdog default behaviour. Stopping the watchdog
cancels the timer. The timer handle is protected by a mutex since
watchdog callbacks may run concurrently.

Two implementation notes:

  - Re-arming cancels the previous timer before starting it again
    (the hrtimer handle API cancels on drop), so a ping can briefly
    block on a concurrently firing callback and there is a tiny
    disarmed window during re-arm. A future handle restart API would
    eliminate this.

  - The C softdog pins the module manually while the timer is armed;
    this driver gets equivalent protection from the watchdog core,
    which holds the module reference while the device is open or the
    hardware watchdog is marked running, so module unload is blocked
    while the timer is armed.

The timeout is adjustable from userspace via WDIOC_SETTIMEOUT; since
the driver has no set_timeout operation, the watchdog core updates the
timeout directly and the new value takes effect on the next ping.

The Kconfig option uses SOFT_WATCHDOG=n (rather than !SOFT_WATCHDOG,
which would still allow both as modules) so that the C and Rust
software watchdogs are mutually exclusive.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/watchdog/Kconfig       |  12 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/softdog_rs.rs | 143 +++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/watchdog/softdog_rs.rs

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 08cb8612d41fe..7dcbb285c6f16 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -160,6 +160,18 @@ config SOFT_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called softdog.
 
+config SOFT_WATCHDOG_RS
+	tristate "Rust software watchdog"
+	depends on RUST && SOFT_WATCHDOG=n
+	select WATCHDOG_CORE
+	help
+	  A software watchdog driver written in Rust using the Rust watchdog
+	  device abstraction. This is a Rust equivalent of the C softdog
+	  driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called softdog_rs.
+
 config SOFT_WATCHDOG_PRETIMEOUT
 	bool "Software watchdog pretimeout governor support"
 	depends on SOFT_WATCHDOG && WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index bc1d52220f223..397b16d648eca 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -236,6 +236,7 @@ obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
 obj-$(CONFIG_NCT6694_WATCHDOG) += nct6694_wdt.o
 obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
+obj-$(CONFIG_SOFT_WATCHDOG_RS) += softdog_rs.o
 obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
 obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
diff --git a/drivers/watchdog/softdog_rs.rs b/drivers/watchdog/softdog_rs.rs
new file mode 100644
index 0000000000000..45fd76c4fd195
--- /dev/null
+++ b/drivers/watchdog/softdog_rs.rs
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust software watchdog driver.
+//!
+//! A software watchdog implemented with an hrtimer: when the timer expires
+//! before the next keepalive ping, the system is restarted.
+//!
+//! C version of this driver:
+//! [`drivers/watchdog/softdog.c`](srctree/drivers/watchdog/softdog.c)
+
+use kernel::{
+    impl_has_hr_timer, new_mutex,
+    prelude::*,
+    reboot,
+    sync::{Arc, ArcBorrow, Mutex},
+    time::{
+        hrtimer::{
+            ArcHrTimerHandle, HrTimer, HrTimerCallback, HrTimerCallbackContext, HrTimerPointer,
+            HrTimerRestart, RelativeMode,
+        },
+        Delta, Monotonic,
+    },
+    watchdog::{self, flags},
+};
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
+/// The countdown state: the hrtimer and the handle of its last arming.
+///
+/// Watchdog callbacks may run concurrently (for example the reboot notifier
+/// `stop` against an in-flight ioctl), so the handle is protected by a
+/// mutex.
+#[pin_data]
+struct Softdog {
+    #[pin]
+    timer: HrTimer<Self>,
+    #[pin]
+    handle: Mutex<Option<ArcHrTimerHandle<Softdog>>>,
+}
+
+impl Softdog {
+    fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            timer <- HrTimer::new(),
+            handle <- new_mutex!(None),
+        })
+    }
+
+    /// (Re)arms the countdown to fire in `timeout` seconds.
+    fn arm(this: &Arc<Self>, timeout: u32) {
+        let mut guard = this.handle.lock();
+        // Drop the previous handle first: dropping a handle cancels the
+        // timer, so this must not happen after the new arming.
+        *guard = None;
+        *guard = Some(this.clone().start(Delta::from_secs(i64::from(timeout))));
+    }
+
+    /// Cancels the countdown.
+    fn disarm(this: &Arc<Self>) {
+        // Dropping the handle cancels the timer and also breaks the
+        // reference cycle `Softdog -> handle -> Arc<Softdog>`.
+        *this.handle.lock() = None;
+    }
+}
+
+impl_has_hr_timer! {
+    impl HasHrTimer<Self> for Softdog {
+        mode: RelativeMode<Monotonic>, field: self.timer
+    }
+}
+
+impl HrTimerCallback for Softdog {
+    type Pointer<'a> = Arc<Self>;
+
+    fn run(_this: ArcBorrow<'_, Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+        pr_crit!("Initiating system reboot\n");
+        reboot::emergency_restart();
+        // Only reached if the machine failed to restart.
+        HrTimerRestart::NoRestart
+    }
+}
+
+struct SoftdogOps;
+
+#[vtable]
+impl watchdog::WatchdogOps for SoftdogOps {
+    type Data = Arc<Softdog>;
+
+    fn start(dev: &watchdog::Device, data: &Arc<Softdog>) -> Result {
+        Softdog::arm(data, dev.timeout());
+        Ok(())
+    }
+
+    fn ping(dev: &watchdog::Device, data: &Arc<Softdog>) -> Result {
+        Softdog::arm(data, dev.timeout());
+        Ok(())
+    }
+
+    fn stop(_dev: &watchdog::Device, data: &Arc<Softdog>) -> Result {
+        Softdog::disarm(data);
+        Ok(())
+    }
+}
+
+static SOFTDOG_INFO: watchdog::Info = watchdog::Info::new(
+    flags::SETTIMEOUT | flags::KEEPALIVEPING | flags::MAGICCLOSE,
+    "Rust Software Watchdog",
+);
+
+struct SoftdogModule {
+    _reg: watchdog::Registration<SoftdogOps>,
+}
+
+impl kernel::Module for SoftdogModule {
+    fn init(module: &'static ThisModule) -> Result<Self> {
+        let data = Arc::pin_init(Softdog::new(), GFP_KERNEL)?;
+
+        let options = watchdog::Options {
+            timeout: DEFAULT_MARGIN,
+            min_timeout: 1,
+            max_timeout: MAX_MARGIN,
+            // Stop the countdown on reboot so that an orderly reboot is not
+            // interrupted by the watchdog firing, like the C softdog does.
+            stop_on_reboot: true,
+            ..Default::default()
+        };
+
+        let reg = watchdog::Registration::register(module, None, &SOFTDOG_INFO, &options, data)?;
+
+        pr_info!("initialized (timeout={}s)\n", DEFAULT_MARGIN);
+
+        Ok(SoftdogModule { _reg: reg })
+    }
+}
-- 
2.43.0

