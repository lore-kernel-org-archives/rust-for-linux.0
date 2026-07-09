Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1F4252C8
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600581; cv=pass; b=hwSkRIHthZT0rBBJ/54E1FrJwC9im9Ae9QR6Dd9Mkie71ZdK5BPem5NVRiR6ZV4a/BR/BGxVON3F+CNZ3gg/xqGYG9EWbP059fNyIe0qKtr7ifKMpY8JsPCIJDO785aYLMCv9+6cVh3z/j7Q3Lr/1nhkb/MOcNRVfDH2QEC+Ieo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600581; c=relaxed/simple;
	bh=EZnIMhyxq8/WSozIlMLiElkIfQ8ZrBt9dufg8sJD6BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaeonioklplFr++ysnppIQgW6R1ir7NUT0Xy9XHZIpcLnJSRIh1hdiqXkk81IEhJcD+tQE+WakLnqW3EdmZRXVg+dnMzOcVlCBHDxwgUj7HZns3TbwwAfEprGk1WnqUbOWjV8DbVdebVma9P94WE3mzeBHKVlkZ9vRpxnW+h5N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqUoteW0; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqUoteW0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so379471a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 05:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600579; cv=none;
        d=google.com; s=arc-20260327;
        b=cBb5triRxGrsJAg3TAttv7wKIzxjN54o0J102qlj30a8quP8AN72H1HN9EsIhKN6KI
         MFHfJ030THCTHgvrRxSC0GrUuXfvfVx8n6OdrPGOxWBeYYzHsgYs1yyLGJSH3bA/Ucgp
         IRHKsoFAS5MwhQViWFNbb7kIwbWY0ENqQHSvvFp1va/sM6aO/klm/khH2iHZEr/j4oKQ
         k3sClthL7kGLJvwd23kFBEDDh9Y2vlFFrvPdP06+NMjNNlMwYvy61O5RJ7Y8I7bZKahq
         0duea8A93TaLCbDa43oQ4ta2p6A4MjL6iG7dAAWycQVgfj457ZeU1HoP+yzzPVh1POa5
         lZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmE0JTCOruYKrZQM4jbbugvhQ7RQl6mUUTUdc9aMHs0=;
        fh=/GBUxLKQB0cfi+wHoMrecZoqtHdmxGkh7P4y8qjwrg4=;
        b=CJhixJV1wCmS4AS1/v7ZrvPjuGzDRBiVyIsEOfKue55WXbUmD+loeH8S1HTWtQQd4m
         Abaco8iWrhX9OpD81h8x2M5VJCSdp0bt0j2Yh13dZbEHy5ImBw8/XQq6k9ihF4opm1/F
         JY4oQovGG8bZ/POg9ojY1h5bBlw9bBp1AxGhE+Ag22JALWZJsR4XGc1IYooH0We5nigc
         dcDJYnMwhqiuAYNZbOehnZWQdsOKA6XY+fmiHd0Scq4u21QcYys4ezeFVOQAlwNtHHnS
         rP6EHcGLZ4VbJq85cFluBjfO5nocYRViaOttF4d9r7BcQWavwFZlysBKKgBPSBBV674E
         kHeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783600579; x=1784205379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmE0JTCOruYKrZQM4jbbugvhQ7RQl6mUUTUdc9aMHs0=;
        b=DqUoteW0yXh0DPAGBkdeFetSnFI5NlI2hib0zEK+cTY1WCusqUaohlx7lQfG1YLyGR
         disNP7ugJ4w2QdA0Ijf/bajJ+zH6K5UDHHnbl0FxVcuwU+yHRa/AgKO3xFdadNKCoOgt
         c2pqpi1Y0gYrde7FZilUSdESVMsZis6uLXdG1lNzieBslIFBGxn0EkWcGT7a/w0hPNLO
         HS8GzZWiK2of1kUfH2flzgoIi+dk2EONeCERDp1bccf0DnA+zk6bgrjKWdnl0edcna+L
         ddJL9Q0Lp08lIeCNuqjdBcuaWwNOe6eXrJEMAdu7V8SWPL5UGCcvjDY96pVfF75NPvgG
         NYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600579; x=1784205379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmE0JTCOruYKrZQM4jbbugvhQ7RQl6mUUTUdc9aMHs0=;
        b=jMo63LpaaCbUKm/+er9dy1sE+RoJMOeuYvjAjkVXQQHl1fVufEQJBvsPXxQoH28y8l
         e4MAbg/KP4LBq4Lkj5BvX5lK9qscaPR9LafYx5l4Lt+JmeVfmCP04isBnEC62Z2gaTUV
         gRp/sF0oB09BFJ5KpL9oJqI/hXSyNP7mSfo2iuw4ylO8luZvC7ZoLq2wNyPxU+UxmAJF
         oeiMQ0a1oNbGUFruNlyPIGJyS7ymYPGV78xh01RBqzFE9Y3eU46mfoSyxZK5QPg31Bn9
         kTI2NwAQe5PV1Etv3a3JMJEL+HkypiySs15iM6AZVLoT8/UL3Viytt8A7pzOIAw1mEPR
         /aRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5i1TGHcBfFlin4NlVYaku9zjKSRhwgMcDImksHIlgdoQj+mZLpUnlTDds2PMlmYc3vXt44td61OjNiT/6ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrnvlw9qSRmEKInBnJLQdWideQFgugqw3Q+Z66e4yN6MyuwNfe
	e7HiPmN3r5ey/udmX2Z77Ixe5xz1T+9OwBgh+bVdKv05nCZYHD8DOYg+JnlN3XVLJnrMgKSx5If
	yqnkiJaq4vfFe1lTCdNwLYAd9iq3uNgs=
X-Gm-Gg: AfdE7clZqx8bpbfpAbz5gT1IFAQKLmDlyiAR9uQQoOgDbIRLoQZWD1GcdOjO4LUfCqd
	+5mlsj55IfO4QaPtmtZSHcREu42MTaQcrjcgfyQuuRuawbpgFhIzJgJBkRb5DCJcgEktIa3xiSC
	8Rs9nC0+505DyPm2psv0N9gBsKhK7L6hILgHnaOP3t7SNgjB1ThfRwlAKi+OuUPRup5vMdLjywr
	bNULdxNsu/Lre2TLhul4Tqmp+vqjlnBuhW+F78lXiGTBRbqxi2HcBGDNCiEuMrnDC+BtlQcfabg
	Pv/5xk5TUh6I3dQv+PgtY04DRn/i33AImKNXHkT0PrQDmOcH5xWXMO0ROyBeymMxbWJxJQyJhWI
	tNMka9D6M5YWo
X-Received: by 2002:a17:90b:3fc8:b0:37f:df57:2ddf with SMTP id
 98e67ed59e1d1-3893f97f9acmr5955183a91.1.1783600579406; Thu, 09 Jul 2026
 05:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708211435.402426-1-chang.seok.bae@intel.com>
In-Reply-To: <20260708211435.402426-1-chang.seok.bae@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 14:36:06 +0200
X-Gm-Features: AUfX_mwL3bHKWtprsetd8vD3bzrJ-aNGwy1RO-GdBAT3lh0aQQKrh2dMlZPTCOA
Message-ID: <CANiq72=-HjYOoJPd=B+0OYrHuyCO+NpcjRvmmhT_ecVZj8q97Q@mail.gmail.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating APX instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	Omar Avelar <omar.avelar@intel.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 11:40=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> +        KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dnative $(if $(call rust-min=
-version,109100),-Ctarget-feature=3D-apxf,)

Hmm... I don't think this was tested?

There is a missing `c` there -- the flag is never going to get passed.

And while it is true that `rustc` knows about the target feature since
1.88.0, it will (sadly) still loudly warn about it:

    warning: unstable feature specified for `-Ctarget-feature`: `apxf`
      |
      =3D note: this feature is not stably supported; its behavior can
change in the future

Instead, we should be able to do it in the custom target spec, i.e. in
`scripts/generate_rust_target.rs`, assuming `-Ctarget-cpu=3Dnative`
enables it and we need to override it. But please double-check the
interaction between those and test that LLVM is actually getting the
right set of features you want.

Finally, we are trying to get rid of the custom target and instead use
flags as soon as possible, so if the flag will be eventually needed,
then it should be stabilized.

To help with that, I have tagged the tracking issue with our Rust for
Linux tag and will raise it to them in our next meeting, but it is
even better if the actual company pings as well:

  https://github.com/rust-lang/rust/issues/139284

I have also added it to our usual live list of features:

  https://github.com/Rust-for-Linux/linux/issues/2

Link: https://github.com/rust-lang/rust/issues/139284
Link: https://github.com/rust-lang/rust/pull/139534

Also Cc'ing rust-for-linux and the maintainers and reviewers.

I hope this helps.

Cheers,
Miguel
