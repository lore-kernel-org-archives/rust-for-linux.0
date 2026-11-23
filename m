Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396244;
	b=1/B2bBCwfUm79RNvfe/ocAEH8TzU5JENfHOQ+jFqJKtqrTieC8Hqm1Y8SbN1lrPChkm9
	 V970FoETGcDKbMxWXrrmVqITcerlorCxgAFF6nvprUzJyi6NEbvAvdv8fFAaG8CtoROPy
	 ikkA+v1Y9csb2JWAY8DYrKQ9Y8Ich4h0MciHIRYAG8F+YXJs+lyDcLEi9m0T8RfvVt3qg
	 gBeiPDLPbRQfsK6hf7m6RNIB5xyq9d7h5/2xWe9Tf2PmiA4uS4GKIiY4Qx3zXWc/4+Xr1
	 g7xo+f9Uh8cKKElL5JwfrPmhv2Ks7VYIwQ5iDCcZqv44WLZHCuDzbXX4rDOS9vAm7BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
	b=iNNrxJwkElcBsWme4WktKju3ur86aPtOCgr83cDyY3mG6MvHBzOrfoz2I0E0neOOyNv8
	 dVmvBDqK7bXFCqc0oY05GmjuxAuZgQe/vdKZlkJE+rx6Pnplv5yjxYOM/Foah0bvJjN8O
	 ln83XudR5ZX+p7nkcLnXoFB75DoaoEKo5Bg0tB7iIoeomd9I00IyYCGk5D+ltdZx45l5P
	 ZCz8U7ORX+dQ0TW4TNqfwC9qNZMdbOULxkr3MBVMkGpWBxxJCStk3DLozEEnzauxBfUTG
	 dKDYj3Y2VSBpa+gHlvswXTZMXAufVHsuC34m4S0u6oprVM8iEdRTZs9+fCwCO2UTO0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkFo0V6b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6C606A31D
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 01:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB6C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkFo0V6b
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae3b5b1027so2049411fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 17:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795396242; cv=none;
        d=google.com; s=arc-20260327;
        b=Fq6H+jZKmp80SLo1Df1qPMHdGyINOsb447FCwi3dlqkoyWKEJC3PvxVK1HLv2SQqAo
         NUzb8GwFaPByrgpjm3vHymdcitpzNJwWxTgYniTqZ1xUZo599PZ5vOCEOdTsc+SsctNH
         2YekgTB1DAoVQ9ahKuFQ4L/UUifqLEHhvi3bj/Tj/aFP4OnYU7jLXN++VDghS8WNPkjd
         ftN2ol8UB/qm9VcwmEiM69A1hOan8unDYWXV7HWT9nU5Tdw4uhjBRPCxil40vTg4/opQ
         AQ+njKHQY2G5o0sTP/TCOibCYpei1iRdkIT14DmhT+X6ykuWbicIR9iYdvajQGPN51Tc
         34ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        fh=ZyA/zjXfQwTXmd4B6uWB18YLyLoRYUwHHATeR6wS+20=;
        b=Jl67VMynumAP90Y9z/XX4EhWjeBTtsvA1vdh6Nn/m4S3RVxr1Jx7fqPVrDA7inLYc7
         Rncz75VAJfN6nwPrSHrJf67UuyqTNmGPCxjdqNH5MFxNj+hUzRagXL8juK7XndVCObTA
         AMhiH/AwXZ2eu7Qi9TUHBi/8WJlAPkkNPO4zjtyPpbmwH6paoeUHQuI84bp5uAWnCKkk
         I9VoHHj9sEftOT+pijrwFWU3TD721AaW7tq/YQqhQ+41t5fvny0pegOVUPjLImdl2auE
         YoNlSaxMxvGwQ6DUQaVfA/9XyO6r1wX8LUoLMJ4RmmDiCqoY9cxhqvlNu+R4cLVAfPjK
         9Mww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396242; x=1796001042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        b=OkFo0V6bUwasA5GaHgPKKsNR4QdBPiWZC9bmuIuOn7+BiJvbeWnZgsqsL+cx0QzFks
         6l0Jb8X30UUTelKcesUOPTR5IyT4C2Nr08em2DvCZ1hsbI+h+s5dHPAl0tH77jfLve9m
         78oArVH7GL/CuzqPux/XEXtch+5N9OMtaJHEI3OTUKR9Eq5wm7WR+QGVjSmUqvCuBqyG
         Ds0ZoZxN83WvHvcWSNE6C++Alh63tVI667eMCZ52gL4Vq6AeQzNG0OMVh5H//uLz8ZLE
         rHWCqfA4IVBDaRgRe16H6vkqtNLXh6VgK55Nt8BomZLgSR5mAKdJAnST8TtuRssX1Fzf
         vXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396242; x=1796001042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        b=Tol1eOjupJ/pPxAya5XbqXcIkxP0ny1l9jDD/3yl5W35M/GRw8IpwByK3ab2v/K6yB
         ZOyzAS52HCtUC12z7QDKNka5W3BuHPR+nCUVCL4cI+cS7OQoNRS3G92fDl894cSFQz55
         HKiuvx0VB602TmrYFaCTndm3ob0xBKPvTa7ALRlvFSmVpBi15+t69Ah+ScVlJCkKbbPO
         KnILzVpj8DbvuO5yj0bPLZIHk1m3kpjUS/aS8CI5KzL2tVVss6FzxxUEX1qF2FthzpU9
         oqDdsms+TYFde3NwG3fMZ3V9Y3dRPETtlLzB0/ABosrBeLRAmNyVQI4kv80bPK8SdKvl
         da0g==
X-Forwarded-Encrypted: i=1; AL+hErGHL9+S9P5y4GdWxU3CQk2Wndr17AqSP8Ri9AnKaC5JeflEs/EQGBzbajwdRXcUvByCiEIUmMuuDO60aDsnKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tgsr9vJXLS/hs7DaKlAhKd+cEGJMA6IIu9GkWeo6ghp2Dk8MJ
	EkfY0dO5ClqiGBlmKc/SCEIr3AJi5Huzxi8QvCnLmIguII/GilRyjcqViqpLDXwnfwr8GEfwD9H
	VhyDjRzL1/6JG4yp4l+uv1eu0ngjxluk=
X-Gm-Gg: AZFdTZdQc1s7vJDetUWubgbepWNeQY1ySIuiYJB9poxzXxezgavyy0xdOrbEFwpo37z
	1LBb8warhxgDwAWnybTbHFKjMQDSc500Mw/lWL60pbPrScc4SldAM7bvz6p2l3qwuFsM95Wua/Z
	pJMn1ye7gWKiDGvMSkx9U4qsttdb2gLlRuKX0o8fOQevbp4amCkLYM5cU5Gzi+4XZeMvLboV8Gt
	2HjaQzuhmAp3DWYjJs2R1cvsz6xv0Fc8KsWOy+fHseEVDXgHGN6q8z8thmT+gTgJWb718XKZcwV
	/JdroizTCPm6TEHJWLbKYbF9uePb0BVMhmJjY276xwSfppjlwM1S1YEVPqHWM6N4d0FABiWUFrA
	tD12H8TYh2BS6u3Q5lhEJM19Kpfn26BWNC2l9wJHjLLWcSziWqi2OMP8y1t22VZiCHr6R86MVNG
	xoYDLy8pSVVqpdv6AaKc0I9rX7+ii/2Jwa9kbD115hhuAuHdEtcUcEUFjMmDazSMpsz5vob32pF
	ePH5/U5zUaViPXL78LPpbtofaaCRA7ceN6Nig0y8VVx0H9UJkf2xTYSIDn41TBUyKdWIYuP
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr3075974e87.3.1795396242089; Sun, 22 Nov 2026
 17:10:42 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com> <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
In-Reply-To: <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2026 02:10:30 +0100
X-Gm-Features: Aa3M54rFs-Q8WtNxV5OFobaLS8L8ULiR3dCbdJ_AnvKKIHAVZYKbk7ifkdnzeZw
Message-ID: <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
To: Nick Dowsett <nick42d@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:31=E2=80=AFAM Nick Dowsett <nick42d@gmail.com> wr=
ote:
>
> Just checking here - is this still applicable for doctests? I copied
> some of the example from another subsystem. There could be some
> conciseness benefits from not doing this here?

Yeah, it keeps the rule simple (everything does the same thing) and
also helps others get accustomed to the style when reading examples.
In any case, for the example above it is hidden, so it doesn't matter
much for the rendered form.

(And, ideally, one day, `rustfmt` will be able to apply our formatting
to the examples, so it would create a bigger diff if we don't follow
the vertical formatting anyway.)

Thanks!

Cheers,
Miguel
