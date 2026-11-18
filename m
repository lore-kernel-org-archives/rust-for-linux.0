Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028326;
	b=l7s3ZP7ISkLr18Ii4EHRLdieNi6SRwqbP9OGWFifGDfQ4xv2jHMoJXVpKtT4H4deX3vq
	 k292NHA7AtVhS8HCM00ESQCism+H29MvDiE5/q7z5zLFmr1jQBOLwIi9UuFM24bteuTaq
	 Uy6QhTCWJ2xwhyBw1NQJ8bABvsY3W2ASNh8vhwAC2z6DmCtUHwYpltA8swMJ/nhf1frKf
	 wDeRRUQH9StLITOEThkIiBf6dt8ouDvWEzkPCV7i4tUJLRiPa8sjP1o5J7w/E+5fcF1MF
	 Ke6doqajPL9iABdQtjRDtPMewVg18Rx1xChB8flL3QNA5431P1S8ygTMDNOlw3Z6bYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
	b=TlOKZ4y8DQaTcxY4afUnsCIMUL5LK45iDXfo8GXm4gxVYYd+CDeQsL9bbLB9ZrvlbT4h
	 MxbR2P6tKDmHf2MZ2ichFzTccSDm3gb1Rqq0pOCYVZMrPFoZQ6gl0xqehV6vYdbddS5FS
	 aeCkP/kl1zOxz0ySEoX+5t9qUn7vrAlzhGJYc4L3mcUC59lI0/U4hWFbBvT3gBeNGzlWM
	 ENhkebkaUptLN6UJpwFcT/FK+m6nUHPAzvyrqx/UT6FlTZm1f2uunASYTFIocpD2Had+J
	 XwPiEDRmXQSw0Xcgrq9MctUasg2Mr2/PQqVbgvtrmlzjCaL1YNdO4MP9Nmh1HJ6oPgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F9We98XN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A560A2611
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 18:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981A560A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F9We98XN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb62d40736so4215e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 10:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795028314; cv=none;
        d=google.com; s=arc-20260327;
        b=qurz+Rl2oWyjKuY+iG4s4ApcYLmpTyqmaa3UUdinMnaBx5lph9Lp4VOjBitQFJdD5Y
         dAU4NK3lwzuHugWeLaXb4jFvDERgLIJKsZQEGSXhZSjhlSy0Ew+nZyDv2KcMNf92J8iy
         v0k7qVhQbW8VdcXZGpGLnxWkgazIPoNBm4j4c3ro8RJrVILlcPKhUxO33RzZTC0k3A6f
         swKJUkq2eN38213rujwyeRdONffclFTQrt7FeY8dXyYAYgJHVoeiEzgJAh7EunBI8nUb
         7DIwmsktpyd0pFktWuIlqW3B5xq+IVyzVI/5I6/DLUwh4Qdhabb2x9DsFlwSy1GYW3+U
         Vxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        fh=Y43NUmPdCuQfxtHJxmaLZDjdjkm+iascDEiDl08K8iE=;
        b=eKlvHduXxya+sJ3wDieEtpDpikG5zuX5ilXFPpdqU0rkx8xGN1dMWqWGhr75mESbNM
         8c92rnYTXP2VDjkKzyPaF7+gFd5XlBWE0YY+RNhQOMRGo4hKdJRPxUTSSbxSWij9beKS
         jjbrk1BJeXOcbEo8soHvX+QhmFb6rrCv+p7z8QHtram6rPHubd6TC7xJWK1L3XmG6Aon
         TC6djTFpjCr/kYDyP/vc0MLq4DqCF7p4ERpubq/MWFBkpveMLnJ2I7DdzLzRRtzoEsIi
         05nh9otZd+svWPXb/v27vRx2qkY8VA0pCYj/3XQiWPd2PeUHmV59q4FUPRMCN5ueTDRJ
         V+qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795028314; x=1795633114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=F9We98XNxwEBIks/3AYeT70ES1muTwDULsZ3smWcjmbyi68BeNmCoE5UKaa+QP20IU
         idVv3Ly9x+C69lvE4uQnSg9efmRha+lnASsrXtxS4zwprkmt0yKozwHmfe8KUIlEEM1F
         MmNxuNKQbY7AvJzbXzeOT9p+l+2Xgb9QUPSuHSU2buIZybf4nsmFs5Si3KkhQiS/ROQO
         KEOygG+Nfq+3axzLPY+SMkV+ZUmjt5GMPFLwJieAzlUp8kFR9eiOtLj1FUmg1UMn1spb
         JKU6l3MlsNypoBwoz/NLDr9bLqZf87p6NhGjXigdQktEnh4jGshBesGgYHJ4+q8nrB12
         sS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028314; x=1795633114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=GWG+s6yvBQpHzTUwYZJklR4BIDmvvag2knGeqvmYrQISzCZTqgrwT01YNwnr3h5szU
         aaiX0vnIys1CfIrgpsuyyYhG4MrKCZ7/TqKZuFv33CWCYL8D6jqxjmoW3/0b3CbNxdub
         PjUbYb7vnoG9oe3CQdQjHYRIoRhYlup0DMPRf3PK9LZaI3Eww4Hj2gWeCEC1GOEDZe5Y
         wDbgPeOm9xiD9nDLptHfirchsKSyPUMH2Tt+G+TL062PHDfgpwIeWvozCAs4G6jB1ky4
         DmPgEb8ehS3XAlT6g6ktyLK/1UVeApbrYwqjrhxOax7mPVd4yac9r/CTJ8AkIYukOKM/
         9Kdw==
X-Forwarded-Encrypted: i=1; AL+hErEUncW5cRIfe+fqhJFzrYaTEt8KAMtu8eJqP7/qO9UQz6V13ev2ZcFRddMdoF+FLlfn+Ttjo8h55oDc8u50qQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GJJTiXJrwhs7EInu6EgPeCm/v4FqQTye5VQ8wE/62Muva91HL
	k/SvEfYMs9UvuOefPqz5uVfl7NnmVPhwPfz/iBML7sfJoAXftTZ7VAm+lYrr6hm7HPp76BDUvRU
	OotmB9GMqtBENdW0QZRzNW+iuNS4p9jyiGvXtHX2d
X-Gm-Gg: AYBFou3Dh5BcZsVCrF/6y2wUDP6Nznti6ENtVVKH401bOObjLhkLNHRchNGebWdJhx8
	Hp3joj80LNQC8DJWdV8j6rwFdrd404nCYnnsRu0lVKw2vsHd88vAI1AWjeggljGXpuQapQfn8bH
	3szlTNGhXJ9lr5UlAdOX+Nc4aixjkbN6U8/3pavfGEHm65c/iW3IjugBtpCltsBIcNBfG9I8yzM
	h8XwuWxJu0alhQ8efPiIAc0wlutGDC4iJE6QKORQcH3TjgiDNvDXF4c4MfPOa1y5hgOeyt9oiML
	fWhwFxYFykLipLgSx+6YvkT6//9FQNjRQ14slrekNGDVOSY5Shb9GUm8x6SSY2VsqHbcVKQnWpj
	Kq3KXMI0D+dYnY/TruR81JejMgJQqYc8IseOLwij2ojXZKcBVPTnFsxbWq5pWEOnrGWs1QNV6fn
	YwOibAAKQN75IX
X-Received: by 2002:a05:600c:840c:b0:49f:ddcf:45b7 with SMTP id
 5b1f17b1804b1-4bb83c9025emr23355e9.10.1795028313968; Wed, 18 Nov 2026
 10:58:33 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net> <20261118114102.490384-1-aliceryhl@google.com>
In-Reply-To: <20261118114102.490384-1-aliceryhl@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 10:57:56 -0800
X-Gm-Features: Aa3M54rtfthEgFiAPOcV53y3ZwydiRtVUQnZ06u4pa0OMeOurh1hyDTgkerw9LE
Message-ID: <CABCJKudrDOu3sD6J5LN4o3XF9JrU85pZK4DUXNH4d9iC363bEA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Janne Grunau <j@jannau.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > For a prime-imported BO with no `gem_create_object` callback,
> > `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> > drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> > wrapper. A later `container_of!()` from a `drm_gem_object` back to
> > `Object<T>` then runs past the allocation and corrupts the heap.
> >
> > Provide a `gem_create_object` callback that allocates the full
> > `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> > returned pointer is at offset zero, satisfying the `kfree()` on the
> > init-failure path. This is now compile-checked with `const_assert!`.
> >
> > Imported BOs have no userspace creation arguments, so extend
> > `DriverObject` with a `create_imported(dev, size)` constructor and
> > implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
> ...
> > +    /// Create a new driver data object for a GEM object that is being=
 imported
> > +    /// from another driver (e.g. via dma-buf).
> > +    ///
> > +    /// Imported objects are allocated by the importing helper, which =
only
> > +    /// provides the device and size. There is no driver-supplied
> > +    /// [`DriverObject::Args`], so drivers must initialize the per-obj=
ect
> > +    /// state without those arguments.
> > +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -=
> impl PinInit<Self, Error>;
> ...
> > +        // SAFETY: We never move out of `self`. Ownership of the alloc=
ation is transferred to the
> > +        // C side, which will run `__drm_gem_shmem_init()` next and la=
ter free us via
> > +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init(=
)` error path, matching the
> > +        // C kzalloc fallback contract).
> > +        let new =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(=
new) });
> > +
> > +        // SAFETY: `new` was just produced by `KBox::into_raw` and so =
is a valid pointer to an
> > +        // initialized `Self`. `obj.base` is the embedded `drm_gem_obj=
ect` the caller expects.
> > +        unsafe { &raw mut (*(*new).obj.get()).base }
> > +    }
>
> I ran this through a review agent, and it found these two things. As far =
as I
> can tell, these are valid concerns.
>
> 1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create(=
)`
>    calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
>    Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the s=
lab
>    allocation, but it skips running `Drop` on `Object<T>` and `inner: T`.=
 If a
>    driver's `T` owns any fields with non-trivial `Drop` implementations
>    initialized in `T::create_imported()`, they will be leaked if
>    `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
>    fails).

I agree, this looks like a valid issue.

> 2. `Object<T>::ALLOC_OPS` also sets:
>
>        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
>
>    `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
>    `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callb=
ack()`,
>    and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create=
`
>    (not `DRIVER_MODESET`). So `T::create_imported()` can also be called t=
o
>    create a non-imported dumb buffer (`obj.is_imported() =3D=3D false`).
>
> Instead of implementing `gem_create_object`, what do you think about
> exporting a `private =3D true` counterpart to `drm_gem_shmem_init()` (sim=
ilar to
> commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
> drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table=
`
> callback on `shmem::Object<T>` directly, and setting `dumb_create: None` =
in
> `Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Ru=
st
> across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` r=
uns
> normally on error and `obj` does not need to sit at offset 0 for `kfree(o=
bj)`.

A later commit in tyr-dev lets drivers opt out of dumb_create, which
addresses this part. However, your proposal sounds cleaner and fixes
both issues, so let's go with that.

Sami
