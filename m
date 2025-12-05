Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34F2BFC9B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958634; cv=none; b=r/v4f7PX8GaNAD6OYPVp95IEWL5cpijsRUkdHpRJlp57ZFuDLLJLB42+xRx8MDc1iF+tJAv/DLZVDin/e6QMthudsegCdB8ZzkHr6XVkCAXBrPCyySzRTuR4OVyH6FIRNu+nc60ObwQm40hqvumRETRbp+APvwDXI97KI0W4SXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958634; c=relaxed/simple;
	bh=kfOxdGTe7tI9bBSpavpRUT6P4uC27C+LWQwk0BcUY+Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HjJwGBUoqHaU9ZMvxP/8hAXR2+9oGmG1l7w/wqqN5DytzFy4/sJEc7pwE6MimPBcC2NdZLG/MPZJ+I5Q+XA+LvXrVudIMJKBOgM4JrP553kufLfZOi68tgszogxOiVHBM+YJsa0AUjFrrOIpi7DEd3lXL1Pia58tG5WeS+0Z/LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ISZxdRqm; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ISZxdRqm"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so1648163f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 10:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764958631; x=1765563431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYtQdVewYPYK+nwYYWgxTT03HxE0FT7b0fetIYX5WBk=;
        b=ISZxdRqmS01rlToi3rBo06k0/3LJ8ge/KWlSdURtMAIw2mIvsGL58hdKX4O7QgL2aS
         rkoEBdWdQfCF+bOvNR9y7Y9+szz5Su/ZQvCtyGHE0oRRhzv7unWaAlXG8BKC78Aa6hxN
         07/1m2VAR+PafA5lUHiikuK3CHgXWOspc/KOl0JuqR2GShrBC0j0LaFipFu4k3ZJIi6G
         PSYrsMxb2YMthnDnTa1x64vOcoZlUGCiN1i+bCGt5AJ/0vZ/EfwhIS5+3K8FcFI76if8
         uhorWa0S6Agf70EBsv1uHq2tjztLMcQt29VbvRR7t+Gb2iZXP5R+VTEbGPXhv8pilknQ
         c4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764958631; x=1765563431;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYtQdVewYPYK+nwYYWgxTT03HxE0FT7b0fetIYX5WBk=;
        b=JvHvO9QmbU/Yh9tpW61oaEWKEYT+cRwnQqI17QMLYtu97JKO8fl0yeMY7epi4GKBvB
         WB71/hxGjNdW6v2p2Mmzn3qR0tdMKvQadTle3QH9Nt5SSSUkSyqbU49iAqlNQfXiDjJM
         3CoVFLCPNy7z5lyWcVNQyoLzHu4/gR4/esTIeOcdI86eemGAcwnFbVPK2zbStYLHtpTx
         TJ/GewdbcCiymCByDM6/rHh6v0FCBCwq4hAOBeMj9r1QqP1gATI84e10sXiwzZuBA6J4
         uOWdnHlVBFdffccmfdAiONS+55vKdHQcXYmLbc+7jlqUWfDawuBhQ5XMESfamUfrxKUO
         rVcg==
X-Forwarded-Encrypted: i=1; AJvYcCWco5mw89cgQcKxBPGE1j0DCeYV4GJLMMBSWvnALmYvWtZ9jjpv+3ErbN5ofyTWkhOWV68Z8EGpqS21JZ205Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv8yffGfaqW1FLRpx5Elt2rCgVevK6oPDLTexeeZi0uzMjCO0a
	5HBu5QuW6InVtnUqaAelui1LDB7YFnA8cDp/4driyP/fx4dbjj40Nu3SOXLkA0Oe5zHXoTXii48
	dEc9aXacGUQz1DAMX5w==
X-Google-Smtp-Source: AGHT+IFbgI6+zFr2WThM/jHji6RSillc9y0ALmMhNF3P25uuiyAh3pxG84bb+AyWqmj9XeWywvftwi9tJFedKmY=
X-Received: from wruq1.prod.google.com ([2002:a5d:6581:0:b0:429:8ccf:4ae7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:608:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42f89f48530mr105514f8f.40.1764958630611;
 Fri, 05 Dec 2025 10:17:10 -0800 (PST)
Date: Fri, 5 Dec 2025 18:17:09 +0000
In-Reply-To: <aTMUqp5pXzAscrdZ@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com> <aTLp73haymcs1fkX@google.com>
 <aTLsUDBbcbl2ivme@google.com> <aTMUqp5pXzAscrdZ@redhat.com>
Message-ID: <aTMhpX-_H4Y4J7Ud@google.com>
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() + questions
From: Alice Ryhl <aliceryhl@google.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <christian@brauner.io>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 05, 2025 at 06:21:46PM +0100, Oleg Nesterov wrote:
> On 12/05, Alice Ryhl wrote:
> >
> > pub fn group_leader(&self) -> &Task {
> >     // SAFETY: The lifetime of the returned task reference is tied to
> >     // the lifetime of `self`, and given that a task has a reference to
> >     // its group leader, we know it must be valid for the lifetime of
> >     // the returned task reference.
> >     unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
> > }
> 
> Thanks again Alice, but the comment still looks misleading to me...
> OK, quite possibly this is because I don't understand what does the
> "lifetime of the returned task reference" actually mean in the rust code.
> Does it mean "lifetime of task_struct" of "lifetime of the process/thread" ?

To start with, it's likely that this comment is not the right choice
for this function, given our discussion. Most likely group_leader()
needs to be moved to `impl CurrentTask {}` and the safety comment needs
to explain why being the current task ensures that the returned &Task
lives for long enough. I just took the safety comment from the code we
have today.

To explain "lifetime of the returned task reference" it may be useful to
show you the long form of this function signature:

fn group_leader<'a>(&'a self) -> &'a Task;

By "lifetime of the returned task reference" I am referring to 'a, which
is some region of code in the caller. For example, 'a might be:

* The region of code until I put the task I called group_leader() on.
* The region of code between a rcu_read_lock() / rcu_read_unlock() pair.
* The region of code until I release a mutex.
* The region of code inside a scope or function.

So for example, with the code as it is today, this example:

	let leader = task.group_leader();
	drop(task); // put refcount
	do_something(leader); // COMPILE ERROR

Rust will see that `task` may no longer be valid after the second line,
so 'a becomes the region of code until drop(task), and the use of
leader after the end of 'a is a compilation error.


Now, the above example is not really valid. It works today, but once we
fix group_leader() to require the task to be the current task, then the
example might look like this:

	let leader;
	{
		let current = current!();
		leader = current.leader();
		do_something(leader); // OK
	}
	do_something(leader); // COMPILE ERROR

And ok, this example isn't great because the last line is actually OK.
However, the way that I designed current!() to work is that it gives you
an `&'a CurrentTask` where 'a is the duration of the current scope. So
any use of `leader` after the end of the current scope is a compile
error.

> Let me provide the artificial example. Suppose we have something like
> 
> 	struct task_struct *TASK = NULL;
> 
> 	void stupid_example(void)
> 	{
> 		TASK = get_task_struct(current);
> 
> 		do_exit(0);
> 	}
> 
> and a non-leader task calls stupid_example().
> 
> After that the global TASK pointer is still valid, it is safe to
> dereference it, task_struct itself can't go away.

This would not compile in Rust. The &CurrentTask obtained using
current!() can't leave the scope it is created in.

> But! Right after that TASK->group_leader can point to nowhere (to the freed memory)
> if another thread does do_group_exit() or sys_execve().
> 
> So. Perhaps the the comment should say something like
> 
> 	SAFETY: The lifetime of the returned task reference is tied to
> 	the lifetime of the THREAD represented by `self`
> 
> ?

I think the safety comment should make some reference to the fact that
we know it was obtained from the current task. After all, that's why we
know it's ok.

impl CurrentTask {
    fn group_leader(&self) -> &Task {
        // SAFETY: This is the current task, so the task must be alive.
        // Therefore the group leader cannot change, and thus it will
        // stay valid as long as self is the current task.
        unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
    }
}

Alice
