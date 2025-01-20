Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB32191F6A
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363075; cv=none; b=SlIYf0S6ig3a0hrAom+B4AGl4sd0TUjAC9NdeKxmF8mnwMrI+ZzpjiupnXTK/+bccRMEr6YSwEeGHBntMYBlehqL5+Cp2J9rbMvvmYw/BW+G6N03LrpfZcbEDfFgrHcZuVyiHit2er4B8FEtMoiRdlYG6CjScM5O3NjPy0adrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363075; c=relaxed/simple;
	bh=q3wz/zLt56fV05sLq3d7xJVTvIqrtwtpoONaYT1dTHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRLRYwGzRBEk6XStoyJyM7PxgYaxckE25thgPPpJDsEwFR6LYRbGcSFuUjngA1sKqQOIuutu9u0vPbJqS8L7cpV6I5zX/gC92Lb5TVZ/PAZzuXIvrI08YPfgjKgdhVej+MQzYJW1xjYqVTTzH2XszSsy7mJ14xstdc6LRZN9glU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xkBzg7X1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xkBzg7X1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3381469f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737363071; x=1737967871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1ciMtC83Vt0GLt7AXexb1wk/CfmZxIbhA8/8/2+sAw=;
        b=xkBzg7X1l8Mq3Y7BL9EWXwD9NNqWvrq57in2Ew+XdlsoshOsMc4En97UWrYJwJLtsL
         TiM1ubSIOTxRbnK+ZJQ42tKHfyFFmt62Gi+bRMIzWdfSg/dsWOEIva6+Z+KrilRk61ny
         dXAFInN5OOMknvdjmNag/LgO9Yle0K/fG7G2exaXuHOZn5kkN8bSw9FDMBUMtuDiQCaI
         +A5ACRKXM9al74p83/HsOcGtbe2PYr483qjjAoGrAo2kY5y1dm01mheqlroRcTU/4Hoe
         xlpSMoJ77lSRiivWaY9I0XJ8UGU24aoRXUEX51ohhnFm6q3OC40QFqIiK6n+ZKQ8kpiu
         FQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363071; x=1737967871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1ciMtC83Vt0GLt7AXexb1wk/CfmZxIbhA8/8/2+sAw=;
        b=H+gJ59VPMSHIDRggs7xpHmT3e910Y9EsopYQkSaYKVpGqE2iezfHH2KXvwkvxBZHvz
         VjnkjsOiJsNQI8FEa446ZC7TLkbfE372l7LB7q48I5A1q6m8oWgpkvFE41DW7ScTfAvl
         tyakgmYFfCODieZbxAJIEDnLGZPxX4NBQCoBkWYkLlzJbr3ZFl2AdBnpkncyE2h31e45
         /UOzOXibKZOKmJqUwQT1LVsYf4+a10n64nxjJXplWo0RF3m1ugmIBLGjJtKG4+MxeQ+G
         zwiuxqYHDRvstR7cs2CMmofcD5jangw62lBBQKQey+hVCbh8QKfGW1tzc6QJYBlnUgKA
         j9nQ==
X-Gm-Message-State: AOJu0Yw2O7GIzj8KdTBoCib/qkbP6TdvNEcL6nbK09SQMC4VN3Nry+fo
	/8l75HpDBMTfmnXqaLOaBz274ZmIBSkror7L7K1CPCN/bOhSa8Sg07HZ8ed1b3LZvNAHuIFOUqV
	euqLtR66vdQetJvZAdU2bRYOoHIgrOu2sJGxi
X-Gm-Gg: ASbGncsoNuAw8TzfvliEQp6WkT07sqlACwFTKcz0AGd79u2AgELZX0nK5TaxiXR1hDT
	GxqW6ac1e73vdHPyDIQ/v0KdGfCrW/fjwFw6aiMkp5xmV4URySSAG2uA1611Wk7tSm5krX2dC+e
	OYQmDCMA==
X-Google-Smtp-Source: AGHT+IFpHLYRgWpslYCzCgoauL1YQlolo8dKVTwJyZjCrhm8O7khYuXCFZYfZ9Dxs+LwUG1zbQBG+htPLiKCdm31jLo=
X-Received: by 2002:a05:6000:1faa:b0:38b:f04c:25e6 with SMTP id
 ffacd0b85a97d-38bf56626d4mr11917040f8f.14.1737363071490; Mon, 20 Jan 2025
 00:51:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120054846.3880395-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250120054846.3880395-1-dirk.behme@de.bosch.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 Jan 2025 09:50:59 +0100
X-Gm-Features: AbW1kvaBAEcd0soMG0Z5t5q_bGjYHTzFw1y7qwhREBRzcgyzOaaH5-P_7QZm99s
Message-ID: <CAH5fLgjkTpg=g=KHyw--XCqNq6M6wGFKr5t36DFYqn9HK8Lxiw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 6:49=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
>
> While at it fix one missing `Result` link in the existing documentation.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>
> Changes in v3:
>  * Slight rephrase regarding panic() vs BUG(), whitespace and
>    newline fixes, use srctree/ syntax, add Rust reference link
>    for Result(), evaluate the result of the examples etc. (Miguel)
>
> Changes in v2:
>  * Improve the linkage (Daniel & Alice)
>  * Reformat the examples, add if let, drop "automatically",
>    call the example(), improve the formatting, etc (Miguel)
>
>  rust/kernel/error.rs | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 0b01975c2286c..cb5b5fbfd3266 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -254,8 +254,133 @@ fn from(e: core::convert::Infallible) -> Error {
>  /// [`Error`] as its error type.
>  ///
>  /// Note that even if a function does not return anything when it succee=
ds,
> -/// it should still be modeled as returning a `Result` rather than
> +/// it should still be modeled as returning a [`Result`] rather than
>  /// just an [`Error`].
> +///
> +/// Calling a function that returns [`Result`] needs the caller to handl=
e
> +/// the returned [`Result`].
> +///
> +/// This can be done "manually" by using [`match`]. Using [`match`] to d=
ecode
> +/// the [`Result`] is similar to C where all the return value decoding a=
nd the
> +/// error handling is done explicitly by writing handling code for each
> +/// error to cover. Using [`match`] the error and success handling can b=
e
> +/// implemented in all detail as required. For example (inspired by
> +/// [samples/rust/rust_minimal.rs]):
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///
> +///     match numbers.push(72, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 72: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     match numbers.push(108, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 108: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     match numbers.push(200, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 200: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// An alternative to be more concise is the [`if let`] syntax:
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///
> +///     if let Err(e) =3D numbers.push(72, GFP_KERNEL) {
> +///         pr_err!("Error pushing 72: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     if let Err(e) =3D numbers.push(108, GFP_KERNEL) {
> +///         pr_err!("Error pushing 108: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     if let Err(e) =3D numbers.push(200, GFP_KERNEL) {
> +///         pr_err!("Error pushing 200: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator or
> +/// [`unwrap()`](Result::unwrap)/[`expect()`](Result::expect) can be use=
d to
> +/// handle the [`Result`]. However, in the kernel context, the usage of
> +/// [`unwrap()`](Result::unwrap) or [`expect()`](Result::expect) has a s=
ide
> +/// effect which is often not wanted: They trigger a Rust [`panic`], whi=
ch
> +/// may destabilize a system or entirely break it as a result -- just li=
ke
> +/// the C [`BUG()`] macro. These methods should be *avoided* unless one =
has a
> +/// very good reason:
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///     // Each of the following `expect()` calls may panic.
> +///     numbers.push(72, GFP_KERNEL).expect("Error pushing 72");
> +///     numbers.push(108, GFP_KERNEL).expect("Error pushing 108");
> +///     numbers.push(200, GFP_KERNEL).expect("Error pushing 200");
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```

I'm thinking that it would make sense to remove this example. Instead,
I would have a paragraph like this *below* the question-mark example:

Another possibility is to call `unwrap()` or `expect()`. However, use
of these functions is heavily discouraged in the kernel because they
trigger a kernel panic if an error happens. Please see the
documentation for the C macro `BUG()` for guidance on when to use
these functions.

Alice
