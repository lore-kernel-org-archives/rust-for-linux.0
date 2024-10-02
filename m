Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F71946B9
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899337; cv=none; b=VATac5lzz/cUu5K4a5MHOWsEw5HI/lRYv+29xmtYxruRpbp2pZCOt0qU6WGCi/ysP98XTxQoj5ZnlDx0phlfG2DtxM915h+b9ESeGLBJlV61ldzFT1DQidIlXC20m9L8YV3FDS//o3xRUkqL242eITNcTxs7N+/oktelg9P3TAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899337; c=relaxed/simple;
	bh=26ch3VLdZlgASzApmc+sdmN42sQrSbzi8ri/yXB2hcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBnfehUnktm+vnQwOrjmTGYtsYDZek4W4MkapUGowN5YTsdcsfSsnGuDNalpwiAOTwOzxReB+Qlwe4mqpZWS5Jyi5GblBOHp5tm2XRNffmg5kiQEIXT+tQG4dGoM1FM0KQrqjhcim3r7KKqorTu/raNEC3TaoqIXtN9nzN/1eB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F6YCI9X7; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F6YCI9X7"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so2529431fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727899333; x=1728504133; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=F6YCI9X7JvHDccGLljtWDsml9Fk9JCWOzOadJ7FR4STve1GUn+OxFA8fjopuxE+sUq
         txxI1BfH7pszy/lcBFHCjG49xAtMEfaLpDLNwzH7SKQrL7PVi7lu/XK1wouZaimjUt6q
         i3Uy4CXRrFl3rrXYlddf8CvoVkXLjopVEcRqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899333; x=1728504133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=KIlJAk8QbhsfU7eRPXk5Ec7wNYHL/iUaK3hmM0FfmOD7AMqGurq+Z6fpbBoCu2Ij3P
         mu0FoTR9uJRrkCzNXeu1tueodAlfAr0DFnY1VBggrnodW1B1gYRp22pDLraVvZIChQ9J
         I1HbBJ2IRlEwPgLQrJ0qrt6WxeZE7AfjP+QNQw90rT4fiszL4AvYKGC5KsgUpmLd7hqw
         p4HgAKKzsggt6J5lf5uhDawU3rbhlHWsLQPROFm98DMOK0/RvOCYhc9KqWsZs9E+Ymh4
         DF4YagWYM3rtX2s7hckT8FcV8tfbduazDdOh4u+MJpOQWNfLjL6o55KSFspB+Obhn4WR
         VfAw==
X-Forwarded-Encrypted: i=1; AJvYcCUos/YVoaA7SBapEMSnW5eyaq5vdn289Xqceqst0dl4/JyF4f5s4KiNLQ34Lze+CPYxNvQSL7FriG0yiud2KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs70XFlbcIX1e7c69RXXyYx76r3Zb+XSFRrS3m62y/+3ajvaft
	OOtUmimaOTrg4ntKH1dSYVCOw4cBSMp1bpVzPHAfL2GLVFotLo+GwB5c1XXnEyJpxq5BxsbObSJ
	AXAdHHg==
X-Google-Smtp-Source: AGHT+IGSDDlfR9OP62yggI4+j6/iafUzjqkKKCgK85zmYfgF+cDM1iH8Jk5gd0vfRp8JAmylzw9rAA==
X-Received: by 2002:a05:6512:1056:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-539a07a89a7mr2822230e87.51.1727899333167;
        Wed, 02 Oct 2024 13:02:13 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a0458ffesm2008552e87.300.2024.10.02.13.02.09
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 13:02:10 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so2528281fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 13:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVn6tZi3jAsaCFAk850iUsAsUcPZzr3jgcPvUUUMER9kT6COwuvCqnvBhE7XOEvB+bq/gOSzXTbOk9h5wFf4w==@vger.kernel.org
X-Received: by 2002:a05:6512:e9e:b0:535:6795:301a with SMTP id
 2adb3069b0e04-539a079eb59mr2506573e87.47.1727899328912; Wed, 02 Oct 2024
 13:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
In-Reply-To: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 13:01:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I guess you are referring to the use of a GOT? That is a valid
> concern, but it does not apply here. With hidden visibility and
> compiler command line options like -mdirect-access-extern, all emitted
> symbol references are direct.

I absolutely hate GOT entries. We definitely shouldn't ever do
anything that causes them on x86-64.

I'd much rather just do boot-time relocation, and I don't think the
"we run code at a different location than we told the linker" is an
arghument against it.

Please, let's make sure we never have any of the global offset table horror.

Yes, yes, you can't avoid them on other architectures.

That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
feel are a complete no-brainer and should be done regardless of any
other code generation issues.

Let's not do relocation for no good reason.

             Linus
