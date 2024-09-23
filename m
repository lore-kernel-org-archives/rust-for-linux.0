Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC8198830
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727110796; cv=none; b=CNIt78QdscYdryYBESInqh08/7P3jvKcWIIZ19N70dL3O0wqyLxNIua574b+MXxjejUgTcE/GMRYdms/JFpKQfFZpzp5JgBN46NxOBh8ZpIMINvFJS0MuKf3fLuvtVRV2cfPPaLhyqPDulmx74tP+VLFMkkRQJDev7+zt9tr/Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727110796; c=relaxed/simple;
	bh=tChY4i4t1si/Ow2SVnPOYtdrSdx8APVATHGGLuW49eQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieqXYlqFJpj2m4J5QyjS33q4jTIbYZO5k7r2qnmgEY1rEO5RvZRpa3+zYe9nrQ3dfvFwx3VnBvl9wjYh6fMFzGA7WCFQuCubVCy1l+y/9FDlLLm5BtmddxuoZJ2S6ClE+u8ttPTvHB6s9OI7LZzIbUuZm3J8K7Vs7dBDx8zXgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PYr1c8Dh; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PYr1c8Dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1727110792; x=1727369992;
	bh=bL0NMBwkdYkg3IgaS9DIPLf8onrINPcFkF0NWk2OV5E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PYr1c8DhG22xdd2ukIXAdZkdSqwYynDaPAaplYKMYk3D4G2CRpZJqzk2qp5G/QrfH
	 1rLSJBAu8dHaqcjEOtj7a6E/exDdS8zK8BURx6BnnJWWBYXEHzR8YMJsKF0JVuWqpM
	 EHC8BzKMRX/IvWiaA40HqME1xWovHtVRQCRYQeB7Fvb+DA1AJM8jQkOFTVZzgFZVfI
	 ESyNL2bPThmLRSki/iTUWhIFS9XqOY40fTPghFbciIKYVx0bGx8cgqbims6xqtHMaU
	 UUhP6NEb/1NtkMppEEPBnK0TC3EddQPrXp/jVtEMpe6kedqlM3fQ+h++gXhxY9jmHv
	 ZShZn2tPwujpg==
Date: Mon, 23 Sep 2024 16:59:47 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/14] rust: hrtimer: introduce hrtimer support
Message-ID: <51f18817-1ebd-451a-bc6e-e298a9148001@proton.me>
In-Reply-To: <87ldziqqeo.fsf@kernel.org>
References: <20240917222739.1298275-1-a.hindborg@kernel.org> <20240917222739.1298275-3-a.hindborg@kernel.org> <Wohby8PLjQeZ47sXKGeWKOxdA2ShTjjvqOM6xWzhJY1aZ-SYk9TCDAnZN2EqiWuJUKwPKoFCsCofDHjtfeG--w==@protonmail.internalid> <f502f6c6-40b7-4ec4-8d0c-09adb0df1a30@proton.me> <878qvojj0o.fsf@kernel.org> <pvhILkKRTj8T2Ks3off5HLMqewNM_X192WV4J5-nnC4Uu0o9G8-Qk5Tl9bQxsqVCw4QHmeJii7mCK2VorN-xcw==@protonmail.internalid> <33c65715-3af5-44f9-93c5-149d07a4c503@proton.me> <87ldziqqeo.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5e4d315e84d155ed467c03c1240338dc0ae7f548
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23.09.24 18:35, Andreas Hindborg wrote:
> "Benno Lossin" <benno.lossin@proton.me> writes:
>> On 19.09.24 07:43, Andreas Hindborg wrote:
>>>>> +    /// until the timer is unarmed and the callback has completed.
>>>>> +    ///
>>>>> +    /// Note: It must be safe to leak the handle.
>>>>> +    type TimerHandle: TimerHandle;
>>>>
>>>> Why does this need to be an associated type? Couldn't we have a
>>>> `TimerHandle<T>` struct? The schedule function below could then return
>>>> `TimerHandle<Self>`.
>>>
>>> At one point, I had some cycles in trait resolution. Moving generics to
>>> associated types solved that issue. Maybe this can be changed to a
>>> generic. But are generics preferred over associated types for some
>>> reason?
>>
>> The associated type is more complicated IMO, because then every
>> implementer of the trait needs to create one. If we can avoid that, I
>> would prefer a generic type.
>=20
> When you say create, you mean specify?

Yes.

> Users would not invent their own type to put here, they would use the
> types defined by the `hrtimer` module in later patches.

I mean the implementers of this trait, not the users of the trait. You
define an `ArcTimerHandle`, `PinTimerHandle` and a `PinMutTimerHandle`
in this series. I think we can avoid that using a single generic struct.

---
Cheers,
Benno

