Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB51223DF9;
	Fri, 26 Sep 2025 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758902111; cv=none; b=KXrFBMBnpQuvIjsTu85scSYLSBRUZS3J53Jc0gjYttHK/V2sg0x0Pd0Kf5IB2f6CHFJXvCZ6wjvOJaOGRZ5P9BwkoRE/v+MPN9KqtimCR3akK6OrZ4qMxcvx+czK8A85JL2zWLD64RmiC/bap+DgP70HiESjaqAsHidFMpDsIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758902111; c=relaxed/simple;
	bh=OzxqoyTtf+EuffsezjoPsxJ6HfLEB0LUL8fkAFz4zrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Cskan+aYvW/s2EWBdeyOUrJ1GlHh9OT+Hmh50o7rvHC0AvvM0TspAszg+1ET8HX3y5/ZeTUXqZuKlM4qgEdLUW0kcqvOD+9FdoIcCiGLafcyPQz/7bq+sglzmuP/nHwEpCBVcfPusvQ9vLWwFa9Vn/JplNIlOTr20ri/RiYFa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfdGyz2L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfdGyz2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB885C4CEF4;
	Fri, 26 Sep 2025 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758902111;
	bh=OzxqoyTtf+EuffsezjoPsxJ6HfLEB0LUL8fkAFz4zrE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UfdGyz2LRLgLbrl9QdQ87SmP54QKRNkbEBjZH62cdbLcY0wKjDZYSqBpcrMIpVck7
	 OjRe+wFP0taQ627IV+S0nc2WG1kBNk81EnH+WdHqtIglLeRiN0IdppdxbRPFPtosGH
	 fvdc9vibD+iWzkv+PE0dyVuahncKOE/GFQV4QzKlip3/r/0XEuJcd6qlc4aU2wOwBW
	 P0KDG42crpJB7EQTwXezuZzuk7AC6RA4LMZPKFdq5OZQF31fA3/goO2CunOPMxwvdP
	 1vsiZI68jWTFV7AT1bxBwXXmnlAc+w/d7vHrL2zSrER/MZS3CVK2MVqQfkYs1O8Ufr
	 9JkA2dmTw7Z+Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 17:55:06 +0200
Message-Id: <DD2URCNO2P88.168J48GHSJRRL@kernel.org>
Subject: Re: [PATCH] rust: slab: add basic slab module
Cc: "Elijah Wright" <git@elijahs.space>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-mm@kvack.org>
To: "Vlastimil Babka" <vbabka@suse.cz>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250924193643.4001-1-git@elijahs.space>
 <DD1SGLU4180C.361W5XLH76XNC@kernel.org>
 <5f09b7f5-e7de-4333-8de5-322eb6d93aa9@suse.cz>
 <DD2UB5P01XW7.1GW33112S22Y@kernel.org>
In-Reply-To: <DD2UB5P01XW7.1GW33112S22Y@kernel.org>

On Fri Sep 26, 2025 at 5:33 PM CEST, Danilo Krummrich wrote:
> The only thing we need on the Rust side is that existing allocations rema=
in
> valid even if the cache is destroyed. Or the other way around the cache i=
s
> silently kept alive internally.

Or to express it in C code:

	struct kmem_cache *cache =3D kmem_cache_create();
	struct Foo *foo =3D kmem_cache_alloc();

	// After this call cache will never be accessed; leaves a zombie cache,
	// since foo is still alive.
	kmem_cache_destroy(cache);

	// This must still be valid.
	foo->bar =3D 42;

	// Frees foo and causes the "zombie" cache to actually be destroyed.
	kmem_cache_free(foo);
