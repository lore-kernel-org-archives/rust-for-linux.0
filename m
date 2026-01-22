Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960835770B
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070058; cv=none; b=CogXFXCsx8jathTppIZ6e22HthAYfnx7w2dyHan1iiN2851CZtAx/iHgcUe8MQddBYX4qWpq8+Uo+Hre6yFnavCr8/Ht7as5LfckOQfjP2bzjbffNf44aNrvkjryAZTV1QMbFEfjffEOsw/K5bfi3yhaSGlXi4izXID0t/5cFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070058; c=relaxed/simple;
	bh=9w6QFLbX0NeeTXSjGz7HKZUl36ItxnsMp+HVMGdrtt8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IdDDwxoGb25Y+l6ODl+6v9PB0VcxsadEvr2XW63TYesIQtHdzL2YFIDA/fUZ+CUuDab1T9Vwu7IIoPnHG6eTkq7PEM9jZeIjOih7HjE6TeGorWy2j41WIqCroes/6cAzvvlA1/aQ2JJ4lzM2Lax0R17ALsONYh0yPapC2ZkPiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ntr5xs5p; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ntr5xs5p"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801e2e3532so4604225e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769070054; x=1769674854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlwMpAn9Al0QHgVBZe5vJEVXfz0qnjNPXGGsZraEwjM=;
        b=Ntr5xs5p8H1lr6QAii8GgNFo5OGB+F8+p1PfR4ih/DDjCp1Iqv985amb2dl8JNdYmL
         JopT2/Yni2omeQ73NMoZWecr3bDcNIPrGXx70AbjjRPH17e10zF3lOpw+OiRFLcQbXrz
         FuuWsGs4988BPAt4dN/59ZLVkAObRNr9otyRU7A7wQLrDXIzUWi5Ok2kDicjh0rag6i5
         gbIQx8tbSiAfvdHFWOpjfIwtnZgRKT7uQZrpB6UduApvsc1SGZEF+jxGN8nl0VQRdFUi
         KrHvPcxxmnW+TAwj5yhoeBKTiW8lFUPBbNnPITul3fcvBiCH7aL2aJV2V5T8hPHwEM5y
         12PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070054; x=1769674854;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PlwMpAn9Al0QHgVBZe5vJEVXfz0qnjNPXGGsZraEwjM=;
        b=ClPYqRlihvclszjIX5vM6e0l6qbU8Yj0g7PyuEHXJHSKLUMpp+NViREpj2pBs0Wkgm
         jk+skQIPhFsw3VRJfc6EV5zr+EMiXvrUHyF7Lb/E5f5F09mzWmwIpPHKLVj0GfLrgqdr
         hWmKlp/chK5sTOvL8Fcu+pN+kYOktn/e8LM9T9YaAxZ75aCpIy3ToLQ+4Kvd5bmM6278
         nh+GwjjMFmF9QounQhS2RmjkudL0/1bsre+7q+QqiROnpDZL2QzCZH39yjeswPD2O51T
         cYr9ZZh8GgstNMbkwqhPRvuCB8e7htXbDh9taIxjeHS+X/BwuKyMlhH2eOoUn9BF6yJy
         frRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWDtTYWWIbQacdiF9vgAQqv7HPBxEHGtSQlx3nhs+M5zIJC2lGd/8yggJhKjjKEOqOtbgM4oPelR5RFzzC9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynj9dp+DCKXosM1yABPjtJ2I2X1fd352J8skggeSCI0EsWr8+s
	0uNixTPEbGFeEw/kfYLCTgHnzNCGseUQ8GZMYBhA3pOSb6zoaCAFOa01n2de3bW9w69qmzgoZhn
	Loq48b0/VrJ8Xpc1CuQ==
X-Received: from wmow17.prod.google.com ([2002:a05:600c:4751:b0:47e:e4a5:c5f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6413:10b0:480:3a72:5c10 with SMTP id 5b1f17b1804b1-4803a725caemr150095185e9.16.1769070054393;
 Thu, 22 Jan 2026 00:20:54 -0800 (PST)
Date: Thu, 22 Jan 2026 08:20:53 +0000
In-Reply-To: <C31C1A08-D626-48D6-8F8C-39209BF94B50@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com> <C31C1A08-D626-48D6-8F8C-39209BF94B50@collabora.com>
Message-ID: <aXHd5aU-kV-9q_GW@google.com>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 02:31:26PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> This looks good. See a few nits below:
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > This provides a mechanism to create (or look up) VMBO instances, which
> > represent the mapping between GPUVM and GEM objects.
> >=20
> > The GpuVmBoResident<T> type can be considered like ARef<GpuVm<T>>,
> > except that no way to increment the refcount is provided.
>=20
> So this is like GpuVmCore, right? Since that is an ARef whose refcount ca=
nnot
> be incremented.

Sort of, except that GpuVmBoResident is not truly unique since you can
call obtain() twice.

> > The GpuVmBoAlloc<T> type is more akin to a pre-allocated GpuVm<T>, so
> > it's not really a GpuVm<T> yet. Its destructor could call
>=20
> Maybe you mean a pre-allocated GpuVmBo?

Yes that's what I meant.

> > drm_gpuvm_bo_destroy_not_in_lists(), but as the type is currently
> > private and never called anywhere, this perf optimization does not need
> > to happen now.
> >=20
> > Pre-allocating and obtaining the gpuvm_bo object is exposed as a single
> > step. This could theoretically be a problem if one wanted to call
> > drm_gpuvm_bo_obtain_prealloc() during the fence signalling critical
> > path, but that's not a possibility because:
> >=20
> > 1. Adding the BO to the extobj list requires the resv lock, so it canno=
t
> >   happen during the fence signalling critical path.
> > 2. obtain() requires that the BO is not in the extobj list, so obtain()
> >   must be called before adding the BO to the extobj list.
> >=20
> > Thus, drm_gpuvm_bo_obtain_prealloc() cannot be called during the fence
> > signalling critical path. (For extobjs at least.)
>=20
> What about internal objects? This is merely a sanity check from my side.

There are only two lists: extobj and evicted.

The extobj list is used to find the dma_resv locks of external objects.
This isn't required for internal ones, as they all share the resv lock
of the GPUVM itself.

> > +    #[inline]
> > +    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
> > +        // SAFETY: `r_obj` is immutable and valid for duration of GPUV=
M.
> > +        unsafe { (*(*self.as_raw()).r_obj).resv }
> > +    }
>=20
> Shouldn=E2=80=99t we call this raw_resv? Adding =E2=80=9Clock=E2=80=9D to=
 a name may incorrectly
> hint that the lock is actually taken.

Good call.

> > +    /// Custom function for allocating a `drm_gpuvm_bo`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Always safe to call.
> > +    // Unsafe to match function pointer type in C struct.
>=20
> Is this missing an extra =E2=80=9C/=E2=80=9C token? Also, I think this is=
 a bit hard to parse initially.

Well, I didn't meant to include it in the docs. But I can reformat this
to be less confusing.

> > +    /// Look up whether there is an existing [`GpuVmBo`] for this gem =
object.
> > +    #[inline]
> > +    pub(super) fn obtain(self) -> GpuVmBoResident<T> {
> > +        let me =3D ManuallyDrop::new(self);
> > +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> > +        let ptr =3D unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me=
.as_raw()) };
> > +
> > +        // If the vm_bo does not already exist, ensure that it's in th=
e extobj list.
>=20
> Wording is a bit off. Obviously only external objects should be in the ex=
tobj
> list. This is correctly captured by the check below, but the wording abov=
e
> makes it sound unconditional.

I'll update the comment. The "does not already exist" refers to the
`ptr::eq()` part of the condition, which checks whether the
pre-allocated vm_bo was created, or whether the GPUVM already has a
vm_bo for this GEM object.

> > +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj())=
 {
> > +            let resv_lock =3D me.gpuvm().raw_resv_lock();
> > +            // SAFETY: The GPUVM is still alive, so its resv lock is t=
oo.
> > +            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut(=
)) };
> > +            // SAFETY: We hold the GPUVMs resv lock.
> > +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> > +            // SAFETY: We took the lock, so we can unlock it.
> > +            unsafe { bindings::dma_resv_unlock(resv_lock) };
> > +        }
> > +
> > +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> > +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non=
-null ptr
> > +        GpuVmBoResident(unsafe { NonNull::new_unchecked(ptr.cast()) })
> > +    }
> > +}

> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Thanks for the reivew!

Alice
