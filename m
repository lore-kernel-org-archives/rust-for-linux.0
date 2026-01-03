Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB12D1F5E
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767450307; cv=none; b=lWyf77ZAz9x+af38iPJIqWy2PhbmfvMadY8OHG/MQg5z6Jw7payOMVTmV4rjY5kudpJvVrcqII5W8tBhOqdWxA0DzE7UNVjXoX66WzaubC4fmhcwZ5FyiXHXlfQX82noksUlJ3gz7ijxeZAorr7EiZfBfMPKLT0XpwMSKqBnApo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767450307; c=relaxed/simple;
	bh=pZ8QEj6QLs9r2FAVchNYRPaP1Hs3kb6aiE0yqWXE45I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9+GdXeo2s+1b7GSc8Ro9eRhu24hvnvXJATKIoYJZQ+PsUouVWWeGdnFr3h8UTlCh8zxz+RJVtSQgnJxdVMC+WWGFQPFd/Xj/pjbNMwk2fNDN1C8NrYrxa5nN9ra4wAgcch3hfUcA4jVDgASnor9eztgD5/V1A2ZHstIBJhF8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO0bZsxO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO0bZsxO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34ab4879aa5so1184631a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767450305; x=1768055105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnzEodu7NVKeltscSE/08gh9D9kPh73246nxyOaNHhU=;
        b=iO0bZsxOBJLmXI+l38oPz7b1umu0Upc2FS+BpaGR2g+oclHDnwDawkUdZ214rZs70f
         R7VeEvvFMJ8fLRbvYWZ1P6gGFDFGWD5NmPjm0BFiM/EqgogrzlJ3iuQwp+2n0engAPfC
         UgS57KiclsbhmpGv2GJnSrgZRzMjROptCFZFOZt+qrNpZ5/5fBJOoHnrZ5YcjFR4xrHR
         BeKagqFQMS6AVyzf5N/a6OxwCtEBvi6/Fa/jBg6/Jdr58nHlZ5ejbr6gAw1hbAXcQeFx
         UdsaiC6iHIVpvKcWn6K9iDlZxomMs02qUTL0nG2ci3jsgTNZu635h+n+/7B+WKcDiYRI
         3jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767450305; x=1768055105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnzEodu7NVKeltscSE/08gh9D9kPh73246nxyOaNHhU=;
        b=t4KyWNqQV0Sq8B2JGEOmU8LwAw9F927Qy/z0ktYsxj63IGSp/7i/+NAXvCoYMUfnb7
         4yLAo6p5kxR9cBrLN2Hpg7bYHJfxppLJrcKBqW8cXx418gM2pGzTi17wyVQfp6oh8NJg
         19jd/s99UYYZmygmX8XJQPMfY1zvBzWRoPPYRcF3r60ATAMoNmxPwfgvWCpFMxbo1FHZ
         aCr/buxMdQkqIykCF9k4j/i9cN+4D/8CCE7ay58Be6Bx/9c4Dngydr58mVaf2RziF/Qr
         QAcylHNSI5t1tGvIcVuvYuCxySzD5QPm0/Q49tLjLl4p0we1F2GvH70FMrga8xZUMhGj
         8GCw==
X-Forwarded-Encrypted: i=1; AJvYcCXE9wcG9LcCZbzkxHWix8TIPb/3TVkPLoOt2PG69OyZhryxBoQf8EJ+syx5FX3eLZsLR/ziD8NWmUOmegSpqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUjnmbphYhGH9dRNAS0mEZQEGMfdHA/kh6QHt1974jpprpqxx
	8tmO/7GAp5/UmxTCOpHJi4m/LBmLWKaoXRW5aLVkowKnNFuoyvNm22McoIWAVsjk5vU0ahNMDyi
	mAWa1Hr2KSf4SJMARtSqAH5KtuIqvbqs=
X-Gm-Gg: AY/fxX4c0rSUNBJLNyjqjecpPB9P8PnsRiXLySLZAvVeok+reXT7WIJe+nztLlnZgqn
	SziU3gp87+0V9phSVERd6aSwH6QiETfbMnfEq0Zx/cInMehcMH1SBtDA2ovEZb194macp67jp2B
	4Q6807bJgZEmAYDn7kr9AkXZs+An0uiHk6lMHCg87rcN4nEu2vdiMTY+NcmWaDWFGg7wvN9z8WT
	l2NHp23DOe5HRRxC2DCyDKgP/aOdHLShY5n+OOjLjtZBP2h3WCvzMx1RDdc8V98tY9txmJxvI4j
	QSOprih0yDLwBWzG9o6QUzM4TmHn46mWnc7bCsnbUbKmPruRBXtFJs501drbrfSzOlzIWAgY29T
	SXj+bM1utEYSv
X-Google-Smtp-Source: AGHT+IH/lQkWHZCrxTFr197QCrA3AoKEcXmwxhd03RloWD7cFM1njgjl4gzeeqVcn+YNe5FXNzIsmbvQJ3KQKQw79Qo=
X-Received: by 2002:a05:7022:3718:b0:119:e56b:46ba with SMTP id
 a92af1059eb24-121722efb56mr15126323c88.4.1767450305223; Sat, 03 Jan 2026
 06:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
In-Reply-To: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Jan 2026 15:24:52 +0100
X-Gm-Features: AQt7F2p33xRRvAaFA0tYuoC_czKZqnb90aUTGHXAHs7YndatAKf6ZIH0AaFerTI
Message-ID: <CANiq72mqUwscPtsOmtFhOThxyChv4vBTKza6uwN9K9CU4Hbqjw@mail.gmail.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 7:21=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Common helper for declaring bitflag and bitmask types.

Please add a `//!` doc comment between these, even if it is a trivial
single line one, that describes what the module is about -- we have
them in modules even if they are `doc(hidden)` ones.

> +/// This macro handles:

I am not a native speaker, but "handles" can be confused for input.
The documentation also mixes a bit input and output, so it isn't clear
what it does.

I would instead try to explain what the inputs are and what the macro
implements in return, e.g.

    /// This macro takes as input:
    ///   - A struct representing ...
    ///   - An enumeration representing ...
    ///
    /// And generates:
    ///   - ...

Or something like that. The example is currently doing most of the
work at the moment.

> +/// - A struct representing a bitmask, and an enumerator representing bi=
tflags which

enumeration?

> +/// may be used in the aforementioned bitmask.

Missing spaces at the beginning to match indentation.

> +/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::=
core::ops::BitAnd`], etc.).

Why is "bitmap" used here (and in the commit title)? This is intended
only for single-word bitflags, no?

Also, "operators" (please avoid contractions in docs).

> +/// Defining and using impl_flags:

Intra-doc link?

> +///     pub struct Permissions(u32);
> +///     /// Represents a single permission.

Newline in between?

> +///         Read    =3D 1 << 0,
> +///         Write   =3D 1 << 1,
> +///         Execute =3D 1 << 2,

I assume `rustfmt` (in a separate file, i.e. not within the docs
example) would keep that indentation because it is a macro, but please
double-check.

> +/// // Combine multiple permissions using operation OR (`|`).

Should we say "...using the bitwise OR (`|`)" or similar to match
better the usual Rust terms/docs?

I would also update the other cases below, even the negation case to
bitwise NOT for clarity and consistency (the XOR line you have doesn't
follow the pattern anyway).

> +/// let read_write: Permissions =3D Permission::Read | Permission::Write=
;
> +///
> +/// assert!(read_write.contains(Permission::Read));

You have a new line here but not in the other examples -- I would just
remove it.

Also, we should probably have one example of an `*Assign` case to show
they are implemented as well.

Thanks!

(By the way, and this in unrelated to Filipe, this thread has quite a
lot of nested levels of quotes -- could we please trim replies a bit
more? It would help reading in e.g. lore.kernel.org)

Cheers,
Miguel
