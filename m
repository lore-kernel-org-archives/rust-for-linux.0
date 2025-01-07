Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926631E1322
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254507; cv=none; b=YYYlzCfl1QF7CzCCrjDVIQyZZh8exBxEn4ubi+WMVdUmDgznu/cJPh8/6swtcqsnfL4nDf4gnfpyxoJTXq33Im4MBHEFnqMWFN5Whrk9D7J0XXJSwHonumK0hv84DKVgD+UAUqv7zCWd7TaHHM2hEUFol09n4dvsBAwh5Huq4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254507; c=relaxed/simple;
	bh=Dvoi7Fe6kudE6WpjoqN6/E0PQqWRnxnCTD6beUsDQTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSE0hhYvLnzoDzMAvsH8msKcgTp7Mk3GhsToy1LpdfJMacOrJul9Ti5FXcseUloXaxrlmhDXs8n61QnJRbLnOSyX6LwTb8ilVH+m+7DgETcaXAkiPn4KE5UeGluSFn0IGuIEK6jwdDbde0wJNZLEz5HS7WBs65HWIrC8OIMNwjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWxHnQ5S; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWxHnQ5S"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so159559655e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736254502; x=1736859302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHAIiXk02ma+8E8fsqv04l1nWwLjw+nPAvBnZL+H/rs=;
        b=ZWxHnQ5SQxl6yt9XlpHl7hGB/43OWVxDai8yHQPr2xi/m+qinvFV7zyqLG2VsE3CRV
         ugV995yINQP+l3spvNDOvx6B6KdEKRRUY5h9Q4oZ/PFydx5Up6vE1uN+Csb+27UADYcY
         pP8oT2PajaXiA9iZGNuXv70GTmaQOVpEqeHSCmxv2Rjq3hwCxhMHXO8b2rcGUb4EGw8n
         sYiY2Xv5Ol8LskiCRh/rvwogoCDd5gYDmD+luhz3YCuuyxBLxD4mESkMXf8d1jF3517j
         GRJwPLbB+wWNRsr7+UN7bNFYx/18mNIcw2+vNYIwqULQNMuXOQeTNpPgZKilHZJcRQty
         jvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254502; x=1736859302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHAIiXk02ma+8E8fsqv04l1nWwLjw+nPAvBnZL+H/rs=;
        b=DAF5JC6l5EnE09vOgSnvjA4v+ptZqaLzi9Kv3ZE7Ei8tZqSb3jvNO7gWxru3U8Tx3f
         ai0F3mIzVcsNVXefLaDVUfpm14KbuTiTWvpc3qiezuq7Mv8HKhX02cbPd8P4uG7rQFCd
         Kmfx65rILd+aKRzRjPFj5hAaFUH5uvI3uTygNKKsXOTOR9hFY/KNoid/1ugW7aXHBBLD
         CJsN2+pm/sBLL583UxinROtt84Ml7Af5k+jhwLwimyPu38ERk/LbuJjobt455zSoG1Bp
         EYGohVS0iiLzo/CsQSUam8sp3HEjs7vHRLdCgk2nek4TsIHh1kiBgV8GlyfWJrpEDB+T
         iR0w==
X-Gm-Message-State: AOJu0YxgSuQJeKslowhnQ9FbkC3Vng+Qd1wyiIs2gcx1tK0qtdM9Z5Yp
	BIIeILYT+UeOhnlBdwWH4jP/z5Siw6uiawcP1jGCQ/ugZZ5AIKfwVTfuiQxXGPW/uT7VQ7gZpGG
	/xngF0K9rIU9RkepwCC27VMc6Yy7shGq5he6j
X-Gm-Gg: ASbGncvaHxsdkfTeKa7q91MepOV9hgW6EqY/OkZ4pP/Z7k8mGxFHeA+ahgAFEuULYDp
	o25QKuYvjmr3sxXMRpxz1AXQAUQF82lzrMz20Ooqx9BDEPPrDDraem38mwomf+1Rn5KrU
X-Google-Smtp-Source: AGHT+IFH7J78FZdiBK9FZhqzutJzKAtkBkGLPVbgIq2+RpyM5y4FnKdcRuQN6AyxxYBhON2SuT4C4NIXzCmPNQIAy1A=
X-Received: by 2002:a05:600c:1550:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-43668b5f892mr470469875e9.32.1736254501736; Tue, 07 Jan 2025
 04:55:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107062134.2981602-1-dirk.behme@de.bosch.com> <20250107062134.2981602-2-dirk.behme@de.bosch.com>
In-Reply-To: <20250107062134.2981602-2-dirk.behme@de.bosch.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jan 2025 13:54:49 +0100
Message-ID: <CAH5fLggsAAPjfvTWgsW5EWDDHQ6PNphci1Qp7KzrgU_EwskCRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:22=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  rust/kernel/error.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 0b01975c2286c..456487d4a8ed8 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -256,6 +256,72 @@ fn from(e: core::convert::Infallible) -> Error {
>  /// Note that even if a function does not return anything when it succee=
ds,
>  /// it should still be modeled as returning a `Result` rather than
>  /// just an [`Error`].
> +///
> +/// Calling a function that returns [`Result`] needs the caller to handl=
e
> +/// the returned [`Result`].
> +///
> +/// This can be done "manually" by using [`match`](https://doc.rust-lang=
.org/reference/expressions/match-expr.html)
> +/// Using [`match`](https://doc.rust-lang.org/reference/expressions/matc=
h-expr.html) to decode
> +/// the [`Result`] is similar to C where all the return value decoding a=
nd the
> +/// error handling is done explicitly by writing handling code for each
> +/// error to cover. Using [`match`](https://doc.rust-lang.org/reference/=
expressions/match-expr.html)
> +/// the error and success handling can be implemented in all detail as r=
equired.
> +/// For example (inspired by [samples/rust/rust_minimal.rs](https://git.=
kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/ru=
st_minimal.rs)):
> +/// ```
> +/// fn example () -> Result {
> +///     let mut numbers =3D KVec::new();
> +///     match numbers.push(72, GFP_KERNEL) {
> +///         Err(e) =3D> {pr_err!("Error pushing 72: {:?}", e); return Er=
r(e.into());},
> +///         Ok(()) =3D> (), // Do nothing, continue
> +///     }
> +///     match numbers.push(108, GFP_KERNEL){
> +///         Err(e) =3D> {pr_err!("Error pushing 108: {:?}", e); return E=
rr(e.into());},
> +///         Ok(()) =3D> (), // Do nothing, continue
> +///     }
> +///     match numbers.push(200, GFP_KERNEL){
> +///         Err(e) =3D> {pr_err!("Error pushing 200: {:?}", e); return E=
rr(e.into());},
> +///         Ok(()) =3D> (), // Do nothing, continue
> +///     }
> +///     Ok(())
> +/// }
> +/// ```
> +/// Instead of the verbose [`match`](https://doc.rust-lang.org/reference=
/expressions/match-expr.html)
> +/// the [`?`](https://doc.rust-lang.org/reference/expressions/operator-e=
xpr.html#the-question-mark-operator)-operator
> +/// or [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.htm=
l#method.unwrap)/
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#m=
ethod.expect)
> +/// can be used to handle the [`Result`] "automatically". However, in th=
e kernel
> +/// context, the usage of [`unwrap()`](https://doc.rust-lang.org/std/res=
ult/enum.Result.html#method.unwrap) or
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#m=
ethod.expect) has a side effect which is often
> +/// not wanted: The [`panic`](https://docs.kernel.org/driver-api/basics.=
html#c.panic) called when using
> +/// [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#m=
ethod.unwrap) or
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#m=
ethod.expect). While the
> +/// console output from [`panic`](https://docs.kernel.org/driver-api/bas=
ics.html#c.panic) is

Do not use URLs to link to other Rust types or methods. You can do this:

[`expect()`](Result::expect)

and rustdoc will generate an appropriate link.

Alice
