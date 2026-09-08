Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601194B049B
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866827; cv=none; b=WbnLWD9OZQQfkt2UbWf78AznsUuDsdxRqsNfj6gCYvaUfgffgan31ajV+keO2aD2QrGw8ztNoJ+UgRdizSIzeCAOaJ5bGxzzEC2z1bJdkbryPRjDK8Lbi8ieaR0voM+dDpseMKaBkIA9jKHntqUv6OANoPgihZkyYSPu0Cyuihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866827; c=relaxed/simple;
	bh=bOMMg6FdrXmtihUQ92QcGUH8ULn7PsqO8ZRXTvgdfxY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lsJnktxx1XSFz4cKlVe7r1SvPMQlxRD+npA6Gtjnyd/SbS0ixa67YAWrC/A1c69tC0XW0OxUs3dhlNpDAV1WnGt+Ivi92dN7r1YIp8usyuv9rTZ1X6lIv6XPQhNTF3CSdYbKe7IuYWxMc5hJBIFhe8cu3qxdX3EO604+nfxMd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=kDilkkID; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v2hMkx4X; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="kDilkkID";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v2hMkx4X"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 3CDF81D0008D;
	Tue,  8 Sep 2026 07:26:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 07:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788866812;
	 x=1788953212; bh=bOMMg6FdrXmtihUQ92QcGUH8ULn7PsqO8ZRXTvgdfxY=; b=
	kDilkkIDilqbWGmVGFYuyD2HraGOzT1kF5FrenHAL+8VcH4UDXaBmQw9U1PmDNhu
	EM/Lv1rCDmgXc1LrUr89St0E11TMrNLt70Nco28OmrQDFoJDuvRWxxXM061a5WYb
	3y7MOTR1KjiHKdZWT126EFCp0UOfI33YgnronMpDe3yym2KfGftsX25b7kATDAmJ
	OTaaAJ+lrW6027heF7/ByjmRo/y71z7wY7ZarOGRAiQFjzmZ3FmalX30J5/QEudO
	+b6AfH34rAtz1u6Fb2dIxPj4cU+c3KfpVCd5qEyIvZ9GnmzH+2xgr3QvrAuoVMfF
	b107KeNX0Z+AhUrn+VKxyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788866812; x=
	1788953212; bh=bOMMg6FdrXmtihUQ92QcGUH8ULn7PsqO8ZRXTvgdfxY=; b=v
	2hMkx4XrQBDSRfSQNXou4JtNPAxUcFW0UbvMz0mQ007Sig8rz1C47CP70aT+xPXU
	+rnHvUjh11Twwff4CBc6/gM/a2qpzL52WifYxtRKP932uXC/UqadWoiIf5YKdA9/
	5NEOkwkycgJeDR5P+UCe7NxZLGjlyvQkxMLvJdAmKD0RZ+sxFW8qUPzJKxnkUiI4
	99oQBb5gE7qYC0+dCqXWj5YCFBGFthKh46k5iUqZvsvtn8vDFKHNurFELG/PT5Tq
	vYp9vzZy5AMxlXn53nAzCKKpHk57P0ewou5T3pE3nyl75Qy1KLvkVz8iOo6DdGNl
	7XlcuSdXpbq531dCOvMMw==
X-ME-Sender: <xms:-_CfahWKvcWZXIl49P34gC86GTtLhU59AciYvPvzYKJAeOIq-UDkag>
    <xme:-_Cfah9dLcdBlYtFlGpvUOkAZE317uIban0C4B3sKyqhjH3G_R6MRAzy-euasiKEF
    kkAqMCrtxFPICi0CIOF-laZ5BfyODgUXuNP42QqyaVAlFUcqo5vR8mv>
X-ME-Received: <xmr:-_CfauiNSMkA0kuWzMHHQzoqHiy02fRksk_-biSGX8OYamerWDXXPTwq2FBpOXIErq50sPkzlyZ7BQ1dVgluLnmL>
X-ME-Proxy-Cause: dmFkZTFcc9NHsBehK54vnU1z8C+7w5VAwdVS42I1I67QsnIDUyckm6epkbVoqIvI9MNhkL
    VyRuyEUd5g3sZDh4dDxfWTmEvoG6VyjCOr70SqerxpaTNCCnzsB8NULxR0SVz5tfQQr+Vn
    WV9z/ItgxqeNtza91nv8HhmnbNLN6R0YYg2sPGI3Qv9V3+f7IvfwMcMwSjIFq+LofT71Vd
    JiLzEqc5G1AHC+HARGrXaPbjnv+0wGON8M+jJhTv9Fuy5rseBKa9zhU22M0AW4VSYSzvZt
    SjGivwIt+mh2GC9vOLjRfu0ubYKtw1E9BALeyLkCd654/6D+6OijuabZqPoPb4KGuISSLZ
    1R5QX5W+r5ZVmu+dOIQJR4Dxdfd8cpL/W9kb5ClaVYflMd2ZjP22s1w/Q/GMYh68rz9nMZ
    VvXDkjRzUTx2v8ZVkNs+j35RCbagWmM1sPKY79R6FwRojZf2y7nNzunIplaWq2Nk8ufiNP
    OOkjaE/9EBM52QNu7sFa+JPVQQ366yoxhwRho8uPpsdSWQaBCEqpnHpq8GlS+8nM0EdBeC
    k1R7mcW5RaKCEqdJjiVNdoHKVey8Ss4yfYCiqNGBp2lMMQhgT8nSTR0Cv9wM8hRN6QU/Sk
    agkqJ+Rk/deIROgesdgR4KzYWRWjyGpeECAQDjSthy4Rto+l+/8Dpt/O7Rag
X-ME-Proxy: <xmx:-_CfagWNFIPw5jmZtJXnpG8aCFk02AdF49UjZsTU6_RBvF9Y6wQU6w>
    <xmx:-_CfaquNPThLQGZl_TfLOkFmk0J7s7gWvpSj23iSIH2At8vixcAlGg>
    <xmx:-_Cfap-b3M2fM94WE_raHFKA4kiK73GiUDLFf6MoeaBCyr-w70s00Q>
    <xmx:-_Cfaiu6eHkryD5HGXKlZD8vv22eBO0OXtOVnHrEEqmjJX8GRXedIw>
    <xmx:_PCfaod3DhTaIGpI_fC_CFReyPcj1_0Be6kcOAbLbFvSHy_uNlZkEIux>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 07:26:47 -0400 (EDT)
Date: Tue, 08 Sep 2026 20:26:45 +0900 (JST)
Message-Id: <20260908.202645.851502304088874666.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org
Cc: ojeda@kernel.org, jstultz@google.com, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72mj2vTKN7QjqyDgKq4w8cwPWcrYsx3Nc2Hk6kceYDbLkw@mail.gmail.com>
References: <87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
	<20260810.223116.480833962545427592.tomo@flapping.org>
	<CANiq72mj2vTKN7QjqyDgKq4w8cwPWcrYsx3Nc2Hk6kceYDbLkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAxMCBBdWcgMjAyNiAxNTozMjo0NCArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBNb24sIEF1ZyAxMCwgMjAy
NiBhdCAzOjMx4oCvUE0gRlVKSVRBIFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4gd3JvdGU6
DQo+Pg0KPj4gVGhhbmtzIQ0KPj4NCj4+IE1pZ3VlbCwgQW5kcmVhcywgY2FuIHdlIG1lcmdlIHRo
aXMgdmlhIHJ1c3QtbmV4dD8NCj4gDQo+IElmIEFuZHJlYXMgaXMgT0sgd2l0aCBpdCwgd2UgY2Fu
IHRyeSwgeWVhaCAtLSBoZSB3YXMgbWVudGlvbmluZyB0byBtZQ0KPiBlYXJsaWVyIHRvZGF5IGFi
b3V0IGEgZmV3IG90aGVycy4NCg0KQW5kcmVhcywgY2FuIHdlIGdldCBpdCBpbnRvIHRoZSBuZXh0
IG1lcmdlIHdpbmRvdyB2aWEgcnVzdC1uZXh0Pw0KDQo=
