Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709493FA5CD
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358847; cv=pass; b=bLbbsqE+qtL/ff+8jVJTtHwdwX+/3EhqdHXcoEkArIUTWYyajGNRkVkfpGip9xqgiGuYEOWoomFjLtqBZdnLTiJVrr3+hIRFEWRmYcmKldH4LMwJT7deBbvmXxXVveRMId+9om2+RsIeKADD34BuMDAAc3caMtcQZ10BPY1aZiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358847; c=relaxed/simple;
	bh=BINvtLCBAGvMj9bi2l2TPbrC05xIHlcYiDwfuMX07iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IR4yhUDTAS0axiOxsKKCSJ5wf+/zwbtiWBQIXc0D/yLN7OGaYsANgDprmxTcMFl4JtDhIoKFPjNMz53hXBXaXjPZZve/XYxoM7wOE2lyqXU2N/TfVKVo3kcyzpvvYGBBm39B7X/yKF1ZC/aCEnVT6QmDUuD3Dg/vzg5Go0Mu/wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M9fBPQsZ; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M9fBPQsZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b48ac2727so962301f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 06:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774358844; cv=none;
        d=google.com; s=arc-20240605;
        b=a8PJDJ0/Um4vWMcZ4nXg6KLpO+TLAYHqhh0uNiQkkuQuRB6ugl08zNJY+OVc8x5eox
         86gaMdpVvJN0CDh1KK+GEZ5Ff1KSRxZeML/2rW3P7m9ftyFdIbPJp+F5s9WwaS9Zno/8
         rcyHPi1CSU58B3E7HnDJniTVRKpIg8hC4FxftxAvRyhnsVFM75tbS1zw2uZMF2cDdAk4
         3Ug7jFwdOE5Zcor93O+/TsEVYrIyISfrmzpw5eePQiUYJOzMkPbbnJ52TjqOuAC13y6h
         kxqDyW8P8E9WQc4TBWSeBWssQtHvfSE386ratEKd+xJmFCCzSRfeHn62dXpS7fN6xx8Q
         SHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAVyjs7BfIwZAVkKntYRgyhMAqaKjTB8tChCQpQIM34=;
        fh=ZFKAM6gsQiDitBLc5idKhaoaHhZomSGwM0P13fVLm0M=;
        b=LMForrhFzm9TxyvOPxYJLfYJ1HtWJLg9bAO4WDrSqvNSQvegVYdiSZ9s3HzoSef5g1
         Ad0Wknq0qoxFOir4kMM59w9y9p8JbBjwwpmv/M39OFcegKXt03RrL8UXoCs/q01VHfRX
         NIXYbjY0djGWhN2H+QMQ1xgVMIj30WQU6No3rNYiYzw2c0iZY7bJuBJ50Aonw7CUEFYl
         7hbMOMnGlGooacgl5P69GFZKXgKC0iTgMb+eTxtsQWxdGHdmg9u72axrjgJQq/oOk/9N
         xI8OLTSflW8Vzk88FxJCrU0GAp8Tm0oy1cVB/wQDF+C1LsohJTM0HodAeZWW5e5q/RY8
         /NZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774358844; x=1774963644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAVyjs7BfIwZAVkKntYRgyhMAqaKjTB8tChCQpQIM34=;
        b=M9fBPQsZveGYCeu10Ws6GLTLa4NAnHq+4iJ07uU1vh9wqScY82fk5yvHMMEZu3aOtH
         2aNITIVWbnXgvkVARTlH3+kxJcxqohG6+JHP42LkHPjOurBik1WF/P33E9im8ltLlRGD
         1uC7eg8mDxL5nFnQjUdcBkurUWT9T3bgkTPI2l5Dg49OahMmze2rWHWLxguevDDhKoez
         nDkCGxblurLhlcaYByA5p6wQWKEvVKN6sEimcuBE7NfdtnQjaRjcU0XfXnKKlaFbeRsF
         6hDjgrXJOdVWfK/A1Kp96nQC5oyhiJYr8hZa5QwkqEk6Fh1ZtoOd8OcR0nDIcZWa/rOz
         O5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358844; x=1774963644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAVyjs7BfIwZAVkKntYRgyhMAqaKjTB8tChCQpQIM34=;
        b=rpOHSNKdksTvg18Uml9Pw7vAUT9BVsLrqYaYTXnQ/cPUdMPBw9nH3qzD9GTtw82Bui
         UCcbBRRARbpEc96U4wmlNXy42WPcr4FoIuZs19GR6ViOj0JB0/xsDxP6vtQZws2rlx76
         UjSvKuegZQl1ZsTPNGznM0s4fT/oYIvyTuhytwpGlwNJt96NGhN7ph+E+Nq6qE2jihet
         +V4jiDxRO67IETEbvtytCtlMSkpTGbXbTdkwcW+NUFLHEngqGeVrHmQY6DkLxlk4qZqT
         8MnGrTogjJcPAqOpSu+ExqsGJu8IiSyLfmShUDLwQCsHzgYteLxnVGKS5lqEBStXI6Fj
         ELRg==
X-Forwarded-Encrypted: i=1; AJvYcCW7bfR8xEzZDhaszuU4z1Jm92vOzRaYrhfx3goyqWMgKoIbho7rJQtrwY+Af/9wpmXXXTeX1OmUDdmgLMktxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxANySgYQjaN9uTCMDZmwbQI7syfKXx3hcpAAl6tAYh4x9EXB0t
	qogLoOsC465jxzA6O7j1If1tVwmDrxjUF1VqH/2Q2OvkrdDmGwKamsUuOi4PM3xx5Gp3LiJ9fhy
	hYJWsAYhk4ykppBP39SrWHu2czi9SjaCiwXHszMtF
X-Gm-Gg: ATEYQzw4lHykys6n1WeFXFfWTdLInZ5JgehSYMFAuYKTxXjPHqL0bOuVcm+PDeXWWC+
	lGLZxuie32oDa7McGRG1by4nKpHVpcFiJhRB//wWlyBsq6YTbzXX3Q/T9MgmoM8LCqeVLmOq+8b
	roHWsGilc8u+RdzFgGWzm1vw7uzlhQ1cw54BaJP7FcM/eqBn43sjdSPBfBJ1QhtDiD7gVZsc5Cy
	ARL5IbmanRAOmU3PgvdeyKqBNSTsMbIHI0UyS19vHILMBkTgqWqRY1QSedZ1amcNSj3f1VK56mU
	TW8DOUpD6pMKvrzSFU88dVQPU9oe8oaYc8Wb4cJluyJcpyaG
X-Received: by 2002:a5d:5d82:0:b0:439:b3ff:9ab9 with SMTP id
 ffacd0b85a97d-43b642919b2mr25933211f8f.48.1774358843215; Tue, 24 Mar 2026
 06:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org>
 <20260216-rnull-v6-19-rc5-send-v1-5-de9a7af4b469@kernel.org>
 <abfU_itQLa4jDy5L@google.com> <87ikamrbo7.fsf@kernel.org>
In-Reply-To: <87ikamrbo7.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Mar 2026 14:27:10 +0100
X-Gm-Features: AQROBzDq-YxIP2yXojVICe3lT7Gw23jBxgQOd3OOjRsR5pVnUNgTkbDxmHX_7ss
Message-ID: <CAH5fLggq-1pReNsRtgRfm0Y_PiQvUsXbMMkPkyO9kuhqzB3wrA@mail.gmail.com>
Subject: Re: [PATCH 05/79] block: rust: change `queue_rq` request type to `Owned`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:08=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Mon, Feb 16, 2026 at 12:34:52AM +0100, Andreas Hindborg wrote:
> >> Simplify the reference counting scheme for `Request` from 4 states to =
3
> >> states. This is achieved by coalescing the zero state between block la=
yer
> >> owned and uniquely owned by driver.
> >>
> >> Implement `Ownable` for `Request` and deliver `Request` to drivers as
> >> `Owned<Request>`. In this process:
> >>
> >>  - Move uniqueness assertions out of `rnull` as these are now guarante=
ed by
> >>    the `Owned` type.
> >>  - Move `start_unchecked`, `try_set_end` and `end_ok` from `Request` t=
o
> >>    `Owned<Request>`, relying on type invariant for uniqueness.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > It would be a lot cleaner if we could implement HrTimerPointer for
> > Owned<Request> and entirely get rid of the refcount in request so we
> > don't need ARef<Request> at all.
> >
> > Is there a reason we *need* ARef here?
>
> There is. Real drivers will need to dma map the data buffers in
>  `Request` to a device. This requires taking a reference on the pages to
>  be mapped, which in turn requires taking a reference on the `Request`.
>
> We could split up the reference counts into multiple fields, but that
> would be less efficient.

So how exactly is the refcount used here? Can you elaborate?

With regards to the Owned series, I still think we should split it up
so that the patches making ARef+Owned work like Arc/UniqueArc is
separate follow-up series.

Alice
