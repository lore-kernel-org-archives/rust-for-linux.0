Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329B1E49F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613596; cv=none; b=etfyti0yav38074k94S3r2s6/6XI9QbAJOwiOUBasU+kXUJOXNHONMU1Ll3nn6qv3srBd+IFbMuAw956FBx4DfUkpasg9CMjClnA0yNRixfDz9EHTcjqCSeuxoFqapbqPADya3M7K1MDHOQmlA2oR58sD33PUg+SDeLcqCvRinc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613596; c=relaxed/simple;
	bh=eEOKo4cBI/JzkZVIZaGvLfJVEOici9CHyhu7J6mkV1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKi/eUwhLJw/4uwdfhBRjD/Kwo1JgsAt3wN5U6t8NLyG2djFoEAixTuary4KqSpt29gWlllC0CcXzxjuK4YqJwrPWpKiJlqkN81XgH7ya8yGlukd9GMK1jtfno1DrV21SXyD9hMgK5AIddIowzkmd2soiBagKg4U4yP+5cQj3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gim5rkF2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gim5rkF2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso1198677a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741613594; x=1742218394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKwgO0jNPQi/eubJtcD1PwRwbNX29Yf5A4z90NbdZkg=;
        b=gim5rkF2FKiFqhFcYhCRcb6JKa3yt8u17fTi6NNsegUt0WoanSdjRFSqmx+9RA/Cj6
         wBl2ynbRIp5bxG4KSa94ao7AnEAjsadJXLLm5enGR83NDyFvxWvU7oDtcofss96PF0Wm
         ZBQjbegxdcgBx+1wLuwTcUp7vOx5rHq3FD0+q+yTobLMeqF2Z+uXeJ6SZHo9OhmhZVAW
         g2jerNYLuzJ9egMum3O368+oBUFWv3gMDZ3BOv93ZY+o7QnsOOh5CQuDawc3OF/+AshC
         7Rpj7aaxs7P6Utx2fiOdYrbQQRKk3PdeL+lhO/SxGSieeOlSlaMOAoZrnvIx5azxYtM5
         gn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613594; x=1742218394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKwgO0jNPQi/eubJtcD1PwRwbNX29Yf5A4z90NbdZkg=;
        b=F6dpAcdqagrb81nLiDdFm56H+UZCCnRUSL7js1o8rRrRg2aR7heDy8DD0G2Mhdhc8G
         4lw+QpeDCX18QL/D+SrKBO77sNj1Vr8CrD2Z4oQLteiG+gNLKqZe3PxMMlXOZKODGJrG
         j/qQQFc0YJmkZJhG0XMkodzx5xxo5Yb1R95vpWfTlUF2Ez4ULXkKH1vNyB7UHdEY2ozI
         bQpIY9Zm4ksC7ZyZL4vdBV0rbXvo6Nv5MHNw+qJ2WsQTEWb0b0nkGA5o6Pf6N/Drwwzq
         8V0AA69O7A1C2V2tUoEry+5ECBQvLHNZ0CRcd0M88K1CJpYfOtGOUCIDNPkNpw+Goz6E
         DTfA==
X-Forwarded-Encrypted: i=1; AJvYcCXbzUQlx2SD2NXOc2AO1s8hXEUtmXjNiWnSFteakXNFrlvlLjEHF4ybao+9PyUTyAqd6/I1A7QLF+e/XYDqzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bVbUN8zuYw1BqBg+IG5UdGw/62U9BGiCK+EqVrqNLoLUjWuP
	azwdhObT2B10xqIAW20ESFul5/XxQM8BRCFVujab6Q3j2n8ZXt4ZT9ih19Kr0So17z0gzZhJAPs
	ZLFDLY55VUl9RkMyfL6FZGy7EZNc=
X-Gm-Gg: ASbGncvJgMYTcEEV/v38eBtiPDYjQ62epZ5mKyiB0CRapYLvMRl/gLeIZOc8jmY0SBt
	PD9LaVHzElwZ1gk6AaakUgMOtT9Ga95PsJ3uZOdk4LMLEirHqUQ6VZWhmUeexNuTX8hnDFg0XPo
	piwZksq2ZGnViM4xb5kcC+/t+gDA==
X-Google-Smtp-Source: AGHT+IEui4qHhDQ5kXgL7TdCFDNER2tT8O1tTfc2licK++llTEKVwNnJVOwVahgIX+gRkbsYGlpU61XxQZhoOo/i1Q4=
X-Received: by 2002:a17:90b:38c1:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-300a57a82dcmr5450620a91.7.1741613593811; Mon, 10 Mar 2025
 06:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 14:33:00 +0100
X-Gm-Features: AQ5f1JrorznLYuz6dUcfVpx4YEP40nXc0GNUN4NmxdlkahNZ9jewP7I9y3UXX_o
Message-ID: <CANiq72nKv2-6ePwopq4UXtV-a8UE_G5afdQRirgn60mF8iwq_w@mail.gmail.com>
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Filipe,

Some quick nits (which some may not apply to the new version depending
on what you decide to do with the operators).

On Tue, Mar 4, 2025 at 1:55=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>
> for bitAnd, bitOr, contains and etc.

If this refers to the `ops`, then should it be `BitAnd` etc.?

> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and VideoCodecs.

The link to Zulip is great -- perhaps a concrete use case shown (e.g.
as a second patch even if not intended to be applied) or just as a
small example here would be nice (not a blocker, though!).

> +//! Bitmask utilities for working with flags in Rust.

I would remove "in Rust".

> +/// - Implementations of common bitwise operations (`BitOr`, `BitAnd`, e=
tc.).

Intra-doc links where possible.

> +/// ```

Newline before code block.

> +/// bitmask!(Permissions, Permission, u32);

Could we avoid having to provide two identifiers somehow, e.g. `paste!`?

> +/// // Define some individual permissions

Period at the end of comments.

> +/// assert!(read_write.contains(READ));   // READ is set
> +/// assert!(read_write.contains(WRITE));  // WRITE is set
> +/// assert!(!read_write.contains(EXECUTE)); // EXECUTE is not set

The alignment on the comments is strange (in general, we do not do
comments on the right side of code).

I would probably just remove them though -- the asserts are clear
enough on their own.

> +/// // Inverting permissions with negation (`-`)
> +/// let negated =3D -read_only;
> +/// assert!(negated.contains(WRITE)); // Previously unset bits are now s=
et

Hmm... why did you pick `-` for bitwise negation? C uses `~`, Rust uses `!`=
.

Also, I would use an `assert!` here for every bit (also for the xor
above), like in the cases above, so that it is more clear and since
this doubles as a KUnit test.

> +        #[allow(missing_docs)]

Can it be `expect` instead?

> +            /// Returns an empty instance of <type> where no flags are s=
et.

Please use Markdown where possible, e.g. `type`.

>  pub use ffi;
>
> +pub mod bitmask;
> +
>  pub mod alloc;

Why is it on its own? i.e. it is best to put it in the `pub mod` block.

Thanks for the patch!

Cheers,
Miguel
