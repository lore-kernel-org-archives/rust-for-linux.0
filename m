Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AA207A26
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373952; cv=none; b=a+AwQp/LLdJa4GV7Lg2wFFwGSd5/r/b4tWLACfg4/XGy36NHBKNK1z2SaL3PyQh9HO7lZbCyCzIEsdxjwYyH86LdTD9wCj6Qb+VQlXha2XjjLVb6GQiIFjMh2LWRLN1nbxOou0W4a3LMA7NFJwWfsyVGZ4+T1R1CgzVgrhEZIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373952; c=relaxed/simple;
	bh=19V//VrXn/wkpRMgYXRhcd2yEQGifiSW/l30sA7YBTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaKF1mqmYBmyJrEE8GuXqYpy7AuZ45UW2bmsPHftFoEavGKq8t0nH0XAfAs7RBEGu8wIBop3rf+wMY/8EfnFqUZFTdgn85uRie4XvrABzHj8lBPzJhwtSIhXUqcWgN1aFAGNQtPq1mPyoSAJ4DqbbBJLamhoUpb6ywqyi6eQzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HletbSBP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HletbSBP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ceb830dd58so3781f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756373949; x=1756978749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzbPaZibccHjU0FoSS1gsWi6heTM3EUmA3XuL3SLQ94=;
        b=HletbSBPo7JzyZTuOIYahQh8UxEZn7Ve2Fjx/pOjFenb68eZdkkIBz5fwxRIj9tMqo
         Z/f6sMuD8RV0z7a+0O3DqZ7wfsFvmW9+D8ugvCtT3Paetf3EQw8rsWO8aYQdCG9duQNZ
         R1RjlGSBIHx81ux4h2spbAsts7DgCDqQgXeryUI3Erze7dgVuQw4+UsnudF5R81WwPrB
         +sBbCDMAuuPKKHAxpWQgoped+Uv+8Nv5IDwNo5/3sR75gL80f3fmPVjRKe5InzUdzI1P
         5vLzMtay8WWfjBsa3m3ZZ3WWQninqgN8bAWaEK3w+V82FaTYZHXP0hy/Ouxs/nYWo/Mi
         vGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373949; x=1756978749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzbPaZibccHjU0FoSS1gsWi6heTM3EUmA3XuL3SLQ94=;
        b=CT3i0J5K7TgiBP9j0fTCCik8urVvxCCXNaQMW6Ug92t+3sg3qt9pu/TlEFRXltQ/Lq
         uMWkwnv++2A1bmgeMIJYgl6fZJgQhygivKHSxdQaBx9mabWh30bMjNIU4IWX84HD0s+u
         tzEROocI159Q3xySrtpV+y1CUQkEA3NkR3krDYI3aI8fM01wqZEpZ5a+XUQZu6ezbYhQ
         pb+//oAEcSWzbeos50rStuVtDHkLw+LkcVZAv/0TDEjLj9au2HrI+GD7pgyuVcBB1alv
         jhG1tNBUk8hBdXR6f+OSltwA1quTzeI0ZHIP4cdoTUcrLdewTgYqko9CICZai5f0vp1Q
         DPeA==
X-Forwarded-Encrypted: i=1; AJvYcCVvLMkCG6pm+AQJLKzqdXtsCueat9EgOpMSkuV1RDJapP2gVI43lfBtTNA9uNIxzbVIfYaU6qchhalSEIWbrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMc9Nyk5o9GPoTADJ8drhk4/JXxobp9fVgLcZ2T5LPsmvO97e
	hTdZ8Iik13jIgph91KB6hnskR9gCYtG8iqUkcY9AteYQEHBde8MpQlxIlOdO/WMEF6EwncXx39E
	MTUbpCUYAiw2rusSuGesm6wtUipDqFanU/ZUU8mUi
X-Gm-Gg: ASbGncuUbdoTsV3Fd++4Gy27iI6ymToikoG+CG2Hvns4xK1oDTNtshQJ/SakOya3am1
	dEjrQYlbCRazrr6F332bbEsQuneN0kEX108Pgr3QUHQA6rKPH8xQEAEpuigEIg1JcnB4KaXxsST
	1UVhwA9XueuYlsi7f9LKPBD+MmsH8LDL2tw6OLvbN0qgHb3mvnc/b8+5xxQeR0++Soij37uGgKF
	NWYLaCpugL9Nt57NF0beWL2I827vQO3yRx1vrYmgN9ya9CG7G2SVL9DXamxf6KzhR482LjGkI8=
X-Google-Smtp-Source: AGHT+IFlktDkaWiKRUo1z5/QhTcPRf5IjIBVdJ474S3mSdXUJtSFTm3Jsl9elK6Srq7Fmm/7XEbe55lLoaf2t8fE14g=
X-Received: by 2002:a5d:5f43:0:b0:3c6:e655:e878 with SMTP id
 ffacd0b85a97d-3cbb15ca65amr7606825f8f.31.1756373949317; Thu, 28 Aug 2025
 02:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
 <20250827-gpuva-mutex-in-gem-v3-3-bd89f5a82c0d@google.com> <DCDYCT8QSYGM.XIKU6FJ1ESAQ@kernel.org>
In-Reply-To: <DCDYCT8QSYGM.XIKU6FJ1ESAQ@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 11:38:57 +0200
X-Gm-Features: Ac12FXyFqot6FQ7A-cFSBHp_abEIYrxD9hUKRbVhXYWKrC9K5-tovvApSPC6tSM
Message-ID: <CAH5fLggJViOUQGB-oK764PdL37LioFWt3gNpYijq_Q8Cmi8mjw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpuvm: remove gem.gpuva.lock_dep_map
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 11:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Wed Aug 27, 2025 at 3:38 PM CEST, Alice Ryhl wrote:
> >  #ifdef CONFIG_LOCKDEP
> > -/**
> > - * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the =
gpuva list.
> > - * @obj: the &drm_gem_object
> > - * @lock: the lock used to protect the gpuva list. The locking primiti=
ve
> > - * must contain a dep_map field.
> > - *
> > - * Call this if you're not proctecting access to the gpuva list with t=
he
> > - * dma-resv lock, but with a custom lock.
> > - */
> > -#define drm_gem_gpuva_set_lock(obj, lock) \
> > -     if (!WARN((obj)->gpuva.lock_dep_map, \
> > -               "GEM GPUVA lock should be set only once.")) \
> > -             (obj)->gpuva.lock_dep_map =3D &(lock)->dep_map
> > -#define drm_gem_gpuva_assert_lock_held(obj) \
> > -     lockdep_assert((obj)->gpuva.lock_dep_map ? \
> > -                    lock_is_held((obj)->gpuva.lock_dep_map) : \
> > +#define drm_gem_gpuva_assert_lock_held(gpuvm, obj) \
> > +     lockdep_assert(drm_gpuvm_immediate_mode(gpuvm) ? \
> > +                    lock_is_held(&(obj)->gpuva.lock.dep_map) : \
>
> NIT: I think this can just be:
>
>         lockdep_is_held(&(obj)->gpuva.lock)
>
> If you want I can fix it up on apply.

IF that works, then sure.

Alice
