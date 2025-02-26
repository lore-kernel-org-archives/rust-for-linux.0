Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB225B68B
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 21:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740606171; cv=none; b=hknUeD1b0tAwtgeLPpqDHMmAv9hTRmGya93peYemVhwM2gSGm8xrbm8SiC1ep1bYS2p8RrxM81cntvmq8NyuGJL0xmCSK7VkscxDCrX8neuzVffKtA/4tSmquFbShRXwz2hnY3X27YWOTxF+AP1hcbfZdpB1Z7C8g641QzfItrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740606171; c=relaxed/simple;
	bh=joVlM9Oxd8UHscjQG38CfBVUrd1wTQ59FM/22gfbBMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0P1MtWdIRD9y4ruLeyH4G4eR8YRG/ICwN0o/tn6ya6RBVtHjRBzi0+9mpvFwhtp0ChT5i6sKiKvVvt3aBLm/+yavQwC57MCb5LAZ1l0l8rMTO5T60ySb4/lVgWd14WI/04WEcPmoEaZ8+tpDwFmYK3PECjk5MhnmsSecNAgZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CRwoUGz+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CRwoUGz+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso349295a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740606167; x=1741210967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6vkIlnQJGQMWO96KVR0qNL+LIULnDs79lQffNbO4YK8=;
        b=CRwoUGz+YZSlnn0HIno5B+EanR0m0GjggjnJ/pRkjsn4BU6iUFgzzPqGt56RqqzDpL
         tjPCFfJ3B3JeBFh/gdsvF4bHY+w88SogsfvjuHdBQ4XOHbt1ktv1fJ1DNfSuqZrbIvpF
         4+4DugvO2Ohpbj9wwI+gwnWH9dZbih/vZfuRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606167; x=1741210967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vkIlnQJGQMWO96KVR0qNL+LIULnDs79lQffNbO4YK8=;
        b=gLkgIQJborsP2Fejr77zeenedSRb2g3IQ8cHSnfKNZecrMEzJ2lT7RL/utRwTj97aV
         1CuEN0hRN3S57IYwzg/I15AVAbaaUUiFeyhddR7qeU6mbx8A0IvIjRVNbBjGGbEY0i9y
         kGsZFKjTy9kZME3YyIy9JAuaEYGjbF6K6tZhWIizvEGSkrZSqT2/Pym4cQ6Wpt2r6m4h
         vGAJ9jpZj5mgkemdUBzislM6RrCAMojd2K8jPsEVlVTnxG/u5n3XPhXXUmmtLEYCE0lG
         uEjyZHRN2ZsSqHQfq+rfvx/FS+dlpB8iNpzUETKRx1A4q7imLIoiyZsnwc0+KR9MF3Jw
         1/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWBcDNeKdwcREeZOtVGs65r+B2t6UYkXincYK3tcQc56EkHTHtbBS296mQZyFB9PigWJuOMUMG4BF4wApijWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyeQ7OTjanZadxh+JKLWec6guQCO0+PJmf0ywMoDx6W1kxa/M
	pNo8QncdwJRe7D7fO6/QsQl+RoO3SLL2O9vt4fUIjWkveaNb3PSV3ZXU/SDRJu8EXvvLOpBxVTV
	2iUsnow==
X-Gm-Gg: ASbGncua4T+DBo+BdUu7CKRIEcVNhxH//Xiln86jFMRKJSWGhnFs2582NCVbZLgNfpE
	nS6Q9KSSGtjx4Xe4VVj/Hlw3hXrI2rmzkdcQlFFym6SYp3JClt+bP7b91NT8qikWbkhNuAndvN1
	h/pt4hD0e7La5YvDnAmct2zrdcvLHgAkx/T3e5BRtVbPAiFHNNz9Bk65R6w1f4CNoprmKJaErIF
	Wj5k1ne15AyFxdxxoTkxR2YkBHfeLDELWa4sPIYwmhsBoQwBZUbvCJhYMmIguSa58tF5Ko/KFM9
	NSyxMRccj/HAoQpQbtkg9jJUjlirnwLWfs1R+jTJHUbI4DQyEAvJOX/beYVs5Z5RDlX+nVet2Vf
	Y
X-Google-Smtp-Source: AGHT+IEDHmXtrhp8p6pEKYsDhYECd+ZynXQnUsN3/cTZjJpFZ4bZGQhomAUtHLzBNjSmwLGmFZhY8g==
X-Received: by 2002:a17:906:3598:b0:abe:e814:ecb4 with SMTP id a640c23a62f3a-abee814f108mr705743966b.4.1740606167401;
        Wed, 26 Feb 2025 13:42:47 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc5d5sm9220366b.63.2025.02.26.13.42.46
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:42:46 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so295868a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkb5m7GZVxR4LyMUhMWnGJ27WHNKHvPgMtF6YNawMbzTXuabCKoPrc3LliQ+3AqVeC2hKlaTbTQ6jHpNB9XA==@vger.kernel.org
X-Received: by 2002:a17:907:d16:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-abc0d9dd9ecmr2539199666b.15.1740606166076; Wed, 26 Feb 2025
 13:42:46 -0800 (PST)
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
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com> <20250226162655.65ba4b51@gandalf.local.home>
In-Reply-To: <20250226162655.65ba4b51@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:42:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
X-Gm-Features: AQ5f1JrEbuV6Jnfb71LIwDoIVXl971WHAwc1W1BbVzsqQnjOHGkQlzERgSNPg2U
Message-ID: <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
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

On Wed, 26 Feb 2025 at 13:26, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> As a bystander here, I just want to ask, do you mean basically to treat all
> reads as READ_ONCE() and all writes as WRITE_ONCE()?

Absolutely not.

I thought I made that clear:

 "IOW, doing CSE on reads - and combining writes - when there aren't any
  aliasing issues (or when there aren't any memory ordering issues)
  should absolutely be considered ok.

  And doing speculative reads - even if you then don't use the value -
  is also entirely fine. You didn't introduce any observable behavior
  difference (we'll agree to dismiss cache footprint issues)"

all of those basic optimizations would be wrong for 'volatile'.

You can't speculatively read a volatile, you can't combine two (or
more - often *many* more) reads, and you can't combine writes.

Doing basic CSE is a core compiler optimization, and I'm not at all
saying that shouldn't be done.

But re-materialization of memory accesses is wrong. Turning one load
into two loads is not an optimization, it's the opposite - and it is
also semantically visible.

And I'm saying that we in the kernel have then been forced to use
READ_ONCE() and WRITE_ONCE() unnecessarily, because people worry about
compilers doing these invalid optimizations, because the standard
allows that crap.

I'm hoping Rust can get this right.

               Linus
