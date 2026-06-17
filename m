Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B2EEA8;
	Wed, 17 Jun 2026 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701165; cv=none; b=tDFaDXEIxgOyaSSj6AJUWpjCKOCG83YAjmIDNWkVHeH9ykMs4TT7yrahuc640nbhN8+TeSAEGWRf9e/gEO+/RPP1yuij5nMS5FHEs8zfKlwnMOcEi3SrtevHPnEcutNkGZi4eBC4TQR3j4oqnFKsnJkC+nobuyzVgn9zJADUaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701165; c=relaxed/simple;
	bh=QBXWOIOelPQCOhVcAI1tlMivrfHzsHGGL6LfJY0ZNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YW0R9vb8c55F7Nls00shVIHoNGdIkE7qLsKiGssCZ9JiGMjHn/quws00XHsXVOn5cg99h4Sw7FPCXl0Au3YVfxWmndIiv+FpMFOl7xvEM8XICoeNa0i/zrG8h2KHzxVY/YfexK6/EIf+BrdRfAh2ww0ODi9uJVNa1Ehuge56WDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=v5eQ/j+z; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="v5eQ/j+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781701153; x=1781960353;
	bh=J1J3j9USbH+KrJZf8hCrjTRhY3IPnuiQYRLWLA7oblg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=v5eQ/j+zA4n/7k7XcDzouVyGtaSFh1csVEHuo8AHcug0Ba6mzZ/LoyDlhkY3kKZXb
	 vHrGv6A1DAMLVBnc01vUHFW23Nf3fC3fXcvas1K+DT2LG9/MQ/uuu1trZ2d9tJKU9x
	 sZ+YF7mo9qtSZ++zvyvkzOfV7rXP/ay3RLYoe2rWUQ7kkatp2HC9ulGUWyLdcUadmk
	 GcS9M8HfUjQ8BEh5IomG/ht+NnnzWisn2auLjdidVwVGJidx14bKhV08ALFEatxL1c
	 CRDm9tKfsxQFnwuXisymiVTqwRr2D1EonolFFKuk3XhxL+C1IuSWbaaEE3SKUSbzkn
	 FdPGZKZU3Qq7g==
X-Pm-Submission-Id: 4ggP7f4Jnwz1DDqt
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
	tamird@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: workqueue: add cancel_sync support
Date: Wed, 17 Jun 2026 15:58:56 +0300
Message-ID: <20260617125906.96846-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <ai-k9as5Vfvq2bjs@google.com>
References: <20260612194633.350011-1-work@onurozkan.dev> <20260612194633.350011-2-work@onurozkan.dev> <ai-k9as5Vfvq2bjs@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jun 2026 07:08:37 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Fri, Jun 12, 2026 at 10:45:42PM +0300, Onur =C3=96zkan wrote:=0D
> > Drivers can use this during teardown to cancel pending work and wait fo=
r=0D
> > running work to finish before dropping related resources.=0D
> > =0D
> > This is not implemented for Pin<KBox<T>> because queuing a boxed work=0D
> > item transfers ownership of the box to the workqueue. There is therefor=
e=0D
> > no separate safe owner that can cancel the boxed work while it is pendi=
ng.=0D
> > =0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
> Overall looks reasonable to me, but some comments below.=0D
> =0D
> >  rust/kernel/workqueue.rs | 116 +++++++++++++++++++++++++++++++++++++++=
=0D
> >  1 file changed, 116 insertions(+)=0D
> > =0D
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > index 7e253b6f299c..4d61d7a10fae 100644=0D
> > --- a/rust/kernel/workqueue.rs=0D
> > +++ b/rust/kernel/workqueue.rs=0D
> > @@ -471,6 +471,23 @@ pub trait WorkItem<const ID: u64 =3D 0> {=0D
> >      fn run(this: Self::Pointer);=0D
> >  }=0D
> >  =0D
> > +/// Work item pointers that support cancellation.=0D
> > +///=0D
> > +/// # Safety=0D
> > +///=0D
> > +/// Implementers must ensure that `from_raw_work` rebuilds the exact o=
wnership transferred=0D
> > +/// by a successful [`RawWorkItem::__enqueue`] call.=0D
> > +pub unsafe trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID=
> + Sized {=0D
> =0D
> Nit; I think it reads nicer as SupportsCancel.=0D
> =0D
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
> =0D
> I think you're missing some condition here about ownership having been=0D
> transferred *out* from the workqueue by cancel_sync() or similar=0D
> methods. Otherwise this currently says I can call the method even though=
=0D
> the workqueue still owns the work item.=0D
> =0D
=0D
Very true, good point! I will improve this doc in the next version with the=
 nits=0D
applied.=0D
=0D
Onur=0D
=0D
> > +    /// # Note=0D
> > +    ///=0D
> > +    /// Should be called from a sleepable context if the work was last=
 queued on a non-BH=0D
> > +    /// workqueue.=0D
> =0D
> Nit: I'd either reword "Note" to something more specific to what the=0D
> note is about, or remove the heading.=0D
> =0D
> > +    #[inline]=0D
> > +    pub fn cancel_sync(&self) -> Option<T::Pointer>=0D
> > +    where=0D
> > +        T: WorkItem<ID>,=0D
> > +        T::Pointer: SupportsCancelling<ID>,=0D
> > +    {=0D
> > +        let ptr =3D self.dwork.get();=0D
> > +=0D
> > +        // SAFETY: `ptr` is a valid embedded `delayed_work`.=0D
> > +        if unsafe { bindings::cancel_delayed_work_sync(ptr) } {=0D
> > +            // SAFETY: A `true` return means the work was pending and =
got canceled, so the queued=0D
> > +            // ownership transfer performed by `__enqueue` is reclaime=
d here.=0D
> > +            Some(unsafe { T::Pointer::from_raw_work(core::ptr::addr_of=
_mut!((*ptr).work)) })=0D
> =0D
> Nit: The addr_of_mut! macro is no longer required. You can do: &raw mut (=
*ptr).work=0D
> =0D
> Alice=0D
