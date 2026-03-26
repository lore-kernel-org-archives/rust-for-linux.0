Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11925346E70;
	Thu, 26 Mar 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522563; cv=none; b=JM8Qir+WfZ/YAFHmu5pSbTQOMnN3SQ9aaZEIKA97T2yl56TBKVt7GaK7SBRKd+nKsSRCPXf4snNoT7qwQnHkiULoQ8RB45So2qMhfkFmKBuKYfCAKaMYscpl21QqMpyJgs3JseyH1f4/tK4dFzIhTAXj7H7ovJvirgqCwwByQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522563; c=relaxed/simple;
	bh=gClSfb02RjZ/fjzdum9Rhi7VtYY4f0HBIesGc7mG3yE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rELgy8j/nE8gzJ99WEc5gJEWDKQZE0Gb10f67/Kg7YX06LmBt5o1Yr7uSivkxD0fkPInJJxsFn4JyroiH9qfVNlkg9UfMnhgtik/u0BwcJE6kM86fIE+eaZu1Xt6CsR6Erc7f82UwOnnhG4RLLYd8OfkCFuKRm4p+n6JLS4xNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw8UtaHl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw8UtaHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BB7C116C6;
	Thu, 26 Mar 2026 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522562;
	bh=gClSfb02RjZ/fjzdum9Rhi7VtYY4f0HBIesGc7mG3yE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=nw8UtaHltLNcD9Vq4Yo04b5/XqZU2vAIv0CfeqB1fuH/u9kM8VE9h0tHBF0Z/8tjp
	 elKdB2X3g9cHxy/O5H1KSaXXTv0+iHbYVTLPki8Rk4PplpRBJpLGO6dLIJzQH/IiZJ
	 u2NKxouDElasbmH5E1H5l0F8MDwqauE9z+iJdJe4ONCnp3PD9CN42G98opytW8BbOC
	 AJ0z0bN3x0tiE5yIl5o+9vBKGxyLbFmqGVDDUw/oO74mnl5/ofQRG+X5aWwivuAAsA
	 fLWk37+2vakaJoUftoTcIv2G64LyoGBV3dqKqJgJSy18OyP9LQa0RB+Bu9pD1uOC3n
	 32Yfon/m5DJ9Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 11:55:58 +0100
Message-Id: <DHCNQXCUUEDI.1NVFTYVFBMTE3@kernel.org>
To: "David Rheinsberg" <david@readahead.eu>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Cc: "Alice Ryhl" <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>
References: <20260326095621.846840-1-david@readahead.eu>
 <acULYP6ejIQAIdX-@google.com>
 <afe9ff28-573c-4760-a310-87d4561bff8d@app.fastmail.com>
In-Reply-To: <afe9ff28-573c-4760-a310-87d4561bff8d@app.fastmail.com>

On Thu Mar 26, 2026 at 11:45 AM CET, David Rheinsberg wrote:
> On Thu, Mar 26, 2026, at 11:33 AM, Alice Ryhl wrote:
>> We currently say that you should provide the right length when freeing
>> an allocation, but this is going to violate that. You should probably
>> invoke realloc here, like stdlib does.

Ok, Alice was faster. :)

> `std` calls `shrink_to_fit()`. Should I add it as well? How about
> `shrink_to()`? I don't particularly need them, but I can expose them as w=
ell,
> given that I would have to implement those.

Let's stick to A::realloc(), that's the only thing we need to justify the s=
afety
requirement. I don't want to rely on shrink_to() and shrink_to_fit() not do=
ing
additional things we don't need for this conversion.
