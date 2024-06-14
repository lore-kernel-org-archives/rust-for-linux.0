Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD21474D0
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718346516; cv=none; b=CtSCUD2zGSefBwZe4DiUQ8HGy74idnKRHVLi57khAi64hlNDOBA/7Kwn8pg/GqGK0H8r3XnOu1iCGajBC1gE/BacpXOnkEm51vTZYccjhWFb+vpWSWMBGX9gBZmsVkijMPBR9K3rASENwlxdHBQteezQ8AdslQLSzws1EKyYwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718346516; c=relaxed/simple;
	bh=PS5cem+qRDnvp+e/EOpgrOGaKynV1htId32lFedCazc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/UMVHKu/tdLYLHps8WC+Grs1/+px7d1oG8IxBlyMSInc62gk1n2dSjwkww/TK6d8pp/OWQnxtaKj5NgBsCjGbnclt2cnEmGtA3B7iYNqudIr38ZvD9taBe0/C8bJw7w2+8MzElKyilieqROySLNoUla1ttJeDeh+fl8hr2diN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wX2adr7E; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wX2adr7E"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e4dbca52f0so1346993a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718346514; x=1718951314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j9YP0QMC7AMbtIpknDppp8RmGp1sowHm9sta2f+DQZg=;
        b=wX2adr7E70nnqKGkxOT9px+UbwF6f6gLPLSVlOa10E7zaFeMKC073dC9y6LjcVZB0S
         7m3N2R/0ITI9SbdXW/g0qHkeytZtlyDtvui67gR0eW2wrAWRNDNRlcUf8nbU7T5lh/BL
         3vTA7PprB5iIlK+3GU+OYEJSilDYo5pX39+UC7xQfZsD1R9+qUyDVNqEI3f1QQkBuAcX
         V4PRthwvSXFQCSL+JJCVCjv/G0wA3mN6h6rd5cxFdWTjUvNIDLS7QdSizy1S6Z9XK5OE
         ygEOgWa4LSQUvkSKN/wDzoaPSBng+Uia9Im/R7Su7tv85K3N1ed2rtjc/GBUWp5ZJ8HF
         LTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718346514; x=1718951314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9YP0QMC7AMbtIpknDppp8RmGp1sowHm9sta2f+DQZg=;
        b=t9XmYHcaKWvrMdyBUizHCfLaI3KBg46hAPyoGhpedQ8L6J2svgeSgXGS3Gyu6RkoB2
         W3w+w0iPl9laVaG75VuKBxgHsdGlbCMMG+EJhhd0zJWNtAdLnNsgSWiToxLETNMbDe/r
         5r7LIHTxj0YYaYAbVvolaUGxe5EpTuug0Gps72qdz9mvBT6vOSn6ZE4cQ0f3Wz8WMgJ4
         ln6Pqc4OZAEMGMzv4XnlzGGjZ9ynzX/TBmQgRxaTEFxpeBwu+UH1qLgpBQyufl830q+H
         jtGEpGtddOEimo18f8LbLcD/6wUPI0Gp3L3EGrKjchJnDfw1rAtFRmbA9GIEpiPmvs9M
         +f1w==
X-Forwarded-Encrypted: i=1; AJvYcCXPYabDKB+F/zciKBF17f85us/Np+tCUPkHfx21j/ma+0Q2+sBq2YcKbEI1GkZ7N/fUpttfXcoJ3OzObVeW72F2upTsOfPHLLuVyaHq1LE=
X-Gm-Message-State: AOJu0Yzjv6G1ZfJtK/NK2zBbpaMadODOo3IUT5GTYLb68eOv4g/ucJ/P
	EHH4kjqdwjKVhFY72C5ELExjtfwMN/ITxD7m2GG3/XMkQ/C7K2Mbcps7pAh5hZc=
X-Google-Smtp-Source: AGHT+IEu0pOnPe4iZ0k7YMgoRcpPg8HzyUQH6rJSlbEe1dKh8Ef4of72JCl6VQTXjVtSAM3r3fr5eg==
X-Received: by 2002:a17:90a:bb04:b0:2c1:aefa:1e7f with SMTP id 98e67ed59e1d1-2c4db13239dmr1942134a91.3.1718346513679;
        Thu, 13 Jun 2024 23:28:33 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75d1d40sm5212891a91.9.2024.06.13.23.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 23:28:33 -0700 (PDT)
Date: Fri, 14 Jun 2024 11:58:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH V2 1/8] rust: Add initial bindings for OPP framework
Message-ID: <20240614062830.pfy4v66o7wubekna@vireshk-i7>
References: <cover.1717750631.git.viresh.kumar@linaro.org>
 <e74e3a14e6da3f920cee90d32a023ba4805328a0.1717750631.git.viresh.kumar@linaro.org>
 <CAH5fLgjChZCtTUnHVHJat-sXFyLVE+MgDXrNDiUD0LNsUndpBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjChZCtTUnHVHJat-sXFyLVE+MgDXrNDiUD0LNsUndpBQ@mail.gmail.com>

Thanks Alice for reviewing.

On 07-06-24, 12:51, Alice Ryhl wrote:
> > +    /// Removes a dynamically added OPP.
> > +    pub fn remove(dev: ARef<Device>, freq: u64) {
> > +        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
> > +        // requirements.
> > +        unsafe { bindings::dev_pm_opp_remove(dev.as_raw(), freq) };
> > +    }
> 
> Also, why are these methods defined on OPP when they appear to be
> methods on Device and don't take any OPP argument?

I have changed them slightly to match what they are supposed to look
like and implemented them as method on the data itself.

All other comments are incorporated in the following diff:

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
new file mode 100644
index 000000000000..b26e39a74635
--- /dev/null
+++ b/rust/kernel/opp.rs
@@ -0,0 +1,182 @@
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
+/// # Invariants
+///
+/// The pointer stored in `Self` is non-null and valid for the lifetime of the ARef instance. In
+/// particular, the ARef instance owns an increment on underlying object’s reference count.
+#[repr(transparent)]
+pub struct OPP(Opaque<bindings::dev_pm_opp>);
+
+// SAFETY: `OPP` only holds a pointer to a C OPP, which is safe to be used from any thread.
+unsafe impl Send for OPP {}
+
+// SAFETY: `OPP` only holds a pointer to a C OPP, references to which are safe to be used from any
+// thread.
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
+    /// Creates a reference to a [`OPP`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`OPP`] reference.
+    pub unsafe fn from_raw_opp_owned<'a>(ptr: *mut bindings::dev_pm_opp) -> Result<&'a Self> {
+        // SAFETY: The caller guarantees that the pointer is not dangling
+        // and stays valid for the duration of 'a. The cast is okay because
+        // `OPP` is `repr(transparent)`.
+        Ok(unsafe { &*ptr.cast() })
+    }
+
+    /// Creates a reference to a [`OPP`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`OPP`] reference.
+    pub unsafe fn from_raw_opp<'a>(ptr: *mut bindings::dev_pm_opp) -> Result<&'a Self> {
+        let opp = unsafe { Self::from_raw_opp_owned(ptr) }?;
+
+        // Take an extra reference to the OPP since the caller didn't take it.
+        opp.inc_ref();
+        Ok(opp)
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
+
+impl Drop for OPP {
+    fn drop(&mut self) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::dev_pm_opp_put(self.as_raw()) }
+    }
+}


-- 
viresh
