Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8EB3F7A88
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379636; cv=none; b=Y8fTf29Oi15sMjQ8b+4hUt7j4aA+QwFNeiEM7UDMr73TCGhUqDcyvp3zrJsaBPDvP6NMb1IfFyfQEELRM3N95FP8gkNHC0ea1+4tfJ+s8YOGUGmWaSeSthlhD4ZFasXPscZSRjaqA+b4IC59ALIJgHHksjY4vkpDW/zUAsoQ2Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379636; c=relaxed/simple;
	bh=rctagEXMGhHTFcR2W4wBB4syjxkOoLJBQmvbQARiZUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kd6hA7agZ0Kgaur5U+SCyum4ynVzPWWgphKBJYMGP8ikQG/zYv0piC6s4JziXlWzBaDu3wXX6lg+c+G4sM3J4j78gUk1sa7doejmoQi3dOl0u4YxV1YwSdSAnoXG2+Ew4BVmbjHYwe0PoaSIzYjfVItrTqQJEmhWVEzQVUavTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HuSI123p; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HuSI123p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777379620; x=1777638820;
	bh=LeB0qUkDekcPNJxPBdZyb0NOKxF854O0tpwMhFF8/V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HuSI123pIW2SuebTAMh89fHxeJsgU4q4nA9G/cmIczZLw2/J8F+mjiEyHUnfeB2A6
	 o6tqvAY6u6b6w1rWm+k9NPvaW7CA7trWFBBs+uY3rTFLIJFCWfsZKp7P/TnG9KaviP
	 T0nnsGFxhYzMLeHXRti6thG0eNV2v1Bp2DYs6EEccIT6cVDTObl9qyNUQEZh/Ly/hz
	 iBATFRLfORJ38JzYao5Q6NJLzBOIlPPVIA666fk4lcu/Gj5FeTmDeM/oap4g363Dzg
	 gvDFcxolFhnH8yJjsyD5jLUpiilKXk9sPA2RJ7KzT4ZiAha1C+i8/BNsUKvwhRla+k
	 6PcVjENRkTNsA==
X-Pm-Submission-Id: 4g4fxB32k9z2Scd9
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org
Subject: Re: [PATCH v1 1/1] rust: add Work::disable_sync
Date: Tue, 28 Apr 2026 15:33:30 +0300
Message-ID: <20260428123332.6452-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DI4REWE5KN40.34QG65YUYOJPZ@garyguo.net>
References: <20260428104459.174602-1-work@onurozkan.dev> <20260428104459.174602-2-work@onurozkan.dev> <DI4REWE5KN40.34QG65YUYOJPZ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Apr 2026 12:42:59 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Tue Apr 28, 2026 at 11:44 AM BST, Onur =C3=96zkan wrote:=0D
> > Adds Work::disable_sync() as a safe wrapper for disable_work_sync().=0D
> >=0D
> > Drivers can use this during teardown to stop new queueing and wait for=
=0D
> > queued or running work to finish before dropping related resources.=0D
> >=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/workqueue.rs | 102 +++++++++++++++++++++++++++++----------=
=0D
> >  1 file changed, 76 insertions(+), 26 deletions(-)=0D
> >=0D
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > index 7e253b6f299c..443fc84dbeeb 100644=0D
> > --- a/rust/kernel/workqueue.rs=0D
> > +++ b/rust/kernel/workqueue.rs=0D
> > @@ -442,21 +442,48 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64=
>: RawWorkItem<ID> {}=0D
> >  ///=0D
> >  /// # Safety=0D
> >  ///=0D
> > -/// Implementers must ensure that [`__enqueue`] uses a `work_struct` i=
nitialized with the [`run`]=0D
> > -/// method of this trait as the function pointer.=0D
> > -///=0D
> > -/// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > -/// [`run`]: WorkItemPointer::run=0D
> > -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {=0D
> > +/// Implementers must ensure that [`WorkItemPointer::from_raw_work`] r=
ebuilds the exact ownership=0D
> > +/// transferred by a successful [`RawWorkItem::__enqueue`] call.=0D
> > +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Siz=
ed {=0D
> > +    /// The work item type containing the embedded `work_struct`.=0D
> > +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;=0D
> > +=0D
> > +    /// Rebuild this work item's pointer from its embedded `work_struc=
t`.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The provided `work_struct` pointer must originate from a previ=
ous call to=0D
> > +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure r=
eturned true=0D
> > +    /// and the pointer must still be valid.=0D
> > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;=
=0D
> > +=0D
> >      /// Run this work item.=0D
> >      ///=0D
> >      /// # Safety=0D
> >      ///=0D
> > -    /// The provided `work_struct` pointer must originate from a previ=
ous call to [`__enqueue`]=0D
> > -    /// where the `queue_work_on` closure returned true, and the point=
er must still be valid.=0D
> > +    /// The provided `work_struct` pointer must satisfy the same requi=
rements as=0D
> > +    /// [`WorkItemPointer::from_raw_work`].=0D
> > +    #[inline]=0D
> > +    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
> > +        <Self::Item as WorkItem<ID>>::run(=0D
> > +            // SAFETY: The requirements for `run` are exactly those of=
 `from_raw_work`.=0D
> > +            unsafe { Self::from_raw_work(ptr) },=0D
> > +        );=0D
> > +    }=0D
> > +=0D
> > +    /// Reclaim a previously enqueued work item that will no longer ru=
n.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> >      ///=0D
> > -    /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);=0D
> > +    /// The provided `work_struct` pointer must satisfy the same requi=
rements as=0D
> > +    /// [`WorkItemPointer::from_raw_work`].=0D
> > +    #[inline]=0D
> > +    unsafe fn cancel(ptr: *mut bindings::work_struct) {=0D
> > +        drop(=0D
> > +            // SAFETY: The requirements for `cancel` are exactly those=
 of `from_raw_work`.=0D
> > +            unsafe { Self::from_raw_work(ptr) },=0D
> > +        );=0D
> > +    }=0D
> >  }=0D
> >  =0D
> >  /// Defines the method that should be called when this work item is ex=
ecuted.=0D
> > @@ -537,6 +564,29 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bi=
ndings::work_struct {=0D
> >          // the compiler does not complain that the `work` field is unu=
sed.=0D
> >          unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }=
=0D
> >      }=0D
> > +=0D
> > +    /// Disables this work item and waits for queued/running execution=
s to finish.=0D
> > +    ///=0D
> > +    /// # Note=0D
> > +    ///=0D
> > +    /// Should be called from a sleepable context if the work was last=
 queued on a non-BH=0D
> > +    /// workqueue.=0D
> > +    #[inline]=0D
> > +    pub fn disable_sync(&self)=0D
> > +    where=0D
> > +        T: WorkItem<ID>,=0D
> > +    {=0D
> > +        let ptr: *const Self =3D self;=0D
> > +        // SAFETY: `self` points to a valid initialized work.=0D
> > +        let raw_work =3D unsafe { Self::raw_get(ptr) };=0D
> > +        // SAFETY: `raw_work` is a valid embedded `work_struct`.=0D
> > +        if unsafe { bindings::disable_work_sync(raw_work) } {=0D
> > +            // SAFETY: A `true` return means the work was pending and =
got canceled, so the queued=0D
> > +            // ownership transfer performed by `__enqueue` must be rec=
laimed here and the work=0D
> > +            // item will not subsequently run.=0D
> > +            unsafe { T::Pointer::cancel(raw_work) };=0D
> =0D
> I think have an explicit drop is clearer and remove the need of additiona=
l=0D
> function in the trait.=0D
> =0D
>     // SAFETY: A `true` return means the work was pending and got cancele=
d, so the queued=0D
>     // ownership transfer performed by `__enqueue` is reclaimed here.=0D
>     drop(unsafe { T::Pointer::from_raw_work(ptr) })=0D
> =0D
> The `cancel` name is confusing because this is called *after* the work ha=
s=0D
> already been cancelled.=0D
=0D
Makes sense.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Best,=0D
> Gary=0D
> =0D
> > +        }=0D
> > +    }=0D
> >  }=0D
> >  =0D
> >  /// Declares that a type contains a [`Work<T, ID>`].=0D
> > @@ -817,22 +867,22 @@ unsafe fn work_container_of(=0D
> >  //   - `Work::new` makes sure that `T::Pointer::run` is passed to `ini=
t_work_with_key`.=0D
> >  //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Wo=
rk` field=0D
> >  //     will be used because of the ID const generic bound. This makes =
sure that `T::raw_get_work`=0D
> > -//     uses the correct offset for the `Work` field, and `Work::new` p=
icks the correct=0D
> > -//     implementation of `WorkItemPointer` for `Arc<T>`.=0D
> > +//     uses the correct offset for the `Work` field, and `T::Pointer::=
from_raw_work` rebuilds the=0D
> > +//     correct pointer type for `Arc<T>`.=0D
> >  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>=0D
> >  where=0D
> >      T: WorkItem<ID, Pointer =3D Self>,=0D
> >      T: HasWork<T, ID>,=0D
> >  {=0D
> > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
> > +    type Item =3D T;=0D
> > +=0D
> > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {=
=0D
> >          // The `__enqueue` method always uses a `work_struct` stored i=
n a `Work<T, ID>`.=0D
> >          let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> >          // SAFETY: This computes the pointer that `__enqueue` got from=
 `Arc::into_raw`.=0D
> >          let ptr =3D unsafe { T::work_container_of(ptr) };=0D
> >          // SAFETY: This pointer comes from `Arc::into_raw` and we've b=
een given back ownership.=0D
> > -        let arc =3D unsafe { Arc::from_raw(ptr) };=0D
> > -=0D
> > -        T::run(arc)=0D
> > +        unsafe { Arc::from_raw(ptr) }=0D
> >      }=0D
> >  }=0D
> >  =0D
> > @@ -887,7 +937,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> f=
or Pin<KBox<T>>=0D
> >      T: WorkItem<ID, Pointer =3D Self>,=0D
> >      T: HasWork<T, ID>,=0D
> >  {=0D
> > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
> > +    type Item =3D T;=0D
> > +=0D
> > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {=
=0D
> >          // The `__enqueue` method always uses a `work_struct` stored i=
n a `Work<T, ID>`.=0D
> >          let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> >          // SAFETY: This computes the pointer that `__enqueue` got from=
 `Arc::into_raw`.=0D
> > @@ -895,9 +947,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> f=
or Pin<KBox<T>>=0D
> >          // SAFETY: This pointer comes from `Arc::into_raw` and we've b=
een given back ownership.=0D
> >          let boxed =3D unsafe { KBox::from_raw(ptr) };=0D
> >          // SAFETY: The box was already pinned when it was enqueued.=0D
> > -        let pinned =3D unsafe { Pin::new_unchecked(boxed) };=0D
> > -=0D
> > -        T::run(pinned)=0D
> > +        unsafe { Pin::new_unchecked(boxed) }=0D
> >      }=0D
> >  }=0D
> >  =0D
> > @@ -950,15 +1000,17 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem=
<ID> for Pin<KBox<T>>=0D
> >  //   - `Work::new` makes sure that `T::Pointer::run` is passed to `ini=
t_work_with_key`.=0D
> >  //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Wo=
rk` field=0D
> >  //     will be used because of the ID const generic bound. This makes =
sure that `T::raw_get_work`=0D
> > -//     uses the correct offset for the `Work` field, and `Work::new` p=
icks the correct=0D
> > -//     implementation of `WorkItemPointer` for `ARef<T>`.=0D
> > +//     uses the correct offset for the `Work` field, and `T::Pointer::=
from_raw_work` rebuilds the=0D
> > +//     correct pointer type for `ARef<T>`.=0D
> >  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>=0D
> >  where=0D
> >      T: AlwaysRefCounted,=0D
> >      T: WorkItem<ID, Pointer =3D Self>,=0D
> >      T: HasWork<T, ID>,=0D
> >  {=0D
> > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
> > +    type Item =3D T;=0D
> > +=0D
> > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {=
=0D
> >          // The `__enqueue` method always uses a `work_struct` stored i=
n a `Work<T, ID>`.=0D
> >          let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> >  =0D
> > @@ -972,9 +1024,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> =
for ARef<T>=0D
> >  =0D
> >          // SAFETY: This pointer comes from `ARef::into_raw` and we've =
been given=0D
> >          // back ownership.=0D
> > -        let aref =3D unsafe { ARef::from_raw(ptr) };=0D
> > -=0D
> > -        T::run(aref)=0D
> > +        unsafe { ARef::from_raw(ptr) }=0D
> >      }=0D
> >  }=0D
> >  =0D
> =0D
