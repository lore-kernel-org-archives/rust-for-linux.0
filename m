Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF974DEC1B
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785752; cv=pass; b=UUyo4/xddpn8DKvWZR7mrxruFfsmMHmZnfVEb0K15JBJC6coJCbCSILpF0F+f7h4yKfK0hD5yGjfw0XQouHdNRmcBYBpMGcH8u4DMpKoSs0nRi84xbp7l5JJOVkwFArUYWNkUm7IzhmAtJLbO9qpU4G3dQ7ZbyCEFn+vtakAAb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785752; c=relaxed/simple;
	bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbpLowcITjys57Z0/kHmD0nOAJEuYur+HoCOpSszecYzehjJELlgNJpfrwfKby00NTlgdYaBPOHnrKo8GSthu0GY6qttJYy8F2iHk0GyfCIN8tg65OQEGuZ6xcmoXfvzZVTR0Vap6ABnbezC4AsAD6SoESJbs6jGmDGwRY5jARc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmi2/SkA; arc=pass smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmi2/SkA"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so8798773a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 09:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785749; cv=none;
        d=google.com; s=arc-20260327;
        b=oeeHyCs8I1ampqAGQV3oZne2dKI6TBbzxOlX2x/jTLDXY0qDSwYkCpu5hRQ6SomIV7
         8lAqfMhZUukEyQKtUV1DvVtgofOWTKAoIZSZ7+ZwcyOSdrQDiVudvxcKnchqEMedKFaC
         ashovrScTHqmC+DJdcxf2pZ6vqimAsxJqFMHnejHTfxZvOijchHljeeSquxE0jb3z9mp
         ncKpD/Mm3aOvHDmi8W9RdsfrxE3K9TE5VTWizy/YceD7JvJgHz4sGBsPb2rUpZ1x6WBt
         utHEJPtlSde/6wChSgVwf4XzIqBJVINXhfXPGhJlwgF/XeCuzq0Uv60aQY3yfQXgd93p
         fQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        fh=XB9BANfzILU1sjLUrUFUqwci8and4OXboqxW0Yqe7xw=;
        b=eW5nBTCTiY6jJ6HpUNHJ9Wx86XUajO81aXhXTdE44H1+x/WsTEb4qj5g56DIyvIkEj
         kPHKaNIhv6JSwbkbBgtHSbSPtrxCrKcW76lWKz261U+xn/L7JGueRT66Q458lCvMzGHG
         +i0o/MY2Xnw/ID3JaH+DbUYmrcZTuOAUqEQ03p2rjocdtL3ArJIvhd5znofGshoLMmc4
         vK7Y75M9iwiDpiacvca/iXGtQsCYcH86PvCWFZ4tdgaB3O4a9iyTGEp0xHl7lh+mI3cJ
         yvONFDr33hpvOQ2DvamC7dGIj4c4eMGSG7FFBOOfpkBTYrVhamoITSqctia5R3tuNgTv
         zopQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785748; x=1791390548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        b=Mmi2/SkAK08l1gaN9JUs8LeUCGya5PxzB/UFs+unZNl4teRH9mCp/eYupdfsnOJQYw
         EBhv33ZJPEFWvsXDtJS9m9P/uSUFEWDQVAKFgbdTf0GfPWCj84Zb+9DDJNAVZ55uDpFM
         nr6mbpkqY+bGKsSPgGsXxs0nTAr6TaY59wB0lHctDv31i+Fy353+1BwGdV1wJ6tbrG1B
         zJBwXGTbiPtqcnzITTNACnoN89Y4OkSe/MbFoBMNH+tC45JYBKGdLjja72AZTN3nZMl0
         jwgakU7etkJE6uCLLVlP5Fj7SV2yBwlKkvDaHSN3YZpBj52dar3x2izNq9ApjRGPDuT1
         1iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785748; x=1791390548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeh1LiNKQeZHlQZt3TuO+nbUO4zd0nfDJzQn7e6twMk=;
        b=dEdtBDXFR+1yeRd6D1Vi5s8XgmdSAFbOtUzlsYHELk5W2zcN0O/pMQkEfvVJdu2x6c
         obWGwvN2AZhApRIpy8gpfwYc5yK1zS0xu5dKoPi0DSDV/vsvO5dBqzCpS211mo9R1n/v
         xOvI6cEY2E4UewkmARx6lrKdpWh/LgGJw7Wcolv0+t3X0sqjfKtgCJaBikADjAQGYFxf
         3AZqdGnrcQEQdQZFr96I/ylytWHYz86ehe6prtzmAkPr/7voR8P0U6caWWVsNf4ZQC8L
         pZA32ku5NYy/M31wIF7MLNJBVLTzKtKXJHyYlGfbAjNCpivOmQBhcG1Uneoz/aQDGs/f
         BVJg==
X-Forwarded-Encrypted: i=1; AKwUvBzbr9yEx1B3A43hT5tDsv/Hq7bzWV0L8E4mqWotSpyiAWplt2Rg3tjZw57r7M8NcmM07pred9k/ul3LeyGE0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6D2r5YEX/A7nXZzBK1TypjtE8zgLOWeRyJm9HYSoppX81muqh
	WmhAJn5349vcO3ZOfzEGJe4Fg6iw6mLcQVfA/JbatlnQSU5ZXdipwktrvkY5Hf5mvpWWxFbxUBu
	2YTQhYjo8V17BUcpKKlOqQkJnn/fBdCg=
X-Gm-Gg: AYBFou3UfMRSd1cKNA40kfGqVOUoUaIfuGRBME2gzhaqvIgo07ttlCsLDBc5yXVuhQj
	OzsBjQ/rVkt+fmYEqUWViAcacwiCMdvMY7Q4sIRmOfRe1T4DO9RNyX6nqqw6sp5j+579XegMzNp
	OSjDZU9GeJEDFUC9bZkA8PH+ZxBbg8fLGhEQUcD6drvgv05vyxaxOs162knT+SnUaVk15lx9iCI
	pFtlDCRuM8Yr+CgEc43asG+p5P++dih3w++9+2HM9O/LvZthO4obho5j42+jm/eH6GYGx6mJ5z0
	vXy9195bf92fP5aj8FGUJ23Tt2m8BdoNwgk4GWK2+Z17qlAX4j8PXA85
X-Received: by 2002:a05:6402:1d54:b0:6aa:734a:a084 with SMTP id
 4fb4d7f45d1cf-6ae198f00d8mr1568406a12.27.1790785748326; Wed, 30 Sep 2026
 09:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-add-from-raw-conversions-v2-1-cef8e6e23ae2@gmail.com> <DLKOI7QW5M8O.II2G717YJDB7@nvidia.com>
In-Reply-To: <DLKOI7QW5M8O.II2G717YJDB7@nvidia.com>
From: Felipe Agger <felipeaggger@gmail.com>
Date: Wed, 30 Sep 2026 13:28:57 -0300
X-Gm-Features: AclHuK9uPC1AAVAFHpuASHRR5VxleuHnGeiAFO-3sqvHcRGMxC0vMih1ABiqeGE
Message-ID: <CAETh986oFE-dHtB_diDETGXQZWsxqx-i7sg5T_wCzVJ2ux6YJg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add conversions for raw flag representations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 21 de set. de 2026 =C3=A0s 00:36, Alexandre Courbot
<acourbot@nvidia.com> escreveu:
>
> On Mon Sep 21, 2026 at 4:18 AM JST, Filipe Xavier wrote:
> > Extend the impl_flags! macro to support conversions between generated f=
lag
> > types and raw C/UAPI integers. Implement TryFrom<Repr> for individual f=
lags
> > (exact variant match) and flag sets (rejecting unknown bits), along wit=
h an
> > unsafe from_raw() constructor for flag sets. Additionally, add BitOr an=
d
> > BitOrAssign implementations between the raw representation and flag typ=
es.
>
> This does 3 different things and would be much more comfortable to
> review if split into 3 distinct patches.

Some things are directly related to this patch, and sending them
separately wouldn't work,
as it would break the build (as happened with v1 for Tyr).
It also seems odd to me to create a class without using it anywhere,
only to use it in a later patch. But I=E2=80=99m open to hearing other opin=
ions on this.
