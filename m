Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A137168490
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362116; cv=none; b=UXK+mJ/qdClwR4o72VDiUEKN6Pzc55TkXek8MEkjPuy2ZeFAMLuwvBRfZqB79NbwLEONCKZltHegLmkYnDtm8XqxEiMKXqW5odYnhsJ8iORF9Nyv2bVa5Ik5Loa1zSiYPjNqYV6btrgnUx6sIMUxfDyoz5dHKMfupyMMFhAlPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362116; c=relaxed/simple;
	bh=JH2Cd2lN6IoitPNPrBTESvV7VWxwDFLNLbMvOE9YGkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXZ0IRAGlm+sS/k6tEPhmPUWbYz/6IOQKEromWDrc/RwAEuMkJMBQ3mSDdyj1Cizj3uo0kQHxl9GUCQp2GKXjNRlyAfSY9qd+Lq3SrXBF2OCAXZjibQodtJ4Fg6w8tLXMM/7i/zPy0YLoLJE7T58Nxq9ryAWtq6poPWr4SvhU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLKOUrwq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLKOUrwq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3687fb526b9so2253695f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722362113; x=1722966913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZVb9b6idPdGqOLlS0LbFKJPOJQMfcfymuIDhlC2e8U=;
        b=mLKOUrwqFZa6T0nnjfgtPp8pimtVksOVpOXOzcRYNRT5ZdEG9a32SjEdk4+fAQ1461
         58PZ47xygOZlAeF7LfN22d4zV61MHqFa2+5MfMJstwCK8ueHEmqpuRVzI9fdS4BCYstI
         eZteu/3S1qSbNPfCFNvFccnxkQCli98UsNCUAg3hM8TzLDTZ2BjSjxV4IT7dmOA5JmmC
         qKJNWutEPguWqxkYm3jtsJaBwbq6jwY4tjvSccOajT80Wnmm3vY3x8Inr1FGMAl+Htl7
         IZ4khNBSq9N5FWQxpglf8Nj8xZEbRi1hbXzj/zC17zGIaiRoBRj/BXRhbQzzrTNswpfd
         nAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722362113; x=1722966913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZVb9b6idPdGqOLlS0LbFKJPOJQMfcfymuIDhlC2e8U=;
        b=hAm7ZbM6hHML/onca1EEXRHVQGfVv89lon8tUP275LvEZB9xrNBN6rd3Y+H/h032yS
         /2iyW/C4OEHdH6opfccEE5Ny4foiDvYxNG5HWgWCGOR5ra5wRwSbo+iYPR/H1tVL9f4u
         UThbuRoLJsMO8HGHRKfixu6bM9C1jmlUxKFaNyFBVhm0MsqsUpEHPl4fBS6G525qHG1K
         7K1qdFgtYDf4BIT/ACBiwln2QRDpc4DJQzhGhaF8tvxOTCTaV86YbUXy6Qpo2vB3uPgU
         h+Gps3kGevia81HZAyPqAQfSvIAcBLM/yV7DeeG7kCaCOSMooEYa+HyITfGQoKMIowQP
         746g==
X-Forwarded-Encrypted: i=1; AJvYcCU2pHy/bQsbOkFoDc8bW6031PhO5194EsvOp3OzJS+29t8T5l8bHAV3Tsxodv2lE1bWUmTMERveWh9pLLkPumrUYzxnYVkr+e918jJRHeA=
X-Gm-Message-State: AOJu0Yw6P38iKcP4lEw1um/n5E/OYgTvODT8+A+Jee87mWuAuPXrlf69
	16awAkaQpvzSLm12OTbXsH6Jxfn7baHChd1rtW7B/2zdl7KrWHOWauKEVeSmprERf92EQpWQrk0
	EM2M+ovCciI8OrNLFq8+TzuEuSTpt1SU80Lqf
X-Google-Smtp-Source: AGHT+IGmM1tNNed7IrynwbRJCkV3w6w+USTXC/B0W7HVIfMnsxonH0cqX1VcweXyc+Pt8fczaIJn3PMNd+t6XksY8VY=
X-Received: by 2002:a05:6000:1e47:b0:367:f0f2:66c1 with SMTP id
 ffacd0b85a97d-36b5cee9ddcmr6956783f8f.12.1722362112425; Tue, 30 Jul 2024
 10:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730155702.1110144-1-ojeda@kernel.org>
In-Reply-To: <20240730155702.1110144-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 19:55:00 +0200
Message-ID: <CAH5fLgj-0EsVjh8xdV1mXZBXPxKGnwUa8-R+Bg1eyjh0Gh_BWg@mail.gmail.com>
Subject: Re: [PATCH] rust: error: allow `useless_conversion` for 32-bit builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 5:57=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> For the new Rust support for 32-bit arm [1], Clippy warns:
>
>     error: useless conversion to the same type: `i32`
>        --> rust/kernel/error.rs:139:36
>         |
>     139 |         unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
>         |                                    ^^^^^^^^^^^^^ help: consider=
 removing `.into()`: `self.0`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#useless_conversion
>         =3D note: `-D clippy::useless-conversion` implied by `-D warnings=
`
>         =3D help: to override `-D warnings` add `#[allow(clippy::useless_=
conversion)]`
>
> The `self.0.into()` converts an `c_int` into `ERR_PTR`'s parameter
> which is a `c_long`. Thus, both types are `i32` in 32-bit. Therefore,
> allow it for those architectures.
>
> Link: https://lore.kernel.org/rust-for-linux/2dbd1491-149d-443c-9802-7578=
6a6a3b73@gmail.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/error.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 145f5c397009..6f1587a2524e 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -135,8 +135,11 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_s=
tatus_t {
>      /// Returns the error encoded as a pointer.
>      #[allow(dead_code)]
>      pub(crate) fn to_ptr<T>(self) -> *mut T {
> +        #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_=
conversion))]
>          // SAFETY: `self.0` is a valid error due to its invariant.
> -        unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
> +        unsafe {
> +            bindings::ERR_PTR(self.0.into()) as *mut _
> +        }
>      }

The formatting here is a bit weird. Perhaps we should swap the cfg and
the comment?

Either way, it looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
