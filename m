Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8413635E;
	Mon, 22 Dec 2025 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766382652; cv=none; b=ut/m/wUyePiT332VDbKsxhchivsQ2aoAElhDWrGyKb2EnGe1ID7Ltpoogcqt9v28aemNPBrhlNBiLWILacWeEI8SKWJLy2dsrbv/98Zkd3USZ0L2NQpQ4gcGqPHwFDvdLzlSDwjB2BC/BHb8NCe4pQH91iiZ0t3nq7F6L0qCfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766382652; c=relaxed/simple;
	bh=wsyEjfKYgbefk2l3m6zbleGND/J4yNhFXzphOiMnKbk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=SK+OjQ1ps/Vt0ZVzNPVzEOSKAU3abEJmtcIlJK843i1kmXbKYJvG2Zcywi7KB3cCAaMR5SzPyK05ueH2e3CqAZ9Yw3NH5THBJVRHpcxMd1MA05wZNgf0q8g43sIvOQ4CQrJbCci6c4bsJcCch5ixCE6PP25KUubpFDU+THgA4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHXrwTW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHXrwTW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09D2C4CEF1;
	Mon, 22 Dec 2025 05:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766382649;
	bh=wsyEjfKYgbefk2l3m6zbleGND/J4yNhFXzphOiMnKbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHXrwTW+0YMPyhrUcxwK7nyMUBvAxPrI3Q31i+ldHkH+2lXFpUArA2erjWAZVl5BC
	 xRS2MZuoCQBt4/10QLqn5QOMQgcoVGkzTz9cpxaeXlCWHf9mCIvscRDl6jSqYVUSWD
	 aHk33tbG6Vk/ztqWQXkYJmvG5pkRoGtsNu25tM0Ok3KmaYnb5nkVqg43obkYVaou7O
	 Ow1+vs7rnbzc6ks/y8tUlnXzTW+ApKANfVXqpzgLVM5+2QNNhPCEQtBmrrAqD6SU7z
	 Sv4Ewku1ISMYHAgxns6kEL0Pf4vU7XuVP/Vm5suKHerRKKa5lXu9p9lo2mkMIN7noB
	 u4DrUBFyMZ/Ww==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 06:50:44 +0100
Message-Id: <DF4IE0A2ZGSG.YBG5E9W03V5I@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v16 09/17] rust: sync: Add SpinLockIrq
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-10-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-10-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:57 PM CET, Lyude Paul wrote:
> A variant of SpinLock that is expected to be used in noirq contexts, so

You say in the next line that `lock` automatically disables interrupts,
so you also should be able to use the lock in contexts with interrupts,
right? Feel like this would be better summarized as

    A variant of `SpinLock` that ensures interrupts are disabled in the
    critical section. `lock()` will ensure that either interrupts are
    already disabled or disable them. `unlock()` will reverse the
    respective operation.

> lock() will disable interrupts and unlock() (i.e. `Guard::drop()` will
> undo the interrupt disable.
>
> [Boqun: Port to use spin_lock_irq_disable() and
> spin_unlock_irq_enable()]
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

> +/// A spinlock that may be acquired when local processor interrupts are =
disabled.

Similarly here, I would reuse the first sentence (or a variant of it)
that I gave above.

Aside from Gary's comments, this patch looks good:

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> +///
> +/// This is a version of [`SpinLock`] that can only be used in contexts =
where interrupts for the
> +/// local CPU are disabled. It can be acquired in two ways:
> +///
> +/// - Using [`lock()`] like any other type of lock, in which case the bi=
ndings will modify the
> +///   interrupt state to ensure that local processor interrupts remain d=
isabled for at least as long
> +///   as the [`SpinLockIrqGuard`] exists.
> +/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled=
`] token is present and
> +///   local processor interrupts are already known to be disabled, in wh=
ich case the local interrupt
> +///   state will not be touched. This method should be preferred if a [`=
LocalInterruptDisabled`]
> +///   token is present in the scope.
