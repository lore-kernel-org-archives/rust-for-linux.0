Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB637882E;
	Mon,  8 Jun 2026 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921505; cv=none; b=WYDNkOxujgMuDN/llEvr0qqwAqX+QghwMdYG0JQo33DKpMNkvxceIMQAXJZTYZKl1HXVsXnY2NutjqCgr21MUfpW4+JZvdIl2yTshddS6/yyZNWbaFA3NEFqGA3EaM6sYOnDwjM5dsC6UtIrmVUW1Z3d6/wD4JEXVLnyM586xDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921505; c=relaxed/simple;
	bh=pbUGs9EmPydb1El9mNFHAbnrnAPs3cwRoRPk5f5XmSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a/fBn9r4d9eAFY8YE5IB59CoVcW2CLt9a6Vmoj8Wz9/9v5g/cuuwGYmzefJDVW0XSG5k99nghsKqngLBNYe8mwg9HUGSYg8iI2WjflUWqJVNv35q+ayospfxZRf6mZUvzeUij1B6ukGhH0Z3+sjy9Og+SXNCbdf8HPxPcg+cRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0PU7PdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0PU7PdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BC81F00893;
	Mon,  8 Jun 2026 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921503;
	bh=LMk3Q3Y+1stOr1Bjs4u9xTBvBYnl+KVnkzjCRfOxZik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L0PU7PdHCIZKSRIKUIIcVktInjT/BQ6eYhcOFoEmwndaKGiu+lrH0Onuz6uAcFaQA
	 7YU3bfGoDvKh2GJpAz9By6GeloqpcDwo/qynAY6Hr+R3rwiy5+HzIkQ6UG/GkmIaFI
	 OcQ52aemc/ADrgNwlxBrWS+DAUHB8bCmKwMDb6c3t93ThL1GIyKT1k62R7CF5HM1se
	 UvtZ1gtAqOLdru/3yMJTcsQsyqDi/sQmgDXS4z7TV8pJpFCPc/yroCPrUo2XJotVS7
	 eB/0h2p0RRjBB6wNXa5P/5y7BGXBM/Qm/tssWLTguNNLJVRkO4BpA8r9ppW0Qil9Xq
	 kEbxLq1vgHtVA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: add `NumaNode::id()` accessor
In-Reply-To: <DJ3NFHS2N5PB.1W7NB3EETHMIB@garyguo.net>
References: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
 <EO_SBeDgsxWcE4iQO1BK8iLSsACxKbaj5GDyRFFIx1cUIpiy_ayIz1b4-k-cUROCgrBRIQNOOXUdVEntvH1izw==@protonmail.internalid>
 <DJ3NFHS2N5PB.1W7NB3EETHMIB@garyguo.net>
Date: Mon, 08 Jun 2026 14:24:53 +0200
Message-ID: <87tsrdgqy2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Jun 8, 2026 at 12:47 PM BST, Andreas Hindborg wrote:
>> `NumaNode` wraps an `i32` but offers no way to read it back. Add a
>> trivial `id()` getter so callers that need to pass the node id to a
>> C binding can recover the underlying `c_int` without reaching into
>> the private field.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> This will be used by an upcoming change that adds a home node parameter =
to
>> the block layer `TagSet::new()` constructor.
>> ---
>>  rust/kernel/alloc.rs | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>> index e38720349dcf..c02290bb79d9 100644
>> --- a/rust/kernel/alloc.rs
>> +++ b/rust/kernel/alloc.rs
>> @@ -126,6 +126,11 @@ pub fn new(node: i32) -> Result<Self> {
>>          }
>>          Ok(Self(node))
>>      }
>> +
>> +    /// Returns the raw NUMA node identifier as an `i32`.
>
> #[inline]

Sashiko will do this for you now =F0=9F=98=86


Best regards,
Andreas Hindborg



