Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64275212B3A
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Feb 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739442076; cv=none; b=Ee04MwAgDjFKhoAvCCt1/gqpQ1bD/2nhttYMb1u24bN5BftDgOxeo0bC7+D7Mt21htYjWfDgELMst71a3ohF8+N5FUkLxNdTx9BhBMKiQIJeoS5mJuVKpjIqo0dKZ383TnB99gC5vGEMJG5+roxvvcq1wzBriCUwa4+R1YrkU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739442076; c=relaxed/simple;
	bh=qF8X5w0Sfbzqw7ob8JL1h0w+NmMo3P/E6Tq6BNm25jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1AG/MfpZPYmv4rKQvZ48MQXAoPPyKJP0jyDC5gTBWs9UfA4QCEVSQPSSO0dyN+KNeeC4dgjGTTe18vFN0WwmhWsebHFbjc7G66hsXZGKZXEr9mAdbjkduzFIOEUVP3h5MVLvxqD4zsXtM/8E8KBxmoUO27BcWUZYvNsqPsXdus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDg6+Ldq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDg6+Ldq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739442074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIZl42f0T/s4rPyC/mDHixtV5a5Psa4ti9oIJ2wM97U=;
	b=hDg6+LdqlI4R5g71hfrbHJP7te01hewEucOLTI1sQHliPfZ9bxLFv8I/xxByE8r6WuvB4z
	DdGt+eGuPvoE5WYl68wv4uDXbde2yybu27CJsQcmV51/Uh5L+jBADZ4zYyORptXWIkVyCT
	unidT1OQp0i7ObUZTrN493vmkk0+Mj8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-phQJtG7WMH62kpS5noEESA-1; Thu, 13 Feb 2025 05:21:05 -0500
X-MC-Unique: phQJtG7WMH62kpS5noEESA-1
X-Mimecast-MFC-AGG-ID: phQJtG7WMH62kpS5noEESA_1739442064
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso962646a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Feb 2025 02:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739442064; x=1740046864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIZl42f0T/s4rPyC/mDHixtV5a5Psa4ti9oIJ2wM97U=;
        b=u4g6qFoR3uRe+ux+msBju5f2KkBc4Hu2KXMSnj0E3d0xIvaMQCk2gmeSFdEWO0EmG7
         AsbgC+ZS923vAlI0q9m539Q+DuD/5puvsERaWYatXtcZqkb9ksMLaAW2ctHKu8PsT+59
         dA+VRglXqsk1ixGCUgMGXSB9LA3WuM+FYJzS0aWEBkwSdAeZyS61u04pPbk4Oxs7wsM/
         jDLZDFkYkgYWbKAxstbQ9TOj5GDVc1kBt9VT4Cd+dTqBpkjQHtsehKLJ2aZzo01S45y4
         Avfh8Jdn72tRVqV19K83cBsxYUueXsB4Q3Lt4BuirfUvR2dbzns7X1c7labm4TwMJxqh
         VIvA==
X-Forwarded-Encrypted: i=1; AJvYcCWTldA7XKdyntiwDeASzfqjZphSJv3nwsz8zTPDX35DtyOELmVVrmSXorh45FVl/JMUI2xNkdAUnTOaPGycfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkwc1N3o6WMu0xzqstU/hRkQjM+1VAZUpTjTtvhU49LSgmm75
	z4koYg1BYzdIcqr2dpbQGFK5teyUheBPzvPAYm8HX/dUzLtD2hsAYg29nvVyBHBfQQFFldmik5+
	QbhQr4270oZbvIrqVbpC5rrwl4PiU2NI/sUaXjdeBB/BeUFRrJUjMGOYMdT3WY5VuaUd0yzBbIK
	1EVEjIDyXqs1UmwGbWwyxnjiZ9OUR47iBPp/op5JI=
X-Gm-Gg: ASbGncssSIotFkYDyhi/R+qrZtH4NI2FsPjOi4tYHrCkm4mcI/x1vhsbAw//mRdWDze
	2rwnbAEeCVg3cKzkwSQ+UK6spaiA/5pmcOHMW3bVvTxzqzEY8prx9XD0PZF57
X-Received: by 2002:a17:90b:4d0c:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2fc0f09e2a0mr3816969a91.27.1739442063991;
        Thu, 13 Feb 2025 02:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu4vn2LrjqAnhWuWOvrN2AtW5Lwg4CZNxqKUWaaXHxg53iYVtWZ4u3ana8B5JaufUoT62DXG+exzieHJ4zSN8=
X-Received: by 2002:a17:90b:4d0c:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-2fc0f09e2a0mr3816956a91.27.1739442063706; Thu, 13 Feb 2025
 02:21:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025013030-gummy-cosmic-7927@gregkh> <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh> <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st> <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st> <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <20250208204416.GL1130956@mit.edu>
In-Reply-To: <20250208204416.GL1130956@mit.edu>
From: David Airlie <airlied@redhat.com>
Date: Thu, 13 Feb 2025 20:20:52 +1000
X-Gm-Features: AWEUYZl6JZiEhvOwTJa3Qd8Zms_i4LmB6cYZldPte7npIma4O8LaQa0cLqCkN-I
Message-ID: <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Dr. Greg" <greg@enjellic.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"Bj??rn Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, DRI Development <dri-devel@lists.freedesktop.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mspbOMfNazlufu4qbNldwmll6gMwqqlfk8oLah3GBOE_1739442064
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 6:48=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Feb 07, 2025 at 06:16:38AM -0600, Dr. Greg wrote:
> >
> > The all powerful sub-system maintainer model works well if the big
> > technology companies can employ omniscient individuals in these roles,
> > but those types are a bit hard to come by.
>
> I'll let you in a secret.  The maintainers are not "all-powerfui".  We
> are the "thin blue line" that is trying to keep the code to be
> maintainable and high quality.  Like most leaders of volunteer
> organization, whether it is the Internet Engineerint Task Force (the
> standards body for the Internet), we actually have very little power.
> We can not *command* people to work on retiring technical debt, or to
> improve testing infrastructure, or work on some particular feature
> that we'd very like for our users.

Just as a courtesy to others can we not use the "thin blue line"
analogy in this community, it has had some bad connotation thrown on
it in the US context over the past few years, and I'd rather not as a
maintainer be aligned with current connotation/interpretations of it,
despite having family involved in our local force.

I'm open to suggestions for any better analogies.

Dave.

