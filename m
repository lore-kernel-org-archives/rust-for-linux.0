Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2A302CDB
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803425; cv=none; b=SxAdyYanwCFziGFjPFWcmQxkt6YWZgQS+3WxtULB3+6Acvap1PDHslWGrp2APoizavWIoolPwc11JU4CVYTIjUf35Ps54ITl+CbPd/yXWnIG4AZPJp/cdp4dqdq31LhprDTK2jJTn1v6xB6u2Ny4WiGMXRgYDRTKFHR6SVSg+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803425; c=relaxed/simple;
	bh=gRqU1xzOrRjzeCyUuiZjwTh+L281vaPrDr8rLgP04ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiCtZnQAfntzMoIbKyqydBeGqTX/ipsUnPhG/JeUqx+iJa6wMdzc8ZUyPNAFYr3Zedvm0Fm4EGkrCb5fFHL6/kXw8nQ8RUhpOxjeJ3jrTrWL6B85EVzd3EKeP2sPQpPq/+o/uoaxYVIpxglHTr0Wc3HfOkGdpqfOTe2TC1TzC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffYFF3rp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffYFF3rp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so1856793a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758803421; x=1759408221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpogRHSrLfl51nWywJppLMZXYXi2KQs1G3uCf0+H8cQ=;
        b=ffYFF3rpF3AtyiFCyhGdMTyzBqauIB99fkowWzKLiUQg8JbTkpM5ilCUyQ7yPuBs7n
         QV8Z4QOnuXWptDCnA+w5Efe3QDyi+WpC4lhCcvW/CaOCpJ3W0XY29BVJSNONJu66NuIk
         YDKfUdXBcol8z9+TONQ3MbW4OJJP3So9Renu4heqxxzLsu91l0ukzfV3/cilH6bPaK3H
         A5fohQqqDR/u2+BmukgkTWnEBSwskjoSylmz/VfIiAyQCJbUXc9dE4ZDVSDKHtw2A1b6
         XnZI6lUq8vhSO9hnI7fpo2jMnLG+ub3wS5ldkEfKl8cZLgi+VhGb+D4cOlTS5I6qVqgX
         mUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758803421; x=1759408221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpogRHSrLfl51nWywJppLMZXYXi2KQs1G3uCf0+H8cQ=;
        b=vWSdoDTeMXv9465sZLK65+OXQzsilI/qcyEFYOdt4YpCQ/amA+vjO9fp8hnt1tMpDn
         GTcuCvHNh4wrZOzgD36rch5WAHYHCPEMfY1/wCmlA6sDqh1fdF5WIEbdld9c/OZB3REB
         PGL0uHUGBa6tLs/G8GHpTqUSM6G3Q+Y3Mjgi7jo9+GPDrarLblWyJMsMCOl3FznY9jmP
         Uo8gxfJu22u4X0WQlWgJ+1T5KCkV8xbfkPxmYiB4NZoLjMuchLgxK7pl0bT126qtLR6Q
         oEXRwGUvIt7Bb9c9aJkrX0Yr/exQvTrTIkS3hwxBO/rp589PJ/uN/J6CzVNZnn3Qcmcv
         7MkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG54pQi31PUkwOV58IQ6hTLS0xViqI7fM8yTs6AWtiTlupbM88RNRKZohgc6mPXMrSLJ2lAOQxrck0yIUK+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7t7AjxwVLA4Hi6cM1rgy7p6GQ9G0Gu8lLljMQi8h8oohdpkKo
	0Woor177m1M7CY/MxUUGfdbzf0j2EW4rdY8jdqw3p9KV/wDbtzXLsBYrNnJpWR2u58NWln6t0Vd
	t3Yf5xsCL9pdjPvn5XFJu1zAOqJhb9hg=
X-Gm-Gg: ASbGncvzLH2BZQ3wXVzhR7QaHMKSIJSmJSsL0qvzLaBRC1+i+1uPV1l0US9I9IJ6l9x
	33MJCYTDaR6nCWmxslWuOwnPH5ML7m1twl/yh1AQ1MwFvhwdYHiXMO59t7gpOlyHlaAwwsvcUtp
	wET6MWadBDpStRrX/SCODlrDKgy/hz0n0IYJaNevveNZGG+z1U6JDCtMaovlfF0GUavk5cHUKSc
	49i
X-Google-Smtp-Source: AGHT+IGrMTtF3rO6PyqglimJ6kWsoCOnyf9RbZPnOG2/Nl32fMXOunJIE5E6zYa1d9+08xohVhzghLhulRn9g+pvf4U=
X-Received: by 2002:a17:907:3f87:b0:b09:2331:f150 with SMTP id
 a640c23a62f3a-b34b84aba85mr396036566b.16.1758803420120; Thu, 25 Sep 2025
 05:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org> <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
In-Reply-To: <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 25 Sep 2025 07:30:08 -0500
X-Gm-Features: AS18NWByhWo0dHTSYL4t2oFRcok3gmrZ-pBxSOOqriMBIQLUznFC4iXNOpyJQRE
Message-ID: <CAFTtA3Nxq0UmXcuN7jmQOiuTbrenKbR4ihH027ya1WWybgLq4Q@mail.gmail.com>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, kito.cheng@sifive.com, 
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
	cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
	David Hildenbrand <david@redhat.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Florian Weimer <fweimer@redhat.com>, bharrington@redhat.com, 
	Aurelien Jarno <aurel32@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

On Wed, Sep 24, 2025 at 1:40=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
> >Hi,
> >
> >On Thu, 31 Jul 2025, Deepak Gupta wrote:
> >
> >[ ... ]
> >
> >> vDSO related Opens (in the flux)
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> I am listing these opens for laying out plan and what to expect in fut=
ure
> >> patch sets. And of course for the sake of discussion.
> >>
> >
> >[ ... ]
> >
> >> How many vDSOs
> >> ---------------
> >> Shadow stack instructions are carved out of zimop (may be operations) =
and if CPU
> >> doesn't implement zimop, they're illegal instructions. Kernel could be=
 running on
> >> a CPU which may or may not implement zimop. And thus kernel will have =
to carry 2
> >> different vDSOs and expose the appropriate one depending on whether CP=
U implements
> >> zimop or not.
> >
> >If we merge this series without this, then when CFI is enabled in the
> >Kconfig, we'll wind up with a non-portable kernel that won't run on olde=
r
> >hardware.  We go to great lengths to enable kernel binary portability
> >across the presence or absence of other RISC-V extensions, and I think
> >these CFI extensions should be no different.
> >
> >So before considering this for merging, I'd like to see at least an
> >attempt to implement the dual-vDSO approach (or something equivalent)
> >where the same kernel binary with CFI enabled can run on both pre-Zimop
> >and post-Zimop hardware, with the existing userspaces that are common
> >today.
>
> Added some distro folks in this email chain.
>
> After patchwork meeting today, I wanted to continue discussion here. So t=
hanks
> Paul for looking into it and initiating a discussion here.
>
> This patch series has been in the queue for quite a long time and we have=
 had
> deliberations on vDSO topic earlier as well and after those deliberations=
 it
> was decided to go ahead with merge and it indeed was sent for 6.17 merge
> window. Unfortunatley due to other unforeseen reasons, entirety of riscv
> changes were not picked. So it's a bit disappointing to see back-paddling=
 on
> this topic.
>
> Anyways, we are here. So I'll provide a bit of context for the list about
> deliberations and discussions we have been having for so many merge windo=
ws.
> This so that a holistic discussion can happen on this before we make a
> decision.
>
> Issue
> =3D=3D=3D=3D=3D=3D
>
> Instructions in RISC-V shadow stack extension (zicfiss - [1]) are carved =
out of
> "may be ops" aka zimop extension [2]. "may be ops" are illegal on non-RVA=
23
> hardware. This means any existing riscv CPU or future CPU which isn't RVA=
23
> compliant and not implementing zimop will treat these encodings as illega=
l.
>
> Current kernel patches enable shadow stack and landing pad support for
> userspace using config `CONFIG_RISCV_USER_CFI`. If this config is selecte=
d then
> vDSO that will be exposed to user space will also have shadow stack
> instructions in them. Kernel compiled with `CONFIG_RISCV_USER_CFI`, for s=
ake of
> this discussion lets call it RVA23 compiled kernel.
>
> Issue that we discussed earlier and even today is "This RVA23 compiled ke=
rnel
> won't be able to support non-RVA23 userspace on non-RVA23 hardware becaus=
e".
> Please note that issue exists only on non-RVA23 hardware (which is existi=
ng
> hardware and future hardware which is not implementing zimop). RVA23 comp=
iled
> kernel can support any sort of userspace on RVA23 hardware.
>
>
> Discussion
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> So the issue is not really shadow stack instructions but rather may be op
> instructions in codegen (binaries and vDSO) which aren't hidden behind an=
y
> flag (to hide them if hardware doesn't support). And if I can narrow down
> further, primary issue we are discussing is that if cfi is enabled during
> kernel compile, it is bringing in a piece of code (vDSO) which won't work
> on existing hardware. But the counter point is if someone were to deploy
> RVA23 compiled kernel on non-RVA23 hardware, they must have compiled
> rest of the userspace without shadow stack instructions in them for such
> a hardware. And thus at this point they could simply choose *not* to turn=
 on
> `CONFIG_RISCV_USER_CFI` when compiling such kernel. It's not that difficu=
lt to
> do so.
>
> Any distro who is shipping userspace (which all of them are) along with k=
ernel
> will not be shipping two different userspaces (one with shadow stack and =
one
> without them). If distro are shipping two different userspaces, then they=
 might
> as well ship two different kernels. Tagging some distro folks here to get=
 their
> take on shipping different userspace depending on whether hardware is RVA=
23 or
> not. @Heinrich, @Florian, @redbeard and @Aurelien.
>
> Major distro's have already drawn a distinction here that they will drop
> support for hardware which isn't RVA23 for the sake of keeping binary
> distribution simple.
>
> Only other use case that was discussed of a powerful linux user who just =
wants
> to use a single kernel on all kinds of riscv hardware. I am imagining suc=
h a
> user knows enough about kernel and if is really dear to them, they can de=
velop
> their own patches and send it upstream to support their own usecase and w=
e can
> discuss them out. Current patchset don't prevent such a developer to send=
 such
> patches upstream.
>
> I heard the argument in meeting today that "Zbb" enabling works similar f=
or
> kernel today. I looked at "Zbb" enabling. It's for kernel usage and it's
> surgically placed in kernel using asm hidden behind alternatives. vDSO is=
n't
> compiled with Zbb. Shadow stack instructions are part of codegen for C fi=
les
> compiled into vDSO.
>
> Furthermore,
>
> Kernel control flow integrity will introduce shadow stack instructions al=
l
> over the kernel binary. Such kernel won't be deployable on non-RVA23 hard=
ware.
> How to deal with this problem for a savvy kernel developer who wants to r=
un
> same cfi enabled kernel binary on multiple hardware?
>
> Coming from engineering and hacker point of view, I understand the desire=
 here
> but I still see that it's complexity enforced on rest of the kernel from =
a user
> base which anyways can achieve such goals. For majority of usecases, I do=
n't
> see a reason to increase complexity in the kernel for build, possibly run=
time
> patching and thus possibly introduce more issues and errors just for the =
sake
> of a science project.
>
> Being said that, re-iterating that currently default for `CONFIG_RISCV_US=
ER_CFI`
> is "n" which means it won't be breaking anything unless a user opts "Y". =
So even
> though I really don't see a reason and usability to have complexity in ke=
rnel to
> carry multiple vDSOs, current patchsets are not a hinderance for such fut=
ure
> capability (because current default is No) and motivated developer is wel=
come
> to build on top of it. Bottomline is I don't see a reason to block curren=
t
> patchset from merging in v6.18.

Sorry for reiterating, I have been gone for a while, so maybe I lost a
bit of context.

In that case, should we add a comment in the Kconfig that says "it
breaks userspace on older-than RVA23 platforms"?

Perhaps a very ugly way to make RVA23-compiled kernel compatible with
pre-RVA23 platforms is to decode maybe-ops in the illegal exception
handler...

Btw, I don't think kenrel-level shadow stack should be an argument
here, as kernel-level APIs are more flexible by nature.

Thanks,
Andy
