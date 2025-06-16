Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5C2BEFED
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107820; cv=none; b=kPbvMlc4HP54mTmF2k5yG0+a8UFxxhzXi1+RWB8RbXx5Nalh40whjr9fm6MdbxBF5bBn9HJeBGogSpmlWQwhKBkyIIpZqHAi4XPE4ytG1605Hi3VkNtRP/YTuSK7N8+0cyEk+laqNGJxMNiQRpdST6/MFpV8/U88yu+89+h7k5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107820; c=relaxed/simple;
	bh=uUkgdB8/TFstAJ8wR8gkxVHWH3FJl9zJNcLpUcl8dSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vB6F6PMFp+YEZUt0mJDGfUOb5gJw2T9TiRD30QreV5zxETSDsFtyVAXDmSEBOEViT4c5Gse0RW8kbZWE5NhgZGrDzcttHtjh0wU6RdZFYKOPoQaeWDepBUqjcQQTo41SWp9h1h0J/g8dS6jPfh/kMw0QqY1KB7dFB8r4KtiCCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnaVk6IG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnaVk6IG"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313067339e9so848530a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750107818; x=1750712618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zDNnuQm2TcxTY1rsGySRVuXqTcya0AXP1FxE2TbtlI=;
        b=VnaVk6IGZV3CbiK5KAYp+XE0CBII6I1SVzEmJJQ+LTxSfokVnhFpTSC2C3Enwr1j7i
         aA3qM9k/j7Mf4ApruUZwk5X4MNEnDPsySSrcEvLjKEH7bmx7XQzr3MUGns4/9GUyw+Nk
         V1DVi9PHKLgUqYrRs0XuqVFAa501NEXbV+XBmIEkv1fWgcecq3Z/EvVwAUsyT6SUM/EO
         RrJm19nzE7L9VA0vbjuXc0cf/iHLaMVcQy/wBsU9rp/S+nemdrpSq9hZd9O8J/mn2tTj
         kZGL6YYzvNMEsZM7uXgGOhEOQY8xHJMYjb3TrkGa0rwD2WKOfRg8v5URTIAqFX5Ra4sg
         Izzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107818; x=1750712618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zDNnuQm2TcxTY1rsGySRVuXqTcya0AXP1FxE2TbtlI=;
        b=S/8+kXQEZyifpMvLpE3g0a0LQyPEXhIwoJIR9ummmqE680lPlxhq10XctK0wxF63TH
         uQO0y2O3uBZ1EX2vDBkKlKLR3OzESPDpnH/rYw9KI89S9puLwQEs532mUHmMGrBDZyQx
         9PzEXOt8oHDacBCD9uJt7dR4RbsDaNMUifnp70KcEJl/1yRycVL4fwCBgBILBfqUMYGZ
         txsI8+YAfOyh7vpxB0jkNvl7FRLCFwVCM4dqIxrzT8zmd24LLQmVlXWIbIt3P/i8EQm1
         Tzykc/LvJs9Bg87QKseHzFkNUu8JGuPkVLM3YK7VbfQl91YosjHTH/dO2EN2YgtEqB6I
         gdvA==
X-Forwarded-Encrypted: i=1; AJvYcCUsj3Nubf8KVjcUnA8e2bIZm63QHpboztwdY8I7yVLXFelfLQY1jrKxhJ/5IBYU/UV30WnDUS6uZwfdpYESRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVuNTzGA7mHksTsVCLTWUjGu+FH7lP3IxThYvyzUZeOH1UTG4K
	7YduALXmAwMaOz8F4NlDjut4XIXCTjtKJygGXnrEQNvs4cvylyynNL4j4W7qetutEg2VEIGXpV3
	TFU3hi8rjkGxEE3pmCp3bWrBsTBbTuN8=
X-Gm-Gg: ASbGncsgF6ENCNuiZehdUATLCYGOXpX+IMFTecBLwNnuDmK5BN5Qz5ZpL5qQreWeIPx
	7nJcPNACID/hC+SSsCIDJ71lvQFvyL+yX4J1qAoENNxFoI6imOeW1Sc8RA8nr5smQdT+MO27naR
	YbIFw54PTXgiFl6b5vYr08GUToTvB3vq8HbUcZ6H67gOE=
X-Google-Smtp-Source: AGHT+IGlk6MSdzNsOB9jo7hLHSNpDqSNdXmLMdOo96I0GP4tFzjeC6YsXxsJKjreEhGyi8XXXcPyxMTe1D4T99TFMWs=
X-Received: by 2002:a17:90b:17c6:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-313f1befa77mr6102965a91.1.1750107818140; Mon, 16 Jun 2025
 14:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616193433.2643407-1-ttabi@nvidia.com>
In-Reply-To: <20250616193433.2643407-1-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 23:03:26 +0200
X-Gm-Features: AX0GCFvlEyPm0clVqHf-P6yCB8fIK0S4qZgBtaZwRy7CIwruqTMpCQsCULMNwkI
Message-ID: <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:35=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +/// use kernel::sfile;

I would hide this line (`/// # use ...`) -- when it is just a single
`use` importing the thing that we are giving an example for, then it
does not add much.

> +/// pr_err!("{}:{}\n", sfile!(), line!());

Maybe add a comment in a new, previous line showing what output this
line could give, e.g.

    /// Output: ...

> +/// const SFILE: &'static str =3D sfile!();

Another comment (and an empty line to separate between the previous
case) to mention what `SFILE` could contain would be nice too.

Or, perhaps even better, since they are really separate examples with
a comment each, you could put the explanation outside the code.

Also perhaps consider if showing the `SFILE` first would look better.
If not, then "Useful for succinct logging purposes." could perhaps be
moved as part of the `pr_err` one since it would be the first anyway.

Anyway, it is not a big deal either way.

> +#[macro_export]
> +macro_rules! sfile {
> +    () =3D> {{
> +        const {

Could we avoid the double block?

> +            const FILE: &str =3D core::file!();

`::core`, same below.

> +            // [`.as_bytes()`] does not support non-ASCII filenames

I appreciate that you tried to use an intra-doc link, and one
long-term wish of mine is to have those work even in comments for
source-views and IDEs, but currently we don't use them in normal
comments (we do use the code span).

Anyway, is the comment right? There is no `as_bytes()` call here --
what does support ASCII only is our `rfind`, right?

> +            let start =3D match ::kernel::str::rfind_const(FILE, '/') {
> +                Some(slash) =3D> slash + 1,
> +                None =3D> 0,
> +            };
> +            let end =3D match ::kernel::str::rfind_const(FILE, '.') {
> +                Some(dot) =3D> dot,
> +                None =3D> FILE.len(),
> +            };

I wonder if we should just panic if they are not found. Maybe I am not
creative enough, but do you have in mind a use case for either?

We already remove some cases anyway with the `assert!` below, so it is
not usable in every case anyway.

> +            // The following code the equivalent of &FILE[start..start+l=
en],
> +            // except that it allows for const contexts.  For example,

This seems strangely worded: missing "is" and it probably should be
"except that it is allowed in const contexts". I would remove the
example, too.

> +            let ptr: *const u8 =3D unsafe { base_ptr.add(start) };

Benno: do you want here (and above) qualified calls too? (I would move
everything to a `const fn` though -- please see below)

I would just call both pointers `p`, by the way. No need to keep the
base one around.

> +            // that FILE is ASCII (via is_ascii() above).

`FILE`, `is_ascii()`

> +/// Returns the index of the last occurrence of `needle` in `haystack`, =
or None.

[`None`]

> +/// use kernel::print::rfind_const;

Consider hiding this one too.

> +/// let l =3D rfind_const("when will then be now?", 'l');
> +/// assert!(l =3D=3D Some(8));

Please add an example for the `None` case too.

Finally, should we put most of this logic in a `const fn` too for the
usual benefits (docs and tests)? Then the macro would just be
essentially a const `basename(file!())` call, possibly fallible, and
you can even avoid having all those qualified calls :)

Thanks!

Cheers,
Miguel
