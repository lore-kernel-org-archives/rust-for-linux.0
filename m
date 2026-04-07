Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CF3AA505;
	Tue,  7 Apr 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561653; cv=none; b=P0nPMOHXgnzy6xIkNUa9Q8RiIOD9Hm/3dtLCD3BhL2of31lEyGWuWdJX0LvDy4xZP5nSKw0NCHwZJrTggDS9QUOdxfTW8+4noQZpfX67/sC+G5SMuPLQdsW9timinh8w/l9B0/etz6wp/JiIU51TuGJSc1/IpHjA8FUJkpT/LQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561653; c=relaxed/simple;
	bh=WAvCXT3VzZ2rHHc2eUzCnTlPtzoLm9pbZ3SHGAlIYNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIytNeazLcmOZGAitgNUfszMSObBe4HnbdGMJdM/xeezbmuJMugo8CGIuk+7Ps5Tj97KyaZRNVTt2VuuyU9ooisd8ZvcDRsykeQ0GCChOuHhTpv6pjW/zN4S+tJjIP99aNTMlW23zywjLxR+rcfjYAjm3NEfqgiZ/WcjyWkPAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=K+8i7IsS; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="K+8i7IsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1775561641; x=1775820841;
	bh=zqE0Vmq+wfd2QTgQ0gec/p2nNTpjycGnPiG+a2n97F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=K+8i7IsSS+kcoBsS4hRayBnokVD410t6y45MHMiNhM9pMXU5gPngfgvbKKrv8tMD2
	 gLe+1AhY/7eTqJdcb4Zd9/e1boIPjtsKMgu2j/tHnTw9iERrr4uslJ7/W6aviWyXgw
	 zsTMc1bvJX20Mh07/4jLL/p74pnOSvvQHIL5YcEU26LJTdf6dh0EG06VX0BIv/QNfM
	 tK/CYgBFBcpqjEPJk0S0Ay9wQ7y+n44n4tz8XCz3WA58oyTrnBWAP/RcIJ7BBbGKWS
	 HD+C/yiRRXsSWvvrIRfz9M94wwU/ZixruJvvRtX5pDZPjfRxNyYs2Yv+dXEytKkyNy
	 IFx8/pMiduHHA==
X-Pm-Submission-Id: 4fqkc64BSgz1DDyT
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Subject: Re: [PATCH v4 2/3] rust: workqueue: add safe cancellation and status methods
Date: Tue,  7 Apr 2026 14:33:44 +0300
Message-ID: <20260407113348.119125-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260407-workqueue-v3-final-v4-2-c27da7e5f175@multicorewareinc.com>
References: <20260407-workqueue-v3-final-v4-0-c27da7e5f175@multicorewareinc.com> <20260407-workqueue-v3-final-v4-2-c27da7e5f175@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>=0D
> =0D
> Modernize the Rust workqueue by adding methods for status checking=0D
> and cancellation of work and delayed work items.=0D
> =0D
> Specifically, this patch adds:=0D
> - is_pending(): Returns true if the work item is currently enqueued.=0D
> - cancel(): Attempts to cancel the work item before it runs.=0D
> - cancel_sync(): Synchronously cancels the work item, waiting for it=0D
>   to finish if it's already running.=0D
> Reclaims ownership if the work was pending.=0D
> =0D
> Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>=0D
> ---=0D
>  rust/kernel/workqueue.rs | 333 +++++++++++++++++++++++++++++++++++++++++=
+-----=0D
>  1 file changed, 298 insertions(+), 35 deletions(-)=0D
> =0D
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> index 706e833e9702..94a52c278776 100644=0D
> --- a/rust/kernel/workqueue.rs=0D
> +++ b/rust/kernel/workqueue.rs=0D
> @@ -448,8 +448,26 @@ pub unsafe trait WorkItemPointer<const ID: u64>: Raw=
WorkItem<ID> {=0D
>      /// The provided `work_struct` pointer must originate from a previou=
s call to [`__enqueue`]=0D
>      /// where the `queue_work_on` closure returned true, and the pointer=
 must still be valid.=0D
>      ///=0D
> +    /// The implementation must ensure that the pointer is reclaimed (e.=
g., via `from_raw`)=0D
> +    /// before calling the `run` method of the underlying [`WorkItem`].=
=0D
> +    ///=0D
>      /// [`__enqueue`]: RawWorkItem::__enqueue=0D
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct);=0D
> +=0D
> +    /// Reclaims ownership of the pointer from the work item.=0D
> +    ///=0D
> +    /// This is called when a work item is successfully cancelled, allow=
ing the caller=0D
> +    /// to recover the original pointer (e.g., `Arc` or `KBox`) that was=
 "leaked"=0D
> +    /// during enqueuing.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// The provided `work_struct` pointer must originate from a previou=
s call to [`__enqueue`]=0D
> +    /// where the `queue_work_on` closure returned true, and the work it=
em must have been=0D
> +    /// successfully cancelled (i.e., `cancel_work` returned true).=0D
> +    ///=0D
> +    /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> +    unsafe fn reclaim(ptr: *mut bindings::work_struct) -> Self;=0D
>  }=0D
>  =0D
>  /// Defines the method that should be called when this work item is exec=
uted.=0D
> @@ -516,6 +534,156 @@ pub fn new(name: &'static CStr, key: Pin<&'static L=
ockClassKey>) -> impl PinInit=0D
>          })=0D
>      }=0D
>  =0D
> +    /// Returns whether the work item is currently pending.=0D
> +    ///=0D
> +    /// # Warning=0D
> +    ///=0D
> +    /// This method is inherently racy. A work item can be enqueued or s=
tart running=0D
> +    /// immediately after this check returns. Do not rely on this for co=
rrectness=0D
> +    /// logic (e.g., as a guard for unsafe operations); use it only for =
debugging or=0D
> +    /// non-critical status reporting.=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// ```=0D
> +    /// # use kernel::workqueue::{self, new_work, Work, WorkItem, HasWor=
k};=0D
> +    /// # use kernel::impl_has_work;=0D
> +    /// # use kernel::sync::Arc;=0D
> +    /// # #[pin_data]=0D
> +    /// # struct MyStruct { #[pin] work: Work<MyStruct> }=0D
> +    /// # impl_has_work! { impl HasWork<Self> for MyStruct { self.work }=
 }=0D
> +    /// # impl WorkItem for MyStruct {=0D
> +    /// #     type Pointer =3D Arc<MyStruct>;=0D
> +    /// #     fn run(_this: Arc<MyStruct>) {}=0D
> +    /// # }=0D
> +    /// let my_struct =3D Arc::pin_init(pin_init!(MyStruct {=0D
> +    ///     work <- new_work!("MyStruct::work"),=0D
> +    /// }), kernel::alloc::flags::GFP_KERNEL).unwrap();=0D
> +    /// assert!(!my_struct.work.is_pending());=0D
> +    /// workqueue::system().enqueue(my_struct.clone());=0D
> +    /// assert!(my_struct.work.is_pending());=0D
> +    /// # let _ =3D my_struct.work.cancel();=0D
> +    /// ```=0D
=0D
Can you add some spaces between certain lines? The bulk style makes it quit=
e=0D
hard to follow in my opinion. This applies to other examples too.=0D
=0D
> +    #[inline]=0D
> +    pub fn is_pending(&self) -> bool {=0D
> +        // SAFETY: `self.work` is a valid pointer to a `work_struct`.=0D
> +        unsafe { bindings::work_pending(self.work.get()) }=0D
> +    }=0D
> +=0D
> +    /// Cancels the work item.=0D
> +    ///=0D
> +    /// If the work item was successfully cancelled (i.e., it was pendin=
g and had not yet=0D
> +    /// started running), the original pointer is reclaimed and returned=
.=0D
> +    ///=0D
> +    /// # Guarantees=0D
> +    ///=0D
> +    /// This method is non-blocking and may return while the work item i=
s still running=0D
> +    /// on another CPU. If it returns `None`, the work item might be abo=
ut to start,=0D
> +    /// is currently running, or has already finished.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// This is safe because ownership is only reclaimed if the kernel c=
onfirms (via=0D
> +    /// `cancel_work` returning true) that the work item is no longer in=
 any queue and=0D
> +    /// will not be executed by the workqueue for this specific enqueue =
event.=0D
> +    ///=0D
> +    /// [`cancel_sync`]: Work::cancel_sync=0D
=0D
Why not using [`Work::cancel_sync`] directly?=0D
=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// ```=0D
> +    /// # use kernel::workqueue::{self, new_work, Work, WorkItem, HasWor=
k};=0D
> +    /// # use kernel::impl_has_work;=0D
> +    /// # use kernel::sync::Arc;=0D
> +    /// # #[pin_data]=0D
> +    /// # struct MyStruct { #[pin] work: Work<MyStruct> }=0D
> +    /// # impl_has_work! { impl HasWork<Self> for MyStruct { self.work }=
 }=0D
> +    /// # impl WorkItem for MyStruct {=0D
> +    /// #     type Pointer =3D Arc<MyStruct>;=0D
> +    /// #     fn run(_this: Arc<MyStruct>) {}=0D
> +    /// # }=0D
> +    /// let my_struct =3D Arc::pin_init(pin_init!(MyStruct {=0D
> +    ///     work <- new_work!("MyStruct::work"),=0D
> +    /// }), kernel::alloc::flags::GFP_KERNEL).unwrap();=0D
> +    /// workqueue::system().enqueue(my_struct.clone());=0D
> +    /// assert!(my_struct.work.is_pending());=0D
> +    /// let reclaimed =3D my_struct.work.cancel();=0D
> +    /// assert!(reclaimed.is_some());=0D
> +    /// assert!(!my_struct.work.is_pending());=0D
> +    /// ```=0D
> +    pub fn cancel(&self) -> Option<T::Pointer>=0D
> +    where=0D
> +        T: WorkItem<ID>,=0D
> +    {=0D
> +        let work_ptr =3D self.work.get();=0D
> +        // SAFETY: `work_ptr` is a valid pointer to a `work_struct`.=0D
> +        if unsafe { bindings::cancel_work(work_ptr) } {=0D
> +            // SAFETY: The work item was successfully cancelled and is g=
uaranteed not to run,=0D
> +            // so we can safely reclaim the ownership leaked during `enq=
ueue`.=0D
> +            Some(unsafe { T::Pointer::reclaim(work_ptr) })=0D
> +        } else {=0D
> +            None=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Synchronously cancels the work item.=0D
> +    ///=0D
> +    /// This method waits for the work item to finish if it is currently=
 running.=0D
> +    /// If the work item was successfully cancelled from the queue, the =
pointer is=0D
> +    /// reclaimed and returned.=0D
> +    ///=0D
> +    /// # Guarantees=0D
> +    ///=0D
> +    /// After this method returns, the work item is guaranteed to be:=0D
> +    /// - Not pending in any queue.=0D
> +    /// - Not running on any CPU.=0D
> +    ///=0D
> +    /// This makes it safe to use during teardown (e.g., driver `remove`=
 or object `drop`)=0D
> +    /// to ensure no background tasks are accessing resources that are a=
bout to be freed.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// Same as [`cancel`], it only reclaims ownership if the kernel con=
firms the work=0D
> +    /// was still pending and is now removed.=0D
> +    ///=0D
> +    /// [`cancel`]: Work::cancel=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// ```=0D
> +    /// # use kernel::workqueue::{self, new_work, Work, WorkItem, HasWor=
k};=0D
> +    /// # use kernel::impl_has_work;=0D
> +    /// # use kernel::sync::Arc;=0D
> +    /// # #[pin_data]=0D
> +    /// # struct MyStruct { #[pin] work: Work<MyStruct> }=0D
> +    /// # impl_has_work! { impl HasWork<Self> for MyStruct { self.work }=
 }=0D
> +    /// # impl WorkItem for MyStruct {=0D
> +    /// #     type Pointer =3D Arc<MyStruct>;=0D
> +    /// #     fn run(_this: Arc<MyStruct>) {}=0D
> +    /// # }=0D
> +    /// let my_struct =3D Arc::pin_init(pin_init!(MyStruct {=0D
> +    ///     work <- new_work!("MyStruct::work"),=0D
> +    /// }), kernel::alloc::flags::GFP_KERNEL).unwrap();=0D
> +    /// workqueue::system().enqueue(my_struct.clone());=0D
> +    /// let reclaimed =3D my_struct.work.cancel_sync();=0D
> +    /// assert!(reclaimed.is_some());=0D
> +    /// ```=0D
> +    pub fn cancel_sync(&self) -> Option<T::Pointer>=0D
> +    where=0D
> +        T: WorkItem<ID>,=0D
> +    {=0D
> +        let work_ptr =3D self.work.get();=0D
> +        // SAFETY: `work_ptr` is a valid pointer to a `work_struct`.=0D
> +        if unsafe { bindings::cancel_work_sync(work_ptr) } {=0D
> +            // SAFETY: The work item was successfully cancelled/waited f=
or, and is guaranteed=0D
> +            // not to run again unless re-enqueued. We reclaim the owner=
ship leaked during=0D
> +            // `enqueue`.=0D
> +            Some(unsafe { T::Pointer::reclaim(work_ptr) })=0D
> +        } else {=0D
> +            None=0D
> +        }=0D
> +    }=0D
> +=0D
>      /// Get a pointer to the inner `work_struct`.=0D
>      ///=0D
>      /// # Safety=0D
> @@ -674,25 +842,14 @@ pub fn new(=0D
>          pin_init!(Self {=0D
>              dwork <- Opaque::ffi_init(|slot: *mut bindings::delayed_work=
| {=0D
>                  // SAFETY: The `WorkItemPointer` implementation promises=
 that `run` can be used as=0D
> -                // the work item function.=0D
> +                // the work item function. We use the C-helper to ensure=
 the timer function=0D
> +                // and data are initialized correctly according to kerne=
l macros.=0D
>                  unsafe {=0D
> -                    bindings::init_work_with_key(=0D
> -                        core::ptr::addr_of_mut!((*slot).work),=0D
> +                    bindings::init_delayed_work(=0D
> +                        slot,=0D
>                          Some(T::Pointer::run),=0D
> -                        false,=0D
>                          work_name.as_char_ptr(),=0D
>                          work_key.as_ptr(),=0D
> -                    )=0D
> -                }=0D
> -=0D
> -                // SAFETY: The `delayed_work_timer_fn` function pointer =
can be used here because=0D
> -                // the timer is embedded in a `struct delayed_work`, and=
 only ever scheduled via=0D
> -                // the core workqueue code, and configured to run in irq=
safe context.=0D
> -                unsafe {=0D
> -                    bindings::timer_init_key(=0D
> -                        core::ptr::addr_of_mut!((*slot).timer),=0D
> -                        Some(bindings::delayed_work_timer_fn),=0D
> -                        bindings::TIMER_IRQSAFE,=0D
>                          timer_name.as_char_ptr(),=0D
>                          timer_key.as_ptr(),=0D
>                      )=0D
> @@ -702,6 +859,89 @@ pub fn new(=0D
>          })=0D
>      }=0D
>  =0D
> +    /// Returns whether the work item is currently pending.=0D
> +    ///=0D
> +    /// # Warning=0D
> +    ///=0D
> +    /// This method is inherently racy. See [`Work::is_pending`].=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// See [`Work::is_pending`].=0D
> +    ///=0D
> +    /// [`Work::is_pending`]: Work::is_pending=0D
=0D
I guess this is a leftover or something? It doesn't seem to make any sense.=
=0D
=0D
> +    #[inline]=0D
> +    pub fn is_pending(&self) -> bool {=0D
> +        // SAFETY: `self.dwork` is reaching into a valid Opaque<bindings=
::delayed_work>.=0D
> +        unsafe {=0D
> +            let ptr: *mut bindings::delayed_work =3D self.dwork.get();=0D
> +            bindings::work_pending(core::ptr::addr_of_mut!((*ptr).work))=
=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Cancels the delayed work item.=0D
> +    ///=0D
> +    /// If the work item was successfully cancelled (i.e., it was pendin=
g and had not yet=0D
> +    /// started running), the original pointer is reclaimed and returned=
.=0D
> +    ///=0D
> +    /// # Guarantees=0D
> +    ///=0D
> +    /// See [`Work::cancel`].=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// Same as [`Work::cancel`].=0D
> +    ///=0D
> +    /// [`cancel_sync`]: DelayedWork::cancel_sync=0D
> +    /// [`Work::cancel`]: Work::cancel=0D
=0D
1- Same as above, these don't make any sense.=0D
2- cancel_sync is not used anywhere. I assume the refs are wrong?=0D
=0D
> +    ///=0D
> +    /// # Examples=0D
> +    ///=0D
> +    /// See [`Work::cancel`].=0D
> +    pub fn cancel(&self) -> Option<T::Pointer>=0D
> +    where=0D
> +        T: WorkItem<ID>,=0D
> +    {=0D
> +        let dwork_ptr =3D self.dwork.get();=0D
> +        // SAFETY: `dwork_ptr` is a valid pointer to a `delayed_work`.=0D
> +        if unsafe { bindings::cancel_delayed_work(dwork_ptr) } {=0D
> +            // SAFETY: The work item was successfully cancelled and is g=
uaranteed not to run,=0D
> +            // so we can safely reclaim the ownership leaked during `enq=
ueue`.=0D
> +            Some(unsafe { T::Pointer::reclaim(core::ptr::addr_of_mut!((*=
dwork_ptr).work)) })=0D
> +        } else {=0D
> +            None=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Synchronously cancels the delayed work item.=0D
> +    ///=0D
> +    /// This method waits for the work item to finish if it is currently=
 running.=0D
> +    /// If the work item was successfully cancelled from the queue, the =
pointer is=0D
> +    /// reclaimed and returned.=0D
> +    ///=0D
> +    /// # Guarantees=0D
> +    ///=0D
> +    /// See [`Work::cancel_sync`].=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// Same as [`Work::cancel_sync`].=0D
> +    pub fn cancel_sync(&self) -> Option<T::Pointer>=0D
> +    where=0D
> +        T: WorkItem<ID>,=0D
> +    {=0D
> +        let dwork_ptr =3D self.dwork.get();=0D
> +        // SAFETY: `dwork_ptr` is a valid pointer to a `delayed_work`.=0D
> +        if unsafe { bindings::cancel_delayed_work_sync(dwork_ptr) } {=0D
> +            // SAFETY: The work item was successfully cancelled/waited f=
or, and is guaranteed=0D
> +            // not to run again unless re-enqueued. We reclaim the owner=
ship leaked during=0D
> +            // `enqueue`.=0D
> +            Some(unsafe { T::Pointer::reclaim(core::ptr::addr_of_mut!((*=
dwork_ptr).work)) })=0D
> +        } else {=0D
> +            None=0D
> +        }=0D
> +    }=0D
> +=0D
>      /// Get a pointer to the inner `delayed_work`.=0D
>      ///=0D
>      /// # Safety=0D
> @@ -781,22 +1021,11 @@ unsafe fn raw_get_work(=0D
>              unsafe fn work_container_of(=0D
>                  ptr: *mut $crate::workqueue::Work<$work_type $(, $id)?>,=
=0D
>              ) -> *mut Self {=0D
> -                // SAFETY: The caller promises that the pointer points a=
t a field of the right type=0D
> -                // in the right kind of struct.=0D
> -                let ptr =3D unsafe { $crate::workqueue::Work::raw_get(pt=
r) };=0D
> -=0D
> -                // SAFETY: The caller promises that the pointer points a=
t a field of the right type=0D
> -                // in the right kind of struct.=0D
> -                let delayed_work =3D unsafe {=0D
> -                    $crate::container_of!(ptr, $crate::bindings::delayed=
_work, work)=0D
> -                };=0D
> -=0D
> -                let delayed_work: *mut $crate::workqueue::DelayedWork<$w=
ork_type $(, $id)?> =3D=0D
> -                    delayed_work.cast();=0D
> -=0D
> -                // SAFETY: The caller promises that the pointer points a=
t a field of the right type=0D
> -                // in the right kind of struct.=0D
> -                unsafe { $crate::container_of!(delayed_work, Self, $fiel=
d) }=0D
> +                // SAFETY: The caller promises that the pointer points a=
t the `work` field=0D
> +                // of a `delayed_work` struct, which is itself the `dwor=
k` field of a=0D
> +                // `DelayedWork` wrapper, which is the `$field` field of=
 a `Self` struct.=0D
> +                let ptr =3D ptr.cast::<$crate::workqueue::DelayedWork<$w=
ork_type $(, $id)?>>();=0D
> +                unsafe { $crate::container_of!(ptr, Self, $field) }=0D
>              }=0D
>          }=0D
>      )*};=0D
> @@ -827,6 +1056,15 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> f=
or Arc<T>=0D
>  =0D
>          T::run(arc)=0D
>      }=0D
> +=0D
> +    unsafe fn reclaim(ptr: *mut bindings::work_struct) -> Self {=0D
=0D
Missing # SAFETY contract.=0D
=0D
> +        // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.=0D
> +        let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> +        // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.=0D
> +        let ptr =3D unsafe { T::work_container_of(ptr) };=0D
> +        // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.=0D
> +        unsafe { Arc::from_raw(ptr) }=0D
> +    }=0D
>  }=0D
>  =0D
>  // SAFETY: The `work_struct` raw pointer is guaranteed to be valid for t=
he duration of the call to=0D
> @@ -874,7 +1112,8 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID>=
 for Arc<T>=0D
>  {=0D
>  }=0D
>  =0D
> -// SAFETY: TODO.=0D
> +// SAFETY: The `WorkItemPointer` implementation for `Pin<KBox<T>>` is sa=
fe because `KBox::from_raw`=0D
> +// correctly reconstructs the box that was leaked during `enqueue` (via =
`KBox::into_raw`).=0D
>  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>=0D
>  where=0D
>      T: WorkItem<ID, Pointer =3D Self>,=0D
> @@ -883,18 +1122,35 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> =
for Pin<KBox<T>>=0D
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.=0D
>          let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> -        // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.=0D
> +        // SAFETY: This computes the pointer that `__enqueue` got from `=
KBox::into_raw`.=0D
>          let ptr =3D unsafe { T::work_container_of(ptr) };=0D
> -        // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.=0D
> +        // SAFETY: This pointer comes from `KBox::into_raw` and we've be=
en given back ownership.=0D
>          let boxed =3D unsafe { KBox::from_raw(ptr) };=0D
>          // SAFETY: The box was already pinned when it was enqueued.=0D
>          let pinned =3D unsafe { Pin::new_unchecked(boxed) };=0D
>  =0D
>          T::run(pinned)=0D
>      }=0D
> +=0D
> +    unsafe fn reclaim(ptr: *mut bindings::work_struct) -> Self {=0D
=0D
Same here, missing # SAFETY contract.=0D
=0D
> +        // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.=0D
> +        let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> +        // SAFETY: This computes the pointer that `__enqueue` got from `=
KBox::into_raw`.=0D
> +        let ptr =3D unsafe { T::work_container_of(ptr) };=0D
> +        // SAFETY: This pointer comes from `KBox::into_raw` and we've be=
en given back ownership.=0D
> +        let boxed =3D unsafe { KBox::from_raw(ptr) };=0D
> +        // SAFETY: The box was already pinned when it was enqueued.=0D
> +        unsafe { Pin::new_unchecked(boxed) }=0D
> +    }=0D
>  }=0D
>  =0D
> -// SAFETY: TODO.=0D
> +// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for t=
he duration of the call to=0D
> +// the closure because we have exclusive ownership of the `KBox`, and we=
 don't drop it ourselves.=0D
> +// If `queue_work_on` returns true, it is further guaranteed to be valid=
 until a call to the=0D
> +// function pointer in `work_struct` because we leak the memory it point=
s to, and only reclaim it=0D
> +// if the closure returns false (not reachable for KBox as it must succe=
ed) or in=0D
> +// `WorkItemPointer::run`, which is what the function pointer in the `wo=
rk_struct` must be=0D
> +// pointing to.=0D
>  unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>=0D
>  where=0D
>      T: WorkItem<ID, Pointer =3D Self>,=0D
> @@ -1022,3 +1278,10 @@ pub fn system_bh_highpri() -> &'static Queue {=0D
>      // SAFETY: `system_bh_highpri_wq` is a C global, always available.=0D
>      unsafe { Queue::from_raw(bindings::system_bh_highpri_wq) }=0D
>  }=0D
> +=0D
> +/// Returns the strong count of an [`Arc`] for testing purposes.=0D
> +///=0D
> +/// # Safety=0D
> +///=0D
> +/// This is intended for use in KUnit tests and sample modules ONLY.=0D
> +#[cfg(CONFIG_KUNIT)]=0D
> =0D
=0D
Seems like this part failed on the patch separation.=0D
=0D
> -- =0D
> 2.43.0=0D
> =0D
> =0D
