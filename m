Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8E242D8B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749066; cv=none; b=FlLBpxhhMSYCHKE9dHV1HNsJ+UgpHXlvhnqBQLj1sjNi+3gzpnglm0vFDPFtD32dolQG+et78st6FRRS16kIvN3YoBo6WOceMhJe/C4bydfPAyoVztiJa1PStDicH/qZqnmQk/RmyXtPDiMpqNXJ3wrE8b4oJG87mA5casEsY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749066; c=relaxed/simple;
	bh=kAjIG7e+dx+MRr04+manPD2p/CI9dVdsfv1qTnrVTQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QdfzSojN580EgyXNngmW+58VZXGs6fh2wr7D5chxa3ZaYyqopiK+IXf0bH6sLzAZPL3QjGYJagCcOIrJpELIrOZTd0oWLMCPGTMgldd81g7PHIxHGeiyKxIj3QLWZI1aPYqlYnp1TpM5chTVUXgObRAKXVai+R8ljHhzNGpTctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 30 Jan 2026 13:57:40 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: heesu0025.kim@lge.com
Received: from unknown (HELO heesu0025-kim-aosp-rust-binder.beeworker.bee-live.svc.cluster.local) (10.159.44.92)
	by 156.147.1.121 with ESMTP; 30 Jan 2026 13:57:40 +0900
X-Original-SENDERIP: 10.159.44.92
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
Subject: Re: [PATCH v2 2/3] rust: pid: add Pid abstraction and init_pid_ns helper
Date: Fri, 30 Jan 2026 13:57:40 +0900
Message-Id: <20260130045740.832163-1-heesu0025.kim@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net>
References: <DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu Jan 29, 2026 at 2:33 PM GMT, Gary Guo wrote:
> On Thu Jan 29, 2026 at 8:41 AM GMT, jongan.kim wrote:
>> From: HeeSu Kim <heesu0025.kim@lge.com>
>>
>> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
>> kernel's struct pid and provides safe Rust interfaces for:
>> - find_vpid_with_guard: Find a pid by number under RCU protection
>> - pid_task_with_guard: Get the task associated with a pid under RCU
>>   protection
>>
>> Also add init_pid_ns() helper function to pid_namespace.rs to get
>> a reference to the init PID namespace.
>>
>> These abstractions use lifetime-bounded references tied to RCU guards
>> to ensure memory safety when accessing RCU-protected data structures.
>>
>> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
>> ---
>>  rust/kernel/lib.rs           |   1 +
>>  rust/kernel/pid.rs           | 100 +++++++++++++++++++++++++++++++++++
>>  rust/kernel/pid_namespace.rs |   9 ++++
>>  3 files changed, 110 insertions(+)
>>  create mode 100644 rust/kernel/pid.rs
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index f812cf120042..60a518d65d0e 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -122,6 +122,7 @@
>>  pub mod page;
>>  #[cfg(CONFIG_PCI)]
>>  pub mod pci;
>> +pub mod pid;
>>  pub mod pid_namespace;
>>  pub mod platform;
>>  pub mod prelude;
>> diff --git a/rust/kernel/pid.rs b/rust/kernel/pid.rs
>> new file mode 100644
>> index 000000000000..00989b953c23
>> --- /dev/null
>> +++ b/rust/kernel/pid.rs
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Process identifiers (PIDs).
>> +//!
>> +//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
>> +
>> +use crate::{bindings, ffi::c_int, sync::rcu, task::Task, types::Opaque};
>> +
>> +/// Wraps the kernel's `struct pid`.
>> +///
>> +/// This structure represents the Rust abstraction for a C `struct pid`.
>> +/// A `Pid` represents a process identifier that can be looked up in different
>> +/// PID namespaces.
>> +#[repr(transparent)]
>> +pub struct Pid {
>> +    inner: Opaque<bindings::pid>,
>> +}
>> +
>> +impl Pid {
>> +    /// Returns a raw pointer to the inner C struct.
>> +    #[inline]
>> +    pub fn as_ptr(&self) -> *mut bindings::pid {
>> +        self.inner.get()
>> +    }
>> +
>> +    /// Finds a `struct pid` by its pid number within the current task's PID namespace.
>> +    ///
>> +    /// Returns `None` if no such pid exists.
>> +    ///
>> +    /// The returned reference is only valid for the duration of the RCU read-side
>> +    /// critical section represented by the `rcu::Guard`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::pid::Pid;
>> +    /// use kernel::sync::rcu;
>> +    ///
>> +    /// let guard = rcu::read_lock();
>> +    /// if let Some(pid) = Pid::find_vpid_with_guard(1, &guard) {
>> +    ///     pr_info!("Found pid 1\n");
>> +    /// }
>> +    /// ```
>> +    ///
>> +    /// Returns `None` for non-existent PIDs:
>> +    ///
>> +    /// ```
>> +    /// use kernel::pid::Pid;
>> +    /// use kernel::sync::rcu;
>> +    ///
>> +    /// let guard = rcu::read_lock();
>> +    /// // PID 0 (swapper/idle) is not visible via find_vpid.
>> +    /// assert!(Pid::find_vpid_with_guard(0, &guard).is_none());
>> +    /// ```
>> +    #[inline]
>> +    pub fn find_vpid_with_guard<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {
>> +        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
>> +        let ptr = unsafe { bindings::find_vpid(nr as c_int) };
>
> This `as c_int` part is not needed.
>
>> +        if ptr.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: `find_vpid` returns a valid pointer under RCU protection,
>> +            // and `Pid` is `#[repr(transparent)]` over `bindings::pid`.
>> +            Some(unsafe { &*(ptr as *const Self) })
>> +        }
>> +    }
>> +
>> +    /// Gets the task associated with this PID.
>> +    ///
>> +    /// Returns `None` if no task is associated with this PID.
>> +    ///
>> +    /// The returned reference is only valid for the duration of the RCU read-side
>> +    /// critical section represented by the `rcu::Guard`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::pid::Pid;
>> +    /// use kernel::sync::rcu;
>> +    ///
>> +    /// let guard = rcu::read_lock();
>> +    /// if let Some(pid) = Pid::find_vpid_with_guard(1, &guard) {
>> +    ///     if let Some(task) = pid.pid_task_with_guard(&guard) {
>> +    ///         pr_info!("Found task for pid 1\n");
>> +    ///     }
>> +    /// }
>> +    /// ```
>> +    #[inline]
>> +    pub fn pid_task_with_guard<'a>(&'a self, _rcu_guard: &'a rcu::Guard) -> Option<&'a Task> {
>> +        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
>> +        let task_ptr = unsafe { bindings::pid_task(self.as_ptr(), bindings::pid_type_PIDTYPE_PID) };
>> +        if task_ptr.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: `pid_task` returns a valid pointer under RCU protection,
>> +            // and `Task` is `#[repr(transparent)]` over `bindings::task_struct`.
>> +            Some(unsafe { &*task_ptr.cast() })
>> +        }
>> +    }
>> +}
>> diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
>> index 979a9718f153..6029e3e120d0 100644
>> --- a/rust/kernel/pid_namespace.rs
>> +++ b/rust/kernel/pid_namespace.rs
>> @@ -63,3 +63,12 @@ unsafe impl Send for PidNamespace {}
>>  // SAFETY: It's OK to access `PidNamespace` through shared references from other threads because
>>  // we're either accessing properties that don't change or that are properly synchronised by C code.
>>  unsafe impl Sync for PidNamespace {}
>> +
>> +/// Returns a reference to the init PID namespace.
>> +///
>> +/// This is the root PID namespace that exists throughout the lifetime of the kernel.
>> +#[inline]
>> +pub fn init_pid_ns() -> &'static PidNamespace {
>> +    // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
>> +    unsafe { PidNamespace::from_ptr(core::ptr::addr_of!(bindings::init_pid_ns)) }
>> +}
>
> I would probably put this as assoc fn, so you write `PidNamespace::init_ns()`
> instead of `kernel::pid_namespace::init_pid_ns()`.
>
> Best,
> Gary

Thanks for review and feedback.
I will update the patch to address both suggestions in the next revision.

Best Regards,
Heesu Kim
