Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED262080E7
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135959; cv=none; b=GPGL33FPxOS6arn3Ua8wAzvtJVMS77NHD0psvbA992BI16aMKX1lNhgegUqBhTx+CxxIm3+ct7xVdCmyqeacao60//9t8niPZaqnVk7cc5oLPpjHEYZ25t8PAxQSuiBkZXnKvUDKbgRwosc7PnvSyUNKWoMmlSAYTHd6mLRi4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135959; c=relaxed/simple;
	bh=anOuCfNH47yXTTnJtmxXS+2gfLZg83sKL8+xPDZPT2M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4eqbzHs6fVaczg4g948X2NOa149mr1v+E5jWr1/NYSSzcKYq7DY2k6cvEoJydhnDW8Y72v7003KRKMJ+3nLOSuwMRCoKD40sadPFfKZK5LJCEbLQ2Aa5/zzthcSxYZM/dGoT7j+C9eHNvfqwz4FIQxwVwqVwGftwboqRlm+9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JINSsEtD; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JINSsEtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740135954; x=1740395154;
	bh=rHs69VGW/0W+MTyzpA9DFjxHwcWHt7q+JvqWNi3rTCM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JINSsEtDTP/ej+x5MrVtYxkJdC+FbKmI9pnqHPU+e+a6j3OV3ROVUPlLR0WECPBzn
	 JXcT17jqVCf0lC3slpJnZkO3joLzbDoI5xEvJWKAn935j46WQfMZKKtsMKOWKn6PVY
	 M3eqKRji3d7WiD4x1hTrFHp7nY60o/uxQKhVzj/Dh4TCf6SFK8BsKwlCYXKd5j6dMe
	 g+yKW1R2EqVyyTabFv8000/diPfDDq9vqNqJl6iqcujMYrQJEbTr3YquyoaFVHLrS/
	 p2vJSJOWEbB+lGLdehhr1T0q+pgQR93ypULPCSohhcn6yQDTSelMyLw5ezKEc2HHMT
	 UbDlD5VxEgfoA==
Date: Fri, 21 Feb 2025 11:05:49 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/14] rust: hrtimer: introduce hrtimer support
Message-ID: <841150db-2f92-4cfe-bb1f-29b34b4662c1@proton.me>
In-Reply-To: <875xl3fvtm.fsf@kernel.org>
References: <20250218-hrtimer-v3-v6-12-rc2-v8-0-48dedb015eb3@kernel.org> <20250218-hrtimer-v3-v6-12-rc2-v8-2-48dedb015eb3@kernel.org> <1id7is_U22yzuGODgkUIoB5AFM6snF9CPu7F_sY7Mfkn3EwQRPfjB5JNkRFYu6DX1N8X_OQvdEB2BT-l3rFhwg==@protonmail.internalid> <df748ac2-3551-460f-a16f-85d805671a3f@proton.me> <87a5afhdq0.fsf@kernel.org> <875xl3fvtm.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c255e78e8e8a832e098872ac728771bdfff1615f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 21.02.25 11:15, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>=20
>> "Benno Lossin" <benno.lossin@proton.me> writes:
>>
>>> On 18.02.25 14:27, Andreas Hindborg wrote:
>>>> +pub trait HrTimerCallback {
>>>> +    /// The type whose [`RawHrTimerCallback::run`] method will be inv=
oked when
>>>> +    /// the timer expires.
>>>> +    type CallbackTarget<'a>: RawHrTimerCallback;
>>>> +
>>>> +    /// This type is passed to the timer callback function. It may be=
 a borrow
>>>> +    /// of [`Self::CallbackTarget`], or it may be `Self::CallbackTarg=
et` if the
>>>> +    /// implementation can guarantee exclusive access to the target d=
uring timer
>>>
>>> Technically "exclusive" access is correct if the `CallbackTarget` is
>>> `Pin<&Self>`, since you will get exclusive access to a `Pin<&Self>`, bu=
t
>>> it might confuse people, because there can be multiple `Pin<&Self>`. So
>>> I would just drop the word "exclusive" here.
>>
>> Yes, maybe it should be "shared or exclusive access, depending on the ty=
pe"?
>>
>>>
>>>> +    /// handler execution.
>>>> +    type CallbackTargetParameter<'a>;
>>>
>>> Also why can't this type be an associated type of `HrTimerPointer`?
>>> Since this seems to always be constrained in the impls of
>>> `RawHrTimerCallback`.
>>
>> That might be a nice improvement, I'll try that out.
>=20
> Looking closer at this, I don't see how to achieve this. We need access
> to the type here, because it is used in the signature of `run`.
> `HrTimerCallback` has no bounds on it, and that is nice. If we want to
> move these associated types, we have to introduce a bound here.
>=20
> We need to be generic over the type of the parameter to `run`, and by
> the time the user implements this trait, the type must be known and so
> the user has to specify somehow.

I think if you put the associated type on the `RawHrTimerCallback`
trait, it should work.

---
Cheers,
Benno

