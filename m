Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932C21481D
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 07:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733729807; cv=none; b=N/p0UR3N18m8T69cn1TrfqvgojnBP/UY8fDUJsynTM6xqJ0hM4bhIL1m6ZE+VITgM+s8HEFO66FkiPuy9G1L1HUlIxja8Rpj1f+rduDRSyD1ZGHqfUEaLV5XphrhMKHDo6K31t5FHAQ8V+8u3IKh+SAzh6cEK0sPkEtwdQl5md0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733729807; c=relaxed/simple;
	bh=Eow1A3UqYqThjdoagWgl0tu/rHAYK+9F3Z/d72DfdY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fD7gu3AZHVwVp+i7vHNRX/sIybRT936VWXDTiyy6M5liKTAJ3IE9uWQjzvuWtAK9+9nlfqpUYav1bk4Fld+F8t2a3vrqC84VnEU2mhmxi4crMsuP0MR5GC1+GZ/VYbWHmj4cM4Lcd3rUKf6BqFzr+K4U7fpnOq74oSHT0a6LGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KO04uUyK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KO04uUyK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso44896025e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 23:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733729804; x=1734334604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eow1A3UqYqThjdoagWgl0tu/rHAYK+9F3Z/d72DfdY0=;
        b=KO04uUyKe1vU+mgJYE9YOPiIoZrnHugv+KfTiDFatnQCpaTWQfzrOneg/jfVgdONb6
         SJ0HLEFARWFDLkc9To63cb+u4EoPC3SrzHUrrp25m/CHPo0ToL21hR74DSckK7OTcERG
         RR+/Spe8b+5YqxF5WIlQamO1q1M3YWRmRxM3kwsUNU0hemWG20tamuF5YwO3KPHrjAig
         XDi+busyOJ5z2A/ewU5DJ9vvaJg/UtS+n++JRyNl2b6Fbdi3AfaIm8mZYkfFmLvk072r
         HonmLrp4IcqBxC0RQHyczO+hF4F1GLTnykkWwSpNBOzBeXlLirVbGHI0MlWp/0gPZdUn
         ca2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733729804; x=1734334604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eow1A3UqYqThjdoagWgl0tu/rHAYK+9F3Z/d72DfdY0=;
        b=tU/K6VHNCfsTwSzC04WBCnK9smmcDFTezbpl8WF9aIB450MqktVsFlAdCmXgc929cp
         7nkOUh2wnwy/qQK+mIUdh2RFENCbULQV5z78VjOv7LmrSXU+LtX6a3ts5dEG6L5orL/e
         J6E/LsETflrKpAN6HcRejSoza7lJyAzCbpXi/jgUUwNFH9t91/tuz+dJ/iM+BX5tNVdo
         JE846U1F4GYKkLkYkWrQMLxX79AjzcN3otTMHyeP6SdElkoCMKYp1IKBCly1CNFvvsp2
         ES9wtmqhZKtRoG00bC3JjoujcQyoBYMRARFHZvpSdiC9LwcSJ4TS9tKE52d9/y+nXwl3
         DvRw==
X-Forwarded-Encrypted: i=1; AJvYcCUrhgdbzje9OLo0QZ8EeEfwE4zhix+e/tFAJSWhTNNRK1zCBE3NhNrA+Uw2j45YoQd0NGzWG2EQpnawtcCTIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcZcNqTJMSoUCfN3lu1lR6++alEGYhhD2ZQe6ZGiuZN2UH5pA
	FCZ8jhssQlPB6Rd59Gs9n2pHSPUFpU6NUfYlWEpmymKE1+v9imxJdD16sH/r5H4qa1gVdh5jez4
	iCUAqtFqOKASrdCsrnuu8l2yXDktC96FuSsC/
X-Gm-Gg: ASbGncuGfrZGDIjx40slmZ5kJ4bmT6FSTTJ2bx4ZTNfqJXLwVkf+/NWOuy2wnBcxjVQ
	WqnJ6TEdLj+48EfPDjBj0NUQn1iWVt5jf
X-Google-Smtp-Source: AGHT+IFujKfDJOcy9yYEksS7z9CXaHLBiMMHj9w2VyqSiy4+fyNmfmR44YIzzWHVls5xpOqmJdeFNNEW2Un39PkqnLI=
X-Received: by 2002:a05:6000:a14:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-3862b39b9b4mr10063061f8f.33.1733729803863; Sun, 08 Dec 2024
 23:36:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-guard-stable-doc-v1-1-a3f8249cf4d4@google.com>
 <Z1HuNaDAiKV7L9ea@boqun-archlinux> <CAH5fLgi8N6bdke1o_uTvYsYfwH1KhsY4wTGmFpc43Mi_U6+KWg@mail.gmail.com>
 <Z1NCQiGRopuS-Uc8@tardis.local>
In-Reply-To: <Z1NCQiGRopuS-Uc8@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Dec 2024 08:36:31 +0100
Message-ID: <CAH5fLgiTRkCoNKFPCVo8EQTSw8xf_JeVGWVQAgYYAWZk72_H-Q@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: document that Guard is not a stable lock guard
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 7:28=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Fri, Dec 06, 2024 at 10:56:23AM +0100, Alice Ryhl wrote:
> > On Thu, Dec 5, 2024 at 7:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com=
> wrote:
> > >
> > > On Thu, Dec 05, 2024 at 12:35:51PM +0000, Alice Ryhl wrote:
> > > > Most locks in the linux kernel are stable, which means that holding=
 the
> > > > lock is sufficient to keep the value from being freed. For example,=
 this
> > > > means that if you acquire a lock on a refcounted value during rcu, =
then
> > > > you do not need to acquire a refcount to keep it alive past
> > > > rcu_read_unlock().
> > > >
> > > > However, the Rust `Guard` type is written in a way where it cannot =
be
> > > > used with this pattern. One reason for this is the existence of the
> > > > `do_unlocked` method that is used with `Condvar`. The method allows=
 you
> > > > to unlock the lock, run some code, and then reacquire the lock. Thi=
s
> > > > operation is not okay if the lock itself is what keeps the value al=
ive,
> > > > as it could be freed right after the unlock call.
> > > >
> > >
> > > Hmm... but `Guard` holds a reference to the corresponding `Lock`. How
> > > could this happen? Do you have an example?
> >
> > Well it can't. The reference is yet another reason that Guard can't be
> > used for stable locking.
> >
> > This doc change arises out of me needing a stable lock for something.
> >
>
> Maybe it's better to put together this patch and the stable locking you
> are working on? It's better for reviewing in that way.

I'm not sure when that will happen.

> I can see what a "stable lock' means, but want to make sure we change
> the doc to reflect the exact requirement of a stable lock.
>
> Regards,
> Boqun
>
> > Alice
