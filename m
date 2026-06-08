Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC793AF66E;
	Mon,  8 Jun 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907132; cv=none; b=EAEuhk3QpkHlqNLhYFd0u4eK4Tmt9Mjs1RjmcFUj3m4Ov3H5vVycoPr1+HiPAt9kSeOdGPGNTVcjdyk0HRTAg+tVNwzOlEFAOi943qd0WnZ1QYxjg/Z0IuEWNb3mGLyryCulsUy02ZQOJ89JQdlJ+wE/2tMtvGuqX9vdLrDUBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907132; c=relaxed/simple;
	bh=9GqkPtgmaHIXiNbH72NDrJ7xE2UGBCO1XZZMtfkvqEA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=FzboGAOrXghaHVqdRSaC/s9VZKhAjSp5OfDgafQWMfO+3gpnGeDRvUnsZhHZ1Ux+cshBBMdbwVmzSNSBpVKNvSWLb7vwYDwh16B0+ZZKGPOSvnKQWWtWn0bT8t4yqto3RKSPs1C87wTjCdHl9WbYq/baaXSEP1Ye+eaWjtFYEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tyxxL9Ne; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tyxxL9Ne"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gYlTs1g4jz9tbv;
	Mon,  8 Jun 2026 10:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780907121; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=wWWbDps4E0BHhbXw4u8IoB1FhuOq6Pv1+zrffQTxGa4=;
	b=tyxxL9NeT1vvovhGenIBlgaYDQWlzNUd04FlCp2mI4jeBmhAEiDM5L1bCeAy7UT31MDIjr
	tHljJ2Cwsb2Mk/iNUg+E1uIWT5lxmKoCGgpu3smkpnISR72E5fEkMAn06ajWVquFg1hZtZ
	T3OcekwVIVar31L+hvIUkzPwdlmbVvNrCpLfzYtRqd4AsvIzw0Rt+b//zDHXsIo+ePIbGa
	DcANXX8tZjbDz6XURNJRKOGAMsX8gleMkwqfk9leH7qGiWIRKttYqCrbP6PLaebDeLzaPF
	ffo1Ug/d3wozqSnZgIvbY5P2plCmeVHDfPG2NzV7vX5PVuBddJFVFaiNHno9nQ==
Message-ID: <09832bfe83bce37cdaadc11ea009e3dfc1597ddb.camel@mailbox.org>
Subject: Rust Discussion: What to do about payload data's drop() vs atomic
 context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@redhat.com>, Gary Guo <gary@garyguo.net>, Boris
 Brezillon <boris.brezillon@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl	 <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Miguel Ojeda	 <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, manos@pitsidianak.is, Lyude Paul
 <lyude@redhat.com>, 	lossin@kernel.org, gnurou@gnurou.org,
 airlied@kernel.org
Cc: r4l <rust-for-linux@vger.kernel.org>, linux-kernel@vger.kernel.org
Date: Mon, 08 Jun 2026 10:25:13 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e4e08b718f2710bf78e
X-MBO-RS-META: uyipcwk9zrtk7u3nzwsy7eoat7y6tjuu

Yo folks,

we (DRM crowd) are currently in the process of upstreaming DmaFences,
data structures for communication between GPU / driver and userspace.
They are inherently difficult to get right. Our discussions [1] have
now repeatedly circled around a supposedly extremely difficult problem:

struct Foo<T> {
data: T, // `T` defined & passed by API user
}


Sometimes we, the API backend, will drop Foo in atomic context. Should
T have a drop implementation, and should that implementation do
something illegal in atomic context, we might deadlock.

It gets further complicated by the fact that T might often be
refcounted, and illegal actions might only take place sometimes, when
the refcount finally hits 0.

Since T is defined by the user / driver, it can become arbitrarily
complex and might include all sorts of other Rust data types, each with
their own Drop implementation.

So to get this deadlock-safe you'd need to audit all inherited data
types' drop implementations.

Suggested solutions for this problem that I've heard are:

   1. Demand in your API that T implements an unsafe trait, for which
      you document what the rules are (no sleeping etc.).
   2. Demand that T does not implement Drop.
   3. Only allow a T that gets dropped in a deferred way outside of
      atomic context.
   4. Try to ensure that Foo<T> never drops in atomic context (not
      really fully achievable, because the user can always pass
      Option<T>, and take the value in the mut borrow our API needs to
      implement to give (temporary) access to T back to the user in a
      callback.
   5. In your API, implement the most common use-cases (like kicking
      off a work item) in a way that passed data does not need to drop
      from atomic context.

IIRC Gary has it on his radar to get klint to check everything within T
for invalid drop operations? Is that doable any time soon? Would that
be 100% bullet-proof or would it work like "best effort"?

The C side seems to address those problems with might_sleep() et al.,
only detecting problems at runtime.

I'm opening this thread because I suspect that "drop() must not
sleep()" is a very common problem in Kernel Rust and I'd like to hear
how other people have solved the problem.

If we'd agree that demanding an unsafe-trait for T for such APIs is the
strategy with the lowest cost-benefit ratio, I suspect that it would
make sense to define such a trait kernel-wide.

Please share all your thoughts.

For DmaFence, we now need to decide how to deal with the user data,
i.e. which strategy to implement before we land it upstream.

I'm bringing this up because we really want to get DmaFence right.


Greetings
Philipp


[1] https://lore.kernel.org/all/20260530143541.229628-2-phasta@kernel.org/
