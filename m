Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E6348894
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138481; cv=none; b=GBKFeGA45gvggnFdj9cUhdauOMYvHFttow+Oa52jsdxumfL695jX6qzneRHolc6AvguAz81OjcTkEUMk/91IY0FjlcPimeOoPg6Jh4uTVBSmZyg506txluGyMuV2X5TSIwVjDb6+gSrfB5OlzHs8J05UGmvf1tHtNZeyJntO4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138481; c=relaxed/simple;
	bh=v6CAgrPH+9fMjPQAYK18p2IhMxIxQAA01rIpn9V81Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLgLiW8lLGi7VKdba5HdGWAxyT/rRxWPAHyL7ogI0vDaF4XwGeKzJs7KxaqOZO1qCtoEfg+a+3I+r6cr40VCx5IuEy/jYalrtmr/z5OfQkg5nqaU/mjKsY8Gxwnc7zAKimsxN8NyvdSH8RcgLeoLTTolT6Qy6XdIX1zk5tk6teA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XalfAqiW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XalfAqiW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290a33bfea6so8725415ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761138479; x=1761743279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6CAgrPH+9fMjPQAYK18p2IhMxIxQAA01rIpn9V81Xg=;
        b=XalfAqiWTGZmza2CiCgxOZqoMhBusCqcSfH2o5STsnxLmhlSRXb1o7Nr171ZXOpboD
         S3iFxoTVgqelBSnjFhNELAL/lFTsSqlvzzUhfD2+ozhCZxWzyWffxCB5wz6Nhaj/mDks
         YgXkFXpjiJxHim3cXNj1ANMf7VCWuJGSuIUvTkY6PnxbCAjlBcJnmUsPw7xNxEl5WNHq
         Fk3nicDC7bpRQNuxLTAsQziOfn5PWFJPki9rPaWYVajI6ZxUvn+Joc+Lt3XNVJUSLjLY
         8wuJ9lRwxQqzGZfIbX4keYTRjt7D1gypyqUEC3tXefNv4XgDaQGdkyawy9OwmLSG3M56
         iLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138479; x=1761743279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6CAgrPH+9fMjPQAYK18p2IhMxIxQAA01rIpn9V81Xg=;
        b=BnsQzh9wJFjYYb0Ju1NIdVtJOp6LgTkTjp06y7bM+4C9mfOZrIEdZrW8ntwQvRWW7b
         wR3EVbzS0GH0dZ6z9gwwKDxTFd3za/wQF34i/+nyabT2JCNe+/1TsvjQuwdLKWOhTFfY
         rthz5kjKjJmb8He83ajPeGG8xeIXzXgje1fk+NOB0e92hbi1/q6Lem27af8qMHiEVG9b
         BAhUPpePHfjjE+f9oDx53E3siph544IW//MAj8JbV2DvQIEAr7XKLpyr2crX8RhA3eJW
         ZhOYktfhn7CaMcQwx1O1QLubuN6xG2ag9iGmTkaX+LiV5vQ47NcrZmCvn8LAfICl/xtQ
         eZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmItkht0zG5nHEOglaUAy+cpUgW9T4KRK8KoVQjMm7bcwRdu79YuLT1IjpZ9vi6wAtzaOBjucrlHmQC1Meww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFfXkCeo1aaVsNnwWujwjmgKX52zC+JnGJK11zyccF+lNqJ+n
	ZRMFIEL3mvnkkVUYblflkKFP+d0CQNUfFzHgpW0qbTj/lX0oHsfYzpMGiDGWdV6RgFqUQ5Vufwp
	TRzEIYQX7AFO3IutaMhjrZzaBwmHVsOc=
X-Gm-Gg: ASbGncsO9P8G7P45XQ9NO06fg3AS9z5yXM4kjgFvIXfPokaKMysLLCSg58RS7Fq9q95
	F9yn+6oAAmSX14zMPZflRMSNiyLGmKTrKuex/t48wIUxZD1EmC3oSX7dhofy5Z71CWHV1rWwhAU
	gl5wsp6ehOMRXdiTDHnWNkXywji+to7fvQBHH5/nOhDKTtsJLIHdpiTtp1eSm05Apg4Px3WPcOt
	a2+DMoOawJ/xNRE0MfK43hOJMwvUXc4h5N9aCwgXxtcFT39LExzwUtB0ORHeyDItGKp8UsqMdCd
	GSys5jtuz//q78tTJS8RAxy5a6Jz8bnYLK6Su1zU9lX8ip52XJPYFeKmj4Z5rphMMRl2rjXv4FS
	6C0glmKdxguKsGg==
X-Google-Smtp-Source: AGHT+IGL+tJ4kvjV/JSXjg947rgGy9Vdv9xQo/WqhB097++NIa+9JXyzjYntwCr+W2ZIsnNpQ1p7QkudYKJal/Zhuu0=
X-Received: by 2002:a17:903:244f:b0:28e:c6ff:a1d1 with SMTP id
 d9443c01a7336-290ca218a7fmr140372085ad.5.1761138479026; Wed, 22 Oct 2025
 06:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022122518.457702-1-caojunze424@openatom.club>
In-Reply-To: <20251022122518.457702-1-caojunze424@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Oct 2025 15:07:45 +0200
X-Gm-Features: AS18NWDsdfGX_CCDmxmuE3DDbw9WzbAxScutF4G9MggSzIbojapryIN8_YnTkXI
Message-ID: <CANiq72nCx0j0SbXW8LwigH3JxMaU2hpBRmK7__XccNqHBCmN_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: fs: Add FileOffset instead "pub type Offset =
 bindings::loff_t;" and FileOffset test
To: Junzecao <caojunze424@openatom.club>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 2:26=E2=80=AFPM Junzecao <caojunze424@openatom.club=
> wrote:
>
> Signed-off-by: Junzecao <caojunze424@openatom.club>

Ah, given that domain I assume this is related to the other email you
just sent? Nice! Thanks for taking a look at this!

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20251020222722.240473-1-dakr@kernel.org

For those that have open issues in GitHub, it is best to link to the
issue itself.

Danilo had started working on this as well yesterday -- maybe you can
both share and merge the patches? e.g. he took the approach of
providing saturating methods, and had more doctests, but not the
"normal" tests.

Cheers,
Miguel
