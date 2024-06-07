Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10F15ECDC
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751585; cv=none; b=aGiMe6bt0LZ2qSHO/ZJivnV5jdP7oq7Aq8Z7CnDjZzcafPrDB3hdMZ4FBi9wIRzeuEVMVhK8McbsGvlrxlJgnlLPx9ISmcVYus3Se2ifK7CDm9iKVte9j9rjAKC4XwN7nq/Hp2BvJbCmD2zuTl06Rod9IK8s3Tb/aePbcUNyKUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751585; c=relaxed/simple;
	bh=Y+dnDpoPgLDQbxi2D26tM1HhdBJGHB5DyqDp5BgM3qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lZzlXzw/UOU3aOGRMw4+wiVbRbfJf6HoLneIKpf7J8OkOq0ZvWg4O1dLyg+d58RNb739ruAxJ7tFJvFpBYruoS1ksJwoJp80DIjpA/sGUEi82NxHgrLWBeaKFhYXB8PZ6GgGf04Sro6QIQMxJCiujWKYvhcGCcn5vu2vySe8Ab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UijrZEoU; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UijrZEoU"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so1534891a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717751583; x=1718356383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCjoSclVWZT0iDBq8VFLkZOWwHf6tFEcHjugFV93b9U=;
        b=UijrZEoU5H2jKL+3r85xZOL8CZZlKZ3iHSAjm3NlzVBPUD6ODH0IVGld654yG/jER9
         4a5GV7BB8q7s3UIoG0VEr+2M38kb8GM/7b4nC16r3tKdQJ+1VJ5yRoYgxfOY5VbIdkan
         85RIERByXSas46utrRwy8zmPTqCSV5cwV7RAFYGbEBG3LarzmI3tdL4H5fxPWFQHubPc
         jJMEk4Tlfz1hVKjQ5WJNSlN+xg5m7YPQRTtzcPByC1cmyeS/3alKBa5RXQ21oW8b3Ofz
         oqzqBTjayUf6EQCG6nSHi/7YfiYotyOaEUv3KEY55r679jvpFpsDhQ+uM50yXMaK7uLW
         8wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717751583; x=1718356383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCjoSclVWZT0iDBq8VFLkZOWwHf6tFEcHjugFV93b9U=;
        b=DzHRVlzfgwdlN+ZW1aT2XA9vI5xTTZgKgmba6WihyFVBnWABUJXC9/tlsBu3bchXam
         n3ZftuptsH/J6WUb0mBxwxkwuOjR02y4UMCcsZPR1T0YMOxBH16jfpudmq4d7EY5qeUj
         RPehJtdNohHXVyqaNVCiwgldqlZ1bVSWz+UfP+sM2KVqiJ7ZF/1k1SNC64V82/G1FKUY
         g3MaXdIIPwo2hZVr2aDTItUzJEC2jj60Mfmw9S5EZXMI6LrdS2Z1doaPqxE1mex8uTk1
         1pxOkumwh/15tVy28mo/9n0NLQ+LeWygtGZS+x2UR+iX+i9viUtM9lhT/9QMK976ceZG
         HYzA==
X-Forwarded-Encrypted: i=1; AJvYcCXZXg5fEpz1S8EDEKVJJh2QyhYP7lK2iRvS0BS7ZU6xujC4RABEV5462aMwLIPrHBztuxGIWR9512IJfg3ys9uU1LFqdBrEso4laSjljKY=
X-Gm-Message-State: AOJu0YwH/gJkQPAXVY2CPeM1nYD2/d5cllzbdDoFRUvRwrSnXCbYmaVq
	8aDk9DWz++IXEpJFX4SGliLlJLv6dYNfLXPrWMUNqrf1igBjVxc6NZPSlgU+jpU=
X-Google-Smtp-Source: AGHT+IEynFUinI3X2Ts6k+rw9ZruxT15CQaIWnniA8Pyq/ymZo56xbDZgdazaXXsdaS1AQtNJabJEw==
X-Received: by 2002:a05:6a21:19a:b0:1b4:4370:60f with SMTP id adf61e73a8af0-1b443700773mr422429637.1.1717751582668;
        Fri, 07 Jun 2024 02:13:02 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7d89a0sm29256535ad.128.2024.06.07.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 02:13:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
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
Subject: [RFC PATCH V2 7/8] rust: Extend OPP bindings with CPU frequency table
Date: Fri,  7 Jun 2024 14:42:22 +0530
Message-Id: <6e703e990bd1ce864927060c53025506568fd0b8.1717750631.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1717750631.git.viresh.kumar@linaro.org>
References: <cover.1717750631.git.viresh.kumar@linaro.org>
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
 rust/kernel/opp.rs | 61 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index ebcb77b52558..4833848f79b1 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -15,7 +15,10 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
-use core::{ffi::c_char, marker::PhantomData, ptr};
+#[cfg(CONFIG_CPU_FREQ)]
+use crate::cpufreq;
+
+use core::{ffi::c_char, marker::PhantomData, ops::Deref, ptr};
 
 use macros::vtable;
 
@@ -343,6 +346,56 @@ extern "C" fn config_regulators(
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
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_ptr()) };
+    }
+}
+
 /// Operating performance point (OPP) table.
 ///
 /// # Invariants
@@ -538,6 +591,12 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Create cpufreq table from OPP table.
+    #[cfg(CONFIG_CPU_FREQ)]
+    pub fn to_cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Sets a matching OPP based on frequency.
     pub fn set_rate(&self, freq: u64) -> Result<()> {
         // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
-- 
2.31.1.272.g89b43f80a514

