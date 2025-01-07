Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE561F03E6
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248966; cv=none; b=tHFJ+16jcCMMtg3oj0kPx/5ATwJWy3fLM33LPuk5bpcLqZ7ND6S1p415aL62IjFewwJ44YBCtA9G9YCDvJ0jHl7DczcYhJ3MsChEw1xYYcJUhbbP3xXU5URau0krNm5c0OBUX+13S2Hn6yL7yZrdqFzJYo1nqm3bwcKnOuzZPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248966; c=relaxed/simple;
	bh=Jqg7fwBqpqUrLupU+GoHJ8ZmmvBudfetMXF9lCHmPr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X7HEPRQJbTrJAhurgL1faufZ5W3bCbolWc0zp08aG5yLHveSL8S8N3eKhy/Zan5LpRuEjm+Zao79TCDCJuEiJsBEQ5fnzac7+OX5HjOfch5zD4TZ7hRlExtOzczeZwBTkV0ygR4UkK/FHpNI4wL+MA7ZHKJ7XHcAzQV8txCjQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQF2MTt8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQF2MTt8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f42992f608so18049990a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 03:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248962; x=1736853762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9PYiqAAwWzcCmpxxf4V/OEPTTpQN5PiQ7upbr9V67w=;
        b=VQF2MTt8+W46uZjWj9xLJKG6h/rWYLBhUNp79BkZMPp9I/sFo2hga1DnpM8WJEG6Ch
         y4dYvXQ+3/qt6H9XQ9rLdR/bEZB3U5sceZgFYqaAcnhJm0wDd0dTV8hR1OzaZim03JnJ
         /6R/0sSpdY0iL2hXLXcd54Iae7FNH97YyYHPsI1q0yscIcjWirxydsSUsf579wurMQ0d
         dx0g7JAHESh9H3oqh1T2A+EPrCngaMXeZnFbpm4a+skfZeE+AtGSnY/NvYshhRwz+JPK
         NbUKSQZgtCciokUHAXZbIXkL/KCPnZToKmIaB1zmXiUxGFFyyfN6pjISmGUROvRKVrr1
         uFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248962; x=1736853762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9PYiqAAwWzcCmpxxf4V/OEPTTpQN5PiQ7upbr9V67w=;
        b=Qge9NckxtA2pJQFaCi/blcCF6rOhMSflE6qN+FT+QBfRfd1GqyW7P51cndwM4ZpDSs
         7mZdlvePPDO2+wLJQzJ7ynF5F+yYjtWmgt1i1Onpw1D67biuaGRm8wsxq5qBrSCU/rth
         iywQWgEbL+WHJ8jts8LYalKGlYLlMkx4UI4QkYnpuc4FV4C4G5XJP4nkQigHnV/ERs7S
         +SHCGUSj8a672DgBO+3QLzP4ZNB3TxuQrLOfpEAnBrZbgEAwFcCN3P8co4TdlbDDw+Pq
         q6vMNPgHGcQRD5V1pmXNPnCpHFBnVxZ9slWvbhhqez3PcNraLazrqg1psae5Q3sEPvAP
         ynYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqY4MxENuZZ62ku1smwJmE2sG6j7rr8nErob2zjBqBTsY2kzrUNUeOrBBpc9IgDOKLvPOGypc+TBG+JW5txA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuqisiw1hCujdoQmWJ3FkiMzyi1MRsexyDQp3vVxCTh19Sgsfy
	QTyque6hrWxGTrd+8PXri2OqzG4hU2AbIx6LRb74WvBskQXsb/IQev1HcZacdK4=
X-Gm-Gg: ASbGnct2nd1ZPno/JmDSGOcxLia5AVq4NKwgDHqAqGuyg/fulkUgNOvS06911GJLp65
	JAYlkg2/HDwoxtZaz23HuTRHOagO+583wKwhXM2NaqrE+zIdTud3xL25NRxgQd4lm3HuH4PAQZl
	VSf/14NWDChOJ0fJhSQS36LXaNN5oITkkhYn3O/bD8ey6NTYoJgEPwckw4gmjOdSAkRkcwb0ryA
	KAI/p9Uc16Q0WxYsQ3Ii+bIJcUjz4bdXuuDwGciJbgLHSnWj//gKxRXHW4=
X-Google-Smtp-Source: AGHT+IGLMB2Dy0ALPRN6hD7BmnHs4wEpU9CRbUfIR7eyL9mhrOQXlIlm9tREIHI6CxYbMKnVelbMRQ==
X-Received: by 2002:a17:90b:2808:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f452ec6f07mr92663199a91.24.1736248961958;
        Tue, 07 Jan 2025 03:22:41 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm308789695ad.172.2025.01.07.03.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:22:41 -0800 (PST)
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
Subject: [PATCH V6 09/15] rust: Extend OPP bindings for the configuration options
Date: Tue,  7 Jan 2025 16:51:42 +0530
Message-Id: <5d8c65513238e2b2de33a15566577adef03923c4.1736248242.git.viresh.kumar@linaro.org>
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

This extends OPP bindings with the bindings for the OPP core
configuration options.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 262 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 260 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index b1e277c660d4..d92e88af0cec 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -10,11 +10,28 @@
     bindings,
     cpumask::Cpumask,
     device::Device,
-    error::{code::*, from_err_ptr, to_result, Error, Result},
+    error::{code::*, from_err_ptr, from_result, to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+    prelude::*,
+    str::CString,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
-use core::ptr;
+use core::{marker::PhantomData, ptr};
+
+use macros::vtable;
+
+// Creates a null-terminated slice of pointers to Cstrings.
+fn to_c_str_array(names: &[CString]) -> Result<KVec<*const u8>> {
+    // Allocated a null-terminated vector of pointers.
+    let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
+
+    for name in names.iter() {
+        list.push(name.as_ptr() as _, GFP_KERNEL)?;
+    }
+
+    list.push(ptr::null(), GFP_KERNEL)?;
+    Ok(list)
+}
 
 /// Dynamically created Operating performance point (OPP).
 pub struct Token {
@@ -79,6 +96,247 @@ pub enum SearchType {
     Ceil,
 }
 
+/// Implement this trait to provide OPP Configuration callbacks.
+#[vtable]
+pub trait ConfigOps {
+    /// Called by the OPP core to configure OPP clks.
+    fn config_clks(_dev: &Device, _table: &Table, _opp: &OPP, _scaling_down: bool) -> Result<()> {
+        kernel::build_error(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Called by the OPP core to configure OPP regulators.
+    fn config_regulators(
+        _dev: &Device,
+        _opp_old: &OPP,
+        _opp_new: &OPP,
+        _data: *mut *mut bindings::regulator,
+        _count: u32,
+    ) -> Result<()> {
+        kernel::build_error(VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// Config token returned by the C code.
+pub struct ConfigToken(i32);
+
+impl Drop for ConfigToken {
+    fn drop(&mut self) {
+        // SAFETY: Its safe to return the configuration token number previously received from the C
+        // code.
+        unsafe { bindings::dev_pm_opp_clear_config(self.0) };
+    }
+}
+
+/// Equivalent to `struct dev_pm_opp_config` in the C Code.
+#[derive(Default)]
+pub struct Config<T: ConfigOps> {
+    clk_names: Option<KVec<CString>>,
+    prop_name: Option<CString>,
+    regulator_names: Option<KVec<CString>>,
+    supported_hw: Option<KVec<u32>>,
+    required_dev: Option<ARef<Device>>,
+    required_dev_index: Option<u32>,
+    _data: PhantomData<T>,
+}
+
+impl<T: ConfigOps> Config<T> {
+    /// Creates a new instance of [`Config`].
+    pub fn new() -> Self {
+        Self {
+            clk_names: None,
+            prop_name: None,
+            regulator_names: None,
+            supported_hw: None,
+            required_dev: None,
+            required_dev_index: None,
+            _data: PhantomData,
+        }
+    }
+
+    /// Initializes clock names.
+    pub fn set_clk_names(mut self, names: KVec<CString>) -> Result<Self> {
+        // Already configured.
+        if self.clk_names.is_some() {
+            return Err(EBUSY);
+        }
+
+        if names.is_empty() {
+            return Err(EINVAL);
+        }
+
+        self.clk_names = Some(names);
+        Ok(self)
+    }
+
+    /// Initializes property name.
+    pub fn set_prop_name(mut self, name: CString) -> Result<Self> {
+        // Already configured.
+        if self.prop_name.is_some() {
+            return Err(EBUSY);
+        }
+
+        self.prop_name = Some(name);
+        Ok(self)
+    }
+
+    /// Initializes regulator names.
+    pub fn set_regulator_names(mut self, names: KVec<CString>) -> Result<Self> {
+        // Already configured.
+        if self.regulator_names.is_some() {
+            return Err(EBUSY);
+        }
+
+        if names.is_empty() {
+            return Err(EINVAL);
+        }
+
+        self.regulator_names = Some(names);
+
+        Ok(self)
+    }
+
+    /// Initializes required devices.
+    pub fn set_required_dev(mut self, dev: ARef<Device>, index: u32) -> Result<Self> {
+        // Already configured.
+        if self.required_dev.is_some() {
+            return Err(EBUSY);
+        }
+
+        self.required_dev = Some(dev);
+        self.required_dev_index = Some(index);
+        Ok(self)
+    }
+
+    /// Initializes supported hardware.
+    pub fn set_supported_hw(mut self, hw: KVec<u32>) -> Result<Self> {
+        // Already configured.
+        if self.supported_hw.is_some() {
+            return Err(EBUSY);
+        }
+
+        if hw.is_empty() {
+            return Err(EINVAL);
+        }
+
+        self.supported_hw = Some(hw);
+        Ok(self)
+    }
+
+    /// Sets the configuration with the OPP core.
+    pub fn set(self, dev: &Device) -> Result<ConfigToken> {
+        let (_clk_list, clk_names) = match &self.clk_names {
+            Some(x) => {
+                let list = to_c_str_array(x)?;
+                let ptr = list.as_ptr();
+                (Some(list), ptr)
+            }
+            None => (None, ptr::null()),
+        };
+
+        let (_regulator_list, regulator_names) = match &self.regulator_names {
+            Some(x) => {
+                let list = to_c_str_array(x)?;
+                let ptr = list.as_ptr();
+                (Some(list), ptr)
+            }
+            None => (None, ptr::null()),
+        };
+
+        let prop_name = match &self.prop_name {
+            Some(x) => x.as_char_ptr(),
+            None => ptr::null(),
+        };
+
+        let (supported_hw, supported_hw_count) = match &self.supported_hw {
+            Some(x) => (x.as_ptr(), x.len() as u32),
+            None => (ptr::null(), 0),
+        };
+
+        let (required_dev, required_dev_index) = match &self.required_dev {
+            Some(x) => (x.as_raw(), self.required_dev_index.unwrap()),
+            None => (ptr::null_mut(), 0),
+        };
+
+        let mut config = bindings::dev_pm_opp_config {
+            clk_names,
+            config_clks: if T::HAS_CONFIG_CLKS {
+                Some(Self::config_clks)
+            } else {
+                None
+            },
+            prop_name,
+            regulator_names,
+            config_regulators: if T::HAS_CONFIG_REGULATORS {
+                Some(Self::config_regulators)
+            } else {
+                None
+            },
+            supported_hw,
+            supported_hw_count,
+
+            required_dev,
+            required_dev_index,
+        };
+
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements. The OPP core guarantees to not use fields of `config`, after this call has
+        // returned and so we don't need to save a copy of them for future use
+        let ret = unsafe { bindings::dev_pm_opp_set_config(dev.as_raw(), &mut config) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ConfigToken(ret))
+        }
+    }
+
+    // Config's config_clks callback.
+    extern "C" fn config_clks(
+        dev: *mut bindings::device,
+        opp_table: *mut bindings::opp_table,
+        opp: *mut bindings::dev_pm_opp,
+        _data: *mut core::ffi::c_void,
+        scaling_down: bool,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: 'dev' is guaranteed by the C code to be valid.
+            let dev = unsafe { Device::get_device(dev) };
+            T::config_clks(
+                &dev,
+                // SAFETY: 'opp_table' is guaranteed by the C code to be valid.
+                &unsafe { Table::from_raw_table(opp_table, &dev) },
+                // SAFETY: 'opp' is guaranteed by the C code to be valid.
+                unsafe { OPP::from_raw_opp(opp)? },
+                scaling_down,
+            )
+            .map(|()| 0)
+        })
+    }
+
+    // Config's config_regulators callback.
+    extern "C" fn config_regulators(
+        dev: *mut bindings::device,
+        old_opp: *mut bindings::dev_pm_opp,
+        new_opp: *mut bindings::dev_pm_opp,
+        regulators: *mut *mut bindings::regulator,
+        count: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: 'dev' is guaranteed by the C code to be valid.
+            let dev = unsafe { Device::get_device(dev) };
+            T::config_regulators(
+                &dev,
+                // SAFETY: 'old_opp' is guaranteed by the C code to be valid.
+                unsafe { OPP::from_raw_opp(old_opp)? },
+                // SAFETY: 'new_opp' is guaranteed by the C code to be valid.
+                unsafe { OPP::from_raw_opp(new_opp)? },
+                regulators,
+                count,
+            )
+            .map(|()| 0)
+        })
+    }
+}
+
 /// Operating performance point (OPP) table.
 ///
 /// Wraps the kernel's `struct opp_table`.
-- 
2.31.1.272.g89b43f80a514

