Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D430F544
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944373; cv=none; b=oTsDUKDp9kHmDR0eIP2HirJJoW/KPUZ8qvopW2wYxxqvhATV+ZUKw41j0Axfv/zxk1KHGvbvPpA3ANjptORYtvQj8EKUkCshZ8pR2PmaMBwfp21Ib3OSL0gydBn3S7p79KTCRV/fZcuTnEdMsiC4Oe+Y2H2Yi6XOyZWcx6SrBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944373; c=relaxed/simple;
	bh=emzIcLUu0cGaXtsYDSvbR/o80gfqNGaw2w6HNBlxPgQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ae7oFNOFolzKdJsMNPpD8ZKs14UKyaBfnAjNhot0RRZ8xYOjhsuj0m1wDrKQk4RML1qKYRVgkCiFuPVZJwqGc1swTvx2JhawzRY0rjPOAZODw+dG/DvflbateeCoowpBrmuIs3W9j6L3X0THyZ1fUbYuTDbWICMiAHelWB3YdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCClnvMr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCClnvMr"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779b3749a8so16755015e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764944369; x=1765549169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wybqj2YM/RmGp6K+DACfRxN6tMdEBqPyADU71HzzJms=;
        b=FCClnvMrr07nP4T+/RVbftGyb4X90u1vaNELzmN5J4nKpUB5NTAU0QOzYlm+HfQVgE
         NF6gJYRvc/3m60+AniCaJ/s6uMPCWEttyswe0Om6H5varlrqGwj+4fSUmix82G9/7WMR
         0GDwiYm+3MCKvG60JgOI3C1uTUhBdBrJr3VRjtk/yYpbP5j3F+OMSskoSXgeOHwoZC03
         1JeH/1S0mmQQVBok/3CQ5bjMhwgJAsKzWYVoFdqCfSMuk9QN8Qj44RS1cMoWloyK2XI/
         MfXq8uBVj4r7KNTwoQr66E2cPrC6L6xtdy6inrNcw6OsdZTD1SzOs8AdP7I5RIxABalQ
         FoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944369; x=1765549169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wybqj2YM/RmGp6K+DACfRxN6tMdEBqPyADU71HzzJms=;
        b=dCfv+DjoeyZSRSTzRAfODNBZM8Grv7a45n0g32RS+VMlaXS2gHxNo2cGv39fOPqCV5
         cM7csAm3iSt5RvlRICnAX4Noo7Cgh8sKoscDV0Zb10DrDewjSV1IOJIHTFsNqrcCdlJ6
         MM1XGHqmifSd0vhYSWfQhIku3Ml8/Hutfd4K9J5p7oc68NFYdVdxp6PIwxP/Nf8L4EIU
         Ow7/PNc7VviMAKgAJVwPOzOLt8PHzS38sHciOS53Lbx0XSXBPPGXYYSgx9eWYFtkTjiq
         OKd3M8g2XwepAy/QgP6/u9oIhKowyj96VU/wjDPI4lgIf7ik3oIgLvXHwHPrO8RNjmOe
         sPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXJQHHfQhz/RmyagWgomFupyw6vCw6F/SUs4cNZZEiYWr9nsk5j90plZnqbYR/VKfAtOp1E/XxiLNjeRccIDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9MlT/U3BaEDb0TpF0VjxJmtcCbd3/o6CJi4PCxfVgRJutAt2
	F3OHSZ83aQ+K3gf3YJZWGMwP0AOesS79K5kt5tWrz11ehbB//VH57NeBCJOtxrx80riAY/wAtYU
	i2UQeap2tWLSvsAuNEw==
X-Google-Smtp-Source: AGHT+IE2G3uXl2LwX23LIlmQwFS8l3svvl1S3Kmikb7WxrYY7e4wUY/ghc5JChAHsYEsJn7prxOterQc0vftIzg=
X-Received: from wmbh4.prod.google.com ([2002:a05:600c:a104:b0:477:81d8:54c6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4689:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-4792af607f4mr116442435e9.35.1764944368528;
 Fri, 05 Dec 2025 06:19:28 -0800 (PST)
Date: Fri, 5 Dec 2025 14:19:27 +0000
In-Reply-To: <aTLnV-5jlgfk1aRK@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com>
Message-ID: <aTLp73haymcs1fkX@google.com>
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() + questions
From: Alice Ryhl <aliceryhl@google.com>
To: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <christian@brauner.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Thanks a lot for your email!

+Christian Brauner

On Fri, Dec 05, 2025 at 03:08:23PM +0100, Oleg Nesterov wrote:
> From rust/kernel/task.rs:
> 
>     pub fn group_leader(&self) -> &Task {
>         // SAFETY: The group leader of a task never changes after initialization, so reading this
>         // field is not a data race.
>         let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> 
>         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
>         // and given that a task has a reference to its group leader, we know it must be valid for
>         // the lifetime of the returned task reference.
>         unsafe { &*ptr.cast() }
>     }
> 
>     /// Returns the PID of the given task.
>     pub fn pid(&self) -> Pid {
>         // SAFETY: The pid of a task never changes after initialization, so reading this field is
>         // not a data race.
>         unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
>     }
> 
> The comments look wrong. Unless same_thread_group(current, task) == T, task->group_leader
> and/or task->pid can change if a non-leader task's sub-thread execs. This also means that
> in general it is not safe to dereference group_leader, for example this C code is not safe:
> 
> 	rcu_read_lock();
> 	task = find_task_by_vpid(vpid);
> 	if (task)
> 		get_task_struct(task);
> 	rcu_read_unlock();
> 
> 	if (task)
> 		pid = task->group_leader->pid; // BUG! ->group_leader can be already freed
> 
> 
> Now the questions. Sorry! I don't know rust.
> 
> 1. Can I simply remove these misleading comments? Or SAFETY comment is mandatory?

If the safety comments are wrong, then the code is probably wrong too!

What is the correct way to read the pid or group_leader fields of a
struct task_struct?

> 2. I am working on the patch(es) which move ->group_leader from task_struct to
>    signal_struct, so the 1st change adds the new trivial helper in preparation:
> 
> 	struct task_struct *task_group_leader(struct task_struct *task)
> 	{
> 		return task->group_leader; // will be updated
> 	}
> 
>    Now, how can I change group_leader() to use it? I guess I need to add
> 
> 	struct task_struct *rust_helper_task_group_leader(struct task_struct *task)
> 	{
> 		return task_group_leader(task);
> 	}
> 
>    into rust/helpers/task.c, but will something like
> 
> 	pub fn group_leader(&self) -> &Task {
> 		unsafe { bindings::task_group_leader(self.as_ptr()) }
> 	}
> 
>     work? I'm afraid it won't ;)

That looks like it should work. The rust_helper_ function is only
required if task_group_leader is marked `static inline`. Otherwise
bindings:: will pick up the function straight from the C header. (As
long as the relevant header is included in bindings_helper.h)

That still does raise the question of how you correctly call this
function if the group leader could be freed at any time.

Alice
