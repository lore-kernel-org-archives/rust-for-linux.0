Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DFF4A440F
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360598; cv=none; b=YWFmICQ+BxTQHmQCRv8jfTCR4EJhPGR90pRDXQoYJtZM9fTsYRzLr3eA8XP06rUaQj7g+r+eRXFKiuQsmAj0m8//MDRe/63leMBLT3pJx8snkvn58symeU6jTOU06j1yK4pA4pIpqj1z7Zt6qQmYPPoyTUxPPL/APUytKNxMhHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360598; c=relaxed/simple;
	bh=AKJP9o2dHUhJIrovPfM+erLc6AbBK9foEGrUmY75Ojs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U1mQQ2Uh4ZQlArRzgjsQfFLQ4JPecYgkjxUFzuH2xqg8qVIIVJaYXqebxZnyDGPRehxdJUcwDqymgOdzuoElLd+auxJyNNz6LckFTN91GS41EZ6t6hU1EmRiMwJJAefjNSWWb4M3u0tEyJYX4WqXyEwxo5W/OfJ2AmDbZETk1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fOV22q0S; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fOV22q0S"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a57aa07476so1353763a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Sep 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788360591; x=1788965391; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+udHrInuy2YjJn6lgG+NPppj9DlZvX6hfolV6vDDE4=;
        b=fOV22q0SEnIuaasMQi3foq0zgMikZPO7RrXj44uRHuEs6S0CAFOSfsWm9hxL4SFp6h
         +UNwvAB/vQr6xYSJZGcTLZ6ik0iGVfHbjqXULgBvnImQO4GJOwqbCaTnPN/C0vYta5rj
         JIMK1dAQrryseFnXEnpRPv4HaMsKdte8ZxfPdHffj/Duh4TK1XMWxZr3W2RNO59rVvY8
         Kf2wzMXzaKtL3xhAjAcPpM+piYhWBtqofLoGLCfPw1F27UOvlbwtlzN4k4buGgMLEE4y
         L8bgxYTDJjInSzdT0Y7HdktfutkQh3q1fEF6SRfgvdKfTBrr1g1Yi0SKaUIhnpTHF844
         k2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360591; x=1788965391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+udHrInuy2YjJn6lgG+NPppj9DlZvX6hfolV6vDDE4=;
        b=BCtk9Bc4WrrWZXxGJItwL7+vCObcBF903iCoiOSSVEhsode1FruVuTJtutJuy4/V68
         KaIBNDFFUvLyJ8LmwcO3ZLhsa4AWdiD/OTods52RymKxbpjJVTzd6Zc2CWPpMRueKYEF
         vEYTqd9eghZREE3ngKbQMTaGsN/eStIUPvVvrSZPPXy01c5dP1hGpcUP5mjkksgTxnbp
         C4Y7lje1S3bttzbx5QeEU+Y2wm579dLA9zZ7mZCD7/82t70vqrudnQIQuLgmJa6bc5vI
         Xu095bFwI0YeTv6gJIwolLOnqkECXN1UHnZnaWMvolWrkaTYdoA308Uio8/dhkW27fYJ
         EQtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLejtgCrrjfLTUxQ7H/7njmxculkE17bw2ZpQBI5g4FJzADyiHr0QCIrEz5WmUjGf72NzQD8uh3mnjIOPlAg==@vger.kernel.org
X-Gm-Message-State: AFuF++mpF014+6PUR+qhIurJ0141zEFk0MOCdyfMA+JNAWQrnr1vJ3gp
	13I8tCsfL6Qt1Ut+DacnMcWdI9jUIWDJG1d6Ba5fZOjJijyPdbl0UQLc1X3SL30sTDYVSnUMh8V
	IrRIKgtNaxip0RC3y3Q==
X-Received: from edcpm25.prod.google.com ([2002:a05:6402:c199:b0:6a6:7314:9cf6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2349:b0:6a5:fac9:8326 with SMTP id 4fb4d7f45d1cf-6a682ac0032mr3646661a12.15.1788360590677;
 Wed, 02 Sep 2026 07:49:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:49:49 +0000
In-Reply-To: <20260807165252.3849875-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807165252.3849875-1-dakr@kernel.org> <20260807165252.3849875-7-dakr@kernel.org>
Message-ID: <apg3jcchnlwTeiTN@google.com>
Subject: Re: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static
 work items
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: tj@kernel.org, jiangshanlai@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 07, 2026 at 06:52:49PM +0200, Danilo Krummrich wrote:
> Add ScopedWork<T>, a work item wrapper whose destructor calls
> cancel_work_sync(), allowing T to carry non-'static lifetimes. Ownership
> of the data is not transferred to the workqueue; instead, the
> synchronous cancellation on drop guarantees the work function is not
> running when the data is freed.
> 
> ScopedWork uses the existing Work/HasWork/WorkItem infrastructure with
> NonNull<ScopedWorkRef<T>> as WorkItem::Pointer for the callback path,
> and implements RawWorkItem for &ScopedWork<T> and &ScopedWorkRef<T> for
> the enqueue path (requiring T: Sync for cross-thread shared access
> safety).
> 
> Two enqueue paths are provided:
>   - Queue::enqueue_scoped() (unsafe): the caller must ensure the work
>     item is not forgotten.
>   - ScopedQueue::enqueue() (safe): when the work item's lifetime
>     satisfies the queue's 'scope bound.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
>      where
>          W: RawWorkItem<ID> + Send + 'static,
> [...]
> +    pub unsafe fn enqueue_scoped<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send,

I'm not convinced that enqueue_scoped() should be the unsafe operation.
Rather, I think that should be the constructor of ScopedWork. If we
promise to not forget it in ::new(), we can make this safe.

> +impl Deref for ScopedQueue<'_> {
> +    type Target = Queue;
> +
> +    #[inline]
> +    fn deref(&self) -> &Queue {
> +        &self.inner
> +    }
> +}

Should be part of previous patch.

> +/// The work function's view of a [`ScopedWork`] item.
> +///
> +/// The work function callback receives `&ScopedWorkRef<T>`, which [`Deref`]s to `&T` and can be
> +/// passed to queue enqueue methods for re-enqueueing from within the work function.
> +#[pin_data]
> +pub struct ScopedWorkRef<T: ScopedWorkItem> {

Structs with 'Ref' in their name sound like they are a
reference/pointer, but this struct has no indirection.

> +impl<T: ScopedWorkItem> WorkItem for ScopedWorkRef<T> {
> +    type Pointer = NonNull<Self>;
> +
> +    #[inline]
> +    fn run(this: NonNull<Self>) {
> +        // SAFETY: `this` points to a valid, pinned `ScopedWorkRef`. `cancel_work_sync()` in
> +        // `ScopedWork`'s `PinnedDrop` prevents use-after-drop.
> +        let work = unsafe { &*this.as_ptr() };
> +
> +        T::run(work);
> +    }
> +}

This is unsound because its a safe function that dereferences a raw
pointer.

I think you can avoid all of this logic by just not implementing
WorkItem. You can skip all of that and just implement RawWorkItem for
&ScopedWorkRef<T> and remove all the other implementations. You do not
need the WorkItem impl.

Alice
