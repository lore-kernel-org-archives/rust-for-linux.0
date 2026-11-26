Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702724;
	b=B/ZC+R9BMa8yEEp937s3fndDiAiWh/FJw7J9vmXCPfaGoxGfotIH383XLMx4ihWWlQg4
	 rSPNVo/b6vuw+CzoRZuEGrD/HV6l/+OnuQCaLElZQjq4YfiRhhVUIyJtj1OjZYX1E1U29
	 OvTkWpXflWDIUxI+NKqV8Fsg5jDP/GfbqeSCIvH+P09yDkwjGiOipdSJQPikba13GGB5N
	 Ugg3Av/DpQqRoXNc8aH4Y0Nd/wA/42F1F+Ry5YePGgkRwSTPm/2Ye6RLsMx1vgpzfeYj0
	 1FeXA4++XKGeLSNQ0vh+xH62/7Gut2lo3oV6r3O7+Z+FgQS17YONbRG2lVIzgc+A0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702724;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HcPUrCRDnVTrRxzrnQBBCh1QtlonsMv/Nc1PiLUr+ik=;
	b=n0woBTVVpYkgMDY5K71TSFXOvHNNlu/afonIoQSHIUzdF4dndZy2aqnByUZRRUJToMw4
	 pR1s+j3O5H/j/1k64VV+ZnxwQYCgvshcSgAsxqIhOIK3ruyB+aBWYAPy43iJ2LXDbgyQB
	 EB3XcIoc7pTRg0n2CFKt+Ch3XgNnNq5DUvtFuPDngrItcKCuWYHWv6zuFQ5s1UaJWaTDs
	 vnzdBAAv4Li5NUw71uqxwgyBI5TknO8v5IniFp2e1N5dsj6dUfe0DrU8XxTT8sPMjk8bY
	 TPUqUTT/uxpMuTnD5SHHBhUhmuUIOwj10BObehA5eUz57BF21uHyNF8OpSMkMB5lMlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k10GsYKJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F2606A335;
	Thu, 26 Nov 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514F2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k10GsYKJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795702717;
	bh=JucLJO8s2LUWmGGq3P+iCmFjYmGKjZAtIrVZIaSBnss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k10GsYKJSVYB6hugOrnfDpmv9Yu2+0OIMjyq21AudIpCLH+1kiskEjCWkb5xzWgSJ
	 WRKyMvQjNLp10aGYRSg+Wrbq0gzQi2PtBGTEVLnGm2Kb7cQCHYZlo8oX9TeRF/67on
	 UbPuVBugdGzFIHlK/HhmXGkjcPFRmcZLuLI/n6uhtztxsnnboFhFBCULQwN8zLnvMJ
	 ih0IwXLTnx95ht+vmu/vL+q9yZXHz9LO1o+0QNDkRTpX+BBSJWw9oxyYaY8jOrJhAS
	 6WFQTZynSG6ewt+j8abyEDaUsr+e9Z+Ve0gyQy5adoIoP6UF/OIe+wIsoUWpAw3cc1
	 XMYFGxYvAm7NQ==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71BB217E04F7;
	Thu, 26 Nov 2026 15:18:36 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: laura.nao@collabora.com,
	daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
Date: Thu, 26 Nov 2026 15:18:30 +0100
Message-Id: <20261126141830.215638-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261126111145.117769-1-laura.nao@collabora.com>
References: <20261126111145.117769-1-laura.nao@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/26/26 12:11, Laura Nao wrote:
>
> Makes sense, thanks for the pointer. I this this also means 
> job_irq_init needs to return Result<impl PinInit<Self, Error> + 'a>
> instead of a fully constructed Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>>,
> right?
>
> With [0], Firmware is no longer wrapped in Arc. Iiuic, combined with the
> above, this will let us embed both the firmware and the job IRQ 
> registration as plain #[pin] fields in the same TyrDrmRegistrationData 
> struct. The job IRQ can then borrow a reference to the firmware's 
> JobIrqEvents directly within that same struct, instead of cloning it
> through Arc.
>
> If that's correct, I'll change both job_irq_init() and 
> TyrIrqRegistration::request() to return a 
> Result<impl PinInit<Self, Error> + 'a>.
>

..and here I meant job_irq_init should return 
Result<impl PinInit<TyrIrqRegistration<'a, JobIrq>, Error> + 'a> and
TyrRegistration::request() should return 
Result<impl PinInit<Self, Error> + 'a>. Sorry for the confusion.

Using a pin initializer seems the right direction regardless[1], so I'll
make the change.

Best,

Laura

[1] https://lore.kernel.org/all/DN545I66CKO1.2YKP99UIQQR43@kernel.org/
