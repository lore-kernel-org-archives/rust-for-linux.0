Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8521FF38;
	Mon, 16 Mar 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658666; cv=none; b=jEWq84mK/RXmid5OTVryFphn9sIeTd6mRVtKekDxaWApejrO8Ud/iCf4EAgSHI+lIWw8TZ5Fb/gtb0ssyFoHK0v0LPDQsypmnhF7Tsta5fr97vHlQmwOf2+fADvcKogIf7p8NUESN8loXs1k4ku9w6z3zw+dN2BDZS4R2+dw2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658666; c=relaxed/simple;
	bh=NbAX6eqXGoeO/CF+vA1I2UOPsEetVJ/WcyRuUfqMZOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BJgRgdLfK1CafVNfe7XfQtUHeUr8hlPay6j8n1xUpj3JcXzp/uWv5XrvGPUMBDzQA57ey47O1UjnFMMmF0AHBJ+yAjmwBcBH5BkQgfFR19dJF36OCCdInuJ1A1wT7r80vBDhJMIFkUxFZ93xDak1Hm0PxU1sr0m0KSftCxHPNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrhLTrsf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrhLTrsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E502C19421;
	Mon, 16 Mar 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773658666;
	bh=NbAX6eqXGoeO/CF+vA1I2UOPsEetVJ/WcyRuUfqMZOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nrhLTrsfyNyhp2/iqvgL/UyNdvh8jaR4CIyApTaJisbEGPEJtHyBidT2r4t8wA2Uj
	 QGmQ+yodnd1l4j6LWVcIONxAEo7ZavS0KCd4vM7IuZaFXBF/1VurWkcQxF8md9PvEx
	 nNHicXNrtU0kBq4hyZkvfEJltBmfb8Bpv0cnK7Ixt0NBxFBID9EQCb2o3NWk2+I4e7
	 vC+RA+OsGAwVNcrTTmVb12AOLyeXitnNZ9+wkrba/cPJgYamGx6W0HyG2izCNttzzs
	 guiP5ul+tHHpG27sznbalhdPnLNaB2H4eS32ofOSF3nPBCsSO3wLGKN2lqX+7Srtii
	 9rC93xKFwSePA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, Boqun
 Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, Tamir
 Duberstein <tamird@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
In-Reply-To: <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <w0p27rGwxnTIYLId4IA3wuzLE_SM-svmCGmNK1EyA7FhtBfw2H8Al-EdeNamE1Z0__OaC3hYmGlL9E3mKMO6RQ==@protonmail.internalid>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
Date: Mon, 16 Mar 2026 11:24:38 +0100
Message-ID: <87ms08rs0p.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



