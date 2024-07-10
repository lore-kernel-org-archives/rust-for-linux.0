Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4913C689
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jul 2024 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609572; cv=none; b=PJaTFWH9niqzF1q2Iie8dHRWYKRfkhPpflUcA77njp+2eYrhR2FbJdq/nA810RMWoYBw9reQs8JhURfkNMTr8g129OhzuDbKXhzMT0KTOZJYWPCxJ/oEgi4+brFRxH0oC9JviZ3AdCxslSGCKX0IrW9alkww7JvjFzhuRxDYoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609572; c=relaxed/simple;
	bh=WIA4TotBcO1wv97QgOlFDGMdA0xJxoIGnpOGFJOKzBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXSkSwo2xRjGGVKVU0wRpj4vaAXMMZSGbzRgFWCRtmdF3VEjpJsJMvW6PAFvmMQ5XXCIut9J62xcNn834ERaUhk0WPgRROGs+QEcd/daM5C0UaiOE8UQcy0itPzWmdMlPaT2JR/TY3RNlJMjkplmS7TjTukf9us8/5jIe1kt+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AqLIaNjW; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AqLIaNjW"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7f3d2d441e4so205225939f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jul 2024 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720609570; x=1721214370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjxciFMY6AgSQrZA4JvBx90yFCzozg1YraYrNNx6v74=;
        b=AqLIaNjWBWeabxpLY1ukZAIpYYfTGtnFlGX8+y5S2jOBCjbWn1vhwtUkEOOU9QHNQ1
         0jFQepDj+KqkOcJvvIU0OOCqnn1faPJcY0Mi1hauSejEcyUJfFUss+O86HTu8roN5DsX
         3xavaDrJX9zwNhH0c7G6P19O4wGQ6BhYWxQoJbn2BFOCIbgZS6lKad5H76dEshmWIpYg
         rg/xPTjqQxDXRUhSZzjAZ57HobqYBOsvJlM8hcUEwcBZiqbjPtLHdesScIIuYRernxjH
         Q7vrxEnnJFOeBilIPWtGfsbKLrLfZJbC4vOJI79yWd4nQrlOX9HzNhm6iINwoAaL4F3s
         HCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609570; x=1721214370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjxciFMY6AgSQrZA4JvBx90yFCzozg1YraYrNNx6v74=;
        b=j3OfsjdnOlEcSHC3jr9ZO8fR3EJHH3FgUiT5zkIL0e7sm4FLqQQRtoDOjioDYE2KBj
         WAN2gAMWaCzxUeD3FSLWScpHjcmACD4iNCtOwkwkwWc6PLNjJ3+lPtLgiDm11MV7SvvW
         cD0q42PrFLRakqEhhqAkFL+QFBsuC0GkcROwp6VkYBGfJ94xpeYTn7sfaP1J9Xagl04a
         PUbFYJX/X3jNPej05Nv/ZJfuD2nGElJuvkweYbjNNVnCQJqGaHmx+z3wOHsfPTPgOzQV
         DH29qtSsNzBZ9nxH+E6hh2BdJ/RO+8340nETyQSN2A24KeDcanpB3Eouus8gUGXzy66h
         9MFw==
X-Forwarded-Encrypted: i=1; AJvYcCXDa2HxBMDbs6PcZrWBZ29kDcj1VjmnqoGrKjvFv4kFOolejWbmtY+fpbGHXBrWf3h/PiaFYYOmIwZXNGmaKCcVruA8BmSfLQ2iF9SCkd8=
X-Gm-Message-State: AOJu0YzY/C/WXrjx2NyB+uOuAI1zhcftJdCb/1oZbqzprUXKlKOO21OS
	VaGVLATsJGUYDnHrsu7C8MpJywsEDk4EubswOXXMZVtg3oFhrgm7XJ8Le41ww/Q=
X-Google-Smtp-Source: AGHT+IHHP3HRmd2EsbjwI9w2/6NbkfIvEI56qh5hn64SFjwqYpPsYUkoeA8UyLo/iqLrjDRTr6bMEg==
X-Received: by 2002:a05:6602:6d1a:b0:7f7:96e3:ef23 with SMTP id ca18e2360f4ac-7ffffe21f1cmr705146739f.2.1720609570390;
        Wed, 10 Jul 2024 04:06:10 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d66bc0fdasm2695879a12.62.2024.07.10.04.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:06:09 -0700 (PDT)
Date: Wed, 10 Jul 2024 16:36:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH V3 1/8] rust: Add initial bindings for OPP framework
Message-ID: <20240710110607.jywoxf3wnkze2ouu@vireshk-i7>
References: <cover.1719990273.git.viresh.kumar@linaro.org>
 <fe8e9a96b29122876346fc98a6a9ede7e4f28707.1719990273.git.viresh.kumar@linaro.org>
 <ZoVvn0QCSR8y4HQJ@Boquns-Mac-mini.home>
 <20240709110245.o73xnrj6jsvz2v2w@vireshk-i7>
 <Zo13PB-fZ8B9WEYy@boqun-archlinux>
 <20240710073623.qdxatsqvumkguabp@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710073623.qdxatsqvumkguabp@vireshk-i7>

On 10-07-24, 13:06, Viresh Kumar wrote:
> I am not entirely sure what the change must be like that :)

Anyway, I have looked around and made some changes. Please see how it
looks now. Thanks Boqun.

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
new file mode 100644
index 000000000000..2ef262c4640a
--- /dev/null
+++ b/rust/kernel/opp.rs
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Operating performance points.
+//!
+//! This module provides bindings for interacting with the OPP subsystem.
+//!
+//! C header: [`include/linux/pm_opp.h`](srctree/include/linux/pm_opp.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{code::*, to_result, Result},
+    types::{ARef, AlwaysRefCounted, Opaque},
+};
+
+use core::ptr;
+
+/// Dynamically created Operating performance point (OPP).
+pub struct Token {
+    dev: ARef<Device>,
+    freq: u64,
+}
+
+impl Token {
+    /// Adds an OPP dynamically.
+    pub fn new(dev: &ARef<Device>, mut data: Data) -> Result<Self> {
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        to_result(unsafe { bindings::dev_pm_opp_add_dynamic(dev.as_raw(), &mut data.0) })?;
+        Ok(Self {
+            dev: dev.clone(),
+            freq: data.freq(),
+        })
+    }
+}
+
+impl Drop for Token {
+    fn drop(&mut self) {
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        unsafe { bindings::dev_pm_opp_remove(self.dev.as_raw(), self.freq) };
+    }
+}
+
+/// Equivalent to `struct dev_pm_opp_data` in the C Code.
+#[repr(transparent)]
+pub struct Data(bindings::dev_pm_opp_data);
+
+impl Data {
+    /// Creates new instance of [`Data`].
+    pub fn new(freq: u64, u_volt: u64, level: u32, turbo: bool) -> Self {
+        Self(bindings::dev_pm_opp_data {
+            turbo,
+            freq,
+            u_volt,
+            level,
+        })
+    }
+
+    /// Adds an OPP dynamically. The OPP is freed once the [`Token`] gets freed.
+    pub fn add_opp(self, dev: &ARef<Device>) -> Result<Token> {
+        Token::new(dev, self)
+    }
+
+    fn freq(&self) -> u64 {
+        self.0.freq
+    }
+}
+
+/// Operating performance point (OPP).
+///
+/// Wraps the kernel's `struct dev_pm_opp`.
+///
+/// The pointer stored in `Self` is non-null and valid for the lifetime of the `OPP` instance.
+///
+/// # Refcounting
+///
+/// Instances of this type are reference-counted. The reference count is incremented by the
+/// `dev_pm_opp_get()` function and decremented by `dev_pm_opp_put`. The Rust type `ARef<OPP>`
+/// represents a pointer that owns a reference count on the OPP.
+///
+/// A reference to the `OPP`, `&OPP` isn't refcounted by the Rust code. The C code guarantees that
+/// the pointer stored in `OPP` is is valid for the lifetime of the reference and hence refcounting
+/// isn't required.
+
+#[repr(transparent)]
+pub struct OPP(Opaque<bindings::dev_pm_opp>);
+
+// SAFETY: It is okay to send ownership of `OPP` across thread boundaries and `OPP::dec_ref` can be
+// called from any thread.
+unsafe impl Send for OPP {}
+
+// SAFETY: It's OK to access `OPP` through shared references from other threads because we're
+// either accessing properties that don't change or that are properly synchronised by C code.
+unsafe impl Sync for OPP {}
+
+// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
+unsafe impl AlwaysRefCounted for OPP {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::dev_pm_opp_put(obj.cast().as_ptr()) }
+    }
+}
+
+impl OPP {
+    /// Creates an owned reference to a [`OPP`] from a valid pointer.
+    ///
+    /// The refcount is incremented by the C code and will be decremented by `dec_ref()` when the
+    /// ARef object is dropped.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and OPP's refcount is incremented.
+    pub unsafe fn from_raw_opp_owned(ptr: *mut bindings::dev_pm_opp) -> Result<ARef<Self>> {
+        let ptr = ptr::NonNull::new(ptr).ok_or(ENODEV)?;
+
+        // SAFETY: The safety requirements guarantee the validity of the pointer.
+        Ok(unsafe { ARef::from_raw(ptr.cast()) })
+    }
+
+    /// Creates a reference to a [`OPP`] from a valid pointer.
+    ///
+    /// The refcount is not updated by the Rust API unless the returned reference is converted to
+    /// an ARef object.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the duration of 'a.
+    pub unsafe fn from_raw_opp<'a>(ptr: *mut bindings::dev_pm_opp) -> Result<&'a Self> {
+        // SAFETY: The caller guarantees that the pointer is not dangling and stays valid for the
+        // duration of 'a. The cast is okay because `OPP` is `repr(transparent)`.
+        Ok(unsafe { &*ptr.cast() })
+    }
+
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::dev_pm_opp {
+        self.0.get()
+    }
+
+    /// Returns the frequency of an OPP.
+    pub fn freq(&self, index: Option<u32>) -> u64 {
+        let index = index.unwrap_or(0);
+
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_get_freq_indexed(self.as_raw(), index) }
+    }
+
+    /// Returns the voltage of an OPP.
+    pub fn voltage(&self) -> u64 {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_get_voltage(self.as_raw()) }
+    }
+
+    /// Returns the level of an OPP.
+    pub fn level(&self) -> u32 {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_get_level(self.as_raw()) }
+    }
+
+    /// Returns the power of an OPP.
+    pub fn power(&self) -> u64 {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_get_power(self.as_raw()) }
+    }
+
+    /// Returns the required pstate of an OPP.
+    pub fn required_pstate(&self, index: u32) -> u32 {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_get_required_pstate(self.as_raw(), index) }
+    }
+
+    /// Returns true if the OPP is turbo.
+    pub fn is_turbo(&self) -> bool {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it.
+        unsafe { bindings::dev_pm_opp_is_turbo(self.as_raw()) }
+    }
+}
