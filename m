Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4771990AE
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726732674; cv=none; b=GbEWIwdsnzTKwnDDMMt2xVpop8tgH0SWzubySuUmYzf60VzUEPBlAKT9iKVaJisUXFvSkmnu62lCjDyHR1oF1oE4Ye0yDEGyPiNtDJPNR3sFMLPMkxX+bJxddoiw50pUFpU/c6Y6rHLU67yLD4+5K8Hk/0HmhXgkk62sJSOx7/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726732674; c=relaxed/simple;
	bh=gtvvVhGi2BodgECS9/LLDjF6CRbdY/AYaJaNGE83ygU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj9PiX+1e/oGH75y64uFS7Ix1/eLErPB+rum5/H5I3LJkhfSr0L7B2zlNTssWl8AP9YwN7XamCVQPDMCaE4BoFq/BOx8v4MNzfAZJfJ6Ql7I56sAOCekYybbiOTKpwiomgXkXrUj6i41y0JRkYDE4RWfkkEUZ7YOH4fGXfFBwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WcnmV03R; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WcnmV03R"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1a80979028so592252276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1726732671; x=1727337471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmjzfzSOViupOA3GGnp9LMg51SfbNjXhfgtUuukyDgQ=;
        b=WcnmV03RmcUoCWzRVO6CtrxV4c3AFqHigbNEDOb1q+8CkxiElWzqJHXo00p9Olz8hi
         5Eke9f8mKzlC4wXrR2IQTgzb0K60OFpxMtBZMtwfcRIYb9XMwF1T1jWZUhbG209pmocp
         2uj/76oXdjzAhkxm7yPRTs3XrXfA4sk0RtNWifWKfBxPqTtxRDwLHV4J9UfEAvtoyz38
         CNQyiJ+PiR7Nr/9u0ekCqVm6Jmz/aGSklpBN9TgHhdJkQZu/62hJ1Y06m/rWd+AbAsWn
         bVAGUvttozw0uv1rYaxHXsjhU/L66DQ/Vbsx0idYYtGh7RNZVY2D6LmQZ/b+um22eE7Z
         ZQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732671; x=1727337471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmjzfzSOViupOA3GGnp9LMg51SfbNjXhfgtUuukyDgQ=;
        b=FzP8eqHFA9aHatGihK7Jl5OHd8PDFlgd7CAvuH+r5HCC4DXblDcFXxIzcucQMjBWvU
         iD/AXC3o7zzF1AoQyEMiJSr1yJ8AMt51k28zZXUr+0ObyANXMi995wJOt9pSHttq0h8C
         trOIT2QupczbnrybmP9kHrWpjYejQIW2ryZkfPRd2xBINJcBWqmK3kJXeCty0mMYXRrv
         p4xYLG7SPzegFAGJtwLn5YgdfR3mnqX2D4X42QNdeARMPXlI4DwP9Ex3Op2+80gJGj6E
         luKFndZ6hPPg5xbTQFKKctZe7pkTEQeWrlBWq6ZKS2R/UTIFZHhxnSb8EKX8YuiUJ6di
         9MPA==
X-Forwarded-Encrypted: i=1; AJvYcCV7w0nLHDginq0wbr3JX4vLp0UgY7Gmop7EdJBYOJHRHEcKsbEihf813Ip8C2xrA1Wb4ljZR4sJ2DR7cIS3Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxisJoUhROJ0KNvsHQkZxkdtrczSX0jt+WiCMmu19e7mlccKnAG
	+vR3Mh2wcrSpMGiXXRSEbEX/d0cYZO72yRMy6wNan1TUh78cb77UmODr7n/HFcZm4vRyJs+zoUW
	5AiaHsAYLvUM1ecAwns0GoLxjeoTz5hPEa8qF
X-Google-Smtp-Source: AGHT+IG43NCtgaW53OS7+PojKU/GXx7ck7PWExtnRut3+UcuubSUiadyEQxRVw5uBHaVL3DQ+b9ITlAJnOKiIS27EFQ=
X-Received: by 2002:a05:690c:6808:b0:6db:d5dd:af76 with SMTP id
 00721157ae682-6dbd5ddb9c2mr210170627b3.32.1726732671638; Thu, 19 Sep 2024
 00:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915-alice-file-v10-0-88484f7a3dcf@google.com> <20240915-alice-file-v10-4-88484f7a3dcf@google.com>
In-Reply-To: <20240915-alice-file-v10-4-88484f7a3dcf@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 19 Sep 2024 03:57:40 -0400
Message-ID: <CAHC9VhR+m5APSjS_CUO7i01RBrLoeuGC6q15cWaCELt-SPgwpw@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] rust: cred: add Rust abstraction for `struct cred`
To: Alice Ryhl <aliceryhl@google.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 10:31=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> Add a wrapper around `struct cred` called `Credential`, and provide
> functionality to get the `Credential` associated with a `File`.
>
> Rust Binder must check the credentials of processes when they attempt to
> perform various operations, and these checks usually take a
> `&Credential` as parameter. The security_binder_set_context_mgr function
> would be one example. This patch is necessary to access these security_*
> methods from Rust.
>
> This Rust abstraction makes the following assumptions about the C side:
> * `struct cred` is refcounted with `get_cred`/`put_cred`.
> * It's okay to transfer a `struct cred` across threads, that is, you do
>   not need to call `put_cred` on the same thread as where you called
>   `get_cred`.
> * The `euid` field of a `struct cred` never changes after
>   initialization.
> * The `f_cred` field of a `struct file` never changes after
>   initialization.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/cred.c             | 13 +++++++
>  rust/helpers/helpers.c          |  1 +
>  rust/kernel/cred.rs             | 76 +++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/fs/file.rs          | 13 +++++++
>  rust/kernel/lib.rs              |  1 +
>  6 files changed, 105 insertions(+)

Reviewed-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
