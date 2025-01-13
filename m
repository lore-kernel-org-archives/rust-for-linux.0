Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0522A4D8
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767469; cv=none; b=pfOQxQa6twOq+BQGNhVn60CVnibtAxIJG55gMVU4erVpjZpbR6SzGMdwGlVCPxoD5aV3YDrZaQcSSB77qF9lHcK7v9FWCtEnlf/dwLyRxdcFS/0ErShbvIv/QYbvsA8VFV5VSSrIGiBk2d1CHW1I3eNUKED93yMozlc0ijb5fG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767469; c=relaxed/simple;
	bh=gXRpq9a3zNo2mqoc+c+AY5iNG67itiGvRui0TBLI65I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R6nHI7T1lTksZNwmHVIaONJKt5oFiQ6kwpSHDOuzQwXDrzQNSo1WoAfO1FySWH0iS5DmCEfgsTdbZmhx0u/Zdu9bXfqmTPTyvUnx6lEf15dCIktJYJB5b2b1xj9M8JIHGq57dRW1wKp0P8up4xvxExgLwwPfMGOLYu0ycvI931U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2nawjd7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2nawjd7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21634338cfdso51842205ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767467; x=1737372267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4U0fmdhazacnu5TfK3YZgG7bQEU+5HFAz9S6EWr/w=;
        b=j2nawjd7iYwPuhavM6cRF68mMSrXua7hAHPhY0ZH0QluSLNftg9a6nWmVW4tnkmv+5
         1nty+xjQWa+6n37DCzdJ9xtRrwemFAcQJtC8J7li7SiiSDRQTRTX2ReOJTgsvHWKfCTy
         J2/H0l82kzdjG5ekZ79oKClMibvn2qbaVXB5lA3MVpAxe5C//CdPJJSfd+zJvrhSFMlj
         raCXTtcKOxFm47LBd0VY6pxXajeRPdDqHzaplPyMMFN0+7eBfS69jjwnhxGGIslEQtSB
         FPRIHz5fw9P4XmYj+23BEY3xou5IleKKk/tiNBmowwrBzPyanANKEbVP1II6Q3KfxRP5
         qg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767467; x=1737372267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF4U0fmdhazacnu5TfK3YZgG7bQEU+5HFAz9S6EWr/w=;
        b=BoXJyGlBDElm7bGVB/cLYj/54QYGKJRQlrSDK6p1yWcQzTiPsj+tASqwtvNfw8w/YX
         PuJdv6uWRxv+RbCFDdWalP+y+RCp9xf0pjGptNP3gkRd0SEOJ7sYc4hxCf5GhBZZ+itD
         md5uhxirKdsQFL+GvvwOCY9Z/cIOsJncZ2JrzJDpVyy54fwm697/UpemvZY74SlwTho/
         8V5T0egJu0TP49WvZ2L0m5Cy9cvla1meNIL1sK6bzV4BfgbbYN8QLU6Jv6tLBJbjcLx6
         TWcxU89R7c3vRy2VlyrUU8DccznpTwtY0MJjKHNL216b2f2nvM8S+qr/TEnqVspRY31y
         AmGg==
X-Forwarded-Encrypted: i=1; AJvYcCUPMqwZa0xSzaLrbxHQbD78x1sQBCQOoD2clPqjGDfXbi3T08jlaVUAZ6JAg7HE8XO37rcmkbhLkPlu0UFZhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzkMCD/AJE81J6gqv7oWaxmzBrcedCLKEUPq29IYVfpHvnIXyk
	AodjgtqIFEP/wXbrNJw2UqKzRQWRBkZA2YEDus+TP9LZgBGc2dyDW9gWbxRf1IM=
X-Gm-Gg: ASbGnct9ytTqFjlT6BnKHCKHHUZwXOxMOlUmhuIwT1GzcORkdzD/RB5tBUR6nGEBC6w
	H2yqr2N0/ul6yrXUl33OgdC/ewN1DgzHsbNUtUOqrU6A14pu+jLRM2K/NaqLDFj7LoFxwd+nbpk
	gSi74hyvtZhl1k/d7Ux8uk7NGtUyx1MLjbTE79mUa7pZUL21Z8BYq4G2nABoZTPnG6T+W7q0R9M
	pGHVsc8Zt5VJnnn/1s4YD+DuVVQJ5bH9BJEEUpv8wJ/4Vk1YFedgXkwb7c=
X-Google-Smtp-Source: AGHT+IEutGiSjaMCxKF1iSM7TvMVcvoFtHqUScWeDq6/12v9Cb/p3VlYB9GXoMrO10PoJYLEx+gU2A==
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr308109125ad.35.1736767467225;
        Mon, 13 Jan 2025 03:24:27 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f233851sm51636465ad.191.2025.01.13.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:26 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
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
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 14/16] rust: Extend OPP bindings with CPU frequency table
Date: Mon, 13 Jan 2025 16:53:09 +0530
Message-Id: <47cfb24fd3c7429dc68a023a6b504e37bb13c141.1736766672.git.viresh.kumar@linaro.org>
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

This commit adds bindings for CPUFreq core related API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 22c4d543f456..147178410c60 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -16,6 +16,12 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
+#[cfg(CONFIG_CPU_FREQ)]
+use crate::cpufreq;
+
+#[cfg(CONFIG_CPU_FREQ)]
+use core::ops::Deref;
+
 use core::{marker::PhantomData, ptr};
 
 use macros::vtable;
@@ -337,6 +343,56 @@ extern "C" fn config_regulators(
     }
 }
 
+/// CPU Frequency table created from OPP entries.
+#[cfg(CONFIG_CPU_FREQ)]
+pub struct FreqTable {
+    dev: ARef<Device>,
+    table: cpufreq::Table,
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl FreqTable {
+    /// Creates new instance of [`FreqTable`] from raw pointer.
+    fn new(table: &Table) -> Result<Self> {
+        let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        to_result(unsafe {
+            bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+        })?;
+        Ok(Self {
+            dev: table.dev.clone(),
+            // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+            table: unsafe { cpufreq::Table::from_raw(ptr) },
+        })
+    }
+
+    /// Returns reference to the underlying [`cpufreq::Table`].
+    pub fn table(&self) -> &cpufreq::Table {
+        &self.table
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Deref for FreqTable {
+    type Target = cpufreq::Table;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        &self.table
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Drop for FreqTable {
+    fn drop(&mut self) {
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        unsafe { bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw()) };
+    }
+}
+
 /// Operating performance point (OPP) table.
 ///
 /// Wraps the kernel's `struct opp_table`.
@@ -541,6 +597,12 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Create cpufreq table from OPP table.
+    #[cfg(CONFIG_CPU_FREQ)]
+    pub fn to_cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Sets a matching OPP based on frequency.
     pub fn set_rate(&self, freq: usize) -> Result<()> {
         // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
-- 
2.31.1.272.g89b43f80a514

