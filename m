Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F144391501
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274994; cv=none; b=XiVwV74JPgmwwloTDHQC0is7AjrNczVKX390dzMgVNPnvAEFSqF6Hr+knnYf3ZnXRJDrbREM7bYf4wj3sRGJD+CuyAknJo+8bumAFC3AsCZln3xq4rC55ixvSxAUsPzLkVIh1UWd6knLpgT7hvzuQe14iH3ZEPMECTvioTvmDjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274994; c=relaxed/simple;
	bh=kcWOBHhL0Othr4/xH2jWnmqZsEXqPSqzzLk+87ou4mU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UQMAcpZXwVKOIkYu4gZnCgu3r/jLhE2vR4xxwsBbs2pHcvU895/HX2dwoHaend/htE6D3LKQ3+oB7uzmw7d0abrkLFDc0e8vbuV1vC9omk4NlyiSLF4Gd6eA7/RYwJAuiE4CjaatrF8By8j307pCxr5agjZUwAQjfztStQcH/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V1PJ9/1C; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V1PJ9/1C"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d780757eeso6272596f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777274990; x=1777879790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb64gpRNptFvwSlo8JtSZZqe+KrTXpxUtsAcslpaJoU=;
        b=V1PJ9/1CKidHEUfDSJNM4+BwyZLnvzqKQwttAJNpwm055u1XR7H/PkoRFPN/y2ADL+
         08EH7gg+JrUNoQSKe5TAjzZsKPaaoOcA33UoCItSjrrG0oZOfOOuohe7OnaGbjSCKyzQ
         0A7xJ34j4Y3PiVVmR6wRHzcc2REFYcWN7zECa4sudyLbsvABD46BE1Le/Jg0ikmi3fkU
         ODzCUPp4NZWjTo2ORKHY+7htTySFQkToWvB9yZ30O7jNAuZC2HQ8BR46fuK41i5jT8Nx
         ZB7t7LRI2mFRnkmaolREtI+NK9QsgwhkRgxNYFjsP/wC+IF4O+Rk0vXSjxSKg556EmFa
         I2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777274990; x=1777879790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qb64gpRNptFvwSlo8JtSZZqe+KrTXpxUtsAcslpaJoU=;
        b=V0TlKHLT+IoAOgV4tF2y1IVi5LzQlv5yA/S3dI72JzCdzpxnXKPdDsXVRe/2oXC/eF
         hQVL4jxQ4Rgk9Mly6uWQqEMx1/0SczJLycvNRkZae/BwYzmcgRrLQE2ljrFmavFm/InK
         G84TBfhPSYfMmZFgQDy8nQ8TuUq/LfN97ajHSvQ4K4Qt+0BqueKxi4woMYCa+pYCoRnT
         EzizWGH9mRg5+Kgum95ObBhJePLqKh5dqLEyCKsW9bTvhNFnK4gC1NTG3Gd/+WCjg/xb
         txk85pDSErK1N5Z0ZTgc4ho2hIOLXUvM3qe/RVypLL+8HnaBaKaoaIH0sMJ4+uj95mJ/
         0X0g==
X-Forwarded-Encrypted: i=1; AFNElJ/j/MvfIviXC8xvE7kEvCBa6okYiZA6vnt1PCLnDYaXVWO1DilJHBqB5Mb7lhXaNyLz2s9tgmX9C5jIkVQsyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxabv1WeR4lovesqYRbUtnRDrqaSjeqlx/chg1mqLoFWueXxykU
	mmPEsrB7OX3aSZnizNRkRDEPHnsVoilHEXOtrpcLkJdcSryVHPF4UnrECZfrbcU2amhr27wmeSu
	l0NkFyHJLyHFa/1sfcA==
X-Received: from wraz11.prod.google.com ([2002:a05:6000:468b:b0:43d:65d8:7edf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f14:0:b0:43d:7086:b03 with SMTP id ffacd0b85a97d-43fe4032b76mr53236111f8f.1.1777274989556;
 Mon, 27 Apr 2026 00:29:49 -0700 (PDT)
Date: Mon, 27 Apr 2026 07:29:48 +0000
In-Reply-To: <20260419001141.211935-1-ashutoshdesai993@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260419001141.211935-1-ashutoshdesai993@gmail.com>
Message-ID: <ae8QbGQojU7CydGp@google.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, 
	ojeda@kernel.org, longman@redhat.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Apr 19, 2026 at 12:11:41AM +0000, Ashutosh Desai wrote:
> Guard is marked #[must_use] since dropping it releases the lock. GlobalGuard
> wraps Guard with identical semantics but was missing the annotation, so
> discarding it would silently compile without warning.
> 
> Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does not
> propagate #[must_use] from T, so the attribute needs to be on the function
> directly - same reason Lock::try_lock has it. Add the explanatory comment
> there too.
> 
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
>  rust/kernel/sync/lock/global.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
> index aecbdc34738f..7067bdcca9c2 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -85,6 +85,8 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
>      }
>  
>      /// Try to lock this global lock.
> +    // `Option<T>` is not `#[must_use]` even if `T` is, thus the attribute is needed here.
> +    #[must_use = "if unused, the lock will be immediately unlocked"]

I don't think there's any need for this comment.

Otherwise LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>      #[inline]
>      pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
>          Some(GlobalGuard {
> @@ -96,6 +98,7 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
>  /// A guard for a [`GlobalLock`].
>  ///
>  /// See [`global_lock!`] for examples.
> +#[must_use = "the lock unlocks immediately when the guard is unused"]
>  pub struct GlobalGuard<B: GlobalLockBackend> {
>      inner: Guard<'static, B::Item, B::Backend>,
>  }
> -- 
> 2.34.1
> 
