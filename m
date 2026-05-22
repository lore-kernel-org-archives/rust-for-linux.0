Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E263E8C62
	for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449994; cv=none; b=R4vqPvsPZYmK6EbKBOujmvHRgIsumDQtht2kzHtNvilfaVe9dGGEZH0KY02+YLB5i5aC4QpQf9zUsMBZ1EdjQK8raLFPfskPfrmhz8deWmJznj3IW7jg8SUSUypzI1Dzgb8XjA6cV/mXczG/5IMzRmhg4i9Bqy0QzKXhucrXzGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449994; c=relaxed/simple;
	bh=vHWMXK5SlKKZ51yKQ6JHGthlBIZvge4fmcB9/zKkjJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCKfqJEoq5d69qDHwC6FubXLaZB0w/OZaWPgf+FX0FTewCULPXWwPKVKl2VI7ZLlT5F1LrONiW3BYAn+joWVFkgPeCLA1NsLmMMQgcWBa8jQpHJpgjCoHUPks9vHMAD1/ahvDbgRC0gH8moff+dzPL721OpaVugd2JipwasC/g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=nIBUBBYg; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="nIBUBBYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779449985; x=1779709185;
	bh=cs3ThgWAWKy3cqkvsm32YDeWTvNGw47wNSO0Ts9Q0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nIBUBBYgnkWCX8zMGkQgWhijXSDsZDrbD+uO2r1MVMmBx0FbytTphqAVJCfkFuKu5
	 R8W1uL+lHeeyuQ2TDiiq1a3HrFNhHTw29FRVyzyo6YpdE0F4HquPjxyxvzNLFO85Tk
	 2lv/i8Wvi4JkUS2uaNTDaCQElaSU9NvaABhfxCMtcpr2PJG9+jV4DQqywnVBEiBhoC
	 DjkFMvAiqTsD8F8Rn7YZvR8Azqt6RUNZGe9PiflYzinuQDeGUwMk+yR+88J36N0cke
	 pQiIt1aJj9ax54dbqKMI++lUceflTG0KCKU4wQIqZE+feYSkYVjdF0QJUro0vRXznN
	 lGeSCMgZExKhw==
X-Pm-Submission-Id: 4gMNbx1qfLz2Scpx
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org
Subject: Re: [PATCH v1] rust: workqueue: add cancel_sync support
Date: Fri, 22 May 2026 14:39:38 +0300
Message-ID: <20260522113940.32083-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <agQpWlE_VYHtgzYi@google.com>
References: <20260510082211.207450-1-work@onurozkan.dev> <agCLn6ebK9wERK-q@google.com> <20260510155311.7692-1-work@onurozkan.dev> <agQpWlE_VYHtgzYi@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2026 07:33:46 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Sun, May 10, 2026 at 06:53:10PM +0300, Onur =C3=96zkan wrote:=0D
> > On Sun, 10 May 2026 13:43:59 +0000=0D
> > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > =0D
> > > On Sun, May 10, 2026 at 11:21:57AM +0300, Onur =C3=96zkan wrote:=0D
> > > > Drivers can use this during teardown to cancel pending work and wai=
t for=0D
> > > > running work to finish before dropping related resources.=0D
> > > > =0D
> > > > This is not implemented for Pin<KBox<T>> because queuing a boxed wo=
rk=0D
> > > > item transfers ownership of the box to the workqueue. There is ther=
efore=0D
> > > > no separate safe owner that can cancel the boxed work while it is p=
ending.=0D
> > > > =0D
> > > > The immediate motivation is the Tyr reset infrastructure [1], which=
 needs=0D
> > > > to cancel pending reset work and wait for any running reset work du=
ring=0D
> > > > teardown before dropping the resources used by that work.=0D
> > > > =0D
> > > > [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onuro=
zkan.dev=0D
> > > > =0D
> > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > > > ---=0D
> > > >  rust/kernel/workqueue.rs | 134 ++++++++++++++++++++++++++++++++---=
----=0D
> > > >  1 file changed, 112 insertions(+), 22 deletions(-)=0D
> > > > =0D
> > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > > > index 7e253b6f299c..a10daa2763ac 100644=0D
> > > > --- a/rust/kernel/workqueue.rs=0D
> > > > +++ b/rust/kernel/workqueue.rs=0D
> > > > @@ -442,23 +442,44 @@ pub unsafe trait RawDelayedWorkItem<const ID:=
 u64>: RawWorkItem<ID> {}=0D
> > > >  ///=0D
> > > >  /// # Safety=0D
> > > >  ///=0D
> > > > -/// Implementers must ensure that [`__enqueue`] uses a `work_struc=
t` initialized with the [`run`]=0D
> > > > -/// method of this trait as the function pointer.=0D
> > > > +/// Implementers must ensure that [`__enqueue`] uses a `work_struc=
t` initialized with [`run`] as=0D
> > > > +/// its function pointer, and that [`from_raw_work`] rebuilds the =
exact ownership transferred by=0D
> > > > +/// a successful [`__enqueue`] call.=0D
> > > >  ///=0D
> > > >  /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > > > +/// [`from_raw_work`]: WorkItemPointer::from_raw_work=0D
> > > >  /// [`run`]: WorkItemPointer::run=0D
> > > > -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {=
=0D
> > > > -    /// Run this work item.=0D
> > > > +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> +=
 Sized {=0D
> > > > +    /// The work item type containing the embedded `work_struct`.=
=0D
> > > > +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;=0D
> > > > +=0D
> > > > +    /// Rebuild this work item's pointer from its embedded `work_s=
truct`.=0D
> > > >      ///=0D
> > > >      /// # Safety=0D
> > > >      ///=0D
> > > > -    /// The provided `work_struct` pointer must originate from a p=
revious call to [`__enqueue`]=0D
> > > > -    /// where the `queue_work_on` closure returned true, and the p=
ointer must still be valid.=0D
> > > > +    /// The provided `work_struct` pointer must originate from a p=
revious call to=0D
> > > > +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closu=
re returned true=0D
> > > > +    /// and the pointer must still be valid.=0D
> > > > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Se=
lf;=0D
> > > > +=0D
> > > > +    /// Run this work item.=0D
> > > >      ///=0D
> > > > -    /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > > > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);=0D
> > > > +    /// # Safety=0D
> > > > +    ///=0D
> > > > +    /// The provided `work_struct` pointer must satisfy the same r=
equirements as=0D
> > > > +    /// [`WorkItemPointer::from_raw_work`].=0D
> > > > +    #[inline]=0D
> > > > +    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
> > > > +        <Self::Item as WorkItem<ID>>::run(=0D
> > > > +            // SAFETY: The requirements for `run` are exactly thos=
e of `from_raw_work`.=0D
> > > > +            unsafe { Self::from_raw_work(ptr) },=0D
> > > > +        );=0D
> > > > +    }=0D
> > > >  }=0D
> > > >  =0D
> > > > +/// Marker for work item types that support cancellation.=0D
> > > > +pub trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> {=
}=0D
> > > =0D
> > > Shouldn't 'from_raw_work()' be a method on SupportsCancelling instead=
?=0D
> > =0D
> > Not necessarily. I wanted to keep it like that because it removes a bit=
 of=0D
> > duplication and makes run() simpler. It's also more extensible e.g. can=
 be=0D
> > used for disable_sync too if needed in the future.=0D
> =0D
> It still seems wrong to me because you are forcing all pointer types to=0D
> provide from_raw_work() even though not all pointer types needs it.=0D
=0D
I know, that's the trade-off. I wanted to make run() simpler but I don't ha=
ve=0D
strong feelings either way. IMO it's not even worth discussing this. I can=
=0D
change it and send a v2 right away, not a big deal.=0D
=0D
Onur=0D
=0D
> =0D
> As for disable_sync(), I think for that case we'd want three traits:=0D
> =0D
> 1. WorkItemPointer, defines run()=0D
> 2. CancelableWorkItemPtr: WorkItemPointer, defines from_raw_work()=0D
> 3. DisablableWorkItemPtr: CancelableWorkItemPtr, no methods=0D
> =0D
> Alice=0D
