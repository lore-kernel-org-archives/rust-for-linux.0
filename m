Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963013D24D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722507011; cv=none; b=ERVOEenkSkbX4fIRZ/HA3ywvvo7XQuWoMx4TBQ9I7ObAqRBDtJQPdRyNdqnXSihuDHp3S1RTz/uTfNnCaIGYy3OEZJ9LPsrZUJ5bjLOM+TQmfvS8P1dPY2cE4PqurszD2Iy04HrDjigrFGU+/jvnkzZ4TvMMm5JakmqZQvDxju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722507011; c=relaxed/simple;
	bh=pmjSn+q1ifOaA2k5eqF/tfKE/88jqEPD7cjG9zacuzk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PW4U5Ct2q4ZtmG9sNAKhuCrzGRGniQl3Kp/F1i1kvqawk6AoJr2FbNK4pXiO3UDcqj8O9FmL4frSwKG0avXzgKsWsylmD7Vq6QV0M0f0f0EkrjlrgPJUXK99FUS+P6YGbela3SwgMShQxtdQIqOD3uT4jXUfofk1VMecGUlRZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PQFqD95+; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PQFqD95+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722507006; x=1722766206;
	bh=G7Oj40FNMrtAiodcL8qUhrfYw1p13xTbvDkgvmXeYHU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PQFqD95+kFneOfJeAgAJ2z7XDwDXjK7H1Fwpw6XqIVzom/ghqp2gyaRIfO2c0bdBm
	 7XBLxhE5kKDAG6HfVIZUBXK5GD4hVaaxbSVSIucYMi+rNmFOWQ/cjufwGIghWW8LMH
	 zYHyT1pXQEwzlSH176kPna9/oSdtDncQFNngK6JyMQsiXTzU2WTwouRy2B+GxDYGUx
	 41xDzAzWLyqk7k6oyZF0Te/Iv+3mxSh3zapks1buFXbGBbTXpniguZLjMG+/Twat9B
	 2M6UgDMdvcVj9aQHcKlrBLyNe0m/5X35mP/4EGljxhvmLpWXQ38MyjZQ0DtVqRbrr0
	 1DFsvUASOSNfA==
Date: Thu, 01 Aug 2024 10:10:00 +0000
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, Aakash Sen Sharma <aakashsensharma@gmail.com>, Valentin Obst <kernel@valentinobst.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust: Introduce irq module
Message-ID: <5e449ae3-d858-45a2-ace8-28d9040b83a7@proton.me>
In-Reply-To: <fadbccec-a51e-47ff-9c96-0aab043048c8@proton.me>
References: <20240731224027.232642-1-lyude@redhat.com> <20240731224027.232642-2-lyude@redhat.com> <fadbccec-a51e-47ff-9c96-0aab043048c8@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b46114ba15369938a35b39b1cdffe0aba3e8bcde
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.08.24 11:51, Benno Lossin wrote:
> On 01.08.24 00:35, Lyude Paul wrote:
>> +/// Run the closure `cb` with interrupts disabled on the local CPU.
>> +///
>> +/// This creates an [`IrqDisabled`] token, which can be passed to funct=
ions that must be run
>> +/// without interrupts.
>> +///
>> +/// # Examples
>> +///
>> +/// Using [`with_irqs_disabled`] to call a function that can only be ca=
lled with interrupts
>> +/// disabled:
>> +///
>> +/// ```
>> +/// use kernel::irq::{IrqDisabled, with_irqs_disabled};
>> +///
>> +/// // Requiring interrupts be disabled to call a function
>> +/// fn dont_interrupt_me(_irq: IrqDisabled<'_>) {
>> +///     /* When this token is available, IRQs are known to be disabled.=
 Actions that rely on this
>> +///      * can be safely performed
>> +///      */
>> +/// }
>> +///
>> +/// // Disabling interrupts. They'll be re-enabled once this closure co=
mpletes.
>> +/// with_irqs_disabled(|irq| dont_interrupt_me(irq));
>> +/// ```
>> +#[inline]
>> +pub fn with_irqs_disabled<'a, T, F>(cb: F) -> T
>> +where
>> +    F: FnOnce(IrqDisabled<'a>) -> T,
>=20
> You can use this as the signature:
>=20
>     pub fn with_irqs_disabled<'a, T>(cb: impl FnOnce(IrqDisabled<'a>) -> =
T) -> T

I just noticed that this and the version above are wrong, since they
allow `T` to depend on `'a` ie you can do the following:

    pub fn cheat() -> IrqDisabled<'static> {
        with_irqs_disabled(|irq| irq)
    }

And thus obtain an `IrqDisabled` token without IRQs being disabled.

To fix this, you must use the `for<'a>` notation, so either

    pub fn with_irqs_disabled<T>(cb: impl for<'a> FnOnce(IrqDisabled<'a>) -=
> T) -> T

or

    pub fn with_irqs_disabled<T, F>(cb: F) -> T
    where
        F: for<'a> FnOnce(IrqDisabled<'a>) -> T,

This ensures that the callback works for any lifetime and thus `T` is
not allowed to depend on it.

---
Cheers,
Benno

