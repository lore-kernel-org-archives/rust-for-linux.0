Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2C17E01B
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610016; cv=none; b=qTfxSfdWiJ5ip7DcNhfiAN6Lcc/M9g3D+VHEDMi7wkv6WQRg2fe7vZPFLynwZ/IutU33yKyLI0Y58KxMJ3xNlAc6FXTNxvLhwpzsrKzdM4v83tlJK1Hbf1gPwffMGReys1xfddm1sHDKu5ZWIECIunuOi54P/h9uNLg18Bfl3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610016; c=relaxed/simple;
	bh=R7n2ZyuyxqDRW6C1D6RMZpLxcak+oIHfoDE9s5HZN9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9a7HpiRywuQnSB6dGqzo2EnMLP+RMA9eQbpXQa6iIiFJhUNmAQ/QX5xjAliJq3E5AEgKOhCEqfuhaU3HhlCX1JsurVpGQ2qTb39bQhaiBOCi74RJ+PEBJIseq5vQCLQiS49WdsqhPiT4rLzj99TTCbuuL6TVlZFDau4Dv8/LTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkTOqF9s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkTOqF9s"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so1515928a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Apr 2025 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610014; x=1744214814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RNaKaiCWSzL9DFd7Yzn5msZxLu0taqRiSDPKp80fxU=;
        b=CkTOqF9snqRfkvxNHq8MGfJhUu3yATUf8z/aMinawq3lV/CsgcrUzmyLwP7n20MTQB
         0sP8n0kFGp/mwSFOMVZR8ramY6h0eDNLVbm/FUPg/H22zWfS8c0+XAaXxGdMDyLyTqG6
         LnPXWRj+Pw0EIBu8eE7bO5/Sc39iYT9znkUt2yGQ12VIyjapGLiz5e7xbFjFsl6zCgBp
         yR8HnR+nalI+fqBySGLckncAeh/8Su1BtsxXbUm4uM6oPLpZJnRVTuLpNKgzDU79gH3R
         Yv3rBhnLwCvSy5/xRY6Bfwao+44slFPxC6CPE9GecrxWi9Bc2pL8HVPh5AQiofhyo7+B
         9kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610014; x=1744214814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RNaKaiCWSzL9DFd7Yzn5msZxLu0taqRiSDPKp80fxU=;
        b=PRetJI4+7PbTJJif32RHBTneCPNm+E++Qprcmi59+KPLMJg8NAkTqmojKNkTR9OfRa
         RE6albB9s6025UfqCSyU4zokT6yq173aLU1fzSgljyyRIIWl4r28JbyX/XTcJKUWVuWb
         AsuWza5XIsU/DXDI+J2fMkPGsb3lt00HUha2XVBBX2IKx0O4eIzW7ZPvNm8oU8nvVZQM
         OL1FRG4N2ul1IKwd5y4tyPHR6z/hH7wptOnuZ78msjFfsapLYGKK42q6BdSIzMJTPOQz
         2fbvIHQKb3ctMnI1tb9wdaDANj1FCpaSdAEcjU6NYKZSB/QUaM0BuzCkc7SU6l/SiArK
         jzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVYBBcgGwNPXzcBWFPgjYkHkyN2XX3WZsbC5M0GDkGMIqdS30WRbbn2aXzsiIhv6krGVY2VogcvoM6XEUGLIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoblNoSeKzaZiY/59i5BTpcNt4/ixxOvcx8YUx+yBkbTsUG1oB
	IWc12XCw4ff91FkI60R16lRDNAZyMKr1nxuFJw9Z1ovOnYvzKkjUOwM7Ie1W5hNjdCN4tj1hf1y
	cHnkLehbbQ/Fxr6cegS9AHCPpFXM=
X-Gm-Gg: ASbGncti59gyQnVkIDi+B8i+O2UsIpFrImhliRzGvJUTVu2ZlcXmcanM05ORAuyg8C4
	zM4r90JZg7Lbn/rvJipls3jB3k1TNa8TgLNvPziQBH+YU/Gho80VZxTVhUxdm2qplPoEn3an5Sm
	KmQoa7TAeGeiE5jZoTzMqEYP44xg==
X-Google-Smtp-Source: AGHT+IHTEJll5mPZfL9mR38K2vRf6a2Kt2wjzmTWrkkvunLjbdGrApZfZexxI4Q7Z6c30SlerIDOwLn0LDAeTJc/2J8=
X-Received: by 2002:a17:90b:3b81:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30562dc9aadmr3733609a91.1.1743610014205; Wed, 02 Apr 2025
 09:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402104759.1764282-1-igor.korotin.ref@yahoo.com>
 <20250402104759.1764282-1-igor.korotin@yahoo.com> <CANiq72mysmMph1zGAxPKDY_FixbRRa0kS3pSqj4Qhq6Yjqq2AA@mail.gmail.com>
 <29f73af3-e097-4c7d-889c-394ae1d2d961@yahoo.com>
In-Reply-To: <29f73af3-e097-4c7d-889c-394ae1d2d961@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 18:06:40 +0200
X-Gm-Features: AQ5f1JqixEfx3yfO8j6l81-FE_1NZ86523rVqo2tB-oOH9uopayC9DKlz33Xf1A
Message-ID: <CANiq72nfB1w57Vctzj1RyXaoBbWQAjgHot7GGJyg5cxBAEJexg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:52=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.com=
> wrote:
>
> While re-writing my changes I found out that while packages rustc,
> rustdoc and
> rustfmt of version 1.80 in 22.04 and 24.04 at least create symbolic
> links to
> their tools in /usr/bin/, rust-1.80-clippy does not do it. So the
> clippy-driver
> is only accessible by its full path /usr/lib/rust-1.80/bin/clippy-driver.
> I'm sure this quick-start.rst should be updated, because from my
> experience I know that it is painful for newcomer to configure Rust for
> kernel properly in Ubuntu 22.04/24.04. And to be honest, I see
> `PATH=3D/usr/lib/rust-1.80/bin:$PATH` the easiest solution. Rust packages
> in 22.04/24.04 are screwed. I checked 24.10/25.04 and these versions do
> not have such problems at all, it's just enough to use `apt rustc
> rustdoc rustfmt bindgen rust-clippy` to install rust 1.84 and bindgen
> 0.71 and set `RUST_LIB_SRC` variable.

Yeah, it is a mess. I think `rustfmt` doesn't create it either in
24.04 at least -- at least I have that one as an absolute path when I
test it.

There are also other issues even with 24.10's packages, e.g. the main
`bindgen` package did not get backports for bugs -- see the bug
reports listed in:

    https://github.com/Rust-for-Linux/linux/issues/1127

I also mentioned to the maintainers a couple other bits, e.g. the
order of installation also matters:

    https://bugs.launchpad.net/ubuntu/+source/rustc-1.80/+bug/2090791/comme=
nts/3

I am happy to link more bug reports there and/or open new ones.

The whole situation is not great, and other distributions work just
fine, so I am tempted to add a paragraph at the top recommending to
use alternative ways of installing the toolchain for Ubuntu...

Cheers,
Miguel
