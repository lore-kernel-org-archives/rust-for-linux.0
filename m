Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690543;
	b=oAwBk+Dve+yROap717mu/U2JSgxBau6x2fo5R+Jjeo9O+gSrFKBt6WxDA1unQej0aMLO
	 AYqM/L7CktF65XfVJtvkfnE/naQ7s2Oe1TaSPCrHIhpy5cOUx2s9dOjjKeovw3hnuJdj1
	 G52qwJigQJUv4fPaWyexc0ujD3XXr+OMSEee4gj+7jisACUbsBHLMqpQJ4P2OetJ9yuUj
	 FDHpwVXukpzsmwGw1fbXObp7H+vGanbjkopCI5f0i2/XlPmfI9gtmLdWBf+P0wF/myWlG
	 qsu1T1Es4KY3SzJxjLw5wRNp0ikLs90MaLhH9IhYfsg/isfoMR6HJYVc+MaTb1sa91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690543;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=YsHtTgA/FoYaWj6mq4OriRvkVFhWU3z2YdcmgFzqS6Q=;
	b=zbwrjW8otA5vWJ+k5yqt3i1e36+l+DhYIrNao2dGrqP8pSxYd418srLdyLGj9UQAF9ZI
	 sVkqBrTElJhD3MV1eW2+zxFC23c/WNJEXYtYPqUYjA06BgCWh8GgIWnFWfhfY9JML8+gd
	 wNqseFaIivsOWv2j+k0VmwZ2cTDcFU2ncLebv60IurSX2MLHehuCZ1FZdxEDS78rH47dD
	 ZN7jYhZhDAW17Ztzx4HTPCtyTAo0DmIBnNX3Jt130uklvMvCfXwEmgSGoakTHq7GBE/aA
	 25AiJY/fTP58m0PpEovqnNNPJYUIZ1VuNUtMK3BrGCl4dgnTR00x7JJLf/e8MYZ1iGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdKWSrI3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C5606A321;
	Thu, 26 Nov 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdKWSrI3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96CE1F000C0;
	Thu, 26 Nov 2026 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795690543;
	bh=YsHtTgA/FoYaWj6mq4OriRvkVFhWU3z2YdcmgFzqS6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fdKWSrI3oGRN3r7q0B+PycE4pIEa1c1egtt2ZnzIEMjI7dFpGStV4GN/B5QLoPODx
	 HGgUXJWHf6RVUxwCVZtNCtqPkm4TT/EoJurByt/qUMjRneGWvV4BsVmU+CLYqScYt3
	 Nrr+XonOg2XyivRoYkjWMyqCOuDz48+1c5H1/qEH5RENLqRiSRZumr5OkDbATtGHuY
	 V80zymXKM4x4iqVeP4vgx+C83CKgm/vHov71J437P1amxk6riaCvcPD9cLLOO0fDGd
	 qgOH01LogwwmoKdmK2OtFZlx5UYxdQ6N6nnVi8VMTlQPa352wTpzyckEU4dZ07K54Z
	 dRaj77nHHJjgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tran Van Tien <7enlab@gmail.com>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, oliver.mangold@pm.me,
 igor.korotin@linux.dev, vireshk@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an
 associated function
In-Reply-To: <1795689815.75b422ec@gmail.com>
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com>
 <1795689815.75b422ec@gmail.com>
Date: Thu, 26 Nov 2026 11:55:34 +0100
Message-ID: <87y0afuajd.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Tran Van Tien <7enlab@gmail.com> writes:

> In-Reply-To: <1795684556.6d661f19@gmail.com>
> References: <1795684556.6d661f19@gmail.com>
>
> Incrementing a reference count must be a deliberate act, and every
> inc_ref must be matched by exactly one dec_ref. Making inc_ref an
> associated function that takes a NonNull<Self> mirrors dec_ref, which
> is already an associated function because the object is freed when the
> count reaches zero.
>
> Having one half of the protocol take a reference and the other half a
> raw pointer makes the pairing harder to review and easier to get wrong.
>
> This was suggested by Benno Lossin.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Tran Van Tien <7enlab@gmail.com>

Please consider rate limiting your resend to at most 1 version every 24
hours.

Please consider using the b4 tool [1].

Best regards,
Andreas Hindborg

[1] https://b4.docs.kernel.org/en/latest/

