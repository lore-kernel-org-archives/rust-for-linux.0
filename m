Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B487223328;
	Tue, 25 Aug 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662176; cv=none; b=PKl98sCpfQI/vIpuX/FURaVSA7PD2cRYE3rqW0ejqge2HkHh5MRnzjeoRalZ6QjxVnh0eerrArn67l/fimbyt0VVUbF7Y1WOMHUNnSwJWwGpOB9M1UJez52Jbc3tumGpVR5yIYIjAg66k/s9tRwPGvo4eWaWEDzI8cQEYAA2ieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662176; c=relaxed/simple;
	bh=GSyGppVnTNf1Q1dMF9kjqYLoGh4be/O2grO4ZfzkbG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OltmyOt9XN7+H2Ygx24q2HIhX1t1sqQcK+m1YlG+b0aFA1C5rquQvk4dmqVSmGp4b5snjsJ3aQ++HqR8IP0MX4Fz8eSNcM87dVq2o6UUkkAR/D5v65dKVrqDeQDLN9u8TPZz5szDkzEJP6blKuR9WwwZHvlZJBwrp43mL2SlMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HikYPoa7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HikYPoa7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309411F000E9;
	Tue, 25 Aug 2026 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787662175;
	bh=O9842YOfkl7jVdgu9xM+nFnlV2QSjnl2wpfKIXF58SQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HikYPoa7HAyv4D4viLvGDUQp0DqjWqnU/qBxADx0dT+UzZrgbp6vXmYYiDV/ckMTT
	 LhrS1mMqFtbW8DDIWXsrb0goXkeqFzY2Pr7bcvr4BZl6o+pt9tW4D9whpK3ODHcEB/
	 qqi7gKgguthkZdaePHabzv5eLRMml/KS7w9P/GN0udmW6+hJfHhBFUurspzh5cN5yI
	 T9LhfoFMxqEHohpsy7fKnKgQuLX1yhghZE+4svDYwYeQ+w/WvaFP2/ldI9EFO1eTFF
	 LvP7bwfh3/p1U3QWXKdpUUPQVAMlOc8+7nPM6StpHxlKYPh651eMNvLzkvpH3OUx+g
	 Kur+47/aLKQZA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 07/11] rust: xarray: add entry API
In-Reply-To: <178067251358.96312.14084909265600226392.b4-review@b4>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-7-965f6028790e@kernel.org>
 <178067251358.96312.14084909265600226392.b4-review@b4>
Date: Tue, 25 Aug 2026 14:49:13 +0200
Message-ID: <87mrua74c6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@kernel.org> writes:

> On Thu, 04 Jun 2026 21:58:13 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> Add an Entry API for XArray that provides ergonomic access to array
>> slots that may be vacant or occupied. The API follows the pattern of
>> Rust's standard library HashMap entry API, allowing efficient
>> conditional insertion and modification of entries.
>
> There's a lot more API here than this lets on.
> `find_next_entry{,_circular}`, `Entry::is_occupied`, `into_guard`,
> `insert{,_entry}` (do we need both?), `index`, `OccupiedEntry::swap`,
> `Deref{,Mut}`.

I can amend the commit message to enumerate the added methods.

> It's not clear that all this API is needed, and this message does not
> attempt to justify it. It is also inconsistent with the split in patches
> 3 and 4.

What do you mean when you say that it is not clear that the API is
needed? Are you referring to callers of this code? This is initially for
the rust null block driver, as expressed in the cover letter.

I'm not sure why you think this is inconsistent with patch 3 and 4?


>
>>
>>
>> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
>> index 08979b304341..19fce6862c78 100644
>> --- a/rust/helpers/xarray.c
>> +++ b/rust/helpers/xarray.c
>> @@ -26,3 +26,20 @@ __rust_helper void rust_helper_xa_unlock(struct xarray *xa)
>>  {
>>  	return xa_unlock(xa);
>>  }
>> +
>> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
>> +{
>> +	if (xa_err(xas->xa_node))
>> +		curr = xas->xa_node;
>> +	return curr;
>> +}
>> +
>> +void *rust_helper_xa_zero_to_null(void *entry)
>> +{
>> +	return xa_is_zero(entry) ? NULL : entry;
>> +}
>
> These functions already exist in C, but are `static inline` in xarray.c.
> Can we move them to the header instead of duplicating them here please?
> That is what I did in 79ada2ae ("xarray: extract helper from
> __xa_{insert,cmpxchg}").

This is a great idea. I will follow up with a cleanup once this stuff is
in. Getting changes in the xarray C code has a rather high latency. I
would rather not be blocked by that at the moment.


Best regards,
Andreas Hindborg


