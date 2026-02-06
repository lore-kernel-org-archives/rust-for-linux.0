Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E8142848E;
	Fri,  6 Feb 2026 18:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404231; cv=none; b=hjWxz/HKAev/xqjcP9p2RoFgWKv9rjZ4PDV3KBLy22c0ygigny/tqtF1wqVt2thL7HVCkMCaoLIk/Z53vbx5Nm1L0G6covJqJziLmvTYpyjPUz8Sb4cAvmNlomyxJESWszMUs6brnjCtS/lFDfUHgU3TR4pljXYMTUZWiuo5LNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404231; c=relaxed/simple;
	bh=Qv8wau7BBLbYL1Beq+unX7XjDHYcFGOBx65tANkJWX8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=F+PM5/4kZnutdRQF2sWRArlVPhUfcMZdKa1w6ys4gK8i3Zry3Ln7fdhefKXDWO4iFxTOj7dPWKmfk4I3Yr729OpnJYkbIbxVpZNGFZRACzz0/EP5STX7bOkJArmiNvgGfCL+Bgi5cxiF3S3gbF8tVmFZDonK5F1YSQFMEg74hOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjNDifPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjNDifPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3EAC116C6;
	Fri,  6 Feb 2026 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770404231;
	bh=Qv8wau7BBLbYL1Beq+unX7XjDHYcFGOBx65tANkJWX8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=HjNDifPw/iLQs/XLb6GtazthLBBEdUhN8k2BGYWVY2eqKzQ9UQSLM1vpNtzbnwsbm
	 YrVszjonV9TDVNemAV3CtNu6sCEE4Orf+ISHIIIO9+urCjNsr9cy0Zec1rKbEHEvOD
	 INh1oYWyS8a4YnTZXFaoY0L6WoOc2sQhhN7hEWzRyIyIjvg6ELVieGYbB4w0C582gi
	 q9BCM+9P5qx5ThOcyCpjJNyji5pkPFP+jMd94RbAyFK7A849Kpes7CnCPIl8xl6oDu
	 McjO/xkAt2k05Ib7DvbiV/MZjknoZnMutyKTfL5aVEqBsQMcr0JDxKZBssrCgeT0uZ
	 d6vTvYcptcCWw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 19:57:04 +0100
Message-Id: <DG83X51TV560.26VQQD3B7WJL9@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 6/7] sample: rust: pci: use `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-6-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-6-c4587c902514@nvidia.com>

On Thu Jan 29, 2026 at 2:32 PM CET, Alexandre Courbot wrote:
> Convert the direct IO accesses to properly defined registers.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I think you forgot the address my comment from [1].

Changing the config space is nice, but I think it would be even nicer to re=
place
the raw register writes and reads of the pci::Bar.

[1] https://lore.kernel.org/all/DG2DEH4ELYHK.2KUOIDQAILZHT@kernel.org/
