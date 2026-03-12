Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29263367F59
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325043; cv=pass; b=RYEk9Eda4fFCpmja+Rt/70LFCRIA+CJIbORSnqd4DqAc8PhXzY69RMh/en7rOupezdqV0W8PEjrSLi8lUAsPRt+mKg+MapTAsqvjR8I7PhcdmxA9e6KRTDBryt+JhcKK6XnuseksmTUqzJDAwbCljBm3azZK+ECJUhcAh5KjNNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325043; c=relaxed/simple;
	bh=uNv6kIxa3sBonyIAZsWJ/1YYALDiUWo1uHouUO7Kot0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXUaY9df0AIdfwD9dDMPoqNOdGEb/D3mOl5HdpcxJzEakVX1w8UpZ8PMgOwiBND1GEdGZRNAF6Jj9pDkg4woqUFH/oX8d49d7IQY9TSQEjzZIMPoP9vlBoalww5Z8DgXEdm91wAV8eT5+32AlUdUL70S/jTr3f0Fk3HZCdAySzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZZlLvnj; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZZlLvnj"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1277863a912so20227c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 07:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773325040; cv=none;
        d=google.com; s=arc-20240605;
        b=X/uIIISI1xgysDCjDCvS+kWZASgYMjD4xkgadvSI3gk6GNx6txTq5DPDN/DJuOy94C
         x2YGh1LBTo6gPgwfRhYor/9AR5C+7+yMF24Pa0lCkMPBO8zXLx1lES+v/v4xY70485qY
         DzUCMFXYCGsaUpI6vY0VUgPuuifSv5mQ+LIf5gvNIoyUALzq0nlmBK9olpzqb6slf1of
         UxeX+qt+gScFDb9xj7wlZeEBG74INFhaQ+TqAglxTZJgbM7xSWZOEjokOQQAHsR6Q1Dc
         nZDf2TK5lfBq7wlx1M3MH38r8CnVaTRRYjGnywQvuLdIhY/3rp9o42R0BZGHNyXvFuPq
         QaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        fh=HCCVFsdMUv25wEJVd+Np4wPVONsshnFKzZC8NHdHjDA=;
        b=ghnONGwhfNsn0JZ0i6org3U/A4Rq4XgsjwrFm//6r/IfmfET/FYo8WCQyxXTj2A662
         m2BzpJlGWTSpFm7nOjm6nByVEnweoS1VoqHY4dZ9h/oUSy0GqBl9ZdQn26phh3CMwYAW
         WDQ+/4Q5ZbM0HjdmWk3V8B3AeFAs3jcNrmok8h2tjzGoBwI/rdkG+lOjDma8yxLmShDk
         +QaWRGFSwRKAsJapk2vxqTJuD9/k3TaewwQFQaKnY7JnfUEJDwyl3v/Z3iMYCRdBSYar
         IlbIgalRQutMj6ZhEBEKD5hTJUJpvO3dt9uvN8Lh4YZZFB0dRPU8XDxJNECYuuwTCGzF
         /wow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773325040; x=1773929840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        b=kZZlLvnj5JpJvZTz/OpdlK7G2eRopSYkAUj5YLrcQMoaoaQIBQ6gF5rAcYzmVJN+6k
         hVAoz5quGRnrd5tEPIU3a+wFNOtdKi1H1g0h60eKElw+HLtLtrDurYQVpWlq5qMsqKAD
         cFfvTtD9xApIKpE39qnnmIq7ZemGewGZoBXfxer0Tw0Z/pDNaJm8RWl+On1O6PnW4103
         N8MrREuTpA/DpOAyYw+ziCa7jRW21oFJqGg0L3m6V2HwXoVDCStc5RYtanFWXdFRJQ64
         fjSKWOL4nP3TY8e2L27LCwdG1ZOZCC0gGvSoMODi8zs5CXuEFNGM1bQyntjS85VqsxCE
         jaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325040; x=1773929840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        b=ank6OJXuCHP2QzXUwmdHW5otipNCV1wKNqtRXxoYJofrQP+TEnQBMzTEEsXISdXo+u
         U+nZX+OwvnxXc70FitTz+l48dl1wr8LIZPyvNmC0AVzFBX/EAcu7ttCFxHz+6Uj5C4wS
         GmAQFALJGQIrSvf3szZScUKLa6UgwZBlVSPmn7BCuTsaAyRUM30olQ7e3rr2aazSmd2s
         R/1nZ8DtZeCZL2nZuCxFjtyB1HIx0A6OLBUzMEfN+9TGE9w+6rXOOYheXd3Orkrf/om+
         H9hU8GDkORsTPrbYW9phNH5fA3cnvKDU5VZbH/qmzqM6M/lEILDUVnHkQY9wsMzFCCOt
         Lovw==
X-Forwarded-Encrypted: i=1; AJvYcCUCIlG3Q7WRkqVLrpBGmUofqvUoEQHPFXSm4tkrM5OwHNRmmqFFaCzxbZmPQmkght2t1qtc1zk7ebgVE6SAqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgWzS4reTCV0mREhoEBmLhaO+EzQzoGe6vNjvHN8OqameSBN9
	R+fUm2PpA+AMQmBBI3fE6k05hZW5qvV7qhK+CKtk+3H4LWEbsiKVs0sfH6wX/EwxYkTmTE2DGRE
	1pbKOoHL5kWbXRrENqRjTHoT9RDo2hxY=
X-Gm-Gg: ATEYQzxn4vo9/q1rPXfM4ofCeTcNwuLCG0iZcQ84V/T3jjAsHC7cBXobH0JmJTneCkE
	Ypvubif25MHwMBCqT+ryLeIGf7l7LGaClr1h7FzaEynVjLY8sJS0sVg6rNliSlT9uv+gFUV1oFa
	a1+ZhS9Hf+7fICkzPOcz5llcxU3LpyCd9A5W2buW7rhBGqeOVrlKwgbIsloa+xpvP9+aLCuiMpB
	8Z6h9VvX93OwKHKcRvfr9DEAKsFMawHvyjgNVRsDQdUfOnrPjWMROqdPKkCc5KELNL0MX/HrpZU
	W1APXgYfdqxvVzXpSM8p1a4OIt2DWmlMVmjmm/B3CF2+YC3x++Md+K1TinrVy4nIhjD45Y93JlY
	5SC3RDnEInIy9rkVCKCsF4tE=
X-Received: by 2002:a05:7022:3f88:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-128ee50db45mr394830c88.5.1773325040019; Thu, 12 Mar 2026
 07:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111014.74198-1-ojeda@kernel.org>
In-Reply-To: <20260312111014.74198-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 15:17:06 +0100
X-Gm-Features: AaiRm52IlgB3f2dqIvdLqxC0QGpjGXWHGqE4d9SxnSDtWii_yfdUEsYKET0WFVM
Message-ID: <CANiq72m=cYe8td_z1t-FLbmhwAaVLjUS1mvg3RS+J65onxzRAg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: allow `unused_features`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 12:10=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with the upcoming Rust 1.96.0 (to be released 2026-05-28),
> `rustc` introduces the new lint `unused_features` [1], which warns [2]:
>
>     warning: feature `used_with_arg` is declared but not used
>      --> <crate attribute>:1:93
>       |
>     1 | #![feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,o=
ffset_of_nested,raw_ref_op,used_with_arg)]
>       |                                                                  =
                           ^^^^^^^^^^^^^
>       |
>       =3D note: `#[warn(unused_features)]` (part of `#[warn(unused)]`) on=
 by default
>
> The original goal of using `-Zcrate-attr` automatically was that there
> is a consistent set of features enabled and managed globally for all
> Rust kernel code (modulo exceptions like the `rust/` crated).
>
> While we could require crates to enable features manually (even if we
> still keep the `-Zallow-features=3D` list, i.e. removing the `-Zcrate-att=
r`
> list), it is not really worth making all developers worry about it just
> for a new lint.
>
> The features are expected to eventually become stable anyway (most alread=
y
> did), and thus having to remove features in every file that may use them
> is not worth it either.
>
> Thus just allow the new lint globally.
>
> The lint actually existed for a long time, which is why `rustc` does
> not complain about an unknown lint in the stable versions we support,
> but it was "disabled" years ago [3], and now it was made to work again.
>
> For extra context, the new implementation of the lint has already been
> improved to avoid linting about features that became stable thanks to
> Benno's report and the ensuing discussion [4] [5], but while that helps,
> it is still the case that we may have features enabled that are not used
> for one reason or another in a particular crate.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/152164 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/pull/114 [2]
> Link: https://github.com/rust-lang/rust/issues/44232 [3]
> Link: https://github.com/rust-lang/rust/issues/153523 [4]
> Link: https://github.com/rust-lang/rust/pull/153610 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

We were already discussing this in the links above, and it is fairly
trivial on our side, so I am putting it in already so that it goes
into the next fixes PR.

Cheers,
Miguel
