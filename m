Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8F3D47A8
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510483; cv=none; b=JSH4n2j/mdIBhuvGaheF53AECSyDLcPOq0xvorMdxvuKKIZ/tgrX/NVQGiGCqmORXvMurdDqHEtSNiNZYw3qUMIJbakcVarDeElilGUe8Sff53eapLjNnA1xdIgV+4BgL/fYwZzONFJkAr6MZZ3LzIyKdWT/QRthVWLeNDo7vQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510483; c=relaxed/simple;
	bh=OsrU0PMt8+YDVoOHUtmxSBoLugysIRKYS/BqMy2/Kv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDKjGzc0+ISKBQsL5ho/z3K8/8K9sQ8fWRnKRLkkrOuvZywuU2pUBI2Tqr0pKY30xkw0LFH6OJqaBb2bzmqc/mWe4xRSDu+LGmSmM7bBXPZl00cHBtC7eNg6Pa8dzM6fgWrvoGVsufmAgu1y+7Rs2dRJFuOjJNLvOAz8/U1a7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUTVfREc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUTVfREc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAA6C4AF0B
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778510483;
	bh=OsrU0PMt8+YDVoOHUtmxSBoLugysIRKYS/BqMy2/Kv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XUTVfREczfwvBdKo2LVqz1c08M2v2f0GwwRGumnTAaXBOO2x1Nh7QLuREkw9EuIze
	 Dnfe34XXBVyBMxrFDjt0Pr8ca7aoKT2NgZJHDPcfZqamlXP4PMFetnisqZ1iP+85/G
	 LGUSfQhXljSevoPAZAn3K1kDx9XY9tymo/U/odpqtsOumsinHikoB0I4nhi9B/t/VS
	 kKbSAorxvXK7MglklAJBd/6e0R+Bal6zQSEJbuLUOLkY8QKukFuldPH/PzI/0KT+RS
	 6yyD3iONGGP42AKxq1eNL+4723OiqEn8PnWKvGS/VeIeZEHdBDNb4uUn3OnZEn+7kd
	 GVcF4DXYjeOPQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3938cc204a7so35484871fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 07:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hf++QopJLvWtG8re0FhmYMAOyzqTRZ+prBTiaX1Cw/g6FovdgbGr6HgtJkGDlY9Er7sYC+DbFPujTveKSmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMa0OQZmVUMch2Hnmk2qC3BdMlRPoXc8tCWjY+SQZ0vZrK28A1
	XNcppUHHb4wck7+pvY4SghnK7V6zp/6pvKGHcPEolw7Vcdl3meEhSwmkNk1a6sULPkFZYdLE4Ae
	DAEwJqhUMQuj4TZYwJwSbwhyTczs7hqQ=
X-Received: by 2002:a2e:920f:0:b0:38e:84d3:f2c9 with SMTP id
 38308e7fff4ca-393c40f99ddmr57553551fa.7.1778510481651; Mon, 11 May 2026
 07:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
 <tZVMtGYsm0cBcaJI0F5LiCIFXdKzw0Q7P6i8r4QQD3w9qOXUtzERcMCmufStTD8eP-3QZqdVRkv4WO6RALToRg==@protonmail.internalid>
 <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
 <87cxz56mge.fsf@t14s.mail-host-address-is-not-set> <87jyta5ymz.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87jyta5ymz.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 11 May 2026 10:40:44 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mOrETyFMFpn9yrZ960=O2CV6BKBxkNoo42vGzv_LPFgQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lilrki-KNMJPTUOYHZr8kYKbRiFiUYtgqL5xDfxyG_ospbtixlRPAilo4
Message-ID: <CAJ-ks9mOrETyFMFpn9yrZ960=O2CV6BKBxkNoo42vGzv_LPFgQ@mail.gmail.com>
Subject: Re: [PATCH] rust-analyzer: update generate_rust_analyzer to pass cfg
 to macros crate
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Malte Wechter <maltewechter@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:00=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
> <cut>
>
> >> Directionally I think this patch is incorrect because the macros crate
> >> is a host-side crate and generated_cfg is for target-side cfgs.
> >
> > We might want to differentiate macro implementations based on kernel
> > configuration, or as in our case, skip compilation of certain macros
> > when they are not used in the kernel build.
>
> Also, the `macros` crate is actually built with these configuration
> attributes applied. It is only logical that the `rust-analyzer`
> configuration reflect how we build the crate.

Hi Andreas,

These justifications should be in the commit message. I agree that the
`macros` crate is receiving those cfgs, that was added in 36174d16
("rust: kunit: support KUnit-mapped `assert!` macros in `#[test]`s") -
this should also be mentioned in the commit message please.
