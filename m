Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74820B212
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762561648; cv=none; b=HAyqJNIxwkHGlYgr1ng8HfE5sF5fWOkR3lBGr1Tlj8gdj+XQvYQ97me3NNlHDmqKJ8BrBOuHbE/Y6WVv8rbRW1BRhTdoiKRnSx0iv8SlwIV+BpYU+LAYuQJpgCCwg/dkdnLev4x46PR+s5Cc/935+bW1QFlGkW4xAncg3b8uFIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762561648; c=relaxed/simple;
	bh=7kj/nTh8c5FimDk+/Kx8m+ZVMa2y1+ZHOJWDbwOrbyQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+Botz+nxTCtbu8tFN4uzfMTEBBjFWycxvwEA4qUnkSpMfMR/dMAHJ5IKkEeaT4K0iTHo0sOkJMp/ghJiYDfRiX/LHBi1OHgKCflr1JkGpPcDrGuKgn2Qqz4vULj4Oqxejfm5pzIjwnZ3p8ft6qg41UfLBSQ5BNaHoCUgF3+hyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2DXupsK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2DXupsK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29470bc80ceso13991025ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 16:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762561646; x=1763166446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oITIVQgMr73mFnSfBGd/HefCrTD9E8UlLjNjhfP/oZE=;
        b=I2DXupsKEkWM/EAfCuP2z/x8aDcWMonPKyBaNz1U6jzPtF1d8Vuk57xiLclLT2/hxd
         QRXQ+vRbbwNHa0z48DtueZBEwpg9qSaHZ+pHT5u2oSjNJ9C6BHcjyhdDB1BKKP3k3Sgt
         Rdcv7+5oteN3eQ3COuYV3Reu54Hm0qRycrYHC1OmAVfTYTT5ZWFKPvr4EY0bNatXUVW+
         qNrmUeY75V+oAmqpoC/mEz9dsOO2sqsdLKmcgHv08FlHUSZOJ66n9PBff3bjD6EjTDwY
         2Ye9QQl0U1UmGYNOmgPGpHUgrdoUgG60xCNVTT+5kJWBZ4t8VaLybYSMGhKBlfV3M69J
         evPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762561646; x=1763166446;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oITIVQgMr73mFnSfBGd/HefCrTD9E8UlLjNjhfP/oZE=;
        b=gaxsErcJgAFoPTACQFAy5uNydtSMmYocYvWYdJlJrpcK/UDMg1wsAcjXhcKpSSoLzI
         LhOm2Hqp7aFFenIfyrbHupAVd91m6XNiME2P1Jvuz5CyjK5FN1ICaR0DlYUdAVlgynJs
         NFZePv1UsZ2XaJeVaTD30v+nDmewNhkWhx7ITpKMtVOMWTXRGkQy3su9d8jWGl01gOZA
         jk0NuyIvX2e0wP2CCUwLjfLkP3KmuunCP2vl85n1uHM4B/Q/+Kg0EwvfJWtf2CrwxSf4
         ZuWdtsayjG5Oj4AgjbzkfB5EIjuH4zFPBYAoznmRu93TpHDGR9NAzpk6oTVhtXk9Ok7U
         OT1g==
X-Forwarded-Encrypted: i=1; AJvYcCV9KDQEuEBbcmYwnJyaiDOpPBbRfQhihVmdSEtZ8MR6rEASr69FFvZI8N3mbX6GdqEHVbIPJMiKGII9IwZQ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9btgNXo6iLE95PemaoEapClln63DOFhQyPfyXMckO9oWlPCc
	cOF+PrCwW5Q6LgQWqEhJsFvsguvBH2ydq7ZIfraWKtPKF9jUv/AOjdIU
X-Gm-Gg: ASbGncs6dVSBeNx1hC+9GDh/WoC01U/YJPAEZtEQxybyms+pvgvwcx147JKnbxXuDeM
	7vyH0ZZyYzumxvQc9ERV8jGRrERGeU03XlDB0l7KZ5wcUldT1nIlXUCEeMtyxr4hoNPdkOSc4a4
	LOLZ+VMiAwFIct/CHHLONITM1rJK7oTPqp6IgrK+FqGEtcT1iJGPY8OQANK19i80HLTubuYjmMN
	nXb3K0q25vsG6gGXO8A9hiYbbqO6c3hPfVWBlJB8391NY49oj9D82mO7dwZJMg55zqQrlYy3otT
	pSrXTyPkdwLScyNcOsoU2zU7JqeAX9pxzB1KXZs89kXFChsvhuTaHClt7Oye/S85YT2ijVhpsOd
	qItgt0W8TDHTAuMFa1RBgCGmO4NROMm2kt83Zf0ESO1vchkeVHYRhX0u7WvzaYNPkkCh9k0tAcq
	PQ5pUwzPq8K7WfeJw=
X-Google-Smtp-Source: AGHT+IGBkvZLAhvDKdrvXHQG3c3w7IqpLjYOFlvAQCWtRpkM1DWxhdW7r8G7DO/y1DZ2Fmaan/pCUg==
X-Received: by 2002:a17:902:cf0b:b0:290:ad7a:bb50 with SMTP id d9443c01a7336-297c96a5cd5mr39554295ad.27.1762561645531;
        Fri, 07 Nov 2025 16:27:25 -0800 (PST)
Received: from Cyndaquil. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c80393sm2734157a12.4.2025.11.07.16.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 16:27:25 -0800 (PST)
Message-ID: <690e8e6d.050a0220.b06fd.d2ec@mx.google.com>
X-Google-Original-Message-ID: <aQ6Oay2rcmaQLDup@Cyndaquil.>
Date: Fri, 7 Nov 2025 16:27:23 -0800
From: Mitchell Levy <levymitchell0@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tyler Hicks <code@tyhicks.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 2/9] rust: cpumask: Add getters for globally defined
 cpumasks
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-2-984b1470adcb@gmail.com>
 <aQ1DAn7Djc19CgGF@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ1DAn7Djc19CgGF@yury>

On Thu, Nov 06, 2025 at 07:53:22PM -0500, Yury Norov wrote:
> On Wed, Nov 05, 2025 at 03:01:14PM -0800, Mitchell Levy wrote:
> > Add getters for the global cpumasks documented in
> > `include/linux/cpumask.h`, specifically:
> > - cpu_possible_mask
> > - cpu_online_mask
> > - cpu_enabled_mask
> > - cpu_present_mask
> > - cpu_active_mask
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > ---
> >  rust/kernel/cpumask.rs | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> > index b7401848f59e..a6a130092fcb 100644
> > --- a/rust/kernel/cpumask.rs
> > +++ b/rust/kernel/cpumask.rs
> > @@ -77,6 +77,52 @@ pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
> >          unsafe { &*ptr.cast() }
> >      }
> >  
> > +    /// Get a CPU mask representing possible CPUs; has bit `cpu` set iff cpu is populatable
> > +    #[inline]
> > +    pub fn possible_cpus() -> &'static Self {
> > +        // SAFETY: `__cpu_possible_mask` is a valid global provided by the kernel that lives
> > +        // forever.
> > +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_possible_mask) }
> > +    }
> 
> Not sure about this '&raw const' syntax, but I want to make sure that
> all this getters provide non-modifiable references. To modify any of
> those masks, one has to call a dedicated helper like set_cpu_possible().

For `id: T`, the syntax `&raw const id` produces a `*const T` pointing
at `id` (the analogous syntax `&raw mut id` produces a `*mut T`).

All getters here provide const references (`&'static Self` as opposed to
`&'static mut Self`) which will cause the compiler to prevent usage of
any `Cpumask` methods with a `&mut self` reciever (i.e., methods that
change the `Cpumask`).

> Can you maybe explicitly mention it in the comments?

The compiler will prevent using these values to change the underlying
`__cpu_possible_mask` etc, so mentioning that these return values can't
be used for that purpose seems redundant to me.

It is possible someone could get the pointer out via `Cpumask::as_raw`,
and then do something bad with that pointer, but this isn't any
different than someone doing something bad with
`bindings::__cpu_possible_mask`.

Thanks,
Mitchell

> With that,
> 
> Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> > +    /// Get a CPU mask representing online CPUs; has bit `cpu` set iff cpu available to the
> > +    /// scheduler
> > +    #[inline]
> > +    pub fn online_cpus() -> &'static Self {
> > +        // SAFETY: `__cpu_online_mask` is a valid global provided by the kernel that lives forever.
> > +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_online_mask`
> > +        // may change its value.
> > +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_online_mask) }
> > +    }
> > +
> > +    /// Get a CPU mask representing enabled CPUs; has bit `cpu` set iff cpu can be brought online
> > +    #[inline]
> > +    pub fn enabled_cpus() -> &'static Self {
> > +        // SAFETY: `__cpu_enabled_mask` is a valid global provided by the kernel that lives forever.
> > +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_enabled_mask`
> > +        // may change its value.
> > +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_enabled_mask) }
> > +    }
> > +
> > +    /// Get a CPU mask representing present CPUs; has bit `cpu` set iff cpu is populated
> > +    #[inline]
> > +    pub fn present_cpus() -> &'static Self {
> > +        // SAFETY: `__cpu_present_mask` is a valid global provided by the kernel that lives
> > +        // forever. Since we wrap the returned pointer in an `Opaque`, it's ok that
> > +        // `__cpu_present_mask` may change its value.
> > +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_present_mask) }
> > +    }
> > +
> > +    /// Get a CPU mask representing active CPUs; has bit `cpu` set iff cpu is available to
> > +    /// migration.
> > +    #[inline]
> > +    pub fn active_cpus() -> &'static Self {
> > +        // SAFETY: `__cpu_active_mask` is a valid global provided by the kernel that lives forever.
> > +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_active_mask`
> > +        // may change its value.
> > +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_active_mask) }
> > +    }
> > +
> >      /// Obtain the raw `struct cpumask` pointer.
> >      pub fn as_raw(&self) -> *mut bindings::cpumask {
> >          let this: *const Self = self;
> > 
> > -- 
> > 2.34.1
