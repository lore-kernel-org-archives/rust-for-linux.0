Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BACA318121
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970873; cv=none; b=ChcCq5P37QiC58zQORVmxE+OuAcs/7feq5C1hAhWUaLWs+TIahXb4J4BFP/T6a2zx+DyI5Wh9kmiW6v5eOBJmU0TtBOAXsWU7xKNPXy+vF0DVYY67hKXVEXi/GQs6yjDvSSqe02g7Uu27odC0PZyYm5Yj6FFrf/Z+uoE4PiU568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970873; c=relaxed/simple;
	bh=24o/SELqOD6VYgcRlloW77T422bdU+2xONcQahfiACc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RItOFtFiPOYu0FdiNcwVUhBJ7eoPFiMfciBrbgI4F+uDaHrZkE5Kdga9LoSVxFyvBC4Y8gHMQFCMIoiyJbOEWpWx7XGpS+ctW/YJcBZgR4YHbV+mqMJlPt18FsKD+7+G3B9WkfxKT816Z2hbRVVj0vtZcPkh8LM8b1fLVju8xsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfFiTgiB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfFiTgiB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48d046fac74so12590245e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777970867; x=1778575667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7AR5wAkJNFfOAnTZUJewAerI3iJDCyRhKXLfHOJo/s=;
        b=gfFiTgiBAMxtYQrs16/2xtqD183frklGnyRIBGCUOVL+FULLXMLn1+deh/cBdJ9lqn
         lf3UyM4mjWQc3pFDm70ypm8ScwVrgmwjNjUah1Lx4nEenPipXgroDz/VnQaptJ7CGsEc
         lGuSJ+3SWDD1SJjPi+xN2Y/oMJrpo54/Xbz8cTnI8iaIXs7oVkrGAXMtSLj7n12Tg0o4
         DTesDvAy6mEMrQLF8o4o3hf1WV5v8RtltuIBBniARETpj+T5crKrunM9RkbYF5Xuq65W
         YVP5TwBmn3IllQH3tE5Q5faPVscSrJQ5FnO9jyrUdnUpdHM4aQ8WXL1/37LY+me6FJQn
         feFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777970867; x=1778575667;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C7AR5wAkJNFfOAnTZUJewAerI3iJDCyRhKXLfHOJo/s=;
        b=nCJjVReWlF4p/pkMKse4dnqA6jgPSoUj/Cx3aeynCdWeOi1UzWL4HP6OFZFoETShcN
         NhB0hfzH/MNkhGiraKifnRND8CRbiF1ojVJpAKAdpOASBpQT5VexHaPbrRIFBfeWk4GQ
         8RJk6+Uc96cCcMQ/VlU/Wk8qzH0v1MJMoD6DCxn/KwsV3gbfSv0gKUsxqdXtzbCDMOUb
         +4nc+5rghXroQebFX5sMBrp5dS8mnJkzpok95LxhZyndPTDoZrX3ojJQlnK+fGdutNXf
         UGp5lQv0y/vkd7dR2yo7EEjO3ug5KdacJC28Wr0xto8djvvVZO6FoJGuGc9nWdEfc8A8
         bWjw==
X-Gm-Message-State: AOJu0Yx3d2srKY7qdf3M4vcxVeAHzsPUk9Jk3xZbiaZspjGdlhT4OiiK
	vmCkSMK2X8yFXTen3eU8jru9WkIHyntdFwS1HQt2/TsCPXZiVFX9IlOm2A541pLbp108phVP9L1
	/6CLgqfNMo8p2ydxMEA==
X-Received: from wmlm8.prod.google.com ([2002:a7b:ca48:0:b0:485:f1d7:164d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3052:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48d186dc826mr16972595e9.3.1777970867445;
 Tue, 05 May 2026 01:47:47 -0700 (PDT)
Date: Tue, 5 May 2026 08:47:45 +0000
In-Reply-To: <20260505060723.11363-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev>
 <afhQzt2VGa-QQYSm@google.com> <20260505060723.11363-1-work@onurozkan.dev>
Message-ID: <afmusSlYdOR2Alvp@google.com>
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, boris.brezillon@collabora.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote:
> On Mon, 04 May 2026 07:54:54 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote:
> > > Adds Work::disable_sync() as a safe wrapper for disable_work_sync().
> > >=20
> > > Drivers can use this during teardown to stop new queueing and wait fo=
r
> > > queued or running work to finish before dropping related resources.
> > >=20
> > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-----------=
--
> > >  1 file changed, 81 insertions(+), 40 deletions(-)
> > >=20
> > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > > index 7e253b6f299c..d0f9b4ba7f27 100644
> > > --- a/rust/kernel/workqueue.rs
> > > +++ b/rust/kernel/workqueue.rs
> > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::=
workqueue_struct) -> &'a Queue
> > > =20
> > >      /// Enqueues a work item.
> > >      ///
> > > -    /// This may fail if the work item is already enqueued in a work=
queue.
> > > +    /// This may fail if the work item is already enqueued in a work=
queue or disabled.
> > >      ///
> > >      /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutpu=
t
> >=20
> > Can you elaborate on the case where disable leads to failure here? Can
> > you not enqueue a work item again after disabling it? Is there a doc
> > test illustrating this case that I can run for myself to see the
> > behavior in action?
>=20
> As we discussed on yesterday's call, I looked into cancel_work_sync and
> it seems we can make this work in the tyr reset implementation. We alread=
y
> store an atomic reset state, it can be used to prevent future enqueues in
> reset scheduling.
>=20
> I will send a patch for the cancel_sync function soon.

I did hear from Boris that Panthor actually does make use of the disable
feature.=20

What I would probably suggest here is to choose whether you can disable
a work item based on the pointer type. If using a pointer type where
enqueue is *already* fallible, we might as well also support disabling
it.

pub trait SupportsDisable<const ID: u64>: WorkItemPointer { }

unsafe impl<T, const ID: u64> SupportsDisable<ID> for ARef<T>
where
    Self: WorkItemPointer<ID>,
    T: AlwaysRefCounted,
{
}

So you can implement the trait as above for ARef and Arc, but not for
Box.

Then, when you add the method for actually performing a disable, you add
a requirement that the pointer type implements this trait:

/// Disables this work item and waits for queued/running executions to fini=
sh.
///
/// # Note
///
/// Should be called from a sleepable context if the work was last queued o=
n a non-BH
/// workqueue.
#[inline]
pub fn disable_sync(&self)
where
    T: WorkItem<ID>,
    <T as WorkItem<ID>>::Pointer: SupportsDisable<ID>,
{ ... }

This way the pointer type in use determines whether to opt-in to
exposing the disable bit.

I do not think there is any harm to not exposing `disable_sync()` for
box, because you can't even call it on an enqueued work item to begin
with. If it's enqueued, the workqueue has ownership over the box, so you
have no way of obtaining a reference to it, which you would need to call
disable_sync(). So we would only be taking away the ability to call that
method in cases where you *know* the work item is not enqueued anyway.

Alice
