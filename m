Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431E37BE79
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048075; cv=pass; b=qHBG2YbVh86jjHUh6/qQi0xhXgU+oYxwf3infw9+yNWUqRZn8IpS+psh4PXk3jngi3utbyebBzPe3tGffiTRPXv5Sk8dTLKo6eAMo5DtemJQG09VqUZPNltG07GVfOMw2OLdXH7omHPTWu2sf0Q76aEDdTOJKBh8dGCdJY0yDJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048075; c=relaxed/simple;
	bh=0BtDeyyl/iEgg9hwcpMaGrHfwUoMjGiFjJ7w+1aGu2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwT47lQndBJ1NhhVAYwRuEHzt3Aphu1VwDKKHJb5EYPvzElMIUnby7CddxVF8JwtJKPxXLTCTsjORZ3KrSQy0oOs5WzbgDUB6EzQvvG8qzxa7c+sXPekqRDVztO8O8w9T4AUkJZmRlmQQA6g7Kuoy/CQQcaQCsTwqf3ndsvdQ8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuzNLQb1; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuzNLQb1"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6a868ad45so345071eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 08:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770048073; cv=none;
        d=google.com; s=arc-20240605;
        b=jGFAhvQeNXsx5AGJxzmKb1/WeurbbuTR1qD+CUsy5rJNuV5ONkDdI1MyvV70JByMBQ
         pEIVDAKboiyCW+h4hEcxWNvRm+53m6XSrjX+r32nj+ND0furVPGm1bnAw+g2nFRuqC8y
         klxVtMHDnOp51o6PHlZmEHzk6g9BiDHRBKDjopbIo2gxlZDJK//jk7ymZqeYxp4/ZPhx
         uMwPxbhjY/5LLNZZTa6HN3gLjCCMRCq5dsn0DkHRk0LuCCW0vgWrQZiPdljyopC2d/7h
         CIy/4lsXSQ6uhl0SxuzS0Q3tsltVgscJ7X36UrSl9QynDaTcBanLgZZ8kBzHSLXztoQz
         PoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        fh=9W211zPoTl0P542ayDMh+82PTURAOsKtGNrKBjaRqvk=;
        b=VCk6DTGu4T9dgUeJOkpTeX8fDFlicHOC3mcOeX2MTAdr3szWh8Gk2/Vw0CWcqDjyP3
         WVwl5h597dqiIwO9T0ENVaKeCXOk2DbiX6+ebXV3/8cDt7y2fxiD2EHYIS5B4wKoCRtG
         6Ug3Is1AOQFt1AKQOied51lw/V2Vq+iz4GF+HWorMCeFjWghtxf1IOln3cZ2NkcBQ8pI
         qrBorWDWKBRbgK1D3LIfh1JF+vJLE44xwSgLq9Z2OvKtMV6IUtMmiAFxpPghWtoA2HnU
         fXNv9OvgUlcT3WrD8ECI/fq/u86p77H55zcp1qyrl9rnWAwxw4put1iUcMcgKRvLqxOr
         CjAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770048073; x=1770652873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        b=TuzNLQb1/hfkk0AkVG78Xv/3KYfntdFrEHqIG8T1rUR/9Xax9ZEpl+kAdkbOesT1Ex
         BKgoDwTSylll8f0Zi+pOXXztQwDt5a6TrJqkusgmVVGlf52MN4fcFTUmcLLelWB14W69
         VzR5OZVk+q0YAu1nAuhFcDqhFoSPHVZJykl4gbf3fOj+y19H19FUgVqv4l0MWNlFcLLo
         JlLE1gD1XttjHF0MXWynnlOiw+mj4txbhK8kVFFauNiQh3aHlwpwqydxu1ZXv0uwrbM1
         JmnKkEsbO8CiHLOAAQ3K5r/uXf2GVyyCDCsnmolaIwOgMadChn0b076GAGXF1OfylysB
         BQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770048073; x=1770652873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2yFLlLhyvsK2yEKQP/gByFr2oK4zM6au86EX7CUR3k=;
        b=J+pRcznIRWqqPhV0BNci8wG74IJvInziJSsw75jABQTGjojjac4ihggFQMNSNQ08xu
         brmgc3Emv6jn5ZtKBuRgfzfjrUlp9gyQrinW1LJlf+XE1CIZ/7QBqW3ds4ihP/XnJP5D
         VwfrJ95I1naXnrbBENuhjyIF+itXgBWyJs2yepvygxwZCHaHOWiyWmo+BScWk/NQ+KA9
         nQ83Zr9t+x/6jXUciPoIYKD1Gvd2Ad/gfGD+KXaTUVHZLM3SQV4kTjo3zX1og966sF88
         Lf7SQ7XksgjLLOBNrQ6ySwZccbK2QkrGy0Kp7M3IUTITcO7v2LHvjjVvTUfhix2NbE4r
         6o2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkCmQQCJq4ehJdLs6jKdpEhiGIW0hmMf81/dBZUdC/cZ9YxU1lUUJjzySisdMr9B/uMGzQB2NrxJ2CW4qrIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzX5WqNAPDLUxIEggH7uSN4/4NxF/BMPZWJ1TrxIJItDxdO9O+
	L727fHbwmGnj0k7ssYanwElteQWVul1Tdt457VefK92Cudq1gtRIYEObW4+d6p59hssVHsZSjB6
	/BRbZ5IE5+KblfbuIXWBevVpGVknA558=
X-Gm-Gg: AZuq6aJ9pxK79jOtjPCx4L2Ozu72ebqluNJPzioHwFA2B2IeBpmp7YvCacszuquBJX1
	5rKjuAk0MJsaGmeivfQo856GA0kpc8Kr9MpaFGLYMf+CvLMizAB9LtJn5Ecgj1tClNzFmdne+8g
	MtYsGPsosMlHUgXXNvusWpBH+FycOx9aX17HpfhsuZrpdGhfuduQNES9x8jgFfOAGeNY1v1xBkp
	lPJhPSnT9HR213h00UZwAwX9IlUIX7OMmwqtMeMTdGbFQ/HgQR8M/KPeTWJL0dQo8qusohQiohB
	eCkMSKiyYvN9bVM8XXN0jPqu68tdgmR4InV5thRZCG3WqpVr0UdjXNwaR1lWacuX/CTZ24MIs+T
	DiOdxAN/msWVD
X-Received: by 2002:a05:693c:2287:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7c86dba33mr2866701eec.4.1770048071379; Mon, 02 Feb 2026
 08:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202222144.2689495-1-mlksvender@gmail.com> <20260203002116.2703251-1-mlksvender@gmail.com>
In-Reply-To: <20260203002116.2703251-1-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 17:00:59 +0100
X-Gm-Features: AZwV_QhlLkKU5asgPXcnSf5m_gL2EtKJ7XV2olDXWzfVVBZdXU40rEAYbiSjYi8
Message-ID: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected versions
To: HeeSu Kim <mlksvender@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: ojeda@kernel.org, gary@garyguo.net, charmitro@posteo.net, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@google.com, dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 4:21=E2=80=AFPM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
> This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict

Normally these references should be full links (i.e. a tag), since we
do not have "autolinking" like GitHub e.g.

  Link: https://........ [1]

Then you can use [1] above instead of the parenthesis.

> are affected by the bug, avoiding unnecessary flags on newer compiler

To clarify a bit: avoiding the flags is good, but I think avoiding the
skipping of the checks that the flag does is what is more important
(i.e. if it were just the former advantage, I would say it is not
worth the complexity of the added tests).

> Suggested-by: Gary Guo <gary@garyguo.net>

This is very minor and it is fine without a change, but for
completeness: for Suggested-by we generally add a Link: after that
tag, i.e. to lore.kernel.org to the message where Gary suggested it in
this case.

> Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")

I think this is not really a fix anymore, i.e. nothing is broken, and
instead it is more of a feature, as far as I understand: avoiding to
skip the silencing of the checks.

If you added the tag to suggest that the patch should be backported to
stable kernels, then in these cases an explicit Cc: stable@ may be
added, mentioning the versions where this should go, e.g. in this
case:

  Cc: stable@vger.kernel.org # Useful in 6.18.y and later.

(I used "Useful" instead of my usual "Needed" since it is not critical
to backport -- but please correct me if I am wrong).

By the way, I wonder if we would want at least a `rustc-max-version`
function or instead a range-based one for this sort of test. It is not
a blocker for this patch, but we may want to limit other workarounds
too (e.g. the one below this one).

Cc'ing Kbuild since I don't recall we have that for C compilers, so
there may be a reason for that.

Thanks for the patch!

Cheers,
Miguel
