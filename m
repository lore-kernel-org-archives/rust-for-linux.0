Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568010;
	b=eLYcNvmbZBTDef3IhGUZCdRzKHZelAzlPM9gFMxPVaXXqw39m8pFO43XohbtUMRkmOPY
	 +3Wa9zhL+gu7cobM1pWf2kjbK1Jb9Q/xy7QglAAkO2fCuEINjAYZeGUsKVHRF+aAOW2I0
	 R6Y72nEN+hOoR+UlFXkRjqFpoOdUfmVZPwNBCJjo2Rfzj3kV2SV89TsMcmJO97AOumQqV
	 Ph/Tv4ImH8fGhCBT4nZsMf7z0FiSBjdoQFvpM3Gj9rSFt5X+mPhJRNcP/XNzFnwtiCVXG
	 RmemC7AmVU6iunEFP6Uskqod804SjqDgtcebP55dwLyoYpd9JMTRxHlP75jASG/5XLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568010;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=uVzGXGFEaDe1Jv5P3wq/EEUrc9Mo9DIHRPQwOT1ZGe8=;
	b=iPiBJVFCep3XdjkiQkctBKXDMq+MPNZ9slFlLdRu2bhzTswgi/wndlcJRZLYG9uXK9bO
	 O7YmLb0Q0mhoq4Chsq7/9+cGcLYXON0crtFL51NAlm+IKt8mEvmZBwbL+Oz6boaebZ/tm
	 8g5bUPCYIqdmTD63HEgtN2cVlIMsBGWnfIJyear6RjDMw1qnB9ZaiuCeOKpgbolbq8/9e
	 S0e9rpYejgl5/8c8d3k+9LDlQP8Xxnew3qvsZeksq+WZ93p8bsccVKnYtSJWmSRz+aTwO
	 uGvtNDJVcUlhJQML9Nj1+CfDhDqHEFTjMAbxgUQG/tLccSBNnV7vacaLdGuhWEjbDUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=H2CZAlNU;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MeoTVJvo;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B1606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 07:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=H2CZAlNU;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MeoTVJvo
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 04FC5EC00E5
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 03:33:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 21 Oct 2026 03:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792568008;
	 x=1792654408; bh=uVzGXGFEaDe1Jv5P3wq/EEUrc9Mo9DIHRPQwOT1ZGe8=; b=
	H2CZAlNU4dJN4nZ+deU/xL+rLNt40eM9yOaxC7LoCAEUdPRkldX21YR12nJ+XUr8
	3DMKxEi7kNuDzLriFSZllXka9gGUOjbF/jobdAoHm1X8y+yeb6WCv50xto8eOuZq
	MfRiuA3eyOYVMdHsLTMYmvnJ66WUswmi7bLyWgPKNEnb9Wq4TLC4dRjYCshqRx2T
	eESh/Q+eU4B0ZLGXNhO81jgV31NxsmIJHlyYMZj5WetcngX+m3LLcJvwkpGwG5pR
	y9B+72ASE8sdAzEUhE73wxnqvYK+jr3A3VrYgZUdy5nshO0sqW/Toaop8UHw6Qg8
	aMyT9DiUNpNaCs4GWwxFVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792568008; x=
	1792654408; bh=uVzGXGFEaDe1Jv5P3wq/EEUrc9Mo9DIHRPQwOT1ZGe8=; b=M
	eoTVJvoMSmfhJTi68FsgDFtBIPRrDKDuWAX3leqxy4fMbvGClEdkC7RBvOvqWkur
	ca9rkNDo8bEsfq4uIlhNoSzxDX8/4LQXzdSJSPavLatUAeGNiA2cdW4EmTu+oD/u
	6KI98tIHVnATZaQP2KZI3vutc242IoCPYfAlsJqxbbZZFOhigAvFzp28cdlQDTFg
	C2Enm1Qv2qBKQYjoDfE2xh+l3TeMJqfMdNHocQHAe0cuIGOZAfTon+kcFBqDxx30
	Cz4ssk+s8DHvy41TQVAZ+GGVr/W1DxPpZbTT24YMU+MpFGci2MWRplgXh1YzzmCG
	nk9zGAmocLUsb22FfDzcQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792568008; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:MN93PLCnvZfKhrHQvqMnsUR6iDKii+NEu3R0RqKEsgBJPHF
	Qzx1PDtPxuAunPW1iXFXrdS4DfIfQ0aWCiJdFcnzVWR8GhnSO1eD32lUWJFed4Ks
	VcX94f9QkRO46IdbyduwXPd28qBilwOnmSmI7svFa5WQeJzQlYLwSbhya8PbG0XU
	BwjPr00r+mmCeotKY932qMGzMpiI/FbnWI7+lnf5pQ6ukEqSSCXrN4/xcF9WZFsR
	qLyx4Sh+SgHHgxWL2qfy/Xncu/Me2cUS8veD+0/lq2dG35C6Y8MFZ7Tu0nBKDf70
	IYxfLdktu6GjeASTBoSW9eKMjUuUaTiS04KoZhQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:sE7oviaG2W9U03+NUO1ZCJgJ5kzaLF7Ubos/2J9o5AA=:aIxrJQw6byJSSpI7JG68txUCarZU1Hc6/3WckQFzdGc=;
X-ME-Sender: <xms:yGrYage2hmGQ4G-an03e3gvYKy9AfCVIu5WbSu0gTLw7ukE9GiJlpw>
    <xme:yGrYavoQNMHup-ZRl0i_Nl0LAvFFiFvkYwozl80MotUsNYVH-5k_n5kCV4GuQ7d8F
    O0LUeEx8lkQjZGcPXqJsO-AHFAVnYdpzayerwV8aW0fnYYzh5cnpTLV>
X-ME-Received: <xmr:yGrYaheSNJsJEpEBKQlG7lWCRiv2OjR01-BfOSJMuNPeH8wVnCOrjIc72gWJKvsQEQnMyyuaPZwA1I7_D1oGe_ij>
X-ME-Proxy-Cause: dmFkZTGpVTHn+SydJJT+VRdoTPrvGprGGVNIRF+afNyksTljI/Xz7ouNtYDX7THXy9XbOF
    JGB8Rol1p2S2ksGNH3skRUpPGxxs44MvhLa+/OyhtEeBcu5j5bRa+cVNNtZz5jmWl58RGz
    hfJCyX8x7mn1S9MXhKBvzTZYRkP7Tq+4cVthmDwsOA5BzUbNhG9TVk84hAQDq3xMKEd1Rf
    xm3XJuochdBuUcTdvClfqF/K49B3YJJ5o1n6zBZIgTW6o1rpwa9XaDDihmK9mmzsnGBq4m
    tqxXHJ29g24JySuuiiOVHgUwmIWcZRskKzfvX47BXmuutqmStjXWTN8t/v1IDQT5Gr5yBv
    IbbsOlJZ4cbWNBjVCOYa1qAbVz4TRJRd3tPVKSh7vQTQ916/jf581kV3OzXBS1UtYN0Aap
    RdA0ire71HaAkF1igf2U1BQIofJGw70oV80d3UsrfsybdWclUIvSlSdC76TlEwAFdTwTcm
    nJdmIfCaKGyxk+4T54+lF61F8D7qr+bzlmCPmofv1GV02iYrwL9kS1bW6oPWHIqRe3Um5Q
    Up2W57m5l4QTBw2nGif0a54AZyK7y8GFHgcFhs1L4bRLnLabHmGJhBKvxdqOdWLUjCQKYa
    rLM/9v4esMOAr+GS4xFx3wpGQrYwRarizTc81eNig2hL7ld/CJEnYAFryA1g
X-ME-Proxy: <xmx:yGrYanl2G1ptoFiX593oJTYOnLd7XEq2CDDYMCNjN8FSiVaizO4xpw>
    <xmx:yGrYast_clruEqrFMBFv3KJvIVdxfpcX74yWbqGKyQhMhRj2RqP2UQ>
    <xmx:yGrYaiz9EiwnTP6rDnWon3ax5og12YoCNZcX8NwRtdAThlcDx211hA>
    <xmx:yGrYavy87Klf-1Zw4c4YKRU77MsPTmBuaUfGAni7lPyQxLVYhUun-Q>
    <xmx:yGrYalNcEYcYdl00-2zGjMBALGGtnnZ0_Yws_plbzRuYV_smyg9KPS5R>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 03:33:22 -0400 (EDT)
Date: Wed, 21 Oct 2026 16:33:20 +0900 (JST)
Message-Id: <20261021.163320.943019405320974844.tomo@flapping.org>
To: chenhan0017.work@gmail.com
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 miguel.ojeda.sandonis@gmail.com, tomo@flapping.org,
 georgeandrout13@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: time: rename the rem_nanos() divisor
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261017111134.22546-2-chenhan0017.work@gmail.com>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com>
	<20261017111134.22546-2-chenhan0017.work@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 17 Oct 2026 19:11:32 +0800
chenhan <chenhan0017.work@gmail.com> wrote:

> The argument to rem_nanos() is the divisor, while self holds the
> dividend. Rename the argument and correct the documentation. Drop the
> architecture-specific implementation explanation from the public API
> documentation; the argument type already states the divisor's width.
> 
> This does not change the function's type or behavior. It is a preparation
> for documenting and checking the invalid divisors in the next patch.
> 
> Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
