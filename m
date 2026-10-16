Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9347ACE0;
	Fri, 16 Oct 2026 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152649; cv=none; b=apeVDHDKrMDGVZ+lArpPgxCLJJJNdcg9R/t+TdggqVtGb07akT2n3rBn/oKWJaFpf3Da4SDCkv0ikJPieD2mVBLyRdyd3Yk1QgTXWsTL2kTYRWDOMHImmxwau9gp5dVq9e+HWMOP7GbsOk6AMaTu/ciS2rYl8q6Q06fQtaPITzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152649; c=relaxed/simple;
	bh=I2EOVYSWSibnwSbvmZ9Icl3P9UW6LIJ9IuDIZoFx5OQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uGwIpfzcjvpgqbMEPbfmliXa8I2EJryfm5/5qc/M65k5oILYW4t8uciN5m/1XRjX++8wp6tJLwQgl2skx47ktF7tVO3jtwN3HbZbwvuExhujmYrZonjugRrAujhMRybEAstyVGpTn0JtXfzlbrQPY3grQ1BvKSfhlzMAfk2ftKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BxhsRove; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BxhsRove"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j5kKw0wrjzMkvn;
	Fri, 16 Oct 2026 14:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792152644; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2EOVYSWSibnwSbvmZ9Icl3P9UW6LIJ9IuDIZoFx5OQ=;
	b=BxhsRovexkzm/j03lF7h8T81J+DaEDb1vPJQtAM/gNEHwDsm5043EAIs2QqxTKLqu50co3
	PBv7W2zK06FB8aCQ+r+iii7RNBqV64XIhwz+phUXjB4W8oXOaLVnkOIL/gCmb8aXfslnmW
	7a4PdVrFg3q+s3+SYFpEbzcZnSWmsLPTQM1mjAFlcwEgEYTqX0ZQRLPiJ0VeXUiHrd7cvU
	lQZifTf11q6ZiAkCXmpLqcAVd5aDR+ETBDW7pZqSxUAFHnafbZtEEdDLgMRQGGDwA4sRuC
	86ZzN+NDLu5uJPYqOKryEi+/M08ekEcDs5wIJwptXbDGtm5KrF5dK1O40tSP+g==
Message-ID: <3cda8a87bb8c243f9409b260853c98de2ff78b63.camel@mailbox.org>
Subject: Re: [PATCH v2] rust: DmaFence: Remove static lifetime
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl	
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng	
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Daniel Almeida	 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 16 Oct 2026 14:10:38 +0200
In-Reply-To: <20260930122755.1657820-2-phasta@kernel.org>
References: <20260930122755.1657820-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: be247911bdc56e199d3
X-MBO-RS-META: m7p3i7kbreozqwrixqa9tkw7omxdfiem

On Wed, 2026-09-30 at 14:27 +0200, Philipp Stanner wrote:
> A FenceCallbackRegistration can stem from another party than the one
> that has created a Fence. Should that party forget the registration
> object (for example through a refcount cycle) and then unload the
> module, a fence signaling would run into the unloaded module, causing
> UAF bugs.
>=20
> So far, this has been solved by demanding that the payload data of the
> registration object demanding static lifetime.
>=20
> It turns out, however, that this is harmful because the static lifetime
> bubbles up to all users, ultimately potentially causing a large amount
> of driver data to be static, which renders the lifetime obsolete.
>=20
> Solve this issue instead through an unsafe requirement which demands
> that the user does not forget the registration object. This is also the
> solution chosen by ScopedWork.
>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=20

Gentle ping about the merge since we need this to upstream
drm::JobQueue


P.
