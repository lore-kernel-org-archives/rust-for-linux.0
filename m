Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA133BBC5
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764952136; cv=none; b=cHIo57ZiCV9OVTcCXfNM9upZXVZCXaf2QgDFlFP58IGjHTCBXc3ZgVuq04XYt3sCJP1dzkkhgU5i7WAr7eGZuAe0UYHLcugSdwmgc41Xf3cxw1ZDrdsMxLMoo+bDgK+KgWywCh8Ik8ZS5gD8A93o4/nEtdPpoSoLN/ohIn24t6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764952136; c=relaxed/simple;
	bh=bA8Wg1NnfuQ4K7sCDBZTVZSg87qIiMRAP6zx8mYLkqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=thRmpHZFd/+Xv12CnlsEabvJAd0lbqfRu+BtSKZSa8B59ldDb4rffWOQ5u97Bm1TPc3ertEGSqy6joWKrhQ28Y1LItilpnBTmGw9JhCIzk3IVdiUM87MWekUKkD94azQDcuR3lawx/HQ5pnTCbMGb1GSmE3gyM1AlBqqLJkZT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDaW5Ly+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDaW5Ly+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47921784b97so15605255e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764952116; x=1765556916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=et3jtw4QMtxb80w/l+qP9Dd8T2MEkcYZwKi7peXdZEU=;
        b=hDaW5Ly+SfKmbCzILDxABtJVGr82/u7SZysR2BQ+4M2VyPzv7D3XxFA7LHRRViFxXD
         /teOhOIKj7n/kBW1pbSgSAfC981SEZE/4yHaQoJpfhhNTMIAZmdvyGjnJfe+K68ii3IV
         CEE0WqWI+mDSp8FoXGMKSaYpAyLl0sl/tlZs6pfBQRqIc4HUE0n4fHAbc7oF7/pP4+eY
         1Nocy/tSmy5e9+oF4g7eCjO1Q5uUzdkir6kSExWJvZ6+Zm3XMPHYQvG/7k/gs3HDIkHC
         HCwW35Zdi3hVENwhs8S8N4HXykw+fFMSnTrRNZng0Hkx6xr2hkGcFjWU/LM9Tyh55lWJ
         B9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952116; x=1765556916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=et3jtw4QMtxb80w/l+qP9Dd8T2MEkcYZwKi7peXdZEU=;
        b=N4bEAczWoHTvWI2pSj7esoUNlJ5kPanu2Vf//Vqz13CtJexbZ5wl3fpEK1XVNjcGnR
         tNZw5yyQKpCXoMopdCgLlVb9tr+CkrjQu58NhX6zxo2DOtOeYmNFgU7coVuKeww2xtBy
         q1M02vImhgA3EKvjXWVXTZkKkI5MESweAVTVJa7G/mWV5g4uxxMgO+f2NMWIV27ZEkUo
         m0Ih+iWyfkVcLSyrMwPw/42ntkuPDQY9QkQu31Ioeu0eHhxm0tpf5XWDNUlDABcRnWfP
         9UVfSgRUcpRGSoWenYQmrVa/bOC1yR1I1GJ/wpxvv5DZKrpY8NQ+0RJyNtgbTPjZjGvc
         0D2w==
X-Forwarded-Encrypted: i=1; AJvYcCUXnDSLs8T+SndtPCn7PfvqnZHgpjfKdUpRbEMDfh6j34zd6q0Hbq0zv+E/MuRcd7X+uATzoL3VUTImGYprKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYklNdo8V+3FWrE5qHVAKSkcjX3EX6+yObPkP8ck1GrDriEhXO
	akb0IAWxZOKcm3rZBATmhcqZJLLkPQp+BIFlHYr3OT13Evw6PK3pRQ7puwKenEbzquUKl/wWM5a
	/WF4DsZwHHBeCFMGjZg==
X-Google-Smtp-Source: AGHT+IEwvSWoqVsN1jXmqo6U+0UHRo5QoRn1v2rhVmgeMkBYJovRpF8OS5sLohbUQv+y1iXkET55hufA0OaizXE=
X-Received: from wmdd27.prod.google.com ([2002:a05:600c:a21b:b0:477:9dee:b5d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ece:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4792af1b981mr102489945e9.22.1764952116372;
 Fri, 05 Dec 2025 08:28:36 -0800 (PST)
Date: Fri, 5 Dec 2025 16:28:35 +0000
In-Reply-To: <aTL7sWxxYcxDmxj1@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com> <aTLp73haymcs1fkX@google.com> <aTL7sWxxYcxDmxj1@redhat.com>
Message-ID: <aTMIMxl-VRhcHRR3@google.com>
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

On Fri, Dec 05, 2025 at 04:35:13PM +0100, Oleg Nesterov wrote:
> On 12/05, Alice Ryhl wrote:
> >
> > On Fri, Dec 05, 2025 at 03:08:23PM +0100, Oleg Nesterov wrote:
> > > From rust/kernel/task.rs:
> > >
> > >     pub fn group_leader(&self) -> &Task {
> > >         // SAFETY: The group leader of a task never changes after initialization, so reading this
> > >         // field is not a data race.
> > >         let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> > >
> > >         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
> > >         // and given that a task has a reference to its group leader, we know it must be valid for
> > >         // the lifetime of the returned task reference.
> > >         unsafe { &*ptr.cast() }
> > >     }
> > >
> > >     /// Returns the PID of the given task.
> > >     pub fn pid(&self) -> Pid {
> > >         // SAFETY: The pid of a task never changes after initialization, so reading this field is
> > >         // not a data race.
> > >         unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> > >     }
> > >
> > > The comments look wrong. Unless same_thread_group(current, task) == T, task->group_leader
> > > and/or task->pid can change if a non-leader task's sub-thread execs. This also means that
> > > in general it is not safe to dereference group_leader, for example this C code is not safe:
> > >
> > > 	rcu_read_lock();
> > > 	task = find_task_by_vpid(vpid);
> > > 	if (task)
> > > 		get_task_struct(task);
> > > 	rcu_read_unlock();
> > >
> > > 	if (task)
> > > 		pid = task->group_leader->pid; // BUG! ->group_leader can be already freed
> > >
> > >
> > > Now the questions. Sorry! I don't know rust.
> > >
> > > 1. Can I simply remove these misleading comments? Or SAFETY comment is mandatory?
> >
> > If the safety comments are wrong, then the code is probably wrong too!
> >
> > What is the correct way to read the pid or group_leader fields of a
> > struct task_struct?
> 
> Alice, let me repeat I don't know rust ;) So I'll try to answer in "C".

That's perfect :)

> As long as "struct task_struct *task" pointer is stable and can't go away,
> it is always safe to _read_ task->pid or even task->group_leader (but see below).

Right. But if it might change in parallel with our read, then we should
ideally use READ_ONCE() or rcu_dereference() or an atomic load or
similar.

With regards to "as long as pointer is stable", you may assume that any
time you see a &T or &mut T, then the ampersand means a reference, which
is always stable. Pointers that may be dangling have to be raw pointers,
which use *mut T/*const T syntax.

> However, task->pid is not "const" in general, so "The pid of a task never changes ..."
> doesn't look right. See exchange_tids() which swaps left->pid/right->pid.
> 
> So this C code
> 
> 	pid1 = READ_ONCE(task->pid);
> 	...
> 	pid2 = READ_ONCE(task->pid);
> 	...
> 	BUG_ON(pid1 != pid2);
> 
> is only correct if same_thread(current, task) == T. Or tasklist_lock is held,
> or another lock (say, cred_guard_mutex) which blocks de_thread().

Ok, then we should probably adjust the Rust Task::pid() method to use
READ_ONCE() to read the pid. And adjust the safety comment to match.

> Same for ->group_leader, it is not stable in general. Plus, unlike ->pid it
> can go away if we race with mt-exec or this task exits. So, just for example,
> in theory
> 
> 	char c = task->group_leader->comm[0];
> 
> is only safe if same_thread(current, task) == T, or tasklist_lock is held,
> or it is called under rcu_read_lock() and pid_alive(task) == T. This makes
> me think that the "The lifetime of the returned task reference is tied to
> the lifetime of `self`" comment is not right too.

Yeah, the current code encodes the lifetime constraint that the task
always outlives its group leader. So for example this compiles:

	let leader = task.group_leader();
	do_stuff(leader); // ok

but this will fail to compile:

	let leader = task.group_leader();
	drop(task); // put refcount on task
	do_stuff(leader); // ERROR task is no longer valid

because Rust can see that `leader` is used in a context where using
`task` would be illegal.

But it sounds like the above is not sufficient, and that we have
situation where incorrect code would compile.

> See for example commit a15f37a40145c ("kernel/sys.c: fix the racy usage of
> task_lock(tsk->group_leader) in sys_prlimit64() paths")
> 
> However, according to "git grep -E '\bgroup_leader\('" the only user of
> group_leader(task) is drivers/android/binder/process.rs, and task is always
> "current", so I think the current usage of group_leader() is fine.

Yes, the current usage seems fine. However, one of the main goals behind
API design in Rust is to ensure that no matter how stupid the code that
uses it is, if the final code is safe, then it should not lead to UAF or
other memory unsafety.

In this case, we can fix the design by moving `Task::group_leader()` to
the `impl CurrentTask {}` block. That way, calling group_leader() on a
task will only compile if it's called on the current task.

We could also move Task::pid() to the `impl CurrentTask` block to avoid
the READ_ONCE(). Or we could add pid() in both places, in which case
task.pid() would use READ_ONCE() only when the &Task is not derived from
current.

Alice
