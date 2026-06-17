Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62473BA24F;
	Wed, 17 Jun 2026 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702549; cv=none; b=NpD4tRAcThpiEpkZJdsXgWfM9VUpD3BjEaOd/OuU5+s+/PnDGS/5WcOI8IhVBM2aTMIH+Yw23WVu9DRfoTPsWYTvKmllfEIRpCyaUuPqhJ5GjgxO5YxiBEoxGLgtPXClIrSFsxg+C2w+GsPrY4QPn6cowNz7IuqVoU/U2D8kKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702549; c=relaxed/simple;
	bh=3r6CKgn8nyTZvic3iG0g5qUJxE8vhV2v54VQLPTUFL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyFlZt2fKwdfaBXWomMnycuCf4qc5BdR1fC3bL4i1reM+kqK2HP3WrLxQdchLsLnXy8NGfhM/aQ6ZHMRx+dmmxdA+nsNnc+OVX+VN3XRCiG6TpG3ZTDCWOsRh1sxfrjx0QQQ60Br+ICWqTAigAGevBTDb9WwCCM71pA44mNlzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=r5aalIJY; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="r5aalIJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781702530; x=1781961730;
	bh=e8hgekmsRFbjPafdz60ovJVJ2wuE+3tlFSNeFk10NkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r5aalIJYRzcc5l/3wdfHUovMx6awiH8Fyszz3q4FBpaN23dmingxd4BIcsIJE1f4F
	 milye4gZkI5hVaeKATBZy4IASnKErmthzcWVLY0b7DsCTREs4mdGBoNke7tWS/S5x6
	 ac+7FDqkzLXOvai6sVqrC9aAzGMPqwWjj2ItbEL940VdsylEHi4H6dz1KkCnh8biWy
	 pByvb1i6RPIm4w2EACivrhYRHY6Zx3op8ILtE+AtBgTic2fBk3d4wjADR+PvGv0HQs
	 Bt2LwMX9rs3fgimj/mhFQhdWJHhxX6f2fSytNYg01XMg4LeFlrmnXeZfREwmgxtfe+
	 eHBeB3wnB3Alw==
X-Pm-Submission-Id: 4ggPf86ndVz1DF7v
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	tj@kernel.org,
	jiangshanlai@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v1] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Wed, 17 Jun 2026 16:21:39 +0300
Message-ID: <20260617132202.148411-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DJBCL55WD43F.3VZBBK04AU3F1@kernel.org>
References: <20260615115626.871457-1-work@onurozkan.dev> <DJBCL55WD43F.3VZBBK04AU3F1@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jun 2026 15:10:30 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> On Mon Jun 15, 2026 at 1:56 PM CEST, Onur =C3=96zkan wrote:=0D
> > Add a workqueue wrapper for work items that are not 'static.=0D
> >=0D
> > Tyr reset work is queued from a handle that owns a Controller<'bound>=0D
> > where the work item holds references tied to the lifetime of the bound=
=0D
> > device and its mapped IO state. The existing API only accepts 'static=0D
> > work items which cannot express that relationship.=0D
> >=0D
> > Introduce ScopedQueue for this case. It owns the underlying workqueue=0D
> > and ties enqueued work to the queue lifetime so borrowed state cannot=0D
> > outlive the queue that may still run it.=0D
> >=0D
> > Construction is unsafe because the queue must not be leaked.=0D
> >=0D
> > `compile_fail` doc-tests are ignored for now as KUnit doesn't support=0D
> > that. Enabling those tests as regular code block would raise this error=
:=0D
> >=0D
> >     ERROR:root:error[E0597]: `data` does not live long enough=0D
> > 	 --> rust/doctests_kernel_generated.rs:22029:44=0D
> > 	  |=0D
> >     22027 |         let data =3D ();=0D
> > 	  |             ---- binding `data` declared here=0D
> >     22028 |         // SAFETY: Queue is not leaked.=0D
> >     22029 |         queue =3D unsafe { new_queue_with_lt(&data)? };=0D
> > 	  |                                            ^^^^^ borrowed value do=
es not live long enough=0D
> >     22030 |     }=0D
> > 	  |     - `data` dropped here while still borrowed=0D
> >     ...=0D
> >     22034 | }=0D
> > 	  | - borrow might be used here, when `queue` is dropped and runs the =
`Drop` code for type `ScopedQueue`=0D
> > 	  |=0D
> > 	  =3D note: values in a scope are dropped in the opposite order they a=
re defined=0D
> >=0D
> > which is exactly the constraint ScopedQueue is meant to enforce.=0D
> >=0D
> > This series is based on Alice's "Creation of workqueues in Rust" [1]=0D
> > series.=0D
> >=0D
> > Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c3=
51c38f@google.com [1]=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
> Suggested-by: Danilo Krummrich <dakr@kernel.org>=0D
> =0D
> > +/// An owned workqueue that can enqueue work items borrowing from `'sc=
ope`.=0D
> > +///=0D
> > +/// A `ScopedQueue` must not outlive data borrowed by its work items.=
=0D
> > +pub struct ScopedQueue<'scope> {=0D
> > +    inner: OwnedQueue,=0D
> > +    _scope: PhantomData<&'scope mut &'scope ()>,=0D
> > +}=0D
> > +=0D
> > +impl<'scope> ScopedQueue<'scope> {=0D
> > +    /// Creates an ordered scoped workqueue.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must not leak the returned queue or otherwise preve=
nt its=0D
> > +    /// [`Drop`] implementation from running since dropping the queue =
drains=0D
> > +    /// pending and running work that may borrow from `'scope`.=0D
> > +    pub unsafe fn new_ordered_with_lt(name: &'static CStr) -> Result<S=
elf> {=0D
> =0D
> I think the with_lt naming is a bit redundant; the ScopedQueue name and i=
t's=0D
> lifetime already implies that, so I think ScopedQueue::new_ordered() is=0D
> sufficient.=0D
> =0D
> Also note that we only use the with_lt suffix when there's also a 'static=
=0D
> version called new().=0D
=0D
Perhaps new() alone would be better? ScopedQueue can only work with ordered=
 queue=0D
anyway.=0D
=0D
Onur=0D
=0D
> =0D
> > +        Ok(Self {=0D
> > +            inner: Queue::new_ordered().build(name)?,=0D
> > +            _scope: PhantomData,=0D
> > +        })=0D
> > +    }=0D
> > +=0D
> > +    /// Enqueues a work item on this scoped queue.=0D
> > +    pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutp=
ut=0D
> > +    where=0D
> > +        W: RawWorkItem<ID> + Send + 'scope,=0D
> > +    {=0D
> > +        let queue_ptr =3D self.inner.0.get();=0D
> > +=0D
> > +        // SAFETY: `W: 'scope` and dropck keep borrowed data alive unt=
il this=0D
> > +        // queue is dropped. The constructor requires that the queue i=
s not=0D
> > +        // leaked and dropping `inner` drains pending and running work=
.=0D
> =0D
> I think it is covered implicitly, but maybe we can spell out more explici=
tly how=0D
> this requirement is justified:=0D
> =0D
> 	/// If the work item type is annotated with any lifetimes, then you must=
 not call the function=0D
> 	/// pointer after any such lifetime expires. (Never calling the function=
 pointer is okay.)=0D
> =0D
> Also, I think __enqueue() has three distinct safety requirements, so I th=
ink it=0D
> would be good to address them with separate bullet points.=0D
> =0D
> > +        unsafe {=0D
> > +            work.__enqueue(move |work_ptr| {=0D
> > +                bindings::queue_work_on(=0D
> > +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::=
c_int,=0D
> > +                    queue_ptr,=0D
> > +                    work_ptr,=0D
> > +                )=0D
> > +            })=0D
> > +        }=0D
> > +    }=0D
> > +}=0D
