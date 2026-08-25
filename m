Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF9284B37
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656145; cv=none; b=GlKN4cQvR6NwH2d+YMBjHPZy/2fgOtpIzq5eqo0jXH3eOLH8GUNg9usU+1VsatO/A9C7rf7Ib6fhg2Uh3yLjHfBIk89fokXrBGX/dOXtZctfy4Sf3MLqzbZPOc0pqEeLFRqOocy/BJs+bZY8/mAB5y1spCLWx+FTWr5epDT9WaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656145; c=relaxed/simple;
	bh=0ciZa7SraEvE+4oulKgD9LnvfBVa+xK2+fvNvLgXDoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVjUl1TVP3xXMocJrq7R65CIsfTXnHZCXxSZhGWIAan+89j3VS7OuulLerc3wSCEF6KbEofQJxPjNyC9Z5QvejMWHf2qHb2qCO1c4zxZHCCR2Rt/McZ+BNOSL6xLTjDlccCTGywPv1L+Qkn0cwj7JDOZqP6JD5eZYNHfecf2GwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H/29TpN6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H/29TpN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325441F00A3A;
	Tue, 25 Aug 2026 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787656141;
	bh=bnmb0aePC2tHNSUsnpnWsxsGfEY0uUaaLGYqa9DfC4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H/29TpN6u2Hr02xBZz1Dvl7+9zSCbd8zdCTcBnTdJVVUiDdMk2d+JaTNU/g9gYc/8
	 zVJkXRb7ksdIZZKr89GLHHxGJiiwVZiru4eFSQIGqGuKMO4/CtKyKsJpRrTak2Y7Z7
	 C1ujJgaNh33OHd2jLuaiRmwnUhYjCshPIV7exj4w=
Date: Tue, 25 Aug 2026 13:08:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: merge problems with char-misc-next and Linus's branch right now
Message-ID: <2026082514-such-version-4236@gregkh>
References: <2026082516-slapstick-nearly-8986@gregkh>
 <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
 <CANiq72krVngy9cC1X9q55THEC=5Od_Bbo5=V5ax8jZovW6ENtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72krVngy9cC1X9q55THEC=5Od_Bbo5=V5ax8jZovW6ENtg@mail.gmail.com>

On Tue, Aug 25, 2026 at 12:49:54PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 25, 2026 at 12:05 PM Alvin Sun <alvin.sun@linux.dev> wrote:
> >
> > Gary has already posted a fix:
> > https://lore.kernel.org/rust-for-linux/20260813163951.1102583-1-gary@kernel.org/
> 
> Yeah, please see as well the other conflicts related to char-misc this cycle:
> 
>   https://lore.kernel.org/linux-next/20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org/
> 
>   https://lore.kernel.org/linux-next/ans8lsGbkro4pO6N@sirena.org.uk/
>     (the diff in that thread is from another conflict somehow, but the
>     actual conflict is very simple anyway)
> 
> The resolutions in linux-next should be fine.
> 
> My overall list of conflicts for Linus is at:
> 
>   https://lore.kernel.org/rust-for-linux/20260816191926.230123-1-ojeda@kernel.org/

Yeah, it's messy.

Below is my resolution, seems to work here for me and I'll send it along
to Linus as well.

thanks,

greg k-h


diff --cc rust/kernel/sync/poll.rs
index 5aa0ce9ba01b,684dfa242b1a..000000000000
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@@ -8,13 -9,14 +9,18 @@@ use crate::
      bindings,
      fs::File,
      prelude::*,
 -    sync::{CondVar, LockClassKey},
 +    sync::{
 +        rcu::synchronize_rcu,
 +        CondVar,
 +        LockClassKey, //
 +    }, //
+     types::Opaque, //
+ };
+ use core::{
+     marker::PhantomData,
+     mem::ManuallyDrop,
+     ops::Deref, //
  };
- use core::{marker::PhantomData, ops::Deref};
  
  /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
  #[macro_export]
@@@ -103,6 -106,72 +110,70 @@@ impl PinnedDrop for PollCondVar 
          unsafe { bindings::__wake_up_pollfree(self.inner.wait_queue_head.get()) };
  
          // Wait for epoll items to be properly removed.
 -        //
 -        // SAFETY: Just an FFI call.
 -        unsafe { bindings::synchronize_rcu() };
 +        synchronize_rcu();
      }
  }
+ 
+ /// A [`KBox<PollCondVar>`] that uses `kfree_rcu`.
+ ///
+ /// [`KBox<PollCondVar>`]: PollCondVar
+ pub struct PollCondVarBox {
+     inner: ManuallyDrop<Pin<KBox<PollCondVarBoxInner>>>,
+ }
+ 
+ #[pin_data]
+ #[repr(C)]
+ struct PollCondVarBoxInner {
+     #[pin]
+     inner: PollCondVar,
 -    rcu: Opaque<bindings::callback_head>,
++    rcu: Opaque<bindings::kvfree_rcu_head>,
+ }
+ 
+ // SAFETY: PollCondVar is Send
+ unsafe impl Send for PollCondVarBoxInner {}
+ // SAFETY: PollCondVar is Sync
+ unsafe impl Sync for PollCondVarBoxInner {}
+ 
+ impl PollCondVarBox {
+     /// Constructs a new boxed [`PollCondVar`].
+     pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> Result<Self, AllocError> {
+         let b = KBox::pin_init(
+             pin_init!(PollCondVarBoxInner {
+                 inner <- PollCondVar::new(name, key),
+                 rcu: Opaque::uninit(),
+             }),
+             GFP_KERNEL,
+         )
+         .map_err(|_| AllocError)?;
+ 
+         Ok(PollCondVarBox {
+             inner: ManuallyDrop::new(b),
+         })
+     }
+ }
+ 
+ impl Deref for PollCondVarBox {
+     type Target = PollCondVar;
+     fn deref(&self) -> &PollCondVar {
+         &self.inner.inner
+     }
+ }
+ 
+ impl Drop for PollCondVarBox {
+     #[inline]
+     fn drop(&mut self) {
+         // SAFETY: ManuallyDrop::take ok because not already taken.
+         let boxed = unsafe { ManuallyDrop::take(&mut self.inner) };
+ 
+         // SAFETY: The code below frees the box without calling the actual destructor of the type,
+         // but it's okay because it re-implements the destructor using `kfree_rcu()` in place of
+         // `synchronize_rcu()`.
+         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(boxed) });
+ 
+         // SAFETY: The pointer points at a valid `wait_queue_head`.
+         unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_queue_head.get()) };
+ 
+         // SAFETY: This was allocated using `KBox::pin_init`, so it can be freed with `kvfree`.
+         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
+     }
+ }
diff --cc rust/kernel/task.rs
index c2b3457b700c,1b290c61714d..000000000000
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@@ -210,7 -210,14 +210,14 @@@ impl Task 
          unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
      }
  
+     /// Returns the TGID (Thread Group ID / Process ID) of the given task.
+     pub fn tgid(&self) -> Pid {
+         // SAFETY: The tgid of a task never changes after initialization, so reading this field is
+         // not a data race.
+         unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
+     }
+ 
 -    /// Returns the UID of the given task.
 +    /// Returns the objective real UID of the given task.
      #[inline]
      pub fn uid(&self) -> Kuid {
          // SAFETY: It's always safe to call `task_uid` on a valid task.
diff --cc rust/uapi/uapi_helper.h
index 1c4aa4292dce,86c7b6b284b0..000000000000
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@@ -10,7 -11,7 +10,8 @@@
  #include <uapi/drm/nova_drm.h>
  #include <uapi/drm/panthor_drm.h>
  #include <uapi/linux/android/binder.h>
+ #include <uapi/linux/android/binder_netlink.h>
 +#include <uapi/linux/ioctl.h>
  #include <uapi/linux/mdio.h>
  #include <uapi/linux/mii.h>
  #include <uapi/linux/ethtool.h>
diff --git a/drivers/android/binder/netlink.rs b/drivers/android/binder/netlink.rs
index beb7ea2edaff..f34e1009432c 100644
--- a/drivers/android/binder/netlink.rs
+++ b/drivers/android/binder/netlink.rs
@@ -13,7 +13,7 @@
 };
 
 pub static BINDER_NL_FAMILY: Family = Family::const_new(
-    &crate::THIS_MODULE,
+    kernel::module::this_module::<crate::LocalModule>(),
     kernel::uapi::BINDER_FAMILY_NAME,
     kernel::uapi::BINDER_FAMILY_VERSION,
     &BINDER_NL_FAMILY_MCGRPS,
* Unmerged path drivers/misc/sgi-xp/xpc_uv.c
