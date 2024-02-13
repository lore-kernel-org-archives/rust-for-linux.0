Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063E60DC6
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Feb 2024 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854994; cv=none; b=gDK5asN95aAMEO7PBXeVT1sm5rBgFsDHwcz/PLVsSXiTt40I8ruSz1PQz9vEcJw5iNG9y7IHl2KcOAmIEuKrcMwBYuJeZF5zLvHsZnPal3V4n6jwxjKsUC48Uwh+2YBF3/XOadf8frO3hx0naoG0G6cXWVt4XBeU6bEhkKhLSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854994; c=relaxed/simple;
	bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEd1DHJ+QLsY1iZ2/BzzY5wzMWTezLSdoavUhU77dJysrFtIQbo9hWL6kaYLGRH4hIgUxMYgX36hB3SIR8DvRbY1imv0EexjF2+0BlfnKwWgQP0ElYB8f80qHVpADyY3Nzc+zYatIy259PyzRCj7+/edB5vZ3Fu32+u4rDT4Klg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUF4h4Eg; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUF4h4Eg"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a389ea940f1so545755466b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Feb 2024 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854990; x=1708459790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=dUF4h4Egfv0cNnk+/V1+piZD5cIB4AM+purEoXQezUv8P8WbzXHbe/5GPtYm/RQYIZ
         N2v/AqFzWcdJiXQKoY+hfKpfKesMhxZdIe0ext9bQKYnvCfZOaTJ6cLDbapgu7Vp9fqo
         nHzORuHZXCg+MUei6pTr83sAAM6d43da+p9Z2QsLhWDwA2Gvq4yXabn0mb1z8uve4cSs
         p8gZrYY8y5qSavRGABBZEmP9sQysYsMMgZr9CY2wlzu2LKS538V5lnshFGAxt2Gv+500
         6zAWNUpcQhHTnbUPK1Evwm0oaWc8oEIN6rrN1z6vtxduZacbPZdJ7O2qh5cb0L7AiqKF
         GGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854990; x=1708459790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=GD5sZST0i3uJUDFKaQJfDCzQHLZZ1XA7iIllde3No8PXxp0xiOu4YPtcXGQxFFPhQE
         L7b4iPsccOUYDyfSP5bRfiRJbevxEePvVd5QbLLN3snF37i6+KawbmC+JMI2t2QDMFA1
         XeiTU3TTob62FgDhr0VmqiN4+F7zGQ2QgRYLqFa7N6njOWUeYzwK+r1vPY/SPha1K3Ab
         BTZ4Y1xYvpSemNRfJOyrWZukqyGJIBpLrA5HWMbxLcZibfyLmuwFpzg9XOYu9TR+tAgd
         0Jbgot4vTtesNjGaWUX2joWYN2NM+17PfOFn/QMEesDP6XTTa3oYnpTbHr+1BbnCTetC
         c9WA==
X-Forwarded-Encrypted: i=1; AJvYcCUWhHM6ZyOrpbh99bXjkF2HEsRUG/c0RkPtFb+2enwypwPJ9x6BEuU1M0bBGt/XwumcL4WIkD2Vgla16XXEjy0m8xH0KsCcn7Pm1QWY0rk=
X-Gm-Message-State: AOJu0Yw6ErTtIIX8H7dTfZytxXU4BA8b9MZRx1b78cLNdg/sciTxOvW3
	wGAyeU9w5j++SiBkJZB5h56MFDCT/vcBEAt2A0KIEgbS16bY3McX1lxFcWwQhndi8JBpJeItQlc
	EJsys8j0j/WAkWuFhM3Om8gWU+2cLwmW+1ACD
X-Google-Smtp-Source: AGHT+IE3mwMUqJ6DN5geO/x5V71y1Lpt/nQ2yo0uSXGvjLFjxROjLwld/5P5gl5jWXzv7R3BaPdR8dxplGGxRT2ITjo=
X-Received: by 2002:a17:906:b34c:b0:a3d:3781:6eeb with SMTP id
 cd12-20020a170906b34c00b00a3d37816eebmr70496ejb.34.1707854989739; Tue, 13 Feb
 2024 12:09:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
 <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
 <20240212-demotion-blitz-1c9ab85dbc73@spud> <20240212-outdoors-french-a40d57e38c71@spud>
In-Reply-To: <20240212-outdoors-french-a40d57e38c71@spud>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:09:38 -0800
Message-ID: <CAOcBZOTLBaik5kwHhvCoJ4Q4PQMDjBk3TJsaa5u-vxR72A8jFA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

> I realise I was not clear either. What I meant was that this talks about
> rustc and not kbuild, so what is meant by "the new target" is not clear.
> Do arm64 and x86_64 have functional support, so adding RISC-V in rustc
> is needed, or did you mean for the new target in the kernel?

Sorry, I was referring to the targets at:
https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/spec/targets
