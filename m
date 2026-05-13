Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66832874FA
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657631; cv=none; b=f7dIrlJ3RUuLVooYGAvKT0UMlmfhHzYWA86BX/DIL8zM/LILG5KZXfqLAqRJCX612Q4ojNM3HU5IHzNzPdDbf7ShL+S/6aZkABsI80TH6kkBPBabcHCmgiIYhGtIeax74nyXEAFRLg2c3ahyHiSB+y2ZmuDCJ9ovXD/XIytzN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657631; c=relaxed/simple;
	bh=Q5m7h4GbwuD+mNH0H+VndvrwJjlNrnRTL/jDjZ02V3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OtyyIWcntMqKhmx9/jmVrSwzyynkH6bBLX6JgcPF0xHgxCnc/q0NWjZLUpBY0KB/An9yDh1CI2k8oESIhDHDAnmMTZs4t8ruDz2uoj328BwsCKuQXIFAghit0m9MeexrVQtOzn7me5U8a470XjbUWaambtCL+W/yUpGJD17CB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ciBgIyAG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciBgIyAG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43ff19e54beso4472246f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778657628; x=1779262428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyWhXgdXxZN0dcfNKIFIBTxT7rptSrMP1TobQKDwqZE=;
        b=ciBgIyAG5r9TbKT8TO6xINtcYpsNZZH1TQaNtLBeuYWAgUszX76vLJopkdSi2kNjtH
         Srd3/NKC0Ngy3OU8qYtkTVY0Kx5+O0fDFLu0GxWautejRAzvBgA5sgkFovBIM2313DCS
         utQ6Ft4iEWrxi3t0s9vrntPtnB3s26tlT45m75+PbphC+tNX9+1rBzGD7XBdzLEm6c3u
         Sa2HdsUq2uTV4iu8QjXA7eTk/vv7Klhmd1e82XaNybR6Kt7LfYwESSapjuTBXbPUgarC
         X5ke56SlZKh4la5X7r7DPydJHQ41dQhjZIk0hR3f76Hh8Smrm/NpJKOU/46FsA+F3H4d
         y9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657628; x=1779262428;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HyWhXgdXxZN0dcfNKIFIBTxT7rptSrMP1TobQKDwqZE=;
        b=Lx31WU+4kwB/7gPoY9GVMKLm+KWF4TcsOxsmI25uhBsaE3cl4zAQuNxmQZGeKgsArF
         s8V/pjxQJW3hJL6dgXsRLQZhKF+PHpDVa/7asG9RjtmMrXboxDR8WhM75cN1xG6C9MZh
         /Mo+Md5WTCCT79jwapXEjw/UCsls3GEZds7KBGHkvE9DTxFIEnmNH5rWYAA3Yh2o0yO8
         37xA3Xf7h7LK2lljxO0KFQsd3AWySJAR6s+y7xMv89PF+vJic6Op3WGmHiE3kxkJWdmB
         AYIGOd4c7wCXiv72LLM1ZxSwKpAufVE8OWFxS7Tk5d3xJ9+RWP0wjRJ5oZqMqgM2yM/j
         zD5Q==
X-Gm-Message-State: AOJu0YzwM/AGYG1YdArprM9MYHoyt0nPZOj9vHM45Ei1W//rz7wI9uAD
	zOlySp7MeC4xH4obUmC8B5Kr9t0e0y6ooUkwKtm8QJjFY9ocJ/BvZQFZ3QBmbj2Y31sKGCPGua3
	wr2MCAkrSw3zkn3kNrQ==
X-Received: from wrqb1.prod.google.com ([2002:a5d:40c1:0:b0:43d:732c:5800])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c6:b0:44f:da83:2030 with SMTP id ffacd0b85a97d-45c5ac52cbfmr2760165f8f.41.1778657627822;
 Wed, 13 May 2026 00:33:47 -0700 (PDT)
Date: Wed, 13 May 2026 07:33:46 +0000
In-Reply-To: <20260510155311.7692-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260510082211.207450-1-work@onurozkan.dev> <agCLn6ebK9wERK-q@google.com>
 <20260510155311.7692-1-work@onurozkan.dev>
Message-ID: <agQpWlE_VYHtgzYi@google.com>
Subject: Re: [PATCH v1] rust: workqueue: add cancel_sync support
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, 
	fujita.tomonori@gmail.com, tamird@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 06:53:10PM +0300, Onur =C3=96zkan wrote:
> On Sun, 10 May 2026 13:43:59 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Sun, May 10, 2026 at 11:21:57AM +0300, Onur =C3=96zkan wrote:
> > > Drivers can use this during teardown to cancel pending work and wait =
for
> > > running work to finish before dropping related resources.
> > >=20
> > > This is not implemented for Pin<KBox<T>> because queuing a boxed work
> > > item transfers ownership of the box to the workqueue. There is theref=
ore
> > > no separate safe owner that can cancel the boxed work while it is pen=
ding.
> > >=20
> > > The immediate motivation is the Tyr reset infrastructure [1], which n=
eeds
> > > to cancel pending reset work and wait for any running reset work duri=
ng
> > > teardown before dropping the resources used by that work.
> > >=20
> > > [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozk=
an.dev
> > >=20
> > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/workqueue.rs | 134 ++++++++++++++++++++++++++++++++-----=
--
> > >  1 file changed, 112 insertions(+), 22 deletions(-)
> > >=20
> > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > > index 7e253b6f299c..a10daa2763ac 100644
> > > --- a/rust/kernel/workqueue.rs
> > > +++ b/rust/kernel/workqueue.rs
> > > @@ -442,23 +442,44 @@ pub unsafe trait RawDelayedWorkItem<const ID: u=
64>: RawWorkItem<ID> {}
> > >  ///
> > >  /// # Safety
> > >  ///
> > > -/// Implementers must ensure that [`__enqueue`] uses a `work_struct`=
 initialized with the [`run`]
> > > -/// method of this trait as the function pointer.
> > > +/// Implementers must ensure that [`__enqueue`] uses a `work_struct`=
 initialized with [`run`] as
> > > +/// its function pointer, and that [`from_raw_work`] rebuilds the ex=
act ownership transferred by
> > > +/// a successful [`__enqueue`] call.
> > >  ///
> > >  /// [`__enqueue`]: RawWorkItem::__enqueue
> > > +/// [`from_raw_work`]: WorkItemPointer::from_raw_work
> > >  /// [`run`]: WorkItemPointer::run
> > > -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
> > > -    /// Run this work item.
> > > +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + S=
ized {
> > > +    /// The work item type containing the embedded `work_struct`.
> > > +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;
> > > +
> > > +    /// Rebuild this work item's pointer from its embedded `work_str=
uct`.
> > >      ///
> > >      /// # Safety
> > >      ///
> > > -    /// The provided `work_struct` pointer must originate from a pre=
vious call to [`__enqueue`]
> > > -    /// where the `queue_work_on` closure returned true, and the poi=
nter must still be valid.
> > > +    /// The provided `work_struct` pointer must originate from a pre=
vious call to
> > > +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure=
 returned true
> > > +    /// and the pointer must still be valid.
> > > +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self=
;
> > > +
> > > +    /// Run this work item.
> > >      ///
> > > -    /// [`__enqueue`]: RawWorkItem::__enqueue
> > > -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
> > > +    /// # Safety
> > > +    ///
> > > +    /// The provided `work_struct` pointer must satisfy the same req=
uirements as
> > > +    /// [`WorkItemPointer::from_raw_work`].
> > > +    #[inline]
> > > +    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> > > +        <Self::Item as WorkItem<ID>>::run(
> > > +            // SAFETY: The requirements for `run` are exactly those =
of `from_raw_work`.
> > > +            unsafe { Self::from_raw_work(ptr) },
> > > +        );
> > > +    }
> > >  }
> > > =20
> > > +/// Marker for work item types that support cancellation.
> > > +pub trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> {}
> >=20
> > Shouldn't 'from_raw_work()' be a method on SupportsCancelling instead?
>=20
> Not necessarily. I wanted to keep it like that because it removes a bit o=
f
> duplication and makes run() simpler. It's also more extensible e.g. can b=
e
> used for disable_sync too if needed in the future.

It still seems wrong to me because you are forcing all pointer types to
provide from_raw_work() even though not all pointer types needs it.

As for disable_sync(), I think for that case we'd want three traits:

1. WorkItemPointer, defines run()
2. CancelableWorkItemPtr: WorkItemPointer, defines from_raw_work()
3. DisablableWorkItemPtr: CancelableWorkItemPtr, no methods

Alice
