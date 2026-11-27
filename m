Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795808458;
	b=OVKUHFKWU8aM86jiqXLAEHUreq9UzumA55+G/KwzOAmqhQCIOdtLvNM0Z/NlGlY1YDRP
	 t/yGbYmphzJe2cVZXDmW5xK8nDa/Rrfe8fTAnRRvPow8WeWdDFcd1AtmyEGl9L1CmtPNV
	 /NwnDarLe172SJqO9Rn2KLdHIQCfSyxxskFJc+xr7IhguLiNqbwih3cApruXKLYjRsrdo
	 xFbSgFuTWE1tOOp5GjVuFFntumF3oOew6aAjvZTeiaOaV379ZgMWoh3io4/Sjc/Z6OCUv
	 eff3tMl83/XdbobwFSvx9fhDqi2LZMZHjWLHa/0EFrunhYiDEJb1/9kHpMUMY0JIgKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808458;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=lqF8jc2QrkR3SKq9gEQYdyy5tYfJGpiAZxCgMUFP9Ew=;
	b=PWF8HIB+EyusdJ+iPkWtLgz2lzrqiBkCxQwieJfC7J4DxrKOaV0OV0QA2b++hgtOnXIU
	 tLjL+d2TL99NH4uP6LSTUyrhDZ5aPQpj2IQCExto+lRUH+BOT3WxKilldbnutnRsAxaR3
	 DXD0IX4v0xeoO8VtqsiFCcqPohUo9TfL1PJmA+Al33OfM43SrfRNyN+rVOYhmBMj1fvZF
	 9hTg79sqKg4AuLx9BcCy5phjhpXtmlNCbdMtrB5+759QyzW8/6Tf42nIQOmrB6Wq7kehL
	 Pm+nbEsYjL2qd+gw5zdPenVoe0fZg7XVuYHpBHcDBqc9E4LboVrQI16WL2I8Cqzqlng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=QxXKvhzx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B63606A31C;
	Fri, 27 Nov 2026 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=QxXKvhzx
ARC-Seal: i=1; a=rsa-sha256; t=1795808444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ilEy0m3sAlzBkKvL9VPag52GDZWVDbPNgqfROjbQtNOE8d9Dd0sNz69AzqFXZR9eHp6Qooh7JEoC0+wzNHuMRtRTTcvR+06NXqZwBRuzdIF/ru8ddazKt2hD/pnujIohWkoruYpXGyuJHBBnz9qO57lP8cUuCkiocb2SUFhTJ+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795808444; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lqF8jc2QrkR3SKq9gEQYdyy5tYfJGpiAZxCgMUFP9Ew=; 
	b=OSFM+gEy+veRL2/Dg8eUydYINPwPU5/7+ZSPGYIeEM7Db/dxZKezLykbybVjbnlGLD/Vs8M56A3x5/9+1xG0zCGcaJxIgJvhO6MSDRJESTnFJu2JRTm2jULllIImsPAQArdjo2AOPtUXsMhOh7oIb5CXrukTYMcvnudmLpzdgG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=QxXKvhzx7di5J8Am7J4uE41S193jN0YhVpLLTBSrZjmXsrVmvu5m9YKJpvrhEM475UEzHpvbCtg0A+wYK66CpxOf8In2IXTaFXSoXyHywkk7tuCCjGWe1YSClwu+lvZtvEe4E7TAEFss9VvoEo90sJQSFDm+/xzwz5oFx49zIs8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lqF8jc2QrkR3SKq9gEQYdyy5tYfJGpiAZxCgMUFP9Ew=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795808442230524.8802054057094;
	Fri, 27 Nov 2026 11:40:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH RESEND 0/3] drm/tyr: KUnit tests and fixes for the
 firmware parser
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
Date: Fri, 27 Nov 2026 16:40:33 -0300
Cc: Sami Tolvanen <samitolvanen@google.com>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3A70BA02-A671-44DB-B5D3-0D67C88A7785@collabora.com>
References: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
To: dakr@kernel.org,
 simona@ffwll.ch,
 airlied@gmail.com,
 aliceryhl@google.com
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Sami,

Can I add your co-developed-by + sob for patches 2-3?
They are basically your fixes + tests

=E2=80=94Daniel=
