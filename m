Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B91F8923
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Feb 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272253; cv=none; b=RJKyrN5C1u4z0lOzGcgX8fyRlt+leQjRdD3iiHKvLFSo21qOgb091E1hbRxUnFibDgoA3uAJcbg5w2CnbN4iaOzM0PYf2+rTNDVxg1mgoECmB+1Cee2tMBg79PL7fMD8ZOiKnOsEfzdKfIJLdKswRPvTH5uZxbZQUuweKhGKR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272253; c=relaxed/simple;
	bh=WPb2ORZc/9ZZ6+gHNdJlvp8bilbLUMvl7JnfNtvGfEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8wVLGTxJUFV2t63vYXyH8BSPbGcDNr/LFIBxMB98uUsgwEIQgMVUS5yLvKb45yhVph+lWS5QDDO9wwt78MUHNo4G8hAJYvqT1d6z0YDMM/2m54eJ/Dstg6H4Jq74Kk+8js08l7fOMhuIS+k9O0DfFhZU+DKgOeaYvqIeh4vpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=I47V+x4+; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="I47V+x4+"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4654404276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Feb 2025 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1739272249; x=1739877049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=I47V+x4+oJekKAnoV39TFWOLke41Iij7hbPNnF6m1ImZmHZQpjfTfTdUiKccLXdO4r
         HKBTmy/gKEJdXY8PmjMFvMIh3hUANv16jj3PeEPiLek2mYRBlwVoVet9w7AKXPANGdT0
         1HqFt52fDYGoKvr1Ne7FqMQ0e/YhWOaYiVZu/40T9iQHkdJXhQduxY0ZcPbSdRxDxt2h
         T1IEairzYZDfLzFvIpOktsrYM0vMxp5B6Uzl5qh71InvAcbeCfC0/uPnMta2aDZ2ikDN
         6sh/fgPieq50tIF0pbslmOJ8fEfIZe9QuqXA/FmkVf712Wk9g7C6xQnwOApsKGtIOCnw
         Qhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272249; x=1739877049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=glByCvDFHxBR4RdJ5+FsTFdL0CaS6vmVytbn2Z1gmSv63Qg4HIjqmCCZrtNXfBO9iN
         RG+L7GBJNg9rm48JXwVXAZSHntWn9021azW8RWutK4U7Kw/tvrWeaZtyvxHRGZ7px/pb
         KLWIK8KWmbLmwNknO5hIPDve4MpWhDcqdFqoCyK1Onk6IB97hAYULrccp8HEjh+DjLwP
         W4//a/RC4Im01HqBcv5W8md+aJalPXbJERL5tvWIySyK2Hn3btfnFiljnZZyTV8ihMLf
         II19N5NK4viTMoqteWAmLTQDYXRX/hMEHlkWTjReSibLGX71K5F9vq0uz5kIpT1RHwgo
         hbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrk+i1DWiaBxmie1W1rz183HqSTI7M0/sPprMUMy31UBsgZZ4ThQX3/QIO4ALgWJg0rTYjLmHy7Vqja8oDFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12g/1v7pjoB3HgqkcSuie5xfeiv7XKHhXy508AlYCOiVuXsyv
	rIxldRZ8QA76GLr5UJgXb+nQMLFiSXzMczHamqY93yAK3nire93PP3stBaX2ensLcMcERoLD6wl
	B2jZFR9vBU5gv0HQv2tyBt4c1+sK59OFEYZ2MxvrDH8EFUoud
X-Gm-Gg: ASbGncuOYUhRQvTG49xFxNCrkbriurVqwD2SAKNskiSQNzJZrKrVgNBBLxhrTUM7Og1
	d6JheJ0jyL9AmLmQ+jl9Ytl5Qnhh5969hXVSRuAZnrKIsH2kBl8NU7ZoeJ7V+XjoKYIA9dhOf
X-Google-Smtp-Source: AGHT+IGwcyBsYc46RWArEeADU77H8bXfVzk3irEgxqL38ZDIwj53ttNaZ+UD3iPTNd+DjLbLMEDFzT6kErsvcr/dhMw=
X-Received: by 2002:a05:6902:27c8:b0:e58:7aa:7de4 with SMTP id
 3f1490d57ef6-e5b462c2b38mr14587566276.45.1739272249457; Tue, 11 Feb 2025
 03:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org>
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 11 Feb 2025 05:10:38 -0600
X-Gm-Features: AWEUYZn351_k4v10MDh5azMViiAdx98NkshCWwsinZSeHh9hCB6x5oVItn12a_Q
Message-ID: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 10:38=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
>
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       =3D note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       =3D note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
>
> Thus, instead, use the softfloat target instead.
>
> While trying it out, I found that the kernel sanitizers were not enabled
> for that built-in target [2]. Upstream Rust agreed to backport
> the enablement for the current beta so that it is ready for
> the 1.85.0 release [3] -- thanks!
>
> However, that still means that before Rust 1.85.0, we cannot switch
> since sanitizers could be in use. Thus conditionally do so.
>
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is =
pinned in older LTSs).
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: Jubilee Young <workingjubilee@gmail.com>
> Link: https://github.com/rust-lang/rust/pull/133417 [1]
> Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/t=
opic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> Link: https://github.com/rust-lang/rust/pull/135905 [3]
> Link: https://github.com/rust-lang/rust/issues/116344
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This is consistent with what has been discussed for a while on the Rust sid=
e.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
