Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED12FF65F;
	Mon, 16 Feb 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248771; cv=none; b=GIkVZfnkImuYbHGjzJf2+dmUs/wemfguRzdcJA5Z9TDbTa4cS+3Qv/ke376f6MUidriES7kjZwptsWXe+KVdCPHOhB7mqhXetWQFZ2i6OBtlChiLVs6yHfn3OT3SwoKYFLyshL3kGocvZj8uyKLn4grGDu7EY0mBx3fWNEpsTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248771; c=relaxed/simple;
	bh=0rKw0k027INDSJ2hhloqvfyP9uqmkYxIkVmrBlCGTw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cB7GshKNGObjWmAwpbZ6O960J4jR5w+89c5ZU3TldIc+zXxuGGbC7Zhg9xpvNLuoApJj8MKf1mecOzpDicySSe7zP8mpojDryK4zfU2kLeZIzdXuDhL8sGAWLBy40sc5IWyLiMOcMVc6INfP6S+K/INaqpmQ4RjjEGU7XCOiTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lffKZbdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lffKZbdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23B5C19423;
	Mon, 16 Feb 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771248771;
	bh=0rKw0k027INDSJ2hhloqvfyP9uqmkYxIkVmrBlCGTw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lffKZbduEnDVbiN6XbTK6Goj5ATzolTNHE9EEfdmxZ4EtI7PLag0SdepSDThRZ0iu
	 38T2qeMIJUFzzZqI1fZuslgKGv3fyg6NcgOEh8RDopYxzviNVxf0B4+aIgM5UOZhsU
	 Yto35yvzOAcQEbE4VTnggatepMB64VsItT2xoVHvxmLdgQNIzdrAE2xXEAYOk3vQjn
	 UMi7GaLcrSGax22HCL7ihby3tJHILVGuaQUqK8ACzm9wTdYust49DT3KRxHu7OuiM6
	 90jHs8Lo0RwXa6L3X/1UDVuK06An/FrpejWlh1xqYzrLjqxo5K3RBGPAxEXNbyNpPY
	 1toDrW5M3tDTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <aZMA_3CBEnV1Sg68@google.com>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com>
 <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com>
 <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com>
Date: Mon, 16 Feb 2026 14:32:42 +0100
Message-ID: <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>> >
>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
>> > >> Add methods to get a reference to the contained value or populate the
>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
>> > >> if another thread is concurrently initializing the container.
>> > >>
>> > >> Also add `populate_with` which takes a fallible closure and serves as
>> > >> the implementation basis for the other populate methods.
>> > >>
>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> > >
>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
>> > >> +    /// with the value returned by `callable` and return a reference to that
>> > >> +    /// object.
>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
>> > >> +        if !self.populate_with(callable)? {
>> > >> +            while self.init.load(Acquire) != 2 {
>> > >> +                core::hint::spin_loop();
>> > >> +            }
>> > >
>> > > We should not be implementing our own spinlocks.
>> >
>> > That is a great proverb. I'd be happy to receive a suggestion on an
>> > alternate approach for this particular context.
>>
>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
>> support for waiting will require the addition of extra fields.

Thanks, I'll be sure to take a look again.

>
> By the way, back then I suggested renaming it from OnceLock to SetOnce
> because you did not support waiting for the value to be populated, and
> you said you didn't need that. If you add that feature, then we should
> rename it back to OnceLock, or create a new type OnceLock for users who
> need that additional feature.

That is fair. This is a different use case than the original one though.
I think we should keep this as one type for code reuse, but I am fine
with renaming to something that describe the usage better.


Best regards,
Andreas Hindborg



