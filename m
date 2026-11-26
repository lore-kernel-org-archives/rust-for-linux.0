Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693316;
	b=uDFXSayRIA2J6DQL3mUJAwRscc9HOdnROzTWC7p/sKvnPgBN/EvIgLzYDme0f9glKad3
	 h52BX3PZnLwkd21KEqn+LcSObEsOBT/01X/w+EDmh6Wgu+MuHrhLOGQVLue8DUdETMuCf
	 eS1VjRWEq3GmyMRTyJLeCbeHcd9VUcPdcfU5cwGDELY/YiLRfMzNAoqMztCJ1KDH4Fb1Z
	 o/fKnXBTnFDmR+67iPpQg77fSY90Ik6kBEghvFLuWzaaUZ861YFMH2eqQRtalWxXsIciP
	 1XlanRjOtIjCvrud2gLn0kE8a40UhXBQYmtDby4/CwE5jXfvBL6b0sTzufrZzxjQZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693316;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=uE98kEPGNlzmvdWON0vWwzGlXWIeDH4wPeHHoPm0CIw=;
	b=NOZvItiXKQ3GN6lbrjzsW5VQY307o6sTz3QbcrzaH+QgZn2LEd1Y8MCtgqoYRnNPPk6n
	 7qfs/E/9I9sNCgvP03mf9F/q8xMVKksefghvBYEIYW+l5gLbd3f1wTVkXARlo1Z+IRmAn
	 f1AxtfWIC5ujW7H758gMllv3fSVjJNS3Pt6DgFpCS9xBcRi/f9FX4GKoTHo1Y9WmH1NLb
	 GSzP0wUPHHxlT0hAS8TE1eNPR9Gwo234r7+0hJNZyRHiXVCth7PvZqJ7WPIvKutZbkp/p
	 dgrV1Ke2gy7IiqEEbIO4p99QOw7hZwPZ5iGouqZwV+VeHFWP/J5HPNWSRURZRGsJyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P23BxASq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F1F606A31C;
	Thu, 26 Nov 2026 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P23BxASq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7B91F000C6;
	Thu, 26 Nov 2026 11:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693315;
	bh=uE98kEPGNlzmvdWON0vWwzGlXWIeDH4wPeHHoPm0CIw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=P23BxASqcKYz5WSnU/9SYEpl9vvwTb5U9dKXh0LHBbkOnkUnzEocuA2bnmDsBCcRP
	 rk/PBL5tg1hBz8ZSz3gXcIChGageDvuaPS9y+QAJcd2Vbe0WVP61tnXHYCV2bpGcmq
	 zRh6dW/PSV41j0WlZnZgO1s90jERP6zyjzvf5clRcFyM95OtT4GiiqR3vxK33ChLTf
	 px0jSlqpcUsgM6jLVNepzy4mXpA+Sido78k4ZF9wuzuePBzf5Yq6VhOVhoVAkuihyx
	 8Qq5fRY01OPWTKet++VwkIVzG3NVxYLCfBFnpGh0sRt9iQDOWo0SZmmjQ5vrEM+Upx
	 oTXW/k5ii/Srw==
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
Date: Thu, 26 Nov 2026 12:41:49 +0100
Message-Id: <DN545I66CKO1.2YKP99UIQQR43@kernel.org>
Subject: Re: [PATCH v7 2/3] drm/tyr: add TyrIrq threaded IRQ wrapper
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
 <20260728-tyr-irq-v2-v7-2-4e172e58e28c@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v7-2-4e172e58e28c@collabora.com>

On Mon Nov 23, 2026 at 3:58 PM CET, Laura Nao wrote:
> +impl<'a, T: TyrIrqTrait> TyrIrqRegistration<'a, T> {
> +    /// Requests a threaded IRQ registration for `irq`, using `name` to =
look up the interrupt.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must not `mem::forget()` the resulting registration or o=
therwise prevent its
> +    /// [`Drop`] implementation from running.
> +    pub(crate) unsafe fn request(
> +        pdev: &'a platform::Device<Bound>,
> +        name: &'static CStr,
> +        irq: T,
> +        hw: Arc<HwGate<'a>>,
> +    ) -> Result<Pin<KBox<Self>>>

Why does this not return a pin initializer itself?

I don't think this has a user in this series (except job_irq_init(), which
itself seems unused), but I expect this to be stored in some other containe=
r
that is pinned anyway.

(Note that in C we'd also not need a separate allocation and just embed it =
in
its corresponding container.)

> +    where
> +        T: 'a,
> +    {
> +        // SAFETY: The caller guarantees the resulting registration will=
 not be leaked.
> +        let registration =3D unsafe { TyrIrq::request(pdev, name, irq, h=
w) }?;
> +
> +        KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                registration <- registration,
> +            }),
> +            GFP_KERNEL,
> +        )
> +    }
> +}
