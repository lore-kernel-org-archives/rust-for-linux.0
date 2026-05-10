Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04087361DAE
	for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420644; cv=none; b=Gg5w15XminbKhcvg+1EzAx4VcOv3n19n8L/qx+i8ponl4sbVTgLLParZtB8D0IBw7Nxve0AM1hOmLmQl+Sn8sjz5eeXA/zQpai0jXg/7i7hD/1FnR5+pHa2Qlu7+mpycDvj0kTsSBPFTnsb8xF7FkA3lPIyfpmULsFYysjHpOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420644; c=relaxed/simple;
	bh=POAn8/WyhIU40luvK2Po+JhWXrqKRYT38IUAy2q2GK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=doLx63UP9F2FjkcJQ/RXCSloffPJkLBq4LN1uLsdgPI74RyfcumIhgKpK+T2h9z1lXmUssxuWI3CAjkarBcGxrMtEwHb/joIcIfyapNUNfmsnfMQEMBIEikx6twLzGZ9t+3K3IpAE45c7bSCW4YqDcp+5EcwJoOXUOC1KfRGOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OalOsh50; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OalOsh50"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4891f97aef0so18241155e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778420640; x=1779025440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaKkDzbjUfG47hTpmhpp44P0YzzZCcaap35EoHtPlAY=;
        b=OalOsh50nqjErbBmlbZLuCsrtLyvbgw7xtwg1tz3qcbPu66WkvxxI6lNdFQd290yRi
         FFujbZAHlfQyQWhpGa4SlJ57VbyHVQRbMAEGM6gNF23uQ4bti50DdYI09pACeQl8zi8S
         9O32aBq2OB18FoDm5dkI9Q8tFcXxjrS99qwokEXCVrJSlz+SHzchEgM5DPU4noLMHIay
         J0kkwDVKt9Tu6ujmt2cJ/xXtDq6L77tcJNe2+yCKlDlCmZK2q89oCzqyJTWyRpoRZ+q+
         ga30JmNeHiL4ROLEBibr5beAkSQYhsiMPpzUuv8MK/1ihX8/1QAAJvqxz0FJNCawUE8t
         Otug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778420640; x=1779025440;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JaKkDzbjUfG47hTpmhpp44P0YzzZCcaap35EoHtPlAY=;
        b=fwatxZVXfrZuL16xXGP1TebY0BKS5tYLtcvTz+5yAdicbDsLclX3bf33u1f6RD5C5z
         OUhLcSQYpXXK3LTcbSSMy00kwHxGGeNCgo1mE2EqTveBQdzjsN4NjDrlv1O5CigfZ0o9
         EYUooHcti1l/GmVaMQGtapPINmU51v9dxoImkN6eNFGtm+Ufx/xYp0YRPLdmHycm+gMr
         egrjzElGdJBaq1vI8d6KYsDYDTioLLfSmsEMmbVXFdCPDC7FPWCeKUtcsAkDFV7Qk89C
         zXVFvkQuEwpsE8P9X0ftsC5z3RtuzuqKF7narFcydSP5w8TkJaHBlUFE7zgvL/IlY9Aa
         F/ew==
X-Gm-Message-State: AOJu0Yz7lLaJ4Zi1U+nAGTY0gKcz6gW8/ZRkyVb28NIYqqGaI6yaYIRn
	tKWNVFTaYrTzaVt5gx7B4P5aSZHFWiiRk7sNjKoVCpkLi0koykd+3pAU8WybQhzp/8khuX96bBR
	6dQM8pDbYGD9O0Y2IXg==
X-Received: from wmg20.prod.google.com ([2002:a05:600c:22d4:b0:48a:73ac:6247])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8706:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-48e70696dfdmr103727135e9.12.1778420640459;
 Sun, 10 May 2026 06:44:00 -0700 (PDT)
Date: Sun, 10 May 2026 13:43:59 +0000
In-Reply-To: <20260510082211.207450-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260510082211.207450-1-work@onurozkan.dev>
Message-ID: <agCLn6ebK9wERK-q@google.com>
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

On Sun, May 10, 2026 at 11:21:57AM +0300, Onur =C3=96zkan wrote:
> Drivers can use this during teardown to cancel pending work and wait for
> running work to finish before dropping related resources.
>=20
> This is not implemented for Pin<KBox<T>> because queuing a boxed work
> item transfers ownership of the box to the workqueue. There is therefore
> no separate safe owner that can cancel the boxed work while it is pending=
.
>=20
> The immediate motivation is the Tyr reset infrastructure [1], which needs
> to cancel pending reset work and wait for any running reset work during
> teardown before dropping the resources used by that work.
>=20
> [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.d=
ev
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/workqueue.rs | 134 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 112 insertions(+), 22 deletions(-)
>=20
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..a10daa2763ac 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -442,23 +442,44 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>:=
 RawWorkItem<ID> {}
>  ///
>  /// # Safety
>  ///
> -/// Implementers must ensure that [`__enqueue`] uses a `work_struct` ini=
tialized with the [`run`]
> -/// method of this trait as the function pointer.
> +/// Implementers must ensure that [`__enqueue`] uses a `work_struct` ini=
tialized with [`run`] as
> +/// its function pointer, and that [`from_raw_work`] rebuilds the exact =
ownership transferred by
> +/// a successful [`__enqueue`] call.
>  ///
>  /// [`__enqueue`]: RawWorkItem::__enqueue
> +/// [`from_raw_work`]: WorkItemPointer::from_raw_work
>  /// [`run`]: WorkItemPointer::run
> -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
> -    /// Run this work item.
> +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Sized=
 {
> +    /// The work item type containing the embedded `work_struct`.
> +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;
> +
> +    /// Rebuild this work item's pointer from its embedded `work_struct`=
.
>      ///
>      /// # Safety
>      ///
> -    /// The provided `work_struct` pointer must originate from a previou=
s call to [`__enqueue`]
> -    /// where the `queue_work_on` closure returned true, and the pointer=
 must still be valid.
> +    /// The provided `work_struct` pointer must originate from a previou=
s call to
> +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure ret=
urned true
> +    /// and the pointer must still be valid.
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
> +
> +    /// Run this work item.
>      ///
> -    /// [`__enqueue`]: RawWorkItem::__enqueue
> -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
> +    /// # Safety
> +    ///
> +    /// The provided `work_struct` pointer must satisfy the same require=
ments as
> +    /// [`WorkItemPointer::from_raw_work`].
> +    #[inline]
> +    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> +        <Self::Item as WorkItem<ID>>::run(
> +            // SAFETY: The requirements for `run` are exactly those of `=
from_raw_work`.
> +            unsafe { Self::from_raw_work(ptr) },
> +        );
> +    }
>  }
> =20
> +/// Marker for work item types that support cancellation.
> +pub trait SupportsCancelling<const ID: u64>: WorkItemPointer<ID> {}

Shouldn't 'from_raw_work()' be a method on SupportsCancelling instead?

Alice
