Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703023;
	b=NySEyVELwwlAXw3WXVLlu81Gfoga/tkUwPyy86o64tCvfI3jkjhh1k5QxWDZu1ll78TR
	 R0tXlubTUEiJn6gFQ+800de4frMd22RIEqFrEoxDDk6qvRqUfXRapfUQkkpjVnKN7fFIb
	 IgPNMJO+i+4hamMv8C/f7Y7K5YUoAeGACNF4e49HbvsbNg8BSnYPZGj7Ysw1NjaT5zhCi
	 w5XWp8q3HsW5xIu5PHyMoimxWFt2CWOgTVUoeXLfYm7NRerPXiFj1hahb1c0ebNUVIKns
	 TrDUoviwjMKCaMImRHFkeHx52Sfytzn+VcuWWrmHgILJlaAMhGyy0JfZJBAnMb433fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703023;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dm2y8Oq8oXMm7QsOuoqQEHDEq067SfqFTct2Ocjc2Ss=;
	b=sf325pX6+Whh2l8omArm7J5DDacEuKfD1+Ms/dVmKCdxcwvIdWi4a0Te44oQBm5DX0Wc
	 yccDDMqgoLcdlgE1XsZEWgYC8TdRsEqL6bIUsXWk0KFGfJP4tCP0nZ1PmSQc7yYUSdFtA
	 RIMRAs6C1e/Ovv/WkTYhbnIpTjF82GIZnagjIeidaRhkokw7IDSTIGqGTidu+Qy8XSAl7
	 EDyCOvRN790zi6vMzRkRZZ6peRTWFFl/5dHdlnelQBsqjv++Z7sPTJZr8Zol32B1DzHqP
	 yRthq7ltn6twJYRexsOteXS9NHAXEQCVsyNTFKJW9cwrgcxWtNGAwJ5S72gasOb+j7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gKrKVYbv;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89A606A321;
	Thu, 26 Nov 2026 14:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E89A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gKrKVYbv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795703021;
	bh=SeH7W4HXcoMbKbmUVHcSDi20fgxLOytbLKN210ZOlI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKrKVYbvVwu5WWkzcQ2z7uMhkNOB/Eoprtm7L4DXw9xL4Fz1yV4EPacje+wbpIcR/
	 GXMb58l0xbb3Cf0DUgH+vpOK1yeO5hHa1K98pX+DOsFGPonrDnvtsEJrahTiRSNW4y
	 a1IuTbRxlwO2F7uX84qr9nfZou9L5AWKm3cYC5PgipxqMgR3lxACu7L48VAJ/xJyAP
	 +0NiBRQ0GKOexzhvyc+R8+vXTagF17YNxn2/uAH9t24DlfwAzRqmgmtbpXGLiMeLDL
	 uG58itz9MlAlyMmbcLhskXxHBlM9A2zjP2Djm4u4Q+W28HPc1fcdcX99OeMCT3CXBw
	 2mKIxD2l4tcNw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0680417E0FD4;
	Thu, 26 Nov 2026 15:23:40 +0100 (CET)
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
Subject: Re: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
Date: Thu, 26 Nov 2026 15:23:28 +0100
Message-Id: <20261126142328.216740-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DN548CRVXMGK.BOPO5J56Y1OH@kernel.org>
References: <DN548CRVXMGK.BOPO5J56Y1OH@kernel.org>
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

On 11/26/26 12:45, Danilo Krummrich wrote:
> On Mon Nov 23, 2026 at 3:58 PM CET, Laura Nao wrote:
>> +/// Requests a threaded IRQ registration for the Job IRQ.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
>> +/// [`Drop`] implementation from running.
>> +pub(crate) unsafe fn job_irq_init<'a>(
>> +    pdev: &'a platform::Device<Bound>,
>> +    hw: Arc<HwGate<'a>>,
>> +    events: Arc<JobIrqEvents>,
>> +) -> Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>> {
>> +    let job_irq = JobIrq { events };
>> +    // Ensure interrupt sources are disabled until the handler is registered.
>> +    job_irq.clear_mask(hw.access().iomem());
>> +
>> +    // SAFETY: The caller guarantees the resulting registration will not be leaked.
>> +    unsafe { TyrIrqRegistration::request(pdev, c"job", job_irq, hw) }
>> +}
>
> You could implement a constructor in an impl TyrIrqRegistration<'a, JobIrq>
> block instead, which is think is cleaner than a free standing function.

Right, thanks for the suggestion. Will do.

Best,
Laura
