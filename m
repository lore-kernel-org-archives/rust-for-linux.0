Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEE28C867
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783584; cv=none; b=hcaWQLCRiSnBm86sLsKbaVgCsCTA7n3491lQOC3Rtc92t4KU1H6JEmMRTBi70obb3QDYSvoOjnwUescOj91komWhDxJZNw7UTIrab9WAVFtQD07NdFYM7Qezk2BEanv2tta+SjTbU2EbUz9D6IyVtA26IC3mX8utDyXxd6GjusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783584; c=relaxed/simple;
	bh=RplcoCMUVfVJa1bfwTgt+wQZds9GCvttkxCVBpMbMAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A7hYUo/UnvSwNei+x1OO/k8CkwUdL6T+dfy64lzLvIhwEsOWIpx3SrUNUSwKgax+QV+JwgURw1escH5wupij+xzR7+bjt9KrzCkDLv0m3wUl5uA0EEPllA5wLh9RIJemP1eu8anoFacSpfjxHvakVNnZB6RuFtv5UHr5Fu4lY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KSjstOE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KSjstOE"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442cd12d151so11398335e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 May 2025 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746783580; x=1747388380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTatT7oc6SPkLV8UOO9ITX1WtYVFDfP/JvB23W/R7aU=;
        b=1KSjstOE9582yrWrF58W5WGXVXMgzfWSbEZ+/CG2SN+w7QrXac84FE0O1QcqQYJAXR
         nmTVCZGp4UeuTW/WPmf21LRJj0Ejmxo4vvFk9J30EoAlWhhS+a+0j4WgRriODTORmIp2
         MPdmTsDM5adPFiQ5BlR6a0TcP2v5Ho3UHuCnE0UIMM1cq8XRzOw3W5qljZOW0EpzL5CR
         RVv9DC7pBriz4cvMmzPJv+9RuUnqEHx88ccc/MUE58edVkMEyA6RcY1S3ABh2FH7OQTk
         /2Jp4JrWv6EQlOVglIXib4QiLJTJdUgTs4YiKEWOUCEXc1XTl++kpLXBehlm0qafQur/
         okaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783580; x=1747388380;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kTatT7oc6SPkLV8UOO9ITX1WtYVFDfP/JvB23W/R7aU=;
        b=wt/GM1Fb4jm3WrUfvoTDZg3/g+yH73bIRBckwzDXgRcFVQbUaRDlL/SVTuLVQ/2+sF
         kEzaXcUjiRVKSwg5hM28UN2XWqFj8bancLGc4Siv5GDxCZU6MTisiNFcrczhAwRBHNSH
         kMLxwf4DhqgBNQwslgbj8pkTa8z6ZzTR093jlJG/zL1bWlh0Jryd/kal6NgUtgfaVe9N
         wQGwJh0UWLGFiuHj1r8Xs/NsRLV8Y92Cd7VioKJs0rZsgN4a38wZQ8vGxDT4VWwmym7Y
         hn3aO8uPQCEb4smNqiuO9hBkYrsXEd5v4zx0WW5d4BWrIIFxOV4FdCB+5n/0RrlfOaX7
         dAcg==
X-Forwarded-Encrypted: i=1; AJvYcCXxuoEEeNZ6Spwgjk3xJVWPQ2+HB3rQhoE2pxQ7fd7tnHdCYA7zF5dXIDlVgEtKupY7zaar7VNgm3keSQFjqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXHOvKjlvf8tmRZCQwQ3H7KMxQK0mD4/9qM48VFy0q4IxLfoP
	LENUeBUoIlplemBDeJBH+ZPOAZzuqTuOq7ve9ErXExmXgipDjqfjf9NMtGIy6HA5qjGtXbSMB1w
	5ZR1UWaTmoLGIXw==
X-Google-Smtp-Source: AGHT+IHqYY6QgFatnO4kmm/lbjZTm+fx7RZhPxnJgrujsTZiWnAaUwl/SJr0N8FI6m9dTrvKDwuZPkt6E5895QI=
X-Received: from wmbay20.prod.google.com ([2002:a05:600c:1e14:b0:440:6251:31f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr22251045e9.5.1746783579884;
 Fri, 09 May 2025 02:39:39 -0700 (PDT)
Date: Fri, 9 May 2025 09:39:37 +0000
In-Reply-To: <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
 <aB3A0Qe5WqmxXQJt@google.com> <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
 <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
Message-ID: <aB3NWUrtWMXOppYE@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?B?UGF3ZcWC?= Anikiel" <panikiel@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 11:11:48AM +0200, Pawe=C5=82 Anikiel wrote:
> On Fri, May 9, 2025 at 11:04=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Fri, May 9, 2025 at 10:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
> > > approach.
> > >
> > > Shouldn't the depends on clause go on `config FINEIBT` instead? After
> > > all, the current patch just means that you can't make FineIBT the
> > > default option. But you can still pass kcfi=3Dfineibt on boot to enbl=
e
> > > FineIBT which would result in the same crash.
> >
> > I thought the intention was to avoid disabling FineIBT at config time:
> > https://lore.kernel.org/all/202504161442.66CE2596@keescook/
>=20
> I think you mean enabling FineIBT - yes, this patch does exactly that,
> it's still possible to enable it by hand with cfi=3D
>=20
> > If another approach is needed, then we can change it on top if that is
> > OK (I am about to submit the PR).
>=20
> Putting it on CONFIG_FINEIBT was my initial idea, but it turns out
> that this creates a dependency cycle in Kconfig:
>=20
> error: recursive dependency detected!
>         symbol RUST depends on CALL_PADDING
>         symbol CALL_PADDING is selected by FINEIBT
>         symbol FINEIBT depends on RUST
>=20
> Not sure if it's possible to make it work.

To fix that, we probably have to do one of:

Option 1: Upgrade the rustc MSRV past 1.81 and drop the depends on
          CALL_PADDING.

Option 2: Split `config FINEIBT` into two options:

config HAVE_FINEIBT
	def_bool y
	depends on X86_KERNEL_IBT && CFI_CLANG && MITIGATION_RETPOLINE
	depends on !RUST || RUSTC_VERSION >=3D 108800

config FINEIBT
	bool "Accept cfi=3Dfineibt option at boot"
	depends on HAVE_FINEIBT
	select CALL_PADDING

Alice
