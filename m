Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048B918A921
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761497063; cv=none; b=G7DZQR11Kg9IWGawKCz9bivWY9bF9/V4ZOGphKUEdFMl/OlZkbhrDfBTEgSHItei5ykCTP8/Yr1tXVs9p4BYwhmCwRGcd8iEtU07AmJbRdwoS53prQgH6mJuKQumaCRpo54NiWdgH7lx3T1PIOLBlPK/o6tJEN0uF5CwUF3oEow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761497063; c=relaxed/simple;
	bh=KMWnw6b6pivqyFZPVbwAkq33BfV587bvoZCL9h4aJtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlRNPcCIi0mIyuyTvvN+1ESKGx9QdTBBYeb7A2UrLs+Bf6LHK+yvnVDYekp7MfvSNcqtPgg3F8cwEMtIzc5z47daw9RkpndjpPhFh2skG6UEl1/wFcWG/Ovqed7yXvMQYGCslnP+tqyiCG52mxcrlF7NYw+AZ4df94a2iDCvlIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOnHN2+C; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOnHN2+C"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29301049db3so6430785ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761497061; x=1762101861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wILLtfeNYO6vlF1lVdjizAOVshwGgLXWHD0xoxegrM=;
        b=aOnHN2+Cc0sTDJrg76LxC1mQ82AnbxndPGh5Vkv1OX1bG1wPKamjoxA5vV/nFdc5DV
         ku4jifojt9QEgIplgkbUTaYF/k26rSYkWhfJH14PCpueZ39tpU+48r86YvgxcPes/5E5
         2lTJVDZjLYQAwMA96cbkPDHUg+X7szYzmgSo5kne7ia2HC9WmGOcR7lJ0wQ+hv5CVKjC
         zyQ7dv0YOQyJmRkOHSCuILbRyASwtrBqEJ56gkuadLEKk4lCqVhfGg+hwrHBbvyt1mID
         aUithr606CfOsE4Y0sWYv8nc0Di7FLNlpWhKdg4G1XTrxIXnQ4fhTKDe41cTjnSV2rB+
         fGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761497061; x=1762101861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wILLtfeNYO6vlF1lVdjizAOVshwGgLXWHD0xoxegrM=;
        b=mcUUVlRGGHKL/LQ3pPWBxc8Bc10VCyBulwPnKVvl2gnSkTcrsOBN4eFxbCwFVJ1OWb
         5GJjrCkTRxoTw55ThnvfMoAc0yD2TMf+vxd/f9NAQ2tfjpPUcqOQ4/YbB4RTI+yZTe2E
         Uu8ie1pvgIknT9fJEP1BeT4J8phB9htaUZGcAvKCNVpkLPKP4Lc0ltU55r0s0lk7ALJO
         pjeKeO+r+DseshCgMtXwxY021qlAfM+U9r9VbM7Ywsv1ZZPVcGdxjctvPY9we6Y1bSXK
         9/bY61VqxtqBG6grSTnoi3irD/7I2QgcqXh66VT3W/1vRr+tvoA/dgrprB8NqloaRASr
         BNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7O+hixxErGC0v8PN37VRMpbewN2g24Gp2BZFH9v13fcslD1tKcg7VC/4A/X+yaez0UuqK87x/aBwFzNmYwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvjz8A80xpCM1jTKn9SbeTfigX7cHAuOCX84HD+s+Yo8KLtgrE
	Kksrqfs6w5XsRv0G6FR+6BUwqpzkJCwdZ57ZcbqsOchPJWaUp9qN+4v7M60SP+bZHCPTsVRzx4r
	rQM1EpMy5TnQiu/LJG7jW9dBdbSIPZI4=
X-Gm-Gg: ASbGncv5RjlYoZOJXsBf+arR3eWbyKCSw5ApB7ZUk7Oc59gK4uPQiZpkRPr0BYx4UQB
	BqYKN9BReC52zFXXOH+6y69T3K7QIhxCaQnAuLcc4zvet6E1nTPwlg5/x++bKzUKsMd/UdARuvS
	i2krjnJ8PmQggshp8Ct9j7cj88ftLivwrgKLGl+uBrRzpqHNPNyiim0tk4HlTXBgRFHEqiXIFcJ
	Q+zHtWYWzoVpGfUsNLDvNCSSUsEPR4l3q8tqktqjMr+qBKfukn/j4FwQB0HnSoY6pPQKoH8fDze
	zUs+U4jZ6afsd8JrWTonzjbls8EwmfVb1O56YBnL6T73yaKiA2WoUbQbRzxoIg23viPIuzT8E+U
	7ZdHQhiDKUZjrNfcsL7EWPWzD
X-Google-Smtp-Source: AGHT+IGcKNBiOeJRVxt2uo6Hqt2C6o0CYIe4RfW4BEVkfN4Gc0z8gi+UAYPMQz7pRTqkzl3cw39cqdYTdggHuWXBRN4=
X-Received: by 2002:a17:903:1ac8:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-292d3e5084dmr130371015ad.1.1761497061350; Sun, 26 Oct 2025
 09:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com> <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 17:44:08 +0100
X-Gm-Features: AWmQ_bkdt-5-XZk5dwhGctE3nBdh_GyjtSn8Bs5HCiaG241yBI4aSb7WE_0r3tU
Message-ID: <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +/// Infallibly converts a `usize` to `u64`.
> +///
> +/// This conversion is always lossless as Linux only supports 32-bit and=
 64-bit platforms, thus a
> +/// `usize` is always smaller than or of the same size as a `u64`.
> +///
> +/// Prefer this over the `as` keyword to ensure no lossy conversions are=
 performed.
> +///
> +/// This is for use from a `const` context. For non `const` use, prefer =
the [`FromAs`] and
> +/// [`IntoAs`] traits.
> +pub(crate) const fn usize_as_u64(value: usize) -> u64 {
> +    kernel::static_assert!(size_of::<u64>() >=3D size_of::<usize>());
> +
> +    value as u64
> +}

Since you have the static asserts, this is fine today.

However, we may actually get 128-bit architectures in the
not-so-distant future -- Matthew suggests to be ready by 2035:

    https://lwn.net/Articles/908026/

So this one in particular may actually not be true "soon" -- we also
had related discussions about these assumptions, e.g.:

    https://lore.kernel.org/rust-for-linux/CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUM=
HFTuuj5ydmqo+OYn60A@mail.gmail.com/

So we should consider having the `cfg` already to prevent people from
assuming it will be always available, and likely a note in its docs,
i.e. we may introducing trouble to port later on to new architectures.
Similarly, the docs of the trait may need rewording.

What do you think?

Regarding the `.into_as()` name, it makes sense, but it can be a bit
surprising when reading out of context... The standalone functions are
super clear, in comparison. But I am not sure what could be better.
`into_in_this_arch()` or similar could emphasize that this will only
work in certain architectures, i.e. it is "an `into()` for this arch"
rather than the general one.
That would go well with the idea that you didn't implement it for
other obvious types, which I guess was to avoid developers using this
instead of `into()` by mistake, right?

(By the way, please use intra-doc links on the primitives too.)

Thanks!

Cheers,
Miguel
