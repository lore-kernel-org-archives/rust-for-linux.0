Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1325CC71
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608569; cv=none; b=qZSZxQNv6sQYHbMjXf49Uc1riBSQA1UAfIIJR1sa35QOBKJsnhIW/WWSNiSuDB14o0pRB142BWZIgMTpACDmRJuqA7Yz227PcE72+Y0P9sGscfmZORl7WVpXh7d6cvwMujMohN1EwVM5DrZr/cgf0L2XVEOUZ6HgHWgFDgszijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608569; c=relaxed/simple;
	bh=X14QyeY7juiG19kFhE8jOTcAC9LX5WqrcvQ1QAzL4R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLxk1hvMScE/69hA57Y3IvuGnXwNaHDCTglFRbh3tvjWflcepWrWjuAMPQhe6uJhLbvGErUzckUcJQWJ+oTGaLW4M7jtjxxJDW/Ie9TB+BT8xJkG0BHHzFr7NwEx6LURTQjHic3W4QP5S0ua7qAFvRRK0HcdpYbmA+Z6AiA0TZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cJqTK6CE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cJqTK6CE"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb8045c3f3so30026466b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740608566; x=1741213366; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzpvSa7nrVjiWlv0eKU2ozCFswwUHSEDAs+O1FlWijQ=;
        b=cJqTK6CEpwqU2jCWVGjC/8NFLzaicOJx7zfaIryha6Avx6rPRRfbtloFHkah2hCTbm
         rS7/FPmZs9E1C12vWI7wfB4NV8P1Qhlg2ewBLqUJ087x2RWiff28Sas0CoEidPBrcNGr
         lO6mDAHiU/z5mvxnLbBHboailEAjYVL75pLCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740608566; x=1741213366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzpvSa7nrVjiWlv0eKU2ozCFswwUHSEDAs+O1FlWijQ=;
        b=b2Bl5pcpClNZ8nR6qqRejliNppJvJTp91/DxrJoatxxefCs3dPQjsGcRS1n43r5zZf
         O1lzQvHAdUGNgNVDAgnt03cuovPVAav6ldxTVqEZ1Ido4aIw5cUqbJaPit8L1jn+KQe2
         Jad11w3+zHcEVNsHsSteTGzxyxMP3FLI7gnknGa5FicjFvjz0xy8NVHDlpi56au5ZqZl
         3x5GtQoZKBLVB4slsU5CLdZ0edgoTMaT/ft3d5TNSjokf5ZNZ5mO1519C5Zb7GXUPZWy
         AJpPE1VNzezK3nKisBpuliIw7rmddjC/ugYA8zJ8zEINAk5S5eMtU65wp7m+vfbyuBSY
         IvDw==
X-Forwarded-Encrypted: i=1; AJvYcCWTN33gNPp1yX3BKWi5PiYJ65IC/MdtHxywmb5S6qVdwoM5aJmSWcpnxE7ID6z4fv+jklZMA0rpjCHW9koPVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgMGBJcYXsnldr+4gCEfgM6bRDfUeTOYO/3CpHAwIfi9/f3XD
	PR8yI5Ezy7Vunw6WrQG8VLD9y77LNWL/k/EkJ6Tz3p3qjnAxVaec+tux7OHoYw0USvVgQjruqfY
	799KD2w==
X-Gm-Gg: ASbGncui48yKcn0oxVYdftAmCHCUz4Y/39Pxmrne+Jh4IyJsRIySQeWYYpyaHgeYkgM
	tFdldS25HdvsVI8fTzQ+9JdRx+BTu9uABggfQAYbBzxlzs8EgHV3szZlUrY8xjVakdzFjmnQNSP
	qrfsUWnFooW/XAPgm+bGjd20wIv6UCbFB2fO8ZpA3cEEpW6ox9nNd/7Qt14lGfn9bGiNr0Oks/K
	3XI/DxNEiDOhUDXZ08tknEH8ZsAR7FIQXDDQYBG3Gj3NvH5ifvDT+oMHqjQtn0RbQRoE0THDIx/
	Mz++jJGWh0bXjEo8/oRD60h0f7w96CLyR0f0hvvJEdJAvy7dy4bmWsSEXqg2V2UKk9WXzOQLkAK
	+
X-Google-Smtp-Source: AGHT+IHZavbVwN9n6ufBEpruKfotrlhfNY/VRw/s6OCOkDZ+okgGO330+/yXj+FebbpnoNFXY4523Q==
X-Received: by 2002:a17:906:3292:b0:abb:e6e1:22c1 with SMTP id a640c23a62f3a-abeeef64189mr627288166b.35.1740608566040;
        Wed, 26 Feb 2025 14:22:46 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7c0d8csm12077766b.183.2025.02.26.14.22.43
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 14:22:43 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abee50621ecso39177166b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 14:22:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP0peVvhwvhLxkjxEYmrUizAdlypCqSVyHVPjslHEmdqsmVNn0S45rsq5pR7GkUmMFZBeF31u907wV782A0Q==@vger.kernel.org
X-Received: by 2002:a17:906:830c:b0:abe:fffb:f1ef with SMTP id
 a640c23a62f3a-abefffbf91dmr373374066b.20.1740608562825; Wed, 26 Feb 2025
 14:22:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
In-Reply-To: <20250226171321.714f3b75@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 14:22:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
X-Gm-Features: AQ5f1JoQa0DT2FRkZg7eNVadgxV73SepUYePI-LWmsRCiLb5e60q_ApFv3ZzBm4
Message-ID: <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:12, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I take this is what you meant by following what the code does.
>
>         r = global;
>         if (r > 1000)
>                 goto out;
>         x = r;
>
> Is the code saying to read "global" once. But today the compiler may not do
> that and we have to use READ_ONCE() to prevent it.

Exactly.

And as mentioned, as far as I actually know, neither clang nor gcc
will actually screw it up.

But the C standard *allows* the compiler to basically turn the above into:

> But if I used:
>
>         if (global > 1000)
>                 goto out;
>         x = global;

which can have the TUCTOU issue because 'global' is read twice.

> I guess this is where you say "volatile" is too strong, as this isn't an
> issue and is an optimization the compiler can do.

Yes. 'volatile' is horrendous. It was designed for MMIO, not for
memory, and it shows.

Now, in the kernel we obviously use volatile for MMIO too, and in the
context of that (ie 'readl()' and 'writel()') it's doing pretty much
exactly what it should do.

But in the kernel, when we use 'READ_ONCE()', we basically almost
always actually mean "READ_AT_MOST_ONCE()". It's not that we
necessarily need *exactly* once, but we require that we get one single
stable value).

(And same for WRITE_ONCE()).

We also have worried about access tearing issues, so
READ_ONCE/WRITE_ONCE also check that it's an atomic type etc, so it's
not *purely* about the "no rematerialization" kinds of issues. Again,
those aren't actually necessarily things compilers get wrong, but they
are things that the standard is silent on.

              Linus
