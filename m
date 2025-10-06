Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD1921576E
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Oct 2025 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750329; cv=none; b=T6lz6FzXpnJeqUeFK6zdrY+4Qxw68ZKovMHRGLatIXOrQhTwsVINKAyyQTjqR/KMtD446BJNHc6yF5qKL22J2bz5FhFIvreKunAGKo/W4AQaq3jzD9jfUw0B3y3r460utpuUJkuGrSscNWK65CuGitDGzhNCGMr1NlqIjzVEj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750329; c=relaxed/simple;
	bh=9zyI5wUn+yP3XCNBMaajt+egYP+p5ZOoxZnWi2yVlvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnizGBhr+lALx7mT82+gn0haA4iQ4+1/OpEOIb2BabYG07XZ5R7+1ziw2Y2nJzPVbEHt04vXfHuxxRfbn4e9QnpXl+iOaDd2fp1mbtuTIs/OL7I838gI/rwn8xNxqK5Y6bTBecv9JQlYN7pSOFkRrKc2YNQmSQp0Ek9lBG3yUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpgnCLb9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpgnCLb9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so51890295e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Oct 2025 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759750324; x=1760355124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/iplxlQaUF8uqw0GCctn3zVGsmGXni/N09PaEXMmYs=;
        b=rpgnCLb91GOnIV9QzL8VTwVjOOeixyNSwA4Qwn+++HG+NfYoo7Bl/L6Q0nVZU7w6qr
         SzWcXlpnhJzQznssKgaQZ6uZnTKw9og3B+tQeWAoItJVEaXIy6s823Q5zpPcFPzD/cJA
         xnalPi+07gpyk3pa44vf+JFC+Ikr0pnWU31VDuIxZr9gNCwbN6Oeegq8XRIWtNU3qbb5
         uzTFpuDQFgNIFvNWxCkghcKdsiEJrLT+LVSKIPvOrir0dJNJND4wQcS1yZIa1mleOJrX
         gAudRmSM0lTH7jWJfNE9syOfeH90c7LiVYMlfgni0x3aMQpzXKjtqtg7yRirnLitb/DO
         FFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750324; x=1760355124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/iplxlQaUF8uqw0GCctn3zVGsmGXni/N09PaEXMmYs=;
        b=XFW+hYyobR4JJg/iBkoVp2uSsap5X5wYYRrLT9TqjV6eMpYE+0Y+++NULMLjRVBM8z
         V0ohPf5yCYfNSGrMSA3GAjYiPuqds4sc33HfRC4jrrq500WPfgqWff3Rtgtm/T0l0pGF
         DWKu5hWIQGDeVKJ2mk1kwQM2sTZ/4D3hYX6I69bvK80MTDeA+b7Qi8Ot338Cm+A+RxqA
         7dU+yg5GZwOiZzjNQNhxJhT/zbJNy7M6WmRjJa3Xy3YsNx/agDSbWZBMR8GByxmub8aM
         sDqy5zqVxtcc+ZZ0hDr/96UuHooNrKWgf/LX0dz0uy8aFbjM16OgnjvxDMBb4+wQMM33
         p6NA==
X-Forwarded-Encrypted: i=1; AJvYcCVaJZGCx/PVVt4OMJ8dHmRZGGqIaKY2GXTik1xoiDmu7B5fzFJotMenlicXwB5M23PJuyfHFQCBfAqA0Ccsew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/iYP08Pm1M0q3wK6eHxWDdLuK6sLwtHQuQV2c1I+NHi2SqQa
	kfDKoIWufIR/FXbCKore0DZgQ4azVdBhuVSNlhmCSwxFtOFwgNZ0nFfZI/42jOoP3zwnzBk3whY
	G+UGMWdx7c5+Jgkto54YiakmWloz5FNp6DZXBvSGp
X-Gm-Gg: ASbGncvYyXrHCjrHU5o0pU1sqQaTc8E6zH9fc2PVyQ2ZZbJv0SMIhG2UcL+DxNkINgB
	b7GqsEVy61RB/O2f9dwV62x6PxQNP0KpA8orYnF+kVRrWZCRmQ/2o8D8GcPThT7CYFTXwx55h+m
	1KjwtnCqi/R5Zy+/O0Wmttcys3n8hlYwoxF7VTYR8tnvMd9A5NYULGwgtzFDV5L8kwuw+O26i1d
	IJeEOVZz7JMAtpGvKVGBZOuWly06whJyfNz3Pw6IOGKMYBWCeHKYbOytdBt1NC1RzbC
X-Google-Smtp-Source: AGHT+IEpcDh84YyWa1tix4lg1Lgg/ufNvs/pYCPALMjra1LwuR3L8KEoSkoDlyjotjeH075DbkRbgqHtaaCqmySaT6E=
X-Received: by 2002:a05:6000:2504:b0:3ec:db0a:464c with SMTP id
 ffacd0b85a97d-425671c0c34mr8407405f8f.44.1759750323713; Mon, 06 Oct 2025
 04:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com> <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
 <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com> <20251001171346.482142eb@fedora>
In-Reply-To: <20251001171346.482142eb@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Oct 2025 13:31:51 +0200
X-Gm-Features: AS18NWBfjVHmU8SAlY0Z3pTGNokzUnHoTpGuc0sQ1pu2DdT7lAdZynJQkD-YV-o
Message-ID: <CAH5fLgjteqdWVBfzU_2iq2v=9MV9rD+s3z6i2ZjrmqBUq6_byQ@mail.gmail.com>
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

On Wed, Oct 1, 2025 at 5:13=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 1 Oct 2025 16:42:35 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote:
> > > > +/*
> > > > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > + */
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > +{
> > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_=
gpuvm_bo,
> > > > +                                               kref);
> > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > +
> > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > +     }
> > > > +
> > > > +     list_del(&vm_bo->list.entry.gem);
> > > > +}
> > > > +
> > > > +/*
> > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_fre=
e_locked().
> > > > + */
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > +{
> > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > +
> > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > > +}
> > > > +
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > > > +{
> > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_=
gpuvm_bo,
> > > > +                                               kref);
> > > > +
> > > > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > > > +     drm_gpuvm_bo_defer_free_locked(kref);
> > > > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > > > +
> > > > +     /*
> > > > +      * It's important that the GEM stays alive for the duration i=
n which we
> > > > +      * hold the mutex, but the instant we add the vm_bo to bo_def=
er,
> > > > +      * another thread might call drm_gpuvm_bo_deferred_cleanup() =
and put
> > > > +      * the GEM. Therefore, to avoid kfreeing a mutex we are holdi=
ng, we add
> > > > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > > > +      */
> > > > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > > > +}
> > >
> > > So, you're splitting drm_gpuvm_bo_defer_free() into two functions, on=
e doing the
> > > work that is required to be called with the gpuva lock held and one t=
hat does
> > > the work that does not require a lock, which makes perfect sense.
> > >
> > > However, the naming chosen for the two functions, i.e.
> > > drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_locked=
() is
> > > confusing:
> > >
> > > What you mean semantically mean is "do part 1 with lock held" and "do=
 part 2
> > > without lock held", but the the chosen names suggest that both functi=
ons are
> > > identical, with the only difference that one takes the lock internall=
y and the
> > > other one requires the caller to take the lock.
> > >
> > > It's probably better to name them after what they do and not what the=
y're part
> > > of. If you prefer the latter, that's fine with me too, but please cho=
ose a name
> > > that makes this circumstance obvious.
> >
> > Fair point. Do you have naming suggestions? Otherwise I can name them
> > drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2().
> > :)
>
> drm_gpuvm_bo_free_deferral_extract_locked() and
> drm_gpuvm_bo_free_deferral_enqueue()? Definitely not short names though.

With those names I have to do some additional line breaks. How about:

drm_gpuvm_bo_into_zombie()
drm_gpuvm_bo_defer_zombie()

leaning on the zombie terminology I already added for the
drm_gpuvm_bo_is_zombie() function.

Alice
