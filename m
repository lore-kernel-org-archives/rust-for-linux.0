Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214E1C0DD9
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713647; cv=none; b=UnDONC2t2HNMd0M9uu7bKdPNj64SMRp3oj/bmgOoojiEzKt0H/xc+kpUXEGXVYqs0gCfOTbulkhWnC6v/lUpFwgpHCT5DrILBzhUuHjGXnABuZ7uesrIhLkZQE4tVpE/v4lbNbN4+zYXzqc9SKHJySfc3Ex8DqDZCrJ9asJ4Ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713647; c=relaxed/simple;
	bh=2V+ccwDmx8bCw7FigTZcAqa0RATuPqPVxRdszXcI/Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOFwECAk/Cid2wHtfq0dNTpmPN3ys0vfsRdm+e90Xv+1+KSqe0XO+Bsq452S0IK/pU7/gd+CF9HUPHAjzsIGebPA2Ji1VhoYxrLWCJLsHIb00wDfDKKWkqpRCC567MuuxPoGnQMGJRWF+XO4mBsO9x+XMmiGeW57ndVp9Z5yCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AhsnWQx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AhsnWQx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso4286975e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723713644; x=1724318444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80zm8jzgImQ04ZpZHXIv+bJT/2HKQyCzED5vbg8c5F4=;
        b=3AhsnWQxUjbNIK1m03YHYyOgTFJ/YtRuFKq2G1YYJW6UtadLvG2sp4spFInvSJZx1x
         yLwHUUhMjtk3gk3jFplkzTiSlYajcdEetVZGCNqV+MSDr5kYI1DT63P/m5oSJks3PIYK
         dBo/U/GhG6YtWWvnQbqVOljUudmS50Jgm2zu5CZPyRIzXlNSCgrRGDbTz1rw1qbW8nL7
         BqI4zp7uBxnz/0EEcs6PD5LbXfiFLfAuPGRkNR1sT1vMsrIZA4bmHOMek4Evy4DOA1DR
         09o5qLvTYht/rMiSKLRhOjCohoaY/ITenagu/OQX72yzACqFRvVjyUZYXG0/bxXecXw6
         eoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713644; x=1724318444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80zm8jzgImQ04ZpZHXIv+bJT/2HKQyCzED5vbg8c5F4=;
        b=tvRYyWzAgU6cfj3uag9H7DydCoPdPjVmikCfeveTGrvaxpZvaSFQrmRWnh05593/s3
         cr3AiqwMA6pZDrPZGfGd2sOU2/HeQiOmm0iawPgYGooyfjbjosPql4EJYSWMi7NOoWhf
         f++v/DsLsoAHA44P6FO1fmpxo9CciHVHl+dnSetcebRJpNFBDhWIqFeROmq8GXl3/ycp
         hMfIGtbP6p1Z53f0bZ6+lO4DsUE12jnYSMLy7BspRe/3h+yK7cjtGyDNQbYW/ph1r83q
         E3frMigL1VHRaJXtTTcjGvpIDKGzfqydmcdD8Cgczx+V+h233zPqK/0CElyU3gtXv8uH
         6slg==
X-Forwarded-Encrypted: i=1; AJvYcCXGpu8ubCg9Vh/hSfoiARVseh8x7t1Hi5riMAJRo0d9OnoboBhACX+XPre2TEjAK9A3SwkDY4a7TzgGBQqjb8UhlGsh+uotDIAKStC0i3g=
X-Gm-Message-State: AOJu0YynMecgNY4NXD4KYpWljJ3+cfarDOZnlnYmj/9u1AuXcGsaQnu1
	EmUMwlpnNg/s5mmI0pe4zXh1T4T9s+TelUIy0xzBYkyVr2v3i0yPwacL5xJm9M0T9JG0tjFC9jf
	Dxp4HlHkGlwOdh4v6pDyUq5iLdqlWiBMgv/Q8
X-Google-Smtp-Source: AGHT+IH7lkn/aRzWqScZW92BYvziPxjfQGa2Ww0aXoS67wvigoKomhvmcMOLmj0n1Ikrp2fMRD48McZ45QoGO5RKsGU=
X-Received: by 2002:a05:600c:3542:b0:426:5269:1a50 with SMTP id
 5b1f17b1804b1-429dd2364bamr32348045e9.11.1723713643657; Thu, 15 Aug 2024
 02:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <Zr0GP0OXliPRqx4C@boqun-archlinux>
 <Zr1teqjuOHeeFO4Z@cassiopeiae>
In-Reply-To: <Zr1teqjuOHeeFO4Z@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Aug 2024 11:20:32 +0200
Message-ID: <CAH5fLgjvuE5uU00u4y+HyHTkQU_OBYvHe6NS5ohAhrLntTX1zQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] Generic `Allocator` support for Rust
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 4:52=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Aug 14, 2024 at 12:32:15PM -0700, Boqun Feng wrote:
> > Hi Danilo,
> >
> > I'm trying to put your series on rust-dev, but I hit a few conflicts du=
e
> > to the conflict with `Box::drop_contents`, which has been in rust-dev
> > for a while. And the conflict is not that trivial for me to resolve.
> > So just a head-up, that's a requirement for me to put it on rust-dev fo=
r
> > more tests from my end ;-)
>
> I rebased everything and you can fetch them from [1].
>
> I resolved the following conflicts:
>
>   - for `Box`, implement
>     - `drop_contents`
>     - `manually_drop_contents` [2]

Not sure I like this name. It sounds like something that runs the
destructor, but it does the exact opposite.

>     - ``move_out` [2]
>     - `BorrowedMut` for `ForeignOwnable` for `Box<T, A>` and `Pin<Box<T, =
A>>`
>     - `InPlaceWrite` and updated `InPlaceInit`
>   - for `RBTreeNode`, make use of `Box::move_out` to replace the original
>     implementation partially moving out of `Box`
>
> @Alice: Please have a look at the changes for `RBTreeNode`. Maybe it's al=
so
> worth having them in a separate patch.

RBTree changes LGTM.

Alice
