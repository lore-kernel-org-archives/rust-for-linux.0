Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F31B4141
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860306; cv=none; b=th5G+Ae2+lczQ9IjVqrfhBPv9hXud6mWnjuWgL8LIQlUXFqkQQzAAxvk5zhr5SRgOTtxKck6mueQRU8ACMlTm15DxZv/H7NCuio2MAQRqDtK2NEHyEgSK+jwLsesrU98O6+JrKyW53oSHxoy2hZ8EnJWQvDn9z9JDZYpDAmBBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860306; c=relaxed/simple;
	bh=EHVCBzEbcUAQJGbAuSSOiy4tXKlutq+NSztlPN9BBjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dfNwaeJf9z1v6MvbMaN8hG6b1nWyqqK25vCCu/FHb3gTLgYDBpazMqD/boe2AUN+jJm6Tx89CYLqy5rfyxdCrjFlwnlzntB9MmqoKArjwLW3YkJZdnJsEvxQKeQEqe1Td9zUvj28BSxTx+YyIjd5NSPFlZcctJtLlhnZk/U+aGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mr4SNV8l; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mr4SNV8l"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0d0feaso13860605e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755860303; x=1756465103; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lN++07lUAqPEyNZeQbX5pIHFHJClvSv5yNvs5J86bac=;
        b=mr4SNV8l0iIdGwyMmzZYPiaRFAhe/p8s6SB3/f9MS2aXYgDZihfm0G7MasneHYTPCN
         MRO0b+Ju7JO/X/FYvCDMBzB6sF3RZJAAajvqytOLTOTbSAqJC1iMLkkTvNQ4sbRmyOp5
         ilVRhLoGkec1EaVoo8SKA7K+EO0thjqbrbC7dJcDi6ga8fh37CUfZtGwgAvVQ6OeOBih
         1QOWdpHjZvpvsjO+cgQpSOaIcTLTujAXiKYeVoUZcaQGGP5DWpXOBuG5ncleZ0hr8SJX
         +LsDjJGSaoGQgjq7xgrPg2oKW4Mdbr8KwOmlqDSRliWaB7DH7bRtklvm4dFevNq+EvB5
         j4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860303; x=1756465103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN++07lUAqPEyNZeQbX5pIHFHJClvSv5yNvs5J86bac=;
        b=Z7ZQcNP+xXcH5SUFGGrfFFt+sGSUHtgy3CmEiW7s8sx0jyGujpkAkcdrEo/cVi5qAY
         05Od+nRC3J2VWKfMNq65m3AWTffwV2gekrxxArH+UPhOaZXVpXGCFP5MqitHdebwcAnw
         Mt1Fuuicg7oMvZtzCQ78scgiSmBhID9mje7zfQIogTszv4txuA3jNz0CO3ROsw5HARHB
         b1t0GgOYmsNhlVqKV6dSgjrS020GCORR2hp5lP+zCb+gUPm/tJLACTUDw5TBNmGxPwjs
         nP01ZXraBuJfAu3WAQPCVhTMlZRoT0LQu9oInK+foyoC30uvCXyvjd/fsF3zAC1gye5c
         ZZpw==
X-Forwarded-Encrypted: i=1; AJvYcCWWghG8T+jCS/F+iGD+u9hMuaFAt2BbM/vE5jMKxMZ9UeNe0ffHMBAJsJNH+NKus8Do+ZCvzIiaXZ9wS6ZPWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZ1eMvAMhaRadAdD2cG1CdNAXTTmhJstuuGhwtiI4D5qm/mGF
	RLlHVOXzI4ooKY5hXtwQxP7MaO2EGRwd3YE8BY75samGoyUNqi3jAbcDf8WvhVE1xPD4Sz28gdG
	ojeEiXclGVE5UelNdyg==
X-Google-Smtp-Source: AGHT+IHpXT7FmVk8RuJ028/KgbugYZVF29dYSJUueN6hZexCX/5at84pZTIxdA+EfL+hrrSqvoKJLIl/f66psQg=
X-Received: from wmbfp14.prod.google.com ([2002:a05:600c:698e:b0:459:dd85:efda])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:450a:b0:459:dfde:3359 with SMTP id 5b1f17b1804b1-45b517d9bd1mr17939435e9.32.1755860303434;
 Fri, 22 Aug 2025 03:58:23 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:58:22 +0000
In-Reply-To: <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-3-c41a10d1d3b9@google.com> <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
Message-ID: <aKhNTpQ_8ZWXTbpq@google.com>
Subject: Re: [PATCH v2 3/3] gpuvm: remove gem.gpuva.lock_dep_map
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 22, 2025 at 12:25:34PM +0200, Danilo Krummrich wrote:
> On Fri Aug 22, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 4a22b9d848f7b3d5710ca554f5b01556abf95985..598ba376b9430cdd4ab7bacdc15de031a887cf71 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -196,10 +196,20 @@ enum drm_gpuvm_flags {
> >  	 */
> >  	DRM_GPUVM_RESV_PROTECTED = BIT(0),
> >  
> > +	/**
> > +	 * @DRM_GPUVM_IMMEDIATE_MODE: use the locking scheme that makes it safe
> > +	 * to modify the GPUVM during the fence signalling path
> 
> I think this isn't entirely true yet or at least can be ambiguous for now,
> because it doesn't prevent users from having DRM_GPUVM_RESV_PROTECTED set, which
> requires the DMA resv lock to destroy a struct drm_gpuvm_bo, which may happen
> from drm_gpuva_unlink().
> 
> So, for now, until we have the deferred drop idea in place, it also
> requires DRM_GPUVM_RESV_PROTECTED to not be set.
> 
> (Eventually, we of course want both to be represented as a single flag, such
> that it becomes an either or.)
> 
> I also wouldn't say "makes it safe to", but rather "makes it possible to
> safely". We have no control over what the users do with the mutex. :)
> 
> NIT: missing period

Yeah, it probably makes sense to modify this wording, at least until the
deferred vm_bo thing.

Alice
