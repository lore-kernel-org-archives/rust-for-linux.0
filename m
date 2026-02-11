Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCD42048;
	Wed, 11 Feb 2026 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795962; cv=none; b=p/n5EPfSxRzI6evdgTBCk7N8gcpqEUEUcdCjffpveHlzFRTylo9LB20p/oMdL8cCFiyxni3jNDpxK1UhgYvPh/q7Y8YQgfa0/0+/jvGr8cgoryG/ePgUprPWZBZg0L/7UZz5ikFR/IfKG9T8m+BeUzo12S2RktEObalImfkhnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795962; c=relaxed/simple;
	bh=hau6d3ZhCXyylwP7O8OXnAGlNr0yKooB+0BVaN+WS84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nd5RbjJeAHBuXoKchpjPEcmPM23tfXi8XLH1jUZbZBPytg3FqSCE/6JFsh1wgWoFolVADb/ht2FaOsu55jygVE1OtCUgXXAj5YvJueCGIaIxCeHYZAFs9dtgUuPyh7zKEkiBBYBxyVw9R+6U95/xeRqWZuwTwfanfmht7lBkVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjoXhLin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjoXhLin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358C9C16AAE;
	Wed, 11 Feb 2026 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770795961;
	bh=hau6d3ZhCXyylwP7O8OXnAGlNr0yKooB+0BVaN+WS84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WjoXhLinl3f1PL5VSdMkEFx7huQUHpF/rhUM44BTvCN82ViE3apyK8REuLM9j/DZ/
	 e8GNF9PyhxwXU8PfxztL1juUg/eYmbdAeUPvSETxtxhc7dLQOs+k4/8daYlOnUVKxv
	 e9ee+fqB7o01kNZ3+6h8bSkqp3k3iveXaqCxjQ16w8spJA6jz5zy2npWbbVFPgj2up
	 q9G5gnVVo0RczCvDFRaOU1Cxe43loYU4HJDWiso8DOJgySlYXQmy+P5K73dalB61mr
	 NEYpfidta5sUar5G1LDYJuC2u8Nbnwnb2rJUxoqs/ked56KpiUdeTYKR5pFJv3uHp+
	 6D9cGFXqV6ljA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v3 11/12] xarray, radix-tree: enable sheaf support for
 kmem_cache
In-Reply-To: <aYrsR5VYH9JHeIoZ@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-11-f777c65b8ae2@kernel.org>
 <aYrsR5VYH9JHeIoZ@macos>
Date: Wed, 11 Feb 2026 08:45:52 +0100
Message-ID: <87a4xfvi33.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Gomez <da.gomez@kernel.org> writes:

> On 2026-02-09 15:38, Andreas Hindborg wrote:
>> The rust null block driver plans to rely on preloading xarray nodes from
>> the radix_tree_node_cachep kmem_cache.
>> 
>> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  lib/radix-tree.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>> 
>> diff --git a/lib/radix-tree.c b/lib/radix-tree.c
>> index 976b9bd02a1b5..1cf0012b15ade 100644
>> --- a/lib/radix-tree.c
>> +++ b/lib/radix-tree.c
>> @@ -1598,10 +1598,16 @@ void __init radix_tree_init(void)
>>  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
>>  	BUILD_BUG_ON(ROOT_IS_IDR & ~GFP_ZONEMASK);
>>  	BUILD_BUG_ON(XA_CHUNK_SIZE > 255);
>> -	radix_tree_node_cachep = kmem_cache_create("radix_tree_node",
>> -			sizeof(struct radix_tree_node), 0,
>> -			SLAB_PANIC | SLAB_RECLAIM_ACCOUNT,
>> -			radix_tree_node_ctor);
>> +
>> +	struct kmem_cache_args args = {
>> +		.ctor = radix_tree_node_ctor,
>> +		.sheaf_capacity = 64,
>> +	};
>
> Is the sheaf_capacity matching the number of slots in an XArray node? If so,
> this should be bindings::XA_CHUNK_SIZE.

It is not, it is arbitrarily chosen to large enough to gain an advantage
but small enough to not waste too much memory.

For rust null block, it needs to be at least large enough to insert two
leaf nodes.


Best regards,
Andreas Hindborg


