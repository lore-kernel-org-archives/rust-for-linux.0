Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4E15CB
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Sep 2024 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726942663; cv=none; b=BZPMHqrhNr97Tkf0T+ZjbbugwJsTU5xCF6gmCh2M0J4/nklMxF4DwlfGBomH12vjGIRriijpgDRVtZ7LbYOpBJtWFvrUEt+S666Tb83MPV7qSzoizzwIcXwwsEHe+lQsQGpvrm7Q0YmYSTLo8uy0Boxbu5EXSeTuLZ6BI56axiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726942663; c=relaxed/simple;
	bh=+zZzvpYsjiMLGPjW+Uq4V+hbMBU3iVu6OsOZfpgUfOg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBf8UtFrWk7P3zkj4wn6LdhLSJ/C6OEw3cX5WTLuPFQy6y+gUOSs+ZKRsi+nLnYJ0wEQahgA+T4UOxLo1/2g17DXqwDAn9E/HCWGA7zIuno6yYSCUzf5hirVVN3GKZVSXfWyk1tiX8DMlX7htQeNCrtVf16cY/isvvrueLQ7MNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Sle0wEUI; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Sle0wEUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=haqvyreks5eyvegt2trpidsa5y.protonmail; t=1726942652; x=1727201852;
	bh=yeK76Bk0BDezi0jZb9h2y9nESrzmMD2f7BNouxUWIFg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Sle0wEUIF7CucS0LVwU+8Nc2/n5HUjcQNPy4W68M5Dg5jZnlR6RXr5VWmo+hh6Fr4
	 Koo6AjXwta5nX6EOMMnaL0feTZ9x7x5Fg1hj7FyBtUKqarrU4kAv/ILhxK3l/n6/Nh
	 qMuzNh4JGuA6GSqrMvdGXs/aIDJ4E1nwsBgFeftKJaOCTjZCN9xdofseoMT68eBvhH
	 7xrTn+hrp2KoZzDdgsjEHik1VKyJjLzfxzIDziR4P76v7jufNCut0j6bdYI1ojbxCq
	 7DCAN/2XFEhVHuW4qSoIOUcJRuAHAnbJWHmdHZeyue8ujDaIet43SE25CUIpoNrjZi
	 TjNhFK4S4Nm3g==
Date: Sat, 21 Sep 2024 18:17:28 +0000
To: Gary Guo <gary@garyguo.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/14] rust: sync: add `Arc::as_ptr`
Message-ID: <a7d28a22-d782-43cf-8ec0-d239c467ffb3@proton.me>
In-Reply-To: <20240921165801.1d1df6ab.gary@garyguo.net>
References: <20240917222739.1298275-1-a.hindborg@kernel.org> <20240917222739.1298275-4-a.hindborg@kernel.org> <e7e42ff2-1543-48b3-9bd3-bdef5ce66348@proton.me> <20240921165801.1d1df6ab.gary@garyguo.net>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f0092004b425cd41355e93a0052ea668103f1855
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 21.09.24 17:58, Gary Guo wrote:
> On Thu, 19 Sep 2024 14:03:50 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>> On 18.09.24 00:27, Andreas Hindborg wrote:
>>> Add a method to get a pointer to the data contained in an `Arc`.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/sync/arc.rs | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>>> index 3673496c2363..a57ea3e2b44c 100644
>>> --- a/rust/kernel/sync/arc.rs
>>> +++ b/rust/kernel/sync/arc.rs
>>> @@ -258,6 +258,14 @@ pub fn into_raw(self) -> *const T {
>>>          unsafe { core::ptr::addr_of!((*ptr).data) }
>>>      }
>>>
>>> +    /// Return a raw pointer to the data in this arc.
>>> +    pub fn as_ptr(&self) -> *const T {
>>
>> I don't know if we have a convention for this, but shouldn't this be an
>> associated function? Because if `T` also has an `as_ptr` function, it
>> will be shadowed by this one.
>=20
> The usual Rust convention is usually that if `Deref` is implemented,
> then unless there's a good reason to do otherwise, associated function
> should be used.

We don't do this for `into_raw` (ie it takes `self`), I will open a
good-first-issue to fix that then.

---
Cheers,
Benno

