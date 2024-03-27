Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBEB149DE0
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566468; cv=none; b=kXo/pGZa4wh1vyrv9eyGDMboQMoB5Ozz6Sf1VYu+k5RwZUOKojTy7NP45Bbs3PA4hhQTekMzukaSObvXDbqpRsw4oRxaNTwQyvYGL2QUbo3fFwVrM2V7iINbnCC1wJeXufOjDBQUZ5BbJXLWf00+mVdhggOPP/7fIepxDj63pQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566468; c=relaxed/simple;
	bh=jMoBfFRvYMHbxV9SVPKA1xW7pPTPIbFhe56hTJM1VbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntIKSixzhhHjVeHbcXgHcaBJDDpQh3ybFyEr9nXgR5wLHNV3Rn58Ao0Y6EcWVj1gvtzOw/PbK4uwfPQKM3/gcgTJ5eSMBxw3+PT92JikhR5z707wszo7tNX35jSeEcIlbahM3SMNG37I5bsqbDUAfSW736ihaX3roTVJnu8cx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JPvKg6Ah; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JPvKg6Ah"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a466e53f8c0so19972566b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711566464; x=1712171264; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WdyHGSi984C+8z92+nQdjQTGDoXLLzpQZD6STeLATA0=;
        b=JPvKg6AhSxwxn26E5KmjKGdQXxguGMOLAN2319N2AxE5GjY48HrbTA3+vF6Ei5wTor
         XTE242PcrLVji1BvS+a78vvqa+hntHYtFNkw2YtbxIe1eqkuyMYiE4/GtndJqd93bbvX
         QxPzFsKj1Uy67RXr8SWzK0x1+f6o92H3g9GaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566464; x=1712171264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdyHGSi984C+8z92+nQdjQTGDoXLLzpQZD6STeLATA0=;
        b=s8peN+ickyZkulBcO3JHbY5O3dNsQCuf30EMjYhHfMAPuLGj5+nCbTW60h1c7WVc5i
         0DSMqG0zvsbma/VkfvA91q6QWiv3AkgUPacgwHU7qKp3X4KxnLp9oA37oytwMP5muTZ4
         MC+npfrUJvbR07iak+Hzp+Mevi5YEfG9DvpSd0MZN1TqlNVxHlgQ73e2gWvTUuuR4wbn
         /PQj38W0N/tYWkJxuyWKu+rMWW457yfllK4tec9hNWOV3OraK52etQ6sCTb0LJzSJ7uK
         gDYWEf0PxMxzGcX67Tf+LUMhmpKAU5wMM7syLBiiwZBXhDsYoVwLJDfcRqJMyXS4Cxr1
         zpWA==
X-Forwarded-Encrypted: i=1; AJvYcCUC0QWyPZlormdABhFtvSGqMTUI+dUy8LiSob1pruKbUEVLO0/04lVpNHW5JPUREVK2JjWA+BgeBr/weYGUtkYJPtfDTLzMtSgdXTWSKxk=
X-Gm-Message-State: AOJu0YySOxaq2n0sgrzCxAjWyet6OAhRYzpXGSXTdSR+46Sw95Q4jGdK
	PXzoqpRtplPXIkkmNrHt/NBRJf3+kSlLIQaCjddUdhsMkc3BGuLo67bUauL2GhYzXfeHH/WjmGe
	kQs8=
X-Google-Smtp-Source: AGHT+IGqOK4GRx+Q91gmpAzkDLtvupSMKORBbM21FJ4LffkctvDgukgfM35hTU2a8Hu/TULOiAW4tw==
X-Received: by 2002:a17:906:3505:b0:a47:4bd6:9857 with SMTP id r5-20020a170906350500b00a474bd69857mr214608eja.64.1711566464606;
        Wed, 27 Mar 2024 12:07:44 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709060d9300b00a45c9945251sm5703000eji.192.2024.03.27.12.07.43
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 12:07:43 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a467d8efe78so14594966b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 12:07:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZd4QdBwLewb4bMe/B3vt042PcCpYCFp89C6qCGtMF3bQ7yM9eKXIyQf5JCC/e9vmO9LHg+7igKlIKDDSe4n6oT5fHqNsVD0RpcyN87lM=
X-Received: by 2002:a17:906:6d5:b0:a4e:14b3:e7e1 with SMTP id
 v21-20020a17090606d500b00a4e14b3e7e1mr172960ejb.42.1711566462952; Wed, 27 Mar
 2024 12:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey> <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com> <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
In-Reply-To: <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Mar 2024 12:07:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
Message-ID: <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: comex <comexk@gmail.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, 
	Philipp Stanner <pstanner@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 11:51, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> On Wed, Mar 27, 2024 at 09:16:09AM -0700, comex wrote:
> > Meanwhile, Rust intentionally lacks strict aliasing.
>
> I wasn't aware of this. Given that unrestricted pointers are a real
> impediment to compiler optimization, I thought that with Rust we were
> finally starting to nail down a concrete enough memory model to tackle
> this safely. But I guess not?

Strict aliasing is a *horrible* mistake.

It's not even *remotely* "tackle this safely". It's the exact
opposite. It's completely broken.

Anybody who thinks strict aliasing is a good idea either

 (a) doesn't understand what it means

 (b) has been brainwashed by incompetent compiler people.

it's a horrendous crock that was introduced by people who thought it
was too complicated to write out "restrict" keywords, and that thought
that "let's break old working programs and make it harder to write new
programs" was a good idea.

Nobody should ever do it. The fact that Rust doesn't do the C strict
aliasing is a good thing. Really.

I suspect you have been fooled by the name. Because "strict aliasing"
sounds like a good thing. It sounds like "I know these strictly can't
alias". But despite that name, it's the complete opposite of that, and
means "I will ignore actual real aliasing even if it exists, because I
will make aliasing decisions on entirely made-up grounds".

Just say no to strict aliasing. Thankfully, there's an actual compiler
flag for that: -fno-strict-aliasing. It should absolutely have been
the default.

                 Linus
