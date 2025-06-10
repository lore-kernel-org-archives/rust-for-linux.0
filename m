Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5925F976
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749535636; cv=none; b=rP1O/CogRavPv+cho4Pm8yv9eDsgLQ6gY4R36T9Ech9so67rdqXttpSgoUoi1unrPVZiBVofw9pK+o2Dp/5nEawfKVMZJvgFJmH0P90IWv2EiKEIA3nQS918PHWxtAScR2C4EMm1nYTlz2bvCtBlB4BbQrp/3XJHFYAjQ2ta5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749535636; c=relaxed/simple;
	bh=XwXiRt86eO6Z08U36Jg5tCgioJ9USW3mTvybqYJavGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHAm/5lb+AyZv1oUDiBANCn7lJz1MskoRBdGDk/HdGoXDX49U/Wrc4ttvfBPmPYAcxyMB3oOdqp2LJxPRHA9lgbWrUBblzTKphns2t6iE/pdAsmLyvaZDMBEkah/fYf4/6NAvDjwACoq8O6yF2aUaViSvdwe/t+W0JBA3SW7c3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZeYye4U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZeYye4U"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso61757925ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Jun 2025 23:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749535634; x=1750140434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PiMB9loAyI7zHuhM8FFDPe/yYPAeoSIIsSW8tDplE54=;
        b=EZeYye4UzPvn6NMEAD34DSbLLLXwg355JnA3Aba4Fclv0EaN5yuXjEsN1okmpmUciv
         hc6J8fLYVOBLduOT5e3YLKGFyLfhIUMPSUutSED9jGDd7KeplaYji6m2a9moGdJhgtWa
         cc/1mufQLWJfeMEO7KJ8oKEJo+K+QDfT1dRyQUMQyVSaga8z+tIGVYWxOuBz9yMrmWZO
         Dn8FAlL4grWnd3vT8R/kwb1i4ogzI+Fl19jVl2o9uNPteG+WuxzQwFTw0sV8gvi4Zh2D
         WryNsZDRGTygEDuU7TGgIZfS8Fn9qAlgetjJR9cqtrD4AcGVqy/uUHV2WUQXai58o/hR
         1dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749535634; x=1750140434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiMB9loAyI7zHuhM8FFDPe/yYPAeoSIIsSW8tDplE54=;
        b=qFv6Y8iRr3fAdWQaPfKUMvMAFSxQKS3vLDK2Sjbz8cTVYgq51YXkmp6mU3F2uD+qak
         k/sBnqH+gsdINWOvaZXuzRdtMqRCUg1xa7tLN4dkl1Ibwbqk5YDb1kv2wl6y0lqyezzT
         JzZ21LuHOsHSoRFR+UYO4x79bVb9UT2VuOMA+HhQMPEZuil/I2aSQ5fc8f+Z+rVqSzWX
         NzM9eL62AyamuInoarGf6QSLOBD6O0w7vj8URYxnR8POcyB6uijg1D5jKN/NJkO+mNaL
         pJb9IfqgdoNQW5psZewPuIqFbhGstebgpMmq4UHbcoo/1BVxYmWvByK0t4kMD1mY5xE8
         UFYg==
X-Forwarded-Encrypted: i=1; AJvYcCVqFKsED/jiVcsWD12f9waT0G2phQm2O/E66v6H00h16EChWhxGNboV45IdktMrvTNzV4aqVyhTXxBFq9NCTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCKHL6Fpw6+FyT9bOsp+9X4VAtn+PdRwDVwS3JzXVY1i7/1WR
	C5IUT73Px8L4DvBk9EDr7PF6lGz/6+MpuCUjPKkyKlvh//WWdRMdQpGdi3RqDmIQH1Q=
X-Gm-Gg: ASbGncutGyUD+7SOqzu2MIzaHQPpxLnkTjoDIRexoHk8kTKPvNGwyTyTCv7kdR0Hijh
	kHnm4VWrqunVk6Oie1wexAu7Rf3okRxE7MsGryDH1vZ1cvk+JP1IhRVuwN5e3mnzcxHH3PrcVkH
	iWez3X+saf5lnIR5W/ZbflmADtAO+lT4SIAIH02gwB4VD4RYTBdZEbwoMshKBi+bbYeAr46H9P8
	jTOOpKvXccUHjwTA+1iTmmzjj2XbPSViWK4N7K7IEioiDghUvb5an0NsfRVQV68AM0TYInqMsE7
	vBSex2E1ODNSA1G7loUGZxOZSAgPaBHVWfyxTYa0A+9jOkYcqde9qqHNFnb5NXE=
X-Google-Smtp-Source: AGHT+IGdw0nDavLnt56auXrEYAYyoP+CfV2lWh/8m/OcjPKOsmFycFz7hs46rzzXEiiRo4i5bH27qg==
X-Received: by 2002:a17:902:d547:b0:234:9ffb:840a with SMTP id d9443c01a7336-23601dec31emr215029875ad.50.1749535634333;
        Mon, 09 Jun 2025 23:07:14 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm63867705ad.165.2025.06.09.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:07:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:37:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610060711.zp6lua4kcwi2z777@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>

Thanks Miguel for the feedback.

On 09-06-25, 14:01, Miguel Ojeda wrote:
> On Mon, Jun 9, 2025 at 12:51 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +    pub unsafe fn from_i32_unchecked(id: i32) -> Self {
> 
> Why do we need the `i32` versions?
> 
> Is it just for `bios_limit_callback`? If so, I would just convert there.

It looked like that there are few interfaces in the kernel which
accept an `i32` CPU ID. One example is cpumask layer, where
`cpumask_set_cpu()` expects an `unsigned int` but
`cpumask_{clear|test}_cpu()` expects an `int`.

Though the only user of the `i32` version for now is
`bios_limit_callback`, which I can handle without it too.

What do you suggest ?

> Relatedly, why isn't that callback's type `c_int` on the Rust side?

Sorry, not sure I understood that. Are you talking about type of the
`cpu` argument ?

    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int

> Finally, can we add a `debug_assert!()` on the `_unchecked()` variant,
> since it is something we can easily check?

Changes so far:

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 68d7d86df27c..8d48946090e3 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -23,11 +23,11 @@ pub fn nr_cpu_ids() -> u32 {

 /// The CPU ID.
 ///
-/// Represents a CPU identifier as a wrapper around an `u32`.
+/// Represents a CPU identifier as a wrapper around an [`u32`].
 ///
 /// # Invariants
 ///
-/// The CPU ID must always lie within the range `[0, nr_cpu_ids())`.
+/// The CPU ID lies within the range `[0, nr_cpu_ids())`.
 ///
 /// # Examples
 ///
@@ -54,6 +54,9 @@ impl CpuId {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_i32_unchecked(id: i32) -> Self {
+        debug_assert!(id >= 0);
+        debug_assert!((id as u32) < nr_cpu_ids());
+
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id as u32)
     }
@@ -63,8 +66,8 @@ pub fn from_i32(id: i32) -> Option<Self> {
         if id < 0 || id as u32 >= nr_cpu_ids() {
             None
         } else {
-            // SAFETY: `id` has just been checked as a valid CPU ID.
-            Some(unsafe { Self::from_i32_unchecked(id) })
+            // INVARIANT: `id` has just been checked as a valid CPU ID.
+            Some(Self(id as u32))
         }
     }

@@ -75,6 +78,8 @@ pub fn from_i32(id: i32) -> Option<Self> {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_u32_unchecked(id: u32) -> Self {
+        debug_assert!(id < nr_cpu_ids());
+
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id)
     }
@@ -84,8 +89,8 @@ pub fn from_u32(id: u32) -> Option<Self> {
         if id >= nr_cpu_ids() {
             None
         } else {
-            // SAFETY: `id` has just been checked as a valid CPU ID.
-            Some(unsafe { Self::from_u32_unchecked(id) })
+            // INVARIANT: `id` has just been checked as a valid CPU ID.
+            Some(Self(id))
         }
     }


-- 
viresh
