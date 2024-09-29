Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A322075
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 05:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727586196; cv=none; b=nMOoyiLaLAIQzY02Kktc6Q32pBqva6iLGj+ovTx64fJNCtTcMm8YfEHog22l5II0FixzxvvDwzyz73kYpuVZtDGvI2kfwZNnQi8Dk7liHycrhMvUNLN0BNqXpXDGav/rH+L1bZ4jypd7SAtqroR/AjDcvAqY8yCZ/M4q5XYAYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727586196; c=relaxed/simple;
	bh=MBBs2gBB1cs7jAj7EozRTGzyrlscYTocqcXOG2eQawU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQpFWjWu4g19tovYmklBtubj/cpoky3SN98Ffr39Bmj0f72UEB+clPZP1v3QYBGqsvGnwtiRAy6lg37I+6Bb1FjnJij0d1FwpUwXN+Ihr6ModZQPa9tdlQxuUuLAh6cRWe63K6TLQ/bs7z1zEh+GE/h1k+ufcNyhiLb6DUK8PAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=d2Bd+dFG; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="d2Bd+dFG"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ddceaaa9ddso29111567b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 22:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727586193; x=1728190993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4fJ3od1/Qv1njknmjb1VUvECYnufqLrw2fjOCobJsA=;
        b=d2Bd+dFGN+yqxUBREV2q8DhakY6tDe1Q8FK46y3VteYr/UzMvaAqyvww2RFNj5smYq
         WGv0WXnZBZu1JVTIKb/fxRKM1J/X4oBLKBrpUOkUQDdJ+s6nxiUG6ieEiYLVh/QTH/gQ
         AmYDdVwz1XcyILvs0IV5GFajDeg31LR1tji9PUtJT/0eqOKUN0FqJ6Mjo2mfvSUsn9I7
         1hZ4n0ZZ2i05AHBaXI7Lk8VpKlCDfiKvUMZsxxvcKDC/H1EiY/ZNj60kUPQBXl1EsnyB
         tjU/iqqxpdoita3Cth8rgWmhtiHeA/jAnq5rqcO07cgCkYlkRq9jWjhSN8hdqNtHsM0E
         C/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727586193; x=1728190993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4fJ3od1/Qv1njknmjb1VUvECYnufqLrw2fjOCobJsA=;
        b=VvsipjeKHph6S0xVlyy/4DvCwL7qCcXF9wR+nzfWLLhe5uv3/80wzOId/OG1oyB7z3
         Z7JfPzlgcJQOZWQNlPXeIZaqha/KJecf8vbRU89RCgVZtSsEGmnhPxgb54dUNFNX4omP
         bCG3q3fEOEQTtVrltcYQ6tBCifF0PhV5AhipZwEq1E3No7v1XBubkI/FJFBe+/rgcSR9
         oAZ+ACtMQK9Q9XqO5SHDGVa+DiTM57LcDI86v6K0Q5pY6wHmlIZY0C7lBD47wiCxIdWX
         AIwHaDsnMmyesSYQQsi4J8DJCo2F2c/AoePusjHTpaByItSdLlL+33sfd7+IBbHcyrc9
         fbJA==
X-Forwarded-Encrypted: i=1; AJvYcCVQvqfu/mTX33p5ZeRyazmWiARs0M3DDCSwTVCrROGqvbPy7sE774sZU/tNODweWq1zKN3srSvvWU3ScB0yWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxixUuR/AsFS1PZQ4lHRREAf3tqt9vgoK71cb0C21XWEvYWn5qz
	SaWy5ZQd/SHn9LhcBHJjP9/2AIcSKvjdkR5xvfRIOfAFXoqCVcqktx+1pTCFug/ghVO0gVetxlP
	VAUsCC0F5//Phh3bifRDeQh5mxHqkOTKVbf8xtg==
X-Google-Smtp-Source: AGHT+IGFGA2ibiacUm5SY6v/Uk0BKQDc1zVikRtFuWauzKWc3ornt2i9Ow+fpFE8fh1RyZtr7swqV66pd31i/h5zmXg=
X-Received: by 2002:a05:690c:3385:b0:6d0:f91e:2ff0 with SMTP id
 00721157ae682-6e24751f3ecmr63818057b3.11.1727586192644; Sat, 28 Sep 2024
 22:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-17-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-17-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 01:03:01 -0400
Message-ID: <CALNs47s=kCJUJstB4WW1KF_b55-e1kYQ_1rZjPu=LWxv2gmF3w@mail.gmail.com>
Subject: Re: [PATCH 16/19] Documentation: rust: add coding guidelines on lints
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In the C side, disabling diagnostics locally, i.e. within the source code=
,
> is rare (at least in the kernel). Sometimes warnings are manipulated
> via the flags at the translation unit level, but that is about it.
>
> In Rust, it is easier to change locally the "level" of lints
> (e.g. allowing them locally). In turn, this means it is easier to
> globally enable more lints that may trigger a few false positives here
> and there that need to be allowed ocally, but that generally can spot
> issues or bugs.

s/ocally/locally

> Thus document this.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/rust/coding-guidelines.rst | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rus=
t/coding-guidelines.rst
> index 05542840b16c..185d3b51117d 100644
> --- a/Documentation/rust/coding-guidelines.rst
> +++ b/Documentation/rust/coding-guidelines.rst
> @@ -227,3 +227,32 @@ The equivalent in Rust may look like (ignoring docum=
entation):
>  That is, the equivalent of ``GPIO_LINE_DIRECTION_IN`` would be referred =
to as
>  ``gpio::LineDirection::In``. In particular, it should not be named
>  ``gpio::gpio_line_direction::GPIO_LINE_DIRECTION_IN``.
> +
> +
> +Lints
> +-----
> +
> +In Rust, it is possible to ``allow`` particular warnings (diagnostics, l=
ints)
> +locally, making the compiler ignore instances of a given warning within =
a given
> +function, module, block, etc.
> +
> +It is similar to ``#pragma GCC diagnostic push`` + ``ignored`` + ``pop``=
 in C:
> +
> +.. code-block:: c
> +
> +       #pragma GCC diagnostic push
> +       #pragma GCC diagnostic ignored "-Wunused-function"
> +       static void f(void) {}
> +       #pragma GCC diagnostic pop
> +
> +But way less verbose:
> +
> +.. code-block:: rust
> +
> +       #[allow(dead_code)]
> +       fn f() {}
> +
> +By that virtue, it makes it possible to comfortably enable more diagnost=
ics by
> +default (i.e. outside ``W=3D`` levels). In particular, those that may ha=
ve some
> +false positives but that are otherwise quite useful to keep enabled to c=
atch
> +potential mistakes.

It may be good to link to the docs on this,
https://doc.rust-lang.org/stable/reference/attributes/diagnostics.html.
Either way:

Reviewed-by: Trevor Gross <tmgross@umich.edu>
