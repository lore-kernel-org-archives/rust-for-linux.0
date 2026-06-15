Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A952A13AA2D
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507322; cv=none; b=UoYak6d2wHKQZirS/LReui5aRTaCcbnsHfEcU+P3ahWxNauMWlTd70OpPRuM9Ds2foH+kzpiauLf1otTaPHtWDNDHNBsVlhh9rR6gSDatzD4JKwlGfX25S9S52qeJrRSbOvA5gEOdc91kR7i9FVNhtP5wY/XPL/HzNmMDVmYN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507322; c=relaxed/simple;
	bh=EtZsHXGORBwVqeszQ5g1BnT8+YvHTVwsuxAimPeUMB4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JhRwaSFnNA0fnjlTr6JjEbKwxF1aoibtXmvN6yng0qosAuqQOcEYe2lfWG02f7jO/t6zNRngI7JumJk9jnMb8tBFykB0kd4tNJwcEpPymEHqdFi59W2m5hT/snhlk27e6qhtwTcf26Bk/3VpbYqhqWMANi30SrKPDuoDP6pqIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g7AgYQCY; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g7AgYQCY"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf523c6dc90so291826266b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781507319; x=1782112119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3avcrL+feJ8XKIwf79VCKKYQ6jkIiCpMK32dW2x0aSs=;
        b=g7AgYQCY2n1ly+fmYnhVyXaJInK64ImZIR+3Naiy9qybhMhPC0Y6lhMHApUrA5R46R
         vNrGLuSw/i8bGlTzg1C2r+mR1Hg+BS4ekYx6faMnoqFzM3QjMZ4Ye5oc90c1iVcohoR1
         iAbgBcYdrM9UAf54STEq4ImnLL41olUZYkz36YaPXRr4cPkEyXCVEnXUbyfJ+9+30Rc9
         84CVrvNWzu3MYmWBZzTZ24+IdPnK4JrthycqE1BjyMnCqBajTMy5L7f/U1KaE51UUt0I
         K6cvMHr+u+8o5Lw/nVxjPzV9TGn1ybmCc54CyfXLPP3saYNXkf+zo7aQRSgDw6DPxh5B
         2r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507319; x=1782112119;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3avcrL+feJ8XKIwf79VCKKYQ6jkIiCpMK32dW2x0aSs=;
        b=g4N/1UPIfsQVFAkaJLXuRQtHUhaAdp0P9guq421uVsR4OoCakFxbpZkfy2J4VpzzoI
         ngKo3GLXl/ijEzmbzFHvBuWHg07WtTbShfSYMvDX9gNXSUrhmZ0D8MsShaD0WJkmGw3T
         ZKlTjS/hnMJ3yOCO5w0+Gcaob7LG+MiSi6vzG2h/8gqnnr94L11kJ4bqfHFdiCkmTtBF
         FGeiT82V7AxUvJFwrqbWIIJVY3JJdDQS6/R9jVS9QN68OecRZc0FrjogTfk0WBmbTqEZ
         w8AKrNV5bQaLXZufDTxIPDzpU47Dww25K7tMbBahN93zBF6UIyv53UKLbOlch9P29V3+
         HoxA==
X-Gm-Message-State: AOJu0YyA7FfmbEKnVMCyGd62zFzGohid828L4E0dggX/hmIy5gTQW9rk
	xrWm+yE7VAB2cD3i3/dbKviQ7O6Xslm/mY46JRGhVUh1VmN7Pq3P1t/LOip1e/Y7LtjYe2QaXoy
	Vkb6wYgVuTGcuBFDCQQ==
X-Received: from ejbay10.prod.google.com ([2002:a17:906:d28a:b0:bef:4adc:89c0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f87:b0:bd5:151d:2d31 with SMTP id a640c23a62f3a-bfe28907f3emr585984166b.13.1781507318912;
 Mon, 15 Jun 2026 00:08:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 07:08:37 +0000
In-Reply-To: <20260612194633.350011-2-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612194633.350011-1-work@onurozkan.dev> <20260612194633.350011-2-work@onurozkan.dev>
Message-ID: <ai-k9as5Vfvq2bjs@google.com>
Subject: Re: [PATCH v2 1/1] rust: workqueue: add cancel_sync support
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:45:42PM +0300, Onur =C3=96zkan wrote:
> Drivers can use this during teardown to cancel pending work and wait for
> running work to finish before dropping related resources.
>=20
> This is not implemented for Pin<KBox<T>> because queuing a boxed work
> item transfers ownership of the box to the workqueue. There is therefore
> no separate safe owner that can cancel the boxed work while it is pending=
.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Overall looks reasonable to me, but some comments below.

>  rust/kernel/workqueue.rs | 116 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>=20
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..4d61d7a10fae 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -471,6 +471,23 @@ pub trait WorkItem<const ID: u64 =3D 0> {
>      fn run(this: Self::Pointer);
>  }
> =20
> +/// Work item pointers that support cancellation.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that `from_raw_work` rebuilds the exact own=
ership transferred
> +/// by a successful [`RawWorkItem::__enqueue`] call.
> +pub unsafe trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> =
+ Sized {

Nit; I think it reads nicer as SupportsCancel.

> +    /// Rebuild this work item's pointer from its embedded `work_struct`=
.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The provided `work_struct` pointer must originate from a previou=
s call to
> +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure ret=
urned true
> +    /// and the pointer must still be valid.
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;

I think you're missing some condition here about ownership having been
transferred *out* from the workqueue by cancel_sync() or similar
methods. Otherwise this currently says I can call the method even though
the workqueue still owns the work item.

> +    /// # Note
> +    ///
> +    /// Should be called from a sleepable context if the work was last q=
ueued on a non-BH
> +    /// workqueue.

Nit: I'd either reword "Note" to something more specific to what the
note is about, or remove the heading.

> +    #[inline]
> +    pub fn cancel_sync(&self) -> Option<T::Pointer>
> +    where
> +        T: WorkItem<ID>,
> +        T::Pointer: SupportsCancelling<ID>,
> +    {
> +        let ptr =3D self.dwork.get();
> +
> +        // SAFETY: `ptr` is a valid embedded `delayed_work`.
> +        if unsafe { bindings::cancel_delayed_work_sync(ptr) } {
> +            // SAFETY: A `true` return means the work was pending and go=
t canceled, so the queued
> +            // ownership transfer performed by `__enqueue` is reclaimed =
here.
> +            Some(unsafe { T::Pointer::from_raw_work(core::ptr::addr_of_m=
ut!((*ptr).work)) })

Nit: The addr_of_mut! macro is no longer required. You can do: &raw mut (*p=
tr).work

Alice
