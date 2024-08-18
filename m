Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307B433D5
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Aug 2024 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997431; cv=none; b=YY91Xg/ADbSzXhfTBOmnZa00dKMWpeWqZoPw6EgdTtYGJJEl13BlZzio4tZfZ9V9+KQAVoHVLxf389aPu9Vd7FYfeCsWDn5oDcBHfpXopbZSEAo5OkR9XPSt0eRXgL+anV3rOYVSga1x9rIWEAP+d9aEu7zWBT2pmP3XmIPs2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997431; c=relaxed/simple;
	bh=F8OnVIia3qGwuM7GLBvb8U84chTOk/L+mpjyC30Yg90=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsEd2tN9Jy0w6+0weu2MSrer0HuR8knysuTIQrSM7Jwvj4RpfugXsq+JgpgwLa0wYIsBPNfi6QFaTDqabR3OZ6p/4iwtdePVcxAsj5D1D5o2cp3rHr99gCUfYVFqORSNrQDnsHnGoYCMs1ar8AgPMQUOgH1g8EFtwBA6XYfeEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nSVNlwXs; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nSVNlwXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723997427; x=1724256627;
	bh=bER8IFLJzVlzBiL6tP7y8HbB8JeD2NkMDdJZPLvqVX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nSVNlwXsh0GXcns+QEVVmi/OHNlmQpRHDCQvMJ/mEg7b7B0HpW/apc9RT7LFRdvXt
	 60N2UNS9GHQQjmVqWFChTc9p8HEVipFQk5XBUl/uaRwBcq5LLQlSawk+8AqvN0BHkn
	 WU7Dsn9jKvoaM3kIFJI9JuLP9dqii1rrzHildxq6qfhZGqBNUMZ/u/+8enesXxU7cM
	 seWLL6OHRYBjGFxjN0P6mWEayjAKlUAFrofn5Jip3qvTUOJFG8wHjoj8mfUVI9XEcq
	 8ksd2OZXjsPSlHbd5IFPvhsf2Oc6N/yK9nYzqscVTfVL1K9cVpYxEyFWgWkLxYu5Ir
	 FFFd14Sk9LZpQ==
Date: Sun, 18 Aug 2024 16:10:25 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 6/6] net: phy: add Applied Micro QT2025 PHY driver
Message-ID: <aa02b004-7281-45d0-87b1-668545bb3493@proton.me>
In-Reply-To: <20240817051939.77735-7-fujita.tomonori@gmail.com>
References: <20240817051939.77735-1-fujita.tomonori@gmail.com> <20240817051939.77735-7-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 90a370bf6dfee4705e7645cb5c57873e3fda941d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.08.24 07:19, FUJITA Tomonori wrote:
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 7fddc8306d82..e0ff386d90cd 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -109,6 +109,12 @@ config ADIN1100_PHY
>  =09  Currently supports the:
>  =09  - ADIN1100 - Robust,Industrial, Low Power 10BASE-T1L Ethernet PHY
>=20
> +config AMCC_QT2025_PHY
> +=09tristate "AMCC QT2025 PHY"
> +=09depends on RUST_PHYLIB_ABSTRACTIONS

This is missing a depends on RUST_FW_LOADER_ABSTRACTIONS.

---
Cheers,
Benno

> +=09help
> +=09  Adds support for the Applied Micro Circuits Corporation QT2025 PHY.
> +
>  source "drivers/net/phy/aquantia/Kconfig"

