Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F161DFD8F
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398539; cv=none; b=NOU3GpHsybZMO2Cod8DNhs+wabeEzMkKKKV0/CH4WjEzhns8sDDitsUH2ZnZ/6uGOg1kMdeKFAuTZTALlYwrHfUZIk0GMpvig6x9XUBcBbvzJ1cZxR3HsnWLGHRufF70BZr8Q8j7XGJAyTHWgPQh97MCPoe8xqgg32Uh0uln1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398539; c=relaxed/simple;
	bh=JM4EG3DbC8o+kLfP96/N8eGtrMofAULCfcav7gqViBY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RJNsOmov00SROZvSO1FNQTi8tt43mJa3waDL8zBGDTJxqmLqJrcyD2A3A15jdR6NowPeJeaD18bfzvykuv682IBbg3ZKVjeA22TZ+jFP4yGwMewyFa9FrRXUulExQFX+zmkbjplwkAXOqQ6MlTzyurOFTDYqPaMq2KMv3Eeku78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OnAVW6yD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OnAVW6yD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d733063cdso44478495e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745398536; x=1746003336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OaKVzVOJgOSKOkuhk/ngmT/zkmJ5Y9OFTfOrz7bXPoY=;
        b=OnAVW6yDkYHTDe9OnY3PkzWPOs2TwGQtEGl4Xn88y6udgCGpzooiX69nFNu8Y8l3Zj
         h7bYhO7t3rbbV2Pp9QdiPrP7guh3bss3f+14d3eAtjFM4qnfaeFZH60D9i1yCxiGPer5
         p0ov9t8x/0UjL0TJBRObvg1lokn0El15sSwMMOqGrSWCwOUtL7V+4qyStsKSKu8WrvoP
         JcGWLDqXn9FxcyOn0cgbY+AUL3aZ/r8je/TCcm8pIFoptlWSrvMmW5uIBUIYdGLKoqUa
         tull0jyZt09tvop9zVqYGiAhVLmTGB5gya137Bn9+J/cnSGlMrCX2/O5CzauDPO52xRR
         eZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398536; x=1746003336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaKVzVOJgOSKOkuhk/ngmT/zkmJ5Y9OFTfOrz7bXPoY=;
        b=cfaETp+TeLw/aW7GDzfKfVVIk9r1yjzwm+xcqXizwG/Hs/dZAMU9mPwZaxqWQAhymG
         AMwaYLSPf2TYlZjLG0wKZXbR83E4RB4FPHbbtS4wSwHxLXAjLCQjQXyy7tx7RRgxYqQW
         aDoAYiuEwcjZbyqwM2TI3aFO5/RRNfwhMkh4k4RgGB2qYWlwmr0bXJNS16cZ53JXEevv
         4ddZsT0PVFVPAgidPvlDlpklcYUmL4K05bk12x+4v5DmFD5lFuNRfb1yBpA1yzu8LQdm
         b+OLHDkI3/xPQyiijEyzjUeBS7g5GrRTtYYqwibv6bcvi35kjyb87rq+KYfN201ErXR5
         jZQg==
X-Forwarded-Encrypted: i=1; AJvYcCUK6oNtMAsovSeJI1Mpflwkl6iUYMq5P3kwG4jvAQFKVEktuVvuMNOnCMoItnw4wrb/tVr0IYc5HVPnbKSfuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypFxXx5zEdgtO4SUrbOD+pzuDdvOJ1PdkSX9pnz9Mr4dqbJ5Lt
	agObDrITx1Sxg/j0UJ+rqHNZzOGWs2Rm5VYDiKOhu9sTWXsj/qrFzmLK7J2cafXDSJiRXLpqerC
	lSaFXxs58cMt2Fg==
X-Google-Smtp-Source: AGHT+IFchQbxy+8MVQTjIQqNWsxg6egaeHXm1u76QC4qBxCuS48lqBAj021IovR8qHS/3rQkqOqbffo+RHfbE4o=
X-Received: from wmbep21.prod.google.com ([2002:a05:600c:8415:b0:43d:1873:dbaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c8f:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-4406ac1fe30mr124784795e9.21.1745398536504;
 Wed, 23 Apr 2025 01:55:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:55:34 +0000
In-Reply-To: <68080a53.050a0220.c2cd7.6290@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-3-deff5eea568a@google.com> <68080a53.050a0220.c2cd7.6290@mx.google.com>
Message-ID: <aAirBuiNdraU4ty3@google.com>
Subject: Re: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 22, 2025 at 02:29:53PM -0700, Boqun Feng wrote:
> On Tue, Apr 22, 2025 at 09:52:18AM +0000, Alice Ryhl wrote:
> > This introduces a new method called `push_within_capacity` for appending
> > to a vector without attempting to allocate if the capacity is full. Rust
> > Binder will use this in various places to safely push to a vector while
> > holding a spinlock.
> > 
> > The implementation is moved to a push_within_capacity_unchecked method.
> > This is preferred over having push() call push_within_capacity()
> > followed by an unwrap_unchecked() for simpler unsafe.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 41 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 38 insertions(+), 3 deletions(-)
> > 
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..a005a295262cb1e8b7c118125ffa07ae252e257c 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -307,17 +307,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
> >      /// ```
> >      pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
> >          self.reserve(1, flags)?;
> > +        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
> > +        // than the length.
> > +        unsafe { self.push_within_capacity_unchecked(v) };
> > +        Ok(())
> > +    }
> > +
> > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > +    ///
> > +    /// Fails if the vector does not have capacity for the new element.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL);
> 
> Should be:
> 
>     /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> 
> , right? I.e. a question mark is missing.
> 
> The rest looks good to me.

Will be fixed in the next version. Let me know if you want me to add
your Reviewed-by tag with this fixed?

Alice
