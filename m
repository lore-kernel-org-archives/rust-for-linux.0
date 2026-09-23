Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3353E3C5A;
	Wed, 23 Sep 2026 20:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195714; cv=none; b=KpEpCjNLIsQ4sxbLe2CGO2VhJqrVrqCiAAGBUUZMG6HwoWWbLIdtkEGfLd6gO5012zFr86cCubnhwwbOt75XEuw1+7kfbIk3ho6qfx22x0Fz6FgyuCUg3tPrdnWemqPlh+Sqn7q91igCWlixoAaBpS5tncx4pCCXtl/1hMZsKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195714; c=relaxed/simple;
	bh=mOO03YoLIii2o7RvNEexat1TxNoZebB+V8cD24Rqeiw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XqkHKDmDW/j+4pHP44dj8vGzUKQ/0bXAU1LCrDrXP0icDHe+qLg79aO4BuFEi+e488M21q6VeDauiP1Ycv1lP1sba5Ci1E+z60aYyxN9Guj6p8wW1eTn9qhkRjCkf+uegDA1PL48e5eA6z33LdRfgjcPebBxYLE+2mvFXIcbQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGtm8BE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGtm8BE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133941F000FF;
	Wed, 23 Sep 2026 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195707;
	bh=FROENDYx75+E2NhPAwA00OhrNjnBvzyeqYz3yYdCDlI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XGtm8BE6d19TZd7VaSrfeQkt7qP8qAHSCkNw53QXts4y1kEPwzD1BxWfqJaTyVe88
	 qPQ4YyR9DZqjpkHMTZBuLRLLfc5buf8d01I0GUs7AievGQrc6boHbwixbHSxrLqFrW
	 2xbv8z5SIzL4OdBAi7IQsaYzb72kN+UoxZyciQvEYzTJQrP1k/MTEXuFMnrr5koVWe
	 f8qiz6rlFApgt5T39q2SGcC7wZaaWvGWbNO3s68Ve2y5Z23QA84Pl6brxPMKrQuggY
	 GiaoUVfvAP2pV+uaqO/8ODtuJWvS4jkbYkEGG9D272W5q8lYKHsDJ421ppZJlx+Zlz
	 J1WAx9GDkIkiA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lyude Paul
 <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Onur
 =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>, Miguel Ojeda
 <ojeda@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: sync: fix safety comment for `Arc::from_raw`
In-Reply-To: <DLMX05RAZD0S.1EZ4L85L0T2HS@garyguo.net>
References: <20260923-aref-from-raw-safety-v1-1-e34f0da04145@kernel.org>
 <DLMX05RAZD0S.1EZ4L85L0T2HS@garyguo.net>
Date: Wed, 23 Sep 2026 22:34:57 +0200
Message-ID: <87a4p73dvy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Sep 23, 2026 at 7:32 PM BST, Andreas Hindborg wrote:
>> `Arc::from_raw` does not require `T: Send`. But if `Arc::from_raw` was
>> executed on a different thread than `Arc::into_raw`, `T` must implement
>> `Send` for the API to be sound. If this is not the case, ownership of `T`
>> may be sent across a thread boundary even if `T: !Send`.
>>
>> Augment safety comment for `Arc::from_raw` to close this gap.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/sync/arc.rs | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>> index 8ae0fe6f19ec..06838ecf633c 100644
>> --- a/rust/kernel/sync/arc.rs
>> +++ b/rust/kernel/sync/arc.rs
>> @@ -276,6 +276,9 @@ pub fn as_ptr(this: &Self) -> *const T {
>>      ///
>>      /// `ptr` must have been returned by a previous call to [`Arc::into_raw`]. Additionally, it
>>      /// must not be called more than once for each previous call to [`Arc::into_raw`].
>> +    ///
>> +    /// If [`Arc::into_raw`] was executed on a different thread than the one executing
>> +    /// [`Arc::from_raw`], `T` must implement [`Send`].
>
> This needs to be `Send + Sync`?

Why does the `Arc` need to be `Sync` as well? We are transferring
ownership, not a reference.

> That said, I am not sure if we want to enumerate all cases where things can go
> wrong. For example, would `Box::from_raw` need to mention that the type is
> `Send` too? `ARef::from_raw`? `ForeignOwnable::from_foreign/borrow/borrow_mut`
> all have to mention about this, too?

I had a case where I was making unsoundness in the configfs API because
of this, but without breaking any safety requirements. I think if this
requirement had been present on `Arc`, I would have discovered the issue
while writing the safety comment for the unsafe call.

So I think it is worth it.

Best regards,
Andreas Hindborg

