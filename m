Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E804442386;
	Tue, 18 Aug 2026 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045842; cv=none; b=lK2yqvBUfkVUYnMMP6X7RzySiUJANvfbIo2Oeru9unSu7jSw+OuBSTMCuK8NHbm6ppF87TmaGn7C6ung0cSqEwhF87UPP5nH5oQkFn3eKjGcPS/70ssLlnXfY1lgeNPKjTvP78BUIbYqs+HQqWIWKky+Hlk12L02VNrYZccoKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045842; c=relaxed/simple;
	bh=4Q3q/7S++MDLMC60+VAbbK+zUtVqwRoSBmUHUAn4pOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uXFKKYBR2kOuLHo0EoKgb4ksUqZ4e9J6pxjfcsKD8ZTY+iEDnr9NWXI+9LziysZ133TGMWHnaI0ms9ys55ryEAQCH9//b0uNN3MfPJb8WvYvhIJGddfjYs6bjMZtN0K6CjtSy1UntZ4+ZfRL1q7hRr3tUWFMOlr2xCq0C62vxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpBmzwpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpBmzwpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08941F000E9;
	Tue, 18 Aug 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045841;
	bh=4Q3q/7S++MDLMC60+VAbbK+zUtVqwRoSBmUHUAn4pOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RpBmzwpmSuj6pKnPT6p4FV8nwnVw+xXgFsO+mW3exF2VDlwiljxdYFysTHY/5Tw6A
	 mKYvWDLkU3MQXtKP6+Jpa1Ig1leWiL030aiHyKNa7Wds+gtFXukKLAJh4DFYAkCvcs
	 L6a2i/5Y2IZ79XikfBoJ4xyYe1m079FPim10yFJcMHAnDVfz7V/Jii4EMdsa1I4t1Z
	 OwUpv3O9JlHiXnFbiv38agUGX1BJkIOgQs9oGOkNQMS7qmOlM+ilpouxCjE7jXrVvj
	 MbRRHuE8J46bkOUmb18ye+KlyJkyXIv4vxvbk7Av/soCskgt8lwHHvmFG4ieuum8/q
	 eiAQTJyZsFU/w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>, Breno
 Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Younes
 Akhouayri <git@younes.io>
Subject: Re: [PATCH] rust: configfs: skip unregister after failed registration
In-Reply-To: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
References: <8L_eiohtkr-KVK8wOx5hbz_bo8XmfV8FHHX0zNjlG9RROwHwX_qm_KwmORgQkKq0k06TyMCArt_3HoW5QoGM4A==@protonmail.internalid>
 <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
Date: Tue, 18 Aug 2026 11:37:03 +0200
Message-ID: <87zeyj93cw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>
writes:

> From: Younes Akhouayri <git@younes.io>
>
> Subsystem::new() calls configfs_register_subsystem() from a fallible
> pin_chain callback. If registration fails, ChainPinInit drops the
> already initialized Subsystem. Its PinnedDrop currently calls
> configfs_unregister_subsystem() unconditionally.
>
> configfs_unregister_subsystem() requires registration to have completed
> and immediately dereferences the subsystem dentry. Registering a
> duplicate subsystem name returns -EEXIST before installing that dentry,
> so the cleanup path dereferences NULL and panics the kernel.
>
> Track successful registration explicitly and only unregister in that
> state. Keep mutex destruction unconditional because it is initialized
> before registration.
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
> Signed-off-by: Younes Akhouayri <git@younes.io>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Looks good to me, will pick it in a few weeks.

Best regards,
Andreas Hindborg


