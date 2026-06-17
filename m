Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EBB3F58D8;
	Wed, 17 Jun 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701835; cv=none; b=mtw0/kmgWRUlGuEfxnaEAoj0vF4K0/kO60UffiPqYvc4WRGwJQtDzhuQrNQRJ9kZ/mOFQbz+cv+qOD/V+cETAAZv6nZG2LuVcVHBZieTgNlLTCtdneWkD5/Vg9rapmISmidEV1oWDZjKTcU/85ybTLcYwDOGB5EgLWzCnyBRW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701835; c=relaxed/simple;
	bh=q8Kp2oCcY465dF/99E5R/sRyzPBa6RRjqKgKUTgm6RM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=E+w5j53g1EaMJJmIasSCrPMeS5LpeePLPe3u0L87EbKdtLpC/MZrH2BWJ4clicKC5nk/l2tkdG1cBUR20WJN5AsSn8FOt18cfEg2X7LnEDKeFeFxBywlc9n3VhQvAhs1jcdCGnLeESYVy5gOFucMcZgYJGZ3C0MdAJTpvD86c74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csv/kxYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csv/kxYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A63C1F000E9;
	Wed, 17 Jun 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781701833;
	bh=3X1Il9Kizb3EIcDOY4Kr8RQCTEdkkS1iIhCoI+ibnzw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=csv/kxYnqw1gIfkOdqkEQJDZb5/jThlgaZb+6ockyJVzQLhh5/39tFT4LAw561e+n
	 o7FaoCNrEKhPGxaE0fADa5ThK2BtCwbcBtmUf8Pd6LTszCNc90h2BBelvEUdOjtZ4C
	 gOhoFku3RplJA+nz+bHyqAjHk6FMP4Rd+eq1luFVr8wRp+sRD1Z/KIvDZLCjFnKwWy
	 Q6ClsuXSiRvKRPVes1za351r7B2+J2a1++6PYbaJXB/cmnQTQwtwOpMLpFYly5Qe9F
	 N003fy4aRxYe8zKrpN0f8chn5I37piyX0Q78xM/LOJtMXWEuFW4vTfp8jVmdWQ6O/K
	 VJtisw6FSsQLg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 15:10:30 +0200
Message-Id: <DJBCL55WD43F.3VZBBK04AU3F1@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <tj@kernel.org>, <jiangshanlai@gmail.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1] rust: workqueue: add ScopedQueue for lifetime bound
 items
References: <20260615115626.871457-1-work@onurozkan.dev>
In-Reply-To: <20260615115626.871457-1-work@onurozkan.dev>

On Mon Jun 15, 2026 at 1:56 PM CEST, Onur =C3=96zkan wrote:
> Add a workqueue wrapper for work items that are not 'static.
>
> Tyr reset work is queued from a handle that owns a Controller<'bound>
> where the work item holds references tied to the lifetime of the bound
> device and its mapped IO state. The existing API only accepts 'static
> work items which cannot express that relationship.
>
> Introduce ScopedQueue for this case. It owns the underlying workqueue
> and ties enqueued work to the queue lifetime so borrowed state cannot
> outlive the queue that may still run it.
>
> Construction is unsafe because the queue must not be leaked.
>
> `compile_fail` doc-tests are ignored for now as KUnit doesn't support
> that. Enabling those tests as regular code block would raise this error:
>
>     ERROR:root:error[E0597]: `data` does not live long enough
> 	 --> rust/doctests_kernel_generated.rs:22029:44
> 	  |
>     22027 |         let data =3D ();
> 	  |             ---- binding `data` declared here
>     22028 |         // SAFETY: Queue is not leaked.
>     22029 |         queue =3D unsafe { new_queue_with_lt(&data)? };
> 	  |                                            ^^^^^ borrowed value does=
 not live long enough
>     22030 |     }
> 	  |     - `data` dropped here while still borrowed
>     ...
>     22034 | }
> 	  | - borrow might be used here, when `queue` is dropped and runs the `D=
rop` code for type `ScopedQueue`
> 	  |
> 	  =3D note: values in a scope are dropped in the opposite order they are=
 defined
>
> which is exactly the constraint ScopedQueue is meant to enforce.
>
> This series is based on Alice's "Creation of workqueues in Rust" [1]
> series.
>
> Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351=
c38f@google.com [1]
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Suggested-by: Danilo Krummrich <dakr@kernel.org>

> +/// An owned workqueue that can enqueue work items borrowing from `'scop=
e`.
> +///
> +/// A `ScopedQueue` must not outlive data borrowed by its work items.
> +pub struct ScopedQueue<'scope> {
> +    inner: OwnedQueue,
> +    _scope: PhantomData<&'scope mut &'scope ()>,
> +}
> +
> +impl<'scope> ScopedQueue<'scope> {
> +    /// Creates an ordered scoped workqueue.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must not leak the returned queue or otherwise prevent=
 its
> +    /// [`Drop`] implementation from running since dropping the queue dr=
ains
> +    /// pending and running work that may borrow from `'scope`.
> +    pub unsafe fn new_ordered_with_lt(name: &'static CStr) -> Result<Sel=
f> {

I think the with_lt naming is a bit redundant; the ScopedQueue name and it'=
s
lifetime already implies that, so I think ScopedQueue::new_ordered() is
sufficient.

Also note that we only use the with_lt suffix when there's also a 'static
version called new().

> +        Ok(Self {
> +            inner: Queue::new_ordered().build(name)?,
> +            _scope: PhantomData,
> +        })
> +    }
> +
> +    /// Enqueues a work item on this scoped queue.
> +    pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send + 'scope,
> +    {
> +        let queue_ptr =3D self.inner.0.get();
> +
> +        // SAFETY: `W: 'scope` and dropck keep borrowed data alive until=
 this
> +        // queue is dropped. The constructor requires that the queue is =
not
> +        // leaked and dropping `inner` drains pending and running work.

I think it is covered implicitly, but maybe we can spell out more explicitl=
y how
this requirement is justified:

	/// If the work item type is annotated with any lifetimes, then you must n=
ot call the function
	/// pointer after any such lifetime expires. (Never calling the function p=
ointer is okay.)

Also, I think __enqueue() has three distinct safety requirements, so I thin=
k it
would be good to address them with separate bullet points.

> +        unsafe {
> +            work.__enqueue(move |work_ptr| {
> +                bindings::queue_work_on(
> +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_=
int,
> +                    queue_ptr,
> +                    work_ptr,
> +                )
> +            })
> +        }
> +    }
> +}
