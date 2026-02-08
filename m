Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D52EAD10
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770549198; cv=pass; b=kHSDoIkZI/fe5kzZc+JgHEYPx1ksOFfsOigTCDI9SNssjvt45f4Zp1VIGQp8pXMRO4HTXlOgRv1qaxLAbtUgBYaodLRZyW4gI28RS4n804/sWKjIfqdRbFSnUxSl9kAz7nzswRGYQrmB4Q46WBI5/9D/TjfToSPrpMlVhcVfUM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770549198; c=relaxed/simple;
	bh=C9SBYY850XHrUUtc1B5YS3Igfe60vCJ1wBm7vYcA2pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDBZHU7/7hlltkD7+FZ6I6J8xI3AUYvGWeV77a0jvAyVStZFp/6INvlry+wDST6WCDlNu0vFpXPI5ag/8owt8eteu0haA2Nk+CtCLn3zR23KFNak4ByBQRDfMuUTEFO33dKW/lVOepdqFABIvnoFUhW4cl+eujbQePQ2b3cA7Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aey0x/Sg; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aey0x/Sg"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b836208f23so107061eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Feb 2026 03:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770549197; cv=none;
        d=google.com; s=arc-20240605;
        b=VfC2M7ftyJRZaYMeApiqZ+BFhqEfZb2TfcEs0Zk8KWMmmRuH/UUhgrLiiLy7tGRtRC
         EZJySerNpbfys/INnXOJf/8z3myjIgQkUeZ4ygMW68OIC61n+Y3+YYUUYV1dKVdQjMSO
         hZ4i7AryBy2f9wyqgjCiStxJhJK9PpHNgUvZAvw3Q0UsAEXBJaDVwdt0Xoimst7VWEWE
         vHnJw6Q1bWL8SBWIiBufCIeq6sioQ7rVpOD8mLWrtUTVUJ6L4H9eTqezMCyAVksEzeGU
         kh0oiWw8X9RrD8l9Q62ZLQQANJvTpeQpCm7X57eOmV2a/rqvA9Mc40aE8PwgPw9taSR1
         kRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        fh=hSVjjd7jCkOnDv5mgxXRQ1R4Gdw/x2ayX8WpNRVGMnk=;
        b=J3PcchlhUC6/ATc87wnBbiRaZbG8E8ZE5bUfcdkXzDcP6rzoXmQ9qdbtN2+6I4r9Io
         8/a14vKvUb7OS3ge8eOJgphiPUEK5xAts8Q+hgpKmchI5SgG5T5Fj5eFUcsTnixckb4l
         Fk5pGIe+hlvfvv5VufkmiDju7gJ4lE3EU1YYaGnkJv9liMT/4ZTfFQmBWTPwPHiHLRfE
         3AjSG6A3Fu6lZSg2Y8SyYzzsKOmhN/UhZEP+6EQxw6/A/HyubTPG2zjCVjYWkR69DjGY
         VnbLieVo7v2bMQ91LSAg5bOa8rCj2Lj7uPInhJwvhmjkY/17Zn8r9OvLwpKX6lfHyiQq
         QTyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770549197; x=1771153997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        b=aey0x/SgJCt0DyYTwn3/wQepj7a/Va1yuH6fwVsOekLrw1KvBjaD4fdmo9UAeEQJJ8
         EFFY9ZBLklkHhGHH5q02KVlO/wFUVk/TF1l2k3esTiN7mscXxF+kHFZMoJyOmFyIRkRR
         e+0osuO2ALnZX7HFuIfL0iEAmnAE4779jIw+CezesuNYfnS3GSguYyvWyVmPFDzH5iBg
         jZBq8FHemd+pgwwiK3y7RqkPKr/nj+lZ2KlFab5C6KmA1i1AE21sssfRr/JiNW/OJk2F
         zMPv+rADkutTZ+InHp6PlWUU0yChNxhcxV+KKV1lSXJmiAE5SJdCD/YfBZEbHyj9oQhs
         qHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770549197; x=1771153997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        b=iipULjGA5oB+wkV/61U9dB9mi6ggYSbFZm16AhGyXuQMaXzAeHy/m30215bAH/m2Qy
         09m0xEWNC7ngB8gMPExNMBsHe4nlG+fFIrg9y5FEvIvadj9LGyCMU8X86SaFjapkQk+Q
         qYrxVm6jZqZaVBqWlzNA5v7bYKIkksrbrIFF6Ap8JOf5xnnU20zcDS9sYbxG5Q+lcUA4
         nH+3DisGy9D1OfD9xihrBoYP3ohsjFblkon063i3pdOHoFXx/DWImEgCcJMhdu855v6S
         2SSeBUANvaxg1jb+mPizN1A8S5iJ/AO0KBVmiUPD6rSa9ZlhgO+87Bi8t1A4+8qRY1mu
         qwOg==
X-Forwarded-Encrypted: i=1; AJvYcCWWf7Sr21ucYk7E5apP3Jj0OC4+o2qB2vjoCceDbJhMunPT4BQ15BTmwlVREL6PO/V3TTBfHVkUFip/NeKnMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWvjB+DKsZReQ5sDM09W6A7D6JVGwd6qRfokqJKDQr3YWiPymp
	XbZbhPfwmKQC2WGXHwv2VVUEOxlOyeyofckLp2HJ7vAecMTwIwk0vYpHJYSv8kKo3G+35ia1wfP
	zQCXmTf4WCBxwBmZyUm3KqiNZhdmxa6E=
X-Gm-Gg: AZuq6aLtfkQs7iEt4hXUtgD9sJW4v6UsPDJ54gTixTxYTiJYtG5TESAlVdOXNhC+vh1
	GBu9Phi+mFa30DXy3Nx5tDe/d76fDbvuXIBPQCi20uQTiiUrsqKWc/krGmmYtXMKwIwG91Stb1b
	R9CFH98AsrM3dCLniiQWQE7iAf4Kau5Lu2uPnohVeFY9tEkMBek7klXteGgAUzfwkj3hN0fX5VO
	aIHEzTDqNEH8L1NDrRqiGuHC5eBzphukJgT0ETnfyceK9n+cFu8I+BmnGHzTgTfzmDfeZ9g3hbU
	E9aLglJwcR7HTvc5RaGStEf24HOneTMOKsWFab4rY+Qwxg3ntrxoIT+rvgfD7/Fg5lndGlAtoxM
	B9Dg2wzNSjk4H
X-Received: by 2002:a05:693c:3117:b0:2b7:2f29:64a7 with SMTP id
 5a478bee46e88-2b856400b99mr1820149eec.2.1770549196977; Sun, 08 Feb 2026
 03:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org>
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 12:13:03 +0100
X-Gm-Features: AZwV_Qhuy65TaUeSv9KkNVGrPf0KNHqDONqd5x0zvd51P_7nd1tMK7wVtHr8VgU
Message-ID: <CANiq72=Nd7S2HXOpUeW+EyY4G1E-1a5-bAuD6TYa_6fONt6F+Q@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The Rust kernel code should be kept `CLIPPY=3D1`-clean [1].
>
> Clippy reports:
>
>     error: this pattern reimplements `Option::unwrap_or`
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 | /     (match ns.checked_mul(rate_hz) {
>     65 | |         Some(product) =3D> product,
>     66 | |         None =3D> u64::MAX,
>     67 | |     }) / NSEC_PER_SEC_U64
>        | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(=
u64::MAX)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
>        =3D note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_un=
wrap_or)]`
>
> Applying the suggestion then triggers:
>
>     error: manual saturating arithmetic
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U=
64
>        |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider u=
sing `saturating_mul`: `ns.saturating_mul(rate_hz)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
>        =3D note: `-D clippy::manual-saturating-arithmetic` implied by `-D=
 warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_sa=
turating_arithmetic)]`
>
> Thus fix it by using saturating arithmatic, which simplifies the code
> as well.
>
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [=
1]
> Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Pinging about this...

Adding Michal and Uwe to Cc in case it helps (the driver is under
"RISC-V THEAD SoC SUPPORT" so they don't get paged).

Thanks!

Cheers,
Miguel
