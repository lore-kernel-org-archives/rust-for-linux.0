Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7631716E;
	Tue, 10 Mar 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155712; cv=none; b=BkMXfTvWE8Hi4R+DoBxJI4f8a/qrm+cCcGQ/BnT0wb3rGnPTqrsnXAMwliyHFYlfzgoyiD27WPF0eS9uxwjZvipte/++od9x4G2oK7ViMgGkfgKPVojtBrZiAyOyZyKT8LrsAprxmeDqC5Ys9vB896cqLq3STy08RiMnCR1iF9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155712; c=relaxed/simple;
	bh=A4idTw/iuxK2fnX89UhLuu4tzWSgPKGXKXnsEnRsGMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RHqtCHVUWtGcUwIONAJ0LnS81QtE3HantMrXXQQ+fk/dM75Z4U+Rlo4CEkuE1vPk97QatdtC3B+okNcxYNhPwRRO2pRynROYP7ZZIJzgLsYp7533IgqFJhUPqr7LBVXWA/sry2ZFuqJNQBJpkPkIQh+EF7zwG9z8WVftTkV1oRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEgUjGfR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEgUjGfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA098C2BC86;
	Tue, 10 Mar 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773155711;
	bh=A4idTw/iuxK2fnX89UhLuu4tzWSgPKGXKXnsEnRsGMU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=eEgUjGfRO6bdM3QpbxZQFW2mlIsFT7f3EYKYF03kJMxIadhPAzMjI1NlpgbqkP9Uy
	 8SK13e7ThKzNeu1fRNOgPNK8kRU8GS+JH793ZjBJlAsw8p8xu58ibj7j72VeVr2VCj
	 BP5pKChcRBwq6tkHAwH4/+Q7xa5dcipR1aL/u+RtItUs0j+rZ6KgVjx/h4JDKJ6Tp7
	 yjPVkLQoz9fj/Q/YdbQhklkCZz37c1pn4z8LQZ+pSleJyCqgiGSIKQuCXLdZb1jHXS
	 Y5XcKXLuE7PC90/Uj4+mtZdS17QJWKazwQzLLpTw57ko88OhKAU3NhFNtYtMTtLDId
	 2hUFM6pVvZpUQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 16:15:06 +0100
Message-Id: <DGZ78LZWQ71S.5ZLQTDNWW8PB@kernel.org>
Subject: Re: [PATCH v8 05/10] rust: io: add IoLoc type and generic I/O
 accessors
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-5-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-5-424f80dd43bc@nvidia.com>

On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
> +    /// Generic fallible update with runtime bounds check.
> +    ///
> +    /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
> +    /// concurrent access.

NIT: I don't think this really comes as a surprise, so I'd make it "Note:"
instead.

I'd also replace "Race conditions can occur in case of concurrent access." =
with
something along the lines of "The caller is responsible to ensure exclusive
access if required."

> +    #[inline(always)]
> +    fn try_update<T, L, F>(&self, location: L, f: F) -> Result
