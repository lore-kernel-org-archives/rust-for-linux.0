Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB581A2381
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757077293; cv=none; b=Ascxgg6KVAFIhkhMK/ISggTaBUq6juOt475tc07WfDSK3tdoHXYe7hSyXSm2VpEdbyyPSCGR2JdjV3Oz3S2hp0fVFoDQww5+Z19bhKjPHgTrNFhPc6wEmeKU2258HPADH2m+BRzsC0fEmrUw4agfxeXu4ES5coOKyRNLPsm6jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757077293; c=relaxed/simple;
	bh=5D/T4N9RADgC08mugIKCg2dy1gfMQNxZXjp5H1EyDXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvxlxUXoGDzmpr5YCM6eBZ6egsobv3vPQbEtLCFPeoX4DiX4G5rkLfSEAYso53Rb4eSoPcsPovaeYS0zzvQTXKZk3SRsksDSRHawZ4vqSrmTLkxuGpwJtQ1K9iKW0qQBAs5zZFa3KmINJfNO5jXzaMQLEaR4/T/aiAvBdTLWW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z0HT8zij; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z0HT8zij"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd16c484dso11733195e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757077290; x=1757682090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pEb1MIacLJ9K4bgFxk/ct1GGbag7F0/HxbtYf4Ql4s=;
        b=Z0HT8zijIY7qfDlsAa20UCjY4yUxOf8hV1n5vT+F3A9F7eXtlNYrRUjYAF2TOWwyPZ
         2lOPeTkAY+zwJCVKDj56cCSP7Mag8r11parlum2vsUQP2UFBXCaV6uHo44jaots3KiA+
         AU6FZwu/ZdfX0yrSXQkoVvhTG8/6AR7C55ahTnZ5SP2lg1I9IEn8ze5yBI3tNMwQs9hv
         E5ZtACGGoBf+S7SAXor6XdNLWlmu1ySQvzGRn8NdbxI5CMXeuwZHyr2aT8cDFdVabqPX
         xknVzpyZhmJTRr4UsjSpwR303USNNrqRIu6+i5JzTmKOl0Ohh2esUZKFNjBFTkDiCYXO
         wjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757077290; x=1757682090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pEb1MIacLJ9K4bgFxk/ct1GGbag7F0/HxbtYf4Ql4s=;
        b=PXZfg2DvKE6DpJhVHOgjylWHVJiqoBQau04QtymB4FUyzYHwAePnsYcFvrQyIAsa6E
         xwihgnjOAPiFGm+Ykz62jg9q0fHFAKdUc6Zkj2iRd0Y0wwKPSr6iFnKVEH3uqq6yZJV3
         Tt3nBjWN53r0zaNEa5HKxBP8SGfQFlx/WMvA5Iqz1fPck+4j1wwx053IByKSVLqNxaCK
         f8ItOjP9wRQNl5mqVWxSR8p/xpJWde0wR2VEtzmXnR6yTVyJcdDHpTSzmu6TUbcm0mah
         I8rMccUNPMk0JdTh7L21fsULHLzBq7Yfo9NEPqh1IZeNIOXkJMr0gAJh0SmBeckdlOwJ
         iAag==
X-Forwarded-Encrypted: i=1; AJvYcCW2igsY0EO+fBfpnU87xacUk5pqbHObFB10vY+UF8ORrFwKNOPsiSi3liqpr9zB3SdkfYv5zNTLBaXK7dWP7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeo90LDN31mvxFI3LdLlwnpQtimBf1z1+Jr0UeZESHXQ/8yf4
	FtPt6CZhrmkLb7CzmQgxFIqO36K4lNs3yqOLUPGJxWpWdmAJaX3jxWCEw6t/crp/G845JuFmrJN
	7MWNiIvilZwzTOm6sQUihv6qhKViK3T4DNiw1ekwO
X-Gm-Gg: ASbGncu5xh786TZir0vskhHEjug/H/o354XPTXH8QW0uHYxenF7veF8QLpTXfW+6/PF
	Kzu7TeqCMIs2tmNcmJJS6cZ2dhnfhtQt/mPBx2CEhAAoVV0tBD/3YOqNDbsfL4LV/A/OhUYFxPc
	nJ45HCol/LMpPO6pGhMqoKnd7hx7Z268rHbNLmoLAAtFYDlUl1+0typDubM1yI7Xp7KM067qrRr
	2NFawa+unBOv+6mcgaGXVpqJ7p0wjInfmkACkAZTitBPeKg8nD18XtAT8OsvB8KIGL5rHeFJL7p
	OXzTc8YdXTg=
X-Google-Smtp-Source: AGHT+IGuBKOVmlGWYI52O3gyTlIpz+6ngmiBUxM8WdXYtlt1/HZAj7YF8yKbPp1zHFZTrYVi/0srsYJtSZRAIHRbw4E=
X-Received: by 2002:a05:6000:230d:b0:3d7:b12b:1312 with SMTP id
 ffacd0b85a97d-3d7b12b1a47mr10133768f8f.9.1757077288505; Fri, 05 Sep 2025
 06:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-2-7ae1a382b674@google.com> <20250905145257.33339817@fedora>
In-Reply-To: <20250905145257.33339817@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 15:01:16 +0200
X-Gm-Features: Ac12FXwpaHEBjBqXVyvbrj3-VvsDe5Yyi-iQSA8ardGSchek0DbSaptDO3tJbhY
Message-ID: <CAH5fLgg3zKBG5FzLnVmQ1P-fZ=GDH2RN_jwFLEJ86tqwEXTvAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] panthor: use drm_gpuva_unlink_defer()
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

On Fri, Sep 5, 2025 at 2:53=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 05 Sep 2025 12:11:29 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >  static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx=
,
> >                                     struct panthor_vm *vm)
> >  {
> > -     struct panthor_vma *vma, *tmp_vma;
> > -
> >       u32 remaining_pt_count =3D op_ctx->rsvd_page_tables.count -
> >                                op_ctx->rsvd_page_tables.ptr;
> >
> > @@ -1134,16 +1091,12 @@ static void panthor_vm_cleanup_op_ctx(struct pa=
nthor_vm_op_ctx *op_ctx,
> >       kfree(op_ctx->rsvd_page_tables.pages);
> >
> >       if (op_ctx->map.vm_bo)
> > -             panthor_vm_bo_put(op_ctx->map.vm_bo);
> > +             drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
> >
> >       for (u32 i =3D 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++)
> >               kfree(op_ctx->preallocated_vmas[i]);
> >
> > -     list_for_each_entry_safe(vma, tmp_vma, &op_ctx->returned_vmas, no=
de) {
> > -             list_del(&vma->node);
> > -             panthor_vm_bo_put(vma->base.vm_bo);
> > -             kfree(vma);
>
> Maybe I'm missing something, but I don't see the VMAs being freed in
> this new version.

Sorry you are right. We can kfree the vma right away after unlink(),
but I forgot to add that.

Alice
