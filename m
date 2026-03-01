Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955F2E7621
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366153; cv=none; b=HwaxCZcU8LQwe12WFrwoFApDkoLAvBpvnY6aQrTsfXGSRuuNsa7om476tqSd015Sz4A1fdHifQXdvitGzker8A3fH0A92oC/BP5gdBbP9tu2GyR7GiUausa2lyS9OOi+bRT4jHIfy0s80zscJGARaQoSew9toHTwvfhsEUniG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366153; c=relaxed/simple;
	bh=PfN/y5pRqIRPogCVA2tIWQzh++wno7n31O6nvIICik8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BeGMhxnzVHFPSuJqtN1cKE3aZoBpa+ZxGsLyP/c41vOZbScKzQwe9UAyGGefNw2ubSrlWt9TBLpMfcGUDyP5R8DIUd5fgBOUKFtJbKykv5YUyt7s4JYNALGATF5CWegf/+gkCnJ+aWKontwq5dH+6YzuRZysixhgNR4S+nvGT9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tCFGDun8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tCFGDun8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so39420065e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772366151; x=1772970951; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLaBt3LVM64DKGE6X1KmJrKDdlh6IijFoqqtE4OEVdY=;
        b=tCFGDun8D4KoRuhcvwKG2BLEyYpxJllYFtYJh5bREmoJCU3M/suF95ZH/8YfViDAZT
         obFmXtH6SHSIu2D/SYAm7EozCUOiZ3V/cxlWmvdUO80bytQnyBVFN9QO60J7QeFb8xyn
         vzKwwux8cIGbmAtMLX2seJusfBmPDjh6ktBSyMkx29218zpPi6fja+OP2KlGdq2esHJb
         LE0HLL7tQAY0dLogJRFZGymvnw1xzi922lvHZrf9NXzQjIcWy1V8HJG9ou/phPD2MubG
         ISY6a8YeEgeLPQxOjWwajZxaQF+hKgKRD3tzHnr2QCLqSaXjUjoUJt5LcGMFOShDsQd0
         u3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366151; x=1772970951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLaBt3LVM64DKGE6X1KmJrKDdlh6IijFoqqtE4OEVdY=;
        b=AKWwn8oj5hnFgTQWxqSuQ/tSUkkjICnY/oHBT4+lfGZ91BiiHGJu0jZCwdFtj/1po6
         ArEdPmi5hWq9Mu63MYHKMPLQzNz1DwyFYW0f3TDVFZMW5IgaqB8w19NyNgerxzBO7B9a
         mtOEGZ4Ne2Tcq9pvm/XHHSX0uQe4cwbxkCbAOr48om6aZc2XGyG+zI1Hz3W8+7t19khx
         xZBHudGuEpSADlu10lZGtfVSMGJDcxQtIGVx8xyQMBBWvUNvE/MsQKmPrrrM9iCwEzAa
         LFwRhXlEOFEHSU3uV4YaaEUR2lrq4KTxlPU+yRZRFZGIDQKkzeG0xlW25tAu32pPTmdC
         nMUA==
X-Forwarded-Encrypted: i=1; AJvYcCW+QcspDyLcSCeNXSXuR4mwNzhXeGrINKNexvTy7rllpKpxakQJBNtue3gSpNBMeqg8cy1MoY71K25/SRdD+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTgfoYZ6YRYc0imeMT7ex5EEgfjMpkpkkXLWLjRI5l5rg+nb7p
	oaXhc8tY1SaKHCTdfGSdUYC0GV9wTwqSF3Uyu+AAoxL7+g6+dIcIhy5W4BIm9JzkRa687vWsMky
	RIY8CJ1khIIglckXhgg==
X-Received: from wmri26-n1.prod.google.com ([2002:a05:600c:8a1a:10b0:47e:e414:b8fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d89:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-483c9bc031cmr142097055e9.8.1772366150568;
 Sun, 01 Mar 2026 03:55:50 -0800 (PST)
Date: Sun, 1 Mar 2026 11:55:49 +0000
In-Reply-To: <DGQOAM62LGC8.2S5KJZBQU9OR8@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com> <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
 <aaHq9VpaVN4_hchW@google.com> <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org>
 <aaLmzp0mMPpE45yQ@google.com> <DGQOAM62LGC8.2S5KJZBQU9OR8@kernel.org>
Message-ID: <aaQpRXR2hBde5LZy@google.com>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Sat, Feb 28, 2026 at 03:43:02PM +0100, Danilo Krummrich wrote:
> On Sat Feb 28, 2026 at 1:59 PM CET, Alice Ryhl wrote:
> > On Fri, Feb 27, 2026 at 08:23:44PM +0100, Danilo Krummrich wrote:
> >> On Fri Feb 27, 2026 at 8:05 PM CET, Alice Ryhl wrote:
> >> > On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
> >> >> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
> >> >> > +    #[inline]
> >> >> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
> >> >> > +        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
> >> >> 
> >> >> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. Maybe use
> >> >> debug_assert()?
> >> >
> >> > What's wrong with just making use of the C-side warning?
> >> 
> >> IIRC, we have the same pattern in other Rust code that we use debug_assert()
> >> when a value got clamped, e.g. in udelay().
> >
> > In udelay(), the clamping happens on the Rust side, so it makes sense
> > that Rust is the one to warn about it.
> >
> > Here, the clamping happens in C code. To warn about it, I'd have to
> > duplicate the existing C-side check to clamp in Rust.
> 
> That's fair, although I also think that it is not unreasonable. Given that this
> uses the builder pattern, I think it would be nice to ensure that nothing
> "invalid" can be built in the first place.
> 
> Maybe we can use a bounded integer?

Bounded integers allow zero, which is also illegal.

I think it's a bit much honestly.

> >> >> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
> >> >> .max_active(1).
> >> >> 
> >> >> At the same time having a separate ordered() method competes with max_active().
> >> >> 
> >> >> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?
> >> >
> >> > Sorry I'm a bit confused by this. Why does an ordered() compete with
> >> > max_active()?
> >> 
> >> Because you could get an inconsistent state with __WQ_ORDERED and
> >> max_active > 1.
> >> 
> >> It also conflicts with sysfs() I think [1].
> >> 
> >> [1] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/workqueue.c#L7417
> >
> > And I guess the further argument is that we have a use-case for ordered
> > workqueues?
> 
> In the context of
> 
> 	GPU drivers often need to create their own workqueues for various
> 	reasons. Add the ability to do so.
> 
> I think we do.
> 
> Depending on the final implementation details and the driver it may be needed by
> the job queue.
> 
> They are also pretty common outside the scheduler use-case in GPU drivers. I
> think panthor has one as well, so you might also need one in Tyr. In nova-core I
> expect this to be used in MM code.
> 
> But even without that, I think it would be reasonble to consider ordered queues
> for this abstraction, since alloc_ordered_workqueue() and
> create_singlethread_workqueue() seem to have more users than the non-ordered
> constructors (without checking whether alloc_workqueue() is also used directly
> to create ordered queues).

Ok, I'll consider this for next version.

Alice
