Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFB3F7AB2;
	Thu, 26 Mar 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528806; cv=none; b=czR6yLrFE9S6+mNDFFCFSMpJSSlncmh+EnXZw70nGmobZEkweyIT/S+nAdo0OqKhHCiapiiqacgv/CsYehZ2b29k3Lj6wZxgzaB3QiEpC2eB2PD5zMm/yPGw+DuzcyrpA8MliYvI5pd9uSzt3Y8yKaw+zHkLHXZiiEzQKHZZzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528806; c=relaxed/simple;
	bh=ofX9TyYxsT+mq7hlgb/x6lbktGUUr8cHXd+ZYHPhG6k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=MYth7eBwHU7piBmKqQR4oVb7b39vc19bKjzqRqSsrqjDClSrpv2L2ylee4JpsMRhiYQWAIm6dxj5XQtb20Y3QHr9PdDc7DUqPYf94F1Fg3I6DUHaJxk4sVgDyO+z/P34xJNqM2rcN7rO9eixLFMUDPQhnuCLUi5VdtmlmA81JeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3yAULvi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3yAULvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D859BC116C6;
	Thu, 26 Mar 2026 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774528805;
	bh=ofX9TyYxsT+mq7hlgb/x6lbktGUUr8cHXd+ZYHPhG6k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=b3yAULviDvTM9g6ajAWydPPhwsJFDg2WaBS41DpXWSxuggezmfa31gF3oZ7nH03gF
	 ji33svV8ztev3lNKUJ3e97lp1nl7EHIPF3lyFcuQiQAlokxCggI1CrlISqWfxYwrv5
	 59Ms1+uDiUQ75n6CBhHbCeZQq9XrYGlvjqjAooOYVKXV8KaSp2knztJy8cAap2vW7y
	 y4Bqzh0TKvUuOoTlj1I5DdgIHWMNTPBjRlsQws717hjtaDHGJ5vuFF0z044Nw9kOlb
	 cDrjKAJrkTsk3LEqRxgczfsCWU6dKFkeEI01nbmSf/gIp8GdOlh7B/5wSzxHnDxC8F
	 Wvx03oqJmjY2w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:40:01 +0100
Message-Id: <DHCPYL6AD6DG.35ZOLDNYRWTGV@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Cc: <rust-for-linux@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
To: "David Rheinsberg" <david@readahead.eu>
References: <20260326095621.846840-1-david@readahead.eu>
 <DHCNOY4GFV7B.3VGGZNT3382L0@kernel.org>
 <061ea42f-bb21-4dc0-853d-fd2391309d56@app.fastmail.com>
In-Reply-To: <061ea42f-bb21-4dc0-853d-fd2391309d56@app.fastmail.com>

On Thu Mar 26, 2026 at 1:20 PM CET, David Rheinsberg wrote:
> Yes.

So, which one is it?

> Since `slice` is typed, shouldn't this be implied by:
>
>     "`slice` has been allocated with `A`"

Allocator::free() requires

    /// - `layout` must match the `Layout` the allocation has been created =
with.

I don't see how this is implicitly justified here; the allocation could hav=
e
been created with a different layout, i.e. it may be that cap !=3D len.

> There is also no mention of it in `From<Box<[T], A>> for Vec<T, A>`. This
> should have the same requirements, shouldn't it?

This is different, as in this case we can guarantee len =3D=3D cap.

> I will gladly mention it in v2, though.

We should fix the safety requirement of Box::from_raw().

> Do you want me to add a functionality test, or do you want me to add an
> example for documentation purposes? `doc-test` is a bit ambiguous in that
> regard.

I can be both; examples for edge cases for instance serve both purposes. I.=
e. it
shouldn't be an excessibe functionality test, but more in general one to th=
ree
examples including some edge cases is a good balance. For this one a simple
example should be good enough.
