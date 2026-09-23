Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E157C720;
	Wed, 23 Sep 2026 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195964; cv=none; b=kztuiRNGiprRMxqi+NJW2rahYpTZnq7iRqSJziTFEpTriNWPGWOmE594pgta9LW0VSZwzZDDe4VvIiFhvVPQPrCQ3XSXjjBidDjQy6poAXSZrEWU79GlI2J+fS/0MTJHLLt12sjiBucfWBSQ4g9mFqqPNEA2syw3rb43DK7S/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195964; c=relaxed/simple;
	bh=0rIPTceHJYkPdHUcYuUIdtlF9hbmIaxrwDnahMT9hA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sgk5fKOs+gQcA13yLtAVAdByBCWlgUlYOYg73nlCUNkd3hi8KYRn1tqnaPMF7FNasKIO84ThPp3DtkegAj6bgr1mb+IXN9dgRF0agg4vk3FWMW1f96pu5zT8touz5AegW4Zni348/UorGc5EK942PNTbWQaeDBIcG8LIH6eTO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb8Z+kU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb8Z+kU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27DA1F000FF;
	Wed, 23 Sep 2026 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195949;
	bh=jfG5GGO+1MUArDjsH2YhnDZ5acPt65830dSNUaJVTxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Sb8Z+kU6S1sDwygJtZwtiCp7L4KeBL9sEr8R+UPRJoY3Nx+UQq91Vqcn6RMko7Sik
	 KZfx4QOoBJFajKhDmkPEQzdIkiIztzVusUuYRWkyJ9Gxla8v29lE43KpfatLlXNC0c
	 IhocHhmviFzDLmQkK06Gqjt8fkrfGrsyNyj554Fedyd5LmmxjoZAxdcbiZp9+Co1O0
	 J3MvuSa0oj5xDEYas9VFObf67EWb1xzxapaPhdbcHSUejQ6Dw1AIy+AW8k54d3Smqe
	 gMChQdVO/8UNq6ncBU+zbLClWZJQcyX0+RaSw9n0gK97e61HO3LJyeJADBO+szIG+F
	 rlSwuHEKFOkiQ==
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
In-Reply-To: <87a4p73dvy.fsf@t14s.mail-host-address-is-not-set>
References: <20260923-aref-from-raw-safety-v1-1-e34f0da04145@kernel.org>
 <DLMX05RAZD0S.1EZ4L85L0T2HS@garyguo.net>
 <87a4p73dvy.fsf@t14s.mail-host-address-is-not-set>
Date: Wed, 23 Sep 2026 22:38:57 +0200
Message-ID: <877bkb3dpa.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Wed Sep 23, 2026 at 7:32 PM BST, Andreas Hindborg wrote:
>>> `Arc::from_raw` does not require `T: Send`. But if `Arc::from_raw` was
>>> executed on a different thread than `Arc::into_raw`, `T` must implement
>>> `Send` for the API to be sound. If this is not the case, ownership of `T`
>>> may be sent across a thread boundary even if `T: !Send`.
>>>
>>> Augment safety comment for `Arc::from_raw` to close this gap.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/sync/arc.rs | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>>> index 8ae0fe6f19ec..06838ecf633c 100644
>>> --- a/rust/kernel/sync/arc.rs
>>> +++ b/rust/kernel/sync/arc.rs
>>> @@ -276,6 +276,9 @@ pub fn as_ptr(this: &Self) -> *const T {
>>>      ///
>>>      /// `ptr` must have been returned by a previous call to [`Arc::into_raw`]. Additionally, it
>>>      /// must not be called more than once for each previous call to [`Arc::into_raw`].
>>> +    ///
>>> +    /// If [`Arc::into_raw`] was executed on a different thread than the one executing
>>> +    /// [`Arc::from_raw`], `T` must implement [`Send`].
>>
>> This needs to be `Send + Sync`?
>
> Why does the `Arc` need to be `Sync` as well? We are transferring
> ownership, not a reference.

Ah, I get your point. The comment is wrong, I meant to say "`Arc<T>`
must implement `Send`". I did not mean to address `T`.

Best regards,
Andreas Hindborg


