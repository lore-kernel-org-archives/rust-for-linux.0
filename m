Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C8F194124
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109455; cv=none; b=udsKtw2dO+e86adGD9+Byq14LgDS+PQ5cLC61PV05k+tej2F0aBdEOACgcrzYakE0CBwHXdgVHQWIoB0xsK+BQNIyKs0gq4f8Uoy4+pcBvXFrpOZJi8XbsH4kzArL2sqr25bXGa3WTGF5J//l6whAZxdyMMYzo3qJ0mf26x+n0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109455; c=relaxed/simple;
	bh=gnCkNJEuzzUc6tNGlIMicZLHA6gxUDZ8Ms+e0F962zQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BcGk4gE0Zn4xRK1cidtGbPC3GWqW++4pxOo6xq7NS65SQyVn7QJvrL9Z9nW5tqpRwuBSW6YLDMKvq+o2FRcTREY/0LgFqtjXNIoEFykfDSldHEYHW10SfyYD5132V5dZihPziU02ynQoyd0l9f5XmKswUGtxRhrOQ7nws17THBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BRAxa/UT; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BRAxa/UT"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39131851046so203718f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746109452; x=1746714252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GD4VAxiUdckVgdAlI2FatFx9gxYTX40bGPiV9AMDOdA=;
        b=BRAxa/UTvkXcbMc0K9CZKQaiDoy7A8zsuA5NGoz6WqElZ4hZOuXAsDrPfxnvzMFDJz
         XPCx47pvLDjR51o+Q+7OPeXafrNXvu9xoo1ySG8jKihKb7Ek/k1tiGQSK1kv44KJxnkT
         lTki1K1FC0e2u4ZLo92Bo8y9ATXbSpv4gZhr66zsv0SNClpUV/IL0e8Z7Aqidv/JzKSS
         DYYc7lqNexVZAc7oITvZOF/qmEfO37fWbP3sLTRTfTazAJIfYScbmrCt926R1rpoqUSi
         cHFZsompqXguLMsmAwivqUdCOdeqpdgt8R4vsbUmFCFOGpE9USJexelXx0V5yXp0Q8P9
         PPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109452; x=1746714252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GD4VAxiUdckVgdAlI2FatFx9gxYTX40bGPiV9AMDOdA=;
        b=psMmKcvKeCuETQh7/NUlbeCyL+MGXu72WZRspMKlhMw2InnGLFLxGzQ91KGSZ53elX
         QcoyNKR606lNI29rzwj3NeyeN9bS5g8YT+SUcwewr2wojHXr2sehDbeEG2dyf+X5QRr9
         a5zLxGp35Kb1jrQXoLSdUAP9ae2pJqY0VUbS0Tz5j3OpeZ0VzNfm/WpMv/bxrvV46nd7
         RfCnd4RHEAiIx2Q5j2/Owb+zUEGjh04oHIOn+n4dKIFCZ3A9UFRnI0ta4mmv1Yey9aR4
         B9QNzlzH4DEIGNk0qkAkeeAqwlf0bwZtquf2TOJFkopCdB2fyWo7GTeGTA+x2b0/vBAa
         vKkg==
X-Forwarded-Encrypted: i=1; AJvYcCUG9nWeZhtQGBO+O7kut7GScYEzL2HSsIAbbji1iMMGVkfpMGGYKq1kwJU2uLXwTZ6P1CX2gFy+fogd7VF+xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz63OtR7ePHfxe3tIE35sL5yHSkQGYxvcqvGMAchynucVcPEjuA
	p2+v8XtOm/vD39mXxMUsOxLkRhJLjw/leLJDbLvN8ye73KO01IKKD91iLNBxNqYZoUUfwZYP+7j
	T04vmCym2Xr94gw==
X-Google-Smtp-Source: AGHT+IH9yGiPQdQL/rTilbunR/lysJc95bXc2ytBh0NmP0UvNWHaAuoBWrl9kb95nbidxeiQM/JuMcTKm/XCOfs=
X-Received: from wmbfk13.prod.google.com ([2002:a05:600c:ccd:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1446:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-3a09404c8c7mr2238448f8f.16.1746109452277;
 Thu, 01 May 2025 07:24:12 -0700 (PDT)
Date: Thu, 1 May 2025 14:24:10 +0000
In-Reply-To: <aBNbTL2dIOFQq8yG@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com> <aBJPHUDYBGyAgUNf@pollux>
 <aBNWlC6uSOiFrQDL@google.com> <aBNbTL2dIOFQq8yG@pollux>
Message-ID: <aBOECvlbtVjP6iAI@google.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 01, 2025 at 01:30:20PM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 11:10:12AM +0000, Alice Ryhl wrote:
> > On Wed, Apr 30, 2025 at 06:26:05PM +0200, Danilo Krummrich wrote:
> > > On Tue, Apr 29, 2025 at 02:44:25PM +0000, Alice Ryhl wrote:
> > > > +#[macros::kunit_tests(rust_kvec_kunit)]
> > > > +mod tests {
> > > > +    use super::*;
> > > > +    use crate::prelude::*;
> > > > +
> > > > +    #[test]
> > > > +    fn test_kvec_retain() {
> > >
> > > Can we have this return a Result, like doctests can do?
> > 
> > I get warning when I try that:
> > 
> > warning: unused `core::result::Result` that must be used
> >     --> rust/kernel/alloc/kvec.rs:1232:1
> >      |
> > 1232 | #[macros::kunit_tests(rust_kvec_kunit)]
> >      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      |
> >      = note: this `Result` may be an `Err` variant, which should be handled
> >      = note: `#[warn(unused_must_use)]` on by default
> >      = note: this warning originates in the attribute macro `macros::kunit_tests`
> >              (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> Yes, I'm aware, I tried playing with that myself. I really meant the question as
> I wrote, not as "Can you please change that?". :-) Sorry for the confusion.

One downside is that returning a Result doesn't show the line of code
where it failed.

> > > > +        /// Verify correctness for one specific function.
> > > > +        #[expect(clippy::needless_range_loop)]
> > > > +        fn verify(c: &[bool]) {
> > > > +            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > > +            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > > +
> > > > +            for i in 0..c.len() {
> > > > +                vec1.push_within_capacity(i).unwrap();
> > > > +                if c[i] {
> > > > +                    vec2.push_within_capacity(i).unwrap();
> > > > +                }
> > > > +            }
> > > > +
> > > > +            vec1.retain(|i| c[*i]);
> > > > +
> > > > +            assert_eq!(vec1, vec2);
> > >
> > > Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
> > > doctests (i.e. dedicated kunit tests)?
> > >
> > > I much prefer their output over the kernel panic we get with the "normal"
> > > asserts, unwraps, etc.
> > >
> > > Consistently sticking to the same output on failure makes it easier to catch and
> > > easier to setup CI environments.
> > 
> > The documentation for those macros says "Public but hidden since it
> > should only be used from generated tests." so I don't think I'm supposed
> > to use them.
> 
> Same here, that's more a fundamental question, rather than something for you to
> change right away.
> 
> I really like the way doctests implement the assert macros and how they appear
> in the kernel log compared to panics through the "real" assert ones, unwraps,
> etc.
> 
> I also think that avoiding things that directly panic in doctests (i.e. example
> code) is the correct thing to do. For KUnit tests it's probably less important,
> since they don't directly serve as sample code.
> 
> So, I wonder what's our take on that. Do we want to have KUnit and doctests
> aligned? I think that'd be a good thing.

I think that both of these would be reasonable to fix. Also the fact
that I had to do #[macros::kunit_tests()] instead of just #[kunit_tests()].

Alice
