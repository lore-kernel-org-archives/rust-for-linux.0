Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00D2EF64D;
	Wed, 11 Feb 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770825259; cv=none; b=MCGsCn30aS5sGPuVAwj26yGVxH/dFfmHdAVfS3kDHjL71VRr3cxzHBe5OAb3WL7xsMP4N468Epr4JGsyGQJHhhUyb3uqXSzJJ1a0MiZNQeOEpVflJ4KK13FiZMcHSlj7P9ZuJI1scyHmczNfI9QRVHfBnnFZw38DloiQMLPJGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770825259; c=relaxed/simple;
	bh=XJIA8EDuYw4A7eKIj4JUJHIaDE0zJ4PIbTD3LegeG3c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IBzMqh2fr8P1KT2X5N40yHMWH7JcogqodCyP0dM2AW2kTMaeTCudflBgNRIzCfCk8e3UGTwRWSkTz0uC5Yh6sV1h79KBxPOUdVwQArvIydbpqm2nD1pNUCOGLO6qmYY/sj5eHzxzc6f6wGU8qK7WQfVX3P1vb2n6EqEIf/ITxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSYf7r3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSYf7r3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9AEC4CEF7;
	Wed, 11 Feb 2026 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770825258;
	bh=XJIA8EDuYw4A7eKIj4JUJHIaDE0zJ4PIbTD3LegeG3c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=bSYf7r3uFh8NBEonzIuBMWBoBL2QNzzVHAJLQw5gripUbEaTbSmiN6aQgjGI2Z46i
	 pwTZ7UuS8jSCoQroik4oWWlY479jnDilqVDx++npn5j4Lc9vGV+YNziPTxmvLAY6AY
	 6PmoSiyN/8D1d0QjZt5GANSnIgC3p8NQU8kCLY19stHIYswYUr1nS6I6pwigs8MYIg
	 5+MahKe6a8s5O8NcS6w1SRa2zNe/eHFjc2PZ7At81OGpodImpqpJkAzsj3F4GqRfxR
	 U0HckYkfAI+N4K//v8g8iNLLkqAZFDWvGkqsM3IOtQSC3z3PK4Fsr0zAz288YoQ1qu
	 tE/Ts3m30/lvg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 16:54:14 +0100
Message-Id: <DGC95VFNOLZI.ZGK7O5OIZVR@kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Cc: <phasta@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Gary Guo" <gary@garyguo.net>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Benno Lossin" <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
 <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>

On Wed Feb 11, 2026 at 4:20 PM CET, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
>> On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
>> >=20
>> > Back to this particular job dependencies use case: we have to embed th=
e
>> > DmaFence pointer in some wrapper with the ListLinks element anyway,
>> > because DmaFences can be inserted in multiple of those lists in
>> > parallel.
>>=20
>> Okay, if that's the case, then the linked list is *really* not the right
>> tool for the job.
>
> We have to distinguish what we are talking about here.
>
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.

You mean it wraps the ARef<DmaFence> into a struct Dependency which has its=
 own
ListLinks.

But this requires an additional allocation for every dependency, whereas wi=
th
xarray you can just store the pointer directly in the xarray with
ARef::into_raw().

I.e. it scales much better than lists for this use-case.
