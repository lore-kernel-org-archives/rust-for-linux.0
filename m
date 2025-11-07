Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1212BE652
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506185; cv=none; b=k+kQc8+HIeWI/KHJ60pciIfH5Gj6ycI7wQapnHkIQ6AX9gMZiWJ1YZ5Wi6blhKYU3voRlgVWE9TGn3fKpAYLs6KBrM9ZadAfprfkwYCFicD3XOK8zDV34SMEpVve9qM32H4On5XgIy5X/sijepB42lBGEg8tcRQ30TzL2fnr3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506185; c=relaxed/simple;
	bh=o2yyNq79XVxoJ7LZWLbBpktNfzKh4I6RIylEIH8/QiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UY5bz9MRn+lAP/1G0SWMK8UXlaFntQNAzthuUoRbIUvs9+5vVPcdOjAe9GquvUDf8f55nKdDTg1ItLnKRb4ico2Ugr/qVtXEwxc/rAuYyQExjv3tdi4R1gIJpeHggA7L2w2vmCB0eqqaPskwexMNDGuAHngZ9PCYw3RhZysb7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/uXcheJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/uXcheJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47769a0a13bso5055705e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762506182; x=1763110982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGRBUfI/XY0JdSokaWRrnLJQDRGx5JWbwoQBY5xJQC4=;
        b=Q/uXcheJl5Q73EUMg1AsAhyLnJMHm2WJzWpk8XwuEd3PkAp07ZtgPJ5UKIX2UyuvBB
         WqDXoIAw/stVKP57S1wolP/AB2MzHdx44swlrDn1pAWle2DJSs3PpypcIrkDGDzI01XC
         XflJQl+xoTpyuhOWXu0I262CsR5mCRh3BTR4IeEKshP/pmLgBcBdhktOgPSRXPtm2Gr1
         ig6lOwVB9iJ0aE/wdRt8ItwrvKV/XU0ddXwcjTa4Cnd59MIm2Fyed0zcTKDRHcdcN/Wh
         d1RiQTnBe/aYL0hSMUm5oH65W5eh1713RpdLGtuJnUT+c71x0+xtoVf/jlvl+PgiL1lh
         kW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506182; x=1763110982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGRBUfI/XY0JdSokaWRrnLJQDRGx5JWbwoQBY5xJQC4=;
        b=hWyEBQpdnGyu97fjqTSR2kE25/cpW109U9HE95E1iNhuYxelxqBmb+vnon+j8c4Lpz
         9L8dWQAeEFBP2CzAohkEfUVD1HJbCEEMq6pjwEsQWSyEoAAJo/x8RcHb7FrnccH24LPo
         m4eI3Ytx85ERzpVjcW+wkEymoVy5SNOROfHdSUtobfdRhbxZLZX8NG6rKAar+Ceq652h
         W/JVSXuI9OgUGVFoGAIivhPMUIO0wi/DX6r8wxooxfUiMrRkcN5626sc0RsxCgS4DD8v
         50PN0y07NIMx8EUczccc2KERBg4WT4rSvssIHV9c5+freE4HH4DwKvDIcmtOzKEHDNnO
         BX2w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+nKR4a/j02EUgdNSrQyP/Kc/nlTiQ62IXV/9qtRULha1Ei0cT+4dmabrs/SpocVUdspevtm1IdBxDaymbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCiA+k9F8UjjSB3mFynjSoW7NYOKBEbGXE6UmQ8TKdUY/br1g
	Zpb+gxeEfEPEnqY6xOHV71y9iE7PAMBNZR9AcRQ84HHnhi4B4HZyU3oWQ856PJ77W3YmoEGzEkQ
	9zlucR0PQx09V1dpCAw==
X-Google-Smtp-Source: AGHT+IHJOQCCPIz4UwYTqVsTOBu9dKgitfeZEb3isGJCUdATdApfBYbNsc9y6nUjkVs/PoAdi6kHxzt5FI8vCZs=
X-Received: from wmbhb19.prod.google.com ([2002:a05:600c:8693:b0:477:5ad9:149a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3114:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4776bcca346mr17511585e9.41.1762506182326;
 Fri, 07 Nov 2025 01:03:02 -0800 (PST)
Date: Fri, 7 Nov 2025 09:03:01 +0000
In-Reply-To: <aQy0zxs53EAnntwR@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <20251105054731.3194118-2-fujita.tomonori@gmail.com> <aQt5GR019t07U0Nk@tardis.local>
 <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com> <aQy0zxs53EAnntwR@tardis.local>
Message-ID: <aQ21xajAygTbi582@google.com>
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 06, 2025 at 06:46:39AM -0800, Boqun Feng wrote:
> On Thu, Nov 06, 2025 at 09:10:26AM +0900, FUJITA Tomonori wrote:
> > On Wed, 5 Nov 2025 08:19:37 -0800
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> > >> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > >> index 3dd7bebe7888..19553eb8c188 100644
> > >> --- a/rust/kernel/lib.rs
> > >> +++ b/rust/kernel/lib.rs
> > >> @@ -110,6 +110,7 @@
> > >>  #[cfg(CONFIG_NET)]
> > >>  pub mod net;
> > >>  pub mod of;
> > >> +pub mod once_lite;
> > > 
> > > Would it make more sense to put it the kernel::sync module?
> > 
> > I actually considered that as well. The OnceLite structure could
> > probably live under the sync module.
> > 
> > However, the do_once_lite macro places its data in the .data..once
> > section, which can be zero-cleared when a user writes to debugfs
> > clear_warn_once. In that case, there is no guarantee of any atomicity,
> 
> This is not true actually, clear_warn_once_set() uses memset() to zero
> the memory, which is usually implemented by kernel itself and at least
> indicates per-byte atomicity, so it totally works with other atomic
> accesses in the kernel memory model. Otherwise pr_*_once() will be
> considered as data races.
> 
> > so it doesn't really fit the semantics expected for the sync module.
> > 
> > For now, OnceLite the only used by do_once_lite macro, so I didn't see
> > much benefit in splitting it into separate files.
> 
> I lean towards Andreas' suggestion that we should use SetOnce() here if
> possible. I was missing that before this reply, thank Andrea for bring
> it up.
> 
> > Also, data placed in the .data..once section should ideally be of a
> > type whose zero-cleared state is clearly valid, which makes it
> > doubtful that OnceLite would be generally useful in the way that other
> > synchronization primitives in sync are.
> > 
> 
> Why? A lot of synchronization primitives have 0 as a valid value, no?
> 
> > From a Rust perspective, data that is shared with the C side and can
> > be zero-cleared at any time might ideally require some special
> > structures? However, what we actually want to achieve here is simply
> 
> I don't think special structures are required or it's already
> implemented in our Atomic type.
> 
> > something like "probably print only once", which is a very simple use
> > case. So I'm not sure it's worth introducing something complicated.
> > 
> 
> That's my point (and probably also Andreas' point), we already has the
> type `SetOnce` to do this, no need for a `OnceLite` type if not
> necessary, and the fact that it can be zero'd by debugfs doesn't change
> it as I explained above.

The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
three different states, but OnceLite only needs two. I don't think we
should be reusing SetOnce here.

Alice
