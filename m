Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74830FC1B
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011404; cv=none; b=JxeBtIug5CKAp2lhUlykGvFmYrmY5xRW6dezlYUdApPqKol/O0ALOMIJKwsDq5b2Np7PVEgYjRXXAcOZnofbCxHokmHindVoOaFLkvLqro3+w7NQZN57fslnBeFSMVNGGxuESQO1hhwrDPGgruP4FIsJEH9/6LKojCSEX3IXqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011404; c=relaxed/simple;
	bh=vrqEsedEviIsFrrIh1wUitiCHhac8EWTFKPLIcSZYPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVGV/qaj2n8HxBs9GfH2P1cCEOThiacb2x9UxxVcJ727In3S19ANMPZaMW82K2FRUMQ3q0xwoK/KTTzIs0hcXbhGvkAmrsiOUmQbVRPylMjhHZLGuDzzhYT/ZC/TD64y6FOGGVew97kTDFV34lJ9MInDIkDhHBNkeqYmqkP++ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVcHFdbA; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVcHFdbA"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-65cf3d51c95so5120115eaf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767011401; x=1767616201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNlRh+FneH00PSxZ8P4vqxaIgbthTMHFAwc5+WdXwbg=;
        b=CVcHFdbAXlrs+xsm3/mHidGxXilYmOzPW/4hN/akMR4evDwrPR2WGmb4WYj7t2mUQM
         nZpy1GfhTypV9aIBOhi22iglQC2zqZr0yAMD14ms+yCpHfv36NOw9tivMwXRkymselpE
         OzSNayS78uUESDvHCJIYQkRfwtL61cHv+am7iSL5nS8Ws4dRhYltgD+mn/S+gmNGukNX
         PRiXdiGGLTlyxKF1FS2/aFG/xmrAlo9+AwIvV8iAKh0Y/7R7iv8Jmg1EmeP2wCXb0R4F
         YAuxiDW0IMNGJWPvu1YocSoa6E3Lb9VToZ5w9OZxI/a/WIMt/l62PiFs+SEx4rEuJXKL
         WnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011401; x=1767616201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNlRh+FneH00PSxZ8P4vqxaIgbthTMHFAwc5+WdXwbg=;
        b=kgya/P5Hrd2EXTlonK9MxZAoCY+5jeTSCqTIWvaRBxx1ZsW14+nYN3rCkEzbudYPJf
         S6y3l/XbqT29DE4MJnkyrj0vDJdnqfSK6h8cXszs86QZ1QI0cAnlz8aprFmCMG6uKvUq
         orv6/hWP4tWRJ+vjO0ESMPP7WZADSQfE/xzaMEycVqY/yfqeqmefc3CUojtMs4faNPrO
         i7IA+5i+/hvW6RAVdgFR6z7yG2eGSTCppSSMN8NZA8nap97LCcUjQVN31/LiOB/v/QJU
         o/ansFyutK4QzK+aHlgIJUKhwHyrr0k4lHLi07X1s0y8LVKGAuu7ASEP4gb3VefzHUZr
         Hy5g==
X-Forwarded-Encrypted: i=1; AJvYcCXw3IZKYjuV7ZeoBJtzzAh6sDDuUfpai2+TmsZXVjAxO8clMrJom+xq+rpdi0oO/D3er7OcKAai4OpJ7dxrAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxY299xoF8dLUn3Ai4l+8H+qm5TXx4vauWrEXYXNvpexLDiKeh
	W4awaTHcq4OaUg+Yb2cLeCYzft973a09y4N5MoZ54yETVaJe3s2HEqNpD+OjbXiL9cMkxJfJe27
	7h0BzRj+IsoeeBtbiX/U/pwXOXZO/DxI=
X-Gm-Gg: AY/fxX7Zw9buQaoQQqcKzQrUzGKlQjTaWZCJqVsAjAgaeeGGuuPbPcq8V8NF9AOtMMO
	q4zrfIEhUVNZ35IAbQD2PPNvcKQ5uTAdpYdUblVb/lFj1llbeQRqf5Q8/c+xePaeWVFd+Yxv9fb
	jzMgAVf/VbyAgJEZrX5Y64A/H/9Bwn63bHUV7FPBP1y3jIf4mvgq9r7pPbeaCf9MPydc9MrXW1Q
	PXlKINtauYDudKwy2QuJQyaEZytdf6c55GX1AeN8hQLcjN79kgLpcduFFfrlGULqPb2O6k=
X-Google-Smtp-Source: AGHT+IFv9e/7aJqcQPz+g/ACAA2KWN58Q5VLbp7DW/p83i8XMHNJzhEzH4BHF62jWLN8bcWxLDB36ri/VDXl2M9P27Q=
X-Received: by 2002:a05:6820:22a6:b0:657:48ac:99f4 with SMTP id
 006d021491bc7-65d0e94d523mr11981668eaf.1.1767011400613; Mon, 29 Dec 2025
 04:30:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org> <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
In-Reply-To: <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 29 Dec 2025 21:29:49 +0900
X-Gm-Features: AQt7F2oq3PqcyMSgNLEMYRMylRuI_V-ZWEZMGEC6qCrS17Ex_bVyXrrTY8Xfgh0
Message-ID: <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:

[...]

> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> >> > +    //
> >> > +    //   In C, enums with discriminants that do not all fit into an=
 `int` or all fit into an
> >> > +    //   `unsigned int` are a portability hazard: such enums are on=
ly permitted since C23, and not
> >> > +    //   supported e.g. by MSVC.
> >> > +    //
> >> > +    //   Furthermore, Rust interprets the discriminant values of `r=
epr(C)` enums as expressions of
> >> > +    //   type `isize`. This makes it impossible to implement the C2=
3 behavior of enums where the
> >> > +    //   enum discriminants have no predefined type and instead the=
 enum uses a type large enough
> >> > +    //   to hold all discriminants.
> >> > +    //
> >> > +    //   Therefore, `repr(C)` enums in Rust require that either all=
 discriminants to fit into a C
> >> > +    //   `int` or they all fit into an `unsigned int`.
> >> > +    //
> >> > +    // As such, `isize` is a reasonable representation for `repr(C)=
` enums, as it covers the range
> >> > +    //  of both `int` and `unsigned int`.
> >> > +    //
> >> > +    // For more information, see:
> >> > +    // - https://github.com/rust-lang/rust/issues/124403
> >> > +    // - https://github.com/rust-lang/rust/pull/147017
> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f705=
5a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [=
1]
> >> > +
> >> > +    // Extract the representation passed by `#[repr(...)]` if prese=
nt. If nothing is
> >> > +    // specified, the default is `Rust` representation, which uses =
`isize` for its
> >> > +    // discriminant type.
> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.=
html#r-items.enum.discriminant.repr-rust
> >>
> >> I think we should error when no `#[repr({integer})]` attribute is
> >> specified.
> >
> > Not a blocker but just out of curiosity: are you concerned that the
> > default size might change in the future, leading to silent side
> > effects?
>
> `isize` already changes size when you switch between 64 and 32 bit
> architectures. I think the author of an enum they want to convert into
> integers should think about which size the enum should be.
>
> They already can choose `repr(isize)` if that is correct in that case.
> As a default, I would have choosen `i32` (but that conflicts with Rust's
> default, so we can't do it).

On second thought, I've realized that enforcing an error when
`#[repr({integer})]` is missing would prevent users from deriving
traits for `#[repr(C)]` enums. This is because rustc currently rejects
the combined `#[repr(C, {integer})]` syntax. For example, a user might
want to do this:

    #[derive(Into)]
    #[into(u8)]
    #[repr(C)]
    enum Foo {
        A,
        B,
    }

In this case, the code wouldn't compile if we strictly require
`#[repr({integer})]`, even if the user carefully picked `u8`, keeping
the enum's size (more precisely, the discriminant range) in mind.

Since we already perform a compile-time check to ensure all
discriminants fit within the types specified in the helper attributes,
I believe `#[repr({integer})]` isn't strictly required. Even with
`isize` changing size across architectures, our compile-time check
remains effective and will catch any overflows.

To sum up, I see three options:

    1. Drop support for `#[repr(C)]` enums entirely.
    2. Special-case `#[repr(C)]` enums: allow them to default to
       `isize`, otherwise require `#[repr({integer})]`.
    3. Permit missing `#[repr({integer})]` generally.

I am personally leaning toward Option 3, since our existing
compile-time check provides a sufficient safety margin to allow this
flexibility.

Thoughts on these?

Best regards,
Jesung
