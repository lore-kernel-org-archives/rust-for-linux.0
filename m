Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87239A7F7
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195930; cv=none; b=up8Q3MVi7hZn1vsYQfd4sgxWDHAxW8E4l1RmCGAf+Ll6r9Kk7pW4eS0XmXsvxIzSfxWMHz1HDiKFwIpBy1M/SGvzzB4Ue5hlv9VvRuItOxasJT0CU5FRFDzRiNGD1sT7iW2vcQVISBVfDaL8C00PLB1XZMECZENN3ANSROi1J4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195930; c=relaxed/simple;
	bh=dfyHQqeYTF3hggpF4tLSKGTsDNcuH8jFhfUG5HvePxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KpKE/I4DPRH48/DCwEtFOUFexq8YYFmgt8KyipNLNVVlBBF2FOMZur/HrehlKATnbj9Ld398azbbS9S5N0NZjDCdSqMymRRjVORlhhSyFGQOJR6uIx7A3KebKI4xFPwTWOsXW4ov72Co/N2EzagTbEDZZmOc/ogcpMXXcXEO12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 4 Feb 2026 18:05:21 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.55)
	by 156.147.1.125 with ESMTP; 4 Feb 2026 18:05:21 +0900
X-Original-SENDERIP: 10.159.44.55
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
Date: Wed,  4 Feb 2026 18:05:21 +0900
Message-Id: <20260204090521.32136-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYJc42j9bwgZyCFD@yury>
References: <aYJc42j9bwgZyCFD@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 03, 2026 at 03:38:59PM -0500, Yury Norov wrote:
> On Tue, Feb 03, 2026 at 03:59:26PM +0900, jongan.kim@lge.com wrote:
> > From: JongAn Kim <jongan.kim@lge.com>
> >
> > Currently, when a freeze is attempted from a non-init PID namespace,
> > there is a possibility that the wrong process in the init namespace
> > may be frozen due to PID collision across namespaces.
> >
> > For example, if a container with PID namespace has a process with
> > PID 100 (which maps to PID 5000 in init namespace), attempting to
> > freeze PID 100 from the container could incorrectly match a different
> > process with PID 100 in the init namespace.
> >
> > This patch fixes the issue by:
> > 1. Converting the caller's PID from their namespace to init namespace
> > 2. Matching against binder_proc->pid (which stores init namespace TGID)
> > 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> >
> > This change ensures correct PID handling when binder freeze occurs in
> > non-init PID namespace.
> >
> > Signed-off-by: JongAn Kim <jongan.kim@lge.com>
> > ---
> > v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()
> >
> >  drivers/android/binder.c | 53 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 50 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 535fc881c8da..4c4366089ecb 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -5609,6 +5609,41 @@ static bool binder_txns_pending_ilocked(struct binder_proc *proc)
> >        return false;
> >  }
> > 
> > +/**
> > + * binder_convert_to_init_ns_tgid() - Convert pid to global pid(init namespace)
> 
> For global PIDs we've got task_pid_nr(), see include/linux/pid.h:
> 
>  /*
>   * the helpers to get the task's different pids as they are seen
>   * from various namespaces
>   *
>   * task_xid_nr()     : global id, i.e. the id seen from the init namespace;
>   * task_xid_vnr()    : virtual id, i.e. the id seen from the pid namespace of
>   *                     current.
>   * task_xid_nr_ns()  : id seen from the ns specified;
>   *
>   * see also pid_nr() etc in include/linux/pid.h
>   */
> 
> I think task_tgid_nr(current) would work for you. Or I misunderstand
> something?
> 
> If your "binder_convert" returns something not covered by one from
> the above, please put your function in include/linux/pid.h and give
> it a proper name.

Thank you for the suggestion. However, task_tgid_nr(current) returns the TGID 
of the *current* process, not the target process we want to freeze.

What we need is to convert a TGID from the caller's PID namespace to the 
corresponding TGID in the init namespace for a *different* process (the one 
being frozen). The flow is:

1. User space passes a TGID in their own namespace
2. We find the task_struct for that TGID via find_vpid()
3. We return task->tgid, which is always in init namespace

This differs from the existing task_xid_nr() family because we're converting
a PID from one namespace (caller's) to init namespace for a different task.

> > + * @pid:    pid from user space
> > + *
> > + * Converts a process ID (TGID) from the caller's PID namespace to the
> > + * corresponding TGID in the init namespace.
> 
> Process ID (PID) is not the same as TGID, but you use the names
> interchangeably. This is very confusing. Can you reword?

Binder driver handles TGID for bind freeze operation.
To avoid confusion, I will unify the variable names and terminology to use
"TGID" consistently.

> > + * Return: On success, returns TGID in init namespace (positive value).
> > + *         On error, returns -EINVAL if pid <= 0, or -ESRCH if process
> > + *         not found or not visible in init namespace.
> > + */
> > +static int binder_convert_to_init_ns_tgid(u32 pid)
> 
> This should use pid_t.

Ok. I will change to use pid_t for next patch.
 
> > +{
> > +     struct task_struct *task;
> > +     int init_ns_pid = 0;
> > +
> > +     /* already in init namespace */
> > +     if (task_is_in_init_pid_ns(current))
> > +             return pid;
> > +
> > +     if (pid == 0)
> > +             return -EINVAL;
> 
> Can you comment what is wrong with pid == 0?

Since find_vpid() always returns NULL when the input value is 0, it returns
an EINVAL error before calling rcu_read_lock().

> > +     rcu_read_lock();
> > +     task = pid_task(find_vpid(pid), PIDTYPE_PID);
> > +     if (task)
> > +             init_ns_pid = task->tgid;
> 
> So I've been replying with the same suggestion to v2, but you did it
> in this v3 yourself.
> 
> > +     rcu_read_unlock();
> > +
> > +     if (!init_ns_pid)
> > +             return -ESRCH;
> 
> You can assign init_ns_pid to -ESRCH at declaration and drop this chunk.
>
> > +
> > +     return init_ns_pid;
> > +}
> 
> Thanks,
> Yury

Thanks for suggestion. I will apply it (init_ns_pid = -ESRCH) in the next
patch. 

Thanks,
JongAn Kim.
