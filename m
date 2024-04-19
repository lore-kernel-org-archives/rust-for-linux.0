Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4444130E52
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713544920; cv=none; b=OX/shl07eGs16u9vu/++7CCeFhgmNU4vfgebg4l8JgvtlmGugksaSFiQFtinDWGTEzrEkN4tiH72m2WzkFJk+f1yihIQ2oMiAdBOxyYD86PKEWybres+IB7t63abevrN9c/pw2nfpc3RSHDWiCBnp5NcdpPirOOBmB7kqF/W0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713544920; c=relaxed/simple;
	bh=66oNypWnc/nFN+oSjVpFxbC9CgK01MHx7gr5BjJiCls=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWTbu0MsSJkVA0cUukXq61+YvpbujhI8SrAdG1e0GftvAtobTs3CCV9WNRA8inKv0o0XtTNShlgvPeYTlTTy3QacOHfy8pOi/YDeNH29Dy0mH4MQg9At9vBEDNMpOyYymE2g05edNEwqWrNJmWw+tPQhlT0kg203jPqxrLFDuzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VIJ27gzW; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VIJ27gzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=m5kduiwg2bcftluylhuevivx6e.protonmail; t=1713544909; x=1713804109;
	bh=1FTzMGVQnaW0CacfAE5xKXjoTsam507oqQnRq0ubwDk=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VIJ27gzWe2xgvPxIwaK5LfCMoF6hQzwHe10PPh/ImvOVGYJvCpLCwgDRzZyth/gh1
	 MqvPACqRJb/BrXoFobTTpQSqwjuEs3xQz3Dag/wlnyatYGFkYlblbkQmkZMNIfgltm
	 OUN5b4SKEXv8lRCghOFCl91+i8ZwjAIqKmYoqploYKbIwvFaC6vCUEdWhwSpF4Bn2U
	 B9OuQ2sZ9+DQakfzIO+AMsBg59y0ixMp8GKdsmnOHBYWceKGxcYZ4w2rI+j1yEzxLX
	 e2Bhdx63cDc7v5iXIKAEHE4dwWYxgX33+FdWX3ZD0OErW4PKzUsyQZKUXV8VhciNeS
	 VwMFgNCHDsFGA==
Date: Fri, 19 Apr 2024 16:41:36 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
Message-ID: <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me>
In-Reply-To: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>
References: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8402659e82807ad478d6bfcdb9aac38066c6bc4b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.04.24 15:53, FUJITA Tomonori wrote:
> Hi,
>=20
> This patch is necessary for a new QT2025 PHY driver in Rust:
>=20
> https://lwn.net/Articles/969888/
>=20
> Are there places to be fixed or imporved before sending this in the v2
> of the PHY driver patchset?

Please also update the documentation.

Also what exactly is expected as the parameter to the firmware field?
What do the strings in the array mean? If there is documentation on the
C side, please link to it or explain it again.

--=20
Cheers,
Benno

> -
> This adds 'firmware' tag support to module! macro, corresponds to
> MODULE_FIRMWARE macro.
>=20
> A module can have multiple 'firmware' tags like 'alias'.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/macros/module.rs | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

