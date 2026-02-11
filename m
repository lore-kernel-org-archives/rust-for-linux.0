Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B194A32;
	Wed, 11 Feb 2026 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823231; cv=none; b=eh8mb+RbsEesaayFFSGN7VXK0QkuunjQKjbPUwEeMQA7QiDEs9GA6Tnrp6We3pZL1fmQJ0YPir0qYORKZOkFS9an9aDMhbkVHTqGX4o+J4qlgKulLjSmG+cfCb7D7emxSzYu6FdcQb0PFBGmYiqjIgPwBfUkf+EyDBXNEHb3FZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823231; c=relaxed/simple;
	bh=zTgGY5t1tiQEA3xRP/E1qDqaOY/RX6s7WBtA9FHnE8Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMfC4w/hunEzumOMUSjlBICzJa0lI1StZlTW30/P8K15/eknXDNA+hg3KuJinEY91ry2T3qSdtm08/LdXhtPbH/Xj9ZUq2k0x3U2yQIaUKw6NCvmPYIEBp6uAMqCxq0m9krieTEXAGHdgBa7beq7MjtpfcoYx9KL2pmtt55ZEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xTgqHzd8; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xTgqHzd8"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fB2Dh5Zxpz9tWy;
	Wed, 11 Feb 2026 16:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770823220; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTgGY5t1tiQEA3xRP/E1qDqaOY/RX6s7WBtA9FHnE8Q=;
	b=xTgqHzd86l1fBq/XvQwSfMQlEy9l0E9lu+hFuJ0jbjZBNiC2NI6rjUvJJg1nNQCULxkTuP
	KpUroTCYkS4Cw1iZvayvqar2v4Xn/nMNnd7NIn2JUm+0dV5inkAUoqKqidvTRX9QkceKGc
	cZ/W3EEg4gHZ7pttpyrj2YdxQDRyOCXRdKZivZ4xb0EuBKjZXQx2ph9Bp8N0nwJYrRsP9O
	bfforcbFFNVZbNbx+bQhu6ivoq/QpguKy1Ch6Sy7++j9arxi+nl9Qae08LYKHryEdM23p/
	l+t2RKEfpA9QsFkEky8JZRBBz7ewEW3ZNMmtlXePusKgK6Ov9waO1szXrM2mxA==
Message-ID: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Boris Brezillon
	 <boris.brezillon@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, phasta@kernel.org, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 16:20:15 +0100
In-Reply-To: <aYydpYzd4AzFoAvZ@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
	 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	 <20260211120742.0e9e7122@fedora>
	 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
	 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
	 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: hewsc3qaktj8f5da83wnbcajyab1kp5d
X-MBO-RS-ID: e7f4940d33158900651

On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> >=20
> > Back to this particular job dependencies use case: we have to embed the
> > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > because DmaFences can be inserted in multiple of those lists in
> > parallel.
>=20
> Okay, if that's the case, then the linked list is *really* not the right
> tool for the job.

We have to distinguish what we are talking about here.

For the JobQueue, it takes over a cloned DmaFence and stuffs that into
its own list. Problem solved.

Whether the driver has other clones of that fence in other list is not
relevant because it's not the same list head.

JQ's lists and list heads are internal.

I don't see a problem.

P.
