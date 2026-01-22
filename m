Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51B355041
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073706; cv=none; b=PbX2aWu95ESAT/0Vl0QRRyFH0Z36PzS9Rd+r+dW3tCLB5vdEyxeQgx8se1Bff4/lIFGg/2liOwfQkqoZLU20bC5P8KRUq6/ni7S1yl6u427tm6aJuu/mTqvNtRcW2OGrq4rCaMn+cmD/ul6au8eRgs8R6rYVXeF17kor2DhloU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073706; c=relaxed/simple;
	bh=kTfc0dzSxCdmzJCbSFDovj2HiD8lFb9rtRC+/PJ7rko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iCgwWP0LopVOVYPVDYcOTeth7OX+eADZfj7R7Mg2UdeGcCEzNEHHrwj/1TYCFmk7UIho2mSe+Z1X8LWvtP1Ks69Y8YDGhotis2Uv0ZWBlDoX0CsOnQ5wuYUfUkI1Sak9nFHd7Fa6FMXhV0ffk66ZK9bX6gjpXpJvkn+o+gWhFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLvzb7w2; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLvzb7w2"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6580eb3fe28so747690a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769073703; x=1769678503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=skZ5jIzpUZHmbipMVluykW0K+SUgynFko9eEPO98xw4=;
        b=kLvzb7w2QU7XGN/9dV8S7HupEA+bmyWiCT01srkJklj5UsAloTDHSqZmDPwBn0TBun
         BYK57siTS4EMEsbrDoLFtkQk7tzvac9vskPINRQhlRt5rPU35XO6Jjt2K/SaZw9+z/Jn
         2sbkmL3HLnnJtU/S8A9AU11Bs+SOH4LkKqQiDPa4IUPrTF7g//z2IKRpCfz9LnA8Wpry
         xdiQxYG7k0DPNZCtF3nIrki98mWra+3y6lLABx1CMCEo9EyQLR+Pyl9y0WV11jNWvqxE
         BZ3vP9UYqvx5Jz/LTWHIhXunc+FE+sTcjk6+MWXR559KtgerfbMW0dKC+N2zsxsMnnLA
         PPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073703; x=1769678503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skZ5jIzpUZHmbipMVluykW0K+SUgynFko9eEPO98xw4=;
        b=T+F6PHIdwQewIFmKvHhctSew7xI+Uy0xxo9X7i20hsWBd4RdjBZh4gKijSYqAk2h5i
         YmgNOwBsesrhFQDoa+Fh9Ii6a3hrm6ZNxpv6j5Oio4WzATkdsY31X2mlUl8Vq6OjrRBP
         vpV0McwBiqbc84BbfW8r0KQwC+gFtfZ5ZUAgUKEqsv2BC5LfUy84bz3kjNf5bdzjmA5p
         wXTV2M10GMWhlcZbhaJ2MTe0vuD9z6sFii6glFl+u/sBHOvAxPdMaTZBvgBPTaiUT+3+
         SkWAjHcajopJHwD893WnFFYMVcDK1Qb81iKPq0iSCGMjRxoZxLF7jbuPIbfs9reb2gxi
         Wg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNKdbGcPiHgdSaXKvY4R0q09NrE9OWjzRw1/lGqg7D36bleSg3MW9HUAi9gSLFL5jJSQ2RHZ9GVvETU851aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDaTJmVe9L3+0u4BMFmekxIwuP46TGugPtFWtCBxX4EBqd+mlI
	hDRN6eHvRb6cGsnQki3klQ6Z6B4pZaNyK8k6JhP2v0/RfmuHkFoSfslW2vBQdCu1HEmRxtgvia8
	7gctSVAtNy8oF+Jh2og==
X-Received: from edor5.prod.google.com ([2002:aa7:d145:0:b0:64b:5bb8:842d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2548:b0:649:c56f:5847 with SMTP id 4fb4d7f45d1cf-657ff4af29cmr5881311a12.10.1769073702997;
 Thu, 22 Jan 2026 01:21:42 -0800 (PST)
Date: Thu, 22 Jan 2026 09:21:41 +0000
In-Reply-To: <20260122054135.138445-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org>
Message-ID: <aXHsJUUFLwlbOI-9@google.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 22, 2026 at 06:41:35AM +0100, Miguel Ojeda wrote:
> The Rust compiler cannot use dependencies built by other versions, e.g.:
> 
>     error[E0514]: found crate `proc_macro2` compiled by an incompatible version of rustc
>      --> rust/quote/ext.rs:5:5
>       |
>     5 | use proc_macro2::{TokenStream, TokenTree};
>       |     ^^^^^^^^^^^
>       |
>       = note: the following crate versions were found:
>               crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 2025-12-08): ./rust/libproc_macro2.rlib
>       = help: please recompile that crate using this compiler (rustc 1.93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)
> 
> Thus trigger a rebuild if the version text changes like we do in other
> top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
> proc macros dependency on `core.o` with the version text")).
> 
> The build errors for now are hard to trigger, since we do not yet use
> the new crates we just introduced (the use cases are coming in the next
> merge window), but they can still be seen if e.g. one manually removes
> one of the targets, so fix it already.
> 
> Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
