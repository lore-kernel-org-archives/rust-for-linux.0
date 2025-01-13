Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E52397B5
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767474; cv=none; b=QtVwUK81OxuyfoU7Ggpd8BBgsO9rSRMh13aVUDeuRFb4+r+r+jj4kYvFy0or4J/cdVHSUwsUX+WpTmO3kOUo7Luy/NLn4ILn6F/2ZbloOz+QI2dHhY3FAMxNQmsgzUJRE5t2zxF+QNW2184KjbpviFClyKUVm1obO9dcvyiAoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767474; c=relaxed/simple;
	bh=4fg2ZGQhlYA8r3JLieZC4cnAZfBC3Xm4Z/gakVH89vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p08xHd9u+YTD7kAvsx/yLHYrYajnFk8YQDPGfyTbBQ72XbNZtE6BJxaa0G2Oy/AlTQfLnvCWPhBXxDhiJohH+gK7DaSAPpVI3412XScVpkH2VdopqjQEHTQVpWXs5C2Cl+1JlIgg+WCy5dCvhR1P4T9Z/CsdrE3rGBY0htkJuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CE3lnLRq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CE3lnLRq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216401de828so66455615ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767471; x=1737372271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze1PBk/48GQ6DBzWf8nXWZfuqwWl+q48VfNbS3eSzOI=;
        b=CE3lnLRqHs9Eb9X7xJp74egoqoGopK8sPcTTd7rFl2wDNZ4L3In1wNsVcFmCq0mg+c
         /SBbpkRbcwJe6mvdIFU5CbmcSRlCO+gXM0WqQTh3dvMR9Ac7YTfG5xkUhv+A7h/YAGpX
         3imJ3IdQq02ByE0CRScv6Y2+WisaGXQ1zWnHaVVQi6dSmu2VZhll3a8MNxN0SpRtQ0jc
         4UC0yab+n9sFdK9zFAAx2ZnceFsDtun+Xcbb7lwmV8oGvcyITYjqKfmcjk6Z2XaMILYN
         Q5otramEYCNTpELIfiI+RlnS5iWCuZ/pVVnxH2bS8VvYHE5i2juE9HLZrJG4bbx/BFnO
         N9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767471; x=1737372271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze1PBk/48GQ6DBzWf8nXWZfuqwWl+q48VfNbS3eSzOI=;
        b=N3idopXIFbC+3W+sNNQiGuDPMN6C3vV/HCRsjm5pFKa1ju0PNmJP8SzKPnW6BTfWZg
         aqju0urowYiGkY89xAMMDQiwlQQfuy5OFlMDG7Fu0IPlHNAVMdkmTEmDB+2+0OPoLSv9
         njKshs87XPm+0kXoSj3vAHGbq+RO9j9QHWZbwzFP2+ERVc4ey5GlDKD3FafSIQBrYy+p
         g6xJxKfoeqDVFL3LxKyKpl7ULj4GWo+wFo9TSAlQLkCQWPlQAVV9BXSnOGOQxZvt+/EE
         6CCcu1PHNHqeVBZFQ2QQoLJqxxttOYQZNirLDDTwx84HHNZYCtSzMpvpsstOjukfS4Hr
         hOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHCQk1vQfNKSje4xe9cyig2QMr4CDw7/psralv+BSJrA7aMtIQ9Rab5kU7XomGKwr4W81vaM5jTqLRIPWjbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXF1Y98DtRWrfEKGQH8T80cnl3Xmck6+rcSvTP08Ujuf9WSnuS
	F6vQ2z5jWMnjbQFSbwjKX59030aelQh1jAQQhgKGozcIO7H48yFaxhM+Qplzc0M=
X-Gm-Gg: ASbGncvhEhD8ETiG9wC1Zz329EHeDqfj3dPBtDsIFRAiAkzgYCM3RxiCjs6YHIak+1N
	/4ZXD5saczMWfcyCNaEiiVYZ2S+3z+zIAxgzizayQBzo7IM2dn+SPd1gCp3UHbCQhVcWPYfD0n6
	mGmnySxPJBP4tOdplEH44Cbe/hA6eLMQHab66tu7N2wFoVW4baMSwcKD7bvH4k1VkL2c/qaIURn
	UoJmjteelWfvhBlaNPiYRP3bggKqIGUtXr6vlKpvAi/AQCy++nDxOeROIY=
X-Google-Smtp-Source: AGHT+IGGqOnEWmNDriR/HLmBnXwApY2rUgwBNSNC9XvMqqfb9u5C7/4ouaI8c61RrPI+L3Fo3BBqXQ==
X-Received: by 2002:a17:902:cf0b:b0:215:431f:268a with SMTP id d9443c01a7336-21a83f647e1mr336644375ad.31.1736767471041;
        Mon, 13 Jan 2025 03:24:31 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f155e00sm51657985ad.103.2025.01.13.03.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:30 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V7 15/16] cpufreq: Add Rust based cpufreq-dt driver
Date: Mon, 13 Jan 2025 16:53:10 +0530
Message-Id: <556e67bb5c5954d7f513716fb1bae32d55918742.1736766672.git.viresh.kumar@linaro.org>
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

This commit adds a Rust based cpufreq-dt driver, which covers most of
the functionality of the existing C based driver. Only a handful of
things are left, like fetching platform data from cpufreq-dt-platdev.c.

This is tested with the help of QEMU for now and switching of
frequencies work as expected.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/Kconfig        |  12 ++
 drivers/cpufreq/Makefile       |   1 +
 drivers/cpufreq/rcpufreq_dt.rs | 230 +++++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index d64b07ec48e5..78702a08364f 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -217,6 +217,18 @@ config CPUFREQ_DT
 
 	  If in doubt, say N.
 
+config CPUFREQ_DT_RUST
+	tristate "Rust based Generic DT based cpufreq driver"
+	depends on HAVE_CLK && OF && RUST
+	select CPUFREQ_DT_PLATDEV
+	select PM_OPP
+	help
+	  This adds a Rust based generic DT based cpufreq driver for frequency
+	  management.  It supports both uniprocessor (UP) and symmetric
+	  multiprocessor (SMP) systems.
+
+	  If in doubt, say N.
+
 config CPUFREQ_VIRT
 	tristate "Virtual cpufreq driver"
 	depends on GENERIC_ARCH_TOPOLOGY
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index d35a28dd9463..db38d1d5562d 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CPU_FREQ_GOV_COMMON)		+= cpufreq_governor.o
 obj-$(CONFIG_CPU_FREQ_GOV_ATTR_SET)	+= cpufreq_governor_attr_set.o
 
 obj-$(CONFIG_CPUFREQ_DT)		+= cpufreq-dt.o
+obj-$(CONFIG_CPUFREQ_DT_RUST)		+= rcpufreq_dt.o
 obj-$(CONFIG_CPUFREQ_DT_PLATDEV)	+= cpufreq-dt-platdev.o
 obj-$(CONFIG_CPUFREQ_VIRT)		+= virtual-cpufreq.o
 
diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
new file mode 100644
index 000000000000..9f761082fa14
--- /dev/null
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust based implementation of the cpufreq-dt driver.
+
+use core::format_args;
+
+use kernel::{
+    c_str, clk, cpu, cpufreq, cpumask::Cpumask, device::Device,
+    error::code::*, fmt, macros::vtable, module_platform_driver, of, opp, platform, prelude::*,
+    str::CString, sync::Arc,
+};
+
+// Finds exact supply name from the OF node.
+fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
+    let name_cstr = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
+
+    if dev.property_present(&name_cstr) {
+        CString::try_from_fmt(fmt!("{}", name)).ok()
+    } else {
+        None
+    }
+}
+
+// Finds supply name for the CPU from DT.
+fn find_supply_names(dev: &Device, cpu: u32) -> Option<KVec<CString>> {
+    // Try "cpu0" for older DTs.
+    let name = match cpu {
+        0 => find_supply_name_exact(dev, "cpu0"),
+        _ => None,
+    }
+    .or(find_supply_name_exact(dev, "cpu"))?;
+
+    let mut list = KVec::with_capacity(1, GFP_KERNEL).ok()?;
+    list.push(name, GFP_KERNEL).ok()?;
+
+    Some(list)
+}
+
+// Represents the cpufreq dt device.
+struct CPUFreqDTDevice {
+    opp_table: opp::Table,
+    freq_table: opp::FreqTable,
+    #[allow(dead_code)]
+    mask: Cpumask,
+    #[allow(dead_code)]
+    token: Option<opp::ConfigToken>,
+    #[allow(dead_code)]
+    clk: clk::Clk,
+}
+
+struct CPUFreqDTDriver {
+    _pdev: platform::Device,
+}
+
+#[vtable]
+impl opp::ConfigOps for CPUFreqDTDriver {}
+
+#[vtable]
+impl cpufreq::Driver for CPUFreqDTDriver {
+    type Data = ();
+    type PData = Arc<CPUFreqDTDevice>;
+
+    fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
+        let cpu = policy.cpu();
+        let dev = cpu::from_cpu(cpu)?;
+        let mut mask = Cpumask::new()?;
+
+        mask.set(cpu);
+
+        let token = match find_supply_names(dev, cpu) {
+            Some(names) => Some(
+                opp::Config::<Self>::new()
+                    .set_regulator_names(names)?
+                    .set(dev)?,
+            ),
+            _ => None,
+        };
+
+        // Get OPP-sharing information from "operating-points-v2" bindings.
+        let fallback = match opp::Table::of_sharing_cpus(dev, &mut mask) {
+            Ok(()) => false,
+            Err(e) => {
+                if e != ENOENT {
+                    return Err(e);
+                }
+
+                // "operating-points-v2" not supported. If the platform hasn't
+                // set sharing CPUs, fallback to all CPUs share the `Policy`
+                // for backward compatibility.
+                opp::Table::sharing_cpus(dev, &mut mask).is_err()
+            }
+        };
+
+        // Initialize OPP tables for all policy cpus.
+        //
+        // For platforms not using "operating-points-v2" bindings, we do this
+        // before updating policy cpus. Otherwise, we will end up creating
+        // duplicate OPPs for the CPUs.
+        //
+        // OPPs might be populated at runtime, don't fail for error here unless
+        // it is -EPROBE_DEFER.
+        let mut opp_table = match opp::Table::from_of_cpumask(dev, &mut mask) {
+            Ok(table) => table,
+            Err(e) => {
+                if e == EPROBE_DEFER {
+                    return Err(e);
+                }
+
+                // The table is added dynamically ?
+                opp::Table::from_dev(dev)?
+            }
+        };
+
+        // The OPP table must be initialized, statically or dynamically, by this point.
+        opp_table.opp_count()?;
+
+        // Set sharing cpus for fallback scenario.
+        if fallback {
+            mask.set_all();
+            opp_table.set_sharing_cpus(&mut mask)?;
+        }
+
+        let mut transition_latency = opp_table.max_transition_latency() as u32;
+        if transition_latency == 0 {
+            transition_latency = cpufreq::ETERNAL_LATENCY;
+        }
+
+        let freq_table = opp_table.to_cpufreq_table()?;
+        let clk = policy
+            .set_freq_table(freq_table.table())
+            .set_dvfs_possible_from_any_cpu()
+            .set_suspend_freq((opp_table.suspend_freq() / 1000) as u32)
+            .set_transition_latency(transition_latency)
+            .set_clk(dev, None)?;
+
+        mask.copy(policy.cpus());
+
+        Ok(Arc::new(
+            CPUFreqDTDevice {
+                opp_table,
+                freq_table,
+                mask,
+                token,
+                clk,
+            },
+            GFP_KERNEL,
+        )?)
+    }
+
+    fn exit(_policy: &mut cpufreq::Policy, _data: Option<Self::PData>) -> Result<()> {
+        Ok(())
+    }
+
+    fn online(_policy: &mut cpufreq::Policy) -> Result<()> {
+        // We did light-weight tear down earlier, nothing to do here.
+        Ok(())
+    }
+
+    fn offline(_policy: &mut cpufreq::Policy) -> Result<()> {
+        // Preserve policy->data and don't free resources on light-weight
+        // tear down.
+        Ok(())
+    }
+
+    fn suspend(policy: &mut cpufreq::Policy) -> Result<()> {
+        policy.generic_suspend()
+    }
+
+    fn verify(data: &mut cpufreq::PolicyData) -> Result<()> {
+        data.generic_verify()
+    }
+
+    fn target_index(policy: &mut cpufreq::Policy, index: u32) -> Result<()> {
+        let data = match policy.data::<Self::PData>() {
+            Some(data) => data,
+            None => return Err(ENOENT),
+        };
+
+        let freq = data.freq_table.freq(index.try_into().unwrap())? as usize;
+        data.opp_table.set_rate(freq * 1000)
+    }
+
+    fn get(policy: &mut cpufreq::Policy) -> Result<u32> {
+        policy.generic_get()
+    }
+
+    fn set_boost(_policy: &mut cpufreq::Policy, _state: i32) -> Result<()> {
+        Ok(())
+    }
+
+    fn register_em(policy: &mut cpufreq::Policy) {
+        policy.register_em_opp()
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <CPUFreqDTDriver as platform::Driver>::IdInfo,
+    [
+    (of::DeviceId::new(c_str!("operating-points-v2")), ())
+    ]
+);
+
+impl platform::Driver for CPUFreqDTDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(pdev: &mut platform::Device, _id_info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+        cpufreq::Registration::<CPUFreqDTDriver>::new_foreign_owned(
+            pdev.as_ref(),
+            c_str!("cpufreq-dt"),
+            (),
+            cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
+            true,
+        )?;
+
+        let drvdata = KBox::new(Self { _pdev: pdev.clone() }, GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+}
+
+module_platform_driver! {
+    type: CPUFreqDTDriver,
+    name: "cpufreq_dt",
+    author: "Viresh Kumar <viresh.kumar@linaro.org>",
+    description: "Generic CPUFreq DT driver",
+    license: "GPL v2",
+}
-- 
2.31.1.272.g89b43f80a514

