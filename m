Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C92E7BCC
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770614509; cv=none; b=p4jKnX4TJfKxsEh+FoOcrGZyGNUnbVi1rXXiMb6AqS0qHGUbdAm7Hd9x/LnF9ykQHocGA/YRuURCsL61hjz9z0N4uH0OWfpOAwUdAvzS2EswqTbZrga989A76tfe94YnGbns3THa68I7HmtKXC9h3IA2isDDMyF8i+wm4vIkDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770614509; c=relaxed/simple;
	bh=M4bS9bJ+t2Kd8oxOOt4QyPpqBammtmwYNdYe4kJTcbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nMUt5C846eTZx07Flj++wb1CRwgH0KsQ+oH2bKXteL9YRwo99TygO/bP4ert57tMba+8wgSb2C0cQu+Zug/+6ariXscl48YvEB5fiNGiW9oFDJcpihlFNyImHMs7UbF1l673/mImMAxepIYJJ5RfyNnEZzaQlbxyd9UZD4DlbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 9 Feb 2026 14:21:40 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: heesu0025.kim@lge.com
Received: from unknown (HELO heesu0025-kim-aosp-rust-binder.beeworker.bee-live.svc.cluster.local) (10.159.44.90)
	by 156.147.1.127 with ESMTP; 9 Feb 2026 14:21:40 +0900
X-Original-SENDERIP: 10.159.44.90
X-Original-MAILFROM: heesu0025.kim@lge.com
From: heesu0025.kim@lge.com
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
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
Subject: Re: [PATCH v4 3/3] rust_binder: fix PID namespace collision for freeze operation
Date: Mon,  9 Feb 2026 14:21:39 +0900
Message-Id: <20260209052139.7460-1-heesu0025.kim@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DG80KWRTCM3Z.3PYV9P6Y5414F@garyguo.net>
References: <DG80KWRTCM3Z.3PYV9P6Y5414F@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Gary,

Thank you for the review and suggestion.

On Fri, Feb 7, 2026 at 4:20 PM GMT, Gary Guo wrote:
> On Fri Feb 6, 2026 at 8:53 AM GMT, jongan.kim wrote:
> > From: HeeSu Kim <heesu0025.kim@lge.com>
> >
> > Port PID namespace conversion logic from C binder to the Rust
> > implementation.
> >
> > Without namespace conversion, freeze operations from non-init namespaces
> > can match wrong processes due to PID collision. This adds proper
> > conversion to ensure freeze operations target the correct process.
> >
> > This patch fixes the issue by:
> > - Add get_task_from_vpid() to translate VPID to Task reference
> > - Add Context::get_procs_with_task() for Task-based process lookup
> >   using &mut KVec parameter to avoid intermediate allocations
> > - Update get_frozen_status() and ioctl_freeze() to use Task comparison
> >
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Link: https://lore.kernel.org/rust-for-linux/DG5CFX3ML5YL.2FE913F20LNPT@garyguo.net/
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://lore.kernel.org/lkml/aXs5Y3xAFKyZr6nd@google.com/
> > Signed-off-by: Heesu Kim <heesu0025.kim@lge.com>
> > ---
> > v3 -> v4
> > - change subject name more clearly
> > - Use Task pointer comparison instead of PID number comparison
> > - Remove PidNamespace dependency entirely
> > - Use &mut KVec parameter to avoid intermediate allocation
> > - Merge context.rs and process.rs changes into single patch
> >
> > v2 -> v3:
> > - Use task::Pid typedef instead of u32/i32
> > - Use PidNamespace::init_ns() instead of init_pid_ns()
> > - Compare PidNamespace directly with == instead of raw pointers
> > - Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
> > - Fix rustfmt import ordering (rcu before Arc)
> > - Rename TaskPid alias to PidT for clearer pid_t type indication
> > - Use task.group_leader().pid() instead of tgid_nr_ns() for consistency with C
> >
> >  drivers/android/binder/context.rs | 16 +++++++++++++++-
> >  drivers/android/binder/process.rs | 25 +++++++++++++++++++------
> >  2 files changed, 34 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
> > index 3d135ec03ca7..1fc779e4d9ce 100644
> > --- a/drivers/android/binder/context.rs
> > +++ b/drivers/android/binder/context.rs
> > @@ -9,7 +9,7 @@
> >      security,
> >      str::{CStr, CString},
> >      sync::{Arc, Mutex},
> > -    task::Kuid,
> > +    task::{Kuid, Task},
> >  };
> >
> >  use crate::{error::BinderError, node::NodeRef, process::Process};
> > @@ -177,4 +177,18 @@ pub(crate) fn get_procs_with_pid(&self, pid: i32) -> Result<KVec<Arc<Process>>>
> >          }
> >          Ok(backing)
> >      }
> > +
> > +    pub(crate) fn get_procs_with_task(
> > +        &self,
> > +        target: &Task,
> > +        out: &mut KVec<Arc<Process>>,
> > +    ) -> Result {
> > +        let lock = self.manager.lock();
> > +        for proc in &lock.all_procs {
> > +            if core::ptr::eq(&*proc.task, target) {
>
> I think we should just add a `PartialEq` and `Eq` impl to `Task`.

I agree, this would make the comparisons much cleaner. I'm planning to
implement this as follows:

In rust/kernel/task.rs, add:
  impl PartialEq for Task {
      fn eq(&self, other: &Self) -> bool {
          self.as_ptr() == other.as_ptr()
      }
  }

  impl Eq for Task {}

This follows the same pattern we used for PidNamespace and allows the
binder code to use natural comparisons:
  if *proc.task == *target {
instead of:
  if core::ptr::eq(&*proc.task, target) {

> > +                out.push(Arc::from(proc), GFP_KERNEL)?;
> > +            }
> > +        }
> > +        Ok(())
> > +    }
> >  }
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > index 132055b4790f..58e816f8873f 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -22,6 +22,7 @@
> >      id_pool::IdPool,
> >      list::{List, ListArc, ListArcField, ListLinks},
> >      mm,
> > +    pid::Pid,
> >      prelude::*,
> >      rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
> >      seq_file::SeqFile,
> > @@ -29,9 +30,9 @@
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
> > @@ -1498,17 +1499,29 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
> >      }
> >  }
> >
> > +/// Get Task reference from VPID with refcount increment.
> > +fn get_task_from_vpid(pid: PidT) -> Result<ARef<Task>> {
> > +    let rcu_guard = rcu::read_lock();
> > +    let pid_struct = Pid::find_vpid(pid, &rcu_guard).ok_or(ESRCH)?;
> > +    let task = pid_struct.pid_task(&rcu_guard).ok_or(ESRCH)?;
> > +
> > +    Ok(ARef::from(task))
> > +}
> > +
> >  fn get_frozen_status(data: UserSlice) -> Result {
> >      let (mut reader, mut writer) = data.reader_writer();
> >
> >      let mut info = reader.read::<BinderFrozenStatusInfo>()?;
> > +
> > +    let target_task = get_task_from_vpid(info.pid as PidT)?;
> > +
> >      info.sync_recv = 0;
> >      info.async_recv = 0;
> >      let mut found = false;
> >
> >      for ctx in crate::context::get_all_contexts()? {
> >          ctx.for_each_proc(|proc| {
> > -            if proc.task.pid() == info.pid as _ {
> > +            if core::ptr::eq(&*proc.task, &*target_task) {
>
> Same here, could use `==` if you have `PartialEq` impl on task.

For the patch structure, I'm planning to split v5 into:
  2/4: rust: pid: add Pid abstraction (unchanged, keeps your Reviewed-by)
  3/4: rust: task: add PartialEq and Eq for Task
  4/4: rust_binder: use VPID translation for freeze operation

This way your existing review on 2/4 is preserved, and the Task equality
implementation can be reviewed independently.

Does this approach look correct?

Best regards,
Heesu

> >                  found = true;
> >                  let inner = proc.inner.lock();
> >                  let txns_pending = inner.txns_pending_locked();
> > @@ -1530,15 +1543,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
> >  fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
> >      let info = reader.read::<BinderFreezeInfo>()?;
> >
> > +    let target_task = get_task_from_vpid(info.pid as PidT)?;
> > +
> >      // Very unlikely for there to be more than 3, since a process normally uses at most binder and
> >      // hwbinder.
> >      let mut procs = KVec::with_capacity(3, GFP_KERNEL)?;
> >
> >      let ctxs = crate::context::get_all_contexts()?;
> >      for ctx in ctxs {
> > -        for proc in ctx.get_procs_with_pid(info.pid as i32)? {
> > -            procs.push(proc, GFP_KERNEL)?;
> > -        }
> > +        ctx.get_procs_with_task(&target_task, &mut procs)?;
> >      }
> >
> >      for proc in procs {
>
> Best,
> Gary
