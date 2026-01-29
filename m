Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D6335C18E;
	Thu, 29 Jan 2026 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769720890; cv=none; b=QtJb90ricuXAahcFN7wluB1pq0BiCrv5fGhL9JrzqLw6hZrs4ucfdSQpNNwW3l82N+sWx0c5Wtsb3InLpCPudipYgV208+NMQq0GQdjy6ApPsTnlPDygrFLfL7phQNmmrSxQeCnJsyWzM53f5S+OobYGKfC+Jwhalnn96DpCoXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769720890; c=relaxed/simple;
	bh=ftfrQd/ES4H5plF9z0HigSVRBDvqHy/5Ly6SDuoK+0Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=ENYm2fAHBFjatjB+Oc7/llqr+pGXT2CGPIMT6A6WF6XylVUHC4XQIqVq6jcsEYI3it+P4wL1LNz9ajHLvkygSdyS75VMTNtYDYcU2EOFwcZOVyjq7m2GUoKXYrT7Ql0C9NIkGiJngKMOsKOdu+YCxTmzPWDqyZfLxcgoSZ7L/6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiqSBt7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiqSBt7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56AAC4CEF7;
	Thu, 29 Jan 2026 21:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769720888;
	bh=ftfrQd/ES4H5plF9z0HigSVRBDvqHy/5Ly6SDuoK+0Y=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=qiqSBt7d3Vx5a/9z7kbHsGfAmsojRKaZB+nmRwqbpPSPcgBRuc8zdbbVxQ7/WwrBw
	 invM/2m3fv+LdGTWpBt1f8lY5hxtlRzby7AcDoY8rthyPXsgKWqvcd7SBohegSfEPt
	 m4oKnde1lKXwae0Dt2kFjRy/r3mUhVP1zrQs6L3DrhimtRdBqZUQVhoKfEEWsqIhE8
	 MtwXo+TfX9F9XuRMst81hiD6NCwSnqpIz4ynptCORgiIFDaDQ/HN8cYZPNoP5/9yxX
	 FJ++WSsdKJ3ChPSrv3zo/PNAS16Fr4zPqlSUz/jBzxudAoF6mME/FS+4efwSC7paok
	 /7du7682RTmTw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 22:08:02 +0100
Message-Id: <DG1DP20EZCTK.2YW5G4C198BQT@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
In-Reply-To: <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>

On Thu Jan 29, 2026 at 3:10 PM CET, Gary Guo wrote:
> The issue with `Deref` bound here is that now you *require* a level of
> indirection. If something implements `Io` directly, you cannot use it wit=
h the
> method. While `&Bar` is accepted, `&Mmio` is not because `Mmio` is a dire=
ct
> implementor of `Io` and not deref to it.
>
> A `Deref` bound also does not help if, say, a type is `Arc<Bar>` which ne=
eds two
> level of dereffing before it is Io. For consistency I think it's best to =
avoid
> `Deref` call all together

I agree with that and we will probably run into this once we start implemen=
ting
the I/O traits for things like DMA memory.

We could use AsRef or a custom trait instead, but I'd rather leave this for=
 a
subsequent series, as it requires more changes. They should also be transpa=
rent
to users.
