Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E5176AB8
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721979684; cv=none; b=gMqbCj0VtdDoJjRHPqQUFvzKbdhvXF2eZehRulNFti+jd6L84m8jGaFpofw3fBRpgBa+D9zb3j2IJS3bPNwj0mE3gp7KfMJaA6SrJELoXH3s0lZmjKic/lE+oHXEKaP5G/CUbTldgOdF3VGbiZctkNCpLbKQBATWYQXUjMv9Mz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721979684; c=relaxed/simple;
	bh=MqAset8Nc45mgIXZhKbsEINkaYQKExHjMptHz97Z1lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhRn4BarB4IOPhLU1Y8luCrvgB8l2e0+cF/8NkIr8D+dCuhQxjXU3yhDTqPQZOgNCtDJk7Zwg6fsEw7G8Z5VJto8CE5in9MI/69MGDPo6d4H8zeQLYt8OYniTzYMIOksCEZxAPnw8mjgsbYJ+rBT1peu5v5Ay9oGItyRvBOpXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=syX+nY1j; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="syX+nY1j"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3687f91af40so1128511f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721979680; x=1722584480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGuZ9gW9s8hbzxTk97NuO72bufoRV/MO+7ZPtq4qR3Y=;
        b=syX+nY1jfdqJpL6/N19Zi2CS4agtdhyklacLKJVOLPYapfnGoc+7V1ZFYDP1VveEOJ
         gTdoWUGtnAiyQIzs6y4AeAeaUOdFjb4U1v9NUNYTYod9ydoqgn8mMVupA/BAcDgMUtpZ
         NM53rELibsqPx5wCqcBE212OhIISuxTyrn1Y+YzgYDNcux1NZqK+rZZFYigd6WDBn1Mi
         fOsoBxJ8o5Yvfa7RIm55bJQsMKG/bcvM+YzzLYqEUB+rN4+M/xt4DXu45HZLAkAMOtdW
         9jrQRm1CyOHeVN27umsfzCT9QXyNX4KWNoxYfkObiJJ0P5jPcCGnJSg4Jml9Xc2o77/x
         ykGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721979680; x=1722584480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGuZ9gW9s8hbzxTk97NuO72bufoRV/MO+7ZPtq4qR3Y=;
        b=qQR8aXVVeu5ciW05a+yJxFSZzYgWuQHPzSJ4dA0ZHOX9MGRDOVz51jzuQCAjFJ1Yvi
         lYlFkDd3lfj1I7KLJP9p5qjrXDR6YeZQL1AEo5pdVOOSO6KA4Z608TFh9HOEQJDkq5RA
         Gm3WjacecHHGeR5cGiYtbR2U5vs2c6fl8iGVTzOnnP5YLx+ysKVdHAwawb2QIFGGYEiv
         4O8JU3O4s/xn/QuHG2LnwKa/Yf0FUG5PC0ntRyFuMikFZ3MCZ5kxZ7cHHxTpHlvEdZ25
         NWLpsfBUgdFHa3vVG8zDW1WRxc0EuPvNTRvsIGGrufzcfl8iTPKm5KkD8HAB2decHg67
         jHZg==
X-Forwarded-Encrypted: i=1; AJvYcCWqj/POldb90gymAd6F4eqegiEgpQpNAnTQuPcmN7qstxbrAv8kUswR1Bo6AJhjr6xWeZdnDwckpOWCPCBd/iqqZqOsgO92ppVm36r5D+8=
X-Gm-Message-State: AOJu0YwrU70epAGaQESEdXKpbs+cMzl0gZmBVFZJ3YBqk9DgLVY9gIK6
	pPfv8QMKJNFnKbmR6qXGRQ8WxCrCjinBE9g+7CqsDIgEGYL6teJg/VPUAj3Fe/kJuigM4cKtTd1
	19BKNZPLebE8LWVatEsRiIesh9wH54LMvffgA
X-Google-Smtp-Source: AGHT+IGVZMl8k8xJUMNdGuAqO6mUXeTU9uHBwsDRosmfkRv3V8tmsmQD2SxE1zeG5jOc3UIamFGu5cu1XFJeRldXWMY=
X-Received: by 2002:adf:f642:0:b0:368:4e38:790c with SMTP id
 ffacd0b85a97d-36b319deb2dmr3199790f8f.14.1721979679422; Fri, 26 Jul 2024
 00:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725183325.122827-1-ojeda@kernel.org> <20240725183325.122827-6-ojeda@kernel.org>
In-Reply-To: <20240725183325.122827-6-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 26 Jul 2024 09:41:05 +0200
Message-ID: <CAH5fLgi9xN2igQK4Y8ZCU+iPVMH2RaWGQ7OO2OV-XROJba_2fw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] objtool/rust: list `noreturn` Rust functions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 8:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust functions may be `noreturn` (i.e. diverging) by returning the
> "never" type, `!`, e.g.
>
>     fn f() -> ! {
>         loop {}
>     }
>
> Thus list the known `noreturn` functions to avoid such warnings.
>
> Without this, `objtool` would complain if enabled for Rust, e.g.:
>
>     rust/core.o: warning: objtool:
>     _R...9panic_fmt() falls through to next function _R...18panic_nounwin=
d_fmt()
>
>     rust/alloc.o: warning: objtool:
>     .text: unexpected end of section
>
> In order to do so, we cannot match symbols' names exactly, for two
> reasons:
>
>   - Rust mangling scheme [1] contains disambiguators [2] which we
>     cannot predict (e.g. they may vary depending on the compiler version)=
.
>
>     One possibility to solve this would be to parse v0 and ignore/zero
>     those before comparison.
>
>   - Some of the diverging functions come from `core`, i.e. the Rust
>     standard library, which may change with each compiler version
>     since they are implementation details (e.g. `panic_internals`).
>
> Thus, to workaround both issues, only part of the symbols are matched,
> instead of using the `NORETURN` macro in `noreturns.h`.
>
> Ideally, just like for the C side, we should have a better solution. For
> instance, the compiler could give us the list via something like:
>
>     $ rustc --emit=3Dnoreturns ...
>
> Link: https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.=
html [1]
> Link: https://doc.rust-lang.org/rustc/symbol-mangling/v0.html#disambiguat=
or [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Tested-by: Alice Ryhl <aliceryhl@google.com>
