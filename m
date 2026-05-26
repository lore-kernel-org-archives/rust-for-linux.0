Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22503DD86E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799462; cv=none; b=inOQhUpVzpYsqmfdgujBQIhVdkltO1QBzJlAyonHcv8G6RlXqiheSQuwBJdXLRCnCwLZKh2aytJ7Cbjwpgo5tXne4zWvMsw25Ng0jbWBYjsWV3EcRE4HSCkEQYHACn20DyNGal45Y+zComy4BYiCALp1gSApq67b9jz+V7qTgkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799462; c=relaxed/simple;
	bh=Nh9P8hsXrm4CsiMtDufYB++Nutv4KuxHNW3VeadaV04=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mptZqkS28YSLZtCSkj1IqBQxHTjYbFk3HZQM4cvEZD87L6i7z2gaUHHl7A1+7CrdcG4R/tDUUY67v8hoAT9TEIf5z3N0F6QjBV+8F6Ja/Gx2FvuE0Y7CAJCi5BiF+f2T9m4D4/rWxaS5jHQ3pvLac2cjLK5cO4QNVnDVrWJVTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQFZUx2v; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQFZUx2v"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6872faa5ec6so5664749a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779799458; x=1780404258; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRmIX1kO8psCppybnRnqhW7oye4IiBJUHbmpax9mL/w=;
        b=sQFZUx2vq3TSxiHP1+I6YXTR9P9T8lJLwDJ17BcvvLNCHAS1dx0wMa79+J/y5Qv+9x
         8WTk+gicUaO8ogN/jq3guTGNeuFAV1yTf9M0inBldtI/lZJRVhlyWS8A5s106E+y9nFn
         fKpvKAqGZuyJJx9u7ryNt1+nYoXfNve/SOMlEHqOULga0dbyO6cHBBMMhVCTVUed2mou
         W74Vko1gU3VMEKMoM4lIcaMC+uPk1PNlab8mzApRQGFVYYMZIO6DXC4Fok3fljwWBfZG
         HunfI0ZKm96PQPgMGXNNrUk/EF4OHv0T9+N8oe7yaqWuzsd3pTWSYpaNVtFx6PrIlrCM
         Jwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799458; x=1780404258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRmIX1kO8psCppybnRnqhW7oye4IiBJUHbmpax9mL/w=;
        b=M6WxYl9K13oVrKQzyMch+OAh0jLVWMnOONaXO1JDDGVG1I4z5HyvF2FJ3VCZdvzrKd
         EjnpA3Fi2tOxCUUx2hkeP+ys7UcKihIP/KsROqxl0N6iQexPYMHYZSWMfOSCFelmKsca
         oofpCodFf0v9cGD7F6pPNe8rDA1uTuiWCyedtph4yrLMv/E6fZkJ7RO/dcHAcTjFNcit
         UK0r+NK/feUEMkYVJeQovOD2BvWb97Covbr815VGbrkzCE3rx607rA0+u26UavD/CdD7
         JB2Zt2aoThiN51W4I/F+bhbUUPamjkKu3qHKpRT8EaCUVa98TvcbQAbGnJoxuXxY39TQ
         kjTg==
X-Forwarded-Encrypted: i=1; AFNElJ/Db5RC+ZGrITAnFtyDE64qD0ih+gUsD8c/AOZTtJY7nqFsIQUyf7HjAuCOEZRqk6rezTe5eHBC3jJakMm8AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZy8f8KqlsQ/r7PlexSWW1BCXIcOT5Eqhn2ATp9O5IHzj2V7O
	8yhOGt5mTyEb4EoVp1bHy8aoHx9tp8cuuw1fRufHq08NFJJBFeirf1f3if40Dn7sYFTTzoxdP6Z
	7oDK9h19FkoxNsVRRkA==
X-Received: from edik12.prod.google.com ([2002:a50:cb8c:0:b0:67b:f67a:ce67])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:370a:b0:670:f48b:caf8 with SMTP id 4fb4d7f45d1cf-6889c432e81mr9293449a12.3.1779799457893;
 Tue, 26 May 2026 05:44:17 -0700 (PDT)
Date: Tue, 26 May 2026 12:44:16 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-5-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-5-3d6e9406e864@kernel.org>
Message-ID: <ahWVoESBq51yw2oC@google.com>
Subject: Re: [PATCH 5/6] rust: binder: enable `clippy::as_underscore`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:50PM +0200, Tamir Duberstein wrote:
> In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
> 
> > The conversion might include lossy conversion or a dangerous cast that
> > might go undetected due to the type being inferred.
> >
> > The lint is allowed by default as using `_` is less wordy than always
> > specifying the type.
> 
> Always specifying the type is especially helpful in function call
> contexts where the inferred type may change at a distance. Specifying
> the type also allows Clippy to spot more cases of `useless_conversion`.
> 
> While this does not eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize. It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint in the Binder Rust driver -- no functional
> change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  drivers/android/binder/allocation.rs       |  4 ++--
>  drivers/android/binder/defs.rs             |  2 +-
>  drivers/android/binder/node.rs             | 10 +++++-----
>  drivers/android/binder/node/wrapper.rs     |  2 +-
>  drivers/android/binder/process.rs          |  6 +++---
>  drivers/android/binder/rust_binder_main.rs |  4 ++--
>  drivers/android/binder/thread.rs           | 24 +++++++++++++-----------
>  drivers/android/binder/transaction.rs      | 12 ++++++------
>  8 files changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> index 0cab959e4b7e..4ac42bb7216b 100644
> --- a/drivers/android/binder/allocation.rs
> +++ b/drivers/android/binder/allocation.rs
> @@ -376,8 +376,8 @@ pub(crate) fn transfer_binder_object(
>                  BINDER_TYPE_WEAK_BINDER
>              };
>              newobj.flags = obj.flags;
> -            newobj.__bindgen_anon_1.binder = ptr as _;
> -            newobj.cookie = cookie as _;
> +            newobj.__bindgen_anon_1.binder = ptr;
> +            newobj.cookie = cookie;

Are you sure these casts are unnecessary on all platforms?

>              self.write(offset, &newobj)?;
>              // Increment the user ref count on the node. It will be decremented as part of the
>              // destruction of the buffer, when we see a binder or weak-binder object.
> diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
> index fd0ef3f9ebd1..a9682eb6d984 100644
> --- a/drivers/android/binder/defs.rs
> +++ b/drivers/android/binder/defs.rs
> @@ -146,7 +146,7 @@ fn default() -> Self {
>  impl BinderVersion {
>      pub(crate) fn current() -> Self {
>          Self(MaybeUninit::new(uapi::binder_version {
> -            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as _,
> +            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as i32,

Are you sure i32 is the right type on all platforms?

>          }))
>      }
>  }
> diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
> index a4a3ddda6ac9..8f5307c03b1a 100644
> --- a/drivers/android/binder/node.rs
> +++ b/drivers/android/binder/node.rs
> @@ -464,7 +464,7 @@ pub(crate) fn incr_refcount_allow_zero2one_with_wrapper(
>          owner_inner: &mut ProcessInner,
>      ) -> Option<DLArc<dyn DeliverToRead>> {
>          match self.incr_refcount_allow_zero2one(strong, owner_inner) {
> -            Ok(Some(node)) => Some(node as _),
> +            Ok(Some(node)) => Some(node as DLArc<dyn DeliverToRead>),
>              Ok(None) => None,
>              Err(CouldNotDeliverCriticalIncrement) => {
>                  assert!(strong);
> @@ -489,8 +489,8 @@ pub(crate) fn populate_counts(
>          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
>      ) {
>          let inner = self.inner.access(guard);
> -        out.strong_count = inner.strong.count as _;
> -        out.weak_count = inner.weak.count as _;
> +        out.strong_count = inner.strong.count as u32;
> +        out.weak_count = inner.weak.count as u32;

Are you sure u32 is the right type on all platforms?

>      }
>  
>      pub(crate) fn populate_debug_info(
> @@ -498,8 +498,8 @@ pub(crate) fn populate_debug_info(
>          out: &mut BinderNodeDebugInfo,
>          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
>      ) {
> -        out.ptr = self.ptr as _;
> -        out.cookie = self.cookie as _;
> +        out.ptr = self.ptr;
> +        out.cookie = self.cookie;
>          let inner = self.inner.access(guard);
>          if inner.strong.has_count {
>              out.has_strong_ref = 1;
> diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
> index 43294c050502..6e4ca01c941a 100644
> --- a/drivers/android/binder/node/wrapper.rs
> +++ b/drivers/android/binder/node/wrapper.rs
> @@ -21,7 +21,7 @@ pub(crate) fn new() -> Result<Self> {
>  
>      pub(super) fn init(self, node: DArc<Node>) -> DLArc<dyn DeliverToRead> {
>          match self.inner.pin_init_with(DTRWrap::new(NodeWrapper { node })) {
> -            Ok(initialized) => ListArc::from(initialized) as _,
> +            Ok(initialized) => ListArc::from(initialized) as DLArc<dyn DeliverToRead>,
>              Err(err) => match err {},
>          }
>      }
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 820cbd541435..3a22260eb9b4 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -259,7 +259,7 @@ pub(crate) fn new_node_ref_with_thread(
>          let push = match wrapper {
>              None => node
>                  .incr_refcount_allow_zero2one(strong, self)?
> -                .map(|node| node as _),
> +                .map(|node| node as DLArc<dyn DeliverToRead>),
>              Some(wrapper) => node.incr_refcount_allow_zero2one_with_wrapper(strong, wrapper, self),
>          };
>          if let Some(node) = push {
> @@ -741,7 +741,7 @@ fn set_as_manager(
>          } else {
>              (0, 0, 0)
>          };
> -        let node_ref = self.get_node(ptr, cookie, flags as _, true, thread)?;
> +        let node_ref = self.get_node(ptr, cookie, flags, true, thread)?;

Are you sure there are no platforms that require a cast here?

>          let node = node_ref.node.clone();
>          self.ctx.set_manager_node(node_ref)?;
>          self.inner.lock().is_manager = true;
> @@ -1517,7 +1517,7 @@ fn get_frozen_status(data: UserSlice) -> Result {
>  
>      for ctx in crate::context::get_all_contexts()? {
>          ctx.for_each_proc(|proc| {
> -            if proc.task.pid() == info.pid as _ {
> +            if proc.task.pid() == info.pid as i32 {

Should use the Pid type alias.

>                  found = true;
>                  let inner = proc.inner.lock();
>                  let txns_pending = inner.txns_pending_locked();
> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> index 88da29413e16..2c10a8cd3d88 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -6,7 +6,7 @@
>  
>  #![crate_name = "rust_binder"]
>  #![recursion_limit = "256"]
> -#![allow(clippy::as_underscore, clippy::cast_lossless)]
> +#![allow(clippy::cast_lossless)]
>  
>  use kernel::{
>      bindings::{self, seq_file},
> @@ -412,7 +412,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
>      // SAFETY: We previously set `private_data` in `rust_binder_open`.
>      let f = unsafe { Arc::<Process>::borrow((*file).private_data) };
>      // SAFETY: The caller ensures that the file is valid.
> -    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd as _, arg as _) {
> +    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd, arg) {

Several more cases below where it's unclear whether these changes are
correct on all platforms including 32-bit targets.

>          Ok(()) => 0,
>          Err(err) => err.to_errno() as isize,
>      }
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index 97d5f31e8fe3..87298a8c597d 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -666,9 +666,9 @@ fn translate_object(
>                  let strong = obj.hdr.type_ == BINDER_TYPE_BINDER;
>                  // SAFETY: `binder` is a `binder_uintptr_t`; any bit pattern is a valid
>                  // representation.
> -                let ptr = unsafe { obj.__bindgen_anon_1.binder } as _;
> -                let cookie = obj.cookie as _;
> -                let flags = obj.flags as _;
> +                let ptr = unsafe { obj.__bindgen_anon_1.binder };
> +                let cookie = obj.cookie;
> +                let flags = obj.flags;
>                  let node = self
>                      .process
>                      .as_arc_borrow()
> @@ -679,7 +679,7 @@ fn translate_object(
>              BinderObjectRef::Handle(obj) => {
>                  let strong = obj.hdr.type_ == BINDER_TYPE_HANDLE;
>                  // SAFETY: `handle` is a `u32`; any bit pattern is a valid representation.
> -                let handle = unsafe { obj.__bindgen_anon_1.handle } as _;
> +                let handle = unsafe { obj.__bindgen_anon_1.handle };
>                  let node = self.process.get_node_from_handle(handle, strong)?;
>                  security::binder_transfer_binder(&self.process.cred, &view.alloc.process.cred)?;
>                  view.transfer_binder_object(offset, obj, strong, node)?;
> @@ -736,7 +736,7 @@ fn translate_object(
>                      ScatterGatherEntry {
>                          obj_index,
>                          offset: alloc_offset,
> -                        sender_uaddr: obj.buffer as _,
> +                        sender_uaddr: obj.buffer as usize,
>                          length: obj_length,
>                          pointer_fixups: KVec::new(),
>                          fixup_min_offset: 0,
> @@ -843,7 +843,7 @@ fn translate_object(
>                      .ok_or(EINVAL)?;
>  
>                  let mut fda_bytes = KVec::new();
> -                UserSlice::new(UserPtr::from_addr(fda_uaddr as _), fds_len)
> +                UserSlice::new(UserPtr::from_addr(fda_uaddr as usize), fds_len)
>                      .read_all(&mut fda_bytes, GFP_KERNEL)?;
>  
>                  if fds_len != fda_bytes.len() {
> @@ -1365,7 +1365,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
>          let write_start = req.write_buffer.wrapping_add(req.write_consumed);
>          let write_len = req.write_size.saturating_sub(req.write_consumed);
>          let mut reader =
> -            UserSlice::new(UserPtr::from_addr(write_start as _), write_len as _).reader();
> +            UserSlice::new(UserPtr::from_addr(write_start as usize), write_len as usize).reader();
>  
>          while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
>              let before = reader.len();
> @@ -1436,7 +1436,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
>          let read_start = req.read_buffer.wrapping_add(req.read_consumed);
>          let read_len = req.read_size.saturating_sub(req.read_consumed);
>          let mut writer = BinderReturnWriter::new(
> -            UserSlice::new(UserPtr::from_addr(read_start as _), read_len as _).writer(),
> +            UserSlice::new(UserPtr::from_addr(read_start as usize), read_len as usize).writer(),
>              self,
>          );
>          let (in_pool, has_transaction, thread_todo, use_proc_queue) = {
> @@ -1500,9 +1500,11 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
>  
>          // Write BR_SPAWN_LOOPER if the process needs more threads for its pool.
>          if has_noop_placeholder && in_pool && self.process.needs_thread() {
> -            let mut writer =
> -                UserSlice::new(UserPtr::from_addr(req.read_buffer as _), req.read_size as _)
> -                    .writer();
> +            let mut writer = UserSlice::new(
> +                UserPtr::from_addr(req.read_buffer as usize),
> +                req.read_size as usize,
> +            )
> +            .writer();
>              writer.write(&BR_SPAWN_LOOPER)?;
>          }
>          Ok(())
> diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
> index 47d5e4d88b07..6edd19461785 100644
> --- a/drivers/android/binder/transaction.rs
> +++ b/drivers/android/binder/transaction.rs
> @@ -402,16 +402,16 @@ fn do_work(
>          let tr = tr_sec.tr_data();
>          if let Some(target_node) = &self.target_node {
>              let (ptr, cookie) = target_node.get_id();
> -            tr.target.ptr = ptr as _;
> -            tr.cookie = cookie as _;
> +            tr.target.ptr = ptr;
> +            tr.cookie = cookie;
>          };
>          tr.code = self.code;
>          tr.flags = self.flags;
> -        tr.data_size = self.data_size as _;
> -        tr.data.ptr.buffer = self.data_address as _;
> -        tr.offsets_size = self.offsets_size as _;
> +        tr.data_size = self.data_size as u64;
> +        tr.data.ptr.buffer = self.data_address as u64;
> +        tr.offsets_size = self.offsets_size as u64;
>          if tr.offsets_size > 0 {
> -            tr.data.ptr.offsets = (self.data_address + ptr_align(self.data_size).unwrap()) as _;
> +            tr.data.ptr.offsets = (self.data_address + ptr_align(self.data_size).unwrap()) as u64;
>          }
>          tr.sender_euid = self.sender_euid.into_uid_in_current_ns();
>          tr.sender_pid = 0;
> 
> -- 
> 2.54.0
> 
