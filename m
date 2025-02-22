Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B02E401
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740260817; cv=none; b=U67odKDzLkQIoW4txhrvk/7+RuB3mrBbKHIcIjOY8o/6Qri/tr4pA8zvPbV0MzhPstJFR+kxF0ARiS9edF50n2OFtEGM5RHHmm5KA7biGHykx3paVlwLq2fu9BmWDI1uje4ANmtKKPJc1PdZnAkvJeKYYMXve0sD9e0kye50a84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740260817; c=relaxed/simple;
	bh=R/cqKSeDckVDEF7yPpH+aIK1cWmoP4uCgucXOhuI4zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv8KzSqfDld3JhnYlam2hkZpwtgijtT9w2bJiY6W7g9e+dRg68cHIYsbq04KKkcJSOB8Bo3Gw+dx6NO/q9ymWUpUsnUvQoRPJhj8/GEnRkK1/0pi6Kd2XtCSpp76J3KxZeEryFhAwpZAjMR6sSnhLy3eeBDg5RsBBy0BYO3mY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iIVrzF7J; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iIVrzF7J"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb90c20baeso427914166b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 13:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740260814; x=1740865614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIAnEzzzjax0vkLbj+pBB4HtwVvgwKWI24/rmxYjENo=;
        b=iIVrzF7JK1DmnRjcKWuroDiYtbq6fN15AHTNzfLJnlbfa6boItnUxWX1j9wfvYqTOd
         VVMHBk1Xo8Xpgs4tSO8afXJ++Ci+boeYKbvxeU2kAoXpCgKu+TDrRr1p40I4xPeN8uc0
         iK0kdR6ndipa7nZ8GXUdHizI+3B/g4k1YUT9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740260814; x=1740865614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIAnEzzzjax0vkLbj+pBB4HtwVvgwKWI24/rmxYjENo=;
        b=Yhj0vocvmRCCYB19kuRjH+zwAWg3j0+yFBES1TbszVhze0nOI6ri3z8TWuZ3GDc321
         rtrPkJS2MHOyhtKdEWdkhBbh274wNnYbGM2bHkufNSECfHdXi1d7aIoKkr3kodRljkFO
         fcywKwl3aQpwkG+fRic10bPBObgilpXIlT0hvj5+ZYL1EHkfE/IN1xK+ykhFHg1voRGP
         tpGzar14WD/LVSXhqvLtIxrtUMhP2BPK6oGmggj+RmgtjIB4+5dTu2g1qrJn+YnPv0Ic
         hG4fSup4iVaKt5RsA2X84mkLZ8HNmBLSPB8DprwfmzUSa2Btc/p43gRuwB/ErFlyUXPa
         JAww==
X-Forwarded-Encrypted: i=1; AJvYcCXT/GJK8fwJVcafaAM1QftifCszrFK3/kD7mBIXytnLYrM1BHX3ksbYWPPX9UueE+ZxAQLiwSbmAbpu6SD9SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72MFJy8hscNA1OqTW9COscKEGEVPIYfLMzkE3Rg1GtowUB2+J
	q/xjVdpfORpzyZUegwCv/ueTf0tHWuKxfNKrRHPQGhmPu50CORSlBaDtfl1WCDa1UeBa+TA+Y1n
	2xkI=
X-Gm-Gg: ASbGncsta0Go1DBcFUgK0o5lnJd35KkggPGWwA21+bRzKZTWIQPJ7eioA9KRnm/vbwZ
	9Z7+cDyPRP/LmBPTB8AT0ywEAYze6orpkFuZnq92vUIB2duv7EkF4GhC7aAffrM4J49kkdvWGUO
	ImV8A08oxmqbS8PcQrt34LPzf6eBnfYlpn4e5XgUsLhm23T4S9ml7yabDzLOAaBvwyVnNwiRMFB
	QXEbYhIyUNMqMIsSNP/hPF/7sdZiD00NBvpE90qVe4TsSsSXmPACdqM8RK44tndS9ALEEAXZEVh
	7PumMRW45HhWmUMdLf8Lvmj0FAIwDjDK1qGskBcuablbg4wUUfqxQVxXJMfFhxKgl2r/ZxnzKFf
	i
X-Google-Smtp-Source: AGHT+IHARk5S6qz6Ruob+wnJOsHKNSUodHJ/MHpYx48/h8wjFxDVgnlZ2vPq0TKWcc1G1ZcNuxFtJw==
X-Received: by 2002:a17:906:7311:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-abc0de0de62mr666814566b.46.1740260813634;
        Sat, 22 Feb 2025 13:46:53 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb78ea4c1asm1465246466b.123.2025.02.22.13.46.51
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 13:46:53 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb90c20baeso427908366b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 13:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZS763S7NrCzH0am2/QZsaLYr5HDFIQIML/tjYwwanJen7fkdyOFxDsu/StEI9+jvnnHz2VgSHFKgQNlgWlg==@vger.kernel.org
X-Received: by 2002:a17:907:970c:b0:abb:d047:960b with SMTP id
 a640c23a62f3a-abc0d9885e7mr719250966b.4.1740260810677; Sat, 22 Feb 2025
 13:46:50 -0800 (PST)
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
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
 <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com> <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
In-Reply-To: <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 13:46:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
X-Gm-Features: AWEUYZlfgH2FWGDgxF-FUknCaXkkoysm8XxdV5A68axeTzsJ2Kz9bsbxjCAZi30
Message-ID: <CAHk-=wi0UmOAhyDjOeCJcL7eEt+ygKnMqtx+RcHtzZGd7OY4Kw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, 
	airlied@gmail.com, boqun.feng@gmail.com, david.laight.linux@gmail.com, 
	ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 13:22, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Power hungry and prone to information leaks, though.

The power argument is bogus.

The fact is, high performance is <i>always</i> "inefficient". Anybody
who doesn't understand that doesn't understand reality.

And I very much say "reality". Because it has nothing to do with CPU
design, and everything to do with "that is how reality is".

Look at biology. Look at absolutely <i>any</i> other area of
technology. Are you a car nut? Performance cars are not efficient.

Efficiency comes at a very real cost in performance. It's basically a
fundamental rule of entropy, but if you want to call it anything else,
you can attribute it to me.

Being a high-performance warm-blooded mammal takes a lot of energy,
but only a complete nincompoop then takes that as a negative. You'd be
*ignorant* and stupid to make that argument.

But somehow when it comes to technology, people _do_ make that
argument, and other people take those clowns seriously. It boggles the
mind.

Being a snake is a _hell_ of a lot more "efficient". You might only
need to eat once a month. But you have to face the reality that that
particular form of efficiency comes at a very real cost, and saying
that being "cold-blooded" is more efficient than being a warm-blooded
mammal is in many ways a complete lie and is distorting the truth.

It's only more efficient within the narrow band where it works, and
only if you are willing to take the very real costs that come with it.

If you need performance in the general case, it's not at all more
efficient any more: it's dead.

Yes, good OoO takes power. But I claim - and history backs me up -
that it does so by outperforming the alternatives.

The people who try to claim anything else are deluded and wrong, and
are making arguments based on fever dreams and hopes and rose-tinted
glasses.

It wasn't all that long ago that the ARM people claimed that their
in-order cores were better because they were lower power and more
efficient. Guess what? When they needed higher performance, those
delusions stopped, and they don't make those stupid and ignorant
arguments any more. They still try to mumble about "little" cores, but
if you look at the undisputed industry leader in ARM cores (hint: it
starts with an 'A' and sounds like a fruit), even the "little" cores
are OoO.

The VLIW people have proclaimed the same efficiency advantages for
decades. I know. I was there (with Peter ;), and we tried. We were
very very wrong.

At some point you just have to face reality.

The vogue thing now is to talk about explicit parallelism, and just
taking lots of those lower-performance (but thus more "efficient" -
not really: they are just targeting a different performance envelope)
cores perform as well as OoO cores.

And that's _lovely_ if your load is actually that parallel and you
don't need a power-hungry cross-bar to make them all communicate very
closely.

So if you're a GPU - or, as we call them now: AI accelerators - you'd
be stupid to do anything else.

Don't believe the VLIW hype.  It's literally the snake of the CPU
world: it can be great in particular niches, but it's not some "answer
to efficiency". Keep it in your DSP's, and make your GPU's use a
metric shit-load of them, but don't think that being good at one thing
makes you somehow the solution in the general purpose computing model.

It's not like VLIW hasn't been around for many decades. And there's a
reason you don't see it in GP CPUs.

                Linus
