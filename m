Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F043A9014;
	Tue, 28 Jul 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267118; cv=none; b=czmrxCP38ZDN2n0yzTntknM/qrYlmeD+OHLrjJgL/KCxtgMNhyFhN3ZInnx+rfFSXHEvsg1MAdMJY9xslTarvQq6zUlHWgFOQSYI8ut5pdVsvEjeoK+7cveG5A2LEbB8p5uxD02Mg+T7MCqfHSXY6bP/RMs8r+HIAy+c/VtJWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267118; c=relaxed/simple;
	bh=VnqsnzrvPasJzAwOkW0zaf9pExQA9c/tViBkR4bf310=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=mZUJdusyVzecRtYrg5prlmi4ZSJ1CjHc/HU0H72EtOw2dJmQ7Aujrm8KnXMkX0sp9BMpfm+PGT6WkQ/QCzUf2GxIlsHzF+14EsBDpHjhw+lC9zIiBcUn0WW04GJrezleDbcyJainZNmcgJV9fDVyHV9vOp8BG6kVydVivxHl8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOH59auN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOH59auN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C894E1F000E9;
	Tue, 28 Jul 2026 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785267116;
	bh=eTizqzQ+hVIezvWHkd+A28hpM6dneaU75ikX2ECeUwo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=iOH59auNLajYqQo3htj9g0bxWv/U8IUNadqAcKGU7jBplYIH/9o2/fNbpdHcmMzz2
	 0t/EUQxwnvXY/NVIeeZZN5BBwo10NG1byrDccokQPQjMaEPBWIH1G9y2/RtS4kF2ss
	 Ns8+bFOpT0zlw9DxNnqPRJVrBbiwk6KuLR14oU7DeopiFvOv7OTphNgHObKhI5rcyk
	 wNVMYmKYj9hNyDa2dA087IAhtFtrc99zGuOYVdKkURycaym1ne4tH+gmCF/mTCOUc4
	 OXH+jBOdzlhBlP34Fv8X6+Z/djmb/g1I5FLhd/wlgzXZQirLSW3Vp6pk93NnkYCF0P
	 WokwqBsJVuWDg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 21:31:50 +0200
Message-Id: <DKAGDGAGBRXN.T20HFE198R5A@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 3/7] drm/tyr: add Memory Management Unit (MMU)
 support
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <laura.nao@collabora.com>, <samitolvanen@google.com>, <lyude@redhat.com>,
 <beata.michalska@arm.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <alvin.sun@linux.dev>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
References: <20260728-fw-boot-b4-v10-0-9187aefa3f2f@collabora.com>
 <20260728-fw-boot-b4-v10-3-9187aefa3f2f@collabora.com>
In-Reply-To: <20260728-fw-boot-b4-v10-3-9187aefa3f2f@collabora.com>

On Tue Jul 28, 2026 at 8:39 PM CEST, Deborah Brouwer wrote:
> +/// Locked wrapper for carrying out virtual memory (VM) operations on th=
e MMU.
> +#[pin_data]
> +pub(crate) struct Mmu<'drm> {

This shouldn't be 'drm, but 'mmu or just something generic like 'a.

The rationale is that Mmu might be shorter lived than 'drm once we have
self-referencial pin-init. Currently it is straight forward, such as in

	struct Foo<'foo> {
	    dev: &'foo platform::Device<Bound>,
	}
=09
	struct Data<'bound> {
	    foo: Foo<'bound>,
	}

where the lifetime of `dev` really ties back to 'bound. However, with
self-referencial pin-init it could looks like this:

	struct Foo<'foo> {
	    dev: &'foo platform::Device<Bound>,
	    io: &'foo IoMem<'foo>,
	}
=09
	struct Data<'bound> {
	    foo: Foo<'io>,
	    io: IoMem<'bound>,
	}

Now Foo is not constrained to 'bound anymore, as this would be longer lived=
 than
`io`, so it has to capture 'io instead in order to still compile.
