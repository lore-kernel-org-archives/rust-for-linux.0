Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A552D2AF
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894585; cv=none; b=tAwPrgWLgzlbrGUdytWpopX1iRddWBmBNxK7Bu+vzXMDm/6C1qJpTHtFNipxyYa6qUX1WdRa8pkf8Fy5iwC6CAGa4oIOWolam2iiBx/UAOFeccdLZ7mYxCn3F4d39ZL+hVvzsXuXYzTi4ZEmAyBjeKsPjxLp4kJ5QaJK4zM+Bt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894585; c=relaxed/simple;
	bh=IcAawRnObFPysnJmjNwytmKHCHwqA3DD3ILgLIKfS0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Rm4lVTk2zIHq/3uoOqze+KRTreuturdBjYZ2Wh/2QpK9fefrn+VjdVh4QFRi0FTvc4qvPdRbkooWrLdTdhXdwcmPNo5467Op1C3xU+6V+ziRIqxUhNZMx2Se/R7WJaUnEhgKJKQ8SlqohZ4RrWE6GpgCckIhEyHnt3OY3+8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTEf092u; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTEf092u"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a34f7ebcedso42921431fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894582; x=1789499382; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=OTEf092uMsYIJV0Zso0FXSpDMWYZg63a6f8i2200U+haujy7iKqxrLPUfbJ4MKnotj
         3oCXokY5TG+d9XEwDpbgrXNFT6Eg38VCORRP5dRcnwcTiZRO6c/trgg2QJ53B10W6qEU
         AjMV7bRrrs2tiwqnBp9xsf26eCO4DWEF3AGy/tVqwSzOQNqIhSRiXcHhuyNLZEOWM1Oj
         tN9i+8fYi6UA42cvfQQ/56Oc0Z2pRxuPrNFJglg37YtoHFPA2go387LTxFDFKuidShSz
         YS95UEXtDYrsWxtXRbxRhJCMiFHSGYe7IyNNe18Mf7LlPFdIo0tf6DtKJNN+mlyTIOAP
         rGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894582; x=1789499382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=Pc38b6BKffglFTFO1vHzVtOJfwpezs8WN+9EbOWQKGTLURoxFWCMeMYiIxed5Xw2gM
         DfJdkktp5ERG6iu3WaAr/olJmLybnJKbWrwppGmiL+Lr8vT4txLhD6CUuyHPgGPjJ1jk
         3ruwCrtpOYQ7zpuG39qVwZy3gsKqeQmj971sl//jyC98iDAVfZ017Yz3KFTCSsfjfBoM
         8wVfxuLvxrYuyjhgKRQnlxXet2J4XF5YkLmYP0MU1S9vWRjc9uYUdXM9Bk+jsI0UvCHT
         +WlcMwtXl4r1EDJymboCDsINYeyzTeXXO4GmXK4BXYWqbSw1Sya/hrJvjdAKnt7S/iFd
         yP7g==
X-Forwarded-Encrypted: i=1; AKwUvBw/2R/bl2fFt0Z0VhFp6fUoVVy3ZcEqcwGIIwZhiJz4/HhsvIxiDh8fNK/mJg2LcTHQmsheqzU1+RWYrgsCcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lSNxzw4kWMJHDUuCbPb3XsDqlrJoJAWysBE+KxFhWrw4ageqlS
	F8/+nu83N8aLaxnK9id9a/uwHYlOCDuWCmehkT2JFnDAZIJXfx8uOjib
X-Gm-Gg: AYBFou3Va+uwdxzon+E7qb10bo3ZnmdHiUKSMOb4FU876JpzGtsnbevJXxk5eGT2Qr+
	vyaKImSZtm0uGp5xYYE2b+EeKrqP8ObGGFPwrVx9DE+eOqgDpXbh7ayqdQmUzeS95Xp7w/iu8Ap
	KlQ5Bd03hKJiCRoYGjTpmTs1QhA7kp3nL6D55avxQ3sdxGFdY3nqt2JG8NT/Eb0L0wY17fSl3Fq
	WdSY7+LVgutSbfqSOgk5/gRwnNDSqM3Cb+0vOYh8uxD8STO535IqZL6bU2tqN8EIQ/ZkjDQg6LA
	GneceQ2yiWWqozQovT/DcJ+IZy/pZ4NOWJ+sbVabjSj1l+vp4xDMxV0KmyAUvwmfG2pof8xQmcs
	40fGmlsfDL90htgmFJO9drPj/5AbhNJr6mZWkgYBLpNWuEqmbzhpYFQr5Do34IPZcC39lh5VU4H
	eBtkR2eYAt0aPw2o0sYjWEmLDHxUCWiikXM+5w7bdOb3nalWB3m33RZBB60cKFsWVPcLtSelVLh
	da1
X-Received: by 2002:a05:6512:15a1:b0:5b5:e3b9:2236 with SMTP id 2adb3069b0e04-5b616edef30mr4548116e87.1.1788894581868;
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4dcsm3212290e87.20.2026.09.08.12.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:09:40 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBdJY43QlnN5wnx@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
 <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqBX1siwtKuBTXBE@soda.int.kasm.eu>

On 2026-09-08 20:57:05 +0200, Klara Modin wrote:
> On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> > --
> > 
> > commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> > Author: Klara Modin <klarasmodin@gmail.com>
> > 
> > rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> > 
> > This commit updates the drm_gem_object_funcs struct initialization in the DRM
> > GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> > unused callbacks. This fixes a build failure caused by a newly added callback
> > field in the C structure.
> > 
> > Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> > 
> > > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > > --- a/rust/kernel/drm/gem/mod.rs
> > > +++ b/rust/kernel/drm/gem/mod.rs
> > > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > >          free: Some(Self::free_callback),
> > >          open: Some(open_callback::<T>),
> > >          close: Some(close_callback::<T>),
> > > -        print_info: None,
> > > -        export: None,
> > > -        pin: None,
> > > -        unpin: None,
> > > -        get_sg_table: None,
> > > -        vmap: None,
> > > -        vunmap: None,
> > > -        mmap: None,
> > > -        status: None,
> > >          vm_ops: core::ptr::null_mut(),
> > > -        evict: None,
> > > -        rss: None,
> > > +        ..pin_init::zeroed()
> > >      };
> > 
> > [Severity: Medium]-
> > Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> > 
> > The VTABLE initialization in shmem.rs explicitly lists fields without
> > using pin_init::zeroed(), similar to what was fixed here. When compiling
> > with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> > field error for the newly added handle_free callback?
> 
> Sure, but it should probably be a different patch in that case. The
> current patch fixes an issue to a currently existing build failure,
> while the issue mentioned here has not manifested yet.

On second thought, this is seems to be using the same binding so this
might be accurate.

> 
> Regards,
> Klara Modin
> 
> > 
> > rust/kernel/drm/gem/shmem.rs:
> >     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> >         free: Some(Self::free_callback),
> >         open: Some(super::open_callback::<T>),
> >         close: Some(super::close_callback::<T>),
> >         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> >         export: None,
> >         pin: Some(bindings::drm_gem_shmem_object_pin),
> >         unpin: Some(bindings::drm_gem_shmem_object_unpin),
> >         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> >         vmap: Some(bindings::drm_gem_shmem_object_vmap),
> >         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> >         mmap: Some(bindings::drm_gem_shmem_object_mmap),
> >         status: None,
> >         rss: None,
> >         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> >         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
> >         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> >         evict: None,
> >     };
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
