Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E26D2528FD
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766737060; cv=none; b=KOMqXqb6l1fCHgFReYyvbXKzT5QUim0uzi4IyhZQskYxqbVW1KDEMQ1s5fz8C+Oqt86taydlXVrF4eVfso2jHroIhvKrrRnGuSBh1pG56GH1PD8/g0tlY/0r2k6/C8QJUeotY/Kv+o/9hOr/7p9AppM+Z5R/K30D/rI+Lg3Odks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766737060; c=relaxed/simple;
	bh=TkDsr2sQngXA3O5eSBkKjL+I/qI62C7xQuZEbVVfTzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpqYV5WxC8+NOgsyIteOfIVBH4z8nQ0qrd+UijHDIa1dpBppNS2rYbpXplcv882vEouahdtDljVuq8c5l4LnudxauSsuoqu9AyBRXnigCPPYpfzVmVMkBHuspJiEv7odnMKpOkZMNG3uD9SxlSERXT5FxsITlBY5u2VV8bpIBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmLHnAU6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmLHnAU6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso8502929a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 00:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766737057; x=1767341857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoLPDMhWKI13t2EUT3XPLfgygvMM615Si6HtDP4oWzw=;
        b=OmLHnAU6eONyZCALHhKWG2gaxrvOne63NI/icDmBiYSLTjee95tZ3yG2H5wY2K07f/
         m8j6uVuF1R1uAwebgvbH/qTgPsl3lWPr/Wq4rWvqQsMzShZ2cZ796Nm7SXly0PM6lMq7
         ohbwhZbP3t5Vh4kzNS8AiiPHg9tlT1OALoJgtSK020MMl5NkMcmr1m/J//Gt4IvXxPn+
         GUrAUMc7GI0eErJTvnnRZjFlRj5KwHzyiHWEnmgoY4yqA0aaPK4If5UHcEGXmIT2TT1w
         WVPX5JjEBc0Xpovos9HJNZ+UlsDXc1wP4DYbv51ueT45G2yT3qv2n0D5gx01hCajQzDk
         o7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766737057; x=1767341857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoLPDMhWKI13t2EUT3XPLfgygvMM615Si6HtDP4oWzw=;
        b=InFQx6yyYhF4SM0QGoQ042S8EKvhum2uFaCAsaEacg53eb9jJexKfVCEtcWsOMbVq1
         1TbZtUF0A4VE6RnzmbmyXJp5O++3h+SGB/3nvZhZPTRwPX6v43PVOS4Ts64Me+h6gpQY
         QIeLthqzzwxYcFKDB3poQJiglDTVBgRBBjlkfXLr3MgkCjYuix8o3VI3thDM/5wD9t7h
         BpbRS+SmTgDj2AfLfqBfe7H2mjP6utE3vqJwgCA+fMnlkXzg/TO+HEb9Pxio94twW94C
         rYX0wgGO86WlpJs9pHldNnodqyEhy2FjhXke1lT3Zw3npdI8k298IDmRrOIWiS0TVnBo
         QAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXAzZt4HkNEXvWkkL7hcARmGLH2d6jEhQNfq4a5Q6h85pE+hhY1YOaVopQlmPL+sXOtXqG6ACTz8lrqwr8E9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTSyX+KyYEt7oxOT10p1Eml+cx1Ogf+148fCba0FBaYa5O4Dh
	5SRr6pK4mPsX7nx1lwZSk/WRZUTeDCnQjP30Igovbx1rS09XvG8j6Wnq
X-Gm-Gg: AY/fxX7+KaES7BjfFXLBkeasDJlTcGiGAXyxWqTmx40t+vfUtIzgOUNiq4/HoXiPcnX
	FAJelK31vZwdxejQE0h5LeWM6Tbcq0FoFuGkKFLsvTpOFTouJU5HzE8NCXmKc+h0BGKryTWqf+g
	xPV2dsjhs0/NTedE3b3oeUXBM34BXyeOQ/8zRE3oB6Z4r1uLWXG+KL+uHCsj0O98BI0pI+nVRah
	+0aDu5TZ8DEoo5dpZ0EpPYJUeWhEkscpeKD6fwxbFP0LkTwrL4LojbvqOaH7/btPsiDj/WZUW+D
	8eP+j5o0kqrmvS1BfqmKJGL7To1mht192T87OczNI4rGIavTr5epLzz7r1MpNY3J7F2QyvxAfpj
	Xhf4bfOA0dIraWvODSKUV83XFhEdcDvMQpaKzyrVktRvIWW1R/4sIyfrJCFo7Ttl9jApZOoLFfq
	DB354zdK6ci+Eb7AbAWb53xhBbm3h2N1h1/viRAff3BYFgTHTKI3oss+6ETkTVv97UskacJmkO2
	ASZCaa8uNPbp8job3G40eap6o6plPnFIfU/VeC/apZyu8Mzw4aXN4rN
X-Google-Smtp-Source: AGHT+IGt3a+qwAM/egRN4zAK1Ma2KwAl2SqPJN2acy5TfJX01JKJKcQ8SFEEkeqeGgDGu44DKfrCrA==
X-Received: by 2002:a17:907:94c6:b0:b73:853d:540e with SMTP id a640c23a62f3a-b8037155d90mr2435377866b.30.1766737057122;
        Fri, 26 Dec 2025 00:17:37 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c021:66e1:bdea:4b58? (p200300dfbf2de300c02166e1bdea4b58.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c021:66e1:bdea:4b58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm2343998566b.7.2025.12.26.00.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 00:17:36 -0800 (PST)
Message-ID: <69954d20-cd40-42bf-8fc4-843e1738d562@gmail.com>
Date: Fri, 26 Dec 2025 09:17:34 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20251225225709.3944255-1-sunke@kylinos.cn>
 <20251225225709.3944255-4-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251225225709.3944255-4-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.12.25 23:57, Ke Sun wrote:
> Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> formatted with {:p}, providing safe default behavior for kernel pointers.
> 
> This allows users to format raw pointers directly:
>     pr_info!("{:p}\n", ptr);  // Automatically hashed
> 
> While still allowing explicit use of wrapper types when needed:
>     pr_info!("{:p}\n", RestrictedPtr::from(ptr));
>     pr_info!("{:p}\n", RawPtr::from(ptr));
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..fe4097de441f4 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -28,7 +28,65 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>  }
>  
>  use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
> +
> +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
> +// Special handling for Pointer: default to HashedPtr for raw pointers.
> +// This overrides the default Pointer implementation for raw pointers to use hashing,
> +// which is the safe default behavior for kernel pointers.
> +impl<T> Pointer for Adapter<*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr::from(*ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr::from_mut(*ptr), f)
> +    }
> +}
> +
> +// Handle references to raw pointers (needed when pointers are passed by reference in macros).
> +impl<T> Pointer for Adapter<&*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr::from(**ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<&*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr::from_mut(**ptr), f)
> +    }
> +}
> +
> +// For wrapper types that implement Pointer (like HashedPtr, RestrictedPtr, RawPtr),
> +// forward to their implementation. This allows explicit wrapper types to use their
> +// own formatting logic instead of being converted to HashedPtr.
> +macro_rules! impl_pointer_adapter_forward {
> +    ($($ty:ty),* $(,)?) => {
> +        $(
> +            impl Pointer for Adapter<$ty> {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    let Self(t) = self;
> +                    Pointer::fmt(t, f)
> +                }
> +            }
> +
> +            impl Pointer for Adapter<&$ty> {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    let Self(t) = self;
> +                    Pointer::fmt(*t, f)

Would it be an option to just use

Pointer::fmt(t, f)

here?

Dirk
