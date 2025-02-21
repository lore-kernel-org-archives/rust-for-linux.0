Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAB211296
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151493; cv=none; b=BcRYimtYxtlTbIk8pZMJp5T+JXIEpOsbXACTvVTf29IMwUNk4I6glI6BKZEtvo6VUllQ59tHr/f16GH0kq6K6nA7SOekZ1w9KQX7xJrDDUxeW5B4WYw57Yn9lGdcaa7nitJi7IgFTjhPgE8135UdIYkfYMjnGNS3WVCLGcu6+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151493; c=relaxed/simple;
	bh=WK1lZZTa1x1pAgT3SVfcXVsjeamzVsyIDq5PHkT0TDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5zf7RxtKvWyfoupcVDyBUy/EXtbNWwUMvjuqJw5VnLYvfFl/1vzLQcV3E+Tq8U40VemAn6YAdB32fpWmcLM0C0Zaaf44P1zZVMlkZ06GbimdxcUxWzcpW8Za9zHDV6JO4kgkqXpzvQngC/R8HLLMYD5UBPORkKNLbS4KnJrvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=aYZN3qJI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="aYZN3qJI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so15082035e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 07:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1740151490; x=1740756290; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CT2C4f9jm5PWW5vBDYC1RD3DaXN0lCMpCnB9dLdCgXg=;
        b=aYZN3qJI2qLv+njQmSse74KLKHfts3EznSBdbrexaXEJa2wo6SXQVhb1Yyu+hEFTNJ
         6SWmwgjphq1RCMA8PBT+YfygV22hCtN7+3oQn7fToHPxkJOvpwMnHRpZ7HIIo/5xp5ee
         xjm5z6DovxvdGpw42NrMUA1GlosmUK8jom99w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151490; x=1740756290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT2C4f9jm5PWW5vBDYC1RD3DaXN0lCMpCnB9dLdCgXg=;
        b=KyM3xYVzYPjI8wRkD8UMHI+inv2hO0ID3Sow1wyA7YgYi1mHQxWkamHZEW7fbK10Sd
         o2V9P0LBrJShmK1XMmeS1thyTsZtdyTqd6/nu5kVne7IPmXFZqoDQAPwl2FyeoGfm6+j
         3TXvd3LoqSH+2W++Bwzqjb9zhkdzD4PkymxjTdtj2m2gsPgm6/M6KgkpIyXzNqCASfTS
         XN0XFolBjbMhUKezSJCXT7cTMXPj++gRXp/la1YT4rbkANAbraCKf6VbyXJL7YAQSETa
         DeQ8ml6XK1lehuCKmZ+patmM54AfywLPKJVKNgrDsVWSmM5Xn8FysVyJojs7YKPTw/Oe
         IVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXKTv9GNfMJPjOA2V0Bje3rtwSmxwEmpPSvrGnajCLEIXJAApIj0L+t1hNbcvhKntR1k5f1Vet7n7dTof7d+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyazklln34wOSr+wUrisNhTxsqdIob7d3/0oX8uX/Oy/lwBxVN6
	PV57o/BRku+f1EFZL1fav1GwBHaZsErB4gR2wZyv22eX+x0rHIQdyt9OxkI3VpY=
X-Gm-Gg: ASbGncurkJSPvLi5uIRwZjrMzIPpxgWNRNDRa0z/GRNtihgy+GaD6Evh9aURQh/uXM1
	Ee8cdlQy0IJRKIOkqahOJeLvFijjrxCxkWA+Tr+YVOJJYeKQM7sKX5lG8gtf+IjN3MFbibmwXwn
	KRYp/cfPaSVeA8tFLwa4864Zm7SaS35H/GXcrO6NU/dpw+oNssvrUhK66AT2zfbqi9uNvrKEAlc
	xZesBNt9jTMCQ7E+ryB5GSHIlsi00u1w/VXZnXXeurkNRGcnqoBK52ztBQJ2FBAx8wdZlSvhIyV
	xzQRMZXoKgbFLoQrE26N0tXgAyQmruSAhSOJNA==
X-Google-Smtp-Source: AGHT+IEtmkzFkOqaG3XvlyBf1nNbqOpqNG9470mVBupdomsnEpdGJKAmORNNEt1KQvh271XfF3xsZA==
X-Received: by 2002:a05:600c:5487:b0:439:9946:af72 with SMTP id 5b1f17b1804b1-439aeae026amr27674585e9.3.1740151489706;
        Fri, 21 Feb 2025 07:24:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm20492365e9.3.2025.02.21.07.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:24:49 -0800 (PST)
Date: Fri, 21 Feb 2025 16:24:47 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <Z7iav4U7k9AJDzay@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org>
 <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.11-amd64

Hi Miguel

Disregarding the specific discussion here, but this just felt like a good
place to thank you for your work to bring rust to linux. Your calm and
understanding approach to figure out what fits best in each case, from "go
away, don't bother me with rust" through "I like this, but I have no clue"
all the way to "uh so we have four drivers now in progress, this is
getting messy" has and continues to enormously help in making this all a
success.

Thank you!

Obviously not diminishing everyone else's work here, just that Miguel's
effort on the culture and people impact of r4l stands out to me.

Cheers, Sima

On Fri, Feb 21, 2025 at 12:44:31AM +0100, Miguel Ojeda wrote:
> On Thu, Feb 20, 2025 at 7:42 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > The document claims no subsystem is forced to take Rust.  That's proven
> > to be wrong by Linus.  And while you might not have known that when
> > writing the document, you absolutely did when posting it to the list.
> >
> > That is a very dishonest way of communication.
> >
> > And while you might not have known that when
> > writing the document, you absolutely did when posting it to the list.
> 
> I did know -- Linus told both of us in the private thread. I am not
> sure what that has to do with anything.
> 
> As I told you in the previous reply, please read the next paragraph of
> the document:
> 
>     Now, in the Kernel Maintainers Summit 2022, we asked for flexibility
>     when the time comes that a major user of Rust in the kernel requires
>     key APIs for which the maintainer may not be able to maintain Rust
>     abstractions for it. This is the needed counterpart to the ability
>     of maintainers to decide whether they want to allow Rust or not.
> 
> The point is that maintainers decide how to handle Rust (and some have
> indeed rejected Rust), but that flexibility is needed if a maintainer
> that owns a core API does not want Rust, because otherwise it blocks
> everything, as is your case.
> 
> In summary: you were in that meeting, you own a core API, you do not
> want Rust, you are blocking everything. So flexibility is needed. Thus
> we asked you what can be done, how we can help, etc. You did not
> accept other maintainers, did not want to have the code anywhere in
> the tree, nor wanted to work on a compromise at all. You, in fact,
> said "I will do everything I can do to stop this.". So that is not
> providing flexibility, quite the opposite of it. So Linus eventually
> had to make a decision to provide that flexibility.
> 
> I am not sure how that contradicts the document -- the document is
> precisely talking about this situation.
> 
> By the way, I do not take lightly that you accuse me of dishonesty.
> 
> > Which given the binding creep means every single non-leaf subsystem
> > eventually.
> 
> If Rust keeps growing in the kernel, then obviously more and more
> non-leaf maintainers get affected.
> 
> But that just means more people is getting involved and more
> subsystems are accepting Rust for their use cases. So that would just
> mean it was, indeed, a good idea in the end.
> 
> > I'm not sure how that matters.  Of course your Rust testimonials are
> > going to like it, otherwise you would not have quoted it.  They
> 
> Not at all. As I say in the talk, I included every single quote I got,
> even up to the night before the keynote.
> 
> It is nevertheless very biased, because I asked people we interacted
> with, which were mostly positive or neutral. I acknowledged this bias
> in the talk too.
> 
> However, just so that others are aware, I did email others that are
> negative about it too, such as you. And you did not reply.
> 
> > Well, obviously you do.  But as in many other things I would usually
> > not count corporate pressure as a good thing.
> 
> Corporate pressure is not good. Corporate support is.
> 
> And we need that support to accomplish something like this.
> 
> Cheers,
> Miguel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
