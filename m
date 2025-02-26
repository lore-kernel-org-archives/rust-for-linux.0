Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06921ABA9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598389; cv=none; b=Wbc70QyOULVI0AAOojRS2qBrs6HrJfw71+oDMllsbFyuCBJRJ2oaY0D4klh16jvM9TvYqe3N+QYh1oUlG6WQJ6fos8Xmu7ywz66Xopyh1NYNFKOrWy/vKkcBslQGctaYd5SnurM/A2vDVTgrgYfGImbOegBEaEJUFn6vu7F0o5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598389; c=relaxed/simple;
	bh=3usIangzu6r4PaFTKvtnl+Iw5bp8L+06/4fSfDibBko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaD40wj1LiAqhvQDF+xqmXAIXUyUzGIgJ48mWwDiu88+Mm8GqDZq0y14M7jIIscSSn/qeX0hTdl1GPaKZZ+EwawH/ixNDFmIRL/KMKzgW8u8C/ubl0ad4aOjn/oMqUfRWJvU5Uzk/IZjgSLETYZZPJWkomxtgLHk49pkDmy4XGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EcRqazrc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EcRqazrc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390cf7458f5so122688f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740598385; x=1741203185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF9pvpFw1/YLJE+EPUaheMire2o0sgR/Rpuz1tvLIh4=;
        b=EcRqazrcUY8ymyEoKXuPZxW07eT0eFcVQWUqttZmAqwWvyNU4U0hvuSb9hS9jwQLDU
         23emBiqFD7NRaPZW9yYvB3Jt9BDvRVO64YvI9RiWH9AkUypZNHJBiNKdj1XFKWlZR95A
         lqUsekU3OoKVyS4IDupealOZYP58bPmyvoMQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740598385; x=1741203185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF9pvpFw1/YLJE+EPUaheMire2o0sgR/Rpuz1tvLIh4=;
        b=Z9rMysiWbYSUxA6qL2Zd1cv73Qo4NEenm9sZPvq2JpOnEOogNCAOV3shmzZBTTI32s
         m0hxoM4WtSnjzXQgYV8BLCP/bq2lC1y+ws0LmNNA796CCoz14poD0WPizEYb/EXpI0mf
         q99vISrj3+cOkddG+kkp/sbOprZal9DO35zymNqmDZCsVvTTv+bL1KO0K6J0wqpIsBfX
         t15wJsHYJLGpCDe28RMkMRr+gFzDARW3KBoqphL9l0qfepNRvg4i/BEXIBhPtkZnehZO
         7vH1NDmqsB7QPPgBQCXP7efLSsrnqqZ4p7gYB7ncNJ5nDQ6nV5m/VeCRf9d0IlzrYv3b
         dwtA==
X-Forwarded-Encrypted: i=1; AJvYcCXmgFtxaEbhnBC6xMcXJECDh2JyzbPWaK+1Hso4BD53iDLfnR2K40cemui0iCkct+yqKTvlsZlRuHXtdsar+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZBTU2mIEtQeS06WK6Y4+xoj2ZP+6DmA3kf0mc3ADkfUDy2oA
	JUKskXKAyl5JTxH/vuxy05YUivx8G0ZJcUzXzcdzfqTmf9IBVNdhda8IlRCzfYSuSAY7+zD3iJw
	NLYy1Tw==
X-Gm-Gg: ASbGncv7Ra8iD3FFgz4rQQsla0RqD/IlKl/6TVvzyW4mg4q4/BFgS0ejFb4+tUXYdDk
	RFgG00Mrd2vhAKo3sV3To9BtFeb2MAgkuXUK+QVPTaIeiEyrZF0D8U/Jn1QsdBDTXMdmGrxcyEo
	lB6+uaWYpwWf1BTCRO/lguJfXmCwHHMtKO96wa2GAmVPDWcmtXliEzGb1xiIGocnyjfvi29IWow
	bf4bJpjKskJ5+qGETQxPzN2bittj/hpSTSqFd9XKpkMGVcvT8eiQ3iUR6LwDMg9B9RzrDjqY3/4
	P38nwSWKmJ/PEp6J61m6TNn+eECvOe/so2McmKJNQOnnnO+c/Rxy/r5KfJRprL8w+ahJMs5b9Cc
	9
X-Google-Smtp-Source: AGHT+IGshub9fPI+7bO4H7O4/ZBEziy8SPu+fAdNTYH46c6U9Xq6srqzyCkpB6j/j48kiZFXogttVg==
X-Received: by 2002:a05:6000:dcf:b0:38d:c44a:a64b with SMTP id ffacd0b85a97d-390cc63c045mr8126213f8f.48.1740598384745;
        Wed, 26 Feb 2025 11:33:04 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed204fad0sm377234366b.135.2025.02.26.11.33.03
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 11:33:03 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso77622a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 11:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLzsN360YYOihSdV8b4KONFEUkEAoYIkHxG0m85vBKKCw3jo7NAGFetOJNED1dIFOiI9Kb/4Cli4A3SvWnDg==@vger.kernel.org
X-Received: by 2002:a05:6402:2690:b0:5de:a6a8:5ec6 with SMTP id
 4fb4d7f45d1cf-5e4455c2f52mr21228207a12.10.1740598383403; Wed, 26 Feb 2025
 11:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org> <CAHk-=wgLbz1Bm8QhmJ4dJGSmTuV5w_R0Gwvg5kHrYr4Ko9dUHQ@mail.gmail.com>
 <Z7hulnJ4fwslRILy@pollux> <20250223180330.GC15078@pendragon.ideasonboard.com>
 <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com> <20250226160554.GA33931@nvidia.com>
In-Reply-To: <20250226160554.GA33931@nvidia.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 11:32:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjg1PJ81E23DB1QbvPBQ04wCf7mJjRAXG2U1N3BkNTY6A@mail.gmail.com>
X-Gm-Features: AQ5f1JrQKblYd_mlL56qfeL7HjizeGfzBVaee_mjm-AjiG60v7JHCqrs21U3slM
Message-ID: <CAHk-=wjg1PJ81E23DB1QbvPBQ04wCf7mJjRAXG2U1N3BkNTY6A@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Danilo Krummrich <dakr@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 08:06, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
>  2) Does Linus accept a PR from the maintainer? This is what I think
>     Laurent is driving at. AFAIK Linus accepting a PR at least
>     requires it passes your build test and boots your test machine(s).

I don't think I can give any black-and-white answers.

I refuse pulls relatively seldom, but there are no hard-and-fast rules
for when it happens.

The most common situation is that something doesn't build for me, and
that's because my build testing is actually fairly limited.

My build testing is trying to be wide-ranging in the sense that yes, I
do an allmodconfig build on x86-64 (which is likely to be the config
that compiles the *most* code). And I do a more limited - but real -
"local config" build too fairly regularly.

But at the same time, my build testing is *very* limited in the
configuration sense, so if something fails to build for me, I think
it's a pretty big failure.

Now, 99% of the time, the failure is on the pull requesters side:
_almost_ always it's just that the stuff I was asked to pull was never
in linux-next to begin with, or it was in linux-next, problems were
reported, and the maintainer in question then ignored the problems for
some reason.

Very rarely does it turn out that it was all in linux-next, but I
happened to hit something nobody else did. Yes, it happened with the
Rust 'bindgen' thing. Once. Not enough to make it very much of a
pattern.

Sometimes I find problems not in the build, but in the running of the
code. That actually happens distressingly often, considering that my
test-cases tend to be fairly limited. So when I hit a "this doesn't
work for me", it clearly got very little real-life testing. Usually
it's something that no amount of automated testing bots would ever
find, because it's hardware-related and the test farms don't have or
don't test that side (typically it's GPU or wireless networking,
occasionally bluetooth that fails for me).

But that tends to be after I've done the pull and often pushed out, so
then it's too late.

Honestly, the most common reason for refusing pulls is just that
there's something in there that I fundamentally don't like. The
details will differ. Wildly.

                    Linus
