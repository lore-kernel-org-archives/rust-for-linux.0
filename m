Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81D308F36
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972596; cv=none; b=TWbktH/hjtfQtycdlUAmiHIeFiSlk1PQaCtNVcPJC3bGB+p7fBVnXE/Pa9M1NdhmXY46WWILk4atMNZ6zd9cJQQ86DTc2pec1ALk04iPVFvk88M5D+xhl7u59due2p75Kfz2gAzHSsRUBTQ07Hy+WOkGQ+gSnqHQ+Hj9hiYtARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972596; c=relaxed/simple;
	bh=Juf6p1oC/XvJYFJvz3wQCABsLYTGxB+owlVn78COUig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltZI8YN1oxPv1L4DJcS0ceeGHoVtnaX71bzBlGuEhTmlUhcB8RZUmyD2q/uQhFj36kOM5orTnau5iR+9JstLH2s7wuqROSR04ZodnwJuCJRxBC027Xb/xCnqjI6RZTpaa6WRy+P72NSAPb/Jf8ErTPqYqjSzrwsnBPy68uODhA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=byIIEpYi; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="byIIEpYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777972583; x=1778231783;
	bh=wpYGP/9C0H2np1f3GiPuo2co8HN6zgWlCvIWOCekyuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=byIIEpYio5s7hxopW9s7AvTlrDJQNOm09Dakr2HRo4XgKMYGRSzyn6QtaBNg3DhyQ
	 78zENA1wYA0ePzGp9jwVlUwwCiA2de1isjdVKjzcQcHvRIjVFfEZpsETD4SuqsacFk
	 MxfjHh8+c5MrAH2+nF/pNnWd9bSFJladtKZGomPAciyUXOBDWRyOtSwpedT84tHjSr
	 HQlOfd7ASIPRDR4YYbPyhs9NT1tjhVxOFSxLvb2e6lO/or9SsuYpKlJq/pB8fqyUKu
	 zqXWM+5ojbntoDUd7Xwc2/HNb1wMfR1LuGtx/txCbaMkOtdCMGfPT2FZkIEjqllbS3
	 IDVTLtvdYuakA==
X-Pm-Submission-Id: 4g8tDL2L6zz1DDXM
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: boris.brezillon@collabora.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
Date: Tue,  5 May 2026 12:16:12 +0300
Message-ID: <20260505091616.14877-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <afmusSlYdOR2Alvp@google.com>
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev> <afhQzt2VGa-QQYSm@google.com> <20260505060723.11363-1-work@onurozkan.dev> <afmusSlYdOR2Alvp@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 May 2026 08:47:45 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote:=0D
> > On Mon, 04 May 2026 07:54:54 +0000=0D
> > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > =0D
> > > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote:=0D
> > > > Adds Work::disable_sync() as a safe wrapper for disable_work_sync()=
.=0D
> > > > =0D
> > > > Drivers can use this during teardown to stop new queueing and wait =
for=0D
> > > > queued or running work to finish before dropping related resources.=
=0D
> > > > =0D
> > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > > > ---=0D
> > > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++---------=
----=0D
> > > >  1 file changed, 81 insertions(+), 40 deletions(-)=0D
> > > > =0D
> > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > > > index 7e253b6f299c..d0f9b4ba7f27 100644=0D
> > > > --- a/rust/kernel/workqueue.rs=0D
> > > > +++ b/rust/kernel/workqueue.rs=0D
> > > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings=
::workqueue_struct) -> &'a Queue=0D
> > > >  =0D
> > > >      /// Enqueues a work item.=0D
> > > >      ///=0D
> > > > -    /// This may fail if the work item is already enqueued in a wo=
rkqueue.=0D
> > > > +    /// This may fail if the work item is already enqueued in a wo=
rkqueue or disabled.=0D
> > > >      ///=0D
> > > >      /// The work item will be submitted using `WORK_CPU_UNBOUND`.=
=0D
> > > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOut=
put=0D
> > > =0D
> > > Can you elaborate on the case where disable leads to failure here? Ca=
n=0D
> > > you not enqueue a work item again after disabling it? Is there a doc=
=0D
> > > test illustrating this case that I can run for myself to see the=0D
> > > behavior in action?=0D
> > =0D
> > As we discussed on yesterday's call, I looked into cancel_work_sync and=
=0D
> > it seems we can make this work in the tyr reset implementation. We alre=
ady=0D
> > store an atomic reset state, it can be used to prevent future enqueues =
in=0D
> > reset scheduling.=0D
> > =0D
> > I will send a patch for the cancel_sync function soon.=0D
> =0D
> I did hear from Boris that Panthor actually does make use of the disable=
=0D
> feature. =0D
=0D
I don't have any idea what Boris said, perhaps he should write it here as w=
ell.=0D
Maybe Boris said something that isn't covered on the tyr reset yet in my se=
ries,=0D
I don't know.=0D
=0D
What I do know is that I can achieve essentially the same behavior using=0D
cancel_work_sync instead of disable_work_sync on tyr. Like i said there's a=
n=0D
atomic reset state we can use to prevent future work from being enqueued. T=
he=0D
only real difference is that supporting disable_work_sync in the Rust workq=
ueue=0D
would introduce more complexity than supporting cancel_work_sync. There is =
also=0D
the corresponding enable part we have to support if we want to go with=0D
disable_work_sync path.=0D
=0D
	Onur=0D
=0D
> =0D
> What I would probably suggest here is to choose whether you can disable=0D
> a work item based on the pointer type. If using a pointer type where=0D
> enqueue is *already* fallible, we might as well also support disabling=0D
> it.=0D
> =0D
> pub trait SupportsDisable<const ID: u64>: WorkItemPointer { }=0D
> =0D
> unsafe impl<T, const ID: u64> SupportsDisable<ID> for ARef<T>=0D
> where=0D
>     Self: WorkItemPointer<ID>,=0D
>     T: AlwaysRefCounted,=0D
> {=0D
> }=0D
> =0D
> So you can implement the trait as above for ARef and Arc, but not for=0D
> Box.=0D
> =0D
> Then, when you add the method for actually performing a disable, you add=
=0D
> a requirement that the pointer type implements this trait:=0D
> =0D
> /// Disables this work item and waits for queued/running executions to fi=
nish.=0D
> ///=0D
> /// # Note=0D
> ///=0D
> /// Should be called from a sleepable context if the work was last queued=
 on a non-BH=0D
> /// workqueue.=0D
> #[inline]=0D
> pub fn disable_sync(&self)=0D
> where=0D
>     T: WorkItem<ID>,=0D
>     <T as WorkItem<ID>>::Pointer: SupportsDisable<ID>,=0D
> { ... }=0D
> =0D
> This way the pointer type in use determines whether to opt-in to=0D
> exposing the disable bit.=0D
> =0D
> I do not think there is any harm to not exposing `disable_sync()` for=0D
> box, because you can't even call it on an enqueued work item to begin=0D
> with. If it's enqueued, the workqueue has ownership over the box, so you=
=0D
> have no way of obtaining a reference to it, which you would need to call=
=0D
> disable_sync(). So we would only be taking away the ability to call that=
=0D
> method in cases where you *know* the work item is not enqueued anyway.=0D
> =0D
> Alice=0D
