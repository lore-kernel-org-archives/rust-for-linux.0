Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C391F1923
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248983; cv=none; b=LDIvuQKua6DTdpcy6PFFSZZ/MbsSfhfbGDhSuq8rNYEx7d8dJe2QFsaDoDwLfqohaVa5cYBiARZI2Nj4vCo53F0fpzcEx/LKmQcXC6GIkhJVts27rNYvAcT9EWxJoLbU6I0HB69bNgm4LMR+5XqgP1WAah0Qqyq6Dm+EkoMzsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248983; c=relaxed/simple;
	bh=Rc9h13yLVCgrrxNL4T6cyPQEcXj85V3JAXSZv56F6gA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wr0qKPi1WpRvkufBm/TNai2w6geO/m/QcWagKOh9o/ZDPizHfSwbxBWqP/RU9rYAQK2/ZsBOOOUyt0VmQ7cLQt1+7M0mT2KWq+5Zhjm6mIz6cJ68SXBgGd6PGmyuOKb62EvweS5rOFuIWpRx1gNscClTzNMFVYGOhKVMj5+qPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o90wOWBU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o90wOWBU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-218c8aca5f1so30435515ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248977; x=1736853777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWmNZpR84viLWyozT1bMv5z349QTI7VLAJLcJSAQCIY=;
        b=o90wOWBUtdAaq8CVHz5K6b/5OPrtIYF9Si8nY+pWQdjxT2qrs2ipqhJUoJAZH4Aq/g
         T6XdHdnZb1T/kshxdSyy+LGz0ODiBuz2fLjNSm4C7tDwjBlQJtAveoG6ati7wVkK2lZy
         bJpcTlARCrm3mxp8tABaV7kyZTnJy+fzOJZWVpw37DbsjQ2ZMVqJsTLgUECW/ybdPRrP
         8477JH6DDNCs4e/1+Z1yaanuNgKVA+LzmYd7aqgwaksMCCYOSIbr9s/t/NicQb03rD8j
         pAx5gfrX+wMsomwm2NzFdY0mvt/D7K5BFzJ+49ZtMYxQ8ic/8MaWWFAlJWt60jxEleCU
         MVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248977; x=1736853777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWmNZpR84viLWyozT1bMv5z349QTI7VLAJLcJSAQCIY=;
        b=N5PVrgufDKc+T4xB8RL1V5AQWVW8cvO6KGrFW9rjfxSO1az+8tc9cNQaAW4Xherdvs
         qFOSXr+o9Z8nhkwCLuNpHvYnq2MvBhplsh/ZJIPTVGmEjE5+jeWe1mgKImEVhM/km82P
         qbOfBjL18R48TNwiEocVTS/VVUs9d4W3Ox7q+tzNBeXWfvJ14vQZXDlUWm/fyIC+jtE0
         MycH+CLp6KyKdCecLhqPGIqBodjISd2fbsNExSsst5Hb4SZf6BmDFPiX302/gF6YwJ+S
         BnjcgfEJ8a1fr/GvV0w7UFLNMPX9t1CJXX4QMowKSW7iJPwcOYw/GApREqVAn37lbTte
         7osA==
X-Forwarded-Encrypted: i=1; AJvYcCUkAV2hmEwyKwZaxJQeGrZlLZPVySWRR4EKK4i/nN1XNUlUiR1UHbHuZa1ciSLmS40ZO3ufm5g2NloaEBrvxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9XkevEyfjo9GRJ+GFpAiFXuMp2XBYlzuz4+QENpcyEmRzM47
	5kqKL6I6B7SCNt39mQ1nj85Ua5ltwZiWDDffxsPY1PBF/0taEsfA8qndN3iDCNM=
X-Gm-Gg: ASbGncsCfi3s/s+m6191FU4ir1LXU0zkrI0I6Bh+8KsJxPf3o5aDIoTAfwX76vgsMw7
	sJVRDqVCUhXCrgaTdNj8TbYGfh1uv7XLfbHA7ZVUS6yFk5MneCvh8SaH2pmYxd5ItHGMPoPhBIg
	uo3jyAaU0i6Bqdiv7qAh8BRsnrgzwrNRr2gwqQDZ13PmwArEw4GFDzXbMR1HWKXHwbgoadrQP09
	Yup3QC4bJ/5ED/0WXnDeCdm549lrqns25xz30ZMZZvQessbRhmB2zhWDAc=
X-Google-Smtp-Source: AGHT+IER4GmgsyFzCh7juTo0yclWoY2WARvGUsVG9seFeVWK+Rgc4sEIBzrRwArzlzjAuWi3jyNrpw==
X-Received: by 2002:a05:6a00:114b:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72abdd3c2a4mr93836644b3a.3.1736248976933;
        Tue, 07 Jan 2025 03:22:56 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb83asm32917664b3a.138.2025.01.07.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:22:56 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 13/15] rust: Extend OPP bindings with CPU frequency table
Date: Tue,  7 Jan 2025 16:51:46 +0530
Message-Id: <d2cdc1205b86fd317f42c25356969461f8e8a98e.1736248242.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736248242.git.viresh.kumar@linaro.org>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
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
index d92e88af0cec..d48f33a2ab8d 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -16,7 +16,10 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
-use core::{marker::PhantomData, ptr};
+#[cfg(CONFIG_CPU_FREQ)]
+use crate::cpufreq;
+
+use core::{marker::PhantomData, ops::Deref, ptr};
 
 use macros::vtable;
 
@@ -337,6 +340,56 @@ extern "C" fn config_regulators(
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
@@ -541,6 +594,12 @@ pub fn adjust_voltage(
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

