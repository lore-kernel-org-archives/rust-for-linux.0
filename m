Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B4322C6D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435910; cv=none; b=nsc8WjqcAvEvW2DlVwqRwwRkQI6jgCDJChcFAoWom8Ay0J3BVNOCCGz+xEAgxeQWgWdzLdnbYlJvUH41ny4s3469nVDUywFnxPTfvdFTKjO/aqtAQW6aVBt9v3yKGSGxqbYwXKI9dAE47r3d1xJPi1SwAeraMZY/08tqhyiQjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435910; c=relaxed/simple;
	bh=FwWCLb8W4ptXXek0n3hs387brnND5lyq2MkyZwqN2zQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=M+F5FoNgDA39trWprqQNCSxEk/fhXf399HuW851fUpRAg7l8tkvU1j9/d3g/htamVYjlMJI+WZYCYDhdRx3FcVPumJZ6ouYQXFid5o0+5pGedTPf+adRvmlmRd7s8CX2BCex4laVhXsk3NQkewyxyj+SKqJTUFNW+0zY0qddngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AahY3LdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AahY3LdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AD31F00A3A;
	Tue,  7 Jul 2026 14:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783435905;
	bh=FwWCLb8W4ptXXek0n3hs387brnND5lyq2MkyZwqN2zQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=AahY3LdQZXWodtF0xVkSfY/tYQVjh4OUzbBM4vKiTyQuM2neGuKAQdhOhapk4hVBO
	 u9R1CqBIrAq6ecTuowLhYLdl4at2MG5FrSIWXWS+d2XW90FrO5mxmVnKvBGWPRwdJU
	 kK8L+f4fLuwxszGXHMqV3SazVCTWY9XB05nx+0966zK/cFYp63/JQWYI5jb34T3sIj
	 uWiRIoyxHYl5EpMYETvM0Dnu/Rr8TfiyOYbRyVj1DWrdzesnCWJaHx4iGbgsEZE0ts
	 EcC68TR5XkEwwQCMMVCAnzL5tBD6/uV/2HV4Ech+l8o2Z527cB7hcmjRYbOLY3WXXF
	 YPUcJfdkDcwjg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:51:40 +0200
Message-Id: <DJSF9IBYP207.2UQXDE9IVSRUF@kernel.org>
Subject: Re: [PATCH v1] rust: bug: Add bug_on macro
Cc: <ojeda@kernel.org>, <a.hindborg@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
To: "FUJITA Tomonori" <tomo@aliasing.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260707143026.2774023-1-tomo@aliasing.net>
In-Reply-To: <20260707143026.2774023-1-tomo@aliasing.net>

On Tue Jul 7, 2026 at 4:30 PM CEST, FUJITA Tomonori wrote:
> Use of this macro is heavily discouraged. Prefer warn_on() macro with
> recovery code where feasible. See the documentation for C's BUG_ON()
> for guidance on when it is rarely justified.

Given that, can you please spell out the motivation for this patch?
