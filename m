Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1D383C8C
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210838; cv=pass; b=AN4an6q4FFmZ/vyPQIZKPsLRGDaU18MlTpGUMzUWUgTe3JJ0gJ6XqWGg37vEDWQrnODDFHIMZzEyGXAf45WnTbDZIretUmkjOtCRBu4I+HQSbcJmuUk8vR20w/EIsgDHY6s6pS/rsDx/mK8+KtXe8pc4vVFzhMzvvUYjDlPFZDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210838; c=relaxed/simple;
	bh=l6iFZzW+AWF3/QEU6LglpEwpw23G8B8xolbXTX0zh2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMkRMYRwqVC9gJVxZolhb0A1txv7HrfD0OuR6X3JUt6OJz/LgMKM9i1p0FRHgxZj4siucs2FRwQ81X6FO1jDqHcK3Nxp5KF5KbJRVyei1fJ/ExCQnN2k18GtTaE6tESQylJyYg0U1msLcbR/9MZu5qUgypYy5ROqGSEdzCTyUuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djt6QZTR; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djt6QZTR"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38cd60ad1d2so1888951fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210832; cv=none;
        d=google.com; s=arc-20240605;
        b=XoI1xyuX5jyayCFWeY1R13A66P5GI8UeKaj6ZBrWohTOi/jog8YYHm+jMRNWlu+wiH
         5pMuvh22UI+HIZF/oTJdaiCVch8lpntWTsAFlxhohki17q/fGHWEp9omjhYLH+YaOSGb
         KDICbbuEgwpH3Xe5VgVpJWggkJwxgBBz0lIm21rElqi8QhTOAKRhcNF5wR02l0Xq8CKp
         3TxWlfE9AodBKyXWKI0cyL1TcvOOy9NKvJpM/7zzMEpgWKgMV3sb3HLmAZ5T5AErOBMM
         T+XjQeQGtNxYxt+mFoQX2zJvBnUcCV6Qpz+DWSTb524aOx+YZD5LIV6ymOAWw+dDSXHN
         dDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        fh=4ERvMLjY0V/M5RWfpB45ME/dU2x9vlLdUZhS9DsowmI=;
        b=Pe4FiS7+YUx5mZ/el5DhtQx5H1QBzuFgFNjgkhXvEd0nlMEF25d2faSyrmagCH9gER
         BOn0dKnhzg+Sd8Md+tuG6HSFe4g3wS4kZ/fmvHRtMZrVmzj7QRJMZHu1mLAXY4OdQ8Xr
         mdSc4Cn76YIb+WyHs9hAvLjFSKZKz0vwCWwDnrNaJB5h3rCLq3ddoSbsD59ixoiTULuV
         VUklpYbAfK7VpDzKgDrRjMeDw3iMqGNmTMrh7Hpog7LazugLXvGQ2O6UP1ITf3UaWNgs
         wWybJTo6AD6AFP3XtTU+6Ri+8umL1xqSwqg4Nohzfb0eXalQsaQJHNEztbQdrwZoudV+
         Q1Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210832; x=1775815632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        b=djt6QZTRfT+XcEa1NxzzaJE1gUQlCKaKO6cK/w6rS80EpPop3wYhW02DcP4gx/OMZ6
         yMOvMJMI6seSsYr53wjzyZ5u3r4cd4EXtwf9wRNLRUpgxbDLwI8BNEH0tJG4zkPyX2am
         5khpWbmWgBOe0AfPhHD1CirtkaPoet0ny8l9uSKSrHxiS+DHLiBZmVa41briIfrMxbP5
         gRePp3b4PvkWE4FhUxRkDjnABs/c2zamHosaduIZbyFCb6sXEd5bNVeArrt8kIbLjSu9
         1KazumvICrWNBZWF0T9eFIkwJTD4Bz3CP+qSwmJx2PRff/bUHuHf3QDKBc/iYdidY1il
         UDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210832; x=1775815632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        b=k8/EbfREi48YfyBC9LX8n86yg5C5Y0gjRLD4E+jsAZj6aP+4sDeaMGtmPo4YhXStx8
         K5ynrGUUCu9sbK907D6YTZ34lMwtI+Ibl4BVxdpQ+r91JEXmLQzcYpQWZAxiFmbiCOGr
         qI0LNf4i1wXwbSOuTi+eBAlwS4TJLIE7IusqYKxYsHzLRCGgb85vFPJbtT53MYNuF6hL
         DqXZPu43tp/OZNRiqHsyiBbny5zhg1fpb9AkvB080yEJJOv6d3Ucrdn5wymsR7L2r1PG
         9d4ZdPM8UeOe21rZx+F1nwQiMHQ9mYU2HGF+0VSXqg08aqB2grfHo4EqpGTOG6cOoUKy
         3hsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBB3fzHeJ1fccpxQ6FUu6YqycBWRu9xeGTYDTpyji9fvpusjhZhOD4Sijy3o1Qd4sM1MtuIzSrob5FerU3tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2hru/WFR1zKqmLYLcafr2AkDc1o5m7Og3Ql5C4nZ8oNkw8al
	WCVtyUXL9WOkNL8PjUHMNycveA8s6lFn0/7GznZG0vx7acrfKbn3iREVV3odHEve2wuoKXqTB1F
	IxjMvQ5bHpvQmwBwwnNKGQUNkBRgnU0A=
X-Gm-Gg: AeBDieuofnTj0m9NOkN+jZTdIoWsWvnQ72OZqPNGP+vwgXvsNH7a/AcXH924AzS5dmx
	5UfD8FFY7Qf06rhnd8jjrnP64S7L8hz18nlr6u8JGLWgW08gXtDs1Hg6HDb/8gg9pGO0U+zvfK7
	qeXAN4jEKrLSfVFefalzkNIybxq1PyMbqdLzuojD7vbz6x3CMPy/wWnFPIm5bmNRGf8mQ+a9WDE
	fi74iAkho2Y0vrsT1CkBR4Y7pUtWXtDFlg5WnV8QKb48VCEwvRK+L/ckPY88eSqUbq1u/EoaV0E
	TRoSq7C2qQ8rVJy5C+PICFwC75sv8z9eHMIkirqfaPlVnxcn0UJM063bIqbnBSxSt3yELj0DSFr
	gOl6lCmqqhkDWktNBL0weq5A=
X-Received: by 2002:a05:6512:31d6:b0:5a1:4712:376a with SMTP id
 2adb3069b0e04-5a33759184amr467862e87.8.1775210832087; Fri, 03 Apr 2026
 03:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:06:56 +0200
X-Gm-Features: AQROBzBBW7rQ85ZJif0nroczUc04Z6h0dVRy0ZiPuatyp9TJcZiZGUSTP9K1ZwE
Message-ID: <CANiq72=-vxjqPPiAPrN8Oxcs8ExhHY2qvhN_Qd5JnxGGKEOOcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy in Rust 1.88.0 (only) reports [1]:
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:198:14
>         |
>     198 |         t =3D> panic!("Unsupported parameter type {}", t),
>         |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     198 -         t =3D> panic!("Unsupported parameter type {}", t),
>     198 +         t =3D> panic!("Unsupported parameter type {t}"),
>         |
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In the first case, the suggestion is fair and a pure simplification, thus
> we will clean it up separately.
>
> To keep the behavior the same across all versions, and since the lint
> does not work for all macros (e.g. custom ones like `pr_info!`), disable
> it globally.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-next` -- thanks everyone!

(If wanted by modules, I can drop the top commit.)

Cheers,
Miguel
