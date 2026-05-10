Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EEF35E922;
	Sun, 10 May 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778428410; cv=none; b=J0tFS4VE9hdWo5HiNNVm9khouPQ9zFLDBflcHSoTNhs44ojoKoci4RzqKlHeKn1PzMwipsRcR/hP9+9tGRCnUorQ04/YOCEUoOceA5w/Q/F1aNSZlHwxogMSeL5IuSrZE3ZhBdJ+2bFh3L6WM5XwTEPhRMhoTxeTrFyk/WXokhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778428410; c=relaxed/simple;
	bh=h9unGtOGceX4Z5d+Ncr4S2JFVvgmMmeECLEaUXc/5PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+RJS3p51dHDbaYwDlOug0PgHh1Pjh8KqLyG+Wq8mXNCValYfcNekcK6G9hJx02vXwLy5B8RHB7uPxTgN9WyoYD7HdwQ9aN0ZPbRAmye2xQxwi1YcIsaFa4FDGStzUR6Gtfc+qvqr0oS+7vs+iwyqKzCBNBIZ9u7+ZbReyzYo7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KWmooKVd; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KWmooKVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778428398; x=1778687598;
	bh=pd5byG2lYPwYzXqYo+sIM668udgeC/rgdY2E/U+9FXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KWmooKVdm2qhihJmrTTD2ASm+hgugP6a+ZdKXU8kELqSgV00HPoJqaU9yM0hO6veP
	 eC3WnaO6ce5vgYYDU/FaPpEJprTEQrxAFO3Vk29cZOhotw1TAZ/kKZqEdXCwy008SO
	 Wu7eHRTMs61aZF5ffMtP9CO+BZUHUD83m6A8pfFrJ+7ywzEut1Nz4dEmj9Kjl9S0Hs
	 lQoTipG2XYc3NwjT9H8rl0EOym8GfurXUrlYLJZz7IR2Zfl7moPzny1z/YLqz8LzUZ
	 mjCsylxZNT2f6/A1cd3CYROqLZBqiPX5Rq9YQ9VHTLpuWAYq/Rfee/X094cWIu3apd
	 5yOHnyr/13zgw==
X-Pm-Submission-Id: 4gD6p15R6Lz2Scd6
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
Date: Sun, 10 May 2026 18:53:10 +0300
Message-ID: <20260510155311.7692-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <agCLn6ebK9wERK-q@google.com>
References: <20260510082211.207450-1-work@onurozkan.dev> <agCLn6ebK9wERK-q@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 10 May 2026 13:43:59 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Sun, May 10, 2026 at 11:21:57AM +0300, Onur =C3=96zkan wrote:=0D
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
> > The immediate motivation is the Tyr reset infrastructure [1], which nee=
ds=0D
> > to cancel pending reset work and wait for any running reset work during=
=0D
> > teardown before dropping the resources used by that work.=0D
> > =0D
> > [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan=
.dev=0D
> > =0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/workqueue.rs | 134 ++++++++++++++++++++++++++++++++-------=
=0D
> >  1 file changed, 112 insertions(+), 22 deletions(-)=0D
> > =0D
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > index 7e253b6f299c..a10daa2763ac 100644=0D
> > --- a/rust/kernel/workqueue.rs=0D
> > +++ b/rust/kernel/workqueue.rs=0D
> > @@ -442,23 +442,44 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64=
>: RawWorkItem<ID> {}=0D
> >  ///=0D
> >  /// # Safety=0D
> >  ///=0D
> > -/// Implementers must ensure that [`__enqueue`] uses a `work_struct` i=
nitialized with the [`run`]=0D
> > -/// method of this trait as the function pointer.=0D
> > +/// Implementers must ensure that [`__enqueue`] uses a `work_struct` i=
nitialized with [`run`] as=0D
> > +/// its function pointer, and that [`from_raw_work`] rebuilds the exac=
t ownership transferred by=0D
> > +/// a successful [`__enqueue`] call.=0D
> >  ///=0D
> >  /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > +/// [`from_raw_work`]: WorkItemPointer::from_raw_work=0D
> >  /// [`run`]: WorkItemPointer::run=0D
> > -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {=0D
> > -    /// Run this work item.=0D
> > +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Siz=
ed {=0D
> > +    /// The work item type containing the embedded `work_struct`.=0D
> > +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;=0D
> > +=0D
> > +    /// Rebuild this work item's pointer from its embedded `work_struc=
t`.=0D
> >      ///=0D
> >      /// # Safety=0D
> >      ///=0D
> > -    /// The provided `work_struct` pointer must originate from a previ=
ous call to [`__enqueue`]=0D
> > -    /// where the `queue_work_on` closure returned true, and the point=
er must still be valid.=0D
> > +    /// The provided `work_struct` pointer must originate from a previ=
ous call to=0D
> > +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure r=
eturned true=0D
> > +    /// and the pointer must still be valid.=0D
> > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;=
=0D
> > +=0D
> > +    /// Run this work item.=0D
> >      ///=0D
> > -    /// [`__enqueue`]: RawWorkItem::__enqueue=0D
> > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);=0D
> > +    /// # Safety=0D
> > +    ///=0D
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
> >  }=0D
> >  =0D
> > +/// Marker for work item types that support cancellation.=0D
> > +pub trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> {}=0D
> =0D
> Shouldn't 'from_raw_work()' be a method on SupportsCancelling instead?=0D
=0D
Not necessarily. I wanted to keep it like that because it removes a bit of=
=0D
duplication and makes run() simpler. It's also more extensible e.g. can be=
=0D
used for disable_sync too if needed in the future.=0D
=0D
-Onur=0D
=0D
> =0D
> Alice=0D
