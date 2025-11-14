Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C02306B2D
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113503; cv=none; b=TQC7yxdVee9DeDrFPmUV7viQRnlAACvYp9jUWkU2wxbLMM/wzpt09F+Yz3oV+zyjSzR2Fc8/5g9E9WaReN2IG+suxs6c3ni7S3G2SziZLyxY4HUPTIwngvWOjJMSjN1VL6XH33ZYlDdIbPgZcPEbcPFmLn/yibXP2HfcK4j0ioU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113503; c=relaxed/simple;
	bh=MhYK7Fuz8aLrEJJ0z/jtlvxFHm7ZZ8CTilRTglRw6P8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=udsvVP5g3rCfwrfmFUjdxBCkCRpyJCqeSqJZsEHUEzIrNpgWy5m+ywejy0K5LyB+PXPCMA3e+kSf5GYtUnKGmYOrrAq4ZMZFpRVTL5CQPQSBSSvEf5DNVdppKzhuQle4VzgOO8H8gPUmcUMR1s10mUWDqpLar3O3oyCJ5nrWfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N9k/K66o; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N9k/K66o"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b70b974b818so173255666b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 01:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763113499; x=1763718299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pRD00tHeY5cdf7KxqF2jFSxDwoUN5Uum1eEhmcMbeuQ=;
        b=N9k/K66o9ZcyUiNw00ole+6xoSPKqaV8OIWAna4qT2kZvSiywR3MVDUR91TklagDfb
         X1pxRhLQ4lPhXv7Lc8uiRKGNgTkHOfVNpCCJdCJvdv5jp6BtAMxWiFH13pk7iL456PUX
         SGlZ8vAs2NFLUuHg/pVn7KplTcsHm54wTevjWi2GB5gHCJi1DH6NjnAdBl8uRLH0lT6o
         W2tRBmfc/mSH52F19vcWNsJzKN2iKr8qBiyZZVL5ONb/zh8W8LpmrCEE/PZKTx/T4xW2
         V8W+XfRqaJzZkP8kqCiNgiGxj8x0BZFpGtEWUShKa42ZjzG2XF61KvZiuXDyJsjdU9ZP
         dMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113499; x=1763718299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRD00tHeY5cdf7KxqF2jFSxDwoUN5Uum1eEhmcMbeuQ=;
        b=VMM9CbicjGp9MkA1UzkeB9WA1nD4Mx/WUhdSpPoY45xa2f/ECWpzi0Fzv9x/LE51R5
         Wu2sTfn1f0FtJoEe4noLkCnS4X13HKPU9F7GCz+0ChhglArxxhVoux6oMxoOQZOpY0qp
         lLQB4w/k8XzCGsRij8pFFnf3y+mOIgFNsqkdUfFEzk9B+dHbbBWr/V3DEakf9cxwqdZ4
         AbsWmMN/h2061pSP2V10MiMhAt4BIIN6wcjC/0gnAJMhaQTZMGgO1N1fWMzDaDz4WaTN
         ancXLZKaCGbgFrlmJH7jYoRRGdWKVLyJb6h/59/fCtOH+pSte19VIuBOo1ZKy9UXdwOd
         TwkA==
X-Forwarded-Encrypted: i=1; AJvYcCXsxRMB12EfUtA8gyVpBo78Yw5q6rfER8b136t1xI/dsgskq50EuEjfetsGf01r5we9+SMEVBtBHd+W18UdGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAD5oHB4dIQQQUMPFFb7ZCZ+JM2iK3RS7K7psucMGLxL13HIx
	lKEerrhnSGxXBfVG6EC3PYG65SXm4tiZEg9Fvb5wUzK2wt+7XfMRty4h6XUfA9R3IBo6jvwrj6X
	pl2TjYw0kNptfHYQKqA==
X-Google-Smtp-Source: AGHT+IEm8jwzq/nQACHWX8CpZkS7ky+thx5qIyqMsvn0Ki/rLJllXcmU6Vivtx+WwowP4czjWd+5pLWgDIUZ7Ts=
X-Received: from ejcwe12.prod.google.com ([2002:a17:907:d64c:b0:b73:3b0d:754d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e24:b0:b6d:5840:4b43 with SMTP id a640c23a62f3a-b73678969aamr250627866b.22.1763113497809;
 Fri, 14 Nov 2025 01:44:57 -0800 (PST)
Date: Fri, 14 Nov 2025 09:44:56 +0000
In-Reply-To: <aRY28VITGL53zenZ@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-2-8b45277119bc@google.com> <aRY28VITGL53zenZ@tardis.local>
Message-ID: <aRb6GPDZo3kaoeKm@google.com>
Subject: Re: [PATCH v2 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 13, 2025 at 11:52:17AM -0800, Boqun Feng wrote:
> On Thu, Nov 13, 2025 at 10:01:07AM +0000, Alice Ryhl wrote:
> > Creating workqueues is needed by various GPU drivers. Not only does it
> > give you better control over execution, it also allows devices to ensure
> > that all tasks have exited before the device is unbound (or similar) by
> > running the workqueue destructor.
> > 
> > A wrapper type Flags is provided for workqueue flags. It allows you to
> > build any valid flag combination, while using a type-level marker for
> > whether WQ_BH is used to prevent invalid flag combinations. The Flags wrapper
> > also forces you to explicitly pick one of percpu, unbound, or bh.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> [...]
> > +/// An owned kernel work queue.
> > +///
> > +/// Dropping a workqueue blocks on all pending work.
> > +///
> > +/// # Invariants
> > +///
> > +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> > +pub struct OwnedQueue {
> > +    queue: NonNull<Queue>,
> 
> I hope Owned/Ownable can make it just a Owned<Queue> here ;-) And
> that'll make Owned<Queue> automatically Send + Sync. I think it's not a
> rare ask for `OwnedQueue` to be Send + Sync.

Oh yeah it should be Send/Sync.

And hopefully we get Owned eventually.

> > +}
> > +
> > +#[expect(clippy::manual_c_str_literals)]
> > +impl OwnedQueue {
> > +    /// Allocates a new workqueue.
> > +    ///
> > +    /// The provided name is used verbatim as the workqueue name.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::c_str;
> > +    /// use kernel::workqueue::{OwnedQueue, Flags};
> > +    ///
> > +    /// let wq = OwnedQueue::new(c_str!("my-wq"), Flags::unbound().sysfs(), 0)?;
> > +    /// wq.try_spawn(
> > +    ///     GFP_KERNEL,
> > +    ///     || pr_warn!("Printing from my-wq"),
> > +    /// )?;
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn new<const BH: bool>(
> > +        name: &CStr,
> > +        flags: Flags<BH>,
> > +        max_active: usize,
> 
> Do we need to support `max_active` as `usize` when the underlying C
> code only support i32?

Negative values don't really make sense. But maybe it's a good idea,
yeah.

Alice
