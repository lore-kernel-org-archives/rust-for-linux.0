Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469BD3BF667
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770708; cv=pass; b=nhoE6wZlPqonisreK5o+paao/rXgoGV3nTWHDeIzZ/ciMuyEBQGbk3oXNwxsCwM/KPNCDN1D3/kQCHJYLjCgqtHNXTJ2LlbgKj3k3Su/NsKYMpEHY0ni4tYbjn4act0pteFL5JLXKV8s2Qrc+bdxtQ9fxQUC9uJmZLRcQueNfe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770708; c=relaxed/simple;
	bh=32RtRzJ7crDmrcnf8nK4Ny6k5rIl6i+EKv0kmdGD3Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOsCNw6tPARb6D3+m/YddxodcQa2cxwLwy+e+LGvOPyvJbHuh45sf4ro/nOoOV1yR0N58pySNkZR4BVxyuH5vXRIuyzv1CSvMSjrqeGPYNQlKvyqt6lDA+EZCh4Wlhq0LkV0TQlBFczXluSPNBHlaGw1unnC1ROGfZKJqquowIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFt8VCoY; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFt8VCoY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dd9c4845dso5328a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 04:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783770695; cv=none;
        d=google.com; s=arc-20260327;
        b=sGT2fK9vIJtQN3yilcY5WjzTAOJZtClk+Yuu7qsQvvE5dUBEc0P7SVhop1vQzy3Kpf
         ib4XY0us4ABkk2KVwWl4jWr7yiS8MIV9KojXHOYipUw/3NlZrF0nS/s3twA7pQdwS7h0
         nwU3uskbRi2isy7IqQCB4+a1zHKQ20XRG3jY8HOxFA3fjsREmFoe+wSwgOO6fVRL9mZL
         +0GwKReigPb+kHsGj2lkfn+TB8lSK/L4JSMlFJfs9kcF0zIdceeQhwiabXM6LB7mmqky
         0eJpoCNJOqXvQ8yQ+D+585dumYdZpAt+vxHcT5lr46HkmOK93+gSHmwsf2mARKWSmQBN
         888A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+UMGE819wkdK2DVLaPYqRBNsu1W7eq8gbWnBfh/WA5A=;
        fh=wVH13SQ0giWWQ1QO14PukkxFpOJ5YVM4FNQ+MnFJIzA=;
        b=LkOae0YDHG3hgZah6J3BkY3iI7Z2LfmyglvffkRaDII4WiYX1eeOPXun9c60DzcLEG
         8Ip1RYgC6PBuq1K18XEdbgsjPdgSHUV0lC14hcbarN1b+E4sV5w87HVCTJJeRTKfflUK
         Tp1R1ZkYW7UbJ3HH8Jx/LjvSSLntase0D6KtfPQ2HJ8ocRoUbyteaalyj1AJtbnO5hfn
         SIo0qzJUJwPwYN1aO/zU1pc2Yn1QAo+9CWfTLuLcvZsfWmAnz+iyd1wIwNTRCZC4DvBD
         5sBQz78HAbv5TNEgpNIWrnimWI+Q4mDZ7Hmwtczc3UCgqaN1MssmBOlKhR41GMA9M1Tl
         skVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770695; x=1784375495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+UMGE819wkdK2DVLaPYqRBNsu1W7eq8gbWnBfh/WA5A=;
        b=YFt8VCoY66Mo5Vua5AKiHUBhXhy157WmYWTk4MpHA64g8/XgsINCiD2lS0j1cGFUl4
         EJWH73p5xs67rnvNQAg+BVx3jKbn6H7GE2rQc64USKYQP0Nll0z+dWCwv0DgC4Az6HSV
         LD3aEDNY4GiO6azuozWqBAUrRCxG5RJxyFsVSGLlP7F47UIU0/eBJ47Qo+AW0pWdjJ9y
         zpXM+TetBcQ9IFCCjyCt7DzRO7ITq3EaAkswYeUOAHlF+VvxJ78IDImQOp0durjb5Hip
         vTYJP872Ej2VrkHdyvei+un4ZMg0QBI2FW3pPqa0omss473f8rFIRU1Mtppg+t4iLqUj
         G6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770695; x=1784375495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UMGE819wkdK2DVLaPYqRBNsu1W7eq8gbWnBfh/WA5A=;
        b=J3rkUzxVvrSxdp+n6euYNLXufaNXOPA1qTgHLbcaR/lCt6S5Yp5X2Xwo7LylJ5f/xp
         az2kvb8I7H3QExWTJAC9xl2W9wAHoRo0WwHPVyDgB0uPEncAj4bGFlsYIzP4oNdhOxRH
         S6us05yn4sDKpYpgl+Vdnh0gn5hwqsasaJl3cd3oN/pYa2XmsZMrJqUKQ3jG1ltugIqD
         FvuoVIKjturvsF18lZz384m0MPe/RmBsipPafVMcYcO+cSyx4NXmPf9KPHozYkAblEI1
         h9tzr+BVvaFvzdEWnPqxGzEqp+y8/vfgXY7JnWepwDLHIdRKkumcuVnzf6niDtRuxQJI
         vRxg==
X-Forwarded-Encrypted: i=1; AHgh+RqIUFEkjXnd6YpRjiutuHpYhcOPofnoHEQH5btuU0CrtN9j9sbOrhQLexm5IYYDtuff2kz6jKLIUMNIucZWvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8hdz58Gl6q+KFZcKXxZjQuYFGNjO2LEyXTWXgLBFrU8gaKnU
	H6h8axmQWSJqSVPjYm4JLK6lMdmtgPinHr95AG5IzxGnT08dcic4s6iZ4eKreYPNlafCjvGPOBm
	8jLbA8Nm4Y5oZ8caYElyB4wNOJik3UVs=
X-Gm-Gg: AfdE7clrpcF95X5dN650TjKAEhXJBXnDBsMJpIQUA8ysEKtoFEQmu1b6MWofz6XEMre
	CZH6b2b4gN0K2G6LKkd5pEVACIFid+BnIUGslWdwCFuMznvFQ8rrkNFDoMEvmfp94hHLTXlFx4i
	4ADg7SomJ90tQsePD/IV9eDUOgWfTt6RY5QQgK1fhlnJdrefbum+m7eA0rxBZNI+pIhb09dAIvI
	0eBtFy2xlssabPkiy6TT6Bw4hOhaXQdzjDdt/igBA28rzt3ahq7m055bmtJvV6eLSWKGvBXJz4S
	F9ox/ZL3s9Fez+/CaWltdNF7MxBhfoaNSvTC8oA8us0HB4l4OGQPxK05RG1A1qV78XnnEiRG9Fo
	H50m29rpBNFWe3r27olqKSzc=
X-Received: by 2002:a17:90b:2e0b:b0:38d:90c1:2400 with SMTP id
 98e67ed59e1d1-38dc74c8082mr2087131a91.2.1783770695310; Sat, 11 Jul 2026
 04:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710173252.191781-1-ojeda@kernel.org>
In-Reply-To: <20260710173252.191781-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 13:51:22 +0200
X-Gm-Features: AUfX_mwoKjXTHcjSODaSdur4011uhKST8J0DfGvxttGWqmvWIQB4Nfm07D_RmM4
Message-ID: <CANiq72keASONEFeLQivMaSnpio3zVgSGCAsTcxjevizdBcZ+Mg@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function for
 Rust 1.99.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 7:33=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.99.0 (expected 2026-10-01), under
> `CONFIG_RUST_DEBUG_ASSERTIONS=3Dy`, `objtool` may report:
>
>     rust/kernel.o: warning: objtool: _R..._6kernel12module_param9set_para=
maEB4_()
>     falls through to next function _R..._6kernel12module_param9set_paramh=
EB4_()
>
> (and many others) due to calls to the `noreturn` symbol [1]:
>
>     core::panicking::panic_null_reference_constructed
>
> Thus add the mangled one to the list so that `objtool` knows it is
> actually `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Link: https://github.com/rust-lang/rust/pull/158796 [1]
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/alEBInX9gD1M5NAr@google.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

I changed a Link: to Closes:

Tags still welcome for a day or so.

Cheers,
Miguel
