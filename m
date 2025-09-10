Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2130648C
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 06:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757486390; cv=none; b=ej06bKN0GDmyb8nyVQfKr8cztlpG1fSuL8LVdnQt2KMNDofzweRQ2lo+VU9gboc5IlqGmEbrHxcon2HRIjP9+wBMP12tvdEaFa/EtMUfOypeo/RABnBuC8JBESU3LvjUwTp3+yuokcx1ySIBzmQgiBxYFVGp3T51ARkAmFD4PZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757486390; c=relaxed/simple;
	bh=rfQe+ePDp4Zo0AgaP4d2M/YN/CS2BDKY5Aq9m9aG2wI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SZ55NFgF2vauht9RhP39MYVMSUcNiAxBoILX96canuIZOyGPfcUmhJbcIRo6l5nPPJq/AdHUreeW1kz10gbjsXl11pVGrny+5weporbQrx0UYlUGgsBuOrIsAZ57Twm8d4kkYFzC609+l0gJA4Pxe2/7Smajru9h2z5PZhZpmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfA9CzK1; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfA9CzK1"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b046fc9f28bso554960466b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757486387; x=1758091187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZgO5jwANFMehJfMoLYUsZTxd5NY3ndlOci6BOUflzQ=;
        b=sfA9CzK13Vexf+5Y5pM3KwocHcTeSTzAoISTLeF2IRgev8EvfJ/Y+XOsZMmwq80ma/
         t7gHyDuaWeeVXSDmViqqjkfjYkMFkxJ2NSxMBAq9ALlqRQkGDV6mbYibUYZEoDZCdikw
         ixM0gc1hIizGNhaC9uw2PAwAfwKLlcNpV8vSY2Xl0v+25YBraocT2/Zb+mbeiMrLsojj
         hH5HANPsWyYf4CX/P3r+pMKCQbPbAw+u/I6810PyENH5LZs6nWGItNAdYGpIhTLfgUpQ
         cCC/iS/Mj1IQCWA6FjsNsj+O9v4B6JX6lwnkSDG/o8naR4oyB99VjwqcW/2npXMYxX1S
         frfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757486387; x=1758091187;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ZgO5jwANFMehJfMoLYUsZTxd5NY3ndlOci6BOUflzQ=;
        b=C5y5xqHA7Ws4CPyAux7CEfMcluGBFJd/wUo5D68R77Y7OhNZE9ZYEsLbYsvjWvnzXy
         55phVdRoTOIrM3Jo+Grtr/Cw9fknrS0iZp3umNBiGxBlzViv1FVLJsqmU3hwjPImbb2m
         nMt0mXbC8GsWkJrCKtaX7hpM8G8LFRbFACbLBS3/xKL3EOiEtvLCKFo+UMB141fcTTDj
         kYZBR7xA1c3+gYh6TxKLvPecJFMANA09C+q1FPzbRv8BHbsiSQKDlwAEW84EpMlgmK5Y
         ErMTBfdaGPNYlQgaNJCi3CLeqTN32NtQV0JPPMxZGvsfN1+++0aFFJP59bawJUkzLxLD
         iblQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0WpeXpdciOmgPtoDWPy6aeEiOoXYO4O0bUBjQUXqmflRdT8fmwNbfwR5OgfQR72ZeX2okvIqOfUqcQqRmVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhelvbfiQDThws0aYhb48U0j+2yuSPG0dLscyGXxL5GXtVirc4
	zfRrmYH4b4BN9l+mqk1gO3Wr4R/g7kCu4HU+1xn+bLSISjdTyvBPSeKVpn2e4eZc/55ER/DKgj8
	BsgdL/fSeJtSfEpYlgg==
X-Google-Smtp-Source: AGHT+IF290sfWDJWyXR0CbzZnHAG1Yyq7SWKBAx8oPF32kqB1mi5kcbwO1hzeAGXP44801EWVIisUmt4Rpwov5g=
X-Received: from edh22.prod.google.com ([2002:a05:6402:5056:b0:62b:f094:4936])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f2a:b0:b04:9d90:a7e6 with SMTP id a640c23a62f3a-b04b1741ac2mr1432308366b.55.1757486387560;
 Tue, 09 Sep 2025 23:39:47 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:39:46 +0000
In-Reply-To: <c7a7aac3e82fde7a20970e6a65d200ab79804b0f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-1-9835d7349089@google.com> <c7a7aac3e82fde7a20970e6a65d200ab79804b0f.camel@linux.intel.com>
Message-ID: <aMEdMg_3ljC27i1-@google.com>
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 04:20:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> On Tue, 2025-09-09 at 13:36 +0000, Alice Ryhl wrote:
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> >=20
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which
> > you
> > =C2=A0=C2=A0 can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often
> > going
> > =C2=A0=C2=A0 to be unsafe to call from the fence signalling critical pa=
th.
> >=20
> > To solve these issues, add a deferred version of drm_gpuvm_unlink()
> > that
> > adds the vm_bo to a deferred cleanup list, and then clean it up
> > later.
> >=20
> > The new methods take the GEMs GPUVA lock internally rather than
> > letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means
> > that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> >=20
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_gpuvm.c | 174
> > ++++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++++++=
+
> > =C2=A02 files changed, 200 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > b/drivers/gpu/drm/drm_gpuvm.c
> > index
> > 78a1a4f095095e9379bdf604d583f6c8b9863ccb..5aa8b3813019705f70101950af2
> > d8fe4e648e9d0 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -876,6 +876,27 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm,
> > spinlock_t *lock,
> > =C2=A0	cond_spin_unlock(lock, !!lock);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled
>=20
> NIT: Is zombie a better name than dead?

I could see that name make sense.

> > =C2=A0/**
> > =C2=A0 * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> > =C2=A0 * @__vm_bo: the &drm_gpuvm_bo
> > @@ -1081,6 +1102,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
> > char *name,
> > =C2=A0	INIT_LIST_HEAD(&gpuvm->evict.list);
> > =C2=A0	spin_lock_init(&gpuvm->evict.lock);
> > =C2=A0
> > +	INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> > +	spin_lock_init(&gpuvm->bo_defer.lock);
> > +
>=20
> This list appears to exactly follow the pattern a lockless list was
> designed for. Saves some space in the vm_bo and gets rid of the
> excessive locking. <include/linux/llist.h>

Good point.

Alice
