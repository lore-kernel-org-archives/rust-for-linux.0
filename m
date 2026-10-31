Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793464680;
	b=bLHS27wK4gii3jMwCkCI/oaiMeOd3ne05cRpTXXqrsJk8thuJf08IKgoQhz2AHOxukkW
	 5XYDeznbMimyGzATbMCfJ1Az0J9GKd1lyJqHCHCmc9tyJr7UHY9jgFKEHn1LaD66l7mkr
	 Pw9KStakJkmU4sElY+4Kq/Zr8YcP8LZPcPc4Z4QVfAwLWsRyMbjkcBwUMw9QUhEeu7o27
	 QXBYJ5setQ3e3MBm6sxqcN+fTXNXFbTlOb/KR63PV5tbUQcRzw1YgzwE9NDfu1UjvKTSX
	 2Xjl11b+SlJEis+8haFVqfqfE7tznPdLvW+1y/mQYAgaxK5p+iJQKDjC/uhs8wXrOjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
	b=tFgM6Md83nCW+0XvfTPbfjc6WVJ046KMHkmPCGVHAAKILyQZTbrDzh3KHKHezuBO9wyl
	 KTPHHRP1O8/SsZYhXPGpsvjCiJNdYGcVhYwC91OgdlU4yuRMxrraMUlAmVLV2q5pqn5wG
	 TqMYpk8JzgShptiynbKENEFBU9tsKYk87ixIV0tY4QNENIYbrg+UCCzxl7V1x/VSqFtoD
	 9W85GTnhrPL7mPWzfTAB1Z/4aH1kQSwn9S2leE7eK/iKapmhM37O2WYuoMhoHGIyeyqfb
	 AFzQuyyYpKeTYcx+h6EpAZaccD7KAyEcpM1bds84GaKs+OG2yNd7G6ly04jLfc/V2ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aQ66LJVH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A81606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aQ66LJVH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11237065e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 09:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793464678; cv=none;
        d=google.com; s=arc-20260327;
        b=tBgtyeoMWG1KJajUnpSdWg+WiCXUGK9/f1eYZWebi3oLqirQ0n2h8OolKvjJhzTPt7
         80nVCu2CZTUys6TPk+4aXscoC/W2lQKMJtRPfSab4lXutW7MYHp2SMRtdQ+g7jqv+2I1
         iYEYO/PEcoPoqlSBPA/P4QwOG2k3Fxu8EOHhBA5HV3wXvWyW9I/nXB2K3ZA8HlQr6MPF
         U9RrP6exh8145pVhdToSECec1cDTaGPX0awBTlkamYiPn7AVC8beQT+XiLcfZqcUztDI
         Svd0UeJrXmX/iF9qfA+h0w2SfYbQJ+wwP+nlKB2BjAxn5TsDBAyKWL10OIex8RkV2b6p
         iHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        fh=NRxBzuWekPCWYbkQauj/jS6F6UNXEocvE2jTi9LdquY=;
        b=Mc8LLhY9GURc0M+7bwOw2tZjGLNt1kOHnGdaVdZwXrx0d/N676qX6BkHQ2ISwRowRR
         33FvS6oPc4eFAo3ztDQi12B9jxzcz8mJDRIHKHgMTTvrJtNWQZOeikX0cD5mcmr1h2em
         yL/T90FOroElKAOxqPTr11hB4mPUYc86z9Rc/YN9LftmBF191Je84RRT9eNAEREDWejI
         ie+tRWONoKBrKPwHvqC8PdNon8dVW9IoOnwcY4OpmbqLwqrSmb1gJLgfLag7FbA2MJZo
         FIthwmM9mOC0EWfBQC1SckD0PJFxE9UHkGWNjCbAqQZB4bBT/1RMNKMP7zxaBI9QQ70m
         lF6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793464678; x=1794069478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        b=aQ66LJVHa45dKPfND15WpLhtZXSP12gQFKUFRmdpv04UfYxD5t4mm6VdojacX3Hdsc
         K3xS/9zxTc4kVjl/GEH6AxRamuHawPi2K0lLvuI7n8G6DXqMVteNa87oDeqgfU/I+qli
         BSRrus5eNIJgPMK1Jqp6aqBICcoeVNg080NS7sQw5I1tdob/d0ZU8SXalXfzYTJgHb7j
         x1hRdVLyWIQdHWJuWnUbGiksokchNqXDXb2DsK8+HIKAZJ4WqG/n72U7joGmKwfhBGxy
         vOexyE/+Ueb5ayaK/D+P2oG5vWGh+4ixhsoKvNpSbJaNiu39wWsaWfxaqzvbpJUb/845
         L27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464678; x=1794069478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        b=cBCUmRqxgEDWdsTZMP12QpxckxDqILBRWHwLeEvFbhW4vcCki9hqhffzW+awlX2Nk0
         erWBPPP2dsn1ZuTaJqxGaKT0i3WNeOQlALRmlBqEphtHI2VmAlmh2KdBJhiSClaTD2RC
         dfRAvgpR8hLH4NPwRUJ+K32kfXCl14dyItg5HtyzWoGSuyOZbSh5jFH/9eZ5xxLjOn2j
         9OGEvKNVgP7IO48lpAdZ1gVUkYCJpmhOmYEwFexBWERySd+TGbnIwzAUDwxRuAlussne
         DK7WK2lepXy8ukXj8KHFzsCzevd6gpITx0migOZDVttaO69m60QQsKCCv7oqWOnaFubp
         IpZw==
X-Forwarded-Encrypted: i=1; AKwUvBwypJ2wRJhMEj31BS71rKWy0fxMmX2MeQDIyaCZFJ0Q+pHOyoS2+r8P1JJAESgVQlw6YgFcpqUZL4Q8vQPC0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSebzRTzGkcBKBL5rpNwFUL1RWIDdgGRdp+9meq8XufKnY3ed4
	xNm7nGDqeciz+XG/Vo2tN3sTPWjJVLzZr3HLzbpuYSH+6M3qomY+V6PoXi2ikIkYTcuRjSEIFPp
	uuatl+29Fq8XUVXUGXTmUt8oVFu64rRR8A3I1slzy
X-Gm-Gg: AYBFou1VKqTfBMALdb7zEZQIFE5+D23QiE3iXo//fIVK+fiqk1FznD7pOVbdCxpGBr2
	6voBUvPfEVixyndJnafeOhIFwZaPN9Hc+UeNU+Ln+MLDb8mOFKvkO8XqpVKExkmEdLqMYLneTFQ
	Yd6kLJUqJWWUhhB+zwxX8vmCIWe/wNrhJmC7LWcev/FEdZA+ccKKx4YHutZfL6Y0j3AM7vipz2E
	zpnCzWJbVIp1z14GoQG2HB9EFcNgklujyZqYrLfxsbrIPIY28ygfV70y3/lSm9gGeNQ6diLaADx
	mXNC5dNNoRawaIYRShPNH9iP0+RzEgk1rFsYWQR6wp05UQNVFspyvN49M+VQlsW9Ojyh05FW3Hp
	wwpMgxnIyI3a1KsCm7tTycchEyAUJiVFAC2jIwUcvoTxqwBAlfu60lc8OVrrgp1CVPJ0tGZIQUJ
	/acYVm2amK5uiWzcpbrg==
X-Received: by 2002:a05:600c:4e90:b0:4a2:526b:d410 with SMTP id
 5b1f17b1804b1-4ac17565fafmr135441625e9.13.1793464677281; Sat, 31 Oct 2026
 09:37:57 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk>
 <20261031152846.746656-1-sashal@kernel.org> <CAH5fLgiSOae48jr65rv6ynLWUhT7xVCjjCEK=9oKXvSxKpdq6g@mail.gmail.com>
 <20261031162931.792607-1-sashal@kernel.org>
In-Reply-To: <20261031162931.792607-1-sashal@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:37:44 +0100
X-Gm-Features: AclHuK9n1IaeEszr_jQNYJo2v2No4a1cdwGVbESZzGLJe-RbL495VHIWXOSenUA
Message-ID: <CAH5fLgjpB1-hCkUhsFK7bEVYwz-N-obsoPoaCYA-BWMQ5MPTnQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 5:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Sat, Oct 31, 2026 at 05:17:46PM +0100, Alice Ryhl wrote:
> >Is it possible to instead fix this by adding the impl of Zeroable in
> >rust/bindings/lib.rs, similar to this piece of code that we already
> >have:
> >
> >unsafe impl<Storage> Zeroable for __BindgenBitfieldUnit<Storage> where
> >Storage: Zeroable {}
>
> I looked at doing it that way, but the wrapper types don't always exist,
> so a fixed impl in lib.rs won't build everywhere:
>
>  - bindgen 0.71 and 0.72 (we still support 0.71.1) don't generate them
>    at all, the blob is a plain array there.
>
>  - 0.73 only emits the alignments a config actually needs. On x86_64,
>    allmodconfig gets __BindgenOpaqueArray, __BindgenOpaqueArray8,
>    __BindgenOpaqueArray64 and __BindgenOpaqueArray4096, but defconfig
>    with Rust enabled has no __BindgenOpaqueArray4096, so an impl for it
>    would break the build there.
>
> __BindgenBitfieldUnit works because it's always generated. We could do it
> in lib.rs with a Kconfig symbol for the bindgen version plus some way to
> know which alignments a config ends up with, but tagging the wrappers
> right after bindgen runs seemed simpler.

Fair enough!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
