Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A73C3450
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773356197; cv=none; b=Ud8zD6P1zYY2SJqbXc2YeP0jh77anN18/t9OuQb/DYLLDgxMqq/Pml7AUkR7Co/MwpD0wYKE/xGfyEuuBbgRuw978RTNwqYNQgHpuqOkWT1gJIoAMF0mBh0k8gDSDtdZVvSTMZ7kR0KrCHSdZkVJkM8RuXhencCXF1up9CzQJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773356197; c=relaxed/simple;
	bh=UvTqFfFvaS7eb2TnXKbBQGlwA8thbiHseAeR+oO9kxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hcLhqTsWaf23mHsJZ8j6dE5PkU0dV/k0jHZjG4FZOq65bZUVvByzhGBQcVtKrMgxHS+yKEpG8d39IQBHbACnzJIhDTtU011zIz768CmPJKDLRb1KnX9B3tCa7x+ZzS1Kf3tsdrX7QslL8oaMZC9ZBSDkV7C8R3fm1PhnTKqOJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OrN3g3Tr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OrN3g3Tr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853ab1cae0so15811215e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773356195; x=1773960995; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YoLXWKXJQRzfCCvDIPltdqNOpt+b3ucdfEQ9BOfB7F4=;
        b=OrN3g3Tr1VbfcXwRJINBgFLnVjwBzJGFkHNGHCfAQ4sH/SP790nAK7B/EYLEiBlQVJ
         6tJy1IultbBwIaxxDkeVKNSvEG3Vy9NuB+guzed1Yay+Mv7OjGM4VrpPIjyxKBAEiwMQ
         KobSlbqGdU5CudBjg4nmUv9M9MCCHtwiDjVxFyiHbTUs1gAseJLmwd03D2rwfsQQGmtB
         IyB3m6ERaAwu5GGqMJZ2LDYRQ1olKxwh8geqUmzyMI2QpbsrIhV6JxwwS/vMOfmJnF6o
         vQYHXFUlO2agQkiC+K0xbf7MExDo5l7+jzAyYdpsgIg92SxLRHc1owdhfK2dfMIUQhkq
         G2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773356195; x=1773960995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoLXWKXJQRzfCCvDIPltdqNOpt+b3ucdfEQ9BOfB7F4=;
        b=Z0SB+gni/xhdgEyKUovidAPNacNHqc7GwS7UWXLj/KR43bwcNIeRmLseqOeoYy0fmH
         1qU5tNvnwXgYpKUoy5GJoZ/V/sp0Vdy8SuT+ORN11/3oI1nsOnUrZGT/ilbxIHRJaGQG
         MyO2roqhTlRdMq4DXd/2P94lDt4THhpfVAH7CCvoGJTrhw/LUP9ZZGDeM9XCVjQ8XQne
         k6TbBNors2ukiT584GA2jQIw/6wHpEHYHtVRv6Ehi1+XNZisKdPYObgy68Ml5Comom1v
         HIQWjR0PywTGk+exw9wwja7jhu7NcOtCyBHbXoc96vTCa4Zk1Sq//kaRRHL6xW7DkmCF
         48yA==
X-Forwarded-Encrypted: i=1; AJvYcCVr64RGmXeJHKZjbBRsr8MHYdVJV7/ckFlwKHsDj7E9Mu7gc4aTAkqLSdFpeGQCfN9DBgkO4sPvGMrRZKG09Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxib4Zb2H95D1D+Bnnky68LJmeoU6fYTg8hgQcKi/4y2ZzSmTbu
	DcFAaVCv+yO3pzV66uaDueD/Kil3lpQQ00RAYt2vp2xpnialBbsnsigUJ+vKX4q5I+DuO83S6ub
	O1cAgOlp74XPb1x+2QA==
X-Received: from wmkz12.prod.google.com ([2002:a7b:c7cc:0:b0:485:30e6:7d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b70:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-485566f9445mr18482595e9.16.1773356194699;
 Thu, 12 Mar 2026 15:56:34 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:56:33 +0000
In-Reply-To: <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com> <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net>
Message-ID: <abNEoZAoRT8G1Umv@google.com>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 12, 2026 at 04:39:00PM +0000, Gary Guo wrote:
> On Thu Mar 12, 2026 at 9:23 AM GMT, Alice Ryhl wrote:
> > Creating workqueues is needed by various GPU drivers. Not only does it
> > give you better control over execution, it also allows devices to ensure
> > that all tasks have exited before the device is unbound (or similar) by
> > running the workqueue destructor.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +use core::{
> > +    marker::PhantomData, //
> > +    ptr::{self, NonNull},
> 
> This is formatted incorrectly.

Sigh. Ok.

> > +};
> > +
> > +/// Workqueue builder.
> > +///
> > +/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
> > +/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
> > +/// flag.
> > +///
> > +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> > +pub struct Builder<T> {
> 
> I would name the generic parameter `Kind` rather than `T`. `T` is too generic to
> indicate it's for specific kind/type of workqueue.

I guess 'Kind' works here, yeah.

> > +    flags: bindings::wq_flags,
> > +    max_active: i32,
> > +    _type: PhantomData<T>,
> 
> Hmm, it is somewhat awkward to me that we are having a `PhantomData<T>` here,
> as `PhantomData` is documented to "behave as it it owns a `T`", but all the
> possible `T`s that we use here are uninhabited.

I don't think this is an issue.

> > +    /// Build a single-threaded workqueue that executes jobs in order.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::workqueue::Queue;
> > +    ///
> > +    /// let wq = Queue::new_ordered().build(c"my-wq")?;
> > +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    #[inline]
> > +    #[doc(alias = "alloc_ordered_workqueue")]
> > +    #[doc(alias = "__WQ_ORDERED")]
> > +    pub fn new_ordered() -> Builder<TypeOrdered> {
> > +        Builder {
> > +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___WQ_ORDERED,
> > +            max_active: 0,
> 
> This should be 1 instead of 0.

Hmm, it's weird that the doc-test didn't catch this.

> > +/// An owned kernel work queue.
> > +///
> > +/// Dropping a workqueue blocks on all pending work.
> > +///
> > +/// # Invariants
> > +///
> > +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> > +pub struct OwnedQueue {
> > +    queue: NonNull<Queue>,
> > +}
> 
> This looks like something that can become `Owned<Queue>` when Andreas' series
> land?

That's right.

Alice
