Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75C225D9
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727586368; cv=none; b=OAv4bEP8kxbG7byDtUN2vaCU5KFVjCGvCZhVcZcqPGJ+16E2epB6+YtB5XcvPo4f8SvnlPq735Bu6BxjRPJ7V+YLg7LA2QbuJz8MoS3k2mlHbNeQto4ehavQaVUAOzMdLjRxDV19Y12swdpQnHPlJBQtuMYlULVaSIu44jXw5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727586368; c=relaxed/simple;
	bh=aoMLEG5uYT+G721aBcrTsPEO44Pg0K8+G7jMYwzCd8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YckYIxtnbIl7gcKDIJSg6MRWVFvpUHY+tELaIUdjbWuR+iiAZUzfvYcVET4z3Kjg4pAbuGCTDf2f53hCWkI/KLxM3bYtIZtvzLDfSDBtYcBGg811XtQcn9v2Rnd2UJxr4a70vUTk7k2RDi4Oa0xiHxewF3iapI3iGDXf2uwgvjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=eE+nDhrn; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="eE+nDhrn"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25d15846baso2696972276.3
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 22:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727586366; x=1728191166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Le84oFTMGyqOR3ASEcGevuk/Liy+yuFIJS9jscyss=;
        b=eE+nDhrne3Cmh2bUUtij7b3fO7c6jDFuphTAW4aBeuhi3Yl7gqEIgMKNwnJU1kRf5Z
         s6lz99QB7YGC9LHfWcNbVuRmJP1XThWDslSV0gd0rK+Jjy9ELv0TmCYnwFg8oW9O5DOy
         zhKuWZAAbNcvKtAz0cf8R8IW6uX/AhiEgsmuQEB6LpWNFZFkdgX193TT7XeHlmiXAUgP
         niPEErUVrruk16Zyy7gvFYBVudg7QVI4meIfKR5t3VXTVDGzOFm9KAf2RoxdBeWeudNv
         qYYz6ZbzBbWqweNXHTa4hDrllLpsb/rvzOjoAxWz5IOEj9LTUA38mvrnjXFSl5daPyiz
         TVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727586366; x=1728191166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Le84oFTMGyqOR3ASEcGevuk/Liy+yuFIJS9jscyss=;
        b=iAmeBNXDzVDxi+jnww0MG91sb3bHKM2L3uBoEck3Bw7VwRfHyXTeu0K/9FDPPOMJbU
         4QsgCliyPaPKUBqXwXn2D649uFlDZKbIBAz9gUTwoVu0TnQckbyhpQmyuuU0b+Ea+LUo
         aipCFN1Oz/9Y4YwjK7oQVQAQlYUVkBFNQxNodHVJFRVrjqH0q6wHccMWVqm3i0+2J5mI
         607LRvTfFMVXtdjelOLjEPtHMrifTDsS8CHXujpffBMA+7Qjc3k+OQEGgMNqctYwqyCC
         CaRdwECTEPYtFZ7CUd0LqCOJakeYl/Nxl6qTCtiKoDJB4n7MRayp9oWDDrRo63xcCOFO
         DxhA==
X-Forwarded-Encrypted: i=1; AJvYcCVBXpH+GgZXm8ZhY0HB0xCXdcTLbO7RDyNEhbz11bgD3Ve9bYXmLetZKksOZKezHS8k2oKJOYnHny5q9Wp1XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOjQ3cgJjGJfnW4wA3TzSSAfg8wh1IpeZSMf5Iaqmvf92SzNh
	I4ttBh4YHlYWnyC/dMuTDs5+IHQD41k2k6EHbdIpax1MToT/4czAN+/56gm5D+Y/HIlNhv12KFw
	lGi1aEPrBlcf3tBqjR25szRSumqBCEOmVtyAV7g==
X-Google-Smtp-Source: AGHT+IEloWzG2A11MN89rxxaEDbrR1lmHvEvCKeAdeymrrHOE5sVO9T1Agllzp8sYsh+vZl88oQ6oGw8u4gcQcVlQ1c=
X-Received: by 2002:a05:6902:1ac9:b0:e1d:1434:98a4 with SMTP id
 3f1490d57ef6-e2604b28394mr6473525276.9.1727586365868; Sat, 28 Sep 2024
 22:06:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-18-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-18-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 01:05:54 -0400
Message-ID: <CALNs47swvJT+dwCXdFmYEWJg5fm9c3gpbGCwkOYE4v6Udx4E3w@mail.gmail.com>
Subject: Re: [PATCH 17/19] rust: start using the `#[expect(...)]` attribute
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Fridtjof Stoldt <xfrednet@gmail.com>, Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In Rust, it is possible to `allow` particular warnings (diagnostics,
> lints) locally, making the compiler ignore instances of a given warning
> within a given function, module, block, etc.
>
> It is similar to `#pragma GCC diagnostic push` + `ignored` + `pop` in C:
>
>     #pragma GCC diagnostic push
>     #pragma GCC diagnostic ignored "-Wunused-function"
>     static void f(void) {}
>     #pragma GCC diagnostic pop
>
> But way less verbose:
>
>     #[allow(dead_code)]
>     fn f() {}
>
> By that virtue, it makes it possible to comfortably enable more
> diagnostics by default (i.e. outside `W=3D` levels) that may have some
> false positives but that are otherwise quite useful to keep enabled to
> catch potential mistakes.
>
> The `#[expect(...)]` attribute [1] takes this further, and makes the
> compiler warn if the diagnostic was _not_ produced. For instance, the
> following will ensure that, when `f()` is called somewhere, we will have
> to remove the attribute:
>
>     #[expect(dead_code)]
>     fn f() {}
>
> If we do not, we get a warning from the compiler:
>
>     warning: this lint expectation is unfulfilled
>      --> x.rs:3:10
>       |
>     3 | #[expect(dead_code)]
>       |          ^^^^^^^^^
>       |
>       =3D note: `#[warn(unfulfilled_lint_expectations)]` on by default
>
> This means that `expect`s do not get forgotten when they are not needed.
>
> See the next commit for more details, nuances on its usage and
> documentation on the feature.
>
> The attribute requires the `lint_reasons` [2] unstable feature, but it
> is becoming stable in 1.81.0 (to be released on 2024-09-05) and it has
> already been useful to clean things up in this patch series, finding
> cases where the `allow`s should not have been there.
>
> Thus, enable `lint_reasons` and convert some of our `allow`s to `expect`s
> where possible.
>
> This feature was also an example of the ongoing collaboration between
> Rust and the kernel -- we tested it in the kernel early on and found an
> issue that was quickly resolved [3].
>
> Cc: Fridtjof Stoldt <xfrednet@gmail.com>
> Cc: Urgau <urgau@numericable.fr>
> Link: https://rust-lang.github.io/rfcs/2383-lint-reasons.html#expect-lint=
-attribute [1]
> Link: https://github.com/rust-lang/rust/issues/54503 [2]
> Link: https://github.com/rust-lang/rust/issues/114557 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
