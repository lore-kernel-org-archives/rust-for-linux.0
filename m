Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C03F44FB;
	Fri, 25 Sep 2026 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356922; cv=none; b=QgfBsG3t4N7Szd6yVPfF5SJUqN6MiyeFyyRm96VVCtvxxRtOvupg5FFPBU5V7vYcVijgpNMo3mVxGPbR0i/XEJ/D+95hMuPrtW8snJTBniEy8S+ArJJjxbBTn9g8oHI0hpbsTJ0DCmiWf9wfw+ME5hQsq6WL0SUVeFuCYiYoIdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356922; c=relaxed/simple;
	bh=xb1vQYsbfVcJiuLlcnMnP0BgQS87PDLHTwEVGJsEmis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcDjjnxrqBF+dp/b4Q2gj8H3kZK4adrWf/vG+Xh/kIomTjrlcSEmtboAte6FhSJxUlh/6e6CRg7lS6cto7uK9S4DMdeDSm08ORng6Fh0ITNZwmJRo+RjV8r7OLEPwgdGiCnY6IU6ijm/DQad1Rg1rmYHd5FxWmmrhD+DSQEqAvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XUKSdv7w; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XUKSdv7w"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hryDc0jLZzMl31;
	Fri, 25 Sep 2026 19:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790356912; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xb1vQYsbfVcJiuLlcnMnP0BgQS87PDLHTwEVGJsEmis=;
	b=XUKSdv7wDvfAMRjCSmpiqwAoJpEn6K4Dph8KYF7GVQGhaAXkq4s2bmVBZ9KF/wy2e1uOK7
	FQradnqGjjyEtknwtYEc/OmPqkGi9HvX8gHZOfmnCmba6aa+ar1TlyRS0ppia+T+YNtWld
	NwN5H8J2/UdFAnGHJ+9tapQZZ1U1dT2MAVC8+3M8EJXRkJjT6l8YT0KsL/CR1y5WBdxvI+
	usxUVdyi9DFK2gTCF0SdDZSWWIRsDA472CmRIqcmVm1wNVBEu20z3fSjIfWQjiqRcijDlQ
	H6LhIx1qjmPVqxz9uyhMEENr8Nvw0HcZSPyjRGLAyH5V2EgBwHyK1YHnp8E0Ww==
Message-ID: <ab1241777ac432666bb1564d875211bf142a6398.camel@mailbox.org>
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
Date: Fri, 25 Sep 2026 19:21:45 +0200
In-Reply-To: <DLOILT0V4HCX.31L2PE7YIAKY3@kernel.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
	 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
	 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
	 <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
	 <DLOILT0V4HCX.31L2PE7YIAKY3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: ee29a2c5e2aeb6681a5
X-MBO-RS-META: yqp1koqfqjg36e8eizcijcdqkxoh8iyw

On Fri, 2026-09-25 at 17:50 +0200, Danilo Krummrich wrote:
> On Fri Sep 25, 2026 at 3:08 PM CEST, Philipp Stanner wrote:
> > The driver can avoid dropping half-forgotten stuff by calling
> > jobqueue.complete_all_jobs(ECANCELED) immediately before dropping,
> > which allows us for having the warning without false-positives.
>=20
> This would just move it up a layer from inventing a new type around Drive=
rFence
> to invent a new type around Jobqueue which does that instead.
>=20
> But the Jobqueue won't have any procedural teardown, it has to teardown s=
tuff in
> drop() anyway, which includes dropping jobs already.
>=20
> What I'm saying is that there's not much value in DriverFence::drop() hav=
ing
> this warning in the first place, which then either the driver or the jobq=
ueue
> has to work around on teardown.

I guess we agree that it would be a horrible bug if there's still a
command buffer running on the GPU that can access memory which might
have been freed once the associated fence signaled.

So I suppose what you are saying is more: there is not much value in
the case of *JobQueue*, basically because all the jobs live inside of
it anyways.

So I suppose we agree that a warning is fine. It won't fire in JQ
anyways, but might benefit others.


P.
