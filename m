Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0EA3890F9
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395540; cv=none; b=PzIbWkcqbj3xTmzEqtbo+OvomdUAfgEvPYO4McTCg9PB5ker16jXH2/T3HBWhk03/jlFBxogQAbLrdTrvl2udyIRoCVZS5XoN3Atp6rnLmK878Z3z6wGNWMgtrPOnnfxhCcDRNmG/0k/BzK+nwuBIZcCQC4r0p8Gb/PqhlOhd7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395540; c=relaxed/simple;
	bh=JCPLn3Q8lchYR2EklE+j4RDT04NHxQsjpjASPAHSMkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yl+ZbISBIS7ZxJsF3fTfsx+Y8ze5Oeg7KCp/ZqkXloYt0Z7wqRIuPYq2xBJUa0c8/rCZHd+7A/PYRDLnGVzVhIR/5oVT2mbmnkpaKvV45kOM7SJa84rnpT9VDKGCtPQgKgmNeCJnEUpwuUuS65THqtF8fdBsrq8k5vOsAuzsoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lp/N7rzd; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lp/N7rzd"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso25037555e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773395538; x=1774000338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V70IkhLpQ/taGR6pCrJdxC5WDW/RC4Bx2WhEUbll+RY=;
        b=Lp/N7rzdZkKrlB6t654X6hoAmo+NgdIYvKnv90ujovjh88m8zwSbEoKuB9AjVQercE
         mHqlFfsOvLrDqgfLOq5hlPKYdbpC3zaOunpu0XAvV5izEdPd96YgSH4DbeyRdCYuypez
         s2/QSvd6zTdLleEsjmzjazeTqIfgrOOTYW8asfxSXmFRGqNaz3D4Qu2Tqd0t6KEsaKKM
         UzWupvetSO9fM+wvSBVEwFQ7MWBb+6Pxvt5qylUIchZo8UtXgr7pR/XbWwldmnCS0Qo8
         asUl3tO8oJzk3x7PrycUqU+Xpb0/jhr2z9YMqvPAr5EcUe6zljuO76x17E1J9n+t8OXq
         6HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395538; x=1774000338;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V70IkhLpQ/taGR6pCrJdxC5WDW/RC4Bx2WhEUbll+RY=;
        b=FurWJcptliSo0sUBzH1YhTn2xVjFt1mu7Ns1Zmm9hLMwHqkOeKqg+uVuSFW8NqIVEg
         nXu1CSjx1OgqT3zxppQlj6als93ohqUOh/GYk/6sA6awVFKokzk9vjmCSum8ZuWmxR5r
         lEYIdVRnbGzuTgld33phAjMVB2Mdq7b/ssqipQp1VKzIMd4ZeH36zJf1OYysO+vhpD77
         uiQ1M8xmGjMOQVKGQwQbQKd7wVQCuloEoMs3+sU/4TtVsc58QRT6muc4TK0/IvTE/9bo
         Yde+L+qXdvgajcZaeaOnbI3/Ul4HDWYeU2v7yZVgP0xnR2kAcAP0f4wXBSXDv9mP6oU8
         tQXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqRhhNkP9zWPn2UGZPOvS5ANiAiO20y8eMq0kOJkffe+cRJtqBfNnr+VfJ9MO5Rtky7+VQW4iW0tqSDE3Wrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIUOx64QGxZqu0SE+6pBudRDcpHs69fkJFcOcnE2WxD14neFz
	d4NtIGufaAsmRV+P5ifYS1s6OX/gRh10E9+Ge5gSFwGQTqX0BK2cmZfbofqrfwNWl0s5VHpWuKu
	hvcTvRSoT2a+HlFOl/g==
X-Received: from wmlv5.prod.google.com ([2002:a05:600c:2145:b0:485:4ce0:d98f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524f:b0:483:47ae:7c00 with SMTP id 5b1f17b1804b1-4855670281emr40166955e9.20.1773395537565;
 Fri, 13 Mar 2026 02:52:17 -0700 (PDT)
Date: Fri, 13 Mar 2026 09:52:16 +0000
In-Reply-To: <20260313091646.16938-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313091646.16938-1-work@onurozkan.dev>
Message-ID: <abPeUBWpTB3mQRQs@google.com>
Subject: Re: [PATCH v1 RESEND 0/4] drm/tyr: implement GPU reset API
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 12:16:40PM +0300, Onur =C3=96zkan wrote:
> This series adds GPU reset handling support for Tyr in a new module
> drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset
> controller internals and exposes a ResetHandle API to the driver.
>=20
> The reset module owns reset state, queueing and execution ordering
> through OrderedQueue and handles duplicate/concurrent reset requests
> with a pending flag.
>=20
> Apart from the reset module, the first 3 patches:
>=20
> - Fixes a potential reset-complete stale state bug by clearing completed
>   state before doing soft reset.
> - Adds Work::disable_sync() (wrapper of bindings::disable_work_sync).
> - Adds OrderedQueue support.
>=20
> Runtime tested on hardware by Deborah Brouwer (see [1]) and myself.
>=20
> [1]: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/63#no=
te_3364131
>=20
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
> ---
>=20
> Onur =C3=96zkan (4):
>   drm/tyr: clear reset IRQ before soft reset
>   rust: add Work::disable_sync
>   rust: add ordered workqueue wrapper

I actually added ordered workqueue support here:
https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@goo=
gle.com/

Alice
