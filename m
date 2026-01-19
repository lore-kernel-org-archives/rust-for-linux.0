Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616431AA99
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831642; cv=none; b=eUXaJBwnyM8tWHi7YOD61EWOLALWHDs3ozK8aKFr4nbVGS5D2yXtikDvy+UGHvaLKMnbwhvRNdK2wmpbpJQx5GFOlJVJPh4tF1ddNVNAVS4EHoxxBa523BfiHtKLcUadhmUNvHU+cHbK8Y0u6SDp8ZNTAlZtx/XfDH3D30m+8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831642; c=relaxed/simple;
	bh=yb2IwyrvgL7pe9Y3GYA9UsTZssqEFQUWe0bspd2ygM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=YI5tOVF2PO6qC1AML1hAiJvtXe1AYdcN9s8YETxcckYdmMVI8HldfcyaOJKss4R8Ftnj6Jtoc3HQd3xCbQHqDx4bihBwptHs7oj1bEoPLdDcWH8pJfmZAQlPpvp5VVz3I5w5tNPiPkWic8v8hlyvi//hzIRjvw7KgDYFBDPpxBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THptCBH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THptCBH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576F9C116C6;
	Mon, 19 Jan 2026 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831641;
	bh=yb2IwyrvgL7pe9Y3GYA9UsTZssqEFQUWe0bspd2ygM4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=THptCBH4z91Qh0GbL5hJeGiY5K91T2aRauj52ZfvGJDa7Cs0aoi1/NkO8+zc485Ao
	 id18QtmjtvvwuhlbCMnIIXogzJ7IRdtNifYQiF0h8xeAVcT8v1RkiX6ub/t2fTNpAF
	 GqLbxoL8Ky5NWoYWj2F+upOKDfbkXJKqT6PrM26fpklD34hN5jbJDCaX7dxWXtue0a
	 qnknScfVZYLJ6x3Ys6GPZkDPCSmUbCZIDg1ZpwhRBDZ0iCQCTG4r2sk4oqtW7GPCCS
	 Iy3WGQRrMxyYtRVEw3z2Glg28q3wA48VuXwi/DhR2fIfpSbJZ/XCNuhTOJ9QIsEAAc
	 wavJhTmk3vKBQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:07:18 +0100
Message-Id: <DFSMHGPBAMQR.2M5YS14R1ZC6D@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1] rust: debugfs: Use kernel Atomic type in docs
 example
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
References: <20251203000411.30434-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251203000411.30434-1-fujita.tomonori@gmail.com>

On Wed Dec 3, 2025 at 1:04 AM CET, FUJITA Tomonori wrote:
> Switch the read_callback_file() documentation example from
> core::sync::atomic::AtomicU32 to the kernel's Atomic because Rust
> native atomics are not allowed to use in kernel.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to driver-core-testing, thanks!

    [ Use kernel vertical import style. - Danilo ]
