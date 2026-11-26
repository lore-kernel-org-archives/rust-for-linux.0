Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693538;
	b=DLJLEcVKxZfOOFJqCmF/cQ401f4ChXyMIHx6F9KZAfhENu29Rku1ESywM1mveWxs4PGj
	 IG+ZHx1KLS+hK686nS5cDyQ4aex7tkXrqKMx1jtkGKR3O8dwL1JKKhl9h1Ru8cqoewYmp
	 Jl4hp/9+9RlwrSkkEqr6HzJRd7KPg1qAI+PbU1gFvalxZbHIMSYwWuGlhPh0zTb2eD4N4
	 gL/T/c2cKLoB2Ka1Jyrddekg6pMcg4vj3qeIz5mVI6UfTEktlwKLxveUkd4i4LVmzhR8Z
	 Hei9P7PFXDNKwyxxlpoE+5Am9G66I0OWlcV02i3X+3wBp9zqTelMletS5lESqVd0Ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693538;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=bhvFwtF3U6kOOLH4HNUlH3bobwyUeQvz0yMfUYKwy/0=;
	b=ULRZxVhvEUv1I2afOcCs92vEAXTO0nVFF0NPruLYd+LnpjPRsW2Xl0GG7wezHFxv6k7W
	 DnE3nDByCLOttXyvNohGgb0bnuSpKCW+NqxF/yw0dTIQUJf/tWdo7Z6WwXWcCtTB0lLFf
	 kZjD57e7ooCLazuAwps9rNfntODWxfLCa5G4e837X+NvKfikwzRM6q8dvkxZk3Lqz7N+6
	 afLhFl7WQksAydBmUEvow+G4X7Y3OM2W3c4VNWPLHzDBK90Odv9O//xXeB8/+PIW+6K/M
	 ksZl97JWBM9Qnt4qpYtlj6jUMT021jGXAPJauFUHyimy1zKSIvLx4s218PjoQbq+Lsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo+kh0V2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C037606A31E;
	Thu, 26 Nov 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo+kh0V2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601801F000F0;
	Thu, 26 Nov 2026 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693538;
	bh=bhvFwtF3U6kOOLH4HNUlH3bobwyUeQvz0yMfUYKwy/0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Xo+kh0V284JacJ6eZoC4IYjN+CakyB8Z5Klvt2Vni7FbVu1WTGPD5SBshDMR1j0Kc
	 fiQVRZxlshn6MDqSO7bhcYJ+EXmfMnBdNYJ6a4ROkGrKJ0RH03LLbdGVpzYjlQYss1
	 Y2XQD9JUhk3Y4B/y/2fiiugCt+nh6pSeDGVv7wzkiqZhwWMkE7ry5ECI8E4ghO8Fxf
	 9g/fqymyOM/EyPLdYPI3U4M859AoO2J7haFUYHF7kyW/qqAeGn3HtDkJCz7GDWoRS9
	 s3wgwD045CXRwFDLs4xDX8YxmPd08GANuWJO5IkBQNmcgY0rDXrQmqECgpUO/uApmJ
	 pVyzFu+NUe9Kw==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 12:45:33 +0100
Message-Id: <DN548CRVXMGK.BOPO5J56Y1OH@kernel.org>
Subject: Re: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <kernel@collabora.com>, "Deborah Brouwer" <deborah.brouwer@collabora.com>
To: "Laura Nao" <laura.nao@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260728-tyr-irq-v2-v7-0-4e172e58e28c@collabora.com>
 <20260728-tyr-irq-v2-v7-3-4e172e58e28c@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v7-3-4e172e58e28c@collabora.com>

On Mon Nov 23, 2026 at 3:58 PM CET, Laura Nao wrote:
> +/// Requests a threaded IRQ registration for the Job IRQ.
> +///
> +/// # Safety
> +///
> +/// Callers must not `mem::forget()` the resulting registration or other=
wise prevent its
> +/// [`Drop`] implementation from running.
> +pub(crate) unsafe fn job_irq_init<'a>(
> +    pdev: &'a platform::Device<Bound>,
> +    hw: Arc<HwGate<'a>>,
> +    events: Arc<JobIrqEvents>,
> +) -> Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>> {
> +    let job_irq =3D JobIrq { events };
> +    // Ensure interrupt sources are disabled until the handler is regist=
ered.
> +    job_irq.clear_mask(hw.access().iomem());
> +
> +    // SAFETY: The caller guarantees the resulting registration will not=
 be leaked.
> +    unsafe { TyrIrqRegistration::request(pdev, c"job", job_irq, hw) }
> +}

You could implement a constructor in an impl TyrIrqRegistration<'a, JobIrq>
block instead, which is think is cleaner than a free standing function.
