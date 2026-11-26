Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702876;
	b=v9xFnFsFXeMmKyEFDV9IVpAVylKZz5bfmiNEvAm+URlaJYlRFQjZcaMlYWSssYsQfLBU
	 k1sjVVQx5z8HimaZQaIOvaHjs7va/eCxeL2bT4oK/rInohSW9kHizMk+90EFHsIbxGE6d
	 3f/d93f3XEQ74BjbcIjZKV7CuZq0TruwRtXtQ3mbpMyeUPxD7iFHIOunbrPO6Gu7jTIxr
	 uzlv+8UQWZkxDy0nPB1Mv/eBgxsSh5nrCs38p08uli2HTabVmV0prUzt7Wlr3Pr4FasNE
	 KLeLgN1cYx6Ss94/SkdbDNDezBPqCr3kZnNdzn55CzEFIL2m8S6d8hTRWpiP9tAgciw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702876;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=atRADlSOnZLQNM6G54/+kjR/y56AYpp2tRLeMkzwmQo=;
	b=THomAxl6KBTtz5/lSS6QbJ18YOO5Ey/HcBl66Yh292R/sxooUBPnVuehieJ2QU3UA6x6
	 3r2HFDdz37lSYKOi/4xzZRu9beJp2pSDf514fQQmr3bM+iBA4hEr1vjgm6dFMmxXwS7WD
	 6CWlbn2M8DhZArMfXBflwSE5+XvbI1C9iIdoRzVY2Qeq7sofE8ZdUCQY3uJ3tUftclya5
	 oZsa8JNXOd84MKnqOuEFyn+b8RPEsgJx57DEqECPLAJ/0HobKBPVkMvTkunr1yzB6DxNi
	 h3PUB1arZuu3UEaInEDJ3AYVGC/ztbphv6UQyf1Her3JaQGssk0viXnVTtqkvwW9xHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lqBSMAU5;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E9606A321;
	Thu, 26 Nov 2026 14:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lqBSMAU5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795702873;
	bh=v9bSNQgXQSZX2c+Meg6UrLoUf8wBWQR+eTf8RCbX6Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqBSMAU5p1NeFmG+L9sx55yA9psPVka1U0XjJir8uo/k6gjK2YHYIN1+rmpHINmOi
	 GztcDHimNlyYByP4ICo1rZEhyvecs8SS2sxuZCfuz0qyP9G480P+fLNzBhuBs73OJt
	 jgBTlrz0Kv4j17WuqKWPlhW5W8neTH68GrI7TfOpseyptxKLIChtfpPB0o4oaOm70s
	 CTnUi5ovJhyVFG79imUEpd3DrduT4nwrbZROidEe5FDcWrVxW6GefAUGt4nftBPaHl
	 6jOSXRlAnca/+ddduRj/eLSwapeRMo09V9iXlXlmn0yI3u4vwkXE6b7qgM5Z4LZuvO
	 wLMmIoijKx1Wg==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C47517E09ED;
	Thu, 26 Nov 2026 15:21:13 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	daniel.almeida@collabora.com,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH v7 2/3] drm/tyr: add TyrIrq threaded IRQ wrapper
Date: Thu, 26 Nov 2026 15:21:03 +0100
Message-Id: <20261126142103.216201-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DN545I66CKO1.2YKP99UIQQR43@kernel.org>
References: <DN545I66CKO1.2YKP99UIQQR43@kernel.org>
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

Hi Danilo,

On 11/26/26 12:41, Danilo Krummrich wrote:
> On Mon Nov 23, 2026 at 3:58 PM CET, Laura Nao wrote:
>> +impl<'a, T: TyrIrqTrait> TyrIrqRegistration<'a, T> {
>> +    /// Requests a threaded IRQ registration for `irq`, using `name` to look up the interrupt.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
>> +    /// [`Drop`] implementation from running.
>> +    pub(crate) unsafe fn request(
>> +        pdev: &'a platform::Device<Bound>,
>> +        name: &'static CStr,
>> +        irq: T,
>> +        hw: Arc<HwGate<'a>>,
>> +    ) -> Result<Pin<KBox<Self>>>
>
> Why does this not return a pin initializer itself?
>
> I don't think this has a user in this series (except job_irq_init(), which
> itself seems unused), but I expect this to be stored in some other container
> that is pinned anyway.
>
> (Note that in C we'd also not need a separate allocation and just embed it in
> its corresponding container.)
>

Thanks for flagging this, came to the same conclusion this morning after 
rethinking about how this will be stored in TyrDrmRegistrationData. 
I'll fix this in the next revision.

Best,

Laura

