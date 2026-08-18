Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3A43F0AF;
	Tue, 18 Aug 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050404; cv=none; b=aL9Qgi/dlhblIMXJ5Cf5285wvOrSak6QufVbn/lmQVELE4WTm2uhwxE5OKIwuz0R1BboNOMlqVJ7xqaHEwozmfom/Fpk5xDma4igKIjdyG0VJgwbVrwdnXpwp+7zSXq/ECInAK/iIGcoGn/pp8J/4to/Er059F9SCdmqJFIvrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050404; c=relaxed/simple;
	bh=LgZWMo0lcIh0d+/J8fXsKoRbZQTWYBlbBoL6kqAYXzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BIryfrxfcGX31otdynnGpiKRx/zJVT6Nf2hcJv7kIrEUSxiv3y+FSHOIumN3eCeWGrI17DZRDvNtOF3VXUeLoEfwGCqmLBND6BN0bxbAQlTDdWmCPVHpWpmCn2ca17zzRJehyi1zSSrnTFgqv/jO+cwlZcZQqunDVbQgmH8iCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gh0ePYnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gh0ePYnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E22F1F000E9;
	Tue, 18 Aug 2026 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050402;
	bh=2vQVP0fozoasB0mVcGvwTo5tuLzcZJsUdVbtG8xx8oA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gh0ePYnVcQkcgq/td00gqcCz7aFATfvbVSNqKz5RGyLRGXLuvEKCEdAIuaHPbo6O+
	 dnlx5tiyXmYBADB25K6ImmT6f6staVZHhx3PyUqA5loIFQ+yRlXu6tSoyB+EYluv7K
	 v3Wgg1VtrZzn5iwTNeB+wO6i8y+kgJYo45YPCWOVyUrxDEHl+OzevDTA3jG6vN0Ye/
	 voVrmp02kSO1xgrSQgEmQqfPczn0CvlCOpVcwyAZ9mdm5cRdBc3pGqBVM9wKx8dOMb
	 YialeicgZmOPXioVONGXdfYC6F1vL2P5XI/oe2GWgEqYEX3NcexoTwaVEuvU0NGSFA
	 kBVPJV0UgsUjA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, git@younes.io, Breno
 Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: configfs: skip unregister after failed registration
In-Reply-To: <DKS0EN4DLKW3.IB8Z5VB3B7YG@garyguo.net>
References: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
 <I9rMOFpWPbtlAmMsBCz7tH-ltTS1GDo5t-PVCCUa9X9MdkjjRkiRVlW1LO4wrbypD2fR3D80NozC8OdUxVBQ7A==@protonmail.internalid>
 <DKS0EN4DLKW3.IB8Z5VB3B7YG@garyguo.net>
Date: Tue, 18 Aug 2026 12:53:13 +0200
Message-ID: <87tsor8zty.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Aug 18, 2026 at 9:11 AM BST, Younes Akhouayri via B4 Relay wrote:
>> From: Younes Akhouayri <git@younes.io>
>>
>> Subsystem::new() calls configfs_register_subsystem() from a fallible
>> pin_chain callback. If registration fails, ChainPinInit drops the
>> already initialized Subsystem. Its PinnedDrop currently calls
>> configfs_unregister_subsystem() unconditionally.
>>
>> configfs_unregister_subsystem() requires registration to have completed
>> and immediately dereferences the subsystem dentry. Registering a
>> duplicate subsystem name returns -EEXIST before installing that dentry,
>> so the cleanup path dereferences NULL and panics the kernel.
>>
>> Track successful registration explicitly and only unregister in that
>> state. Keep mutex destruction unconditional because it is initialized
>> before registration.
>>
>> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
>> Signed-off-by: Younes Akhouayri <git@younes.io>
>> ---
>>  rust/kernel/configfs.rs | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
>> index cd082b83e9e7..f358e227ce09 100644
>> --- a/rust/kernel/configfs.rs
>> +++ b/rust/kernel/configfs.rs
>> @@ -130,6 +130,7 @@ pub struct Subsystem<Data> {
>>      subsystem: Opaque<bindings::configfs_subsystem>,
>>      #[pin]
>>      data: Data,
>> +    registered: bool,
>
> No flag just for destruction. Please change new logic to avoid needing this.

I guess we can have a local `UnregisteredSubsystem` that we can
cast to a `Subsystem` once registration succeeds. Is that what you have
in mind?


Best regards,
Andreas Hindborg

