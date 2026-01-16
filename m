Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEEB23EA86
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581276; cv=none; b=DDE+sHTtS5QowxP/EkUXsLjGEnZFnKo7oYdVI4+2saP9pRBAmx1ZFoFAIHrqMJFCTClqTUcZfAKSmESzr3/JNdoSvnUCeUeOJLeSXa0d0InUUf6lh17mINEi70GpbUMvaK+6YZZtwa81LkggeuIGn/1MQdS/pa2ZF1VE+O7WU+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581276; c=relaxed/simple;
	bh=cj85Y3tBKx9j5CGdXT8VwZoryHjrLwxUJLxGjDWTtxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJm3ogAQG82sLs6G06MuYkkalaxAZfibkVrF+fFQOhftm8e7RHhxXHl4Jp9oOzmopQn5T6aaZuItcTiOry0bWT0xjJuH3X/OgS+FFRsrPd7FzKI2VChXzzj7wukqRkJHLInodRUh3rglSesw9rjkShawrcUCeLpfb52ItWRlfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0ac29fca1so14820125ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 08:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581263; x=1769186063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VM9+8n+fCn1B1S1C76+jM9HsYxxLK0Z+XZRlXcgLx9c=;
        b=rVk5mvGXSPqsiVRhUIUEIXmOEh75AEM0pKOqulpeVyv6VRdqjHRJjhE5oCC+tBTAYH
         njSNZMXWrLfYj32CXG8p6C8esvvaOyT8lbm2t/CEEfVEVAyUDu8c4JXw9br11wFKg7w4
         EsVRjl+42C22Ps85ubid8QBzjougqXSnZYXzubgeiVA9Q1rNnQLWPAoU/UtZj2Opne/M
         LEYMGDbwDz936gGTsq6JChomaT7+20rxe8mHhWGuCzcqctoNGz2IeYRziV/6KGqaoqJD
         +z5xqqzZF8i38ZksTkLZMturoxGAJ2xNdtbM2JPku+vxM70kdRaYYwLxmJ55/9iSVHPz
         r3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYK4yPmk+eQhoaTBISDVHc0pt2YrOdOiZFqhJvoA21v1pbK5tJ4ENa/Du6DOpmqZdk5cd0t9sCf0FeZekOJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hCuapuY9EgHX/q86Hs18vkrSsPIno9Hl0m9SXasU/JH+/yMW
	Ir5HjRfUYA2hwAl9gqpfpx2nNK0Z7W1wGMQtgu/b2I3VUCCVMN/fh8Bm
X-Gm-Gg: AY/fxX4t7b4YqixH2YWDe9AZcOClOTd9pxRX3cLYlYaC+bV9iiIk3Dk2WZOXVJEwu53
	SH8sJ48a80D4pWNCy8IGlEhrZgnTh1rD+jd28IIlLj/dJWU+mzQn0mN461iu11j8l/anRYL5FKF
	jseUZ8ZNd80nAu8VFiVAazfyzlLN0Fnc+gYfac3aUJls+DakVfhRvtUCKWms8zWucSW4KVVV2xL
	GboC5oSVI4HsxM61GYZi5bMjXJsO6stDnOVDtkWcUgSNXLEXn0G3usNzMsuxxieiVkcrjG5g6HL
	7iFu2DUsR9KRSf5Q3OoWwk1f1yIK5mUMikVDHLHugCsiloZyBmaw/WmZZp7XEGQe+7eczNzWbGf
	neBFjM+l2U9es8iEuXyTaRysALS5n67liQr9S45PUJn5SRQUhXigjEay27bt66CoVGl5Cp0Juyf
	vmprlwLj8XMrNVbZZGurIRWiTy9sikommExOKzeKNGQdWD
X-Received: by 2002:a17:903:2ed0:b0:2a0:8966:7c94 with SMTP id d9443c01a7336-2a71751c67dmr29109805ad.20.1768581263413;
        Fri, 16 Jan 2026 08:34:23 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c56bsm25624555ad.92.2026.01.16.08.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:34:22 -0800 (PST)
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
Subject: [RFC PATCH v3 5/5] rust: add PL031 RTC driver
Date: Sat, 17 Jan 2026 00:34:01 +0800
Message-ID: <20260116163401.312002-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-1-sunke@kylinos.cn>
References: <20260116162203.296844-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust implementation of the PL031 RTC driver.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/Kconfig           |   9 +
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc_pl031_rust.rs | 513 ++++++++++++++++++++++++++++++++++
 3 files changed, 523 insertions(+)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983..137cea1824edd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1591,6 +1591,15 @@ config RTC_DRV_PL031
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pl031.
 
+config RTC_DRV_PL031_RUST
+	tristate "ARM AMBA PL031 RTC (Rust)"
+	depends on RUST && RTC_CLASS
+	help
+	  This is the Rust implementation of the PL031 RTC driver.
+	  It provides the same functionality as the C driver but is
+	  written in Rust for improved memory safety. The driver supports
+	  ARM, ST v1, and ST v2 variants of the PL031 RTC controller.
+
 config RTC_DRV_AT91RM9200
 	tristate "AT91RM9200 or some AT91SAM9 RTC"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6cf7e066314e1..10f540e7409b4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_RTC_DRV_PCF8583)	+= rtc-pcf8583.o
 obj-$(CONFIG_RTC_DRV_PIC32)	+= rtc-pic32.o
 obj-$(CONFIG_RTC_DRV_PL030)	+= rtc-pl030.o
 obj-$(CONFIG_RTC_DRV_PL031)	+= rtc-pl031.o
+obj-$(CONFIG_RTC_DRV_PL031_RUST)	+= rtc_pl031_rust.o
 obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
 obj-$(CONFIG_RTC_DRV_POLARFIRE_SOC)	+= rtc-mpfs.o
 obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
diff --git a/drivers/rtc/rtc_pl031_rust.rs b/drivers/rtc/rtc_pl031_rust.rs
new file mode 100644
index 0000000000000..8ae48d96d1f94
--- /dev/null
+++ b/drivers/rtc/rtc_pl031_rust.rs
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//! Rust ARM AMBA PrimeCell 031 RTC driver
+//!
+//! This driver provides Real Time Clock functionality for ARM AMBA PrimeCell
+//! 031 RTC controllers and their ST Microelectronics derivatives.
+
+use core::marker::PhantomPinned;
+use kernel::{
+    amba,
+    bindings,
+    c_str,
+    device::{
+        self,
+        Core, //
+    },
+    devres::Devres,
+    io::mem::IoMem,
+    irq::{
+        self,
+        Handler,
+        IrqReturn, //
+    },
+    prelude::*,
+    rtc::{
+        RtcDevice,
+        RtcOps,
+        RtcTime,
+        RtcWkAlrm, //
+    },
+    sync::aref::ARef, //
+};
+
+// Register offsets
+const RTC_DR: usize = 0x00; // Data read register
+const RTC_MR: usize = 0x04; // Match register
+const RTC_LR: usize = 0x08; // Data load register
+const RTC_CR: usize = 0x0c; // Control register
+const RTC_IMSC: usize = 0x10; // Interrupt mask and set register
+const RTC_RIS: usize = 0x14; // Raw interrupt status register
+const RTC_MIS: usize = 0x18; // Masked interrupt status register
+const RTC_ICR: usize = 0x1c; // Interrupt clear register
+
+// ST variants have additional timer functionality
+#[allow(dead_code)]
+const RTC_TDR: usize = 0x20; // Timer data read register
+#[allow(dead_code)]
+const RTC_TLR: usize = 0x24; // Timer data load register
+#[allow(dead_code)]
+const RTC_TCR: usize = 0x28; // Timer control register
+const RTC_YDR: usize = 0x30; // Year data read register
+const RTC_YMR: usize = 0x34; // Year match register
+const RTC_YLR: usize = 0x38; // Year data load register
+const PL031_REG_SIZE: usize = RTC_YLR + 4;
+
+// Control register bits
+const RTC_CR_EN: u32 = 1 << 0; // Counter enable bit
+const RTC_CR_CWEN: u32 = 1 << 26; // Clockwatch enable bit
+
+#[allow(dead_code)]
+const RTC_TCR_EN: u32 = 1 << 1; // Periodic timer enable bit
+
+// Interrupt status and control register bits
+const RTC_BIT_AI: u32 = 1 << 0; // Alarm interrupt bit
+#[allow(dead_code)]
+const RTC_BIT_PI: u32 = 1 << 1; // Periodic interrupt bit (ST variants only)
+
+// RTC event flags
+#[allow(dead_code)]
+const RTC_AF: u32 = bindings::RTC_AF;
+#[allow(dead_code)]
+const RTC_IRQF: u32 = bindings::RTC_IRQF;
+
+// ST v2 time format bit definitions
+const RTC_SEC_SHIFT: u32 = 0;
+const RTC_SEC_MASK: u32 = 0x3F << RTC_SEC_SHIFT; // Second [0-59]
+const RTC_MIN_SHIFT: u32 = 6;
+const RTC_MIN_MASK: u32 = 0x3F << RTC_MIN_SHIFT; // Minute [0-59]
+const RTC_HOUR_SHIFT: u32 = 12;
+const RTC_HOUR_MASK: u32 = 0x1F << RTC_HOUR_SHIFT; // Hour [0-23]
+const RTC_WDAY_SHIFT: u32 = 17;
+const RTC_WDAY_MASK: u32 = 0x7 << RTC_WDAY_SHIFT; // Day of Week [1-7] 1=Sunday
+const RTC_MDAY_SHIFT: u32 = 20;
+const RTC_MDAY_MASK: u32 = 0x1F << RTC_MDAY_SHIFT; // Day of Month [1-31]
+const RTC_MON_SHIFT: u32 = 25;
+const RTC_MON_MASK: u32 = 0xF << RTC_MON_SHIFT; // Month [1-12] 1=January
+
+/// Converts a binary value to BCD.
+fn bin2bcd(val: u8) -> u8 {
+    ((val / 10) << 4) | (val % 10)
+}
+
+/// Converts a BCD value to binary.
+fn bcd2bin(val: u8) -> u8 {
+    ((val >> 4) * 10) + (val & 0x0F)
+}
+
+/// Converts a Gregorian date to ST v2 RTC packed BCD format.
+///
+/// Returns a tuple of (packed_time, bcd_year) where packed_time contains
+/// month, day, weekday, hour, minute, and second in a single 32-bit value.
+fn stv2_tm_to_time(tm: &RtcTime) -> Result<(u32, u32)> {
+    let year = tm.tm_year() + 1900;
+    let mut wday = tm.tm_wday();
+
+    // Hardware wday masking doesn't work, so wday must be valid.
+    if !(-1..=6).contains(&wday) {
+        return Err(EINVAL);
+    } else if wday == -1 {
+        // wday is not provided, calculate it here.
+        let time64 = tm.to_time64();
+        let mut calc_tm = RtcTime::default();
+        calc_tm.set_from_time64(time64);
+        wday = calc_tm.tm_wday();
+    }
+
+    // Convert year to BCD.
+    let bcd_year =
+        (u32::from(bin2bcd((year % 100) as u8))) | (u32::from(bin2bcd((year / 100) as u8)) << 8);
+
+    let st_time = ((tm.tm_mon() + 1) as u32) << RTC_MON_SHIFT
+        | (tm.tm_mday() as u32) << RTC_MDAY_SHIFT
+        | ((wday + 1) as u32) << RTC_WDAY_SHIFT
+        | (tm.tm_hour() as u32) << RTC_HOUR_SHIFT
+        | (tm.tm_min() as u32) << RTC_MIN_SHIFT
+        | (tm.tm_sec() as u32) << RTC_SEC_SHIFT;
+
+    Ok((st_time, bcd_year))
+}
+
+/// Converts ST v2 RTC packed BCD format to a Gregorian date.
+///
+/// Extracts time components from the packed 32-bit value and BCD year register,
+/// then returns an RtcTime structure.
+fn stv2_time_to_tm(st_time: u32, bcd_year: u32) -> RtcTime {
+    let year_low = bcd2bin((bcd_year & 0xFF) as u8);
+    let year_high = bcd2bin(((bcd_year >> 8) & 0xFF) as u8);
+    let mut tm = RtcTime::default();
+    tm.set_tm_year(i32::from(year_low) + i32::from(year_high) * 100);
+    tm.set_tm_mon((((st_time & RTC_MON_MASK) >> RTC_MON_SHIFT) - 1) as i32);
+    tm.set_tm_mday(((st_time & RTC_MDAY_MASK) >> RTC_MDAY_SHIFT) as i32);
+    tm.set_tm_wday((((st_time & RTC_WDAY_MASK) >> RTC_WDAY_SHIFT) - 1) as i32);
+    tm.set_tm_hour(((st_time & RTC_HOUR_MASK) >> RTC_HOUR_SHIFT) as i32);
+    tm.set_tm_min(((st_time & RTC_MIN_MASK) >> RTC_MIN_SHIFT) as i32);
+    tm.set_tm_sec(((st_time & RTC_SEC_MASK) >> RTC_SEC_SHIFT) as i32);
+
+    // Values are from valid RTC time structures and are non-negative.
+    tm.set_tm_yday(tm.year_days());
+    tm.set_tm_year(tm.tm_year() - 1900);
+    tm
+}
+
+/// Vendor-specific variant identifier for PL031 RTC controllers.
+#[derive(Copy, Clone, PartialEq)]
+enum VendorVariant {
+    /// Original ARM version with 32-bit Unix timestamp format.
+    Arm,
+    /// First ST derivative with clockwatch mode and weekday support.
+    StV1,
+    /// Second ST derivative with packed BCD time format and year register.
+    StV2,
+}
+
+impl VendorVariant {
+    fn clockwatch(&self) -> bool {
+        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
+    }
+
+    #[allow(dead_code)]
+    fn st_weekday(&self) -> bool {
+        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
+    }
+
+    #[allow(dead_code)]
+    fn range_min(&self) -> i64 {
+        match self {
+            VendorVariant::Arm | VendorVariant::StV1 => 0,
+            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_BEGIN_0000,
+        }
+    }
+
+    #[allow(dead_code)]
+    fn range_max(&self) -> u64 {
+        match self {
+            VendorVariant::Arm | VendorVariant::StV1 => u64::from(u32::MAX),
+            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_END_9999,
+        }
+    }
+}
+
+/// The driver's private data struct. It holds all necessary devres managed
+/// resources.
+#[pin_data]
+struct Pl031DrvData {
+    #[pin]
+    regs: Devres<IoMem<PL031_REG_SIZE>>,
+    hw_variant: VendorVariant,
+}
+
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres`
+// (Send+Sync) and `VendorVariant` (Copy).
+unsafe impl Send for Pl031DrvData {}
+// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres`
+// (Send+Sync) and `VendorVariant` (Copy).
+unsafe impl Sync for Pl031DrvData {}
+
+/// Vendor-specific variant identifier used in AMBA device table.
+#[derive(Copy, Clone)]
+struct Pl031Variant {
+    variant: VendorVariant,
+}
+
+impl Pl031Variant {
+    const ARM: Self = Self {
+        variant: VendorVariant::Arm,
+    };
+    const STV1: Self = Self {
+        variant: VendorVariant::StV1,
+    };
+    const STV2: Self = Self {
+        variant: VendorVariant::StV2,
+    };
+}
+
+// Use AMBA device table for matching
+kernel::amba_device_table!(
+    ID_TABLE,
+    MODULE_ID_TABLE,
+    <Pl031AmbaDriver as amba::Driver>::IdInfo,
+    [
+        (
+            amba::DeviceId::new(0x00041031, 0x000fffff),
+            Pl031Variant::ARM
+        ),
+        (
+            amba::DeviceId::new(0x00180031, 0x00ffffff),
+            Pl031Variant::STV1
+        ),
+        (
+            amba::DeviceId::new(0x00280031, 0x00ffffff),
+            Pl031Variant::STV2
+        ),
+    ]
+);
+
+#[pin_data]
+struct Pl031AmbaDriver {
+    #[pin]
+    irqreg: irq::Registration<Pl031IrqHandler>,
+}
+
+impl amba::Driver for Pl031AmbaDriver {
+    type IdInfo = Pl031Variant;
+    const AMBA_ID_TABLE: amba::IdTable<Self::IdInfo> = &ID_TABLE;
+
+    fn probe(
+        adev: &amba::Device<Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            let dev = adev.as_ref();
+            let io_request = adev.io_request().ok_or(ENODEV)?;
+            let variant = id_info
+                .map(|info| info.variant)
+                .unwrap_or(VendorVariant::Arm);
+
+            let rtcdev = RtcDevice::<Pl031DrvData>::new(
+                dev,
+                try_pin_init!(Pl031DrvData {
+                    regs <- IoMem::new(io_request),
+                    hw_variant: variant,
+                }),
+            )?;
+
+            dev.devm_init_wakeup()?;
+
+            let drvdata = rtcdev.drvdata()?;
+            let regs = drvdata.regs.access(dev)?;
+
+            // Enable the clockwatch on ST Variants
+            let mut cr = regs.read32(RTC_CR);
+            if variant.clockwatch() {
+                cr |= RTC_CR_CWEN;
+            } else {
+                cr |= RTC_CR_EN;
+            }
+            regs.write32(cr, RTC_CR);
+
+            // On ST PL031 variants, the RTC reset value does not provide
+            // correct weekday for 2000-01-01. Correct the erroneous sunday
+            // to saturday.
+            if variant.st_weekday() {
+                let bcd_year = regs.read32(RTC_YDR);
+                if bcd_year == 0x2000 {
+                    let st_time = regs.read32(RTC_DR);
+                    if (st_time & (RTC_MON_MASK | RTC_MDAY_MASK | RTC_WDAY_MASK)) == 0x02120000 {
+                        regs.write32(0x2000, RTC_YLR);
+                        regs.write32(st_time | (0x7 << RTC_WDAY_SHIFT), RTC_LR);
+                    }
+                }
+            }
+
+            rtcdev.set_range_min(variant.range_min());
+            rtcdev.set_range_max(variant.range_max());
+
+            // This variant shares the IRQ with another block and must not
+            // suspend that IRQ line.
+            let irq_flags = if variant == VendorVariant::StV2 {
+                kernel::irq::Flags::SHARED | kernel::irq::Flags::COND_SUSPEND
+            } else {
+                kernel::irq::Flags::SHARED
+            };
+
+            if adev
+                .irq_by_index(0)
+                .and_then(|irq| irq.devm_set_wake_irq())
+                .is_err()
+            {
+                rtcdev.clear_feature(bindings::RTC_FEATURE_ALARM);
+            }
+
+            rtcdev.register()?;
+
+            Ok(try_pin_init!(Pl031AmbaDriver {
+                irqreg <- adev.request_irq_by_index(
+                    irq_flags,
+                    0,
+                    c_str!("rtc-pl031"),
+                    try_pin_init!(Pl031IrqHandler {
+                        _pin: PhantomPinned,
+                        rtcdev: rtcdev.clone(),
+                    }),
+                ),
+            }))
+        })
+    }
+}
+
+/// Interrupt handler for PL031 RTC alarm events.
+#[pin_data]
+struct Pl031IrqHandler {
+    #[pin]
+    _pin: PhantomPinned,
+    rtcdev: ARef<RtcDevice<Pl031DrvData>>,
+}
+
+impl Handler for Pl031IrqHandler {
+    fn handle(&self, dev: &device::Device<device::Bound>) -> IrqReturn {
+        // Get driver data using drvdata.
+        let drvdata = match self.rtcdev.drvdata() {
+            Ok(drvdata) => drvdata,
+            Err(_) => return IrqReturn::None,
+        };
+
+        // Access the MMIO registers.
+        let regs = match drvdata.regs.access(dev) {
+            Ok(regs) => regs,
+            Err(_) => return IrqReturn::None,
+        };
+
+        // Read masked interrupt status.
+        let rtcmis = regs.read32(RTC_MIS);
+
+        if (rtcmis & RTC_BIT_AI) != 0 {
+            regs.write32(RTC_BIT_AI, RTC_ICR);
+            self.rtcdev.update_irq(1, (RTC_AF | RTC_IRQF) as usize);
+            return IrqReturn::Handled;
+        }
+
+        IrqReturn::None
+    }
+}
+
+#[vtable]
+impl RtcOps for Pl031DrvData {
+    fn read_time(
+        rtcdev: &RtcDevice<Self>,
+        tm: &mut RtcTime,
+        parent_dev: &device::Device<device::Bound>,
+    ) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let regs = drvdata.regs.access(parent_dev)?;
+
+        match drvdata.hw_variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = regs.read32(RTC_DR);
+                let time64 = i64::from(time32);
+                tm.set_from_time64(time64);
+            }
+            VendorVariant::StV2 => {
+                let st_time = regs.read32(RTC_DR);
+                let bcd_year = regs.read32(RTC_YDR);
+                *tm = stv2_time_to_tm(st_time, bcd_year);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn set_time(
+        rtcdev: &RtcDevice<Self>,
+        tm: &RtcTime,
+        parent_dev: &device::Device<device::Bound>,
+    ) -> Result {
+        let dev: &device::Device = rtcdev.as_ref();
+        let drvdata = rtcdev.drvdata()?;
+        let regs = drvdata.regs.access(parent_dev)?;
+
+        match drvdata.hw_variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = tm.to_time64();
+                regs.write32(time64 as u32, RTC_LR);
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) = stv2_tm_to_time(tm).inspect_err(|&err| {
+                    if err == EINVAL {
+                        dev_err!(dev, "invalid wday value {}\n", tm.tm_wday());
+                    }
+                })?;
+                regs.write32(bcd_year, RTC_YLR);
+                regs.write32(st_time, RTC_LR);
+            }
+        }
+
+        Ok(())
+    }
+
+    fn read_alarm(
+        rtcdev: &RtcDevice<Self>,
+        alarm: &mut RtcWkAlrm,
+        parent_dev: &device::Device<device::Bound>,
+    ) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let regs = drvdata.regs.access(parent_dev)?;
+
+        match drvdata.hw_variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time32: u32 = regs.read32(RTC_MR);
+                let time64 = i64::from(time32);
+                RtcTime::time64_to_tm(time64, alarm.get_time_mut());
+            }
+            VendorVariant::StV2 => {
+                let st_time = regs.read32(RTC_MR);
+                let bcd_year = regs.read32(RTC_YMR);
+                *alarm.get_time_mut() = stv2_time_to_tm(st_time, bcd_year);
+            }
+        }
+
+        alarm.set_pending((regs.read32(RTC_RIS) & RTC_BIT_AI) != 0);
+        alarm.set_enabled((regs.read32(RTC_IMSC) & RTC_BIT_AI) != 0);
+
+        Ok(())
+    }
+
+    fn set_alarm(
+        rtcdev: &RtcDevice<Self>,
+        alarm: &RtcWkAlrm,
+        parent_dev: &device::Device<device::Bound>,
+    ) -> Result {
+        let dev: &device::Device = rtcdev.as_ref();
+        let drvdata = rtcdev.drvdata()?;
+        let regs = drvdata.regs.access(parent_dev)?;
+
+        match drvdata.hw_variant {
+            VendorVariant::Arm | VendorVariant::StV1 => {
+                let time64 = alarm.get_time().to_time64();
+                regs.write32(time64 as u32, RTC_MR);
+            }
+            VendorVariant::StV2 => {
+                let (st_time, bcd_year) =
+                    stv2_tm_to_time(alarm.get_time()).inspect_err(|&err| {
+                        if err == EINVAL {
+                            dev_err!(dev, "invalid wday value {}\n", alarm.get_time().tm_wday());
+                        }
+                    })?;
+                regs.write32(bcd_year, RTC_YMR);
+                regs.write32(st_time, RTC_MR);
+            }
+        }
+
+        Self::alarm_irq_enable(rtcdev, alarm.enabled(), parent_dev)
+    }
+
+    fn alarm_irq_enable(
+        rtcdev: &RtcDevice<Self>,
+        enabled: bool,
+        parent_dev: &device::Device<device::Bound>,
+    ) -> Result {
+        let drvdata = rtcdev.drvdata()?;
+        let regs = drvdata.regs.access(parent_dev)?;
+
+        // Clear any pending alarm interrupts.
+        regs.write32(RTC_BIT_AI, RTC_ICR);
+
+        let mut imsc = regs.read32(RTC_IMSC);
+        if enabled {
+            imsc |= RTC_BIT_AI;
+        } else {
+            imsc &= !RTC_BIT_AI;
+        }
+        regs.write32(imsc, RTC_IMSC);
+
+        Ok(())
+    }
+}
+
+kernel::module_amba_driver! {
+    type: Pl031AmbaDriver,
+    name: "rtc-pl031-rust",
+    authors: ["Ke Sun <sunke@kylinos.cn>"],
+    description: "Rust PL031 RTC driver",
+    license: "GPL v2",
+    imports_ns: ["RTC"],
+}
-- 
2.43.0

