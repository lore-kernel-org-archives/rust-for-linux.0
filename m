Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA538AC72
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302447; cv=none; b=hmKvjqdRx9GVZy1vCKDrIiNZLA2frWTwTX5pDMzMUwtJLovt2QXil9Kch0sT8Fw1UWLgQXrybshbRf5TvJ6PTKvWDxZjozFDD1EvwmRHw1UjaH1RdLYYQI0Rz8yB6hbZNOvFsrE6PDOeGEAQz2t8Fn6sgaP9Cn/WvCoyDZDWmjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302447; c=relaxed/simple;
	bh=t+dnppFMEGeoZ/ydmkd80sIcRl1gxzmyzLFKle74YGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dLtofWweHPPdd41UP2RQU9//cfFHmHGI0YKiLyG9b5h2td5Mfg6YLehsSo/xS76JO/e3/Od5vnQMWF/oLwvqNpGeMnAGSXhKwY0uoAW6oggKNx561q+iiLxNHA9bwIr66ObQ2WJ4etxVI8N0+3GkNj7CT5lW/TV9tfMWIcmOs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tVBMqej+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tVBMqej+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso8437215e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780302443; x=1780907243; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq7ALf+FOEjLDdqPLEA45eziVb8cwXdfxyjqJN+Z0NQ=;
        b=tVBMqej+tHBRzCoQ9lDljvwzgSzj70c89oDdjAUZvQugF+Uaxnt8WjKZ1XFzAQ1XCu
         07d9UhAEqGunWdjW9ClDSbcexOGI29ZEBskt9iix4EVOmaGdU5y+jO1JA/3Gt/GwT8hh
         EbzrO77Sc0Xb27Oi74Gw8Dd9T+Ek6gECYZL2lkxxwCqkVFKiTRQlJ4XwWVakStV9wMqK
         uzJdovrXV0qaGtwXgU/4gf0YzN5Ts4+oNFvZ7FFjpH2Fb0skR9+A46egoaxv65YXf+m/
         7F2Z6zIPt4/RVgzOTInZzhLnVzf66sgG3de1tkgTgAVMosBc/wzewVrkJR//0YZzqh3M
         RJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302443; x=1780907243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq7ALf+FOEjLDdqPLEA45eziVb8cwXdfxyjqJN+Z0NQ=;
        b=ZLligZcsUoZLApFbOjy28oo5H1v+xx9FlEdCwpv0aw1nubG+jaEblSsJttt4s/P3at
         X4po/U9vpMY0N7oxeAy1c1nhZudHIYmk+lBKy1cr4bx63yzLwbKoTBKgQSJLqEqGYr3Q
         Ak1WBtM6wj++xxvka7HoMVnT6D15HaF4g3sBVmAVYtEjLvhuH0DeUGdMW0ahl3MFVFAa
         nPSdiCCsQWs0V3r8aljS2SyOm+g5ruKntCus4phCFImhQNV5cEKOFxVLJ4ia1O0CEjw5
         /hDaWUaldrismt51pAZD9as+J+5T9xlfWjik9kdEh5I9l+t16UV2CUdtVErvsi2Q6CYG
         +KlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DC4LXKvD6T50SjIv/PPqIV0LahqnqMG0W1+z9uxw7ksQyDrZW/CyHJUc3B8W6uTBNe0rNYV3TXG73DK+V8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4Rg/OtrUJTBBte5UmeW5DAK9ETFH+wna34azWBVNT5iekeyc
	024M06rQ2RUfWCO5YNXj+/j669QosgHQ2MYAcI7Qllp83hkd5pSPh+0RJwBSacKpoDKexFFMoyc
	ILGVvQHGuAhX1OCP6EQ==
X-Received: from wrbdm2.prod.google.com ([2002:a05:6000:bc2:b0:445:168d:28e9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e92:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-490a2900ef2mr188288625e9.6.1780302443446;
 Mon, 01 Jun 2026 01:27:23 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:27:22 +0000
In-Reply-To: <20260529173137.303717-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529173137.303717-1-lyude@redhat.com> <20260529173137.303717-3-lyude@redhat.com>
Message-ID: <ah1CarNtFhCvAAav@google.com>
Subject: Re: [PATCH v2 2/2] rust: sync: Introduce LazyInit
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>, 
	Ingo Molnar <mingo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Benno Lossin <lossin@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, May 29, 2026 at 01:30:42PM -0400, Lyude Paul wrote:
> SetOnce is nice, but it does have one problem - you can't use it with
> fallible initializers. While we will be adding support for doing that with
> SetOnce, this leads into another problem: There's no way for racing callers
> to actually block on the initialization of SetOnce, which makes it a
> difficult type to use safely for situations where we want to initialize
> data fallibly once, and then provide access to it to multiple users at once
> until drop.
> 
> So to solve this, introduce a new type: LazyInit. LazyInit is like SetOnce
> with a couple of important differences:
> 
> * It can't be used in const context
> * It can handle in-place fallible initializers.
> * It uses a Mutex for synchronization instead of an atomic, allowing
>   callers to block on initialization.
> * It requires its contents already be Send + Sync, since the Mutex protects
>   initializing data and not the data itself.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

> +    /// Retrieve the contents of `inner.data` and extend their lifetime.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `self.inner.data` has been previously initialized.
> +    #[inline(always)]
> +    unsafe fn data<'a>(&'a self, inner: &MutexGuard<'_, Inner<T>>) -> &'a T {
> +        // SAFETY:
> +        // - Our safety contract guarantees `inner.data` is initialized.
> +        // - `T` is `Send` + `Sync`, and thus does not need the `Mutex` for synchronization, making
> +        //   it safe to hold onto outside of the lock.
> +        // - We're guaranteed via `Inner`'s type invariants that so long as immutable references to
> +        //   self exist, `data` cannot be uninitialized - ensuring it lives throughout the lifetime
> +        //   of A.
> +        // - We're guaranteed the container of `T` will not be written to via `Inner`s type
> +        //   invariants until `Drop`, ensuring it remains populated for the lifetime of 'a.
> +        unsafe { mem::transmute::<&_, &'a _>(inner.data.assume_init_ref()) }

I'm not a big fan of using these kinds of tricks to access the contents
of a mutex after unlocking it. Could we instead use a struct like this:

struct LazyInit<T> {
    data: UnsafeCell<MaybeUninit<T>>,
    set: AtomicBool,
    lock: Mutex<()>,
}

or even:

struct LazyInit<T> {
    data: SetOnce<T>,
    lock: Mutex<()>,
}

I think this logic will be simpler for everyone.

By the way, another option is to use a similar strategy to
https://lore.kernel.org/rust-for-linux/20260523-upgrade-poll-v4-2-f5b4c747eac2@google.com/
where you just use SetOnce and protect calls to `populate` by another
mutex in the structure. Then you don't need a separate LazyInit.

Alice
