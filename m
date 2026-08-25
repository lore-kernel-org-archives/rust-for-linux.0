Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6C223328;
	Tue, 25 Aug 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662181; cv=none; b=BSCpFrM/k4rXRFjkQxtwfx70LWNTkl4pVtIbJ2IAL3vKy+WCKXi2P1wUgLSAyZFKni1w5w3tWjcscQZBnD///wbFwc7YzMXZzdpLqmfxi7Zdlc0pyJVuG8PnGQhM00fb1kmVs4aTa4AYf6xEKFETqyHjYzk9r9mANycwI4qnuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662181; c=relaxed/simple;
	bh=EUhwnes6QijKAXlUF0l5h2q+0rqa1TBTWrbLcmuDlYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BxPq9OEroUF5wfSELGY8wQHqMLx6v3A5O0yjVcOn6QnckN1t1luOxjodfZ5GKisZxg2Z5UFPdMBga/hn3VDpL4niRRtSETPQgjYlqTXJXKhgxafMPBfOhYgMJTdMWbm5fZzx5eYyEo2K2vjshw27mNsjJNvF4MJjrxCxUqZPXbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZP+pEiR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZP+pEiR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04EA1F00A3D;
	Tue, 25 Aug 2026 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787662180;
	bh=5S0tmCZF1FGYSoh1dt8V0x40wzyFaRUchPJ+JMtP8Sg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZP+pEiR8OlpKovfu85qnWPif9OXHg4xV9AUFozytZ4uR+UGOrXPRb0R9LeM5+dKcU
	 Q43sf25wxZqp1ORokWwH5JedtYwTFpSQae5NAodPmo4aVh3VE573imqsrHepTx703z
	 NIqqCNHzHVOaI801S/rUKf9oXxok08itqtgwdlx0xmwEYbvjD17xJELc4+Z/tj27zR
	 xcszg+nZKq8uEzXncMsnpRwOyIHDU8pEEiJfakf09oGNRJ8yimfp7CpWuTUKE9VCyU
	 HOh5BkwNqD6jrgGXWwbi9mnXgpkWwpWIb3jDBnR6/6N4c8M1AeeCzwy5otJ2MV+qV2
	 oXZu1HUcQz5+Q==
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
Subject: Re: [PATCH v4 06/11] rust: xarray: add `find_next` and `find_next_mut`
In-Reply-To: <178067251353.96312.9527123475656114033.b4-review@b4>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
 <178067251353.96312.9527123475656114033.b4-review@b4>
Date: Tue, 25 Aug 2026 14:43:38 +0200
Message-ID: <87pkz674lh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@kernel.org> writes:

> On Thu, 04 Jun 2026 21:58:12 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> Add methods to find the next element in an XArray starting from a
>> given index. The methods return a tuple containing the index where the
>> element was found and a reference to the element.
>> 
>> The implementation uses the XArray state API via `xas_find` to avoid taking
>> the rcu lock as an exclusive lock is already held by `Guard`.
>
> The previous patch re-hosts existing XArray methods on XArrayState, but
> this patch and subsequent ones are choosing to grow the XArray API
> rather than promote XArrayState to a proper abstraction that users
> should prefer. Are you sure that's the right choice?

We have the `Entry` API (introduced in patch 7) for users to interact
with the XArray in a stateful manner. I think adding these public
methods on `Guard` makes sense.

Best regards,
Andreas Hindborg



