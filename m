Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7A31CA56
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438193; cv=none; b=mpzozaPeZJ7UPFndUcOo4QOUg4J5vvnGKG6Qy9eZ54Rep/BB/U7cQwRWjZvSDFoB2DF36X3mC1hcMoxeZUtaPdT2M9KXKeRdYbB+vWarq5790BXyt9EajqRfKJmKkc98kCWB0E++qZKxSAnoGCmdFoQMay0AT0ffegqs1pNPwrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438193; c=relaxed/simple;
	bh=R1Ch3C0oxQlRO22Xw5yMNpS2T6gGdLKY4TKwxEE6ycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtUyObAaJ0B23GH5cgYSLi9A8zbSlBFcJ2LXqnaFXBfx4fmfBBItdWoJnh6tuIuecYGpNZT4gdqeloxNe4rXTun6pxJ8XnvrBHHVvHUYvBLxZr2ZMmQ6anvIxCjQ9e2WhiRbLi3gTHS1AqJzgEEqr57vZDL9yklhGSIH+L98rMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ98/15n; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ98/15n"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24cda620e37so12219525ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438191; x=1758042991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Ch3C0oxQlRO22Xw5yMNpS2T6gGdLKY4TKwxEE6ycA=;
        b=GJ98/15nDhkNVPjiMm8vuasCIykhfLoG7zTfnm1CCYXYOU12uRi+luM+OsNOCFOd1i
         tylCaXe8MWrGXvTC+Jaqz2PRsv+Dy6eZa+bG5EggqcwyvFBOtzt4RqZoSR7wf53XNyjU
         Q1atvg26i9OySZDiOyUWlL70GMsOTG9DcIO93sXYYqr6tOLCz9zU44L7byqCka7rUW1p
         93euC8OWbTfNojd9wk94xtIMyKaijXl7ds4L098yrOEh1SZEJHWbzrTpmbJ2+aFVpDtX
         Vg5y3Wts3UTwjRqC/iUkedJb8gdrlV8IdspgaXm6njJoxJcQJEVR9+QJ8F4AerB+Dp9p
         oOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438191; x=1758042991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Ch3C0oxQlRO22Xw5yMNpS2T6gGdLKY4TKwxEE6ycA=;
        b=aqcOhX2vBbkCtSybstsXWdx/co/QbPLEZTmwCdukZG5cuMjwyft24ZifbkylVZ73gz
         0NTTaVlwxgq1ZPbx1ru/DHxVQhrPx+IvwQvq1ZNllmRG3LhOoTIQ82Dg1tlcOlZB92gb
         drWGRzsccSJWeTRXKpSzAML5ov2SWlOznmEKlWi7pzlgh37z0JdDBjvVF4OsUgM4wHCA
         VOyJOneyc67ggJOQ7dvxT0bJ5Prmk6wQbfgmQ864OsFGOFXDYMsgfLREfCRAb2MB0S2e
         3blJW4PnXwn0pANWtcAzEwWzhWupO9YzsyyvSqL7IfA8FsaTPXpG/cb4yW0CC6X9zwDX
         RBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgnlN0mSeDywhxWcu/9BuclvKldso2lh0GAyip4p+jJO+ISQfUgS6nXfisTr+YuXZ80E2hojJw1bDo4yeisw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/oageFAhwr8RsiY2ETUKqK3CoVn/B36+nnJVYMhl9c+Kd+NM
	wLKKF0Vci9R1iWhEHL+8XFEnX6FU/08QBsPQeZpJ0wkixoInB3DYzZuf8rX58ZV1FBPwtBJCLNy
	j6z1LXvl9fCKM4M3Fl7odvZoo3U8gJXI=
X-Gm-Gg: ASbGncsuAQf0BXt79hAdMyD3Ikqw+/0AjGQ35TxhH8q5FRAht0SrVf3wNbRhuISx3sX
	wY6fptw3ksmVbycHW4COnxVe7lGeqOUQr61mfutpM1tnlgU5SPxCPN/ME0h8fA7zw+0aGL92aYh
	c7Cdfpv4gDFM0H/FYn0SJq8hn4x/c6Uvsz4bKSYJYBW0YhEb+FkXlLboeLrNggYTaBolzHhocfZ
	zOKx8ZNncoLE40Isps7rUkMUUi8z/61KcL/puKdgR1OZ/bW/AHaJmyxRdQLCToEkpxB6zO77h0C
	FxDqhi/kvijLtjjeBcmCfQMtww==
X-Google-Smtp-Source: AGHT+IGO94y51rM0C0I/EAdShkTaG+X6lgtWd0vdyU2lORl3sjxr1UXkjo9G/VQ5f9+lWmKV9PlSamp5i7EomS2lRWI=
X-Received: by 2002:a17:903:1cc:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-251771d5b61mr95844105ad.11.1757438191527; Tue, 09 Sep 2025
 10:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-regulator-remove-dynamic-v2-0-e575ae2cde6a@collabora.com>
 <20250908-regulator-remove-dynamic-v2-2-e575ae2cde6a@collabora.com>
 <aL_PwXck1HsLp5wH@tardis-2.local> <AA8FC1A7-EE88-44FA-A0A9-A3EA5529B10D@collabora.com>
 <aMBJ805QjQcPdRol@tardis-2.local> <CANiq72m18qUTjqjKKYgPfeEUh=vN+Jzz=ACFDcgA-JDLL_N5SA@mail.gmail.com>
 <aMBVgrVqX2w31GhV@tardis-2.local> <3bed2164-8f68-42ed-9ab9-6fda05687535@sirena.org.uk>
In-Reply-To: <3bed2164-8f68-42ed-9ab9-6fda05687535@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:16:17 +0200
X-Gm-Features: AS18NWC95uheqMj0QgDVvrdAmeJKZFXIKvboMRQH-DI_w3wLatZKkT7OTw0xQ3E
Message-ID: <CANiq72n-_GnPOaU4JD4P-oV3J1MKevPto1FDax-ihLP69g0v4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: regulator: add devm_enable and devm_enable_optional
To: Mark Brown <broonie@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:11=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> The C stubs are all inlined so should have zero impact on the resulting
> binary (as are all equivalent stubs generally).

I think Boqun may be referring to the Rust <-> C step.

Cheers,
Miguel
