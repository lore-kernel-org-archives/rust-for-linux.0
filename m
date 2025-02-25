Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53295218AD2
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515136; cv=none; b=D6cX6JYjxoUWK/WKEK3Zv6hbNamyIxcqNH4mWk5GgHsCcgGPOaO0/P1I1pPJ5XbZgTGFB3/jvdM/ppb3JCagcYQaJImnsnBNJfqkpGGC0iw8ZHvLDkHrYTbWa57SkuJJNnquHWkPkWTeNinPtAv0XtfPTP5rO3vcG9uLwbUNQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515136; c=relaxed/simple;
	bh=tBOWs+8gBz/+ugcAnXzgbAqo5bkP1lDarIPnI+3UAZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3zHbWIh5OsJ+S2d3qT3kHzJYvnqoPJTlKHVbkpD4iw9QW/L0g+8bBBSHfHY61p7w0TTYgDYOp9f8nZe1VjuJFXsuv8rapOKlxRGeU1WDoIow5dvIFThnj+AtH6g+URQAlbq2fBTvMH7OqUzgRUp42nevNQ45w9A4qzicJVYwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hoyXT5n+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hoyXT5n+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so9528596a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 12:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740515132; x=1741119932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y61pcTR3GsuY043VMbi4v/Cd+bs9ipxDEF9XwQhZi9g=;
        b=hoyXT5n+j2oOof1mbT80+C5Kjxtziw7LCqirdukvvue4GgYWgLvAmICViKHjnw11ib
         AvqLkd1nCT4CBTFxiIbOFkhvtsko2KReReS4PMLzbyfXmJRgeWsnk3+/h7+TwgQXJ3Uj
         1xLLVNSEHYyymMzPZ2QTMoJZqQgF3GAAgNPv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515132; x=1741119932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y61pcTR3GsuY043VMbi4v/Cd+bs9ipxDEF9XwQhZi9g=;
        b=g9QYmA5DgBpW79zo+alVf/qoaXXFRW/2i7rX56YMrUndWHbLPtMFZHp7NNBXDlKdji
         MdXmj1eCoYk1hrgCVzxhm2zmnMdK89A6U0izEd+cl4+bkAUq0UTy1HkED95beSCW+fuA
         8+VwSfTtqqFauSTBa5FrPg2yf0qJvyC0zLhSjdq6ev7Pomym0UECimp2RUB5yWN9z4Jb
         9Lqsaz2KzM5pmW+FKHDzfF4AdpS15fbDo3CI5saS6HLCvPh5xJukCcVZd/Es1kv0eDXQ
         lh1VdGcSOv28IuJyGnPhOKHqen4am1QVe+kWm+Mr5D4waQgiLaPeV/kcEGHW87DNDzDw
         YJtw==
X-Forwarded-Encrypted: i=1; AJvYcCXoAF+Hmw5yhdDbM9tfCiIDoi5WOpXfIS//5h+Wo9hcGTSBF/UwKRUzlhI/s268FQs3dMoRCDvYHM3CWmngZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdLBXxeZ44QY5uITV2HYU49yYEVm8JQTWVXiBhCh43f5BHsUb
	jZEQFsCKqA6A5knKBa1tCsQ57zva91bcGNDu2EfWZWiTTdOYV91mAxcTMhbh6tygIkI2AGpoDgt
	k4iY=
X-Gm-Gg: ASbGncszoy05tqDp0Hje6L+o4ESl7Ek4vMhtF4r0Nfr/XFfwRSTfozpEQ+BzcUDUqfC
	vLc9maEUcTYacfEo3ANkDIU5ABgbkc+IqAWSKhg8WzJaoUFwE60GUWmQqT8mtJ3KLI6I7wnxsTw
	lfCaPKHiRbO4hiEJ3PbjYqmS4YW256mAm46bR1jQw7lZgLg31qVPmCBpevS0y7BD1lLdI9jstDq
	/1adgo/EVHYeItTABEILHgKGaw6l6kp/YBHlKvqPKRks/eGJyJXwqJIarXcqq/wfPY4vpJEwq2m
	4KAT4Xh0CW7z0ODKhF+CimQUwAEfv7BfpVqWKMwhyZmN1kp6ZsneEF9oUhSLNQdVCOc8JMSFzCC
	f
X-Google-Smtp-Source: AGHT+IHJEDkK1TXoqGJiw2zc2XIa77DnwJhdg3VKgHKRJ/zRwAH8yxTBlc1CM6x6hLEDVOtZPrtsfQ==
X-Received: by 2002:a05:6402:280d:b0:5dc:7725:a0c7 with SMTP id 4fb4d7f45d1cf-5e44448139dmr4980165a12.3.1740515132386;
        Tue, 25 Feb 2025 12:25:32 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e459c3fb75sm1689700a12.12.2025.02.25.12.25.30
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 12:25:31 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso10815969a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 12:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMUkr20zxKY6U9yifqVfq7HxEyOkI6B+BK5HLBC2EA+VqCZsshncCrt739wiFjZTMNqdclI95nQbZrzoelZg==@vger.kernel.org
X-Received: by 2002:a17:907:72d6:b0:ab6:dace:e763 with SMTP id
 a640c23a62f3a-abed100fee4mr509174466b.38.1740515130517; Tue, 25 Feb 2025
 12:25:30 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com> <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
In-Reply-To: <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 12:25:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
X-Gm-Features: AWEUYZlOXj6mDCIezjuum6eAqCm_wlo9l5dfNahDjnlsJi-NDtjLkzkbOckahpM
Message-ID: <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 11:48, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Well, the whole point of unsafe is for the parts where the compiler
> can't in general check for UB, so there's no avoiding that.

No, that's most definitely NOT the whole point of unsafe.

The point of unsafe is to bypass some rules, and write *SOURCE CODE*
that does intentionally questionable things.

The point of unsafe is *not* for the compiler to take source code that
questionable things, and then "optimize" it to do SOMETHING COMPLETELY
DIFFERENT.

Really. Anybody who thinks those two things are the same thing is
completely out to lunch. Kent, your argument is *garbage*.

Let me make a very clear example.

In unsafe rust code, you very much want to bypass limit checking,
because you might be implementing a memory allocator.

So if you are implementing the equivalent of malloc/free in unsafe
rust, you want to be able to do things like arbitrary pointer
arithmetic, because you are going to do very special things with the
heap layout, like hiding your allocation metadata based on the
allocation pointer, and then you want to do all the very crazy random
arithmetic on pointers that very much do *not* make sense in safe
code.

So unsafe rust is supposed to let the source code bypass those normal
"this is what you can do to a pointer" rules, and create random new
pointers that you then access.

But when you then access those pointers, unsafe Rust should *NOT* say
"oh, I'm now going to change the order of your accesses, because I
have decided - based on rules that have nothing to do with your source
code, and because you told me to go unsafe - that your unsafe pointer
A cannot alias with your unsafe pointer B".

See the difference between those two cases? In one case, the
*programmer* is doing something unsafe. And in the other, the
*compiler* is doing something unsafe.

One is intentional - and if the programmer screwed up, it's on the
programmer that did something wrong when he or she told the compiler
to not double-check him.

The other is a mistake. The same way the shit C aliasing rules (I
refuse to call them "strict", they are anything but) are a mistake.

So please: if a compiler cannot *prove* that things don't alias, don't
make up ad-hoc rules for "I'm going to assume these don't alias".

Just don't.

And no, "but it's unsafe" is *NOT* an excuse. Quite the opposite. When
you are in *safe* mode, you can assume that your language rules are
being followed, because safe code gets enforced.

In unsafe mode, the compiler should always just basically assume "I
don't understand what is going on, so I'm not going to _think_ I
understand what is going on".

Because *THAT* is the point of unsafe. The point of unsafe mode is
literally "the compiler doesn't understand what is going on".

The point is absolutely not for the compiler to then go all Spinal Tap
on the programmer, and turn up the unsafeness to 11.

           Linus
