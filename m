Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF28D22B8A6;
	Mon, 16 Feb 2026 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240227; cv=none; b=BhSuETShHRJBdpPjdBUvcRDg+ATUMNrMyCXNI2mw98jhJYBTrYFigU+2z1JlKXk5BGlcRoDp9T6JHIkXoDHH+uhgr5fJwry5eY+c8xeIDQFRUB8f5zMcN5LSBPOaZk70TindTCeyXm9V/ZWULL3fPkAOkjIsaR6KQc9v9BCi3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240227; c=relaxed/simple;
	bh=B97zFyL0sqAEqzOPvK0UOG0VBdzuqWbKAPBHPA6fB3g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VIBQ0bXrCSxqVbREHeBn6jd0FYQ9Y7kKFKS1rJ2qTSrrnYtJA3CrncjidAgrhRta5M5FiA3zH2kfY7qHCK1Ui4vV0gv4TpLa+hUejK/6Ann/tJV2WgoEfFhuulNObueRVH5cduA4JY5+/w2QczmBs1957Q14nNwXO81X/Og31V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRUQJ2QB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRUQJ2QB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417B4C116C6;
	Mon, 16 Feb 2026 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771240227;
	bh=B97zFyL0sqAEqzOPvK0UOG0VBdzuqWbKAPBHPA6fB3g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IRUQJ2QBY/UMW76lcAEtXNlXxfZjuu1xcXPXYfC3xKEKBhJ+uzInHdrE6g0O+Ttql
	 6nKCBfDzS+vT0hX8PYH7Oq1T/usbvYXiXpzXOydb+URm9BWuFkdKQY9FZUAqn+YOVK
	 xlZq0Lz05CYgYer9X+NeuIXqSIEPlSsraAq8LMKGw4R2m4asUSmbXTyWgi2b6SG43w
	 14dOvXGoCzMRFi7AlfN4GLJb/iWs+58933rXVlADhevvCdrh0B2HmdsWaDm/BeLZzS
	 lP0CaAWKszlet8AKVVorafgqS4WROTh/YNSMqzLrqNOB80+rSCjx+rnGbGdQpyJ0Kf
	 9oaRSWbuVqYhQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <aZLZbN5C3wXgt3kL@google.com>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com>
Date: Mon, 16 Feb 2026 12:10:16 +0100
Message-ID: <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
>> Add methods to get a reference to the contained value or populate the
>> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>> allowing for lazy initialization that may fail. Both methods spin-wait
>> if another thread is concurrently initializing the container.
>>
>> Also add `populate_with` which takes a fallible closure and serves as
>> the implementation basis for the other populate methods.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
>> +    /// with the value returned by `callable` and return a reference to that
>> +    /// object.
>> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
>> +        if !self.populate_with(callable)? {
>> +            while self.init.load(Acquire) != 2 {
>> +                core::hint::spin_loop();
>> +            }
>
> We should not be implementing our own spinlocks.

That is a great proverb. I'd be happy to receive a suggestion on an
alternate approach for this particular context.


Best regards,
Andreas Hindborg



