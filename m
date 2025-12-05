Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABE288C39
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948944; cv=none; b=dsT/KoOQRdYSMZve+5gGLj58YzX1H5Q5P1Xu1e1BHTeatQ8wlFK5WeDpC013rS+wfLSQUg3MC/xVgTxTtoFig/DKJM4PR2lsT7779QfICjyptaJAAnu0vqEXNW3QoeyB1+HmjpttNEiSYR0ED768YsiRHyJ3rUbuw+sI//Pu2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948944; c=relaxed/simple;
	bh=DINKyLm/f8IyUyfyLz0LxN1JAYalC2AOhZVj1kvYk2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhJIKntjgCwn30jy5bZs1b676Yg+JeA2RFWsGWUbkQs/XYTlYe36NvnZg0PYf4dBkxFz9AKjytiA/IUJbd2/uNrfa5RxLurq9yGpCwhH+8NZkNs1iXhCQ7ZUTKAGq1LIvfdinTrxnBQNOSTHTNzVVTNgu5jzaf1OAPDjT9R7ZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QSS1JXxt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QSS1JXxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764948926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wpx2CAYiYtwE+/mqUJcB+JG06KTcOu9H5A9JbCTrvag=;
	b=QSS1JXxtk/5GSSL/DnellQ/kp4yMdhbI3m+NKNjC3IaEc8NNklF5J9O+Nevs3GQKD73ekz
	r2x6tS9707K/9/SoUvgSWcNZcsB6jtbXi2OAcJGOBnsxX33deOVBbzOlTD50+TaXckLrG2
	AaW+Q9Jni3a48rqWETFlOJmSZJkTVEw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-gzQ3TorZP_y_jxKgG-Y5Wg-1; Fri,
 05 Dec 2025 10:35:23 -0500
X-MC-Unique: gzQ3TorZP_y_jxKgG-Y5Wg-1
X-Mimecast-MFC-AGG-ID: gzQ3TorZP_y_jxKgG-Y5Wg_1764948921
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B6ABE1956051;
	Fri,  5 Dec 2025 15:35:20 +0000 (UTC)
Received: from fedora (unknown [10.45.226.96])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A5E293011A84;
	Fri,  5 Dec 2025 15:35:14 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  5 Dec 2025 16:35:20 +0100 (CET)
Date: Fri, 5 Dec 2025 16:35:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Brauner <christian@brauner.io>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() +
 questions
Message-ID: <aTL7sWxxYcxDmxj1@redhat.com>
References: <aTLnV-5jlgfk1aRK@redhat.com>
 <aTLp73haymcs1fkX@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTLp73haymcs1fkX@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 12/05, Alice Ryhl wrote:
>
> On Fri, Dec 05, 2025 at 03:08:23PM +0100, Oleg Nesterov wrote:
> > From rust/kernel/task.rs:
> >
> >     pub fn group_leader(&self) -> &Task {
> >         // SAFETY: The group leader of a task never changes after initialization, so reading this
> >         // field is not a data race.
> >         let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> >
> >         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
> >         // and given that a task has a reference to its group leader, we know it must be valid for
> >         // the lifetime of the returned task reference.
> >         unsafe { &*ptr.cast() }
> >     }
> >
> >     /// Returns the PID of the given task.
> >     pub fn pid(&self) -> Pid {
> >         // SAFETY: The pid of a task never changes after initialization, so reading this field is
> >         // not a data race.
> >         unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> >     }
> >
> > The comments look wrong. Unless same_thread_group(current, task) == T, task->group_leader
> > and/or task->pid can change if a non-leader task's sub-thread execs. This also means that
> > in general it is not safe to dereference group_leader, for example this C code is not safe:
> >
> > 	rcu_read_lock();
> > 	task = find_task_by_vpid(vpid);
> > 	if (task)
> > 		get_task_struct(task);
> > 	rcu_read_unlock();
> >
> > 	if (task)
> > 		pid = task->group_leader->pid; // BUG! ->group_leader can be already freed
> >
> >
> > Now the questions. Sorry! I don't know rust.
> >
> > 1. Can I simply remove these misleading comments? Or SAFETY comment is mandatory?
>
> If the safety comments are wrong, then the code is probably wrong too!
>
> What is the correct way to read the pid or group_leader fields of a
> struct task_struct?

Alice, let me repeat I don't know rust ;) So I'll try to answer in "C".

As long as "struct task_struct *task" pointer is stable and can't go away,
it is always safe to _read_ task->pid or even task->group_leader (but see below).

However, task->pid is not "const" in general, so "The pid of a task never changes ..."
doesn't look right. See exchange_tids() which swaps left->pid/right->pid.

So this C code

	pid1 = READ_ONCE(task->pid);
	...
	pid2 = READ_ONCE(task->pid);
	...
	BUG_ON(pid1 != pid2);

is only correct if same_thread(current, task) == T. Or tasklist_lock is held,
or another lock (say, cred_guard_mutex) which blocks de_thread().

Same for ->group_leader, it is not stable in general. Plus, unlike ->pid it
can go away if we race with mt-exec or this task exits. So, just for example,
in theory

	char c = task->group_leader->comm[0];

is only safe if same_thread(current, task) == T, or tasklist_lock is held,
or it is called under rcu_read_lock() and pid_alive(task) == T. This makes
me think that the "The lifetime of the returned task reference is tied to
the lifetime of `self`" comment is not right too.

See for example commit a15f37a40145c ("kernel/sys.c: fix the racy usage of
task_lock(tsk->group_leader) in sys_prlimit64() paths")

However, according to "git grep -E '\bgroup_leader\('" the only user of
group_leader(task) is drivers/android/binder/process.rs, and task is always
"current", so I think the current usage of group_leader() is fine.

> > 2. I am working on the patch(es) which move ->group_leader from task_struct to
> >    signal_struct, so the 1st change adds the new trivial helper in preparation:
> >
> > 	struct task_struct *task_group_leader(struct task_struct *task)
> > 	{
> > 		return task->group_leader; // will be updated
> > 	}
> >
> >    Now, how can I change group_leader() to use it? I guess I need to add
> >
> > 	struct task_struct *rust_helper_task_group_leader(struct task_struct *task)
> > 	{
> > 		return task_group_leader(task);
> > 	}
> >
> >    into rust/helpers/task.c, but will something like
> >
> > 	pub fn group_leader(&self) -> &Task {
> > 		unsafe { bindings::task_group_leader(self.as_ptr()) }
> > 	}
> >
> >     work? I'm afraid it won't ;)
>
> That looks like it should work. The rust_helper_ function is only
> required if task_group_leader is marked `static inline`. Otherwise
> bindings:: will pick up the function straight from the C header. (As
> long as the relevant header is included in bindings_helper.h)

Thanks Alice! (yes, I see your next email ;)

Oleg.

