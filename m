Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4019A3BE14A
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999211; cv=pass; b=hzF9bG2SrMwu28WxGgJUC+x+8Ym1rvaAIUYAnrnCxZDcCNJzs0tx8EtRplXT71BuwNFfTprmrg4HQxfOKPIFEPAGF/YuOhpuu3IMgNxnRSV0wxZ/U+Hs8Kq5JcBaq3SNF0/5HZJ0Ii0n99+EmjwBreywOlhoKlRinv/O9sXWFZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999211; c=relaxed/simple;
	bh=/4ST/+IAuY33E7u8BsBn6YuaintaQycWaXrvTZVwPKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttz0o4OCmsMMTdOsZOU2LmlM/5fi7/LZxpIkJBexcmzW8izoYOFICAZTzRBvtAIVdriSSadcA8sbW5L3oJtGfOFVSB80rhhGK5P1T73yGQ4HreSZWm4BqfDwQLIMYcUsDPA9Utz9jfuw6EJ5hyiXDF5Ar/5/GHBuqP8cZkG+8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lc/2v3bG; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lc/2v3bG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so5315430a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 13:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786999207; cv=none;
        d=google.com; s=arc-20260327;
        b=WhMjzJ62tAbz8yim2n3zKRZeshh8XWsya/GKIYemhhIho2ZnMQBvBFaWocPVmQ2V6u
         Aew1epCEVJQ8nYFoxt+Wdp0Vp29g55YvW1b3DpmAXyLAkjj4erfnwD54hGgPZWaGqucB
         flDiEoFBNdfj5bg/SAOg12lUK5+RN6c5ldVM5XFxyd+lvBJxLdztbyhoNWaOKBZNfnUM
         YZHWQuOS0OYXof0Rp0+WthJBcMSON3KR+BLdYb2R+1IqyBgohAH8l4yym08eqvkyatc7
         EzZjjMYIsri7EnlVOvUI3SWjTqusEJMd5f1eUN9YNEt8xltroUhK+dia1DVrUmUSrIqY
         Agwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        fh=9oSr72FheJJLlRr7tjSwpA2lcp8WXEy3xub7513WtSE=;
        b=KLx6TtGjp+QRXmNLTKwoDWg/EfF7S305/+QItnfXcGyxuAJEN0PEuOKuABX2J8pNT4
         rLJXHYBMEr3HJX3oTucAgqTQNUfz+MHWg3pdgdRCURtZ+r7MPc3cpf+nIwg1guxhWaGp
         3Q+DchLXY09slGOHRB2XeXq575Bj1SpVqeB8sFsFecc1GdS4R0ixzM+YCMeUw67E7e/U
         S8fJNDy3ryFeug7EEoeUc/L1u9vy5dDCu9Lq3dUYBo3a5h7YBxdcFLcK/gFHGkt1VkS4
         yuRSkf2baKQ5OD3Y/9QNGDP0LIfHPRMClEWV3Luy49tg9Ahb5szWJyKVEwe9OdUhxCbZ
         8eng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786999207; x=1787604007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        b=Lc/2v3bGwob3aGt5UGdXN6zWR3D77cbOqFxOp4X8OXu4HNtSaY9OZlD1bz9poH3L8U
         2euZv75O2RL8Ybb5sUdGkZ7kHl+Tz7/E1EAuzY78wIa/LTUhv6zzK1woHL67B1OJkttt
         JDo++1Tq0en+waPCOND3oWcZpKX3Y8nMinRQg2PJcFdq3SbgEl7xACRVIqu1Qc7WAdXL
         26+zpLIPGCPcgwmaanKbR4utiQbzzJkqQatlNk5uDOd3/1lKjMaMetfFSNeh0sQc1/CW
         3ehpGjMJWmieEn40IhHeT5kFFFWUdWx2JGgnf4wR1PuDNtgVb1U+OsdE6wtII0+zrpQy
         2fXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999207; x=1787604007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        b=ZAmnTaHyADp3Qb2UA812ctUsW5NrISJPXdSh1jESoXTRGwbaN37hcXKMtCHIaN+a+w
         CW7YjgCVb37irCzGmGhoieVwjxnHHWyJ/GdYVCSY5HDnVu//Og/b33Wppo7uffTL0abf
         mhK75RMp/RP/gxjIY85jafVyC7BkViK/Q6Rt61gplYks+PTqU+tdTIX/vpwNdD6CYDYZ
         MWmPAwdPoD62WDjJleuLOXOTkcWDcgYOx352o1SeCDYH4y+Oh4sXZfmP2rXJZkonGRfY
         +0egw8ULWTn+7zeDq4wL725c4bfwECZPSR0YeZ5TF8JBoGG9yDZmnGMLUZ1nW1x883Qi
         WF9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCdyWKFPqqCyxR1DRkpikKEM5YLev9p898VkXZFxh4gMvLSMwhMYrdpLIaM84KgvyBWSvlcftbihndsIjPxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1a9adaObk1XkXVdAZ1RNCpDiw+heB7Lw8qmUErpqiepu/LzF
	vxlF2OealnumRRIHN2+H79SqNiLvkrD45e8b6FrWC8CZZl8oZmFu3SnOf/UOJq4ckhm+k4xGa8z
	xImUSvIcyFULcpRoq9b4EJ9A/ENil5F4=
X-Gm-Gg: AR+sD10/ddHfGomLHr/gunup4uCeVfhR+GkGXJCXAARBH3aaus0vUoF/TND4SczICHw
	xgQm6p3Vv0O79CEL+IMRFojEO/9yhC54HFtCRgYpRKPvn/vyTxvYUWMggberA2PluNkcpq58FGr
	4udoOXPdM5KzeS4ygWVVgDsoo+Z+oIO/SADug/wFkgdfYoOKKs75b0cQZvfODwyx/F9X7tFdm2L
	KiLwtEGAd00rtQAvccKLg8b+7cTTF4v798NLdYRw0DfP5H+i8zMtYF/WZ2/e3Y6l1UAzr+6QEd9
	y5RDqVUY4IKF3cb1fOuGzBNW4/NBLG0/3d8iBfjzL4vorhatoG58S9rew8L6U3akVTw4TFJfMK2
	h96qUg7BZLEwo6q7zgF1zAH4+8BK2kA==
X-Received: by 2002:a05:6a20:43a3:b0:3bf:9aa9:b2a4 with SMTP id
 adf61e73a8af0-3ccda966591mr3211458637.20.1786999206862; Mon, 17 Aug 2026
 13:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-8-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-8-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:39:54 +0200
X-Gm-Features: AcwNN1V3e1yEbV4HQwbBf0qIGYbj3GVTsQ2fE2mh4DfZX2sLIE0e2kB1-JqFpmo
Message-ID: <CABwQupOweosKS1hP188GdZZrik9E1Ab7r9DZBuwnO6X5zD4F-g@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Current code in IdPool::with_capacity rounds the capacity up to
> BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> smaller than this and still uses an inline representation. Remove this
> behaviour.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/id_pool.rs | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 382a5645767f..3e7c3d0c9dd9 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -115,14 +115,9 @@ pub fn new() -> Self {
>      }
>
>      /// Constructs a new [`IdPool`] with space for a specific number of =
bits.
> -    ///
> -    /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_=
LEN`].
> -    ///
> -    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
>      #[inline]
>      pub fn with_capacity(num_ids: NonZero<usize>, flags: Flags) -> Resul=
t<Self, AllocError> {
> -        let num_ids =3D usize::max(num_ids.get(), BitmapVec::MAX_INLINE_=
LEN);
> -        let map =3D BitmapVec::new(num_ids, flags)?;
> +        let map =3D BitmapVec::new(num_ids.get(), flags)?;
>          Ok(Self { map })
>      }

Could you modify the rustdoctest unit tests of shrink_request and
grow_request to cover a few cases where capacity is < MAX_INLINE_LEN?

- Burak
