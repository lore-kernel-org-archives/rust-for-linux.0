Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D73AF643
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083160; cv=none; b=AKXkBCl/oggN+QGdTMkM/nhJH2wIaG7xa2o53F+IHPmU1RZC/NXvDNhTCTu7lhn4LshbPqaOfZDubSb0EYH2hlvcKejY4kRyx+XguqneoUDMEx8xQXyOcADO/BF9KNRaMl7So76ycs7Hx602O6sOHaD5cKCWp5luNRaLfhEG2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083160; c=relaxed/simple;
	bh=ueT+kAa3HqXetI2NG7UEdioUs/aHJRlD7BVeJTrrz+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nMlgxcUPb/fzOHfk92BfBw3UqvSEkQfV5CrHAa9+5lSxD9EaDbX37sM73Q6nDEzWQ9SU8+hNEqN4CNKMcST4tGv+BvDegrG1LHD/ZDlurnjRJKqBP6pOk6P2RRS0h3yYF9og/MroNNxNMwT9eeduyuGyzzZW9cYO0NyFgy7Guso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=DEtIPBom; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="DEtIPBom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779083136; x=1779342336;
	bh=3UhUXEoR0gdT3FAaETSn49Aim+afW+PruaYjuvqKUN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DEtIPBomyGoU259D89Yqrq7pft75YsnGZVoo31YZmW9jedq4hL3umXK436Pf6xnDU
	 tugTydG6dicOfkUFFx6spw4K8v0pguq/xxlMueLN/DuWh6tqgLO5TjfDHMoCTGgGIN
	 yPkGuopobRz0KrVi4xDyjpzsfvH47lbaIGGOI9toXpot/c0Pl65JVGohMDgGx6plkK
	 Y+HcXOBWxJH0H0ek/3l1O1t50Z+37DL2aE+DBDZfuZlEgbfmLtnxGHTv+dXhzw4Sim
	 ADQWsWjHUSNmtbXquvxMIkAFnmTYVmg3VfYZHApmvnFrFGuf7dQToItzlxPAtsinKH
	 3xe1097ykVmoQ==
X-Pm-Submission-Id: 4gJmxB1BZ6z2Scpx
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Moayad Salloum <salloummoayad4@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org
Subject: Re: [PATCH] rust: workqueue: add cancel_work for Arc<T>
Date: Mon, 18 May 2026 08:45:26 +0300
Message-ID: <20260518054533.4296-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260518042347.95213-1-salloummoayad4@gmail.com>
References: <20260518042347.95213-1-salloummoayad4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 May 2026 07:23:47 +0300=0D
Moayad Salloum <salloummoayad4@gmail.com> wrote:=0D
=0D
> Add a safe cancel_work() function for work items owned by Arc<T>.=0D
> =0D
> In the existing API, enqueueing an Arc<T> calls Arc::into_raw() to leak=0D
> the Arc reference into the workqueue. WorkItemPointer::run() is the only=
=0D
> place that reclaims it via Arc::from_raw(). Without a cancel function,=0D
> drivers had no safe way to cancel pending work, and any attempt to do so=
=0D
> by calling bindings::cancel_work() directly would leak the Arc reference=
=0D
> since run() would never be called.=0D
> =0D
> cancel_work() handles this by calling Arc::from_raw() when cancel=0D
> succeeds, reclaiming the leaked reference that __enqueue() left behind.=0D
> =0D
> Signed-off-by: Moayad Salloum <salloummoayad4@gmail.com>=0D
> ---=0D
>  rust/kernel/workqueue.rs | 29 +++++++++++++++++++++++++++++=0D
>  1 file changed, 29 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> index 6d665418b..daff9040a 100644=0D
> --- a/rust/kernel/workqueue.rs=0D
> +++ b/rust/kernel/workqueue.rs=0D
> @@ -871,6 +871,35 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Se=
lf::EnqueueOutput=0D
>      }=0D
>  }=0D
>  =0D
> +pub fn cancel_work<T, const ID: u64>(item: &Arc<T>) -> bool=0D
> +where=0D
> +    T: WorkItem<ID, Pointer =3D Arc<T>>,=0D
> +    T: HasWork<T, ID>,=0D
> +{=0D
> +    let ptr =3D Arc::as_ptr(item);=0D
> +    // SAFETY: `ptr` comes from `Arc::as_ptr` which is a valid non-dangl=
ing pointer to `T`.=0D
> +    let work_ptr =3D unsafe { T::raw_get_work(ptr.cast_mut()) };=0D
> +    // SAFETY: `raw_get_work` returns a pointer to a valid `Work<T, ID>`=
 field.=0D
> +    let work_ptr_struct =3D unsafe { Work::raw_get(work_ptr) };=0D
> +    // SAFETY: The `Arc` keeps the allocation alive, so `work_ptr_struct=
` is valid for=0D
> +    // the duration of this call.=0D
> +    let cancel_res =3D unsafe { bindings::cancel_work(work_ptr_struct) }=
;=0D
> +=0D
> +    if cancel_res {=0D
> +        // SAFETY: `cancel_work` returned true, meaning the work was pen=
ding and has been=0D
> +        // removed from the queue. The workqueue will not call `run`, so=
 we are responsible=0D
> +        // for reclaiming the `Arc` reference that was leaked in `__enqu=
eue` via=0D
> +        // `Arc::into_raw`. We use `work_container_of` to recover the or=
iginal `*const T`=0D
> +        // pointer from the `Work<T, ID>` field pointer, then reconstruc=
t the `Arc` with=0D
> +        // `Arc::from_raw` and drop it to decrement the ref count.=0D
> +        let item_ptr =3D unsafe { T::work_container_of(work_ptr) };=0D
> +        drop(unsafe { Arc::from_raw(item_ptr) });=0D
> +        true=0D
> +    } else {=0D
> +        false=0D
> +    }=0D
> +}=0D
> +=0D
>  // SAFETY: By the safety requirements of `HasDelayedWork`, the `work_str=
uct` returned by methods in=0D
>  // `HasWork` provides a `work_struct` that is the `work` field of a `del=
ayed_work`, and the rest of=0D
>  // the `delayed_work` has the same access rules as its `work` field.=0D
> -- =0D
> 2.43.0=0D
> =0D
=0D
[1] already covers this.=0D
=0D
- Onur=0D
=0D
[1]: https://lore.kernel.org/all/20260510082211.207450-1-work@onurozkan.dev=
=0D
=0D
