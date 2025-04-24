Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C44C2A1B2
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513147; cv=none; b=r+3QER96C45Vp/cmnMcGVRRDZXHW+5BCqf/vkAhEyF+zanp2ehLaRq+/KH2Or0nbH4nlgyfUt+H+rX5UpNofsJURuMVAyLQ0vDBMTBKGZ/YY5Zb0c2rzvS220ehMdsDT85jRHYbAxPTDcJaKxhcpuOvNfXLN40/xVWVFaJtKCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513147; c=relaxed/simple;
	bh=5rAHjnIDFZi5iq0Y0Ha5vnOtuzWDbFJPQwj2EbkGh3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGt00NBs6v6pyvtiHfNd23BaYOoRmIEgXXl5PhS5i3Gvf9wEeryVCk0Wub48exN/Ypq9vlJhlE7/xxXeYMjSXjhUw/KRqnjIke7IlKtUiSBlgsJwK4e8tICzHrLCS7pEwlsUcE2uDLrNiaTvrRPiTbmGpyyiLmOKQ5sj/sGXI9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rczbqJcQ; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rczbqJcQ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-605ff8aa9d2so358687eaf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745513145; x=1746117945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEk0tqXKTFf2XG0zzMJM8NS+jZAhohGk/IEw2rvL6Tg=;
        b=rczbqJcQl0KTX/6AfEPogB0U+uT2b2DRh+tpjyuugYCpqX23nH5bYDONAUil5RoSrH
         o4PnSjktddK2XcRJNNfNle4q4sffiSjHxUko1w41vYH3QL6693+Paoando8AbAWLY93i
         4NXvFCn+j0i98G+gyILuRYl2lgtUM/El9h3dEnMqRB/ekuh99tCYCy1xAhmowTUU4f2i
         zIeKLmVz4Wbm9fRcxH4wKYc8V+R9DegArYFwDB10K79KvMuBIGaCqMnxvziu5cwxZjUM
         n5gMuDe9+G3GTBX4hCXo0ahoHBjmVfBSY5MBWowjFOhao2+IHfMb6TRZqlpY5B+Y+Djs
         GyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513145; x=1746117945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEk0tqXKTFf2XG0zzMJM8NS+jZAhohGk/IEw2rvL6Tg=;
        b=B3s/uOePh+SnF5uIF4a4zUSrYK1wlhP1OuJgQalVqRdPwBxaBF87925fDBD8iRB48X
         tzfk2MxpfHEobMPErNFg+sUYG0ttgISGFko2cUlatgamOl4bHQ1zu1wuIiDXO6fAhFpK
         SVTzCi77Pm8LYJkKSqXvdf3AoWQ6v6SjaTvXKSU26iFaDHvkDuhf4mgus9+wyjwWlxTF
         ezMceqWfG6NqcdFugxTjhI7vgnKuvU86+vlsaWfAl4UF9mJLZRrONkeX/mVt3KhW/POH
         Fgv5DyFfYQBLxn6d6wTOkV2MXU1MkC9rQj6efKoi5BpGJ2uo+u6V6tvfdg6RSU3OZ3dW
         WT+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwSgaFT13J42CxTEfyTEo8kxCYLe+xkxHcthHXSLWe72kcJKG3CiDGEUjM3ZTHIhbaRHGN6lG3xp6cZ6e1Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3ik537RH2hrwnL7H4CKQoBVrmRLIJtpdSuABwS+1gpK4u55h
	kwCcG0o/Z764eTwGpIg7IVS/XlT+cYaEThcHzfm413HGQwom4/2k9pgD40er6H8EtykNWK3Xl3G
	GREbgXmdABxqYkrRnfz03oPwxFsbiDVz2LZrI
X-Gm-Gg: ASbGncvu1INdzXHVDZaR21ZDkhDvqXxILhqAR7ebhFZD4JIXE7i2vBf+Kvi35JnqqkH
	pKuFSqlslfARv1ADZM1sjbxvAG9LGXv9FfouwBe/0mFIifc5V8xLpLTI7TA2NV75dMsgpHFqDYO
	g2i+/KQ5UYhX6dyN0G49kxE9yNVyDBXeS2IDX/8CDH8y1b6rm5Aru9Yfh78FBDJjY=
X-Google-Smtp-Source: AGHT+IGGhcBLAs+AfH0rQ86xrZn62rdmOCwhyJBo08kJknfw21TKi3VhTOgbs0xV+7jsEdYB0tkU39OVbk/1QvzcBjY=
X-Received: by 2002:a05:6870:31cc:b0:2c2:4c92:77f with SMTP id
 586e51a60fabf-2d99459989bmr302042fac.38.1745513145302; Thu, 24 Apr 2025
 09:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury>
In-Reply-To: <aAkbw0jEp_IGzvgB@yury>
From: Burak Emir <bqe@google.com>
Date: Thu, 24 Apr 2025 18:45:33 +0200
X-Gm-Features: ATxdqUG3hKo3v7rZB79Cjitmd15MGlawnnyBZoA3Y930-k0kcMlNDYYHQM4UNDE
Message-ID: <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 6:56=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
> So? Can you show your numbers?

For now, I only have numbers that may not be very interesting:

- for find_next_bit,  find_next_zero_bit and find_next_zero_bit (sparse):
  22 ns/iteration in C, 32 ns/iteration in Rust.

- for sparse find_next_bit (sparse):
  60 ns/iteration in C, 70 ns/iteration in Rust.

This is a VM running nested in a VM. More importantly: the C helper
method is not inlined.
So we are likely measuring the overhead (plus the extra bounds checking).

I would like to get cross-language inlining to work with thinLTO to
have a more realistic comparison.
However, that is not something that works out of the box.
I am looking at Gary Guo's patch for this:
https://lore.kernel.org/all/20250319205141.3528424-1-gary@garyguo.net/
Currently, I get duplicate symbol errors.

> Can you print the existing C test output back to back with the new one?
> Can you also ask 0-day folks to enable your test in their rust config?

Will look into these. Rong (hi!) is working on LTO for kernel and will
know a lot more than me how Rust will fit in eventually.
IMHO, making cross-language inlining work out of the box will be a
necessary baseline to get Rust performance for hot code.

> > We add a fill_random() method protected by the config in order to
> > maintain the abstraction.
> >
> > Minor fix to the documentation of the corresponding C config
> > FIND_BIT_BENCHMARK, it was mentioning the wrong module name.
>
> Indeed. Can you make it a separate patch, please?

Will do.
