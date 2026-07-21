Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253746AA6D;
	Tue, 21 Jul 2026 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647945; cv=none; b=TRG2B4NcUgKZobq0JPMmMjfFaujIXmfgOiq9b8PLyDN1bzVE2gyj9K/eu+6fxFAzougXtgZSqqBXQdIV8Q+k1/2BCtj0xEz5pC90bZuSuPITm7+mlZLPs1dCouc6StgVtmfqi6o0pKV1ZEcFJCsoUiJyZ69rAgTKXA1D69blRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647945; c=relaxed/simple;
	bh=YmeKO/rqCgaum2nCNEFLOEjx/qFEgr9O093ZlpM1v5o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=NQC0WYz2znx39aoG2X1kBkR5v/34WKCSZpuWio/AL9tL/m4sY3vcffRPPJ9OQnZd83ydPLz884jkITEnM0K9wmAMaSs+3KJb8uPWZ3pzWi77A3IW+Ccw/aws4QoxImpjpfQinsx95GPmvpl2WY1VcSrhTqvqK2Nlp/2bSFeaCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foDFq9gv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foDFq9gv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27EE1F000E9;
	Tue, 21 Jul 2026 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784647943;
	bh=q5/zi7cNrAXqMYuiX3MH0iTCnpKZXOPQtuIcMMtp6BM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=foDFq9gvx5k/WUNMRwO6oPryQ99mNdJsoBTaxbg2iTH4UNN8w78Ug1kjn6bMaK9yX
	 ZT0/LujqZx6Fk9YQvP8+vQy3EHkKkpKnkNYE+iyrX9pNTJEHndC/GptWbUQWyk29jl
	 hwdzsyFlbSjKwObSPqXOJjNuIxWIEZm/tRuq9SpXV4ctJJe3rdvZH14glAXRc0cAEt
	 H/pUR5oALHPviHwJ1FZmSo4FloHBxeefDtHq8/fVVH+G7LkOU45d+SptMbyeA9Bozt
	 PsgPuSQcNTngIoCw9UvTij+E5iHQ+/mhD3MRKVQEgp9ci44gygq7EcFwzE1U3IEec6
	 IhUuvsOpwv19g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 17:32:18 +0200
Message-Id: <DK4CW8JXVL8M.2KKRMJVCD9AYO@kernel.org>
To: "Laura Nao" <laura.nao@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] drm/tyr: add Wait type for GPU events
Cc: <daniel.almeida@collabora.com>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <deborah.brouwer@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <kernel@collabora.com>, "Beata Michalska" <beata.michalska@arm.com>
References: <20260721151423.444175-1-laura.nao@collabora.com>
 <20260721151423.444175-2-laura.nao@collabora.com>
In-Reply-To: <20260721151423.444175-2-laura.nao@collabora.com>

On Tue Jul 21, 2026 at 5:14 PM CEST, Laura Nao wrote:
> +/// A convenience type to wait for GPU events.
> +///
> +/// Wraps a [`CondVar`] and [`Mutex`] pair. The mutex synchronizes predi=
cate checks
> +/// with wait/wake operations; the condvar provides the sleep/wake mecha=
nism.
> +#[pin_data]
> +pub(crate) struct Wait {
> +    /// The actual wait/signal mechanism.
> +    #[pin]
> +    cond: CondVar,
> +    /// Synchronizes waiters with notifications.
> +    #[pin]
> +    lock: Mutex<()>,
> +}

This is backwards; if I get this right at a quick glance it is basically ab=
using
CondVar to implement a WaitQueue abstraction in your driver.

What you actually seem to look for is a proper WaitQueue abstraction, which
could then also be used to simplify the implementation of CondVar.

I'm already working on a WaitQueue abstraction, since I need it elsewhere. =
I can
probably post something in a few days.

(I didn't check your use-case but you may want to consider completions and
simple waitqueue as well.)
