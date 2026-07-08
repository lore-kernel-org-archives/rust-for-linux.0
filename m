Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E093EF661
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544898; cv=none; b=V3cb7Ho+/MJ3OeBNRtUh6izcJrOiBh/rxDPJixF9jxtcmG6mrQJFKGUP16dW4QYYwkc556bJ/XXHNnhqNuGFNDL4ONBQUjJ6or+l/LzvfzhPYiT/e+tV3hLMA9YZpthXo3InhXhlts5f6tNRaBZyHfCeM1qBErCk5oIVGl/g3S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544898; c=relaxed/simple;
	bh=biBH4PA9f5DhTc+4g0UROR8IKEhkILOsC139oJpGl6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bcQ7NGaUB/751TY4Hd2xwA8qXFP69Cw320XdMDG3BkQAFA9wr90N90OT+QhTyVF+t9kvitTwelFxN9pQZoNuiZsDhhWxG+A5Dl6xEOdvKeC91uhZiPaQnP52kGuTUCtivY+fJIo0VfIuH3DHJSIaU/gdRIdQJdGm+5GUUQMWjxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ip/ajkKj; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ip/ajkKj"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-69afaeeb2e1so474046a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783544895; x=1784149695; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsxGWakqJeFwM90VS2bi5xlkNUrqBNf1v+hlTXOW8K0=;
        b=ip/ajkKjM0lnC4f5QEqUatxEnlN+RFicV5Yo8aV9upF0gIwtqRP2Y77DMjSEbWfmjc
         aMDkR5nudGdsIIhx4oWOcmqeQKJUmvhG+RVHj0RvgIhKk8ykfIoczlbk0PEn/MT9wfS6
         peqXFcPepn+cX4DaKKVxsZBE5x1OeZqagHivFPDUO+exQzYicAxSD4+HfFJkjneAETJt
         sieHwDqXXFpIba7JY1i2k10Zqb+UM4MGROYToWkT3gSnk3KxZS1n7JqZPoSgtVGtXN9i
         0OcE/yashnLNOF8wXcU1u7/44mwAq+I3Dt3wtSXLZoPCsEywNfjVOKTTvQ+WyeAs4Bma
         z6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783544895; x=1784149695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsxGWakqJeFwM90VS2bi5xlkNUrqBNf1v+hlTXOW8K0=;
        b=QoVlPhl+6Q9+JPUmoeW94UMUP85REGwjhORHBYyt39gbHklgAEmBMETtkHV9a++mFx
         sITV1JE8GxxjewzdxZb5RM36aof8gkUYuPeH1W2ttKVqPv7jADSkTHLmU29qrGQc/9sH
         iWkWI0xoM/9r4d4oCZkhkanHAl0HimX2ugb/BqrgB7XcKCLJesxkieOhsvp7RcSCps3M
         XYS9XOliayoMdO7YtoM+y07KcZdolooKzBu1W6aAwvtqlI82SOyntVFLstHIEhx4kO9Q
         C4oQLWQwvwe8cWjDP/gYkeLuLt7Og07yBy/kq3ndllRbDWnLRpI4Uqj3RJIn5LZbFr/o
         dYZw==
X-Forwarded-Encrypted: i=1; AHgh+Rr50vFR/stJxzG1ccaEDuC4Mm6E9RcfLLtPA5+/nIvGpq+LrzSYGPKGFep/hvD5WK/0Ie71VnCqVyusYSZtgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYbLMVAVL0EWcE0RC6GgQhFWfrDZSrN5V1m6IEPMjHZQDUaK2
	NWJj7FMVP9Ngp5NUKQ+yM1PiwJxaoP1tEs2vAE6ABc+4OdnnDf159VL0WQqFQlvlzJRRciar6zm
	3aqKhDnqJr7qkcFKaNg==
X-Received: from edaa23.prod.google.com ([2002:a05:6402:24d7:b0:698:c1e2:568b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5114:b0:698:5f89:9a51 with SMTP id 4fb4d7f45d1cf-69ab4453a86mr1833185a12.5.1783544894902;
 Wed, 08 Jul 2026 14:08:14 -0700 (PDT)
Date: Wed, 8 Jul 2026 21:08:14 +0000
In-Reply-To: <ak61Embrj0qH1vas@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <ak61Embrj0qH1vas@yury>
Message-ID: <ak68PmjY97BHOZOd@google.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>, burak.emir@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>, Eliot Courtney <ecourtney@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 08, 2026 at 04:37:38PM -0400, Yury Norov wrote:
> On Wed, Jul 08, 2026 at 07:33:16AM +0200, Greg KH wrote:
> 
> ...
> 
> > > I asked exactly the same question when Alice and Burak added wrappers
> > > for bitmaps to implement their ID pool. This is the answer:
> > > 
> > >   An alternative route of vendoring an existing Rust bitmap package was
> > >   considered but suboptimal overall. Reusing the C implementation is
> > >   preferable for a basic data structure like bitmaps. It enables Rust
> > >   code to be a lot more similar and predictable with respect to C code
> > >   that uses the same data structures and enables the use of code that
> > >   has been tried-and-tested in the kernel, with the same performance
> > >   characteristics whenever possible.
> > > 
> > > And now it's in a commit message: 11eca92a2caeb
> > > 
> > > They measured the affect of their wrapper on performance, and it appears
> > > to be ~5%. See lib/find_bit_benchmark_rust.rs.
> > 
> > You are comparing the C vs. Rust data structures here, which is not what
> > I am proposing.
> > 
> > Also, is this code being used on a "hot path" like the binder stuff is?
> > 
> > > I didn't see any side-to-side comparison between any native Rust API vs
> > > imported C bitmaps. I'm sure, I asked for that, and I still believe
> > > it's the important piece of data to avoid this back-and-forth type of
> > > discussions. So, Alice, Burak or anybody...
> > 
> > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm asking
> > to use the C structures like maple-tree and idr instead of open-coding
> > logic around the bitmap code.
> 
> I understand your point. I asked both questions: are they sure that bitmap
> is the most optimal data structure for the ID pool, and if so, why not use
> the built-in Rust bitmaps? The answer was: yes, it's the most optimal, and
> using built-in bitmaps is suboptimal overall.

The Rust standard library doesn't really have a bitmap abstraction to
begin with, so if we want to use bitmap then it's either handrolled
bit-manipulation or the C bitmap api.

cc'ing Burak's new email

> > > > > > Why isn't the built-in idr library being used here instead of rolling
> > > > > > your own data structure?
> > > 
> > > Now having more context, the ID pool's primary goal is to allocate
> > > individual IDs, which naturally lays on find_bit() API in C. The
> > > native Rust alternative is considered and found 'suboptimal overall'.
> > 
> > Allocating IDs is a probe() thing, which can be as slow as it wants,
> > right?  Or is this some other hot-path where performance matters?  The
> > patch was not very specific as to the tradeoffs needed.
> 
> I am a bitmaps maintainer, and I want them in Rust to perform equally well.
> The ID pool case was just the first user. Even if bitmap performance is
> not a critical path for ID pool, my role is to make sure that bitmap in
> Rust is implemented well, including the performance part.
> 
> Said that, I recall that bitmaps performance was important for the ID
> pool, and Alice and Burak spent some time optimizing the ID allocation
> path. Particularly, added a logic to avoid allocation of small bitmaps.

Yeah the Binder use-case is not the same as probe(). It's a per-fd data
structure used to give names to kernel objects that userspace is
manipulating, and the mapping is per-process.

Alice
