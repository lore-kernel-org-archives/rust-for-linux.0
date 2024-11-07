Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC4217465
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731008284; cv=none; b=dnMQoWQTDLnZMP87KzJV4hsVH1dM5uWFJDIgVsjSPZ7RibHzKUXQSkQTRjVqStOgD0SnRj9t7pWZWy0AwNIIxt1zyV8T5QrvuZ5RF3aObnwmP9Nd7CELixROA3ZQhtx39oAuE1JAP9OAek2lCLYRUxyxOjrdRB46tX3Hsb8QPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731008284; c=relaxed/simple;
	bh=OQrBkqQtsvfo3sVV9/HnVk7awZnGrUeB4xmdydHvXaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAwKGKWFsi9vZeS3o9YLM0Fd5+A/4yTvNPKb3vMRMbvUxKXxKBdSJdCdSQkO1ahRda291tSmvXqyigS1w2yLCj1iOCScdZ2yqBQq8djw3GKafkf01rw59fjtetHBM7wl2Zvey598BVkw6frO0XJ/mSdu3JKdmAuL/3HBe3nhQXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ikLmlUL8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ikLmlUL8"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e19d8c41so4704e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Nov 2024 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731008281; x=1731613081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOj8LMAazYpTjfu5mrOLk8RCDPLc0j+wCQq6uBtbnSs=;
        b=ikLmlUL8cMVInuKhbMVsSZ6FYcRVXAPcqIa6caRCNNnnltidGQfGESUsfQi9R/0MMZ
         07dyYLEBiy0kOaL3osXflyrNIyTPUeHq+eF20jKcEeSJ8N8LT2klLl0+PCwPGMum1bSw
         ox6o2/VEtFjgG6U44kaxHuWOPNbYC4ApJ7FHbKHEziOsWdL0OoemeNXqyNpqHRjeEgeA
         zZhK2ZDSSaEWXdnevPUOsS2obHBPyktma3j5Jg/TZVt0s8ahkEBmxUWAXJ3PeFGKJW6A
         ry1qNWnCym5xjGHdgci4hYYfTXKR7HaaZp9O+9Q8GpyhqWB6ZteGbLhxROB3fpF4794a
         q5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731008281; x=1731613081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOj8LMAazYpTjfu5mrOLk8RCDPLc0j+wCQq6uBtbnSs=;
        b=dq5bqGUQk3CuJdo2sC9mFP3ZICW+QkQeKCUbxDVy2eYz5w317zY4saNchmtqc9RdmD
         w228DwFrAX47sAEvNrHwPLPIaimBC/Grs6XuRbEUmzItwtI2UynakljdFGNFwW9BF2qv
         oZd44ubwY1qolZZXJjnA7fE1e/NuM6N88FWDL40r5l7vRmcwWh059psy98nu3s1JqvRT
         vE2rIdgQPBLtPcj1FpiCZYy+wk1wjg2JESaAiGFJOaG17Om9Lv57JReKEh82ULOPdnhJ
         B7ilW5qMPhhwC8hDS8Thw93MtR93TM5xlJ9R4VdjdT0V+w7bIQvTh/tjW5Ke6OesjDuI
         z3KA==
X-Forwarded-Encrypted: i=1; AJvYcCUtZeCFOXvMyOhYe7XMu7yNbMbeo0FVBWcVktKjzruPkoGYDzY4x81T/UQfOPP5+3AZh/6F2qkxgitrof9c6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6I+kNZvMDHVLgPR6E6MP3/5KkGfrPu3wiKgQJeZPORlhJQz1c
	2Ml28CB51hlcBWhkiJoDfdhvqfRcR6OSWpI4JRH4AV0WrVKd+ICf4HbHd21KezK39RfTkUSilTQ
	ul3MN7qAYJERanV2mI4qtQNYP9sNI644g41Qh
X-Gm-Gg: ASbGnctudZabzGc1PnpSDONEpG9SSVfxjw6zg3do9ZH7teUEl/0/cZrr3MXX70qsgIs
	qTWrT76yK9vQ8tYTGR9NcC6UKI4WG0YNMLIl3pbKeJhNS+X4ceAVRQpT6mU2cyg==
X-Google-Smtp-Source: AGHT+IGExvGXqzYeYDQ4rDspkwVFg2PIUqBXwcbJS7a2hiTewgKwW0pQmiUCGPl4ZzxqFZQAq3zzHYeO+DEmkcjl1iI=
X-Received: by 2002:ac2:4e44:0:b0:53c:7652:6c97 with SMTP id
 2adb3069b0e04-53d811f1d2cmr340579e87.2.1731008280784; Thu, 07 Nov 2024
 11:38:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org> <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <hs5fxluchiconuonhziu3qh2ol5bsdxva3cuny2mit4i3equzt@ieueiius5x4w>
In-Reply-To: <hs5fxluchiconuonhziu3qh2ol5bsdxva3cuny2mit4i3equzt@ieueiius5x4w>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 7 Nov 2024 11:37:49 -0800
Message-ID: <CAGSQo00H+K-Sr1F37N27RutWthYRd0o4QbP_Z-kfWwb65L+Kxw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 10:27=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> >>
> >> > If booted against an old kernel, it will
> >> > behave as though there is no modversions information.
> >>
> >> Huh? This I don't get. If you have the new libkmod and boot
> >> an old kernel, that should just not break becauase well, long
> >> symbols were not ever supported properly anyway, so no regression.
> >
> >Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
>
> how are you setting NO_BASIC_MODVERSIONS and loading it in a kernel
> that still doesn't have that, i.e. before EXTENDED_MODVERSIONS?

That action would involve e.g. building a module against a 6.13 series
kernel with NO_BASIC_MODVERSIONS and trying insmod it on a 6.12 series
kernel. I know it's not supported, I was just trying to describe the
full matrix of what would happen differently with the proposed
additional config flag.

>
> Please Cc me on the format change and if possible submit the libkmod
> support.

It seems awkward to adjust kmod to support a format that still hasn't
been accepted to the kernel. I can send kmod patches to support it,
but since this patch series hasn't been accepted yet, it seemed a bit
premature.

I'll explicitly add you to the format change (patch before this in the
series) and add you to the whole series in v9

>
> thanks
> Lucas De Marchi
>
> >then load said module with a kernel *before* EXTENDED_MODVERSIONS
> >existed, it will see no modversion info on the module to check. This
> >will be true regardless of symbol length.
> >
> >>
> >> I'm not quite sure I understood your last comment here though,
> >> can you clarify what you meant?
> >>
> >> Anyway, so now that this is all cleared up, the next question I have
> >> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> >> userspace requirements aren't large at all, what actual benefits does
> >> using this new extended mod versions have? Why wouldn't a distro end
> >> up preferring this for say a future release for all modules?
> >
> >I think a distro will end up preferring using this for all modules,
> >but was intending to put both in for a transitional period until the
> >new format was more accepted.
> >
> >>
> >>   Luis
