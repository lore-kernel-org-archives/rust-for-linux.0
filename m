Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859C303A0D
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963033; cv=none; b=ml+pB3e79myGSEjQV6f3gTxtY5mC0UjenH2U+lQTx9h5iFBELEPwbWUie3N0qrpikGODdBOorQkQHUbjRDgrmeluCr5zHrStMm59wiymAp1XSP0rmcIVwcWJ8NaCOhRB7nvKoElqu/e6ZvGNWy4XAUH00LisVVbUOlyke88dGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963033; c=relaxed/simple;
	bh=xsVrddNgKdsa59i88tOUom/s0Tf6ykU6bezL99BIn20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVKK3UHCT9McZ0m7EKXe2XuAowDy/uFKRKu2ImXkKejL4pSIXVa+PSF4WDLPI2t0vVHGUfpgBfVLVAEFLx43h0YCIoRduFn5WP8ksyhe013Ux2U81aICMZiS69DRkev5JHQFWBR0KjXnREERoXQdNM2Va5RaR8O7L4hjBULJBcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sxt8BRhI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxt8BRhI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471075c0a18so45482935e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760963030; x=1761567830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsVrddNgKdsa59i88tOUom/s0Tf6ykU6bezL99BIn20=;
        b=sxt8BRhIXDtx4vu9KqP17PgMkS+Cc8Wf5VnW9SPMpkawYQFCW2nJ4UqDokOnQ/BbOP
         1UKoNPjca7BshWAGhdLF4sM1dXQDy4YkBGp3VhyH6zetcxIGWlCYeKeNKsX8frNfx42P
         XP4hW5S5UsXOIllauXGcuR8cMGiJNQJK0ut0424GQnez6x7Oj6JvGHtNHR0TxhSgwX1x
         xN27l81GfgUbDp71FxBU21EOtTZbCM2VwzRAheDehQCkQNIJFmv3MNr4G+46pMbpp+kJ
         P4bcNgolPKgt5uNNvwTN4qFjEpPUa7aT21sjQi4WyWlbR+WOlx6nvcL7RgqgyUowmerr
         UDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963030; x=1761567830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsVrddNgKdsa59i88tOUom/s0Tf6ykU6bezL99BIn20=;
        b=TxCPEoFDHRkRhRVZH4p6zdd0719mV4sEIalB9xxkWQ8sArn0qGXEkslfpBpC9x2Tur
         O8RJ/tpay4s7jsY1tp27kxn0KRzG8jB5//rkKCbCuHSZsNovDjt3q5cnCQ8tOQtsS+nI
         yKUOAG/x84hpi+8WDyLvGBzUgi8p1Mt1Uq/Ck8mHJbGYMvDOwdMMEkv0wH58h8nAItQR
         2xjKXJigQMaALq/UzwDimhkstaTHuqkqR9yrJGjrQGsXZqFhQgCV2Rkjzx4+BN6fO0Lm
         zWCZV9gR5wiLnZAkrn1HcRt3Di9+QdRSi15Rr3uBdtvsSOvRpYHIKj6xYOaKWyMa0p0k
         /vvw==
X-Forwarded-Encrypted: i=1; AJvYcCXXm0HfeBwF7r2Y9caK8p3etyPYufbqoo9pagO6a5KC20Zb0pFoxK1bQM24BWA6D4kHyJuaD6hxPYyFXIAc0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAl/PiOiYqhgFrNk0rrfrfQcR8EzCH/6JjpAm//YfqhYER0/x0
	Kc2UHvV0U3NLS3m5p9nfcDFBqjXyP2adoTdTONsNZgW+W8ndO1sTaOBGaWEKjqroKbK/SFMOS+C
	/0MXoPzbxKldJfn/OXo0qdYWXqnPP4/wOwm22O7DK
X-Gm-Gg: ASbGncusJXNoCS0bxFE0PUKEVAubsAvFJvl/LUtjWaczR0/vZaKWDBzfXNoDs/jgFic
	iUsaf52cV4ZAWa766iDSVktB82td0J+ddeOKJILwPKHAEgZgOJosHCIg0nFpXwXLfHN2VRoozsG
	uu0EHb2qRIDgvvnXVy1CozTEAcBqauv3OA45bLjR6bfzvaLNJyeAYFZ3AH6HM5fhQrsn2sXRo5q
	ZEBUYnq5nJ39AsWQL29k8snRg/m3kF8ct7aXwx1a3M+VkgtGhS129KX48d+8/wT7lF48cS4kNOb
	RLZTRJr/penucLs=
X-Google-Smtp-Source: AGHT+IEzDxQ99eTVFb1p72eG4BzDy4n/ljYK7KwPaNsss7sxyo0CST4hlFo6R49mTS4MCJM90qjBH4sAGn3rQV8UuQ0=
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-471179174dcmr105272825e9.33.1760963029708; Mon, 20 Oct 2025
 05:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 Oct 2025 14:23:37 +0200
X-Gm-Features: AS18NWA5B7IaPN02pGfQccVfxUVjCyEnsxCY8l0rw-xGHW4tso6TZRmVCMfMeXA
Message-ID: <CAH5fLghsp6UXy9ghYe0bS7ASty-VrDLVwRkmOt44Pr1sU6vvag@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: remove unneeded handling for config DRM_LEGACY
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 8:41=E2=80=AFAM Lukas Bulwahn <lbulwahn@redhat.com>=
 wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Since commit 94f8f319cbcb ("drm: Remove Kconfig option for legacy support
> (CONFIG_DRM_LEGACY)"), the special handling in the rust drm code for the
> config DRM_LEGACY is not needed.
>
> Remove the drm_legacy_fields macro and simply use bindings::drm_driver
> unconditionally.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
