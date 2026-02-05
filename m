Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CC21FF33
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770269458; cv=none; b=oiCuK/NfpkirqVdL4p/OeJUQ5qFijx+NTAN2r3SZGDO4BFiSIxzf4whc8TecwRmQH+bd94wb5hQWQgUWbGhvmOeyALKIhZpRVGqVHaeseiDy27Pto2tzxMAs/21G71wnDunRGgg5gm35Rsn2hTgj1RVrAub5GkQ1TitpQpG1iMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770269458; c=relaxed/simple;
	bh=oe6A5r55xoooQKGwF3nMnh4RMhHO8HoYGCesTF3O7Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=po52UNn3iNFnC3QYeeRUBXaHo+VS9PYotuam0BwsDrwqkomgmjW9JknsJRlyeIrY5P2Lush28FZ7lu9lAoeDqNV95w3aS/J9YLG2LAdeN5BIblx37JfhPjQdxa9b1Pi6hQ55hh8nNnrAO7fKJihpneHjBlkzLPxEadsjQV3jjeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 5 Feb 2026 14:30:55 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.110)
	by 156.147.1.121 with ESMTP; 5 Feb 2026 14:30:55 +0900
X-Original-SENDERIP: 10.159.44.110
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: ynorov@nvidia.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com
Subject: Re: [PATCH v3 1/3] binder: handle PID namespace conversion for freeze operation
Date: Thu,  5 Feb 2026 14:30:54 +0900
Message-Id: <20260205053054.19465-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYN8EeZKIw4_QHRa@yury>
References: <aYN8EeZKIw4_QHRa@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Feb 04, 2026 at 12:04:17PM -0500, Yury Norov wrote:
> On Wed, Feb 04, 2026 at 06:05:21PM +0900, jongan.kim@lge.com wrote:
> > On Tue, Feb 03, 2026 at 03:38:59PM -0500, Yury Norov wrote:
> > > On Tue, Feb 03, 2026 at 03:59:26PM +0900, jongan.kim@lge.com wrote:
> > > > From: JongAn Kim <jongan.kim@lge.com>
> > > >
> > > > Currently, when a freeze is attempted from a non-init PID namespace,
> > > > there is a possibility that the wrong process in the init namespace
> > > > may be frozen due to PID collision across namespaces.
> > > >
> > > > For example, if a container with PID namespace has a process with
> > > > PID 100 (which maps to PID 5000 in init namespace), attempting to
> > > > freeze PID 100 from the container could incorrectly match a different
> > > > process with PID 100 in the init namespace.
> > > >
> > > > This patch fixes the issue by:
> > > > 1. Converting the caller's PID from their namespace to init namespace
> > > > 2. Matching against binder_proc->pid (which stores init namespace TGID)
> > > > 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> > > >
> > > > This change ensures correct PID handling when binder freeze occurs in
> > > > non-init PID namespace.
> > > >
> > > > Signed-off-by: JongAn Kim <jongan.kim@lge.com>
> > > > ---
> > > > v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()
> > > >
> > > >  drivers/android/binder.c | 53 +++++++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 50 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > > index 535fc881c8da..4c4366089ecb 100644
> > > > --- a/drivers/android/binder.c
> > > > +++ b/drivers/android/binder.c
> > > > @@ -5609,6 +5609,41 @@ static bool binder_txns_pending_ilocked(struct binder_proc *proc)
> > > >        return false;
> > > >  }
> > > >
> > > > +/**
> > > > + * binder_convert_to_init_ns_tgid() - Convert pid to global pid(init namespace)
> > >
> > > For global PIDs we've got task_pid_nr(), see include/linux/pid.h:
> > >
> > >  /*
> > >   * the helpers to get the task's different pids as they are seen
> > >   * from various namespaces
> > >   *
> > >   * task_xid_nr()     : global id, i.e. the id seen from the init namespace;
> > >   * task_xid_vnr()    : virtual id, i.e. the id seen from the pid namespace of
> > >   *                     current.
> > >   * task_xid_nr_ns()  : id seen from the ns specified;
> > >   *
> > >   * see also pid_nr() etc in include/linux/pid.h
> > >   */
> > >
> > > I think task_tgid_nr(current) would work for you. Or I misunderstand
> > > something?
> > >
> > > If your "binder_convert" returns something not covered by one from
> > > the above, please put your function in include/linux/pid.h and give
> > > it a proper name.
> >
> > Thank you for the suggestion. However, task_tgid_nr(current) returns the TGID
> > of the *current* process, not the target process we want to freeze.
> >
> > What we need is to convert a TGID from the caller's PID namespace to the
> > corresponding TGID in the init namespace for a *different* process (the one
> > being frozen). The flow is:
> >
> > 1. User space passes a TGID in their own namespace
> > 2. We find the task_struct for that TGID via find_vpid()
> > 3. We return task->tgid, which is always in init namespace
> >
> > This differs from the existing task_xid_nr() family because we're converting
> > a PID from one namespace (caller's) to init namespace for a different task.
> 
> OK, I think I see now. Thanks for the explanation. Maybe add it in commit
> message?
> 
> > > > + * @pid:    pid from user space
> > > > + *
> > > > + * Converts a process ID (TGID) from the caller's PID namespace to the
> > > > + * corresponding TGID in the init namespace.
> > >
> > > Process ID (PID) is not the same as TGID, but you use the names
> > > interchangeably. This is very confusing. Can you reword?
> >
> > Binder driver handles TGID for bind freeze operation.
> > To avoid confusion, I will unify the variable names and terminology to use
> > "TGID" consistently.
> >
> > > > + * Return: On success, returns TGID in init namespace (positive value).
> > > > + *         On error, returns -EINVAL if pid <= 0, or -ESRCH if process
> > > > + *         not found or not visible in init namespace.
> > > > + */
> > > > +static int binder_convert_to_init_ns_tgid(u32 pid)
> > >
> > > This should use pid_t.
> >
> > Ok. I will change to use pid_t for next patch.
> > 
> > > > +{
> > > > +     struct task_struct *task;
> > > > +     int init_ns_pid = 0;
> > > > +
> > > > +     /* already in init namespace */
> > > > +     if (task_is_in_init_pid_ns(current))
> > > > +             return pid;
> > > > +
> > > > +     if (pid == 0)
> > > > +             return -EINVAL;
> > >
> > > Can you comment what is wrong with pid == 0?
> >
> > Since find_vpid() always returns NULL when the input value is 0, it returns
> > an EINVAL error before calling rcu_read_lock().
> 
> OK, so it's a performance trick. Can you discuss performance impact
> then? I just wonder how often this function is called with the pid
> of idle task?  If no performance impact, maybe it's worth to keep
> code simpler?
> 
> This also adds inconsistency: if you're running on behalf of root ns,
> you return 0 if pid == 0, otherwise you return an error. That's weird
> because idle is 0 for any namespace. If it's intended, can you explicitly
> mention it?
> 
> If you still want to bail out early for pid == 0, maybe:
>  
>              if (pid == 0 || task_is_in_init_pid_ns(current))
>                      return pid;

You're right about the inconsistency. This function is not called frequently,
and I agree with your opinion.(make simple)

However, I've received feedback from the binder maintainer(Alice) suggesting
a different approach: instead of converting TGIDs, we should use the 
task_struct pointer directly for comparison.
https://lore.kernel.org/lkml/20260205050128.17532-1-jongan.kim@lge.com/
I'm planning to update the patch to implement this approach for both the C
and Rust code.

This means the current TGID conversion function will likely not be used in the
final implementation. Nevertheless, I really appreciate your detailed review
and valuable suggestions.

Thank you again for your time and thorough review.
Jong An, Kim.

> > > > +     rcu_read_lock();
> > > > +     task = pid_task(find_vpid(pid), PIDTYPE_PID);
> > > > +     if (task)
> > > > +             init_ns_pid = task->tgid;
> > >
> > > So I've been replying with the same suggestion to v2, but you did it
> > > in this v3 yourself.
> > >
> > > > +     rcu_read_unlock();
> > > > +
> > > > +     if (!init_ns_pid)
> > > > +             return -ESRCH;
> > >
> > > You can assign init_ns_pid to -ESRCH at declaration and drop this chunk.
> > >
> > > > +
> > > > +     return init_ns_pid;
> > > > +}
> > >
> > > Thanks,
> > > Yury
> >
> > Thanks for suggestion. I will apply it (init_ns_pid = -ESRCH) in the next
> > patch.
> >
> > Thanks,
> > JongAn Kim.
