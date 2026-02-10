Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBF31B11E
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723619; cv=none; b=iN1EP8oinA7XBT67DHVARmLJrylc7TA0f/IhmjwlYM7duftGJmqyUJ9gFGI5GTAGCPj2Vv5GEE0TPYonFOxyOe46FIjs0YZQttHTyBCwL7RTtFuq4FqcvcU9iq7ZJedefJRltZCtC5iMMZdEAnQ3mtxQP4DWCH0qLQUmE6FjaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723619; c=relaxed/simple;
	bh=BL/Brk5QbdNFqoBa7MV+E1OKdJabyWc32ZkmSjvJq90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JFT2kijjqmT5j2qawGyyscmfrvYkRwjfkzi0o8B4BnC+Oo/gcKoAdnsElp+ibNMua+y52vtFB/f/ZBXc93vkhKbjHr7WkSf399uStCFhhfNeKPsX3ruB31lY/b2Bg70ooAKObq0+h3qmapdDUC6cYIn+VY9viIL7OwjkFT4jZdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jChfdIZG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jChfdIZG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43766514653so1813641f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 03:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770723616; x=1771328416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL/Brk5QbdNFqoBa7MV+E1OKdJabyWc32ZkmSjvJq90=;
        b=jChfdIZG7+2duMn16EVOXJyGG09kLHCVpGhveQclw1VA0Ddea74NUoF4S+hvim3KDs
         akZKUm/Fcis2h1eCywPDmvf85EADPio7EF56tbkTGBdmXL7fgOZzFhqAkLae8NUt/5LX
         RxeuduefScv8WaWcThyrUDas7H5dLZt/1ablbh4uK8m4ulLXCOKLic4HF65EhAG54yP0
         fuYtj7iwT3Rz+oqqaeggzENdmQD4RdTrPnZYY2T95qxKZSbZ8vvmdo1eRkDfPPx46zUX
         b72loz/szbipnq/7Ha1RudogvC2gxIYl7cAQPafBCtizvujUKUF2onjXbpxSQVY0uUmq
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723616; x=1771328416;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BL/Brk5QbdNFqoBa7MV+E1OKdJabyWc32ZkmSjvJq90=;
        b=XyHlHOfkrUVtEc8KS10qwG+gHFAeyV6ObsajWVeNVQM4HFjqhiubToPOf9cOB0Glnd
         0t7v2TPlEwwYjA+8Refhwtrdq+TjzTfrzVdvdpNjkU0beoM4ciRLssRTY8xzPxjSFkXd
         pQSIXNS0mISVuLwNcEPrpHR+TLrySQzwddUNVj0rxBxjFnd+ucLv+jcaekQV1h/ksL6u
         pQWjFtzwqH4k6uJ0Wo32ry5dWJnGo1d9+fXjkSqLLCFR8PuJhPDiRF3jZ3up9a4/j5JL
         dAyNy83hDP4zdE8Fem2AaO5wUXgUx9vXaLLyAUjrcJqOERFVM6/HwAslFWZBtSRgn8eX
         fV3A==
X-Forwarded-Encrypted: i=1; AJvYcCUCagezV879DJVCcDg+6YAlu5rzSuZFF3t18U6tTozZ5o+Q4SnZhUeEplJpHHmy1Os7Gf/Dpm12K0ChCGVb8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8QmKjnufmUSObkKdaFmV+MtT7MQ/9LXfpzI84YkQ8sebuwWd
	0HhMXMJ8KlvqvSrMH3m8UzowpMxOWrEAYzTiZwNmzH/gNVzhPtmpbJTgQ+Iahc14PFk4Urak7ik
	YHff+VTBWzMpQIdhZnA==
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:436:24d0:695f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2507:b0:436:1872:63d0 with SMTP id ffacd0b85a97d-43629651e21mr19897651f8f.2.1770723616117;
 Tue, 10 Feb 2026 03:40:16 -0800 (PST)
Date: Tue, 10 Feb 2026 11:40:14 +0000
In-Reply-To: <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205095727.4c3e2941@fedora> <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org> <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
Message-ID: <aYsZHhX2IVO2kOSm@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 11:36, Danilo Krummrich wrote:
> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
> >> One way you can see this is by looking at what we require of the
> >> workqueue. For all this to work, it's pretty important that we never
> >> schedule anything on the workqueue that's not signalling safe, since
> >> otherwise you could have a deadlock where the workqueue is executes so=
me
> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> >> meaning that the VM_BIND job never gets scheduled since the workqueue
> >> is never freed up. Deadlock.
> >=20
> > Yes, I also pointed this out multiple times in the past in the context =
of C GPU
> > scheduler discussions. It really depends on the workqueue and how it is=
 used.
> >=20
> > In the C GPU scheduler the driver can pass its own workqueue to the sch=
eduler,
> > which means that the driver has to ensure that at least one out of the
> > wq->max_active works is free for the scheduler to make progress on the
> > scheduler's run and free job work.
> >=20
> > Or in other words, there must be no more than wq->max_active - 1 works =
that
> > execute code violating the DMA fence signalling rules.

Ouch, is that really the best way to do that? Why not two workqueues?

> *And* the workqueue must be created with WQ_MEM_RECLAIM so that work
> items can also start under memory pressure and not potentially cycle
> back into the memory management to wait for a dma_fence to signal.
>=20
> But apart from that your explanation is perfectly correct, yes.

Ah, interesting point.

Alice
