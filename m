Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08461272C4
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Apr 2024 20:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712606741; cv=none; b=FJcAhpuRcl6laxErVN5x1xwQK99N704ePcDJPz02Lrz1XyaB+S2gMQXLrkStMGv5ECJYV7jsEg7RCKc2ye5/qwTJibWOhGQD1W4uGueeqpKdXb+E6V7PDsFFE7N+UmnR5Gf9eWGgJO+PIAhfPmCLx0heLTYNDBdwtF6BgARZ8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712606741; c=relaxed/simple;
	bh=82F1MgsQLgdYIQgatWxiRfAXR/TCmhkAjQEqWWRhptw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhicjhUSgwJP/DunFR/gEwKVcpYE2/KE5ddOp9RJEqEjwBMbVnsyKJzYIBELldTxoHM5owKxpV+DRDptIJ/1bQZm4U5cINUOCBmIfu8/Ur5elsQ3JhYq0VNXU1eN1dRQCXhcOsphHceMeKLbm+W/JOYU2DpBC43w5CDAGtLofUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dnMrHPrw; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dnMrHPrw"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so68975301fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Apr 2024 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1712606738; x=1713211538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rRKPouMe4xkFwANgjkQYrxaOlNKZlWPMAGzB1iq7Iyc=;
        b=dnMrHPrwpi3IPqZ2QRyqVC2qmh3Viza0nL1o4K3Z4Jw1r6h+NSUcLwrkWFsycj6xxZ
         1ZdNlvTQruC0UF620knG26qA02oyQFESDUumfmHiLo82SaVUKfH+DlOdFxS8LKmuBjTM
         3GCA8xDghZ/4wAHmTYV1sn/5KhdrrZCtn2GRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712606738; x=1713211538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRKPouMe4xkFwANgjkQYrxaOlNKZlWPMAGzB1iq7Iyc=;
        b=pSiggrUASQ89V0GRe78MJYO0CvwvZMjB0X2aAaya3YiHmutdlsUgykMkNkX+UCj1Wm
         NXi9otPIhg0KNLweDFmzld3xKHEJUWbPNFZGXm7Lt5+gl1wU+RSZ+cNwUb0cfPFhh5li
         w3HoZK++3FtxIdd08ZLyFxK706VfiAYoJoyzxbur+M7h0pVfsRJXQmjkCcMXB7m11qFH
         uN7HyUsmDRB+YYbLrRIiSvU/fcUHdudKQwZSFOtvWzFyUbyFNjWts6Jx0FxkFzH2TRr4
         zdzfjqIZxTf9yb49C3hewyQ098xsutnHM748sKgCvyWj+0Js60OnldXuQjIFdgTBknDa
         7/lw==
X-Forwarded-Encrypted: i=1; AJvYcCXzr9ooDhgKTq/v63bK0ZnxdIOAiOqrVQT/N5m0ACQjgrYT7KDBdP5wC/+BjUhOtep1hAxli4zy1blckKMRH9YJg0G1DDOmtpfL2k1pcL4=
X-Gm-Message-State: AOJu0YyOqaIuH89BjFuutx+xoeC17ATUQ4o+XGL7Z4b0mfG2tGOkPDOL
	LYmLsU8TJsMBaQZuqdCD63QCl+3l5dXR+xA3r6F6JqOjqlsVWl5MMTjo994+c+f3FqQy7Q/Vgtp
	53+pNog==
X-Google-Smtp-Source: AGHT+IFM9UZ4tMHlt3rgSJ/AzLwh4d73rOa6yDX4iL+wRgdQukG0aSj8s6BAMr5aYwY8wQqRR3IucA==
X-Received: by 2002:a2e:7d15:0:b0:2d8:63a2:50dc with SMTP id y21-20020a2e7d15000000b002d863a250dcmr6717450ljc.48.1712606737807;
        Mon, 08 Apr 2024 13:05:37 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id z26-20020a2ebe1a000000b002d80e833d7asm1275727ljq.81.2024.04.08.13.05.37
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 13:05:37 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d09bd434so5071065e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Apr 2024 13:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUhxsxZiTv/dLISQeJa8IE5e62LZz0Zqasf7JQyrrSsZkFFY6geDa0YcrJSpJv2/y8OsvyOkstVUBsPMV1mCwMwdeWvTCj+T9tL0mXRIU=
X-Received: by 2002:a05:6512:60f:b0:516:9fdc:2621 with SMTP id
 b15-20020a056512060f00b005169fdc2621mr6538971lfe.0.1712606737016; Mon, 08 Apr
 2024 13:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <ZhQVHZnU3beOhEGU@casper.infradead.org> <CAHk-=whmmeU_r_o+sPMcr7tPr-EU+HLnmL+GaWUkMUW0kDzDxw@mail.gmail.com>
 <20240408181436.GO538574@ZenIV>
In-Reply-To: <20240408181436.GO538574@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 8 Apr 2024 13:05:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wispSt+JezguriGPKnJ0xOUWG_LFDgaM-NVJu6cVa+-xw@mail.gmail.com>
Message-ID: <CAHk-=wispSt+JezguriGPKnJ0xOUWG_LFDgaM-NVJu6cVa+-xw@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>, Philipp Stanner <pstanner@redhat.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 11:14, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, PA-RISC is no better - the same "fetch and replace with constant"
> kind of primitive as for sparc32, only the constant is (u32)0 instead
> of (u8)~0.  And unlike sparc64, 64bit variant didn't get better.

Heh. The thing about PA-RISC is that it is actually *so* much worse
that it was never useful for an arithmetic type.

IOW, the fact that sparc used just a byte meant that the aotmic_t
hackery on sparc still gave us 24 useful bits in a 32-bit atomic_t.

So long ago, we used to have an arithmetic atomic_t that was 32-bit on
all sane architectures, but only had a 24-bit range on sparc.

And I know you know all this, I'm just explaining the horror for the audience.

On PA-RISC you couldn't do that horrendous trick, so parist just used
the "we use a hashed spinlock for all atomics", and "atomic_t" was a
regular full-sized integer type.

Anyway, the sparc 24-bit atomics were actually replaced by the PA-RISC
version back twenty years ago (almost to the day):

   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=373f1583c5c5

and while we still had some left-over of that horror in the git tree
up until 2011 (until commit 348738afe530: "sparc32: drop unused
atomic24 support") we probably should have made the
"arch_atomic_xyz()" ops work on generic types rather than "atomic_t"
for a long long time, so that you could use them on other things than
"atomic_t" and friends.

You can see the casting horror here, for example:

   include/asm-generic/bitops/atomic.h

where we do that cast from "volatile unsigned long *p" to
"atomic_long_t *" just to use the raw_atomic_long_xyz() operations.

It would make more sense if the raw atomics took that "native"
volatile unsigned long pointer directly.

(And here that "volatile" is not because it's necessary used as a
volatile - it is - but simply because it's the most permissive type of
pointer. You can see other places using "const volatile unsigned long"
pointers for the same reason: passing in a non-const or non-volatile
pointer is perfectly fine).

              Linus
