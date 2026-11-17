Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897466;
	b=yMCtR4t9jEYjcMc7YUSWexlB/fO6yx5EfDR3CZ3ZwdSVJUFELFRqqkRUIsFrsdSoLw6d
	 /389mIGaEYtlO1Ghjf8gIZk24ZZKbvoAyu7hEJ+1jdU6n19eMgdXvM1B8NU5YknawUhqB
	 S3SzS/JoQAKwooMWY99NLIuwDa9C/FWIH4SZucw9LV6Ec7eDO0sF46XlXnV8+5iYRGafU
	 dnMszRnE+xiNgbh3LY6kkHz9Fvm+SsCXrzHPuUpt8TxIKTz204JGELj/ic9fMH+QGD7MW
	 5IooFJQuCC1P1CJpQClTxQmZ0epXGVb20BmQ51GnhEdcCO7m9Jhgr216vYC6udFZnyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YUlK9ZNpvQHltexnJRlNgEioE8zAmE1eGzod1N8ItX8=;
	b=P+Ah11vVf6iFR7oSpIcQ0xyOpn0MnO8BA5RrYKETFFbC3BPI65VSL4J8eQPDCcZuKgCr
	 Bzky5vzHu2N5HQWQ6yp6BPFT+JLb/jdtRHHsD/Xm23RQaQblEjvYDVqUcjMy2scS45XAd
	 kZ2MWD8XBfCP+s6vWaygHVI8QLUx2Ii4PvsWrR2V4BOgoRXNYQX3GuATtM6t0oT1l4Ncl
	 akrUBEYC8didPW6R07Q09AQSNfYKTP1dazy8HEU42dpBojLYqkVN40C/fr/+9y+Zd8GS7
	 dMfat8VCP/gWbgBIFdYj1R2JDSjsOV4gUPF6KQlYvNRpMXGBZJB/kRo00VNE7zoygCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRk53iVx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C24606A323
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C24606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRk53iVx
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so366192e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 22:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897464; cv=none;
        d=google.com; s=arc-20260327;
        b=FTJzQyNQ+mAxMDu7mLsOfRdiNdxWYAtesjhpO7P6T2vUo1VJJJihdUhehmzyNBGwdZ
         g0aaWPxMBCGkZUZXd/BGvfDxNMe1ZmaMsP5MC5qPFS5cQod1z0wKR9h3cDE/GfFlMR5x
         393+1tFp4U4y8JF3sI/WN3ctn9KzYfs4QZySYmLRScq9T4SV36xUn4dCuoXOJPlCAo2v
         SCvtsykfC3fiiSK4gcDdmbf9vzBonCDNpP8jywYLb9bNKFPWenLocjzqyyXojatCvEsF
         If++P6EJcB7S4lx1+R195IwmxNkTTUnQzYTGm7xufStbwNJhoxKPhPW50YAX7LGiORcX
         4gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YUlK9ZNpvQHltexnJRlNgEioE8zAmE1eGzod1N8ItX8=;
        fh=dhIobTut+MGrmXwZFXL/z/Ps5M5d3nSFFImsO7FkZx0=;
        b=EbJ2SpJiU5/J7K7WlSgbxD51D5CV0oVGQUavOY3xuPSKnQ3MEAfzeqL1+54Twz958o
         itRbQ6CR6pOTyYsxZ062yENg/92Y/DoC4Qaui7mS3rahxb7xpwACGVg6cMqOQr+iSGtR
         OW1kNUv5NaATw+5UrFS++2U4ir7+RzKhnwL/YjBQj9kfy6qm5q3fPb+QVLvEDw7261vE
         iCg5UGLCcoPlDqLfC9z6ui4pfpw3EZUuaeqAy2m8AENAsK24iBr5cBl1Pwu9EZGLgtTy
         48TaPDoItYJdrU4ROan4yNZJoHVs378rWBtWIA3gtkp93jOpFIvullnepNFADXIXNxHH
         Hpkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897464; x=1795502264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YUlK9ZNpvQHltexnJRlNgEioE8zAmE1eGzod1N8ItX8=;
        b=TRk53iVxMjHe1ufTUpvhFZmlnus9n5cPzA7hFGRgZ5zqWCTfOgVQK5KSnI8vSKPJlE
         ukFAbEuPQF/yXgcY/qt9ZJN0KpFwdGlgeExtkh1pYvcP6PLieL/a4OoxyoQ5PNBT+o2v
         7IsAhe8+acOmTWANcROXa3ESAycHuTDowzl2C5V6fm2/zqopQ/Z1gxkWFf++CtrQOXMj
         GmWh3rsB0wf68j31nRC+Qvskxra4SwHzfVH7v1Ecr3E7i5Ot408eEWaFpzWelaoNmVYA
         QRSFodTIi55dykMLm54oglVr0t6Wa46zWtXTABtQddyPVH4D82+YYwg46K5tlEL9xMcq
         sgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897464; x=1795502264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUlK9ZNpvQHltexnJRlNgEioE8zAmE1eGzod1N8ItX8=;
        b=HhbU5i8NLtbcvunNq48vL6y6Vvn2J9YzN490kTf5yH3QzVEOnzwYUccnAZV5jPV26h
         pP6miRseCEzID04CijLe4OZUaAIBtDFmXPtUynxbMpev2NUwCwab9Z1wLbbVtjDjxB1y
         15pB4QRclrVlmiNJnlU4dd6tX/etAi7tUmKi0tccFPp5oIhlUuKistYp/6o6/lv6ddYn
         jHTPjwT08eXmZOG6vazZ5k7zWBeG2mVXAsKmfCJTmaCQGabW6QMVawa2VOhZejDtyeQs
         /BEwzHiezEK5YgIiruGfS4zG2hInlTBxQKDYsWSVhx7Ax6jDWjSNTDjI9D24oKNdwAK5
         fEGw==
X-Forwarded-Encrypted: i=1; AL+hErFBfF2pQmv7G+IrlHwHU80Wg8XvmmzFzMuC5Lo1PDf++uRyD3JFPHWNWfRBqUijkaxXZW4NAw96v2TGHqwPvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8T/M6/kf5CEAfoyYdN0wiSdcqcv9Yi4f8XoujkxygizKcK/032
	I3uW1p/GqMCXZXZlEW6Q9/nrExB4Wf7APEY+23VJu3cG+EBFg2x7GZvDrVSjLg2E+xhsnHG+lcl
	UcqKIBuIro84knw8WQo9gNmnN/2oapnA=
X-Gm-Gg: AYBFou1/0kGao/qCww9G9n5sjJyagkEWHES5WeFTbqCVnXKoz8b7wEt1tOT/B5/rXr1
	WNRToynh0eZg8nMvox2eZOGuEXCvsd6p1glsf/8F9g613SDAsKOn2i6BXqh1/4QgTtIGuqDq7Ej
	LV5IOqVoNwlIoM+cc2CzghcZZbhMnmnJ3kyPXyoiOJYW95hWKFI3AEizOEHW1AHAfRz9qqPdgAT
	4ixGCBF3ITuaShnpkRBGiWfrgCPbtw56LIJBm6TyuREZuyv1qEg4AJ51naEoo2CVyL0zXuP9mSB
	Z9Pvf6SH6GvcuRrrRexqbIGcSLRJ9Kp5CgPWvGMGiSKxmjadKnaIqa5LPn4H1HsvgSflCqh9c58
	roVJ/tl22NEWvgjou1LsVz6LSSQ5Q0Z/SeWuQ9xtb75ChL+TIC1/jJ5KaBUEOrfrQ2r2o3PP6NM
	qwybpqgOmtr1SRxnQVXzKGg9+PuxH3PzgijB/kQERRyfxLr42taEHE1MEk4Y1DfObo0TPbV1wd3
	BiTp8Vyls1Lzqssqv4ke1hSj/9jo8ba0uXZPT5CAU+eHrUtgOwgkGJOSz2U/+rKsr6ZPQR1mg==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr5742091e87.2.1794897463748; Mon, 16 Nov 2026
 22:37:43 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114001708.80599-1-ojeda@kernel.org>
In-Reply-To: <20261114001708.80599-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:37:32 +0100
X-Gm-Features: Aa3M54pSxBLoIp39ohV3UVQZCVKgqxmPHHIMH-JZdEmZB-mCRyeG6lnfgzwCdDc
Message-ID: <CANiq72=+ZC7DBx3rwTHQaKOL3JfV-bC7vUq5dsy3itEgoLiXxA@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add more `noreturn` Rust functions for Rust 1.101.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 1:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.101.0 (expected 2026-12-24), `objtool` may report:
>
>     rust/kernel.o: warning: objtool: _R..._6kernel3pci2ioINtB7_6DeviceNtN=
tB9_6device5BoundE8cfg_size()
>     falls through to next function _R..._6kernel3oppNtB5_3OPP18from_raw_o=
pp_owned()
>
> (and others) due to calls to the `noreturn` symbol:
>
>     core::panicking::unreachable_default_msg
>
> Rust now outlines the constant messages of the panicking macros [1],
> thus `unreachable!()` (i.e. without arguments) calls that new function
> instead of `core::panicking::panic`, which is already in the list.
>
> The same change introduced the equivalent `noreturn` functions for
> `panic!()`, `todo!()` and `unimplemented!()`, which lead to the same
> warning when those are used:
>
>     core::panicking::panic_default_msg
>     core::panicking::todo_default_msg
>     core::panicking::unimplemented_default_msg
>
> Thus add the mangled ones to the list so that `objtool` knows they are
> actually `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Link: https://github.com/rust-lang/rust/pull/163766 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
