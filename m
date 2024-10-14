Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49415383F
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894208; cv=none; b=lJ63nlM77W3+C+6t6rm7YVE9TUEMMIuue+TmQySEqzUma7Dqd3tPArjBNodjTXu4zo10Uu6N0iAk6M6p/xUKZvJFIr8D8Um3j8SVnX0QNKl+tSilD0iUrGoKonz1Mc5DcaFPMi/tTyH0hWA7doGaSiXlIkeTsYWzR+bOTcEhJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894208; c=relaxed/simple;
	bh=2nAoBmy9CoC8eCTngzXqAo+qikUPTb5dYzc8bIj9CSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPI+j5XVDmQ+7iTRQqkXYM4lHfrWqstfwIlUrVIZBy4v6rHo6Ff7kf/MfyEng4pQNjMV2gn8+T0x2Xj0JRxtuVrTOzPtzJ03TZdcac5TWKUsq6Y+zIWWbTrdErFW+5q60Fxliw4vEpCGG9kboTCjBzjyctYAeYP5F1oynh1r1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4KBYT3sx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4KBYT3sx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4fd00574so2283117f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728894204; x=1729499004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBUSoaQ7ZrooH++T965gdyO5DJx2bChBhEopwIoT3RI=;
        b=4KBYT3sxN2FXgsAm2fZ8KtuaygQL3WIRpsXOn3Ra0AWjq84T3PNbCUX4XrsXe4qniP
         giIzX4XLsKYDgqp4dzSJ2qsk3Z/mBpYqsX9pi9l2KOgpgHxMC1+I7KOXHNq7CPfUjAVI
         MHRtPvDVKmY0QPoGuqWnHsOhr/3y8t7lIn5P6HG8Kz4jlBWvxVspQNG94kLmoPq7PsGv
         U/7+18J5AgQNhLyOR+BbBmcJHM65IWRyCPlopTL5U7jEVRFn5v2az0195+Qy1u3ORXs3
         8h0a2MozVemQ6L7c5Bbx+9yjZAmKeRZJaF9YvoV/ki1UybwSX0V+bBdcKkuv5lSpGB/z
         qV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894204; x=1729499004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBUSoaQ7ZrooH++T965gdyO5DJx2bChBhEopwIoT3RI=;
        b=OnZPz7GD7sCuj0DV6tyaccXHucaywCbT6wSdB2wWdB7/VOyaR5s0Oyasf/YZGoT9PK
         bFxrWOME4OcbYI2byLRhRJTJvaG0IiXrOuD1RlneNX/B2z7sYTaUuPG1THIv7CcTffjW
         ieTBhDe+eI++Ytugj2XEKVYFELGfwhPFg474104YyLn0bUBSLziIEuZuKRGgU8I2hLJ/
         i+WxuyZlZeZ9EFgAFnpDO6JaX09OYF5B5z2fXRpDUlQks/ORVUyfJ/gtoYDG6Gtbvr0K
         wvu3yb41Ug4MtQB6/WGrW6M+dPb+97G5LL0SIOvR1/NOLrhYx++7/0CkEfU8kGye1k3o
         tXRA==
X-Gm-Message-State: AOJu0YxuFJKMOzMrZ9R/ejhZ6AIL97iAyDjkvzMM7GWJJZjdLhyEnJVX
	vn+Mwff/jhQ1r0wuQk75GbLpWbRV95nIK4ydWTOjjyKGuBV/FG7BKv6cTaSFn6tEvVVSCoc4D5v
	u8P5D7em+X2vptxvM9UgLvUqv/t0RNZ0FoeGB
X-Google-Smtp-Source: AGHT+IHa+1qNo/aPVNNBqq8+piM5lE0pb6yC186DN1QTLCPA1B27LhdPXpkyzsL4c16EWmwhBMf6cfTXIWTL5en2Dn8=
X-Received: by 2002:a5d:5108:0:b0:376:dbb5:10c2 with SMTP id
 ffacd0b85a97d-37d552d4a14mr8165807f8f.29.1728894204050; Mon, 14 Oct 2024
 01:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
In-Reply-To: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 10:23:09 +0200
Message-ID: <CAH5fLgit650+Xz6UXB0SLeLzL_ZFKae+ZTDZVA-hsCwX6AzwDw@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: Enable execution of doctests
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 8:30=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> Having the Rust doctests enabled these workqueue tests are built but not
> executed as the final callers of the print_*() functions are missing.
> Add them.
>
> The result is
>
>      # rust_doctest_kernel_workqueue_rs_0.location:
> rust/kernel/workqueue.rs:35
> rust_doctests_kernel: The value is: 42
>      ok 94 rust_doctest_kernel_workqueue_rs_0
>      # rust_doctest_kernel_workqueue_rs_3.location:
> rust/kernel/workqueue.rs:78
> rust_doctests_kernel: The value is: 24
> rust_doctests_kernel: The second value is: 42
>      ok 97 rust_doctest_kernel_workqueue_rs_3
>
> Without this change the "The value ..." outputs are not there meaning
> that this
> test code is not run.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

One nit below. With that fixed:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 10d2bc62e2cf..ba0f397f8b8b 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -69,6 +69,8 @@
>   //! fn print_later(val: Arc<MyStruct>) {
>   //!     let _ =3D workqueue::system().enqueue(val);
>   //! }
> +//!
> +//! # let _ =3D print_later(MyStruct::new(42).unwrap());

Having an empty line followed by a hidden line means that the rendered
html will have an unnecessary empty line at the end. Please remove the
empty line.

Alice
