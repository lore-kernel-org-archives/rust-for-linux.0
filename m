Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3566312819
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535363; cv=pass; b=OudPUIwh0D+dwrXj00gz9CXYOHtBWKrnnj3ZDndfNi8Wk0BlKMQudXwLXwpJHkdcRQT+RyZeHynljgJjvUnRTEdSEczxA8IoBgYYcNaRlWTjwmFyp1wJFpTadtDYn4+82ykUpQSLEtcvkgsaP3XQsQPzPKPdU4Moh8scUyZHzVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535363; c=relaxed/simple;
	bh=JD08oiE6Yw2TzJq/rTqPH9uu74PRjIBk6VoEKqCYbbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6s2l70rKqCtCr5d8+qOufVTA5wtUPUZaWKtXIDJwVzs8RKGdk/iquA4b1VREivQoyzWe9ZYcwZYn7dGwXt2y9YmSYk5DKa6tK8tOvrLSK20AfSUFukjYpr+1cnOxtPE5eXjOGyXGC0F+AxQmueS0dtEL6DKiNpsEy+/dFWurW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKqoq7xJ; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKqoq7xJ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b7063004daso394735eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 09:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535361; cv=none;
        d=google.com; s=arc-20240605;
        b=UEW6ZcZeLVANBUEHQBByOJe844NYS6rAuykoPX3iIUk1i2vQv6EAqZeCs4bmuz5oDu
         tNy4JcN+/mcowQIzlLkNCBuB++wlwyG5yXqsyfst0G7u98d2eZoRT7VZYPpvsI/aRUVY
         /2F6IlC3n4rhWz5jGmBQFGUsJT10VNr2GkIbuErE/A3R2VuzV/SMHO9yq1giPdr+cDt9
         sN1GJ7kvaoEJPcRA5P4hW8Za1R+9G8+1a7fPk8xViWZmyDgkgG/H4AKe1P06whfOuPY4
         akLX7pCJ2yQ9MuSt0dujmJ9PtDZny7gQZLP1WS/OUrZHr5qcqXvgDqvmykekrdxLpDUq
         l+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        fh=sHYw3Z5deKKZ5vx1jVyepZIMkPsmdpxCdZus4Qj30aQ=;
        b=Y8xvYAC6hDD4t2pVaDFWsThXqcZWVabDNbHQEeyUGYrqt3e9ZvavYRwzabBLt6YiqV
         rXbRN6b5+Qi5GaIPd3tTE5lRV61nGzQYAJBRF6eJrJuZvsZ5eWGsJbhTF37VOc1I9ZTY
         t7YukH+8d8QWoFsS72TDL7rImdVo5Q2d0w5m2BkgXTMDvgXnQuUAC6ZxigeZ2LJ455Bj
         qAGp/PxpBza0PIKhZtfVx9TzXy9MVKnXfx3PN0ajQF/C+WSIS6Csc7Clv9+GdSPV6Yxv
         0BSJNaYTHc9hQ4k8loFKZ5yAT3GcdzpImm9GKlPY7Nr/4wsevrFV/k+wLf0bsM8X4Ibh
         BM1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535361; x=1770140161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        b=TKqoq7xJ6hPyp8M/UEhK/mq7i2PkyAV4hK2qEEx2MQCCVne+EJhA/BpWuT2uTLSZpk
         elBKzN7Qn7T2+bWqN6kDSs2DSG2JSvj4LUam4e3afsdlW8kY6mq9kunr0a078Fr+czUE
         9Vao7ScK6twPTx/0Dyydc/0v7fj1TUUjQz1ATxpbcGjcn7vdMyHT91sBIIZQsXl1Is9U
         ssPgWktIp9v+vTpqnbLKrZzM+hrjYd/4VclLbJW11UWDPZXQ9q6hoQZqo2EcB3cA4Tj7
         83MdB06PkgQ2hXcgPsgFxvK2SzES3IQqRPVGo2powPVvET0pWs9igz0MoNk9pjQJQnmE
         a67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535361; x=1770140161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        b=unvrFqspsJRuDoj7ojYEZxKvMoGFGzg7hJpGwYILE4Tm2/of6UwHT6oXN9McZM1b2+
         AEXnoHbNrnpsC53b7jI3ouzfP3Aw6gZg/gkFkOezHlZ56agI5xqaIBFfzFOX121qhDUp
         iTePWRmfw9rVzARUiYQwEHDR7/hmLI1i0EBFaEC6BkDWK/rZ7l0nrYJRfnXXyocWDaMA
         E+Www+g5vzkuc+EahrTjVEGYWuH4TsLvQHfBmVnLBJ7WE8Ej+JJl3nhxq3oSHuPE5ma0
         UA9y6emIY7XGfgRw3HVYffXBsvUvjJNHnqvuORS8yVrigUnR4uG5EanBsEV2proivj4l
         q91w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5XSAWjP7lemWf67ikMheNm/DSVVlaoZZBctVjYXAvLurhczx4fY/MnN60agda/XDMqMpAj6uiEVEAA+1mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRqYlvcyru+3XQnQzBgtrxEksGkMACOZErqKoxOojXDWCFUhY
	A3841xUXxQLhUwc1w6GFTILI+/f33Yh5m51OaVKAKm/yqXYfS2X9wjOPoZj+eiEKF1aMFDpewtG
	FVkGng6o+Z8i7yplmkoaIj6lrS+GoTm4=
X-Gm-Gg: AZuq6aJdfNTQU9N40jO/d32SzTxx6VK/zI/iqvVuxDX74Rvk+X92F51D1uVeqEqxnt2
	Sdnku+F4HUCOvvExtpL4K5FMULO+zeFyIEvA8KHzGhIrvWyTAeXUZGj3F2Uq+c+h0Gz0Z22Bk+N
	n0Mgt68XSl9LiJmetjhQrDP9G81qeWtRusvA94attzHUT/iu2rzTUNdXm1CMX48tunNQQPQYqS8
	jjESZkIz6KAJ6bimzM1VJ2OP+V0uBJatHTKNwxURUla4aq8IG7aR68uKJQtF2A44CYDnQji5Vdz
	DuyWHuvO3hq9m895EYTUwvrAftd1SsDrN/RLvLi3fh7pjMngn8rJhj4+VPbzRGO09FuoU7H7UCk
	ESKxUTm80AOuT
X-Received: by 2002:a05:7300:fb91:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b78da099c0mr810010eec.7.1769535360687; Tue, 27 Jan 2026
 09:36:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127172330.1492107-1-gary@kernel.org>
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 18:35:47 +0100
X-Gm-Features: AZwV_Qgm_3IfGEvKbTylRDY_m1P1aUTje3EQ2OOkhht5rNH93Rxk8Gai-6rcDW8
Message-ID: <CANiq72nJHqOaZEF+RSTu40kFAKgSiJ6u2TTKj1q-2fzmseW2rg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Initial klint integration
To: Gary Guo <gary@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 6:23=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This RFC series introduce klint integration into the kernel.
>
> Klint is a linting tool (in the form of a custom Rust compiler driver,
> similar to how Clippy works) that I have been working on since 2022.
> It was initially created to help lint on code that can trigger panics on
> allocation failure; this feature has been long obsolete after we started
> vendoring alloc crate and subsequently replacing it with a custom
> implementation, but over time it also gains some other useful lints.
>
> Lints that are considered ready currently:
> * Items available via kernel prelude but imported via other means
> * build_error/build_assert calls not being optimized out (klint will
>   provide you a backtrace to ease analysis, as opposed to just a linker
>   error).
> * Stack frames larger than desired (configured via CONFIG_FRAME_WARN).
>
> The kernel is not currently lint clean. I've already sent out a series
> to fix the prelude imports; there is a true-positive with Nova-core's
> Cmdq::new method's excessive stack usage which needs fixing.
>
> Many of you may have also heard about klint's ability to perform locking
> rule checks, however I did not consider it ready (due to false positives
> and inability to analysis some code patterns), so it is not enabled in
> the series.
>
> The source code is available at https://github.com/Rust-for-Linux/klint.
> It is licensed in "MIT OR Apache-2.0", the same license as the Rust
> compiler, as the tool is heavy dependant on the Rust compiler internals.
> Currently, there's no pre-compiled binary available; it should be easy
> to build for rustup and Nix users; if there are enough demands I can
> also consider providing pre-built binaries.

Thanks Gary, it is great to see Klint coming to upstream after all the
efforts you have put into it -- for others that may not be aware,
Klint already discovered actual non-trivial bugs in the past!

This initial integration looks straightforward to me -- later on we
can add `KLINT=3D1` or similar.

It would be nice to add a short paragraph somewhere in
`Documentation/rust/` or even better, just start a small `klint.rst`
doc there with something like this introduction and an example command
line to run it (`RUSTC=3D...` I imagine) and a link to
rust-for-linux.com/klint or GitHub directly (unless you really want to
keep it only for experts for now). Later on we can add more docs as it
gets more used and integrated.

Regarding the pre-built binaries, Nathan kindly agreed to add the
klint binary into the LLVM+Rust toolchains if we start doing pre-built
binaries, so that is great too for others to easily try and to use in
CIs etc.

Cc'ing Kbuild.

Cheers,
Miguel
