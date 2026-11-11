Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411272;
	b=kGTSlSUxLX9vGgn30QTkufxRHmAQfvJAutdGrywXP9agN+pPYigXQgoFn1tkKD3iQxBL
	 A0YohCnqB5bfUSROn60LmbkTk6iOoPjGy8PGo9tSP+ByY4plrycscAYzefaBXFmRuufy8
	 SppDdQKCUElffrqgMfgxOmGFe+d6rnW5sD90VzI0ApcyRufyyzbyPgGeeDv3vjfZdvsnc
	 e/M2/rU5j5xo8YJ6qk2eMjb1pGbIK/2l+OEAWqzgnu/YXDveZTiz6UKHQG0qU+Dy0xvw0
	 Fp7rHRItd+Yhck9nMi/K2iLBBdCq/WqaDS2T2lLQijrtFhKjLBEBH3wgjv0lzzUwiVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411272;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=3d6GwUcI41vPeyH4xF1H67Snjlg/ya1dkGHnX8U2dlU=;
	b=pZtbIl1OT0iz71zMl80tUGpu51uMo1oULz1gzP53hdyvTapi0vKqwnaCdC4Pw/zSghy+
	 9iF36UO1uqAuXRwoExE6dnJtC+rPaDvf7SFpYN9cSzqeg6bJO96G4mvjtQyTBVv203hGc
	 G4V7oR3KmkoZyKYXsmIjk5DyStDbPYa25wGUovtKb7LIQj5HQGiMlvIGrCr5gj+Rk1aX4
	 TfaVsx2c7tWBRh3dSqL6hXR2NXMR0nN7Q9HXbAZ9Lq9u6pkxhYv4fk/NuBVwMOcyWN9bA
	 mY9TJBx9arZeFMcb6peDaVVcOTsqRZuWl7a+1gXhAp6x55MP0tY2VDjHxe4A3PQZ21Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Gxq2A+gU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495C606A331;
	Wed, 11 Nov 2026 15:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C495C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Gxq2A+gU
ARC-Seal: i=1; a=rsa-sha256; t=1794411245; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YH4GCyBgSUE4ZWKabNOPkedslFjxEeN2y+ukxGakA+nTWBBltm2ACuFjgZAhuUQTipu/k0RbB80tfJvN8S6sRxp656EDfhDzhNAFmmXoCRmjBs6G5FSi3shPCK6isX1o6IwDEmku5nWcqAut99U7JlydtjyHNmclAZhtiwxdQmk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794411245; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3d6GwUcI41vPeyH4xF1H67Snjlg/ya1dkGHnX8U2dlU=; 
	b=AcKJI43GQKyj21gx708w3BVs9FDY87GsU+SlJyfy+C7zpBpMU2mCbc5YnDPs2/sLUNypYTKIG5B5UB8Qv6KRIJc4zz3KBXSYpnIEIaqqXa52NKZWjEV7rJf5D+ZxGWcv4IFtT/cwzyWw9AQNdjhoKVCUgGBnOufpZJLiIUSpOSA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Gxq2A+gUMWVLn5WHW9l3vwnxQlQIYUqQccBXHbU8H12DDAaAOMmh6r+KWJaTUxaf5EKbaNKh4Iw8OCrcvFEdIx5UgYOxmgLH+KSccnvqk96LmLlzwTSEZUAn6cZ6vRBuklZ+0VTUjKDniwcU+BVWJcPNofa0CIDBh/pzNaUuzfk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=3d6GwUcI41vPeyH4xF1H67Snjlg/ya1dkGHnX8U2dlU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794411244551300.58005091833445;
	Wed, 11 Nov 2026 07:34:04 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 0/3] drm/tyr: GPU reset infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261111100745.3929894-1-work@onurozkan.dev>
Date: Wed, 11 Nov 2026 12:33:47 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE29D511-8F4A-49A3-BE4E-31E6411816D7@collabora.com>
References: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev>
 <70AFEE33-C637-4D49-88F1-9DF3A9BBF097@collabora.com>
 <20261111100745.3929894-1-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Onur,

>=20
> Any updates on this? I am preparing v2 of the GPU unplug series [1] =
which
> depends on this series. The reset patches need rebasing against =
current
> drm-rust-next.
>=20
> Would you prefer me to send a rebased v8 and base unplug v2 on it or =
are
> you planning to pick up v7 and handle the rebase?
>=20
> Thanks,
> Onur
>=20
> [1]: =
https://lore.kernel.org/all/20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@o=
nurozkan.dev
>=20

I'm only waiting Alice's R-b before bringing this in. Feel free to send =
a
rebased version, since it will probably be needed for the unplug work =
too.

-- Daniel=
