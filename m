Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1473250BE2
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 19:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165171; cv=none; b=kEp7BWFd1YFQhhCC8xOhC1rsoZxa2SyBbkMP4zdf8C8xZhh9qCI5Gu2KvCjoaq2xwrDVsBIoEMfK4oOltS9MBLwATE0WNIV8EnybaBQqfVCGkn8k0a0g+aI2a3fl7qRR4pdTYQvRjAaliKGCLRzFdNwpUI876yQEdjjxAaDwxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165171; c=relaxed/simple;
	bh=ycAq18Hl2Osak2ytc9YhbxBtTZWY1af4b1+0AgXoSAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syfuA3D2UkV0VAJgdnGh+yMgCy6qFR9NSQC+5jCsDDvf8FHXHrL0IJLy2d2f0f6wO9COf5cnrJ4lAv5DvGFeFp/5QMw+LeMi8qzjZ39T0j6YQcXh8eptt/BKyQu/KeZEXeVSDzoQ1EPeQ8cptPpf4YL5riqxFhuS7F6tVL4RGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cx6biBf7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cx6biBf7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so4401418a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 11:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740165167; x=1740769967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpPO+UoqYur20fhUIihwHOS5iBey4AF8c1A/KbY6wDQ=;
        b=Cx6biBf7q6qju6hPNwYiHvjIhfB39HyTwRPGSBk2BwJX55uRtavfDNwJAYGU0w4rAd
         07LB7u2sXPN+Pe0QLIy0NIxCLopuadqV0UZ57YgKwL0LDcGPODwQaR18cxDn4D5AhDkb
         UJu4lLf7SdxYLnCYVLm4B0J7pf+r7tUYE6FU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165167; x=1740769967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpPO+UoqYur20fhUIihwHOS5iBey4AF8c1A/KbY6wDQ=;
        b=Cdvfj8mhdmsEJentOZDMRfq+ipPQgZBanbHooNwuF7zPKAyuy6SlWlSeyexWlc+72i
         QhWgVCmzQ78aqFc62IuURVl0jLVx1TEnfVKzPgBXGVYuNXfovsZCWdCt5sVoy7xIcnfq
         6JO5PFsxZRnEibHDTgyTMv8hrK9ENS7yvH83VcI/xZTfCvGdhqazY+Wq2Ksk+69zmO8d
         jkMwopxyPVJit9e2K0GLXVGd2IChO+D4PDio8kzMOYl1Omao09B5DEMHvpWBeZRoZLWH
         RkA7EJ6ugD7ZFE7Y2VZF1JqvKdI7sj2iY3XH9hWRMPOJCT1WEoTCFLFk3SBZ5PQpZfEr
         qBKw==
X-Forwarded-Encrypted: i=1; AJvYcCU24aTKib4Zi3jnFLQsB62onfagMpNXDAjvbvrgvE1aVYLHZArx6Bkr308MCNWYEKqYMHS6TyX8/NqrKABlaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx73gJDQIAyZD6z1LyFh0Yi8XN59OmCsPvWYWmEDG2+iFzJtNOr
	1Ur5l9jfHd028oBOvh9k8s7G+7DMqFf3HeDe71IWatu1BRjX9q6GRE66pCj69QD6p5WXc57mFst
	8328=
X-Gm-Gg: ASbGncudhSj4Xh861/DeWjeZk+qieiQUJV9Ngg2N7YbqrFgSdFz94D6dXsKyOmpx0hw
	BhJxpDVLA11v7EHxLDg1M1aAqAYv2z+KFwR0qCkm5xxfdp68ph8Jl2P4ydlbAl6lpGlmtTrr4O6
	jCZ8T6+nsCaslQ0iNas/KQsnbJeX24wf12r7jmB0ufJqPBmqqX7lawDY/38NKGOeOTScy5UOh4m
	2dXfSS6bPcZnLr0qqVtk9fwSA+aRRXzJxGNfWDG9z2orvUPAZYruTCsbIgYxvDQAtmY8fSQHLxV
	JlVmZyLqUPmb+HETDRUKW3jXZhnpiBmXYUvkGZUFTLbTvfdLR8aiK4p8rYXn9KZJ6g3bWQAZlVF
	t
X-Google-Smtp-Source: AGHT+IGvmaaZALY0qg8r6ZvaxCr+7jNo5dbANP/h2o9z/slLkSjdmQ+D9xos2k7M5xiU5L7mSoIlxw==
X-Received: by 2002:a05:6402:42c7:b0:5e0:8840:5032 with SMTP id 4fb4d7f45d1cf-5e0a11ffb02mr8119988a12.3.1740165166970;
        Fri, 21 Feb 2025 11:12:46 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4debsm14109823a12.15.2025.02.21.11.12.44
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:12:45 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbdf897503so584146866b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 11:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMjQuKaYv0910iG5U8Kl5QjXfQ21HXsfT42gwamrmmVc5slvUkHwkRhxdURBwtIaVjFfBThQlz2/F+gXV89w==@vger.kernel.org
X-Received: by 2002:a17:907:97d0:b0:abb:ec29:d40f with SMTP id
 a640c23a62f3a-abc0ae8ac7bmr518893266b.13.1740165164023; Fri, 21 Feb 2025
 11:12:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh> <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr> <20250221183437.1e2b5b94@pumpkin>
In-Reply-To: <20250221183437.1e2b5b94@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 11:12:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
X-Gm-Features: AWEUYZmM9QfL00hwgEM8sBRcCKHPzsXEZopO9LOxfzNGM8PLhnN7fh_mlPWpfF8
Message-ID: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: David Laight <david.laight.linux@gmail.com>
Cc: Jan Engelhardt <ej@inai.de>, "H. Peter Anvin" <hpa@zytor.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 10:34, David Laight <david.laight.linux@gmail.com> wrote:
>
> As Linus said, most modern ABI pass short structures in one or two registers
> (or stack slots).
> But aggregate returns are always done by passing a hidden pointer argument.
>
> It is annoying that double-sized integers (u64 on 32bit and u128 on 64bit)
> are returned in a register pair - but similar sized structures have to be
> returned by value.

No, they really don't. At least not on x86 and arm64 with our ABI.
Two-register structures get returned in registers too.

Try something like this:

  struct a {
        unsigned long val1, val2;
  } function(void)
  { return (struct a) { 5, 100 }; }

and you'll see both gcc and clang generate

        movl $5, %eax
        movl $100, %edx
        retq

(and you'll similar code on other architectures).

But it really is just that the two-register case is special.
Immediately when it grows past that size then yes, it ends up being
returned through indirect memory.

               Linus
