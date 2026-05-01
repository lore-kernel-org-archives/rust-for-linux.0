Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761943CF678
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649504; cv=pass; b=uTSFpzOlJHz34d9F5wPthlyj+JUYfxJ+Z4aqdMT1Po+PpUqVqu4LaqHWf0GwjNz8AD/dtr4HnK5FUNnNeGDc1keD/MZa1SuwrR+OIO4DMR0L5Q1B+jbojMBoW2ctLmLGBfwChVxjUtdjm9un7KgRug8NUEo7SAVdZoiUxNYhQ0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649504; c=relaxed/simple;
	bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu08IrM527gsgKeE78m+3AspTbnLqd7POC/7ySV3zX7hti0pejRqbWBAbSooNkp8UBeHhQWE09mpiBB/BiPmNYA+KGBue4If3SpFLYJqqnAGIdd+7I9sxYHuKUywrKy8Pp8rrcEfYF1U4sY73Ep2JcZvwP9o0Ld8NeQs35GAzxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stKeNSxY; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stKeNSxY"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ef397ad64dso23323eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 08:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777649503; cv=none;
        d=google.com; s=arc-20240605;
        b=UX5LBPlL+fieoyOcaLEkhn/UtTiIaLcrf8CwpQ6U1C/jVkt4ztgBws4wRtUQFkexZ4
         cHMNQ+oIPfqAJi1V0I9hteqJiR0cAfiPiUqNmXqg76viMJDTFtsBs0oU8UK47PzJadtU
         g9BPAA59VbpatnPGKAR0o2/jXL6svIt6gHP/kzwi3WNbAOpar3mWbIOpCI156klAgU1/
         ck0IAatrQVJ2EHD9GgBeWVidwMvmXRLKJu1pxLNaznyG8zX3laLjh136te0IARLwVu+6
         lcY0R4wOJC1xQ83F1jdSiOFd2Mc8raY4QFIMl2angfa7V5GtSNimr9F48YiF6n1FV7wE
         J/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        fh=qfbxMW97pxUo+SQ19xjBAlX6VR6Ial50Xj0i19bGrck=;
        b=BCJi2wlpOAvxh44bSRQlN9MCXnHfC3A0q9VGi2Pbl1vEe16K/Z75c/HkJv0IVDlyzj
         enc06xRy0E/J1kLJ/mf9Z7mQ0tGxwigYYFeKQiS/eg1Jat8hw7RyYQKCH2H34+gLSfNX
         rehF6yBp7zhYvk6sx/wKvAGY7/lNNjX/vgdX9T27Zd557QqaCLaqhdnIW2OjVQkmcLzU
         xwjQJj0i/JMp38c/FilJZJiNKJWj7Zsw4IjAwHOT3cQOW3MUpNDjEH1xJaji8bxN0rUo
         tbi+viYOzHa5Yk3JnYy2Qjt4/qcFRuhqfm70+DWWtnhpK6jo75O/l9iA5rvSr2QPzdAn
         xX4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649503; x=1778254303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=stKeNSxYCBOGjcBcEzN2Bqa40l2FTFHB+8U1np6POVtUUYiiZ1YZvYfYY6V5R9NEB7
         /G0z24ahPq4XwqpkRCn1JCJN71GaPrcTLgBwNJ8XW+gnyMuSZH/Yw/o7pl0cO8EARarf
         kXgmcXVMDU0k0eCRj7q+Gbhj5be815ji6gpXYba6C6Nw4GvQdrgBfDJkMFxfEizfWooj
         MFMd+udaH5fPR5e81ZmkeItnq97/EwcPyn2d/hyFiLYrzKq63BiZViaKOjw0QwBXSeN+
         7ThOWqasftZhb9SZPvYB2TUeKAxCh8yWuDri381RlU4sm2ZaXX9vCHxhXWry3Qfj9hPA
         wisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649503; x=1778254303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=iXSBniiz2g7Hp7Yuv01vmTfE+pJZBObOBqBO6PhsubPVSw0kEDimYL7jxEeWE2TfHa
         YVITqBjrx0NHMj33lGS9lswM1KE6vvcc7f2E6eMiHi10jbhehlhqRHD5RarEt6Z9wSyq
         YjKINuUrtLOAQhm4FrSwhBAr382ZJ5Fc5NLeNTmqHz5+W95OjzuZhmtcdzG/H7czbXiF
         8+sa1Y+fFLHYmHbsa0TRJrvpYVqU9tqGpblqVrIozFBpbYp+RQXJn2Sn6I3aHHwDQzeL
         nIaMVtDudIYYR6m2Ax+b9oPoTGhHHmlylhn4crhmNnDAhso1xR9XhXynFjLXDU+YU5HZ
         3kBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sh9Yepd/xDo+mpUfyhnzaN2AsCGbHlBVGVSASHOJDrqioo03ty56Lgy+7CHTBCVFc0K2BCUjB8iFWy3Asuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwT/J4cjPGbTKGpWL+0EQ7f9ADxuR3QKB9gQIZ15c3sywmfVV+
	kGXDUgl+QiJmJT5y++7IJ+Mw/b36BDaLiDz6nlM3e1ts8EWu3/YF3hdQS5x9hTYI7GXDM2e7egQ
	1Ts07T6ga37+D2J1yeWAc97PU1u9jAIg=
X-Gm-Gg: AeBDievT3+Ayjooo30jRG/8TR4o5CUqmBDRwc6NfcgOKsfgHNdUHE1rrgYUEXK2jTtR
	YfmTqhKmLn6p3jiYXnLmt4lBm3Z7IZTvNWmFDqIceFqd4OBle8c0UEUyaEbjMZPYio3iJ2+N1d5
	5E2JsQGEFJuz0Ows5jQdClf8zh1P+WjiPdQ1VGCwIgx6UoC8Ra/NqIdpPFUPaNd6kEE/Y5T7Jiw
	/BD1gadPM0taWK/es6MX7x6m36dbnzYTv3pO0TyA1ApxhMHhi5hHgZAWubJASqjVPY/r2SW8Bl/
	Zgu2P5fSQea56v9TmsqKFYKMBTLGvrRh57JiN/ec9gnhdlQsok36vniKLPy/EZ4+YbRSsiNpQmo
	Iuz+wggq/oTAl7t62rBDNVP7+NaTHmi2pbQ==
X-Received: by 2002:a05:7301:4190:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2ed3ea69fb9mr1648901eec.5.1777649502468; Fri, 01 May 2026
 08:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com> <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
In-Reply-To: <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 17:31:29 +0200
X-Gm-Features: AVHnY4KtSS48VYj6LcLMSfxEHj79WIZaC9QZG7nspbiebeuoKBEVWk4DqsY8Ue8
Message-ID: <CANiq72ncENCdGCjiC04Yup4i4jbY7S=k62fiT1RtQAYT=5wfzQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The only case that I've been hit with very long symbol names so far is do=
c tests.

Yeah, nowadays where I have seen them are doctests too, in particular
for UML debug builds.

Cheers,
Miguel
