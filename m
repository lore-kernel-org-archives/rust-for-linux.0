Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2338D40E
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506343; cv=pass; b=UTwB+vBGCiuRNxHekK+AgZFDHTAbR6TlpvEYtsbV8yxYrzUsvmA7DuDGpSue71Z1Ncjr0Zuia+2OE3XbZQJ5qIESRrpm0Y+oSDYLBS1ttovEkKGRAQRsM5CXA0TffZJDv7Ppn1nLgMe85iAsqhH9O3xR65+0PXSHaYUWZoIDzHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506343; c=relaxed/simple;
	bh=OIFhnEobWG3e0FwGwtUj3ntnAyj3+THBltmf4yuxkmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xf71wH6SWIGYoWxpT1lopzrAzbsZwxk9AR73U85e3AXwJIvuUDh0tTibiPbd4OUg7bhcgk4Dy9THbx50CtPbjqfbBvyDzyxxFCFVZKZzizvYeUfOp0rkOWXo+KtK5vI89SaBpDiMn1FoBjT4AwsyXoXsfTr0gXCZZPM1pqSBAi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVC8Ys4p; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVC8Ys4p"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2980730f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 10:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780506340; cv=none;
        d=google.com; s=arc-20240605;
        b=Tl4xQmn/dN7jDXkMug5vtlVwGP3NtcQzWnJMaVlKT0BkcJl3Vw6njCO7Srm1oKatBT
         z39cqAxNJIlgGvXbGJqdfx8Bu9P+9R9RG6olYdnYbI+0YsMhStSOXJSrQJXpS0A9fppL
         zuV0M/k9Pnca+33z9CZdDW7eiOQmGvLN0VQ3jMmmzUAR4eVXTZw/YGDdecNBRfa2kwIy
         K39QiE0Fl/2pTcrSxu+qDcHSfx4V/UkP5k/p/A+mGr9b94R0C5uKr7BEQKFeRDHrIT00
         Xm9GPDNKtRkE/bsW4i3+Mnx0taFQDARjJvniqLyFuqYwx6VN6dJFe4xTAU0WOcXYqbta
         JJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        fh=KZYeKKrPu2+tsD29kfZbsnjxd6MIF/ELjkcBiWWdfvo=;
        b=Ry3RNCdj6Zk8ERJhHupYEZyJOizhIMu4s6o9pk6cjr83pW/CHIWV16qBJenckiVUxO
         BV4i5SS31KdoQKimwe/RYBurfmYjaglmVLp3jPJTmW5NgsZhraokQV/ce0KFUXbnlyrY
         PxtsHZ5E8iO4BLI87nIqoIgY0UCBCmZV+tF1lyOXVANiitBDUATpsjLiZ1lKKNtW4arv
         i6yEVD39ego51CvyqaFgLGB6WYbT7thGTAE33/n/E5Nc8MsmA478j2lsvP2y5vrUbbIm
         hMPjZRVnuLiTLhTcdQ3UOO0y1yxIPMYjP1RxTy/s9L2Shurnyok2bRPW1/DFaanUIrO+
         xu8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780506340; x=1781111140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        b=kVC8Ys4pAwxEGhxkNwtJR/HxDxgr1AR/tcyYd0m9iE38HEDmFv8C8Mm0b6OZHSLHUN
         M80h517YCEmDFGMOriZi472k0vQos9vDTxcwHPUcFIpiThl8koty9ppMht1Qi0EQzMje
         0weykO51ZpMJ5HkaYDdefsQtIBee43c2tBnn4nyA0RN9+A2iN1yPjKjbt74mvzxDGvXw
         a7x0VhXfm+0/0WOWiDRRGzPzEQON905hp/g9F/4Cqn2DtrizPk5urL/GF2vIxXNPbh80
         QYlvROesl0toC0QSIxR4784bcLKRPrS2h0I2GGkpqqVXRMGrzOkaXD+Fwz92Rmm6pFQE
         nblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506340; x=1781111140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        b=qWA5ujNBeC8N88lar3KlGOOS7hkgjeN+FFVyL6Gr2w9U67/fZvwA7uOe+nSt1nQzBi
         cYTQATtjCouCy6WpJXqiw6L8EJQdHUDxLz80BQ3kGVpRHmnjGOpOzmwYppIMS0bNlkbI
         ZPFWsjFgIx4pUMbrw8n39oxXYPE+IvlKQa+NEdL0foy959oy7murgloKI5wKsh8F3dvH
         wpEnfBG/8ctjaUDYKsRWYRemC3+gicoyfUQOLLcOq8361Pa1ShYvPc89hS/fbNrtOvkh
         KQzOZaA+sPOfD2e9xcbK9MyonD+l48KPR1N+edUZX3qM4KfUduRsa//380Ar0Renk3Jf
         sIqw==
X-Forwarded-Encrypted: i=1; AFNElJ+S9txptH/VukIOvYOj/1/uk9xGEeiELXAfoitSQD8TjvL/GsF6VUPmxAQc5l8dsSpD9vGmMI784xf/+aL1Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3a4lBJtlRu9nN4eZlL45tf+v5ZvwNwUL2n8RKhDEuxuBIh4l
	YzXl5EAl3lecVmfEqiHi6mueMauIU3UO5LT1P9Iw5p9q1XJ4xMWuQxCwEOPJQOFu81lsH/9oj0a
	RLmReqxd3MOLvAHwyh9PyAjFSGEEMRPT9SIKwz9mk
X-Gm-Gg: Acq92OH1/80tzGcvgVsKMkosjEaB9V3v9NmDu7eg/L5Cdk3pxlufgojfzP8qlQV/O7H
	AZVDUt0gfSh7cet4XmyTLP9XzWZ/UHa2HJi45XOAdEGtZnQF5EOxpq92DSO+1/m9nHGd4fTyk5h
	//1eXmyupqMKC6hqnW6G/ECFwMiiaf9iAIq6eA2hlyxUEom/qwENrYHl3M9Hley5oG4sokuzWGh
	Jd9vDcnUQbYK5hbnhdAXiw0Qty8ath2Z3KlzieFknQ0HWyTrELyiVgb4wSDgn7iAvekPa7QGbdQ
	dYQX0xUkMm8j4iA4p/SVBPapFsxNFtVrdV669DMp4IAZ68nzJfdTrhY8Zc0=
X-Received: by 2002:a5d:5d0c:0:b0:45e:b99d:dad with SMTP id
 ffacd0b85a97d-46021872abamr6655166f8f.38.1780506340089; Wed, 03 Jun 2026
 10:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
 <ah51DY5yfaNZejBd@google.com> <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
In-Reply-To: <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 19:05:27 +0200
X-Gm-Features: AVHnY4IAFJzjseBdCskbFEe5vMc_zEyWRD54e3gHX3Gz-NxzZYa3Jh-vbKd5Q9c
Message-ID: <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 6:05=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > The task_euid() method is a very weird method, and Binder was the o=
nly
> > > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > > transaction sender identity") Binder doesn't use task_euid() anymor=
e,
> > > > so we can delete this method.
> > >
> > > Given the problems from last time, it seems like it might be prudent
> > > to let the commit have some time to "breathe" in a proper release, I'=
d
> > > suggest merging this not for the upcoming v7.2 merge window but
> > > instead waiting for v7.3.
> >
> > Sure, that makes sense. I'll resend after the merge window.
>
> No need to resend if there are no changes (see below), it's in
> patchwork and I'm tracking it so you're all set.  I'll send another
> notice when I merge it.
>
> > > > My suggestion would be to merge this through the LSM tree.
> > >
> > > That's fine with me.  I'd also suggest updating the commit descriptio=
n
> > > in patch 1/2 to indicate that binder is no longer using task_euid();
> > > it currently reads like it is still being used.
> >
> > I guess this occurred because when patch 1 was written, it really *was*
> > still being used.
>
> Yeah, I understand the world has changed since patch 1/2 was written,
> which is okay, we just need to update the commit description ... which
> should be a trivial task.
>
> > Perhaps we could pick up only patch 1 now since even
> > if we run into problems and Binder has to go back to using task_euid(),
> > clarifying the docs is still useful.
>
> I assumed that was one of the reasons for splitting the changes across
> two patches (reverting patch 2/2 leaves patch 1/2 intact).
> Regardless, we're at -rc6 and with patch 1/2 being purely a comment
> update I don't see an urgent rush on this, especially considering that
> if I did pick it up now, it would be for the v7.2 merge window and the
> binder/current_euid() change will ship in v7.1.
>
> Let's update the commit description - you've got a couple of weeks to
> do that - and then we'll merge everything once the v7.2 merge window
> closes.

Sounds good, thanks!

Alice
