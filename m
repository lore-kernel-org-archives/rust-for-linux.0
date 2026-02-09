Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299B1917ED
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625074; cv=none; b=iFBz9fMOeBgDUSuS75VIUNfq5GLem8IFdIq7H4P8JBhR4b3sUSZEz2Lj5VtF6zZkLi/1Y90iDv+EncR+GPqPjoIEYC3LvJVHkZPKQyHbRLcm36YXCtXLJy6my2UWSRjv5QK+8W0QmGLIbWxxy4r091Okpbiyvac2lkFR68RCOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625074; c=relaxed/simple;
	bh=zFDpVKRMkVe5iJVgiBZa9Tuu7zxAS/VpZi7BrdiIBvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I2Onn5jRfvvdURcWMNX5HoUIVPLp8TepSlL6tToO87SbO/bMd3c6HMVUduUbh3Rhd8zWD4WIXLoHQMgaRfLlSX+y9qk9JA5t3DR7mOB7D1MKRNNn83AeqOizKEz3yQAdGy16ePFp5coVwZyWMzn9dxFwMtXF7EtmNHgC4pXZZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GmKjkHiP; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmKjkHiP"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-480686b3b4cso53482015e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 00:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770625072; x=1771229872; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SeGw7/2R45wt+F+U7+OwOP9BoBU6gDAUvmlJQ70/hk4=;
        b=GmKjkHiPieZ5nQr0k5u+zjUkEpw4C7e7W/iZrihGZ/WPS8peZk0omVcCooCyTWTgUC
         qkq1pw821VkRxXRUd6oQMmTTyqCrO2UWDZddZ1VaI8Ihb1ERLzQ1aoguo/ieELXQJElN
         ZfktHh+7Vu3skOw49iG12XRjlWS3nDoZcBcXD7NjBC5gNFzSu+FBKhUeb0ofYYFlAEWV
         18+pnkGF8wr10VQb8OTdajfkgfb8URov3ccKvM/s1R3ikVD+0Iy8RyjnOnCzjpJjd4Tg
         nfxeGaVkdeWeegLYoZzEgr3n+pc0GWYhhUwijqXHj5KEWIXsAvJ15hmWkc1iQg7qQ2TC
         pU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770625072; x=1771229872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeGw7/2R45wt+F+U7+OwOP9BoBU6gDAUvmlJQ70/hk4=;
        b=SSjLAbl2a4LjOv3QtDmGOkeftKBmK7vtl4JSCnsLf3CabCUlwPGzG4b0AKgJiVo77x
         abfIMpWEhlo1FP5HXHrI9wbogSLZI0pkKHKuGR2dr6rgYM/0r/vlJtTJLhuKdj8qkVHC
         qXo7oQCMcfGu0IfrMG3RbpVBVFPL0cHIu88t5wcOywMIB38Pgp5vtTvAHn/a7UOakX0I
         hntSZfBvqkVpxe8cr5IU4O/6qb60KC+jGGKMGVlE4c3LbSGvXhPCTd7wI9MHLzGg5pMY
         OeVHHh0HWo3w2W4AVyJ7tEKGmfsl4qGZP7sp9IEm/X9D4CCG3dSRrmsrrk22cEhIwO5Q
         JGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvu5K7lSu3OerRccHaOW8J0kujfn/9/6hYGe3t3WtU5bJ9kTasjldV6ZFZLnw5ICxlw+0kvm2oohVgoxikwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxb7YcQTLf3yOpbrCW6zaShzOomrZMkF7e8xbnHt1gYnOUwrMj
	5BHhZIB016fRkk9K+HdwV6YtGihYWwFgolo1HVk1oXsyd/yRDainCl3YEkhuXgHr/t6tOhHAlDn
	J+KJ1AxYwnZCdMiMQvg==
X-Received: from wmqi17.prod.google.com ([2002:a05:600c:3551:b0:480:4a03:7b63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3590:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-48320236b01mr159936025e9.30.1770625072160;
 Mon, 09 Feb 2026 00:17:52 -0800 (PST)
Date: Mon, 9 Feb 2026 08:17:51 +0000
In-Reply-To: <aYZMXiv4GvyjPxoa@um790>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com> <aYZMXiv4GvyjPxoa@um790>
Message-ID: <aYmYL8DP7zWCEPYX@google.com>
Subject: Re: [PATCH v4 6/6] rust: gpuvm: add GpuVmCore::sm_map()
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 12:17:34PM -0800, Deborah Brouwer wrote:
> Hi Alice, I got a build error testing gpuvm v4 with Tyr.
> 
> On Fri, Jan 30, 2026 at 02:24:15PM +0000, Alice Ryhl wrote:
> > Finally also add the operation for creating new mappings. Mapping
> > operations need extra data in the context since they involve a vm_bo
> > coming from the outside.
> > 
> > Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > +}
> > +
> > +impl<'op, T: DriverGpuVm> OpMap<'op, T> {
> > +    /// The base address of the new mapping.
> > +    pub fn addr(&self) -> u64 {
> > +        self.op.va.addr
> > +    }
> > +
> > +    /// The length of the new mapping.
> > +    pub fn length(&self) -> u64 {
> > +        self.op.va.range
> > +    }
> > +
> > +    /// The offset within the [`drm_gem_object`](crate::gem::Object).
> > +    pub fn gem_offset(&self) -> u64 {
> > +        self.op.gem.offset
> > +    }
> > +
> > +    /// The [`drm_gem_object`](crate::gem::Object) to map.
> > +    pub fn obj(&self) -> &T::Object {
> > +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> > +        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
> > +    }
> > +
> > +    /// The [`GpuVmBo`] that the new VA will be associated with.
> > +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> > +        self.vm_bo
> > +    }
> > +
> > +    /// Use the pre-allocated VA to carry out this map operation.
> > +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
> > +        let va = va.prepare(va_data);
> > +        // SAFETY: By the type invariants we may access the interval tree.
> > +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
> > +
> > +        let _gpuva_guard = self.vm_bo().lock_gpuva();
> > +        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
> > +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> > +
> > +        OpMapped {
> > +            _invariant: self._invariant,
> > +        }
> 
> error[E0308]: mismatched types
>   --> rust/kernel/drm/gpuvm/sm_ops.rs:98:25
>    |
> 98 |             _invariant: self._invariant,
>    |                         ^^^^^^^^^^^^^^^ expected `PhantomData<*mut &mut T>`, found `PhantomData<fn(&mut T) -> fn(&mut T)>`
>    |
>    = note: expected struct `core::marker::PhantomData<*mut &mut T>`
>               found struct `core::marker::PhantomData<fn(&'op mut T) -> fn(&'op mut T)>`
> 
> Updating the PhantomData type for OpMapped to match OpMap
> seems to fix it.

Hm. I thought I fixed this error. But perhaps it did not included in the
sent version for some reason?

Thanks in any case.

Alice
