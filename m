Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C033985
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584836; cv=none; b=fvByhcXqyYKhOEMUpHMJD0OPVAPVklNs7dfmRTYYS2kcANuse/tVnr1etBm226hcrny+2dxIs99XaDfF3AgS/sTQL4iOVaPfgX2eWNs6u063O+/+gUimSTc+NennWOpqWqAfYD79N21TMdgYGCoF1Dm9PyAAg984CphISmn+Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584836; c=relaxed/simple;
	bh=gEGnP0STUu3Lpzltu3JSxCW2N1DRULTC36U1Qhm75Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czos33x7fWp62+OrDySclarzqDODwAnz8Hjbx3+OHGb2a6enHrUe8ewRVEeVqtdNYvYquAxdzxXBce4Sgv8rZPMFQM8KdQfUQt2FwYmksv1FAF4ZhOXbEwAyTt3BaxozhtLau8gxEHjJrJPhViVw7vyYOIgxiaO140GWpS4UcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=O6kx7enY; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="O6kx7enY"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e24985919c8so3348427276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727584833; x=1728189633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VV2YxyLVgm/A21lFnrbUS0xzE5yvl49iPMLTKyEnGNo=;
        b=O6kx7enYpPalJffa9dWJOiyO/4Tvcq4h44mWqv8vKPn0SsCmb4iZF5X96f4S9BmCem
         bw8TLoG1a5/xOQjp/yHVYI9ZXL9i919TzXQrn3JJy06ge47igQYKT1CNy1b7BoZRf+lV
         7eAxgH4whMmqbZpQxCgqjZP/UVbErPrhfc6LSupOS4oMiLZVfs0wgGfkbkyLItg8UQ4u
         mvfna2k6XmEWhEY8+rCg4JpcqkEvdf+SKCviN8L7wl0RGPYeRjzmav1IGaG7JEBGloPx
         Nc46Wie8IsHqdU0rlWEk2yYXQu1pMOT1AUn+QVoq5rGgc7HbeObiLNhFIRiZEmasWyda
         06hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727584833; x=1728189633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV2YxyLVgm/A21lFnrbUS0xzE5yvl49iPMLTKyEnGNo=;
        b=Rgr6h/idI3Wg7g/PjRV0sT4bjtejthlhUfidcz+HE8ogN0zgjvFljnAuBgwCljdf+7
         EPJFxD06tDZgXSFivVDi+lqGYOsxkmySphNLXjjAtA0+VSr9pBPGXmLbCF9w7a9vXbmy
         NVCMpjj1iW317Qx4cDUmTLlXOwDyNRgLq+rRNHHl8BAf9EHp9lcbDy7q4C4GLcwbTcRO
         zj9B8xjtBDs/aOqVh4f+OmvzeGN4/W991Tt0kO2GY+FPnPKL/LlBd/uW2NlSN1MKSVaj
         dRJMIeozvCwcDs2iff5XselZKmcD2F6FrrrjYnWyepXyk0UoNMNNjBpCHV2rI5e5jieo
         +1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOaxZjpv7ZMBY5a2NRCXQM2HH3NZvx7vfrmOlVDT2ibUb8y2UcedCFjk3vyyvKZbEyAjtE5M/QjSp9Qx7gQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+pFsPuKqmNmAcYJP+XGsVQSWZDp/yJXD8DmTOhJqXJp64HYb
	Isdf0F/3Xwn++GW6S2m7QVglRzJ73eFinUHAnLp/tAbd5LtWxlQEaArNOaJzNQy2BHiBiILRqEg
	I9vgKA2hfNPpyrM81/tMEuqcHk1pibvRH9VVNgg==
X-Google-Smtp-Source: AGHT+IE4B4r6X5b8t4Dk7RmIMj8MQORtpJ9++eFIxvMdYYJl/soJ9aCmoTuPzU+LqekFU43oyGbJtCB5UAMgPSvpC74=
X-Received: by 2002:a05:6902:2493:b0:e25:d0c9:b0c6 with SMTP id
 3f1490d57ef6-e2604b5f2bemr5869513276.11.1727584833057; Sat, 28 Sep 2024
 21:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-9-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-9-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:40:22 -0400
Message-ID: <CALNs47uC43vixDMt935BB-fuDJEKFE-SPFmSQp4Nt3v+O9wfbQ@mail.gmail.com>
Subject: Re: [PATCH 08/19] rust: enable `rustdoc::unescaped_backticks` lint
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
> In Rust 1.71.0, `rustdoc` added the `unescaped_backticks` lint, which
> detects what are typically typos in Markdown formatting regarding inline
> code [1], e.g. from the Rust standard library:
>
>     /// ... to `deref`/`deref_mut`` must ...
>
>     /// ... use [`from_mut`]`. Specifically, ...
>
> It does not seem to have almost any false positives, from the experience
> of enabling it in the Rust standard library [2], which will be checked
> starting with Rust 1.82.0. The maintainers also confirmed it is ready
> to be used.
>
> Thus enable it.
>
> Link: https://doc.rust-lang.org/rustdoc/lints.html#unescaped_backticks [1=
]
> Link: https://github.com/rust-lang/rust/pull/128307 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> +# Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` s=
hould
> +# not be needed -- see https://github.com/rust-lang/rust/pull/128307.
> +rustdoc-core: private skip_flags =3D -Wrustdoc::unescaped_backticks

Maybe we should use something like FIXME(msrv) so things like this are
easy to find?
