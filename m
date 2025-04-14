Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2025A2D9
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620422; cv=none; b=D0/uiQKR3l2LMoozWVxtMf7e/sJePxQlfyHr8K7C2tvAWRSUuMl3OrGkVHam7fzCrcx1iQCQUCcJnfz+oUwWz2DnlMfde81fik2RHtitqSCxj1MtW+xEoHZ5nDoNlTaLiPYHpIT1Qb7Rc0uLTwhWX3frNDns9JVECT9Tdw6g7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620422; c=relaxed/simple;
	bh=SCP/PwSChNMVWttCxouuAEa4tawnRcR8a7lMxmBepnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTs7dybBWEaSPCin6A1lIZMyBh8pFA5HvLxFSMU9/i+TdgauJYYvUxcqP3cf1NIB6Zro8rYvZQJZI9/lI3nJYoVZAcXjJRnOtjioWx1j/KdF40Yjz9EQq0xcGiCuGA/6i8fVLLT6Nif3Q8te2sw+NRcxu0RR2ZgZOqo039JdAoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQxQeWaa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQxQeWaa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3318298f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744620419; x=1745225219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwKDG6W8xKNbvB/TbUCZDLywQu+/SySWZsszpHukAAE=;
        b=cQxQeWaaFxRzDq9V2UJc0opu54Tj0aqSzKFNW01exw3AGvgjnSZ2M8nA8KDULYMfqJ
         y8PSvlI117C89Zmo/pUEXGicfQyHdM4mUmkdfyx9K5PgJcmmP2vTt2IQxw+bA8efNPTk
         r0ca9utmspep2sPthJrxMVIP0WIc2z2/XrpT8SqI5+9P9a1wQ2Vj8FGtMcQO8cLsPf2u
         JniEl2S+1E4gb08kEYvi16jCFGOyhGK5rqEQFcgTcuJ63rYWKzxBiSI21Ov10VJ53WHX
         hzxSrms4a+XtpbUwl/zePbYadgUW0slqxuX7vWswJw3uDL0jsqEFwFwO3kg58rURGEZx
         GZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620419; x=1745225219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwKDG6W8xKNbvB/TbUCZDLywQu+/SySWZsszpHukAAE=;
        b=CuGG0hoQdvXTW25AFSiVfq6GhKvR2AwDQzaAhsV1TXc8gB0ZQ0oBHnnRuy9RQJ/BR1
         apZS9g8+WcN1DSjEoH+vmaeWoZQ3zyxiTqdI16CIJZmtbplS4CGA7wy086AUEv4OAkf+
         6ZVHH5TiWGrhCTirS1EwGuqAX9GFAzUxl7rxzx/+YGfUkq6qzU5c9J9wXZZNIq5CvXrp
         fxx7o9pxC1bCG0hR3SOKD1tKORzMYdXpjQKII2S7Od2x4FF0VROz1lcVANA3SDzs9DxJ
         1ryB9ouUXd25tziVEaM5iqFFUfYSw1dhbQrc+4mn3FV6VpD9Y2kk45ZhdnceSm/icUJk
         4dxg==
X-Forwarded-Encrypted: i=1; AJvYcCVQwJBT7tI1kfQMwPuQ8SEkV0EmHZ9a+cL24vdFwlfnOrZ9Iy8f7LQ42iAu1NkmHYlEAyDKU7951qmw0C8Jrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJz7kwWyEWGlrhJxECbES1zJvVdFBP9gu/n84ZsCYdcQ3CSTHB
	pAHiFGD5al0NlKRz6KGAWXOotnNwOVI2k6On3FHTNE2Vzr8Fn1kDuLg5+1VVHW+NPjoqV4mcMeL
	i02GQCCgCGaq4sIbhzFNbaVtjWNV4FIusKbkK
X-Gm-Gg: ASbGnct/dH6YERq2fWbDtRPbWVhHX6IH7vjovzfXkwptvRuURfsKZNAg0X6ip4iJ/Hy
	1nJ1p7Uwj9fyuyZBfG3U/zL/mTZWatCUj+gkUSWE2rewvZtBn454niFv+XYF9NoCJtspKN9OnrD
	YhKKo8U4UJ9iG8uKxU+rkbi+yhtPA2FFkcSl+xi+iQqoownZWbbbw=
X-Google-Smtp-Source: AGHT+IHEvx7P61rJOTRerZ+a8pvfaZkJuUtapqSU6YjMcCwnJs4bOGlMqLM40z3t5trwgLUElMG5/bn+P/Y27+nuXxE=
X-Received: by 2002:a5d:5f96:0:b0:391:ba6:c069 with SMTP id
 ffacd0b85a97d-39eaaebeb38mr10081675f8f.44.1744620418562; Mon, 14 Apr 2025
 01:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org>
In-Reply-To: <20250413005650.1745894-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Apr 2025 10:46:46 +0200
X-Gm-Features: ATxdqUFTqJD6mmtLs5eNUuwhMNICFoxmw1G3Dh5Cn8tAVPlsl1viiSVgUFcLSxk
Message-ID: <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 2:57=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust kernel code is supposed to use the custom mapping of C FFI types,
> i.e. those from the `ffi` crate, rather than the ones coming from `core`.
>
> Thus, to minimize mistakes and to simplify the code everywhere, just
> provide them in the `kernel` prelude and ask in the Coding Guidelines
> to use them directly, i.e. as a single segment path.
>
> After this lands, we can start cleaning up the existing users.
>
> Ideally, we would use something like Clippy's `disallowed-types` to
> prevent the use of the `core` ones, but that one sees through aliases.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72kc4gzfieD-FjuWfELRDXX=
D2vLgPv4wqk3nt4pjdPQ=3Dqg@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Yes please!

>  Documentation/rust/coding-guidelines.rst | 17 +++++++++++++++++
>  rust/kernel/prelude.rs                   |  5 +++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rus=
t/coding-guidelines.rst
> index 27f2a7bb5a4a..d0bf0b3a058a 100644
> --- a/Documentation/rust/coding-guidelines.rst
> +++ b/Documentation/rust/coding-guidelines.rst
> @@ -191,6 +191,23 @@ or:
>         /// [`struct mutex`]: srctree/include/linux/mutex.h
>
>
> +C FFI types
> +-----------
> +
> +Rust kernel code does not use the C FFI types (such as ``c_char``) from
> +``core::ffi::*``. Instead, a custom mapping that matches properly the C =
types
> +used in the kernel is provided in the prelude, i.e. ``kernel::prelude::*=
``.
> +
> +These types (aliases) should generally be referred directly by their ide=
ntifier,
> +i.e. as a single segment path. For instance:
> +
> +.. code-block:: rust
> +
> +       fn f(p: *const c_char) -> c_int {
> +           // ...
> +       }

I wonder if it would make more sense to rephrase this section to first
say that rfl has type aliases for the C integer types called c_int and
so on, then mention that they are available in the prelude, and then
at the end of the section have a note that we don't use the type
aliases from core::ffi. I think focusing on how to use C integer
types, rather than technical details about how they are defined, is
more relevant for a reader who is just looking for coding guidelines.

Alice
