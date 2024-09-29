Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D416DEAC
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727653450; cv=none; b=QzYdJRH8g2KPsdfiaIp/MTe1B0q89Jzzc+gRaL3NZ3fspzKLpoO25Dp9bH9ytixGaOMChU2CrGoTyrgW97dHOiGe75Rs6zbDByP7oazQbIQFxWitzAlQ0GSX54cgiK/MDo+eiJP5mtu+VMnmpIoDqUu5ziygcCqMDPtwqpbvMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727653450; c=relaxed/simple;
	bh=FVrhM8NHC5GS5UTOWegUXKC6RupKovE6Otom9uQ+Jjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve/KIVFJMocWKjZ0CdsIDTVFZd9/1PQdZ9MkoHI/2uTpnzLwP+LrwXE7liH2lo8ZmA80vzN8cbGuxKi+R9uQC0O1gQ0lmTITByDWbOgE9jx7sjfKmNUThoU1C6W+ENJCu6qqTBcubZzmOqOQxzcBXAgUJBTymNRts1rpubbJS2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=LY21K3/5; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="LY21K3/5"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e214c3d045so29414537b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 16:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727653447; x=1728258247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNjCSozQpyjhKHt8noJZBVS5dOtxOJ5KLOb5B891m4w=;
        b=LY21K3/5bNgQ3C1KTJUwoHrHXbpyH3SSygBsmUIUyXTIlUmBYnmD72GeJ8SGReSN+5
         SfU/zJyuk1Bi3tErd6HYbURJv26LiECiKBj7eWFV9/PWcPElks4nFrq5MtH/oxAVVTBF
         vhSP6slnzt9NLvLZH3tlR1Fr63KVuzBBe8JZRFwaR3G6oEvrcpTjN7G9LGsFJ+RhpCd7
         m6ox//VzCLybTWVSN/dgoNdI/pLm0CgQEhtJspO773pAQxQ+H08eu+wZUfenVDTiVGbd
         NpyGKuYyOAOfwryB+/2JmKp+6DwNOX7XaLUeEh4ZP4Gr7XX1cDwBH0OgmOLvtWZGRtu4
         FZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727653447; x=1728258247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNjCSozQpyjhKHt8noJZBVS5dOtxOJ5KLOb5B891m4w=;
        b=XuVwCP6MqQYqwizgZv2Dki3ZjECF3sVHfFMKA2k0dqdQ2X+3HI9ne5cXF3DbS/O/VX
         l49rPE6OA5BR0D35rCO4pvrxTnQjO/JMvZhnETnwu0ooOWOvjO49WkicxcEMnYcqcA+/
         XA6Z3+1vdU3V7IPAnaHzHYXQ4GnYYoVziJbUv5sEixTdrvSyggzlSPTrfbJvN8KlvP3r
         A6nkSG4HzaB+NqVKUFx2OWwZEGhTkJkg9UCaR9snwoGxc18qSw9Zdko0pyzOeeO5cFR2
         gYSAcCd7c8Ai32aePIOxF7oBAQmzq98ABRcoOtzjXm2pPhD3UAEiS7bhuH/3cQxnJHuN
         mKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoruu3fhWbgad3jeP2zRR+QJ/E3WE2U0DP/ZZK2i7C59gDPGaUZfqb1rylFH1z+dxATrh/IedWyFoGQvxe4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFFyz/gBOWwCds3wTBtZBfLmrrEK2WKqpAu8BkD6z1CABXFKkN
	bUVzYZy97EdYz4BOxSqu1FnetNifEbWiC0BR3m3c4Xfii7TX5DFsFBAkXTHeQfs9S3hv3D2U8XA
	93ivReNx5wX4rpGKaHq01QpUiAU2q9F5t1UBkAQ==
X-Google-Smtp-Source: AGHT+IHVbKuHDSIp8LlUP5X8+oAC4L1kn9ulGZiSovJ1012be+27o8GOlOPN94mq1QBLToyjhF5KtnAbvafSANnc8Cs=
X-Received: by 2002:a05:690c:340a:b0:6d3:be51:6d03 with SMTP id
 00721157ae682-6e24757225cmr53231907b3.23.1727653447032; Sun, 29 Sep 2024
 16:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927164414.560906-1-ojeda@kernel.org>
In-Reply-To: <20240927164414.560906-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 19:43:56 -0400
Message-ID: <CALNs47syDKaJcAZ=PF6vWHgSEg-f3m5Tmm_H2C40TfoAtVPezQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kunit: use C-string literals to clean warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with upstream Rust commit a5e3a3f9b6bd ("move
> `manual_c_str_literals` to complexity"), to be released in Rust 1.83.0
> [1], Clippy now warns on `manual_c_str_literals` by default, e.g.:
>
>     error: manually constructing a nul-terminated string
>       --> rust/kernel/kunit.rs:21:13
>        |
>     21 |             b"\x013%pA\0".as_ptr() as _,
>        |             ^^^^^^^^^^^^^ help: use a `c""` literal: `c"\x013%pA=
"`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#manual_c_str_literals
>        =3D note: `-D clippy::manual-c-str-literals` implied by `-D warnin=
gs`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_c_=
str_literals)]`
>
> Apply the suggestion to clean up the warnings.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/13263 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
