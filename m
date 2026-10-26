Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005721;
	b=EWQfxUMlUga33U3ohW51Rgk/74nb0V03Lq+O637pzLEe636jjPpQvVI2efeeAeuWrBls
	 8ysObzO8hNacWZ1WDSIohhlJTG9DHtZO3PEozUjdisBUXQ/IKZJMpM/xw+86yIjSUZhqq
	 sUJYJcF9Zvvho8Z8YJWbomsoqg8P9p+Qb4ml+9mKUYYtMjwctNdDneY5eYkZ5m7PWPpfT
	 1KNL3Ek+AxMtx0mnXtfcZDPOWzlaroSPe+OXBalurZ5xdiIdwUiYM73MahN7MJJwXpxkD
	 aZp3T68s8/a18Fwq79tivanls81jItvmiDlc3s3C19QZFURV9JVqbo5Rqwt/PhD+KsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6xeXvSy4w9o/b7yWR4xuzrTkC32fzIISOboFKZOljJg=;
	b=E92HRJt+FHG6HnKyS9Dnrlg5KmusGzb3DB4X8/Gs1cpzPPj3SSVpKx/9xvjgMBoQvROV
	 n6DtFSLg2Wy545EorKMngnVlYaxh2lrgJ66f/K3+atL2uqKgOvUWWkbIouMfVFHKe/K9+
	 QjfuRJWt5KI/fkJm0fcGdrkxL/j/Y69J8XZUc1/0wF9TmxLdd+aT+tNAPszbk3jxoS5om
	 Uz85/LmQt3Jd9EbR6aNFPS3P5ZUMaeQUAsjlFNrDvc//5Dm/Cjq+L7fOV0m4nag8wYONp
	 b7HrdTmHW4VU6w4GPUDVYRkrJftDVJKqvAXAC2Cw1pJcqBGXDdE7fMVtVHeInNHzrwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=E2nChXtY;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58104606A329
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 09:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58104606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=E2nChXtY
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so21041735e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793005720; x=1793610520; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xeXvSy4w9o/b7yWR4xuzrTkC32fzIISOboFKZOljJg=;
        b=E2nChXtYMbQzknLcmsGLItmLC33Vcbz7TbExnMP+FecCooTiWq8lJ493eTYmIPi2PX
         bZj1RRLB5LqOIVxzeci4CNxwdFZRQW8jAToRqp0ufyGK6ilTTLvlllNRfZpnpK4VreSj
         9bkldAP250R8LDLN6wNj6MurdUwCQ2ckDlZx84loRK9c0FKIZODfLLBF7McNytU5JgBo
         f3BnzHEJ7YzXEOatj79J/D6nULRTV+0+3L56I7IzA7FHKTSx9+bXzR+tyS9fKGkIyvbZ
         goY5gmTvWP6XltVnvDup8uu2RSWRksFpCxGoeNAi0HVXCDBSDveY9BkfVUn+qu+9TMa+
         EOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005720; x=1793610520;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xeXvSy4w9o/b7yWR4xuzrTkC32fzIISOboFKZOljJg=;
        b=Kv87X08UGvq67657pGY3LYM4qF5iuLo/HTFuS+6Pod3cQXGQrQbEToHJsXisOuLUT3
         N0GIPzUt+moieyZ0vHUv2R3xCwA2YOvrZVL5O0hke6jt0AtFWDULX/UThFAYrKSlNHEz
         MjXD6Lp6iWj+B0+qJPJwcrKF9ZL1zcIi8zcydAAIHMSCa4YmcXshW5ULpvdNOLUs+MMv
         O9rRwDNJglddQQ0oJgcqxW1KvvmvakjIlRrFUr8k9GT1bPdIoV9oCOOX9i6iyhpuR16q
         mFAF3d7GRaz9Cx3X2GcXF9JnKPHAdEtEw40YDl7KSxclTtxlMdpQQXKmOlUNBNwAAnZV
         z3sA==
X-Forwarded-Encrypted: i=1; AKwUvByvdigXxp4N7B5IAYmxi4ijvOEollghQ5Fhc8aNcNaErY4Wc4lwgSeFYqyQS/nyAVQFDbYxWYcaY7TzH/LwSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKtqk3ASH9rqKU3DrNJANnsfTcXm6IpL9tEQqrJwfmVD7+GpvBL
	3URV8Nrt4JlO2F6fK6oGBVBgFMNiCQ4wXwFSvXyZFY4eVhP93NJHcYCd6LmFRscv0UOp0oRzo2k
	S9C+0ZHf55n8UcuGaig==
X-Received: from wrvd13.prod.google.com ([2002:a5d:538d:0:b0:48a:fe63:7751])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c9:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4a35acebc28mr107940825e9.33.1793005719194;
 Mon, 26 Oct 2026 02:08:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:08:36 +0000
In-Reply-To: <20261005134010.302208-1-laura.nao@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <arOP5iuLuj1aTiLl@google.com> <20261005134010.302208-1-laura.nao@collabora.com>
Message-ID: <at8YlKUJOWc_X-JV@google.com>
Subject: Re: [PATCH v6 2/2] drm/tyr: add Job IRQ handling
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, deborah.brouwer@collabora.com, 
	dri-devel@lists.freedesktop.org, gary@garyguo.net, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 05, 2026 at 03:40:10PM +0200, Laura Nao wrote:
> Hi Alice,
> 
> On 9/23/26 10:37, Alice Ryhl wrote:
> > I agree with sashiko's review here.
> >
> > This needs to happen after the free_irq() call in the destructor of
> > TyrIrq.
> 
> Thanks for the feedback.
> 
> In v5, I was masking the interrupts in TyrIrq's PinnedDrop impl which
> resulted in clear_mask() being called after free_irq(). However, sashiko
> warned the device could then assert irqs after free_irq() completes
> but before clear_mask() runs, potentially leading to an IRQ storm that
> could result in the shared line being permanently disabled. 
> 
> So calling clear_mask() before free_irq() should avoid this, but we
> still have to deal with threaded handlers potentially re-enabling the
> mask after clear_mask() has run (as per sashiko's review on this current
> revision). Adding the atomic state should help with that though, as you
> suggested:
> 
> > And most likely, we need an atomic along the lines of ACTIVE /
> > PROCESSING / SUSPENDING in panthor_irq.
> >
> 
> So I'm thinking something like this for the state:
> 
> #[derive(Clone, Copy, PartialEq, Eq)]
> #[repr(i32)]
> enum IrqState {
>     Active = 0,
>     Processing,
>     Unregistering,
> }
> 
> unsafe impl AtomicType for IrqState {
>     type Repr = i32;
> }
> 
> This could then be stored in TyrIrq:
> 
> #[pin_data]
> pub(crate) struct TyrIrq<T: TyrIrqTrait> {
>     irq: T,
>     state: Arc<Atomic<IrqState>>,
>     #[pin]
>     _pin: PhantomPinned,
> }
> 
> Then TyrIrq::handle() proceeds only when the state is active and
> TyrIrq::handle_threaded() re-enables the mask only if the state is not
> `Unregistering`.
> 
> Does this make sense to you?
> 
> As for masking before free_irq() runs, I'm thinking of possible
> alternatives to JobIrqMaskGuard and its ordering convention (i.e. must
> be stored in a field declared before the corresponding
> `ThreadedRegistration` in the struct that owns both). Would it make
> sense to define a TyrIrqRegistration struct that wraps
> ThreadedRegistration instead? and then clear the mask in
> TyrIrqRegistration's drop impl.
> 
> Something like:
> 
> #[pin_data(PinnedDrop)]
> pub(crate) struct TyrIrqRegistration<'a, T: TyrIrqTrait> {
>     #[pin]
>     registration: ThreadedRegistration<'a, TyrIrq<T>>,
> }
> 
> #[pinned_drop]
> impl<T: TyrIrqTrait> PinnedDrop for TyrIrqRegistration<'_, T> {
>     fn drop(self: Pin<&mut Self>) {
>         let handler = self.registration.handler();
>         handler.state.store(IrqState::Unregistering, Release);
>         handler.irq.clear_mask();
>     }
> }
> 
> This should make sure teardown order is still respected without relying
> on the user correctly putting the guard before `ThreadedRegistration`.
> 
> Any thoughts on this approach? In case it helps as a reference, I've
> drafted both IrqState and TyrIrqRegistration in [1].
> 
> [1] https://gitlab.freedesktop.org/laura.nao/linux/-/commit/c78e296690e643b790fb3195660f1229e3cdb5ca

I believe there is still a race. In this code:

        if self
            .state
            .cmpxchg(IrqState::Processing, IrqState::Active, Full)
            .is_ok()
        {
	    // <--- thread is preempted here
            self.irq.reenable_mask();
        }

If the above code performs the cmpxchg, but then gets preempted before
it runs the reenable_mask() call, then another thread can come along and
execute:

        handler.state.store(IrqState::Unregistering, Release);
        handler.irq.clear_mask();

clearing the mask. Once the original code starts running again, it calls
reenable_mask() even though the state is now Unregistering.

This incorrectly leaves the irq enabled even though the
TyrIrqRegistration has been dropped.

Adding a lock around these critical regions would solve this, because
it would make preemption between `state = Active` and `reenable_mask()`
impossible.

Alice
