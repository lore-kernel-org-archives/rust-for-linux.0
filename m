Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340B8F7D
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196317; cv=none; b=tbSvRjUdcznJCZL8GGhrjz7CQAqv88TFtuJCh3WgECVi6MiQXS8kfGdbzLdYHUCKy5Wb8oGQMiOlGmNRDfio62LR71E9ZcMd3hUXm4UBnISM/+lTQbWsEGu/CkVwnAFmSYl2kcmMbEXfiUBVdrfYJMAi3le1Na6b5DfzuIJC2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196317; c=relaxed/simple;
	bh=JiwbXDKYiPUiAUBJLTFuvB0IZ5YQZJ1PescOhquM91U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NedWzYyPiZ9D5jWeonNuTQsSjn+M1pRt+dXdjIrKJHzJVWBngprc7hFKwQdRGPNIdj8dAcoiavj4I01f+o9TP8tOFyAd6B3re9gNwzVcGWF5MP7crdq9Gd+8/gTKIHIEjlZIhpqDBBwAC/F5CNxILY9RrqQQrPV6taCL52syWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 4 Feb 2026 18:11:47 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.55)
	by 156.147.1.121 with ESMTP; 4 Feb 2026 18:11:47 +0900
X-Original-SENDERIP: 10.159.44.55
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: gary@garyguo.net,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
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
Subject: Re: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for freeze operation
Date: Wed,  4 Feb 2026 18:11:47 +0900
Message-Id: <20260204091147.32511-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DG5CFX3ML5YL.2FE913F20LNPT@garyguo.net>
References: <DG5CFX3ML5YL.2FE913F20LNPT@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue Feb 3, 2026 at 12:59:45PM +0000, Gary Guo wrote:
> On Tue Feb 3, 2026 at 6:59 AM GMT, jongan.kim wrote:
> > From: HeeSu Kim <heesu0025.kim@lge.com>
> >
> > Port PID namespace conversion logic from C binder to the Rust
> > implementation.
> >
> > Without namespace conversion, freeze operations from non-init namespaces
> > can match wrong processes due to PID collision. This adds proper
> > conversion to ensure freeze operations target the correct process.
> >
> > Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> > ---
> > v2 -> v3:
> > - Use task::Pid typedef instead of u32/i32
> > - Use PidNamespace::init_ns() instead of init_pid_ns()
> > - Compare PidNamespace directly with == instead of raw pointers
> > - Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
> > - Fix rustfmt import ordering (rcu before Arc)
> > - Rename TaskPid alias to PidT for clearer pid_t type indication
> > - Use task.group_leader().pid() instead of tgid_nr_ns() for consistency with C
> >
> >  drivers/android/binder/process.rs | 37 +++++++++++++++++++++++++++----
> >  1 file changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > index 132055b4790f..ea30bfac2e0b 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -22,6 +22,8 @@
> >      id_pool::IdPool,
> >      list::{List, ListArc, ListArcField, ListLinks},
> >      mm,
> > +    pid::Pid,
> > +    pid_namespace::PidNamespace,
> >      prelude::*,
> >      rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
> >      seq_file::SeqFile,
> > @@ -29,9 +31,9 @@
> >      sync::poll::PollTable,
> >      sync::{
> >          lock::{spinlock::SpinLockBackend, Guard},
> > -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
> > +        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
> >      },
> > -    task::Task,
> > +    task::{Pid as PidT, Task},
> >      types::ARef,
> >      uaccess::{UserSlice, UserSliceReader},
> >      uapi,
> > @@ -1498,17 +1500,42 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
> >      }
> >  }
> > 
> > +/// Convert a PID from the current namespace to the global (init) namespace.
> > +fn convert_to_init_ns_tgid(pid: PidT) -> Result<PidT> {
> > +    let current = kernel::current!();
> > +    let init_ns = PidNamespace::init_ns();
> > +
> > +    if current.active_pid_ns() == Some(init_ns) {
> > +        // Already in init namespace.
> > +        return Ok(pid);
> > +    }
> > +
> > +    if pid == 0 {
> > +        return Err(EINVAL);
> > +    }
> > +
> > +    let rcu_guard = rcu::read_lock();
> > +
> > +    let pid_struct = Pid::find_vpid(pid, &rcu_guard).ok_or(ESRCH)?;
> > +    let task = pid_struct.pid_task(&rcu_guard).ok_or(ESRCH)?;
> > +
> > +    Ok(task.group_leader().pid())
> > +}
> > +
> >  fn get_frozen_status(data: UserSlice) -> Result {
> >      let (mut reader, mut writer) = data.reader_writer();
> > 
> >      let mut info = reader.read::<BinderFrozenStatusInfo>()?;
> > +
> > +    let init_ns_pid = convert_to_init_ns_tgid(info.pid as PidT)?;
> > +
> >      info.sync_recv = 0;
> >      info.async_recv = 0;
> >      let mut found = false;
> > 
> >      for ctx in crate::context::get_all_contexts()? {
> >          ctx.for_each_proc(|proc| {
> > -            if proc.task.pid() == info.pid as _ {
> > +            if proc.task.pid() == init_ns_pid as _ {
> >                  found = true;
> >                  let inner = proc.inner.lock();
> >                  let txns_pending = inner.txns_pending_locked();
> > @@ -1530,13 +1557,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
> >  fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
> >      let info = reader.read::<BinderFreezeInfo>()?;
> > 
> > +    let init_ns_pid = convert_to_init_ns_tgid(info.pid as PidT)?;
> > +
> >      // Very unlikely for there to be more than 3, since a process normally uses at most binder and
> >      // hwbinder.
> >      let mut procs = KVec::with_capacity(3, GFP_KERNEL)?;
> > 
> >      let ctxs = crate::context::get_all_contexts()?;
> >      for ctx in ctxs {
> > -        for proc in ctx.get_procs_with_pid(info.pid as i32)? {
> > +        for proc in ctx.get_procs_with_pid(init_ns_pid)? {
> 
> I think this function already has `ARef<Task>` for all the process, so it feels
> to me that the search should be simply based on task, rather than PID.
> 
> I.e. instead of pid_t -> struct pid -> struct tasks -> pid_t and then search
> with it, we first get `Task` from VPID, and then search directly with it. This
> would also make it no longer necessary to have the init namespace check.
> 
> (BTW, the current impl looks quite inefficient, get_procs_with_pid returns a vec
> which is pushed again to a vec, perhaps using a callback or simply passing in a
> `&mut Vec` is better?)
> 
> Best,
> Gary
> 
> >              procs.push(proc, GFP_KERNEL)?;
> >          }
> >      }

Thank you for the suggestions for more efficient structure.

Your proposal to use task-based search instead of PID-based search
could simplify the logic.

However, I have a few considerations:
1. The current implementation maintains consistency with the existing
C binder implementation. Any structural change here would ideally be
reflected in the  C code as well to keep both implementations aligned.

2. Since the majority of binder usage occurs in the init namespace, the
current early return (checking task_is_in_init_pid_ns) avoids the overhead
of find_vpid() and pid_task() calls in the common case. If we always go
through the task lookup path, this optimization would be lost.

3. Regarding the search mechanism and vec efficiency improvements you
mentioned, these seem like valuable optimizations but would represent
a broader architectural change to the binder driver.

I'd like to get input from the binder driver maintainers on whether:
- This kind of structural change is desired for the binder driver
- If so, whether it should be done as part of this PID namespace fix or
as a separate refactoring effort
- Whether both C and Rust implementations should be updated together

Alice, could you please advise on the preferred approach here?

Thanks,
JongAn Kim

