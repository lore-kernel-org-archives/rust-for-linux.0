Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626A43D50C
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772283603; cv=none; b=uA9RROQ10bldyXMIA0m68xwPWLGiobCJ3oDHLD50Km6Ey7WyVJBeZ/LsX3JgPrZu4llJu4lIANybt0zy9vmeQsjJDGZJGwHUN8dj+lk/Zlu4gqipiJw8urfqd/xGY1sOW6Gxc/0Uh0A5bFbzpFyS8xh/5wjhzxbmbICni517wFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772283603; c=relaxed/simple;
	bh=61HIaXXQJP6dIRkDpR4iBFVDQXV0Bu8NiJovkIb2Foc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XdAckLM4BAeJRTCGHS6rJs+RdM0Pv/hhp5MuUVNhhxdKwas7AZvyQh/nJgCitYizF5lfneAQBQ5s4NK4qNQv+ZWAaZDAgS/8Jbo1CYfVvr564kW/gNTXDlibGH6jP0/fYx0tm6NKmDyALOQBPYxqndokW3+l+H2XbBGA35LU4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wXs+RFBk; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wXs+RFBk"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b9360e9f43bso277734666b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772283600; x=1772888400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hN0ejCwE0lfhOX+cUbY364fk4yuls3EG3DMiE5XZI04=;
        b=wXs+RFBk29RXcFfoMpzl5Ni5mstsMdOIwVwLTDfYu/UyNtzC+Gx/dBnhbcoffIjsjE
         +XEuq0bAlYy5bz6k+1HpZzsLhQLB0QI8dJ1wBFVdeJD4rcJLWKW3pIzTqQDg36BgOv2P
         S92rlxW1vozPJFPSJdlMgb72FQQcLHHtcMJyD5Q/D0bydkpD3uskbMHMvG9cq5bAN+R2
         EuF+Yt6AHe90Y1lwZtFHk/E6iX6eFaXyBwcjh8mEtgr+c6iQgHZkjdEmdgFHL0nY37Zc
         i5ZXDDRU+O4kZiiJ29gjnf95cwg5OXwTBO9MORxeooR+UDDfqxgXe6TvY2BYz215Lcza
         ftFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772283600; x=1772888400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN0ejCwE0lfhOX+cUbY364fk4yuls3EG3DMiE5XZI04=;
        b=tzT5dPG0hlx5CjIaKOK5+yfkSfLWUAFct1KYzAlfgSzNRjUBk28Rnkgci1Nesl4EpN
         kj0Ojpfd46hYEXpufMNgg/mCCWwAjcv/CJuuQhgwUNa9XRfCmK5JqIUm69PjNjiGONLD
         ToteGOOgvz83RCj12u49YJl9Iswsir0xif6AauCaYScM0ma2P6dk3ka+SPgKKmnYc8EC
         WabZ3NgUDhNBvWNz112wPnZpnJTOKprzAQKHaIwBzNnqZt2eU9F/T1/shyHazYvZ2IOl
         /qP3Zl1NqQQMhj4AVuUHsM5tvbhuGGVMq50o2MuvnU5i9/aoAIM/JLl3b2CorCu0gFRP
         fkyg==
X-Forwarded-Encrypted: i=1; AJvYcCW0wypnhhbh+MR3+zzmclvv5blh/m5D8o5yRFfoxNCvCHclgGbfae3T97cqrc4Gpt0+Gmpxo+fEQmK8I43gDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFufRAoU43QQWlKDCPYfFFZA5HLTv806JGWfUdnhrPKkEnI1be
	mU29barOD9yiEskMH+pGjYbktjgWbFEpkGLkdjhlRH+9mzl5OGaZxB6Nxp12BQEwrluxL271BS5
	+M/8SJ0Sgy5mT4xsWLQ==
X-Received: from ejil27.prod.google.com ([2002:a17:906:e1b:b0:b8f:70ee:e3e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9348:b0:b88:6062:7078 with SMTP id a640c23a62f3a-b937650a5ddmr390774566b.30.1772283599767;
 Sat, 28 Feb 2026 04:59:59 -0800 (PST)
Date: Sat, 28 Feb 2026 12:59:58 +0000
In-Reply-To: <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com> <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
 <aaHq9VpaVN4_hchW@google.com> <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org>
Message-ID: <aaLmzp0mMPpE45yQ@google.com>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 08:23:44PM +0100, Danilo Krummrich wrote:
> On Fri Feb 27, 2026 at 8:05 PM CET, Alice Ryhl wrote:
> > On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
> >> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
> >> > +    #[inline]
> >> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
> >> > +        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
> >> 
> >> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. Maybe use
> >> debug_assert()?
> >
> > What's wrong with just making use of the C-side warning?
> 
> IIRC, we have the same pattern in other Rust code that we use debug_assert()
> when a value got clamped, e.g. in udelay().

In udelay(), the clamping happens on the Rust side, so it makes sense
that Rust is the one to warn about it.

Here, the clamping happens in C code. To warn about it, I'd have to
duplicate the existing C-side check to clamp in Rust.

> >> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
> >> .max_active(1).
> >> 
> >> At the same time having a separate ordered() method competes with max_active().
> >> 
> >> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?
> >
> > Sorry I'm a bit confused by this. Why does an ordered() compete with
> > max_active()?
> 
> Because you could get an inconsistent state with __WQ_ORDERED and
> max_active > 1.
> 
> It also conflicts with sysfs() I think [1].
> 
> [1] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/workqueue.c#L7417

And I guess the further argument is that we have a use-case for ordered
workqueues?

Alice
