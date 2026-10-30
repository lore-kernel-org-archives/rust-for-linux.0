Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352173;
	b=5F4+lsUS2UW0uzOJGaOCgLRUTwbQs+fvEVKIlVfw6tmfJ+Ehszmqeuh9Ri/SQSkJedIT
	 u2g6jtbsCpAEEjxZnQlobJE2YqhE3kz9AaJR/6Pgge+LkT86+zfEFE8MVbO+SjAhrEnDY
	 rkYPE919FD+3NkRz8zN1cCf3fRgwpwXvo3rzkbD6io8LDJKX5zTHDPwQtJCIsOhliJu3k
	 J/9EIBsOxCMODAJkyDVLQtgs37DD9zYbOCBjPIA7tga1DRoznpDx+HMGYk7bl2zNmVlYg
	 FVlOEf9UgI5ZEV0GWMh/XRIm2Z5KuKkv/Ab+sAOMvFxpVw00Vtut98U8lvpM1uSzdIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352173;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=B6IX38PySFVbWLlw2Nt12nyLBzLVOS+RadDmxDwEjR4=;
	b=zUFraqcBIpBtwnoLM4WpM1yUNS2A8Duehl6f8abrh7DbzB/FPOGMXFUDEMB5jxGYkTqW
	 YboeVTKJEjKtzqtokgTJjTiF9VWk5yYODlBMC4h4HLTn4ejQNeMC2hNvfjeK3NG49PNFL
	 VnuCOe31hNTfjQHb/bpjZ7kvC5kNftqATOYpQ7RHo8ZKsdFRRml1RhAKX6n2D2dGpcrAO
	 nEf37WzKiBxUhZ5EqbVqTNmWq4RvWArL2DMLwdP/OF3oiyzU1wgKgXtdmU6yXWgcEsr3+
	 0dS/k0TtnSMGqzka8A0a6NFLTkfN478J3/HUsgBEBGSCuXEDqNH8+yNdJ2XzrloXz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVTo1zl9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1A606A322;
	Fri, 30 Oct 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVTo1zl9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEB51F00A02;
	Fri, 30 Oct 2026 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793352172;
	bh=B6IX38PySFVbWLlw2Nt12nyLBzLVOS+RadDmxDwEjR4=;
	h=Date:From:To:Cc:Subject;
	b=mVTo1zl9qaTgKBSafhU+hNDKCtE+Y3oDvIZaiH4cb63PWhIrqnmse8apr4MqxLVlh
	 gqJhSH8+jjOvWMALYJLar//JOUrFgynrVUZ13heL2vu0rDPrhdIRFOfHohybhwb5Tn
	 QgfdSxNwE6e2Wer/iUVS4dWoTYf9IXJ2DOo7h+1tRz699Ge53PPtlQY4KeT2ihp1YX
	 o3x/0T2R4VCyx4aqJICnQmCFOeCQoULYy/LBPm2Pa/Pzc4boIYBPGx7RCTtBzFrGpZ
	 K4m8WjZSRGQRMq+/wRf5MIC07g5ykuzoF1FWAMaZfoLSpu8nY4C+771w6+12SGQ7g4
	 I6QR9bbuVgJhA==
Message-ID: <f2df460b-bce2-47f5-97cf-d70773876019@kernel.org>
Date: Fri, 30 Oct 2026 10:22:49 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-next@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Please add the rxarray tree to linux-next
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

Could you please add this tree and branch to linux-next?

  https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-next

It's for the Rust XArray (rust/kernel/rxarray.rs), a Rust reference
implementation of lib/xarray.c [1][2]. PRs will go to Matthew.

Thanks,
Daniel

Link: https://lwn.net/Articles/1100520/ [1]
Link: https://lore.kernel.org/all/20261005-rxarray-next-v2-1-187f689b52e4@samsung.com/ [2]
