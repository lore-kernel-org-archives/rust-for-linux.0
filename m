Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62F26A1A8
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643416; cv=none; b=PShUsnFijwxKL6CXVnZwZjuiHrg9HF2pTqIoM1VIWKB22xNQd2o+uuOuGKZRkOZZRCSAkldnTFaTg/8vFJbuYhBVwvgXrL+slWkP4tatmosWUUii41ezcPho0vz2MqOuUhZAiXR597xpJDq0ZIIfgNcZEqHc1EEW3P7xReVMDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643416; c=relaxed/simple;
	bh=AvUJvGV6k1Y0yxMfq2do+BEGAQPPDxM3RqtsjtneEv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IKYhiqz+2v/MuZHFeSF3fv6EEnp0T8MYPltwudAXInzNLC4lZwFL4opZoc0ZpXdmT3DGnuxWXR4Pl4LcRUy2iGPixAJ9n/+LSEK6sknaP1IIioyuGJw+XTD1+LA0vG1Zg5+BH4AoinkNDsG0DhFXkJqKgycMXZHfgPKKQ73P6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vz4EJl6N; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vz4EJl6N"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-458bb0e68c6so10605215e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754643412; x=1755248212; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ueZ2gWJlbQvRxrR+aVYA4nsQ6QTJQxWiKvR+t21yTQ=;
        b=vz4EJl6Nc3EwTzbWFsqerOEjnto1aROuWw/VyfGx5hoJ9q7ncF1veSsAdgGCW0n5Zv
         uMsTVnJrxGkxlAyCSSncc/fQquaFcfzdk2lsALcgY43YIYP3nN0F8TZKxB9z3RJq8QZC
         o0X12ybOEHhKEsox9BcUjZKZMZ2y6zoFBxbHHa+tlop3XCb1baZaFrBO1f59zH52jPL3
         P0ADbvahaIBQuBnNeuEZbsW62FQbhxxLD0I1nhizdBKuFunRzF8lRDt6qCSZwJJ+dfAa
         5/5RuBxq597Pv1G0g0WUnCkLCLmpJ+6kavoHPSEsgFfTVEgW3qSLwH+wM9y8qFQ9jcoG
         zpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643412; x=1755248212;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ueZ2gWJlbQvRxrR+aVYA4nsQ6QTJQxWiKvR+t21yTQ=;
        b=h9slLR0gSgmnoM4BFE0BmKXjcAixZxcP9n+5V7PvI02OWWPxlsi45i5WP2WUnPXDww
         eC7YGtg9wBHlVhO/4Mm3YF4R9i0po9RcuPzEaY64hCQHSUuO7SBm+dwL/HoEE80OdnYs
         fhnjosaa7tV2lGjyz/PrkfWGM11x6mDEH6/zmjGjR/MazQIQdKdXc9zLb3WBJk3gbnt+
         iPdiFuYTuGClLDvB3z/2MqVY7ADPQ20JeDtPvYVHLK0vgGq9MwnHqULMbU6i7/v2RVgF
         sutnxLpGhncxheLcC3m2Cs/p8M0923vCvCQyzvmatO+CLyXpSeekV33BbkgI8sT9U7gF
         0j9g==
X-Forwarded-Encrypted: i=1; AJvYcCX131WJgkkO7UjDTjiZZaMqoPrpjkkgNMr6ONEfy8aLUAbo+1tvxZSAybXd/FF/AR7nK8DhrmXJ1o6fQI0DhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOSE8k8wjetouZs069gJzunSvn/CuCm1wtjrhG6g42jK7kBCuT
	m0ZQmXCuDv3AnUuNdO6sMZRfMWKFfea1fXjcgSoPU6Vm4vtAJ5WSBXTq/ku8HhxHajT9WmYjl7k
	iyjZ/td9OaWiz+Bz2bg==
X-Google-Smtp-Source: AGHT+IET1DdJb5Jz5G6vVLd0YVDZI+QgAZD0cOx2t4RsN8WWzMVeQsfkD8X4H0cSdsj0IbkyiAcmX8uUm/kCnxw=
X-Received: from wmsr17.prod.google.com ([2002:a05:600c:8b11:b0:458:715c:51a1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3103:b0:456:28f4:a576 with SMTP id 5b1f17b1804b1-459f4f2badbmr17332435e9.27.1754643411897;
 Fri, 08 Aug 2025 01:56:51 -0700 (PDT)
Date: Fri, 8 Aug 2025 08:56:50 +0000
In-Reply-To: <DBWUBK3RSCMB.F1FJ5V6NCOJU@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250807190649.3078875-1-lyude@redhat.com> <20250807190649.3078875-2-lyude@redhat.com>
 <DBWUBK3RSCMB.F1FJ5V6NCOJU@kernel.org>
Message-ID: <aJW70pW5zVTPSrdj@google.com>
Subject: Re: [PATCH v2 2/2] rust: time: Implement basic arithmetic operations
 for Delta
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 08, 2025 at 08:42:30AM +0200, Benno Lossin wrote:
> On Thu Aug 7, 2025 at 9:06 PM CEST, Lyude Paul wrote:
> > While rvkms is only going to be using a few of these, since Deltas are
> > basically the same as i64 it's easy enough to just implement all of the
> > basic arithmetic operations for Delta types.
> >
> > Keep in mind there's one quirk here - the kernel has no support for
> > i64 % i64 on 32 bit platforms, the closest we have is i64 % i32 through
> > div_s64_rem(). So, instead of implementing ops::Rem or ops::RemAssign we
> > simply provide Delta::rem_nanos().
> 
> We could still provide the trait implementations on CONFIG_64BIT? WDYT?
> 
> > +impl ops::Div for Delta {
> > +    type Output = Self;
> > +
> > +    #[inline]
> > +    fn div(self, rhs: Self) -> Self::Output {
> > +        #[cfg(CONFIG_64BIT)]
> > +        {
> 
> This pattern seems to be rather common in this patchset & in general I
> think I've also seen it elsewhere. We should think about adding a
> `if_cfg!` macro:
> 
>     Self {
>         nanos: if_cfg! {
>             if CONFIG_64BIT {
>                 self.nanos / rhs.nanos
>             } else {
>                 unsafe { ... }
>             }
>         },
>     }
> 
> But we can do that later. I'll file a good-first-issue.

This kind of macro breaks rustfmt, so I wouldn't recommend it. I would
suggest just using the native Rust pattern rather than introduce even
more macros.

Alice
