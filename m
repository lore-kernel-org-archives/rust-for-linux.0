Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412EA473C6D;
	Mon, 28 Sep 2026 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584387; cv=none; b=Fy9RMBLssWAfy5Bz5ruo7qqMYsR9XOGQk47fDYmq+9JOh4Z5GN7+1T+4r6QIFyCd+MqSNhgenXbD2yTpV+w4l0c0M7RjhbHzSml4ytuL+iY4smhJk7iIvYLqyUzle3xz+A03n47TUonWR167dp/pcFq0ybSRHHv199FGJhDSt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584387; c=relaxed/simple;
	bh=dPQiJZRjfltzxHJi5k9HU87/LqeEBeKq9w573KqY3SI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aAeVHBTUtYmB284qh9IRDs3pDty6kiF7LgRb4MA08yio5VPEqgfAvXvubCf/uksZlorU+TjtZhlhfwBWK3y208jBBHi3xoExkk31OEnPv02uFPBHfZvdQlsNKXqY+NgKlxSBUO1vk3KRviMNSYlWjc7Awr4xa/ApyRXypPtPEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qZHnr2GI; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qZHnr2GI"
Received: from smtp1.mailbox.org (unknown [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4htZM10m9RzKvhy;
	Mon, 28 Sep 2026 10:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790584381; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPQiJZRjfltzxHJi5k9HU87/LqeEBeKq9w573KqY3SI=;
	b=qZHnr2GII/3uXBtgXhk9jwe1cKSNnnxbS1eS0cUNSfxgvLUx0tdxWEI3/YaMPnq5pqdjTl
	0pLd+FSsXbJl37nBHb0y7m8KXaqXkeE/QW3Jlw/QhJfyZxSaOls+h39hYAvx2brTTcqRTZ
	EsCb+b4kG1+ZHZsuoSuxjT2fOZwrNxQGMipPN7+RIm1grTE02NhaRtQcRtqVka5pBi0QGU
	aO9Iz1yAfPThuBJFAM40Lg6jpLwDOLJl6HdHcgql/BDT1L7jtYUTsvOy7QEw5y31Tx0n9N
	od2Jaxa9JV1CTI80iRAiE8t+7JMJwYE3PQoZPFV67UmsSz53C6Fl15T++Ozqsg==
Message-ID: <a44b26ceb273f0cdfc04a4391040c08386b31e01.camel@mailbox.org>
Subject: Re: [PATCH] rust: DmaFence: Add better warning through Device
 reference
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, Alice Ryhl	
 <aliceryhl@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng	 <boqun@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=
 <work@onurozkan.dev>, 	linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 10:32:54 +0200
In-Reply-To: <DLQSQE8ZXLY1.1XFW8PGSDLICT@kernel.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
	 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
	 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
	 <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
	 <DLOILT0V4HCX.31L2PE7YIAKY3@kernel.org>
	 <ab1241777ac432666bb1564d875211bf142a6398.camel@mailbox.org>
	 <DLOKSGU61PUG.WSZBN04H0A2Q@kernel.org>
	 <37a2858a4687e4d9bbe0aba4c1861b96875c4ed7.camel@mailbox.org>
	 <DLQSQE8ZXLY1.1XFW8PGSDLICT@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 1xuw3zyrf31yye8ku3bcs35ptp84s696
X-MBO-RS-ID: ac8c0f2cdd2425f6d3a

On Mon, 2026-09-28 at 10:11 +0200, Danilo Krummrich wrote:
> On Mon Sep 28, 2026 at 9:52 AM CEST, Philipp Stanner wrote:
> > > > So I suppose we agree that a warning is fine. It won't fire in JQ
> > > > anyways, but might benefit others.
> > >=20
> > > What scenario are you thinking of?
> >=20
> > Drivers doing "rather questionable" things, like we've seen a great
> > many times already ;)
> >=20
> > Note that the dma_fence backend fires a WARN_ON if a fence is freed
> > unsignaled, too, for the same reason.
> >=20
> > Life finds a way.
>=20
> I'd rather you engage with the arguments I made above and give a concrete
> example of how it "might benefit others", instead of resorting to know-it=
-all
> platitudes.

Stating that I cannot know nor conceive all possible patterns and
misbehaviors is quite literally me acknowledging that I do *not* "know
it all".

With this patch I was just trying to accommodate your post-merge
request for replacing pr_ with dev_err() or WARN_ON. If you think
neither is actually necessary, that's also fine by me.


P.
