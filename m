Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAB3EF0D3
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878421; cv=pass; b=hnQTCzthlg7p/L9AQ56uKdIAQxI3XpuXljUuXilZ9J3h1bHS6Vwz2DDi7N7zPd1a58VitwADQvEPE1q9j8ZZ+5XkkU+Z/rdxmOPMG9Za2bCV9puMie87ByK/8kbmBC8Mj1bBz5huWKV3RVV1HaHn7UsQoxGiAglNzdTJl1/VaQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878421; c=relaxed/simple;
	bh=LhCXi4ynK9XsA8U6wxzibm+NlbudUtrg1uXfOjcIuiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qp4muarcRHJ/ggypFQ0i9AAHZ04yPpU1YwwhPjYh69Hk8VVLC9nhnP+6dusQmZNreRdFBv1yQ2HIXrnTzGFJxIcQfiYaQgdOivomvbd3uJ4iZKx2ITt3VSwAB3JUjEDi3qjbjhNCOJTwKIUQrHLv8+ubBiZIEMslz4rgrJXehUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1QFjj8R; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1QFjj8R"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1178327eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 03:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779878419; cv=none;
        d=google.com; s=arc-20240605;
        b=bhc61mZPXyhIJSNXgHdTfbz66uG3unVaGO9ARka1Mg3u4i+A/7OCxu0MnslL4jqdGW
         T7hrYHUpxUDSk19sAY4akfDEWJjXtv3dc9gZByHwfm/3zGgRSk6anJ1g9Zc1t8xjY6VP
         xoQifXWa1dFvCjQq1bkNz7nXxqtaIbLufVTrzpbFDkulTai3I6zZzgOdnvpHCTZNj2i/
         RiQuiwol2uz2WzQM+bPZ3Aqgf0DIDpocgjUzWLjIfJOqj0WOanH/NHlf31ViHuZGMAhU
         2qQvwkSM66u1nn/DJv19fkMDB6hDCOZJ/mxCAGo7VlK4B7qF3OMAr9DS9cyBYu/YAArA
         EyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        fh=VLDknPQUkXdejpoMbRGdIQ44gxtSkZtCvCjzU1NJgZw=;
        b=VDXIXknBsjnkJcqtk9OQu1l8YzJgNITd/9bHzpcOFG98Qp1qXbcg7I89AN2iLbmZa2
         KLFTCQuCT7ZCPO5bvJck0eFgz40aKXTw6FfHkoAMtyAxZK+gnAT84isj8zWxIKEIr37u
         EnYyJFLtgyW5oxCiD5bGXpyMq82ZYKD5pXtD188TYA+nCMGfgK1lJEPae5ro3iJoGZEY
         i9nC3grw7Wu8XwKZThKUhkDdchDCpnvzwnlc/6mYfuPCW0xRbBzSeHHyNayT6/vEN8x3
         diA6fPISnpUeFLRINcwb0M5csKohy2Izso4MUpaPHrTBa07Efu6pysvk++TTGh6PrIyb
         cbIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779878419; x=1780483219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        b=A1QFjj8RSS3HN2IetGqFVjkSZR/GUSCG5narJ+g15TF8BkLbsndoJCKWYpxJGRBaoo
         zcyuVALarnDfyZsBG2hdt1i9MyJbGe8KbMGKXMJvKTKwRcx8BkbzRrYYIDCVF/9zVan/
         UPaWA8ckp4SMybGAmWzAv/cT8NoKrBNB/GmnvNwIqNbbTdISxhQ0xtGykb1t9RPFKFdW
         Y3NHck6ISRD+1ZBh4QERBvLDrmKlszBdmwLNSoF0LMka93x9cfPacXovzkCGFiCkXzEa
         jRCex4gVeAb/YDoTi1d7QJ9lAVqxqlgDdai9yBH8gpslXnY5+fWlKGnBVUQavrw1j1cQ
         nvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878419; x=1780483219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        b=gNlsTXXw2vLLL7xL4bPXH0lnhSsGP73HJ07aNYwWXZJbYYu/Rasoalw2FtJs8W3LD0
         N3KcXb49NJPDEVPTk6Fwe65c/Q8SBAbVi95bVJ1truC50Wc7mqf0dMxm9RpsSKI0cDJq
         fCMjGeLs7XmOtkdyYMQgX6SOWK4p2SJ6zFZdWdiYcAL8IrijIh2YO/0CDW7NGy3vnjY0
         qoz20Q7V1NMadwacNxCHheatZ3PZ4+FjOkG39DsA5t9chrkCOugHpJt6/b0czV9QgvwQ
         b9QJUOb2iKeNZf5Lb3sxtFa1MAySWwWDuO+Jz7OgL4IU48mNXICJXews/ClJhrwi+90f
         +3sA==
X-Forwarded-Encrypted: i=1; AFNElJ9bfTF/WFlpElk9NtCxChoCk3tPeG3qeiZcxCcARuiLy1i8QWp1glwPNPzSrLpRkH9k8aGUIYf04wA1ftVObg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbC1VHJKLER3i69+HganD5BlQrHcxshqKTDv+IwhwT95lYjbqT
	dTB/LHaZjX5tYpwnVp5b4vK7kLMJkgq15CfgC+yq+IvPmgEDuGZHGLSmrxZUpmrkylvcc0iPdwC
	vC4Lr/eIm2FVliX/aXOej5fFX5fC22TA=
X-Gm-Gg: Acq92OG1X7x916IpDrHIJYVf0eUcVHMb7YfCHQRH5DxFKYuiUO1oI4aqqE37EoUKYC0
	4VkZpoFpTBpVcmzCRmnWFTKJ5CsKAFY9q5pQ5UOlGLrzjdHVBmxiXd8UheBC/ZdAATKiTJhysbD
	1Pt19M0WtFpPA0YY3Jo7VCgybWz+rDyzH0VocAAzA2oL82cA82wpeePNv5xF4EgEi3XI00Z5Dya
	Fs+b7Q2+R5Q1y22rL5wXPxifcYOsXoX/FnRLDXWe6Ne+OkoSmNoAC9HV6UP/AXPSfhFWXQqqouA
	PCZgcUXaGDPkDcQT+a2YEmLXTyB9OkShLV8FqStuyfepFOElcbUjgcXFKgZ3IfwpsKIGQl9j3OU
	8qE8IyTz0ChOVmxe2MHSGVPBYfolu0AFhhQ==
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr4288580eec.0.1779878418948; Wed, 27 May 2026
 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
In-Reply-To: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 12:40:05 +0200
X-Gm-Features: AVHnY4Lql03NZTymv80RmbDD7yYVLqeinfGjlCtjAB7LSrDOuZONN1IjPFX-Kg4
Message-ID: <CANiq72mEdCtw7YoddMBuZTpMv6EUZ68KiX1qpfEOtfwh0dT-HA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This patch enables AutoFDO build support for Rust code within the Linux
> kernel. This allows Rust code to be profiled and optimized based on the
> profile.
>
> The RUSTFLAGS variable was suffixed with *_AUTOFDO_CLANG to match the
> naming of the config option, which is called CONFIG_AUTOFDO_CLANG.
>
> This implementation has been verified in Android, first by inspecting
> the object files and confirming that they look correct. After that,
> it was verified as below:
>
> 1. Running the binderAddInts benchmark [1] with Rust Binder built as
>    rust_binder.ko module, using a Pixel 9 Pro.
> 2. Collecting a profile on an Pixel 10 Pro XL using the app-launch
>    benchmark, which starts different apps many times, on a device with
>    Rust Binder as a built-in kernel module. (C Binder was not present on
>    the device.)
> 3. Using the collected profile, run the binderAddInts benchmark again
>    with Rust Binder built both as a rust_binder.ko module, and as a
>    built-in kernel module.
> 4. In both cases, Rust Binder without AutoFDO was approximately 13%
>    slower than the AutoFDO optimized version. Built-in vs .ko did not
>    make a measurable performance difference.
>
> All of the above was verified in conjuction with my helpers inlining
> series [2], which confirmed that this worked correctly for helpers too
> once [3] was fixed in the helpers inlining series.
>
> Link: https://android.googlesource.com/platform/system/extras/+/920f089/t=
ests/binder/benchmarks/binderAddInts.cpp [1]
> Link: https://lore.kernel.org/r/20260203-inline-helpers-v2-0-beb8547a03c9=
@google.com [2]
> Link: https://lore.kernel.org/r/aasPsbMEsX6iGUl8@google.com [3]
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded for typos. - Miguel ]

I also tested with a merge of `rust-fixes` + cross-compile + etc.

Cheers,
Miguel
