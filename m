Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2640DFD1
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816675; cv=none; b=THdyE4ZtpJGEXv8j07i0CEjUK0t+eiAJwStFSoEbydGmPcFA8oMbLTkxN5FXu7qkql9dk14wV+ocfg5Ihf1MPKwcRJEoY7ikeRQrq1/1Q1lNG1WFcpy6VxvKRfZaP0wmg4ZE0h02JwjyWWw9tD1Ac8LIgDDoSfdKmETA2I6R6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816675; c=relaxed/simple;
	bh=ZRUBIMVyZ4Dfz3mlUw1SU3vSzt3rM+ylpHBbunriLd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEpULRoeYQzL0GSsZ44gqoABYJYl3pwVwYMH/b+27RwLa9TVBNOLgkjaYFmvYx12XnoBkl19WSKmxhy2Mb2Lg8J4KBdyAuYvSEYwNes6zKHeP+blX9WqT7M6FCXi/p4H5HvpOTAu4RMUn/4GVBbTI2ZCjmX1BYlIdKyElATZ2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYFO3ehw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYFO3ehw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AE91F0155E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779816673;
	bh=XyWc9RdceDY66nM6BZK+kw2FeHURC4dhRDdipCNaCMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LYFO3ehwFJxcIGOm2y9bn5iBZtVR7n5f6as3Kc5eLuVFfo+n67/zIsBor6XWiQati
	 2yXLqSPnCI4idjIqBlUjEqGyyVFigIF7CcfQNS1zdXrw74SpuwpPUTFiYQSGdzTNnm
	 zPhmYct2haJLeu/j4Civ8P2oeFrTbbJg0pXeRaCImZqXCD+xL9pTBBQdjvcPDMxs/H
	 dRZ61LHvE0oF4t+BrlDhqMd7AZwwdrFyaowHvYmIV2iFk5J7wFJB0CGNpOZ4sYE6Vj
	 AwGGV1wF+OGxPUf/1aQ+Qmxo1UVLfmI9NQHTqsXgMcDKLH7/r2ywa0Uva8zCwgbGCZ
	 oSMzXaGrSNtsA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3937014be0cso43652081fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 10:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yfnyfMEgirXvM9aipotE+o9+zSGx2Tl6Hd4dXh/wzPGac22UrH3WD+q63jUecsuklZT+NH2uYm7KLrr/gCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3s+tSqVEBBpDwIQdycPzVnRlX8fM6hWVtDFrzX7OvYOqRY4k
	Kd3AcW2BL9JsXE+e/OSLrOJ884i+ApiResFQ5ExNtL9ZhoXZt6jkXtsxziGzwoC9WBt6PqOdal2
	Nl5A7OkG/T+0Vet/BAVT/HFGZgyT7dyg=
X-Received: by 2002:a2e:a994:0:b0:396:28df:1133 with SMTP id
 38308e7fff4ca-39628df1db6mr5381341fa.16.1779816671077; Tue, 26 May 2026
 10:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-5-3d6e9406e864@kernel.org> <ahWVoESBq51yw2oC@google.com>
In-Reply-To: <ahWVoESBq51yw2oC@google.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 19:30:33 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9mw5EDqG=B7h7ANEApmUXfBP=OBW99W0KkDhKjvSddL4w@mail.gmail.com>
X-Gm-Features: AVHnY4KVS3XtPe2gRJ7wDp_Gn0IH6sedBJgEuMSTMnwWmmvkcWWdTvJnAMJ1o08
Message-ID: <CAJ-ks9mw5EDqG=B7h7ANEApmUXfBP=OBW99W0KkDhKjvSddL4w@mail.gmail.com>
Subject: Re: [PATCH 5/6] rust: binder: enable `clippy::as_underscore`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 8:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Fri, May 22, 2026 at 07:12:50PM +0200, Tamir Duberstein wrote:
> > In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
> >
> > > The conversion might include lossy conversion or a dangerous cast tha=
t
> > > might go undetected due to the type being inferred.
> > >
> > > The lint is allowed by default as using `_` is less wordy than always
> > > specifying the type.
> >
> > Always specifying the type is especially helpful in function call
> > contexts where the inferred type may change at a distance. Specifying
> > the type also allows Clippy to spot more cases of `useless_conversion`.
> >
> > While this does not eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize. It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint in the Binder Rust driver -- no functional
> > change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_unde=
rscore [1]
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  drivers/android/binder/allocation.rs       |  4 ++--
> >  drivers/android/binder/defs.rs             |  2 +-
> >  drivers/android/binder/node.rs             | 10 +++++-----
> >  drivers/android/binder/node/wrapper.rs     |  2 +-
> >  drivers/android/binder/process.rs          |  6 +++---
> >  drivers/android/binder/rust_binder_main.rs |  4 ++--
> >  drivers/android/binder/thread.rs           | 24 +++++++++++++---------=
--
> >  drivers/android/binder/transaction.rs      | 12 ++++++------
> >  8 files changed, 33 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/android/binder/allocation.rs b/drivers/android/bin=
der/allocation.rs
> > index 0cab959e4b7e..4ac42bb7216b 100644
> > --- a/drivers/android/binder/allocation.rs
> > +++ b/drivers/android/binder/allocation.rs
> > @@ -376,8 +376,8 @@ pub(crate) fn transfer_binder_object(
> >                  BINDER_TYPE_WEAK_BINDER
> >              };
> >              newobj.flags =3D obj.flags;
> > -            newobj.__bindgen_anon_1.binder =3D ptr as _;
> > -            newobj.cookie =3D cookie as _;
> > +            newobj.__bindgen_anon_1.binder =3D ptr;
> > +            newobj.cookie =3D cookie;
>
> Are you sure these casts are unnecessary on all platforms?
>
> >              self.write(offset, &newobj)?;
> >              // Increment the user ref count on the node. It will be de=
cremented as part of the
> >              // destruction of the buffer, when we see a binder or weak=
-binder object.
> > diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/de=
fs.rs
> > index fd0ef3f9ebd1..a9682eb6d984 100644
> > --- a/drivers/android/binder/defs.rs
> > +++ b/drivers/android/binder/defs.rs
> > @@ -146,7 +146,7 @@ fn default() -> Self {
> >  impl BinderVersion {
> >      pub(crate) fn current() -> Self {
> >          Self(MaybeUninit::new(uapi::binder_version {
> > -            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as _,
> > +            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as i32,
>
> Are you sure i32 is the right type on all platforms?

Yes, this is __s32 in C.

>
> >          }))
> >      }
> >  }
> > diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/no=
de.rs
> > index a4a3ddda6ac9..8f5307c03b1a 100644
> > --- a/drivers/android/binder/node.rs
> > +++ b/drivers/android/binder/node.rs
> > @@ -464,7 +464,7 @@ pub(crate) fn incr_refcount_allow_zero2one_with_wra=
pper(
> >          owner_inner: &mut ProcessInner,
> >      ) -> Option<DLArc<dyn DeliverToRead>> {
> >          match self.incr_refcount_allow_zero2one(strong, owner_inner) {
> > -            Ok(Some(node)) =3D> Some(node as _),
> > +            Ok(Some(node)) =3D> Some(node as DLArc<dyn DeliverToRead>)=
,
> >              Ok(None) =3D> None,
> >              Err(CouldNotDeliverCriticalIncrement) =3D> {
> >                  assert!(strong);
> > @@ -489,8 +489,8 @@ pub(crate) fn populate_counts(
> >          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
> >      ) {
> >          let inner =3D self.inner.access(guard);
> > -        out.strong_count =3D inner.strong.count as _;
> > -        out.weak_count =3D inner.weak.count as _;
> > +        out.strong_count =3D inner.strong.count as u32;
> > +        out.weak_count =3D inner.weak.count as u32;
>
> Are you sure u32 is the right type on all platforms?

Yes, these fields are __u32 in C.

>
> >      }
> >
> >      pub(crate) fn populate_debug_info(
> > @@ -498,8 +498,8 @@ pub(crate) fn populate_debug_info(
> >          out: &mut BinderNodeDebugInfo,
> >          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
> >      ) {
> > -        out.ptr =3D self.ptr as _;
> > -        out.cookie =3D self.cookie as _;
> > +        out.ptr =3D self.ptr;
> > +        out.cookie =3D self.cookie;
> >          let inner =3D self.inner.access(guard);
> >          if inner.strong.has_count {
> >              out.has_strong_ref =3D 1;
> > diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/b=
inder/node/wrapper.rs
> > index 43294c050502..6e4ca01c941a 100644
> > --- a/drivers/android/binder/node/wrapper.rs
> > +++ b/drivers/android/binder/node/wrapper.rs
> > @@ -21,7 +21,7 @@ pub(crate) fn new() -> Result<Self> {
> >
> >      pub(super) fn init(self, node: DArc<Node>) -> DLArc<dyn DeliverToR=
ead> {
> >          match self.inner.pin_init_with(DTRWrap::new(NodeWrapper { node=
 })) {
> > -            Ok(initialized) =3D> ListArc::from(initialized) as _,
> > +            Ok(initialized) =3D> ListArc::from(initialized) as DLArc<d=
yn DeliverToRead>,
> >              Err(err) =3D> match err {},
> >          }
> >      }
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder=
/process.rs
> > index 820cbd541435..3a22260eb9b4 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -259,7 +259,7 @@ pub(crate) fn new_node_ref_with_thread(
> >          let push =3D match wrapper {
> >              None =3D> node
> >                  .incr_refcount_allow_zero2one(strong, self)?
> > -                .map(|node| node as _),
> > +                .map(|node| node as DLArc<dyn DeliverToRead>),
> >              Some(wrapper) =3D> node.incr_refcount_allow_zero2one_with_=
wrapper(strong, wrapper, self),
> >          };
> >          if let Some(node) =3D push {
> > @@ -741,7 +741,7 @@ fn set_as_manager(
> >          } else {
> >              (0, 0, 0)
> >          };
> > -        let node_ref =3D self.get_node(ptr, cookie, flags as _, true, =
thread)?;
> > +        let node_ref =3D self.get_node(ptr, cookie, flags, true, threa=
d)?;
>
> Are you sure there are no platforms that require a cast here?
>
> >          let node =3D node_ref.node.clone();
> >          self.ctx.set_manager_node(node_ref)?;
> >          self.inner.lock().is_manager =3D true;
> > @@ -1517,7 +1517,7 @@ fn get_frozen_status(data: UserSlice) -> Result {
> >
> >      for ctx in crate::context::get_all_contexts()? {
> >          ctx.for_each_proc(|proc| {
> > -            if proc.task.pid() =3D=3D info.pid as _ {
> > +            if proc.task.pid() =3D=3D info.pid as i32 {
>
> Should use the Pid type alias.

Agreed, fixed in the next spin.

>
> >                  found =3D true;
> >                  let inner =3D proc.inner.lock();
> >                  let txns_pending =3D inner.txns_pending_locked();
> > diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/andro=
id/binder/rust_binder_main.rs
> > index 88da29413e16..2c10a8cd3d88 100644
> > --- a/drivers/android/binder/rust_binder_main.rs
> > +++ b/drivers/android/binder/rust_binder_main.rs
> > @@ -6,7 +6,7 @@
> >
> >  #![crate_name =3D "rust_binder"]
> >  #![recursion_limit =3D "256"]
> > -#![allow(clippy::as_underscore, clippy::cast_lossless)]
> > +#![allow(clippy::cast_lossless)]
> >
> >  use kernel::{
> >      bindings::{self, seq_file},
> > @@ -412,7 +412,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
> >      // SAFETY: We previously set `private_data` in `rust_binder_open`.
> >      let f =3D unsafe { Arc::<Process>::borrow((*file).private_data) };
> >      // SAFETY: The caller ensures that the file is valid.
> > -    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd =
as _, arg as _) {
> > +    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd,=
 arg) {
>
> Several more cases below where it's unclear whether these changes are
> correct on all platforms including 32-bit targets.

Restored a few instances of cast-to-typedef below on the next spin.

>
> >          Ok(()) =3D> 0,
> >          Err(err) =3D> err.to_errno() as isize,
> >      }
> > diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/=
thread.rs
> > index 97d5f31e8fe3..87298a8c597d 100644
> > --- a/drivers/android/binder/thread.rs
> > +++ b/drivers/android/binder/thread.rs
> > @@ -666,9 +666,9 @@ fn translate_object(
> >                  let strong =3D obj.hdr.type_ =3D=3D BINDER_TYPE_BINDER=
;
> >                  // SAFETY: `binder` is a `binder_uintptr_t`; any bit p=
attern is a valid
> >                  // representation.
> > -                let ptr =3D unsafe { obj.__bindgen_anon_1.binder } as =
_;
> > -                let cookie =3D obj.cookie as _;
> > -                let flags =3D obj.flags as _;
> > +                let ptr =3D unsafe { obj.__bindgen_anon_1.binder };
> > +                let cookie =3D obj.cookie;
> > +                let flags =3D obj.flags;
> >                  let node =3D self
> >                      .process
> >                      .as_arc_borrow()
> > @@ -679,7 +679,7 @@ fn translate_object(
> >              BinderObjectRef::Handle(obj) =3D> {
> >                  let strong =3D obj.hdr.type_ =3D=3D BINDER_TYPE_HANDLE=
;
> >                  // SAFETY: `handle` is a `u32`; any bit pattern is a v=
alid representation.
> > -                let handle =3D unsafe { obj.__bindgen_anon_1.handle } =
as _;
> > +                let handle =3D unsafe { obj.__bindgen_anon_1.handle };
> >                  let node =3D self.process.get_node_from_handle(handle,=
 strong)?;
> >                  security::binder_transfer_binder(&self.process.cred, &=
view.alloc.process.cred)?;
> >                  view.transfer_binder_object(offset, obj, strong, node)=
?;
> > @@ -736,7 +736,7 @@ fn translate_object(
> >                      ScatterGatherEntry {
> >                          obj_index,
> >                          offset: alloc_offset,
> > -                        sender_uaddr: obj.buffer as _,
> > +                        sender_uaddr: obj.buffer as usize,
> >                          length: obj_length,
> >                          pointer_fixups: KVec::new(),
> >                          fixup_min_offset: 0,
> > @@ -843,7 +843,7 @@ fn translate_object(
> >                      .ok_or(EINVAL)?;
> >
> >                  let mut fda_bytes =3D KVec::new();
> > -                UserSlice::new(UserPtr::from_addr(fda_uaddr as _), fds=
_len)
> > +                UserSlice::new(UserPtr::from_addr(fda_uaddr as usize),=
 fds_len)
> >                      .read_all(&mut fda_bytes, GFP_KERNEL)?;
> >
> >                  if fds_len !=3D fda_bytes.len() {
> > @@ -1365,7 +1365,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteR=
ead) -> Result {
> >          let write_start =3D req.write_buffer.wrapping_add(req.write_co=
nsumed);
> >          let write_len =3D req.write_size.saturating_sub(req.write_cons=
umed);
> >          let mut reader =3D
> > -            UserSlice::new(UserPtr::from_addr(write_start as _), write=
_len as _).reader();
> > +            UserSlice::new(UserPtr::from_addr(write_start as usize), w=
rite_len as usize).reader();
> >
> >          while reader.len() >=3D size_of::<u32>() && self.inner.lock().=
return_work.is_unused() {
> >              let before =3D reader.len();
> > @@ -1436,7 +1436,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRe=
ad, wait: bool) -> Result {
> >          let read_start =3D req.read_buffer.wrapping_add(req.read_consu=
med);
> >          let read_len =3D req.read_size.saturating_sub(req.read_consume=
d);
> >          let mut writer =3D BinderReturnWriter::new(
> > -            UserSlice::new(UserPtr::from_addr(read_start as _), read_l=
en as _).writer(),
> > +            UserSlice::new(UserPtr::from_addr(read_start as usize), re=
ad_len as usize).writer(),
> >              self,
> >          );
> >          let (in_pool, has_transaction, thread_todo, use_proc_queue) =
=3D {
> > @@ -1500,9 +1500,11 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteR=
ead, wait: bool) -> Result {
> >
> >          // Write BR_SPAWN_LOOPER if the process needs more threads for=
 its pool.
> >          if has_noop_placeholder && in_pool && self.process.needs_threa=
d() {
> > -            let mut writer =3D
> > -                UserSlice::new(UserPtr::from_addr(req.read_buffer as _=
), req.read_size as _)
> > -                    .writer();
> > +            let mut writer =3D UserSlice::new(
> > +                UserPtr::from_addr(req.read_buffer as usize),
> > +                req.read_size as usize,
> > +            )
> > +            .writer();
> >              writer.write(&BR_SPAWN_LOOPER)?;
> >          }
> >          Ok(())
> > diff --git a/drivers/android/binder/transaction.rs b/drivers/android/bi=
nder/transaction.rs
> > index 47d5e4d88b07..6edd19461785 100644
> > --- a/drivers/android/binder/transaction.rs
> > +++ b/drivers/android/binder/transaction.rs
> > @@ -402,16 +402,16 @@ fn do_work(
> >          let tr =3D tr_sec.tr_data();
> >          if let Some(target_node) =3D &self.target_node {
> >              let (ptr, cookie) =3D target_node.get_id();
> > -            tr.target.ptr =3D ptr as _;
> > -            tr.cookie =3D cookie as _;
> > +            tr.target.ptr =3D ptr;
> > +            tr.cookie =3D cookie;
> >          };
> >          tr.code =3D self.code;
> >          tr.flags =3D self.flags;
> > -        tr.data_size =3D self.data_size as _;
> > -        tr.data.ptr.buffer =3D self.data_address as _;
> > -        tr.offsets_size =3D self.offsets_size as _;
> > +        tr.data_size =3D self.data_size as u64;
> > +        tr.data.ptr.buffer =3D self.data_address as u64;
> > +        tr.offsets_size =3D self.offsets_size as u64;
> >          if tr.offsets_size > 0 {
> > -            tr.data.ptr.offsets =3D (self.data_address + ptr_align(sel=
f.data_size).unwrap()) as _;
> > +            tr.data.ptr.offsets =3D (self.data_address + ptr_align(sel=
f.data_size).unwrap()) as u64;
> >          }
> >          tr.sender_euid =3D self.sender_euid.into_uid_in_current_ns();
> >          tr.sender_pid =3D 0;
> >
> > --
> > 2.54.0
> >

Thanks for the review!
