Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200483AA1AD
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212214; cv=none; b=SJBaNEbwYTExpxGVE56XGHjJPqUJJMDDYf/S172Ibf3LiESLSZM6ulFgZWNSFmRkoPWEI6Te/LzlgZWzZcvUqSXDKvcHVGuK3tokaEW4RwROoEy+ZuubQQBP0GaGPcKvVZC6KJmriwfjLx3bX5Y8G+HPECotMjAz4EG2LgdR6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212214; c=relaxed/simple;
	bh=Ek8/E1uf8JioxwC17102C6P6AwOf+FpydRqado7kk28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHKBxMkBtn9LIObNROkruYqFEm6gEoKPvXJImDdANgf90T26rsLwHaTvNNGpjUOGErReEHBuBOMHxql0iWN8P55MwfcgUINceILk5N69aIpzqc+pLiqSRyCGFoWqIAd48SqUVw4zC31g4LRwx2A9TFbVisxT7R1kTtGusIuXW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEAUvTk0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UEAUvTk0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806e7c4220so9170415e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 05:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770212212; x=1770817012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=UEAUvTk05UlKoVMpM4xJJH9xlWz1T77Kqe/cInVIi5sUYi61puCULFCDvP1PUEmJXx
         yEqMKTj2HrUWLC9/gmbaHard8dmyNC5xxFTRmPgVVnuKlTKOpDXgvu2X80uzOeAkU2Pn
         x/z5/r/tNdRUG7yJWgoOFZZfiXciz12kcBg+mKF09sD3eGFF7Z7uQhw21ATCX/IWRzDE
         GFc1lb+y6k9+xCU68CU9OMrTDm2R52/hiPKy/hDBSP9XV6OlzOucliKD91BJPv6xvj7U
         TLpC5e7btBifxf/r2RYY65Vp7uieaEVUC0ygzwiXvdTZ8vh4ZT08OpryptdmUFNSVp2T
         WX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212212; x=1770817012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=SqFVZYTD9scy0G0uwN53xRYk6yvaor08BYI7FztPyQk0hhYmhnq1e9wCCQEltUVAvg
         mzmTWWHr46BmIaZPKoSbEY04Dv2Fzz7kVsdKxMsUdwLHA/yrO9H/TTia7UYuLAbPIMVF
         GkL60nPfmwrAn1VA9WAf3SSFZiNDoCGGevnAHRhyhCHgwWLOs76zZdaQCSYBN28odvKx
         KbV4tJFwzA3Xz6yW7B3S25ysLnCNY8nqC9QRlb7z64sm1HNji41ugwX61Od0Q5DaGP/B
         2FJZZuUdXyfev7rOrVkMdXEGGqi3nu+uoWJFnlh/kxYFvQLBDE37JZFwXLBnrViCNXdW
         v7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWQaCb2GQiBRZC4tX93oO1pVMh9Ith/1/KMqI3vs2ipJJFYAovnRKQgCOqbbRVP5HdNX/j/5jOATWhaF8ROJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVa76RdCjvpRO13NEVOIRoB4euK8hXoEdC/TzxHglh36n+CwK
	mSIo/cmctThLXb5QEjLYgDPdHN3MW9rMeFGw5gkAt+z48lOgHswJ1cb5rjlt4eNbPIEcQZG4Jds
	6rgG5hX1r+Ws1nL9DKA==
X-Received: from wmqu6.prod.google.com ([2002:a05:600c:19c6:b0:480:4a03:7b76])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c17:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4830e930f73mr44864985e9.11.1770212212161;
 Wed, 04 Feb 2026 05:36:52 -0800 (PST)
Date: Wed, 4 Feb 2026 13:36:50 +0000
In-Reply-To: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net> <aYNBtc2Jbtg9sLIE@google.com> <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Message-ID: <aYNLcqEo45oWpRYi@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 02:06:53PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:
> 
> > Is there any reason to not make it Rust-only but for all Rust code?
> > Making the / operator work seems like it would be a good idea.
> 
> Why would it be a good idea to have it work on non-native types in Rust?
> 
> The reason we don't have them in C is because non-native divisions are
> expensive and doing them should be a conscious choice. The very same
> argument should be true for Rust code too.

I suppose that's fair. Perhaps one way to go about it could be to create
a clippy lint for 64-bit divisions telling you to use an explicit
division method?

This way cases such as `core` that use division can still use the slash
operator because the lint is not enabled when building core. And normal
kernel code would be told to use the explicit method instead. Or kernel
code could explicitly choose to silence the lint on a specific method if
they want to perform a lot of divisions and know what they are doing.

Alice
