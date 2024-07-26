Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D517623E
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721988803; cv=none; b=tnI0NrOpH4J5Wtda06dut0aEMtgg37lgEC1HGu7FqbbVSTG7ij5E/oNzq8/SVSdT4N8y4R6DizJLsouFfsEuyvGevg5jdRetjvmXTOvwxu1FZAGwhn2VtafRSMtdLJl3Xrk6FNC8JBNpa9Gw1xIlbQh/qHTZ0fp4//KKwLbAcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721988803; c=relaxed/simple;
	bh=ru2fXSjDT+qFoaiJZWkBKhtWH0BG0J1Ftkg79GV8/A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R23DiIwXS4Bd3ixMrewn51hcx+GTDo5ypHDbQGY3bAnZeLTtoDfnDFWiataOoi8wQerc7iao3TSc5s5Ki9h0GfWcv9K8uzD3BP1rFD1t7MKSFI0htN83OZkR+jaCYuO90RCXxjrZo0HgpXTReJsh2OHqXv1cu9nB1KK1s7ypwHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=N/B5MEIH; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="N/B5MEIH"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65f880c56b1so18728847b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1721988799; x=1722593599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoIzlV10QkJm2sDOzopormwa/gqLVMn6MQy6YSu+s8E=;
        b=N/B5MEIHdUdEbCHQqtFgBB/8oW1vTq+RYs+qjRY7WnSqsJxO1pHcuj0H0YgRAd2zuQ
         MmVDZ7vPUI3GZ3bVB/6zTdPOkfSl/VrSc20jyW4LtaW/xaA02CBoWOhfjLzLQOpBefDf
         8/JokhzzCY6pAAt14RzOsS/rYCD+OBf+TlDyJAe+IRt8z/OI9DW+eIP7NrLo+nfIaHI6
         MJokWxGBXFsDA6x9UW8SnA4xe2FuUPVuKqFX9TpxCwrWawFPeqNX3XvRmGPNFnGvW01D
         8q1h94n9gTd/USTGJqZQiBbDmfLzSyVo9W/g36i1C7mBepNzZ4TFvcyWSGpptTtli+ZL
         7biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721988799; x=1722593599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoIzlV10QkJm2sDOzopormwa/gqLVMn6MQy6YSu+s8E=;
        b=MZ9d0xBZ56C9LzMCJgyB9UdBwGm7OgZx842YRDetgL2bkEBLbUutRcNgVofu4qW3OD
         zVwrj2V4CbEAFAR2ADEYIXN44nstO+iWPn2t3TJL3U9xivOIWhI3+22KDCcKvb8JkhiL
         /EQOvlpGc4RicLB5SXSTLlZ4HSX7q/5s1yn2gcN3WLjF/gs3YHu1duigrBH6AuMvw8Hj
         Ulr9gSuIVcRU9M61RGyf22cosBi8yCEOvuFCucehHUTy/W4pERBuRnHplDVwjIThBkOx
         VnoqSFi+WCWhnB8344RMCF9LPY56lcJ42U7Qf52dh0rtCampeaQDzkwbx58u26CogEl/
         lrRw==
X-Gm-Message-State: AOJu0YxTEIXr8GlhsNDnUQ/8xWf2Ht6eQatGSYWhdLDnnTVLMP5hK9uA
	k9LPivwQQeTzS/4f2QzT7SsJEuMDzF16qZhZVcItM+04IZ1WgYtSEjgTnD3zI+nZVkiuyZqC09z
	7MSyQ+9f17UqFRAKMPr/qgFtg1EDGCLjkx5QyJQ==
X-Google-Smtp-Source: AGHT+IHb9wZZglRZTzfdXD29gqYver0a9ZhW9i0uWGsJNu+ZdwQ5bxeBQKpEwDHvdQsFpMVyhPBAsylxhyOhTbevYxw=
X-Received: by 2002:a0d:fb02:0:b0:65f:c95f:e7c7 with SMTP id
 00721157ae682-6751082c316mr60048257b3.7.1721988798805; Fri, 26 Jul 2024
 03:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725222822.1784931-1-lyude@redhat.com> <20240725222822.1784931-2-lyude@redhat.com>
In-Reply-To: <20240725222822.1784931-2-lyude@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 26 Jul 2024 06:13:07 -0400
Message-ID: <CALNs47tra0+zdjiBZJgqWBm9v0Q-Osdhj_T_Sh8o00ASzjqWRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: Introduce irq module
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Aakash Sen Sharma <aakashsensharma@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 6:29=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> This introduces a module for dealing with interrupt-disabled contexts,
> including the ability to enable and disable interrupts
> (with_irqs_disabled()) - along with the ability to annotate functions as
> expecting that IRQs are already disabled on the local CPU.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/helpers.c     | 14 +++++++++
>  rust/kernel/irq.rs | 74 ++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs |  1 +
>  3 files changed, 89 insertions(+)
>  create mode 100644 rust/kernel/irq.rs
>
> [...]
> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
> new file mode 100644
> index 0000000000000..8a540bd6123f7
> --- /dev/null
> +++ b/rust/kernel/irq.rs
> [...]
> +/// A guarantee that IRQs are disabled on this CPU

Nit: `.` after summary

> +///
> +/// An [`IrqDisabled`] represents a guarantee that interrupts will remai=
n disabled on the current CPU
> +/// until the lifetime of the object ends. However, it does not disable =
or enable interrupts on its
> +/// own - see [`with_irqs_disabled()`] for that.
> +///

I don't think lifetime necessarily needs to be discussed here, since
this doesn't have any  action on drop. A functional description may be
better, possibly:

        A token that is only available in contexts where IRQs are disabled.

        [`IrqDisabled`] is marker made available when interrupts are
        not active. Certain functions (such as [`SOMETHING`]) take an
        `IrqDisabled` in order to indicate that they may only be run in
        IRQ-free contexts.

        This is a marker type; it has no size, and is simply used as a
        compile-time guarantee that interrupts are disabled where required.

        This token can be created by [`with_irqs_disabled`]. See
        [`with_irqs_disabled`] for examples and further information.


> +/// This object has no cost at runtime (TODO: =E2=80=A6except if whateve=
r kernel compile-time option that
> +/// would assert IRQs are enabled or not is enabled - in which case we s=
hould actually verify that
> +/// they're enabled).
> +///
> +/// # Examples
> +///
> +/// If you want to ensure that a function may only be invoked within con=
texts where interrupts are
> +/// disabled, you can do so by requiring that a reference to this type b=
e passed. You can also
> +/// create this type using unsafe code in order to indicate that it's kn=
own that interrupts are
> +/// already disabled on this CPU
> +///
> +/// ```
> +/// use kernel::irq::{IrqDisabled, disable_irqs};
> +///
> +/// // Requiring interrupts be disabled to call a function
> +/// fn dont_interrupt_me(_irq: &IrqDisabled<'_>) { }
> +///
> +/// // Disabling interrupts. They'll be re-enabled once this closure com=
pletes.
> +/// disable_irqs(|irq| dont_interrupt_me(&irq));
> +/// ```

I think it would be okay to only have examples in one place, possible
`with_irqs_disabled` since that seems like it will get more direct use.
If you would like one here, this one and its docs may need an update
(takes by reference rather than by value).

> +pub struct IrqDisabled<'a>(PhantomData<&'a ()>);

#[derive(Clone, Copy, Debug)]

Since this needs to be duplicatable.

> +impl<'a> IrqDisabled<'a> {
> +    /// Create a new [`IrqDisabled`] without disabling interrupts

Nit: `.` after summary

> +    ///
> +    /// If debug assertions are enabled, this function will check that i=
nterrupts are disabled.
> +    /// Otherwise, it has no cost at runtime.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This function must only be called in contexts where it is alread=
y known that interrupts have
> +    /// been disabled for the current CPU, as the user is making a promi=
se that they will remain
> +    /// disabled at least until this [`IrqDisabled`] is dropped.
> +    pub unsafe fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +/// Run the closure `cb` with interrupts disabled on the local CPU.
> +///
> +/// Interrupts will be re-enabled once the closure returns. If interrupt=
s were already disabled on
> +/// this CPU, this is a no-op.

The wording makes it sound like the entire function is a no-op if IRQs
are disabled, rather than the act of disabling IRQs. Could you clarify?

Suggested docs addition:

        This creates an [`IrqDisabled`] token, which can be passed to
        functions that must be run  without interrupts.

        ```
        fn some_sync_action(_irq: IrqDisabled<'_>) {
                /* When the token is available, IRQs are known to be disabl=
ed.
                   Actions that rely on this can be safely performed. */
        }

        with_irqs_disabled(|irq_dis| {
                some_sync_action(irq_dis);
        })
        ```

> +#[inline]
> +pub fn with_irqs_disabled<T, F>(cb: F) -> T
> +where
> +    F: FnOnce(IrqDisabled<'_>) -> T,
> +{
> +    // SAFETY: FFI call with no special requirements
> +    let flags =3D unsafe { bindings::local_irq_save() };
> +
> +    let ret =3D cb(IrqDisabled(PhantomData));
> +
> +    // SAFETY: `flags` comes from our previous call to local_irq_save
> +    unsafe { bindings::local_irq_restore(flags) };
> +
> +    ret
> +}

Maybe it would be better to put some more extensive module-level docs
with a couple examples, then for the function / type-level docs just
link there?

- Trevor
