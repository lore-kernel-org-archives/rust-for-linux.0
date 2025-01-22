Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8A186A
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537476; cv=none; b=Ra0dO0wsv+owDfMv2IGQi02X9h3iaF9wzWPb0LWeqpYLmV4CcBUr0FsyNQ6iLaspQOAYw66zkCQxGZ/66VILWQW4cYsrRLYAsN+hqRJE0nlYzxLBGYyH7SSUv6fwy3QUwBNG/fz+tVoPNxBR5zMRqPeu74iw7F1r3Gb4eCJqgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537476; c=relaxed/simple;
	bh=BxQMNnrcxqDPPa69ezm7p/HfZln9l3wGKmgif7LAeVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3pKz/Sbcij2vsUdHQHEGf+JQ85vG6nGr3C0lbWJTymMWcz1JXjj+zg6igQp0AT9sOJShzB5EzrthPjhL62El67Ir0NrI7vTI+rOWkr3ohlA/Zce6xD+Zsa/tQi3UIFUAHF6m/IUWwqWqAbRvszINzX/bkMc7SuqiG//dvyEzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MBaRRqO0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MBaRRqO0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283dedso68176305e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737537472; x=1738142272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUCXjZSrG4M8TjwRKwXvZ/dB2DAItTAhZ7D76lbVl5c=;
        b=MBaRRqO06vqVBYPOzgfLnhU4RxG/AdSV6dPgtS2qQLahnIT82sPPVm9Utq09hGt+4L
         Cb7sLzcZcj3si467VBPrVU6yhtdy1WDIxUYMxZjeMsUrgbtg5kxkvDQaGrulUBpD9qet
         4CbgaiwFZhBnq9Xle9l5/Ri3xE1BRczRbup5hhCwk5HppAmn7x6zSluHbRD3LLdo7LyP
         d822/AoybmafKFtaKyHboKGW3Uv2/jtshm44OIhpzJTOTeaSAK+BiJSZn2ByJiZ5DpHw
         2YaNNskrc3lMvdBJ9ZJx2r7tvInpQpboEHlk26AlD0LTo1+5R1Lvdrnh3/pm8v2YFBnM
         bHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537472; x=1738142272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUCXjZSrG4M8TjwRKwXvZ/dB2DAItTAhZ7D76lbVl5c=;
        b=wBHMJGgVGtikyb1EDtm14n37yI7wUpihPZIkm7a2oUAvdQ3odBVdF+dqIgtyMzdMAC
         hRkRgAvT0g4JoD97N6s+HZpTO+UtExD92NCCVqRjb09YFXXlC5cEA2pN8TfAvvuBJoTz
         ZxoWlsQFhl7CtzrtRqlon5SwqBFHjsyB6OEe++P/xiS3aEJFWXH1TviodLnFp06o5cps
         de6tdSH7JaWjtS8oonMMB5J0IQFNpLWeKd5Nc3V0EG2vo8SAA8+XTgAFZgPbJoSfNvcF
         vizvssures0E7VPBS5RDulwAvHRsDRZnCpXb7gcppUgWedVE9XRuRqlKvFs7QEt3nReH
         MiSg==
X-Gm-Message-State: AOJu0Yx1BL5X1HomGZ2Jh46FhcFa8tyUIdVMluwBAOfX6I2imFSI8KwV
	EUQd00QLCP9/pFe5x2N+cYE3uvUCaFfN1ac1PJ3fn97JvdtYy5K0MYhPI8/oWmTb79AP6pjvCLj
	VLEJVljmj2Suv71pBZnhlvOhd4tsURpCTQqyI
X-Gm-Gg: ASbGncucehHH8IRNAJqCn/Ty90W1mcO5hnoqctcpEMDaqfN2ZoGmoPNOIvVhorBzjoJ
	0sFoyNrSzYFtwGdzgIBrfIJaHl2dgjgvo4p6j1QOMp8G/ZitLeqhUGPGkQHMDBmQ8hg/CZHrCFx
	XZ/lRS
X-Google-Smtp-Source: AGHT+IE3cMbVskvv2xLB/zglVaB17DAjmrlOjjTRUC06gU91lH9O9j0mggl+F3z+EdBYOBSHCMciTtvk2IoqSMTVCik=
X-Received: by 2002:a5d:64a1:0:b0:385:f7d9:99f5 with SMTP id
 ffacd0b85a97d-38bf57d3813mr23054153f8f.51.1737537472271; Wed, 22 Jan 2025
 01:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250122054719.595878-1-dirk.behme@de.bosch.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 10:17:40 +0100
X-Gm-Features: AbW1kvbKenvmJodnMh4wmRzQcSErYJW3BSg544FHuOfblrkattPPcvpXuRXJXOk
Message-ID: <CAH5fLggwj6oazuXRFP6by39U-7EhQ3kQnfmAMksV-dbma_UbQA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 6:47=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
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
> Changes in v4:
>  * Drop the expect() example and put the slightly rephrased
>    unwrap()/expect() description below the ?-operator example
>    (Alice & Miguel)
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
>  rust/kernel/error.rs | 113 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 112 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 0b01975c2286c..b4e59feb17a7f 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -254,8 +254,119 @@ fn from(e: core::convert::Infallible) -> Error {
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
> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator can
> +/// be used to handle the [`Result`]. Using the [`?`]-operator is often
> +/// the best choice to handle [`Result`] in a non-verbose way as done in
> +/// [samples/rust/rust_minimal.rs]:
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///     numbers.push(72, GFP_KERNEL)?;
> +///     numbers.push(108, GFP_KERNEL)?;
> +///     numbers.push(200, GFP_KERNEL)?;
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +/// Another possibility is to call [`unwrap()`](Result::unwrap) or
> +/// [`expect()`](Result::expect). However, use of these functions is
> +/// *heavily discouraged* in the kernel because they trigger a Rust
> +/// [`panic`] if an error happens, which may destabilize the system or
> +/// entirely break it as a result -- just like the C [`BUG()`] macro.
> +/// Please see the documentation for the C macro [`BUG()`] for guidance
> +/// on when to use these functions. Alternatively, depending on the use
> +/// case, using [`unwrap_or()`](Result::unwrap_or),
> +/// [`unwrap_or_else()`](Result::unwrap_or_else),
> +/// [`unwrap_or_default()`](Result::unwrap_or_default) or
> +/// [`unwrap_unchecked()`](Result::unwrap_unchecked) might be an option,=
 as well.

This sounds like unwrap_or() and friends are just as bad as unwrap(),
but in reality they aren't since they don't panic. Maybe a paragraph
break could be nice?

Otherwise looks good!

Alice
