Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738268;
	b=k9hqIwCfiH/04itICzYj6K7pmFt9jwEheRZGkIuDDXM52Pi4X0n4GntX6XFzXiHmudZZ
	 xZ8S5W2jB4P7Opju0V4/zjaB4ptqm1/isutTQ7glZjoxAoTYIRmVdZtRttg3ltmhcX3CF
	 SxYVBbHFPLWM1gbkH166IpRhLpsTaoZMfU2+miIckop9iKOpF0yfZ+Do6MFGkrZQ7Ggg9
	 BF6ysjACzuIYYSIKsOQk4gSVcQBY4p6n7fE7qPqgahuybGKD6HZpmXZfhMJVj2QfXVJbE
	 95bIajphkwzjt9Uno7aWGrXPELeYUW6mUnV/0mqOPWb9ZQMcPLnvQuymUMznM5fXWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738268;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=5vq8E+jHMyDXl7eoZ57S4Q2ik2oOMkXHS2FXEVqzJ5Q=;
	b=GyEbf60sIY49YYmPN9haLGI3Yj0ZuCCXM0oZcqoVgJAuymHSYzILQs9QHNTBf7UXrWHX
	 7yol4QuqjJEpAXblLM+uJNmxO0r03+3eSc8jJjUoPJJCz9hOe240BYDtTs8XV9cCNJn3x
	 LpqWVLsMD8QEc9xMpAzqOdU0+k+PIQuJLTEk+8ASu2GaZ2Mecj3saKDeYgQSEulpZi9V4
	 hyUcwbRsiQQLkSKdsAQPOEo2cQk9W3ADft3p2aR/kGEchIaMU1FN/aBepjvJWfg2136OV
	 HtjbEEN6VyhxO2b6cEIfFE02ME5cwEONglgl5LRFgxnhdsu17rhs52e3bpk4JzoijoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=rsfA6x9z;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7C606A31B;
	Fri, 23 Oct 2026 06:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA7C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=rsfA6x9z
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j9tvq5YVdzKnkg;
	Fri, 23 Oct 2026 08:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792738263; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vq8E+jHMyDXl7eoZ57S4Q2ik2oOMkXHS2FXEVqzJ5Q=;
	b=rsfA6x9z5gz9g+eJNQ2b7ucfNKLVP6pYkEfxQrRioI9qekqImCTXzDl1DvOCwwhMUWC2l/
	l6eC7wX03rSP3dpTBB/KdSKyhtVyCrJgisa4Ghgp5piIyo6YjIiFon14EECCJG571CWy1A
	UfhCXHLNcgzBfcsfdcmCQd9idoH1rnubsWfOTPsOvTZEczpOT+gcXP2v06Z0SarZUz2eMq
	TjR3uxJyFNn4XDW26dtaxENxyt81tG17P3mLwzYRRvCSVaJ3DtFAE5jP+4ta8qi64Fl1OO
	UCDr2+SUbr1uJtKsbshZJArI0+6X+FWU7iMXNYu9E0eLiYMNoLUD3zcBo2Xzww==
Message-ID: <948cd47aebbd0639492db1fd7bc3852e7e60af91.camel@mailbox.org>
Subject: Re: [PATCH] rust: DmaFence: Don't drop on signal
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
Date: Fri, 23 Oct 2026 08:51:00 +0200
In-Reply-To: <20261022162701.2297062-3-phasta@kernel.org>
References: <20261022162701.2297062-3-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: o977mejxkh8hcuc9iopum4f67tyimxq5
X-MBO-RS-ID: accedf3891204f28d89

On Thu, 2026-10-22 at 18:27 +0200, Philipp Stanner wrote:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `self.data` is valid because `self` is valid.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let f=
ctx =3D unsafe { self.data.as_ref().fctx };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let _=
 =3D fctx.nr_of_unsignaled_fences.fetch_sub(1, Relaxed);
> +

When I think about it we probably want to address this in a series
(preparing for JQ upstreaming) where we also have my proposed
DriverFence::drop(synchronize_rcu). Otherwise this patch would need
both synchronize_rcu() and rcu_barrier() for formal correctness when
the FenceContext drops, which is just overkill.

If only we could fully lock the fence, all this would just go away. But
currently that's what it is.

So forget about this patch. I send sth new soonish.

P.
