Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066372475E2
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944064; cv=none; b=iVgInVeMurDsD0/GjIAwWQTO8nfMo7c+PAWUIyldDBirL3aaEBYTHhCiTNRmlGzm8/Q0XuZiYDAP8Lurx/GbqhTDvM2AeOnQAm2HrcqZIl5qGTSzC3UZNb6gYmbTsodeXZivWfrsKbjlem+wJj3erQ8yNUdN9Me7TASI/hbv5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944064; c=relaxed/simple;
	bh=JMOWQS5ahODHHRusPVBqOw7vqnVFeEkJbaLi3y24msI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7kKfwvaYG5WCUL7f1c6GAKffHkmzgDzk59JL6tYsZJZPEt595oRX7GEZ05F52MxAwri8ZdB2ihwPqD5qfXzt7GVsq2w/enc2GaKwUV67EBqMKF1PMsULYnRGVXxi131MUVM72iqZ5bYrJNNQ5tKjpXp5KGV3GLh3Mycd59213s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyRDoql7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyRDoql7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so1375648a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 04:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736944062; x=1737548862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqDrTqlVumP4p7Z9H6pnpucjz2VtTmyOCwPHxgF6n5o=;
        b=EyRDoql7mB5+9tB3YlWkzd88DzKGVJav6kvnYVS3guumhfNqfJyc1axKMZ+WKtyekB
         thhvTBIPBe4FtaQGfnB5EHlrvz7XkSYx+vAHHepwfAcrnBt/LVUldzrj2gTZes8CjXn2
         70VZWZiGEd5qvY55CJ8fHvgLMIX/aUpIn5mZN/jprrvc06KqpS4P+a7VF/QQhnrFHczi
         YJITdX8+w6hny78y7rKz5CPb1shJDdS8y65fsqkoh3asauQ1o6QRK8GPtxWaJQzeLQcv
         91qUc1tPGw/ofRJ1dwM+djH3TrxvA/MkoC1b5fvwlD9glNGxfMuWlQC/rYFw+2avx5IW
         sUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736944062; x=1737548862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqDrTqlVumP4p7Z9H6pnpucjz2VtTmyOCwPHxgF6n5o=;
        b=rTFXPA5vJhwSJ45pGumtDsK+lehQm3OnS9AGhGLp95D42KkVgVdozcZjYYXLzGQThx
         XMrYNrW8tE/pVEMOoV5T2gDiHtRZHvL13HSpb7t4QWxIvE0j4bkbSxBL1kYpkx1fC/gl
         C8sOIwfYWNLpAHzkLBJWriaUmLihC11zHc3xTV060nHeqCHkC9x1cagj3TP47D6GEDB/
         pZMB2bNVKWRNIY/BFRT2crEqN1tqNLhu72ZqRulwNjlKCeCMQSIKS+6aq56fAqUS884y
         TTT9b9s8ix6lfZqWy5iCjP4PC2Z0fqpeW+Q8x+wvTVZ0uWWy0EaNJjPbxxd1Qk/MaO2H
         ih0Q==
X-Gm-Message-State: AOJu0YxKgaQnQ3y5AUdFmuVWcMc43K9S1E2xBxV2jlkHpVqUFPymJWMy
	Ss1YC8SNAv6ZJmrh3vE2AXP+JqyL2YMMXP4Rd8BPiQ6Qf0t1agW+aCpYHucWmeW/UhBOYky80Qi
	b0sFQ2+jNv/qFD8PAtger5fgjvzvhCtJglVs=
X-Gm-Gg: ASbGncudA50xTzhdJnmYcLVzsuoqdzgkLs+caPuCZGr+hVPSFk1wCsCvE+IuFF5cUol
	Qk/wcdqHqNFlIm+IU3rvx3NLOMJltUrLuIqIMkA==
X-Google-Smtp-Source: AGHT+IHrA8XgmsAiz0tMpxtbwNmjXfcliT0TpyMs/t1dRlTxgdtzal7TwQ5GbmoVe5/zCM2jJXFXoLAOqiYXUFXCweg=
X-Received: by 2002:a17:90b:51c5:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2f548f04dfbmr16321291a91.1.1736944062228; Wed, 15 Jan 2025
 04:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115062626.1971211-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250115062626.1971211-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jan 2025 13:27:30 +0100
X-Gm-Features: AbW1kvY_hbWZFf_XGIuliTvBqEilglTZlON8VAFWiZxOlfLWlluvdmFQPoKJa5g
Message-ID: <CANiq72nLULZYSVyB2sORwOfqj1N_YqrtS00Lcg7uFGmNFy9p6A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev, 
	aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:26=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
>    @Miguel: I'm somehow unclear what you like to have linked with
>
>    "By the way, it may make sense to link to the relevant chapter of
>     the online book or similar somewhere in the explanation (on top of
>     the Rust reference)."
>
>    ?

I was thinking of something like
https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html
(for details, the Rust reference links that you have are nice).

> +/// # example();

Should these examples ignore the result? i.e. should we use the `#
Ok::...` syntax instead?

> +/// effect which is often not wanted: The [`panic`] called when using
> +/// [`unwrap()`](Result::unwrap) or [`expect()`](Result::expect). While
> +/// the console output from [`panic`] is nice and quite helpful for debu=
gging the
> +/// error, stopping the whole Linux system due to the kernel panic is of=
ten **not**
> +/// desired:

Note that a Rust panic currently calls `BUG()` which does not
necessarily call `panic()` nor stop the whole system.

So perhaps we could say something slightly more relaxed/generic, like
"...they trigger a Rust panic, which may destabilize a system or
entirely break it as a result -- just like the C `BUG()` macro, these
methods should be avoided unless one has a very good reason.", and
link to e.g. https://docs.kernel.org/process/deprecated.html#bug-and-bug-on=
.

> +/// ```

Nit: newline after a code block.

I also noticed a `example ()` -> `example()`, i.e. please try to
ensure the examples are formatted as usual (especially important for
ones targeting newcomers!).

> +/// Depending on the use case using [`unwrap_or()`](Result::unwrap_or),
> +/// [`unwrap_or_else()`](Result::unwrap_or_else) or
> +/// [`unwrap_or_default()`](Result::unwrap_or_default) might be an alter=
native, as well.

Should we list `unwrap_unchecked()`? Or at least say these are "some
of" the alternatives (i.e. not all of them)?

Also "// Panics the system in case of an error": please end comments
with a period. We also put comments generally on top rather than at
the right side (does this go over the usual column limit?) -- perhaps
I would just use 1 comment at the top of the 3 lines and say "// Each
of these `expect()` calls may panic." (And by the way, like above, we
should probably avoid saying "panics the kernel" since it is not
always the case).

> +/// [samples/rust/rust_minimal.rs]: https://git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs

This one should use the `srctree/` syntax.

Thanks!

Cheers,
Miguel
