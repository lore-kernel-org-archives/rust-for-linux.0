Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D101E573B
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252229; cv=none; b=rU5UwGSkOTnYr6gtoR10QoBzxVIeXQN+xWyP1ek5+G6jKjqIG+Jp2bs9Pgqbdplli+3I21snMDZaj6s92kt9kNGoTRwDEzoNgIjbVqUSIvxeSmlr1FsXFbmuCpvrhRk+l5j76m3ZFXHDTPRRgNzd6jplVzvqgAby3Gu7W/2xVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252229; c=relaxed/simple;
	bh=G1JCwR9qMpN1PxssOULWW2igW++7xPDc2KRG+aLKRC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpeQp8f4wqDG/a5dIVFCev6FSB2K5Jwgh2ovUW+2hZG/8jXOnTjMzU7Shg3neSBxC7mpZL+gLYDkig2a56smXLYNt6la2iR3P2mmi7D5LymwWLo9sldANvFSCbiWI+KZK5BYwE1ZwO1MEQTBw132stGJgmuYb+Y8CnuSoeyqXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=RutrOJEg; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="RutrOJEg"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso8799146a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 04:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1736252221; x=1736857021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CF561VlOSiL45XoXnHAx0DtRlmRycoi8Ag2n8MXUS0=;
        b=RutrOJEg6ppdXJpGUTMpSqdfwCftzBzDA2nTWMbEEHBpQauxDTzstuVOLewlaaNznA
         00Fqm1ZLb2mrQwOZ8Zvx0sr8lRyBJrecFLf1z2JDDPplG7A1O3hPBDUZNiNwcULXLXPO
         opcz/5jyx6sf9EyeyJNDDDdtc08Vauw9+/qDq63gE16VNvbmel3aFmAq6PyTfH38nQZQ
         2kCQRGw8H0e5abbNtAi2ds1dqZPMfIlqvHP8xfBM2DOwcGupucpIGnyqGOdF6l0bgY+h
         9sP8MiiyDt36Vw3aVCKEM+yO1Hvp30ngmc/Tt++wdnbFGA+lI8Dik9J+pgJD5Mi6hKk2
         I2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252221; x=1736857021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CF561VlOSiL45XoXnHAx0DtRlmRycoi8Ag2n8MXUS0=;
        b=onkMonzQ3cea9xyMdtO573AboLsV948MfFz2ObvEzBMSgAJTRSrl2wBQhsKkXoQP5y
         fFboZy9cive8JuMZaQawycAYVjG9jm6bMVYAgJiPyBWKVNpkbmh6AxP+5T67PepLGJGT
         mUIj00edJA6GpETMbygI9ugTo3j6AQtk9l7vrODGJC7Rn+8A0LDvrAXTpkuI3CKj6OGL
         5tmrqUnWMd2vteRCtsskXKYBAHo/isOSpAn/BLfKh7xQHlxFqvAQLMkCBl7qdTDB48XJ
         z+vWS8U82GQkQRyL0SS+8oEqcBcaNEyEssMc2e5tOjbVZSZ8lkIYSN3OCGFsJhO9u6NZ
         kHLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5iO++JEKrAXWejJm/vqw3jz2Vb3vB5j8YZqovcgyJ3wI8CwyuPYefIMNx5eXxpvd5x5yKZIdFMNfV6QVsQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqDstOmXUrabPICxrsGfx3SlVdVQMfQczxEM/tSUeMDLj1B4W
	HZTGfvwvXsJ7056GOrSFLUErhfaZIDxp37oyvBG4ets07VZZnOe/XSZDkeXegg/wCMHBGehiX/v
	Z
X-Gm-Gg: ASbGncsf246R2M+N+FrJzlMYfBELes+JWG9wph4d1LMQH4YMRB3o5TyCB4HP6D1W5Jb
	VRLC6rPR+96fdoJAz2OikZttip5GHNOKY1FkkVkBjYbsgQGDH0Ahp8InsDeFsOnBQp8Pt+wHPxm
	5jAPOyJ/5kpf805HhhvwNru8bXnJ1y2lEx7OcxKqFXqYGcdxJLLysXAdJf12uapiA4KKBDygDpP
	M3BCA8BbykDTOdYciCQo3kG1bBS19kDtUw+v+sPDvmH9s5ScBetr3xXdhqAivxTxcOEwmG94phX
	6Z+4
X-Google-Smtp-Source: AGHT+IHwjCXKK7ZBfL5Mj1sTdvG4AB107J2/wpcZzE8pe+DidCOE8NNLupzoTERXKMqJ1/EiqN5t5Q==
X-Received: by 2002:a05:6402:3204:b0:5d0:c801:560 with SMTP id 4fb4d7f45d1cf-5d81ddb3aacmr59344228a12.20.1736252220884;
        Tue, 07 Jan 2025 04:17:00 -0800 (PST)
Received: from [10.26.3.151] (gumitek-2.superhosting.cz. [80.250.18.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbd0sm24914669a12.55.2025.01.07.04.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:17:00 -0800 (PST)
Message-ID: <75dab379-af4b-4591-ba84-3807918c6e8f@sedlak.dev>
Date: Tue, 7 Jan 2025 13:16:59 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org
References: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
 <20250107062134.2981602-2-dirk.behme@de.bosch.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250107062134.2981602-2-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/7/25 7:21 AM, Dirk Behme wrote:
> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
> 
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>   rust/kernel/error.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 0b01975c2286c..456487d4a8ed8 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -256,6 +256,72 @@ fn from(e: core::convert::Infallible) -> Error {
>   /// Note that even if a function does not return anything when it succeeds,
>   /// it should still be modeled as returning a `Result` rather than
>   /// just an [`Error`].
> +///
> +/// Calling a function that returns [`Result`] needs the caller to handle
> +/// the returned [`Result`].
> +///
> +/// This can be done "manually" by using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
> +/// Using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html) to decode
> +/// the [`Result`] is similar to C where all the return value decoding and the
> +/// error handling is done explicitly by writing handling code for each
> +/// error to cover. Using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
> +/// the error and success handling can be implemented in all detail as required.
> +/// For example (inspired by [samples/rust/rust_minimal.rs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs)):
> +/// ```
> +/// fn example () -> Result {
> +///     let mut numbers = KVec::new();
> +///     match numbers.push(72, GFP_KERNEL) {
> +///         Err(e) => {pr_err!("Error pushing 72: {:?}", e); return Err(e.into());},
> +///         Ok(()) => (), // Do nothing, continue
> +///     }
> +///     match numbers.push(108, GFP_KERNEL){
> +///         Err(e) => {pr_err!("Error pushing 108: {:?}", e); return Err(e.into());},
> +///         Ok(()) => (), // Do nothing, continue
> +///     }
> +///     match numbers.push(200, GFP_KERNEL){
> +///         Err(e) => {pr_err!("Error pushing 200: {:?}", e); return Err(e.into());},
> +///         Ok(()) => (), // Do nothing, continue
> +///     }
> +///     Ok(())
> +/// }
> +/// ```
> +/// Instead of the verbose [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
> +/// the [`?`](https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator)-operator
> +/// or [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap)/
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect)
> +/// can be used to handle the [`Result`] "automatically". However, in the kernel
> +/// context, the usage of [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap) or
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect) has a side effect which is often
> +/// not wanted: The [`panic`](https://docs.kernel.org/driver-api/basics.html#c.panic) called when using
> +/// [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap) or
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect). While the
> +/// console output from [`panic`](https://docs.kernel.org/driver-api/basics.html#c.panic) is
> +/// nice and quite helpful for debugging the error, stopping the whole Linux system due to the kernel
> +/// panic is often **not** desired:
> +/// ```
> +/// fn example () -> Result {
> +///     let mut numbers = KVec::new();
> +///     numbers.push(72, GFP_KERNEL).expect("Error pushing 72"); // Panics the system in case of an error
> +///     numbers.push(108, GFP_KERNEL).expect("Error pushing 108"); // Panics the system in case of an error
> +///     numbers.push(200, GFP_KERNEL).expect("Error pushing 200"); // Panics the system in case of an error
> +///     Ok(())
> +/// }
> +/// ```
> +/// Instead [`unwrap_or()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or),
> +/// [`unwrap_or_else()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or_else) or
> +/// [`unwrap_or_default()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or_default)
> +/// can be used. But in consequence, using the [`?`](https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator)-operator
> +/// is often the best choice to handle [`Result`] in a non-verbose way as done in
> +/// [samples/rust/rust_minimal.rs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs)):
> +/// ```
> +/// fn example () -> Result {
> +///     let mut numbers = KVec::new();
> +///     numbers.push(72, GFP_KERNEL)?;
> +///     numbers.push(108, GFP_KERNEL)?;
> +///     numbers.push(200, GFP_KERNEL)?;
> +///     Ok(())
> +/// }
> +/// ```
>   pub type Result<T = (), E = Error> = core::result::Result<T, E>;
>   
>   /// Converts an integer as returned by a C kernel function to an error if it's negative, and

You are duplicating some links. You can take advantage of positional 
parameters [1] and put the URLs at the end of the comment, which would 
solve the link duplication and IMO increase readability, because 
scattered links in the comments decreases readability a lot (in non HTML 
version).

[1]: 
https://doc.rust-lang.org/rustdoc/write-documentation/linking-to-items-by-name.html#valid-links

Daniel

