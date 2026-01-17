Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD86B23BCFD;
	Sat, 17 Jan 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677955; cv=none; b=D3C4kD2YQOK8IncxdCZ0rOMWmMQnuTZGwr1Zd7DeD+OyU/6nN9qT+XknfWnROdnKKsYxPbW9+cPz34Xr297gxXNuIGOUBxpylMd0PW77Sq7Mv0lQ0//giYQY8v+V+fpMoigx9H5XVcNlseAFQsrB71+Bn313kbClcB990CB5PvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677955; c=relaxed/simple;
	bh=o+RyXLYoN1QEVu3LzLEdypszBj0s1McXWOzPSAZwfnk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BYFl8cRiRKXCOpc74IRVKZnmi4fpvBOTFh6GHt5mz0BMvWQf2NNqFvMtYsDz1cTXc/RSWvLEPPBrlxnU5v84fQ44ODW31VKWIgr3opvb1g/rtFsQ3geuEryE4Q0wz6Q+YpwrwzcKF8+s4ghH7OelrZ0wHpPTS4bc4Oda47qrP3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS9jj/Fx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS9jj/Fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99DDC4CEF7;
	Sat, 17 Jan 2026 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768677955;
	bh=o+RyXLYoN1QEVu3LzLEdypszBj0s1McXWOzPSAZwfnk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=eS9jj/FxNOmIIEAffM2d7Ipy7UPwfgMCECkZCC95wXJfvLhI+0Na+t/W5SWh7afMI
	 /GQbyJotTb6h+c23XjsBayDucQmq0mxmfFGI3H+HvXmHzZ5f2nFrGWha8dVNIUFynU
	 2DYSNST9QOjqD7upQfZeR073avyEresgyYbY/K3+qbv1VG0Y+xbaC785ZXh4iIHEsm
	 VSc+YGZNp8IpTLfJaRS7EaNH8+wmmPqEFezEDRd9dHeQBv4FTuQ7kfMqTjDnKQ2MON
	 HFbiCLunn1O33rs2AKoHCZAl0wGOhb4ZdKgCn7U7Q9UrvMrGZGmgk5yKtgtV+ULvhH
	 DozJWZaGc8ZrA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 20:25:51 +0100
Message-Id: <DFR409RFEJH4.3ABKI91FVIMGS@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Guilherme Giacomo Simoes"
 <trintaeoitogc@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] rust: macros: convert `#[vtable]` macro to use
 `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?=
 <jose.exposito89@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260112170919.1888584-1-gary@kernel.org>
 <20260112170919.1888584-4-gary@kernel.org>
In-Reply-To: <20260112170919.1888584-4-gary@kernel.org>

On Mon Jan 12, 2026 at 6:07 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> `#[vtable]` is converted to use syn. This is more robust than the
> previous heuristic-based searching of defined methods and functions.
>
> When doing so, the trait and impl are split into two code paths as the
> types are distinct when parsed by `syn`.
>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/macros/lib.rs    |   9 ++-
>  rust/macros/vtable.rs | 169 +++++++++++++++++++++++-------------------
>  2 files changed, 98 insertions(+), 80 deletions(-)
