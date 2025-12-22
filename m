Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01995329C70;
	Mon, 22 Dec 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383860; cv=none; b=L7hU7lZFfINXBBDwQ7eB9JPeYQMsn6gRqfj/Z/VMveoO+s0JwsUd6m4kqoU40wEk3f6DVoP5sReasYJu9fduhhIj+FL/RVUSpEH6etwzavWCWsjBf/K/cWxNhba8CtCJbOubcxsnhVEusGkhKeXp+RiTGt5bz2PRSVTB38zeXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383860; c=relaxed/simple;
	bh=D+qIikUFT04oFQbZsgnsbDh+MC0xnpcUYZrh5tDQ3Bg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=P4AO/L/uBYbSNXiqbMUXqxLZ+1P6nU4fgOHBKPGNiZ45gNb+VnGSXWgVTrAyNORYUj4Eckq9re2SaaqhTYupN6ja5zqNVZVe0/4/ctKzsM7BRW0lNqNt+VEkxi9HO2oEjh84ptPEQCSfCBbEmuZ8NK3vHGbFTEhFMlWvKGBK2tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kw+5iESN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kw+5iESN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E4C4CEF1;
	Mon, 22 Dec 2025 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766383859;
	bh=D+qIikUFT04oFQbZsgnsbDh+MC0xnpcUYZrh5tDQ3Bg=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=kw+5iESNBpQewgFqpo1Z6xMY4rZwmEqVi3Dg5VlAe/Wht1VKlFM4Htjzvg+gO+mcu
	 On34lc2b95jI0/A+Eu4f//fjF9Kzt/CFyH7neuJxTmhsPYgSzN9bxCBfXBZ5ysmHOx
	 GAgfubW8ppZIHSshb0xPKBmtesSHYvHqAZxVDFxauyBfHzWMtajjqfg48NWujnwoeQ
	 a83DJU/L3dBY2W1VnWJMlRb77LoMJwAfuT+xaNfwzGjAR0U4XMIEQgkUbMX8ldnho7
	 B3JbOzz2vUPMGSHeTrY8MeUzDEKC0JsJz/DzZLthv0Nrwq+JyLXySc+jwARPrfrbaF
	 xUOvz4XoDqzzw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:10:48 +0100
Message-Id: <DF4ITDTG0RQH.8VVU1YY3RC6T@kernel.org>
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
Subject: Re: [PATCH v16 10/17] rust: sync: Introduce lock::Backend::Context
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-11-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-11-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:57 PM CET, Lyude Paul wrote:
> Now that we've introduced an `InterruptDisabled` token for marking
> contexts in which IRQs are disabled, we can have a way to avoid
> `SpinLockIrq` disabling interrupts if the interrupts have already been
> disabled. Basically, a `SpinLockIrq` should work like a `SpinLock` if
> interrupts are disabled. So a function:
>
> 	(&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLockBacken=
d>
>
> makes senses. Note that due to `Guard` and `InterruptDisabled` having the
> same lifetime, interrupts cannot be enabled while the Guard exists.
>
> Add a `lock_with()` interface for `Lock`, and an associate type of
> `Backend` to describe the context.

This message doesn't mention `Context`, which is included in the title
and the message itself isn't written in imperative style. I'd recommend
putting the `lock_with` in the title, since that is the important part.

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>
> ---
> V10:
> - Fix typos - Dirk
>
>  rust/kernel/sync/lock.rs          | 12 +++++++++++-
>  rust/kernel/sync/lock/mutex.rs    |  1 +
>  rust/kernel/sync/lock/spinlock.rs |  4 +++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 46a57d1fc309d..bf2d94c1999bd 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -44,6 +44,9 @@ pub unsafe trait Backend {
>      /// [`unlock`]: Backend::unlock
>      type GuardState;
> =20
> +    /// The context which can be provided to acquire the lock with a dif=
ferent backend.
> +    type Context<'a>;
> +
>      /// Initialises the lock.
>      ///
>      /// # Safety
> @@ -168,8 +171,15 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'=
a Self {
>  }
> =20
>  impl<T: ?Sized, B: Backend> Lock<T, B> {
> +    /// Acquires the lock with the given context and gives the caller ac=
cess to the data protected
> +    /// by it.

I feel like this "it" could refer to both the lock and the context, so
it's best to repeat "the lock" here.

> +    pub fn lock_with<'a>(&'a self, _context: B::Context<'a>) -> Guard<'a=
, T, B> {
> +        todo!()
> +    }
> +
>      /// Acquires the lock and gives the caller access to the data protec=
ted by it.
> -    pub fn lock(&self) -> Guard<'_, T, B> {
> +    #[inline]

This change isn't in the message? Is it intended to be here or somewhere
else?

Cheers,
Benno

> +    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {
>          // SAFETY: The constructor of the type calls `init`, so the exis=
tence of the object proves
>          // that `init` was called.
>          let state =3D unsafe { B::lock(self.state.get()) };
