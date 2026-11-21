Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263916;
	b=sEECod7Z3RmKuAxwqjncdSKZeStqFQ+vwdjLMYq1VXgrdX2uOQcorD74rK29snoAn+jl
	 VundhVuDPTsNYHD5SKFs2T0xK6oeJ80maVB8Q0fzTAkom43diQhEGKHXXebDla6J6f+LI
	 A6fxn+TzkBFM/d8XBEF1Oy2WtM5T5ziB/q8ucs1AlVPxpKV5VQWx8Byg/4BRasIYE+acT
	 sO09WmgVyJxWDMwnf1Tti2egTPS7kAU+ukkmDdCIaHkb3cxgMFccHya29RoD4WrQ1kRwh
	 s9rjqfSXDMVdnnkANSPYd8rlaoTZMM7Vzx5Ugf3+zdVHBDbIZ7FNDhpcU0piBTj9Emw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263916;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OMJUqx2DQ3BhmM2pBkud0YM/8aXiQ465Qxorf67Y66o=;
	b=NjrSWOWaWWDC/TPS8S3PvqJhOmw5meLd+KO2UyAcnJSXudFoVuAahyBJ1za2XXY74vea
	 ivzAlYPRjkaO3vDBFzbD0brWJNnK3cEC80iGvcyC8+XqCnDMd6w3Rp5VO0HJpmwSAYoQz
	 oXIdF71ytt4xRpLTbohybbP3NJdNnz/6lDUjMl8ZZZEsB+O5VwtSK9lBapuDOZt0+7q84
	 BhxYR/uPblFUYivZEoM3JVHaSEeoa7DudFBCtrCZEGO7E7/EAsUYJbFNg96n+Ivy7Uz7B
	 Z5OpDfpRL/uLkk5PVMEYRn3nCt4/F8SJQwv8/Fv/AmL5LSVnnFuSpRqQOr4fZ7HnkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=NlD+OZHp;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD74606A32C;
	Sat, 21 Nov 2026 12:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD74606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=NlD+OZHp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1795263912; x=1795523112;
	bh=OMJUqx2DQ3BhmM2pBkud0YM/8aXiQ465Qxorf67Y66o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NlD+OZHpJ0nC5UIQ/VqY+yPMhtgzft/2SpP6Mtl7A1Kp4wsy5uXZZQ166yubGSebY
	 m6tFz8Q9FUdYdGjJWaZpt/MzSTb0+4s6js6DuS1nAADnJSR0eR7ot5ET17tp8GoHC5
	 Hy5GoQQYbFPet7Zj8lGMt4h7g2QCKfQi0g31d03hnfTjd5dg0gJmERPSfnIpmeTY4Z
	 JWsM/MhQl1Wo44tSnSNqdacW+gWqJ391AYCzuoKumME3BjPUDa0irZmznXR8uQ/u/Y
	 4tOOGeFhS8TL9QWY7SdNLfK15rTN5exXSp1LRPO4eAOC4FAPJ7YT8ODV9+47T933dy
	 S8U1e02kT5ftg==
X-Pm-Submission-Id: 4jWrxx4yJtz1DFSv
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
Date: Sat, 21 Nov 2026 15:25:06 +0300
Message-ID: <20261121122508.20705-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <B56A0B7A-A0DC-4BCC-8556-F7BC105B991F@collabora.com>
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev> <av2U1FflKT1mEotg@google.com> <B56A0B7A-A0DC-4BCC-8556-F7BC105B991F@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Nov 2026 10:07:49 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> =0D
> =0D
> > On 18 Nov 2026, at 09:06, Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > =0D
> > On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:=0D
> >> Previous reset may leave the reset completed IRQ set which can make th=
e=0D
> >> poll return too early.=0D
> >> =0D
> >> Clear the IRQ first so the driver waits for the current reset to=0D
> >> complete.=0D
> >> =0D
> >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
> >> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>=0D
> >> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > =0D
> > Do you want me to merge this now, without waiting for the other patches=
?=0D
> > =0D
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>=0D
> =0D
> If Onur is fine with this, I think we should merge what we can.=0D
=0D
Sure, I am fine with that.=0D
=0D
Thanks=0D
=0D
> =0D
> =E2=80=94 Daniel=0D
