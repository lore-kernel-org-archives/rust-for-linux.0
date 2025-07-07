Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E41E5B88
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Jul 2025 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873149; cv=none; b=X0+uO6usDI2GBSN8JVoterg23vAd+MKg8XD+zF8HhcKQrNVcq+AIIzNUKVBQeCdXdXsa2408WATZ66EsBZKMe3kDkNQI1xoBdbRRU4RJ1STEy8aceRmBJ1/CNlTCBWsHcJ2LkzNjsgzKWFuwtH9gwZNdJhOzvtGLvgN9zOr+uGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873149; c=relaxed/simple;
	bh=+/qqoD9FJAu0i59brRod/F5ZmcH0ib5nPtPj2KCibdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OcI0VKbimOY6T3wTRvH5r4HnfvUaxg+UAtZ6foWUc+ZQMYokBvtFZ6AOn10SZYlSL1VZZrXev1uhkjJrV3lO+hLbVMj3MhWjt5RKQPY6SKdpJaQe8JkUAJficiDj7K7K0BLH+vnP9D3tXPsbIcpbGuHIWZfyjqXL7aXytaohp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ly31rAGh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ly31rAGh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso14730495e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751873146; x=1752477946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjXBHIGCko1Walk5rVzDSoSA5fXEne2gWaZ0Ckd/Q/c=;
        b=ly31rAGhDNHOFfgCKYgjmSzjz2FQRKFr4HkxZmyLgeFaXCUrbUqNrzswB9IACEvGZX
         nS6o7RuTgYDY8kA9ODpuADO4Zehvb8W5YGe7uCDUEeFGdr29jCFhRE+7P+JFWmlb4NU2
         3Qroq6p4S9ugQ+0Bvr5al2bhvx9IVTCS+ICL+dC//NeZRck1FIMjE/e8nR9hax0OpvZE
         GuoYCd1pdtS0phJZCOk5NKSmEJruxXN+UipUdciEVaFRPuofys96Otvqby/gX+4KpKo/
         65PV4R972JOoDghfn01ztrrtM8pn0joN78mDwclBItUzA/Y9r3pdYGbLr4rwBVswxHrN
         1c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873146; x=1752477946;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HjXBHIGCko1Walk5rVzDSoSA5fXEne2gWaZ0Ckd/Q/c=;
        b=HKCzniXmQjGEfJKPr3BIeaCTE525CY1e+Or6UU03HVz9QxZZ7DT5n1Axr3Y1UiAqb0
         ELJSDfZqVWk93ezl7nZyqQvv9pqc5YV8XlDT9psuxRqFn99p439zKswK81FeASg3FSGZ
         D5yOmichvKCy0nmClaeN9RnV5q95lCZ+2wwQW8krZaz7CqohzUmeO4HYePAWi6mGWW/U
         ws+RzrToD6Q/JEpNl2K3HOYrNMti67VYm7YFaoVpz4HkEp3qw28J83ZQV5V7ESPXn8+P
         +OtQVy17PYgwOfL61WRq74H4yw/sqEC1nDiUf9LDtVPXEWf57FKJxCU1eeau0I4vz49f
         8JVg==
X-Forwarded-Encrypted: i=1; AJvYcCXdxrzWTEUTZIIzJoP+8salF/w639+BfgPY2zDqG7Mr7qlXqvTbTUXr0DTuXTXYQ2k8xOaBa7ruNaZ8bvvfWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSXl/OnKOiuaVqyaQF35604SS2qiyGYtJRp8QolExQF/6L8Ud
	d7CxaghXlReAZ7nfAFnRZeifD4LkqhMwlqSSnCxoShNJ4UAUrEgSiPkfzjOhWYI5GdSuuNZUUwx
	OVZtj2tiZ88wPp2z4gA==
X-Google-Smtp-Source: AGHT+IHnB4goyApbwUk03PZ8amZ+9lz0KfhPl/FnIn9n3QVNQffOoWFFNjsjkGnHrSVq3Tb+2bkKpL9KjoAAl3Y=
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:442:fa3c:8612])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190c:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-454c6531885mr18514585e9.9.1751873146473;
 Mon, 07 Jul 2025 00:25:46 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:25:45 +0000
In-Reply-To: <5BDED328-4E79-4E39-95C3-21C3FB80593C@konsulko.se>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
 <20250702160910.3610134-1-vitaly.wool@konsulko.se> <aGfx6c72FgHn3NNW@pollux> <5BDED328-4E79-4E39-95C3-21C3FB80593C@konsulko.se>
Message-ID: <aGt2eWaXH1tlh_4c@google.com>
Subject: Re: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
From: Alice Ryhl <aliceryhl@google.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 05, 2025 at 09:17:10AM +0200, Vitaly Wool wrote:
>=20
>=20
> > On Jul 4, 2025, at 5:23=E2=80=AFPM, Danilo Krummrich <dakr@kernel.org> =
wrote:
> >=20
> > On Wed, Jul 02, 2025 at 06:09:10PM +0200, Vitaly Wool wrote:
> >> /// The kernel's [`Allocator`] trait.
> >> ///
> >> /// An implementation of [`Allocator`] can allocate, re-allocate and f=
ree memory buffers described
> >> @@ -148,7 +172,7 @@ pub unsafe trait Allocator {
> >>     ///
> >>     /// When the return value is `Ok(ptr)`, then `ptr` is
> >>     /// - valid for reads and writes for `layout.size()` bytes, until =
it is passed to
> >> -    ///   [`Allocator::free`] or [`Allocator::realloc`],
> >> +    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator:=
:realloc_node`],
> >>     /// - aligned to `layout.align()`,
> >>     ///
> >>     /// Additionally, `Flags` are honored as documented in
> >> @@ -159,7 +183,41 @@ fn alloc(layout: Layout, flags: Flags) -> Result<=
NonNull<[u8]>, AllocError> {
> >>         unsafe { Self::realloc(None, layout, Layout::new::<()>(), flag=
s) }
> >>     }
> >>=20
> >> -    /// Re-allocate an existing memory allocation to satisfy the requ=
ested `layout`.
> >> +    /// Allocate memory based on `layout`, `flags` and `nid`.
> >> +    ///
> >> +    /// On success, returns a buffer represented as `NonNull<[u8]>` t=
hat satisfies the layout
> >> +    /// constraints (i.e. minimum size and alignment as specified by =
`layout`).
> >> +    ///
> >> +    /// This function is equivalent to `realloc_node` when called wit=
h `None`.
> >> +    ///
> >> +    /// # Guarantees
> >> +    ///
> >> +    /// When the return value is `Ok(ptr)`, then `ptr` is
> >> +    /// - valid for reads and writes for `layout.size()` bytes, until=
 it is passed to
> >> +    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator:=
:realloc_node`],
> >> +    /// - aligned to `layout.align()`,
> >> +    ///
> >> +    /// Additionally, `Flags` are honored as documented in
> >> +    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flag=
s>.
> >> +    fn alloc_node(
> >> +        layout: Layout,
> >> +        flags: Flags,
> >> +        nid: NumaNode,
> >> +    ) -> Result<NonNull<[u8]>, AllocError> {
> >> +        // SAFETY: Passing `None` to `realloc_node` is valid by its s=
afety requirements and
> >> +        // asks for a new memory allocation.
> >> +        unsafe { Self::realloc_node(None, layout, Layout::new::<()>()=
, flags, nid) }
> >> +    }
> >> +
> >> +    /// Re-allocate an existing memory allocation to satisfy the requ=
ested `layout` and
> >> +    /// a specific NUMA node request to allocate the memory for.
> >> +    ///
> >> +    /// Systems employing a Non Uniform Memory Access (NUMA) architec=
ture contain collections of
> >> +    /// hardware resources including processors, memory, and I/O buse=
s, that comprise what is
> >> +    /// commonly known as a NUMA node.
> >> +    ///
> >> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which i=
s a non-negative
> >> +    /// integer if a node needs to be specified, or NO_NODE if the ca=
ller doesn't care.
> >>     ///
> >>     /// If the requested size is zero, `realloc` behaves equivalent to=
 `free`.
> >>     ///
> >> @@ -191,13 +249,27 @@ fn alloc(layout: Layout, flags: Flags) -> Result=
<NonNull<[u8]>, AllocError> {
> >>     ///   and old size, i.e. `ret_ptr[0..min(layout.size(), old_layout=
.size())] =3D=3D
> >>     ///   p[0..min(layout.size(), old_layout.size())]`.
> >>     /// - when the return value is `Err(AllocError)`, then `ptr` is st=
ill valid.
> >> -    unsafe fn realloc(
> >> +    unsafe fn realloc_node(
> >>         ptr: Option<NonNull<u8>>,
> >>         layout: Layout,
> >>         old_layout: Layout,
> >>         flags: Flags,
> >> +        nid: NumaNode,
> >>     ) -> Result<NonNull<[u8]>, AllocError>;
> >>=20
> >> +    /// Re-allocate an existing memory allocation to satisfy the requ=
ested `layout`. This
> >> +    /// function works exactly as realloc_node() but it doesn't give =
the ability to specify
> >> +    /// the NUMA node in the call.
> >> +    unsafe fn realloc(
> >> +        ptr: Option<NonNull<u8>>,
> >> +        layout: Layout,
> >> +        old_layout: Layout,
> >> +        flags: Flags,
> >> +    ) -> Result<NonNull<[u8]>, AllocError> {
> >> +        // SAFETY: guaranteed by realloc_node()
> >> +        unsafe { Self::realloc_node(ptr, layout, old_layout, flags, N=
umaNode::NO_NODE) }
> >> +    }
> >=20
> > I think Alice suggested to just drop alloc_node() and realloc_node() an=
d make
> > alloc() and realloc() always take a NumaNode argument.
> >=20
> > I don't have a strong preference, but keeping only alloc() and realloc(=
) for
> > seems indeed simpler, so let's remove the _node() variants.
>=20
> I don=E2=80=99t have a strong preference either but if I modify alloc() a=
nd
> realloc(), I=E2=80=99ll have to change KVec and KBox in the same patch, w=
ould
> that be okay with you?

That's okay with me.

Alice
