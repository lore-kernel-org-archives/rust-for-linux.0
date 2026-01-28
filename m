Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877D257854;
	Wed, 28 Jan 2026 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609695; cv=none; b=RV/iOPzfNPE7lIUMMkb0as+qYPMuf0q5alpSZpLBpoSNA8y46BCmkHHQb055GRElAZyEqMFgT0FS+VjewDP1Ted0C/hRLUxLMNv1WOYNRCI4R59BxB3H5bx1N9AU1ulE5QGrsKfW3bvK54TXvTDo8vD4Q99THp4XsltiPiX4nBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609695; c=relaxed/simple;
	bh=yDghpFh1W7FxCJIU+PStYBy8as07UgH4YWAZWQ8SyD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=igZc7P/sVIUCW4dW9sPjNm61VkAlrbEzNwLqkwUKkvYo/+/jGEICh0s33ZI1btRCWLrejajZ5pcJzixQvkpsCwg9OgyaOi4U0XgkIB2yUdHITf4tGtjYNJWes1+nHjqU8vfWKTMnUt6y19aepiG/cMnk3qbYiQt8ni7TdUAyfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzLKVuKk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzLKVuKk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEAEC4CEF1;
	Wed, 28 Jan 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609694;
	bh=yDghpFh1W7FxCJIU+PStYBy8as07UgH4YWAZWQ8SyD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bzLKVuKkI3Ahc1uo7JhT0kDwkFR/7YoYjycgGNwZoYJzJtkCL4gPuJVwHxloP9RjX
	 EhfBRonSwhW64fugHhak8dWykFCwCVudNiNrbqZoxjZIvj9hGt70TNCdaX+i97kzLd
	 yhGekKV5ovYPgl4W4MAK2jtlmH6i8DrFPHcopK+eM5vbfoMPYO3VgzjtiDCI80URsU
	 tPInQPYFpRtXz7kgQkgTJLxirV+waxvTNcw6lMIMMspnhkwnSbbqXvJAGiflC8z6H6
	 eSFOD7H2whqYiYKiAJLGIw1AaSDGjCZabShTq+e+5J3fQRisJHhsaV/oLeLewILHKk
	 l4GIg+OSkrLpg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add `from_raw()`
In-Reply-To: <DG09CF1T9SQA.2LKBUV75ZPS1P@garyguo.net>
References: <20260128-page-from-raw-v1-1-b837bd3e0545@kernel.org>
 <qXRxvUYfKk7WCX_IdF9ulmBVTVBDbOkDSg2GYFzEbT_8fLtVFMfT45hs7oCXaZnp4WU1R4ylgTQmBvre5Fnr4g==@protonmail.internalid>
 <DG09CF1T9SQA.2LKBUV75ZPS1P@garyguo.net>
Date: Wed, 28 Jan 2026 15:14:29 +0100
Message-ID: <87pl6tsu2i.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Jan 28, 2026 at 1:22 PM GMT, Andreas Hindborg wrote:
>> Add a method to `Page` that allows construction of a reference instance
>> from `struct page` pointer.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> ---
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/page.rs | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index 432fc0297d4a8..f666c92fcf451 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -176,6 +176,17 @@ pub fn nid(&self) -> i32 {
>>          unsafe { bindings::page_to_nid(self.as_ptr()) }
>>      }
>>
>> +    /// Create a `&Page` from a raw `struct page` pointer
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `ptr` must be valid for use as a reference for the duration of `'a`.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::page) -> &'a Self {
>> +        // SAFETY: By function safety requirements, ptr is not null and is
>> +        // valid for use as a reference.
>> +        unsafe { NonNull::new_unchecked(ptr).cast().as_ref() }
>> +    }
>
> This is wrong. `Page` is a wrapper of `struct page*`, not `struct page`.

Oops. Sorry. This goes on top of a conversion of page to `Ownable` that
I did not send yet.

Please disregard.


Best regards,
Andreas Hindborg




