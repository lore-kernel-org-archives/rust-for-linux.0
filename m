Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0882773E2
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Oct 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321342; cv=none; b=i8fqPmr+x2BlXTAd59aZXlyFB8ItYTcQ9GdKDN7VE9E0xFmYQ5jNmK70t638VI/stFmlHiwwA9jNeSmaCLTrpalsX+kGgnqfruHNkUiksGLslNV8Rq6HVVWZtnPvg8+d5GAN3W6otqVWE157d0mK8twh+k83CLXCYOPybTZuY8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321342; c=relaxed/simple;
	bh=kHDEBMlRyYfq9Qpx6fzdLyJV2Ddl52yaDt+G0TFGoog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djyuReNvp8EEHQGC68C/FCmaAXJPd/FQaqq1YK+ehoAtMap+fd3a/7rzjuCQbVPbTB6CALaE7Zxcw5tFk+ovO2PiVmRK36tzyiynarPWLL8u8JKNqyy6ASXNtmdooeytBWnVcj0Ae2YYUSGPRxNNZmoCG/IKEWGnHyJalE0ojSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aKexHxne; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aKexHxne"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso5718591f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Oct 2025 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759321339; x=1759926139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k2YPnYpTeocGDnPW4kRnjX7clgQT+hRQcscQ/Gjw0I=;
        b=aKexHxneqY3Ea4NioXYUWLQTfRkiDEODja6Y3GX1n48raD+bmrc9B16mBozcQSSfHq
         GwIAfF/CBE0QwOOdXkdgwmH3Mf/dUCBCxf6k84ybYuILhJ/Kize87ne9WWcUVHkJYHtX
         D66m6OqBoG9dhnfjXD1HCz3AvJecq4ZIuRfvjCj+KW7mUm+Q5rPfDNcfNEB11u6IVsID
         O6P6fJ/ZHTchmoVdfhnsjn9gYrBL2Ipc1ZHRBMPJa9UxAB4rMqRY/NKJE09gxya/+qgc
         IDtlQgAY1lPH9GrzQSyVZ6Y3qewzTvr54HeBeNEhA6hErvqoBoawHgHoJVi2yyACMPlb
         Tsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759321339; x=1759926139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4k2YPnYpTeocGDnPW4kRnjX7clgQT+hRQcscQ/Gjw0I=;
        b=dSW3IX0vk625oHpPvE7m4rNFI0WTTwyyMXGAIkSXL0X+qId4jqv4Cncg2/1ENVc4Hw
         bPTVdAk3DZkrcLWDfOkx0V7yv3uAS3hR+OF5dE0jJqQSEmBIkxChr4q4dXorXAFmu7f8
         YtGIoVwv5vV564jVtdkh2omrwInRPgpd99YXHxFtZu1q2DXlu5Qlv4KCVlgteRZDsx/G
         ifN5togB3QnQ2B0qqsEsdIxPn01ZcUYkPAOaynAozfWMZ+aGPW4RCmvXHhmyLbNtwbTD
         MtxjTXAhVovYh1OzZHHKR5WY3n4t6xiBvBUyMme8CvtC0yUk3Pvx1Baeo0FnUPY060mq
         fhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv7+ATFy5SrPAzAbZn3ZhXnKhqLD7w6DeCD227TJpU1DHmgkcWWKp3ASv0JI7SiuTTd9z0LijRuxKF2YnFtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQia2ghgQo2HQvves+Knp1zRRSXDfRdZE4v5GNXRsXhyopkxnW
	GLIE6ifrEjCXFgyDDvQ/ljfzYwIsrVW4JjtsyIYibdeNkdHmXhgP4/q/UFpvt1+RcbhR9g4gZv+
	wkkTzREx69PNPxNXYHiG6SGuup9oKD0lDz2u6o5yO
X-Gm-Gg: ASbGncttr26zfAfc7oKz0ScGDmvi2XrKii+OX0x8gWGZBpPlk6t5MemTBPqCMzs1v11
	j2jr2BONSgY0E/z2bp8WxS3WjFcvqIWpye3I5ZFg4oz8VRq3vOxKiY2x1WEVSFE6XeMynuy5ElL
	Ix4K0riZasxnnBLHk4l+/trqk0DsbhhyGyIBovg86L8uDJoLokpYJL2HUqvuTPEWdm2alyfmq/k
	nb9Nou2VcTJUlVjtPC94yFbNW8CgHvgdqDBZcT3gHIYem+1VjpYkFTBYXqPkgaoadJGMRBxYHHL
	+X4=
X-Google-Smtp-Source: AGHT+IG3VCIk2R7VMbnmr1LhtSsLbPQ7zDpOcSwc4OpQG4SjIFUGOQm+gSNB3kJAFjanSa5xTlLcIMLhvGepghxbaXI=
X-Received: by 2002:a05:6000:4312:b0:3ee:1118:df81 with SMTP id
 ffacd0b85a97d-425577ee8b5mr2278669f8f.13.1759321338841; Wed, 01 Oct 2025
 05:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com> <20251001132739.41575fa5@fedora>
 <CAH5fLghp+4dx6-JAfbSWDLz7WOdwtnLeuxdGhmVPax+HKbTv3w@mail.gmail.com>
 <20251001140418.57fb21f1@fedora> <20251001141310.0817a6c7@fedora>
In-Reply-To: <20251001141310.0817a6c7@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 14:22:06 +0200
X-Gm-Features: AS18NWA7BS6q7-t3jyQcR-z-MICVMgzBJOLG-P-oeqz_y5Sd-FpSBw2OYVPI4bc
Message-ID: <CAH5fLghu01gTnLe1Z0Z-7354QF_YMRfe5w2VG7NKTwkj+eESkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 2:13=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 1 Oct 2025 14:04:18 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
> > On Wed, 1 Oct 2025 13:45:36 +0200
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > > On Wed, Oct 1, 2025 at 1:27=E2=80=AFPM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:
> > > >
> > > > On Wed, 01 Oct 2025 10:41:36 +0000
> > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > >
> > > > > When using GPUVM in immediate mode, it is necessary to call
> > > > > drm_gpuvm_unlink() from the fence signalling critical path. Howev=
er,
> > > > > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> > > > >
> > > > > 1. drm_gpuvm_bo_put() often requires you to take resv locks, whic=
h you
> > > > >    can't do from the fence signalling critical path.
> > > > > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often =
going
> > > > >    to be unsafe to call from the fence signalling critical path.
> > > > >
> > > > > To solve these issues, add a deferred version of drm_gpuvm_unlink=
() that
> > > > > adds the vm_bo to a deferred cleanup list, and then clean it up l=
ater.
> > > > >
> > > > > The new methods take the GEMs GPUVA lock internally rather than l=
etting
> > > > > the caller do it because it also needs to perform an operation af=
ter
> > > > > releasing the mutex again. This is to prevent freeing the GEM whi=
le
> > > > > holding the mutex (more info as comments in the patch). This mean=
s that
> > > > > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> > > > >
> > > > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > >
> > > > > +/*
> > > > > + * Must be called with GEM mutex held. After releasing GEM mutex=
,
> > > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > > +{
> > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct dr=
m_gpuvm_bo,
> > > > > +                                               kref);
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > > +     }
> > > > > +
> > > > > +     list_del(&vm_bo->list.entry.gem);
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_f=
ree_locked().
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > > +{
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > >
> > > > Could we simply move this line to drm_gpuvm_bo_defer_free_locked()?
> > > > I might be missing something, but I don't really see a reason to
> > > > have it exposed as a separate operation.
> > >
> > > No, if drm_gpuvm_bo_deferred_cleanup() is called in parallel (e.g.
> > > from a workqueue as we discussed), then this can lead to kfreeing the
> > > GEM while we hold the mutex. We must not add the vm_bo until it's saf=
e
> > > to kfree the GEM. See the comment on
> > > drm_gpuvm_bo_defer_free_unlocked() below.
> >
> > Uh, right, I forgot that the lock was embedded in the BO, which we're
> > releasing a ref on in the cleanup path.
>
> Would be good to document the race in the comment saying that
> gpuva.lock shouldn't be held though.

I can move the comment in drm_gpuvm_bo_defer_free() to the function comment=
.

Alice
