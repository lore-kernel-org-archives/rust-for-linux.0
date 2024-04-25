Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716615575F
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Apr 2024 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714082222; cv=none; b=KrmPkIVD0qDizuXfzOwfx8HIhEkkHb0A/ETiH/7GHZnWwZ6hUvcMwKgJSW8s91RIbCe7vThNtmeC2Th2XCi1vAKEavLUwpx8zACf6nvNz2AKQBMp6kMJXrmJU+y+Hz20G7wVK+54B7uQZwbuYpxuAc0l5Lu+xUDPmGE8XE2ipxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714082222; c=relaxed/simple;
	bh=2AC9sknLoDsBrHZj6JPOUgXsHl0ckGSbKEILsuBcFn8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kjkeh2xOEbfcEc78BzxYWRQwtVVUrrpwpcyR9fyTziHObi6G4p4tLpmoZOazjwkQ0WcC023k3rAxFq1VBm/uYuy68st/imVUtf4258Qapt7/a91FtFBBHlEPVRub2pf4vCPBIjUK9nrFzmcOMQOwoGhQ6HFBAbMUuFQYjLr+hYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SiqyAVSj; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SiqyAVSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=xoici6hpxjgnho75p7nsvwzjhm.protonmail; t=1714082219; x=1714341419;
	bh=ssR1QDbWXYl4zvVV2r1hbcZe90jbbir7db4PC/qkIxw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SiqyAVSjPIZTVEUW7Y+8oEW/BRlMJBDBE86ccDZJeHaExhb9IPkM8YozY6go0x13h
	 W/s9+m85Ibcwodaw/VIWgzEj51Y5I2Eu9YqSzdZsyjcbI/0gy3Pa1EBEroAW3FkeEf
	 u9Qg4hMbMnzpj9xP7GzoHCTOCSXfwodJpDFfuC3RC9wl4AEcOPWoKVUL8SE+XU+1p6
	 2KLmWzqMDSbaDctlxAyDQlPmuqmlKetc7JvI9wU2HvLlNddQ956r9EGyzgy17numSU
	 ldE6nEkbebDpV+WZSoL4NoYfoj2Aw7KEzpsz6iPE6r6JkAN5sWftXBuqLLH2fP4uzi
	 bEva6PwM7ZNMg==
Date: Thu, 25 Apr 2024 21:56:54 +0000
To: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] rust: rbtree: add `RBTreeIterator`
Message-ID: <85fdf6ae-3838-46ff-828f-3179cbad1d30@proton.me>
In-Reply-To: <ba946689-d10b-4752-989f-4c6404d7ee55@proton.me>
References: <20240418-b4-rbtree-v3-0-323e134390ce@google.com> <20240418-b4-rbtree-v3-2-323e134390ce@google.com> <ba946689-d10b-4752-989f-4c6404d7ee55@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8f60004c9bd63e1dddb642f104a09560ba8a6505
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.04.24 23:45, Benno Lossin wrote:
> On 18.04.24 16:15, Matt Gilbride wrote:
>> @@ -373,6 +416,56 @@ fn drop(&mut self) {
>>       }
>>   }
>>
>> +impl<'a, K, V> IntoIterator for &'a RBTree<K, V> {
>> +    type Item =3D (&'a K, &'a V);
>> +    type IntoIter =3D RBTreeIterator<'a, K, V>;
>> +
>> +    fn into_iter(self) -> Self::IntoIter {
>> +        self.iter()
>> +    }
>> +}
>> +
>> +/// An iterator over the nodes of a [`RBTree`].
>> +///
>> +/// Instances are created by calling [`RBTree::iter`].
>> +///
>> +/// # Invariants
>> +/// - `self.next` is a valid pointer.
>> +/// - `self.next` points to a node stored inside of a valid `RBTree`.
>> +pub struct RBTreeIterator<'a, K, V> {
>> +    _tree: PhantomData<&'a RBTree<K, V>>,
>> +    next: *mut bindings::rb_node,
>> +}
>> +
>> +// SAFETY: The [`RBTreeIterator`] gives out immutable references to K a=
nd V, so it has the same
>> +// thread safety requirements as immutable references.
>> +unsafe impl<'a, K: Sync, V: Sync> Send for RBTreeIterator<'a, K, V> {}
>=20
> The bounds on `K` and `V` look like typos to me. They should be `Send`
> instead.

Oops, scratch this comment, what you wrote is correct, since we treat
`RBTreeIterator` as `(&K, &V)`.

--=20
Cheers,
Benno

