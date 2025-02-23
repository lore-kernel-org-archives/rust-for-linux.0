Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D38C1E
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Feb 2025 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335531; cv=none; b=mEEnCxExakNA2bnf7raLe/K8g+wYDAuU5X7YpoPIhR+DSB1x5rANIDEklvqAkBOdxPAglbvatzuIPW4ZG6RuZgW9qK8LAczcJW4I/z+kc1DUu8ENcdiHPI9Fz22oYRhuS17fZdThRT4eqrGlhUSwilZjy2c6hPvRtDZ8PbDGNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335531; c=relaxed/simple;
	bh=F16gjWpfzILm5UlOwuP2B/0g3980gm949Ip5/wshaZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhvjX9cE6JUX85tBZLkGRjjkNkX8nvBtWU2CzLyLcXlLEg0F/F0H5TlXcqww1KyeT4BcNAB2oPntt/RBX5pkWaVoPxouqZmcBkpp8xL7EqVQTlPX3BLA0HJTTNg4QOmP94fPms86eB4rKqSgTSabBMaQxIU9MmwqUt3T8XdzO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JlgVKMLy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JlgVKMLy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so6176683a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Feb 2025 10:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740335527; x=1740940327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcuxBHhEa12WEoosMAkaHe0om9pJLB2v6SQU4kBUAzc=;
        b=JlgVKMLy+9isG5N/Jk0HLvfHtU9N0HQrOWNKompjMOCyjJACzSMQbHD0/JL4RXP6uB
         Eqhnh89PSzp5pFZ8cPXJdYpiEl//NukTXgr2Hvhez8ktqwfQDcStEoyijPXO3t7aJkj5
         /c1YX7vKLE3+7Wx9k+L9j4fNS+IDw+yLV2JVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335527; x=1740940327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcuxBHhEa12WEoosMAkaHe0om9pJLB2v6SQU4kBUAzc=;
        b=oYn15wAl8JLuuoKNpzReTeZPeFIA9X7opoDwILUbzxGZYyeVgY7kUXlnT0ZCrxmiwh
         0BH4XgO0b/jAgUKaHPB0Dvy8XuZ9+W12ak+01M96HvCjGg8kPBDx5zdXp7fAV415HRYk
         0RW3jWEmSQ/VoP5GX7aUL2GpULDOxDIq5TTlVlHJrye5ujwjQgjrKUOxDdD7lx0cVdRa
         iye8jAuJRdpPQKzbUxdc5PfThAGYTZAe9Xk0wBNNH3wFn2eLlFmDjxE+fLvETKadCtyA
         vJttBFFthpmds2tjSWhm8DtRs41dXdyrQfo0OPWAjPxsWORpp4OIp4Ep3KW3m7Q0jBqP
         lZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVHOOLm88fl/j0NBuF0zGiSa4ZevoKbb7oZ5CyBa2GjDouo3VV6I6y+KKyjR2DfQs8NeQKXCXa9SCUf19jKJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2a+2+Dp00m9H5BWJ6rnzLorqBadNjitORo2OlG3Ckt26gTz0T
	6NJ0AiovQ7oRjGc9marxwn6CdFPSzI7zdIVvlZqCo+9NulTkVc3pVAgJt45WeaSAU7PjMRAZyBJ
	E8zs=
X-Gm-Gg: ASbGnctyxbt8pvvmoq/G1K7eXAv7ly+XOWycJXNIJLTvNc6L6y9sRIzjgorvetHyEZp
	zSsd1b2GtfODpTB2qVDObYh+4TvFVTp1eUQyLiQty8aKdTgiaH34ECjuCe3Hqt7iWovLUAiNTE+
	Ev1sSgHWJIdkTeoU6V7PT1wfVtoVgjhLmXVrgV83qrPqVCiW+4kOYcRJKVSBLMxh/KqrnuhJrqm
	IHD7l0mUrGnEWID1MUySRXqcIsDF0lK3IevstQR1LILxqDM95Vnu4R7Ika4kk2YBkfaNoIVr/eh
	spROxkO0PxcHIclTvUG9Sh6RgxKzWtnRepoLn5B6rFBDXU7LPqZCg1aBQNoI9w3ZBFpRFzCLRa6
	I
X-Google-Smtp-Source: AGHT+IFIlgWwrH/tIypfITOnmTBjadUC0hdRApQWEC198OpU0MnUAvhl3s7gsrUot6jGgml7bXxguw==
X-Received: by 2002:a17:907:2d06:b0:ab6:ed9e:9739 with SMTP id a640c23a62f3a-abc09c0aa77mr1184886166b.42.1740335527016;
        Sun, 23 Feb 2025 10:32:07 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322f1sm2102757966b.19.2025.02.23.10.32.06
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 10:32:06 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6655178a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Feb 2025 10:32:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI3OmPcFOvFpW6vpzgw7v5G30giG4NXpuyZRY9GA6kskzrzsoCH+ek3gT9P2vO4pJ3MkP6eJHDU4DYvSlz+A==@vger.kernel.org
X-Received: by 2002:a17:906:6a10:b0:ab7:76d7:dcb with SMTP id
 a640c23a62f3a-abc09a97b01mr1026613166b.28.1740335526003; Sun, 23 Feb 2025
 10:32:06 -0800 (PST)
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
In-Reply-To: <20250223180330.GC15078@pendragon.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Feb 2025 10:31:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com>
X-Gm-Features: AWEUYZmAe5aQKMqbMOvhjrLvqPDF0CXPi8iaHSYLNnVAdHMEHMUU3HW0e3qcqRo
Message-ID: <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Feb 2025 at 10:03, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
>   > I can't answer for Linus, sorry.  But a generic "hey, this broke our
>   > working toolchain builds" is something that is much much much
>   > different than "an api changed so I now have to turn off this driver
>   > in my build" issue.
>
>   I haven't found a clear statement from Linus on this topic.
>
> Those three statements can't all be true together, we can at best have
> two. I would like to understand which one we will drop first, and I
> believe many other developers and maintainers are wondering the same.

This is literally why linux-next exists. It's where breakage is
supposed to be found.

And guys, you have to realize that there is no such thing as "works
every time". Just this merge window, we had a case where I didn't pull
some stuff because it broke 'bindgen', and the reason was simply that
not a lot of people seem to be running the rust builds on linux-next.
But realistically, my normal build testing has had rust enabled for
the last year or so, and that was literally the first time something
like this happened.

So be realistic: can rust cause toolchain problems? Sure.

But we have that issue - and we've had it *much*more* - with the
regular C side too. We have those kinds of issues pretty much every
single release, and it's usually "this doesn't build on some esoteric
architecture that people don't test any more".

For example, this merge window I did have that unusual "this doesn't
work for my rust build" situation, but that one was caught and fixed
before the merge window even closed. Guess what *wasn't* caught, and
then wasn't fixed until -rc3? A bog-standard build error on the
esoteric platform called "i386".

Yes, linux-next is supposed to catch interactions between different
development trees. And yes, various build bots test different
configurations. But nothing is ever perfect, and you really shouldn't
expect it to be.

At the same time, people harping on some rust issues seem to do so not
because rust is any worse, but because they have internalized our
*normal* issues so much that they don't even think about them. EVERY
SINGLE RELEASE Guenter Rockl sends out his test-results for -rc1, and
EVERY SINGLE RELEASE we have new failed tests and most of the time we
have several build errors too.

Guys and gals - this is *normal*. You should expect it. Breakage
happens. All the time. And that has nothing to do with Rust. It has to
do with the fact that we are doing software development.

Ask yourself: how many problems has rust caused you in the last year?
I'm claiming that the main problem has been people who have been
forthing at the mouth, not the actual rust support.

So next time you want to write an email to complain about rust
support: take a look in the mirror.

Is the problem actually the rust code causing you issue, or is the
problem between the keyboard and the chair, and you just want to vent?

                 Linus
