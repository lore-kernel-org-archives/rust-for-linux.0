Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E42D7DF2;
	Fri, 28 Nov 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328145; cv=none; b=p5+iUmLu83Gx9xym3odKyMAH4LNZIK9U2+crspf5l6JCN6Ow9zXFDXOmnbj5eMiCnMn2ojDsUO94UWfp4iFLuqAdeONpJd3rWMYCmu0XzpviR6yZmIvPwC/ws+/lIB8cAfS4PXNqw3c09XrtW/V3xTxuySlNMGLcg6IjYV+5vqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328145; c=relaxed/simple;
	bh=ys/mzeQ72BAidd8ofBgTortbdFO8O++FTz3WuToRKsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKVVIxscufD17zgyrAueGGw3RdE8lZDgmNhhqhCNMqwHj/WEs3TRPkl/9WQG2zxpZE8ngHGAA43rCLeKYXRcOrCY8Y+yMO/nLPBiSIgKP3ZKkzNKofVJSeBcnUhX3tfzS2Yf3PFqqpyBhfIhu7NnNg8V2X6VaFbWDWFANfmnCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dYrXWClQ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dYrXWClQ"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHrCH4vkqz9v76;
	Fri, 28 Nov 2025 12:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764328139; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ys/mzeQ72BAidd8ofBgTortbdFO8O++FTz3WuToRKsI=;
	b=dYrXWClQWCszfsPETC/uNyDRFq7PPGqCgeYPxPdUxjlp+p7qmLkGBfZ0y8SX5JY8GZKjzY
	PbE/1h0RSJQOpxgZrw4Z+6FaZs4VxhZa4utSAKBMeX1MzLzB8EE0ufiozQ7uA+gPKux8ki
	jg315gmGBnBpih/OOc3WpVUaNBPWvXR7UKArDLFmx6xJ2jpSbwdEUBs2N+Aqqe4imVauPo
	iiz/XVy7ysYDYg+EYbByuK+n3m6DGc7mCl/ANPoBaw8VQQQg9iIW2no3yohyMDaaka3aCC
	+TFvOlsf9hpLLJJnjZWO3/7DZSxNiKIoufc0Nzn8xJrJdpE/vMm/EgP3/TyOWg==
Message-ID: <19e9f6fb270b28b06bfeddf274ad3bcacdc22e0d.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Daniel Almeida <daniel.almeida@collabora.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  Alexandre Courbot
 <acourbot@nvidia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter
 Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Fri, 28 Nov 2025 12:08:52 +0100
In-Reply-To: <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
	 <20251118132520.266179-4-phasta@kernel.org>
	 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b9f7089024bd5464044
X-MBO-RS-META: i1op6hier8n4hhsr4e8ftbye8zp4xg19

On Mon, 2025-11-24 at 09:49 -0300, Daniel Almeida wrote:
> Hi Phillipp,
>=20
> > On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
> >=20
> > dma_fence is a synchronization mechanism which is needed by virtually
> > all GPU drivers.
> >=20

[=E2=80=A6]

> > +#[pin_data]
> > +pub struct DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > +=C2=A0=C2=A0=C2=A0 /// User data.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 data: T,
>=20
> Same here: we should probably deref to this type.

Oh, wait.

There's another problem:

done_fences are created by JQ and returned to the driver. The JQ
doesn't need to stuff any data into those fences (it just wants to
signal them, and register events on done_fences coming from other JQs).

So I was about to investigate how we could have a DmaFence<()> to make
the data optional (see the following patch, there I still use an i32 as
dummy data).

Is that compatible with Deref?
Ideas?


P.
