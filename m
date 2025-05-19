Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD126B2BF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638521; cv=none; b=E7wLrsHnMA3mSbDrhd631ww6C/Ek4IgNc1H+LqXGPTxv1h/WPMZfJJTkZy2Xn+O3orrKXpd18G432yuWHroU7teL9GWmD/PT2p66Mk0m2c6d+dvmEuJ2UfVfczS1ALEWNN1HbObM0IkCZkJYetWuwGQ0vKZoQhxIACBKYM5EI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638521; c=relaxed/simple;
	bh=QB1NDnIN2+10EfH7zVK4+js+l6z1NvQ0KLDj/lkYjH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXc0miy0HX/0tAXAweKU/BSjeRN1jGFb3uCRxPySQbqpsYaAFMPHOE4Q5NRAfQH+jGRhjAMuoDcJgzX6gca/twMiB1LWeryQYPWJh1X/c/egMu3/6bIyAAdZk7iGGDCvRF5xJhvs4arbVeVSt3Y7if5plOoM0GIVdSHyemIJQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+cGX1l+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+cGX1l+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231f5a7baa2so15113665ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 00:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638519; x=1748243319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV8iUMBX+j7TsKW8lH5BBlCVzlR9XbeiRbiHVvWBeLs=;
        b=O+cGX1l++cFgpf0MJm1qSDy7j8sY3gwFAhZiW6UaS2xgQSqUCvK6PNz+2/VXJCT0ch
         PzRG8QT+RhDAe1Ci4DPdXatS/MJ4v+/qqd+O/EfrFDdtsPsrwOljQwV+BSvK1BRzd7FT
         1oleRszUJDnkcHmZQOge1VvOLKkrM57M2Tbj/cJHQumD6rW6B8t3UKr4usLP3Z1oCVs/
         pdbp2OMQrW3hep+hrHwtp/BP3L9axskR1tUeCYcE43N0tVffVuK8keEt4mR8wD7mlepE
         mneUVrDBtRLUOPoi23YuJhlSuyozokCi4sOtLBXJb9pjPvIynnMX5Gff8PFl0tUgKTIu
         Cz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638519; x=1748243319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV8iUMBX+j7TsKW8lH5BBlCVzlR9XbeiRbiHVvWBeLs=;
        b=Pm0M7V3bBb1ZPhLRhqebSJJC83EA7w871eGVvd44ymKc0+TPy9Ebn4Ey4xwM8syWeI
         Wf0WjwbzVysI/yLiDYKvcRp9kA2e6fQgY/2TIjBqpkC+GgwZfeEEKf3MhFSBvzl2bUwg
         6A2sLbWgvHff0ya+o+eMokizdrkwmo//fwZaM4PUtAezEtMAQJJ0r6NNHgtJVcQQDCog
         VHW/b14AkRNabauRPbC4qrs597PuyT4WG1TbZkHbx8pqzO39Hpm8wLAysG+l+x/imqSU
         RJTM4t7EzVaUBOZxY1u//5dzsnjRpyTCk85RwKKMxFSWoM6oMWmmzXoENOZ0vJ/uXUHx
         woQg==
X-Forwarded-Encrypted: i=1; AJvYcCUsOtVbvSVPfVvu8/jqgmYidlnK3nxKkYf8D0hxmhTXjY8vjUO65QWaK3QVtu4mOvICaoI3w5MKb1rroTHGFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziNPN4JnFvWpt8zNFf0EXJlw+0iWdGcCS3g3BuD2sXVTyjcXZB
	gtldexfiDCEcux5qQzagRdHKHGgYSEa1+amy/yE4/8RjjVraPMJdcJWi4z8xCVxQfcA=
X-Gm-Gg: ASbGncujNahooTKxJiufDlTt7Sh00VNGwKkSzINlvR1yPAeC8Ra+W9kp3AVk68fV5bg
	GUzABKhuJjl1o/I4aKd4vKeFk0QtjyXVQ+XZAkBzxc9o3jZQvQ40fPN5tyxgfL4aWrIcT13EPYH
	Fvc/gTwuL5qY8gqsdRaRH20vp817exFcq2mh1nXcOLwfJtvDradOJKJvq42+FI6x5Tae3vuk/Ia
	heN3Yi9ATd4e0BXaIL4YSYZ/YiSzuKN1KZt2UK1LRMQalCOdAmVWZXKcd2edvmtcsoe3spEukAk
	hobbvM6o3hctZcAzrq05xKdQv0OiRBV6+kziOtg0VSby5FM+7NZxjO6lb1cA3cw=
X-Google-Smtp-Source: AGHT+IHEjkPhd0v9dHUnrSumRKqtP+XO8qTwXgH5hnKDzbAp7zerm30lnT7DxIhX8VkHWyBQkdAPVw==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr161226955ad.0.1747638518855;
        Mon, 19 May 2025 00:08:38 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eba368sm53296525ad.200.2025.05.19.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:38 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
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
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 14/15] rust: opp: Extend OPP abstractions with cpufreq support
Date: Mon, 19 May 2025 12:37:19 +0530
Message-Id: <f4a35fcc3c4f6b737bbd359854ea12f5a53bcb37.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the OPP abstractions to include support for interacting with the
cpufreq core, including the ability to retrieve frequency tables from
OPP table.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 7be6fd33d93f..1e5fd9887b3a 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -19,6 +19,69 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
+#[cfg(CONFIG_CPU_FREQ)]
+/// Frequency table implementation.
+mod freq {
+    use super::*;
+    use crate::cpufreq;
+    use core::ops::Deref;
+
+    /// OPP frequency table.
+    ///
+    /// A [`cpufreq::Table`] created from [`Table`].
+    pub struct FreqTable {
+        dev: ARef<Device>,
+        ptr: *mut bindings::cpufreq_frequency_table,
+    }
+
+    impl FreqTable {
+        /// Creates a new instance of [`FreqTable`] from [`Table`].
+        pub(crate) fn new(table: &Table) -> Result<Self> {
+            let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+            // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
+            // requirements.
+            to_result(unsafe {
+                bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+            })?;
+
+            Ok(Self {
+                dev: table.dev.clone(),
+                ptr,
+            })
+        }
+
+        /// Returns a reference to the underlying [`cpufreq::Table`].
+        #[inline]
+        fn table(&self) -> &cpufreq::Table {
+            // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+            unsafe { cpufreq::Table::from_raw(self.ptr) }
+        }
+    }
+
+    impl Deref for FreqTable {
+        type Target = cpufreq::Table;
+
+        #[inline]
+        fn deref(&self) -> &Self::Target {
+            self.table()
+        }
+    }
+
+    impl Drop for FreqTable {
+        fn drop(&mut self) {
+            // SAFETY: The pointer was created via `dev_pm_opp_init_cpufreq_table`, and is only
+            // freed here.
+            unsafe {
+                bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw())
+            };
+        }
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+pub use freq::FreqTable;
+
 use core::{marker::PhantomData, ptr};
 
 use macros::vtable;
@@ -753,6 +816,13 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Creates [`FreqTable`] from [`Table`].
+    #[cfg(CONFIG_CPU_FREQ)]
+    #[inline]
+    pub fn cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Configures device with [`OPP`] matching the frequency value.
     #[inline]
     pub fn set_rate(&self, freq: Hertz) -> Result<()> {
-- 
2.31.1.272.g89b43f80a514

