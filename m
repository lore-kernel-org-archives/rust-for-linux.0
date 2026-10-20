Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508191;
	b=SzVnHtGY092ehcZfHdBKo3fNL678zwi31km2OtTpZ/c3piTTSov3oSN+vfmdnU0BnFp7
	 v3ZaIxq2o7kyhq1wzqQuA9aTv2Jm7/gEIlBSAd70nPYMqatBLHDpv6XnG9rCDsztQiT22
	 LbKfLgCb/c3SNIJxgFpoAmbi+w/yxBSbeN52tK2VxX2diQaQZ1sntBtss/ZmiKHyEen9P
	 pzh2jkEgu+EkFxcRlovdhe2z4UpLXbxayZSOY2R/5342s47SDnf3VHTj1Age/LrMH13Jy
	 WzLEZy6nxxGunLDqwdH6unAVh68LFSnCxVoZOeBZFbq6ja35mSrm95FSUZyqKZEnqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508191;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID;
	bh=rhVJSNRvE7OKuKBfyX0DSPx+6p9/cmtC0eJ63r3tTIM=;
	b=E+aaOPSC05RjK/VF9ROgEMxWu/hRioxwWplPtkD1KLtIwm1ZTo72DvcplHC7BkQ+Jz82
	 b4ztNr5YuzRWmMTxQvqHbUT/iyNnu+uAY6TFO3nC1r8vMk/gO12nct6Db4yrCIvMJldDs
	 I0R11nND6LCZ+pCxlnHd9q2qgZGgFQglNUd0GO/qjM0L84Z2wSNGj+tNKexoQU4sgQd6y
	 vkn1a28mqCuyM2ToHD2QwAcqcAQ0yUWZKGdcwuzXyi7NvDXNj32lJq22fk6MH2yD9tc0D
	 GjHZFjVcicM9vNPSe580kJcPMluihYs621Wafq6/Ww6Ov7s3VNjSZLDiKVuj9nxIfSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rAUFJ5AH;
	arc=none smtp.remote-ip=95.215.58.5
Received: from mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8F606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 14:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rAUFJ5AH
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rhVJSNRvE7OKuKBfyX0DSPx+6p9/cmtC0eJ63r3tTIM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792508188; v=1; x=1793112988;
 b=rAUFJ5AHtoE0AUdS61bQ0UJBDQWt2Aqv0FJnZSdkSYCiifI90kbbY+oCtqd/cUUSWIzSg7qo
 I19ebhjN+0+rKFn/N8R2top1woiEvsYy8H7rnv2wfs5+zdjq9V0Q1uFGP7TrihP5jgbLYCOCcl8
 /4tP5yAdSpePD1+JiUnPOSPs=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f697e2a16de64c8;
	Tue, 20 Oct 2026 14:56:28 +0000
X-Mizu-Trace-ID: 8f697e2a16de64c8
X-Migadu-Flow: FLOW_OUT
From: Alvin Sun <alvin.sun@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
    dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 09/11] rust: device: expose dma_coherent()
In-Reply-To: <DLS0QEPJKOPZ.1MX607W2OQ0RI@kernel.org>
Date: Tue, 20 Oct 2026 22:55:08 +0800
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <5a350d4519eaf9c8.1792508188@smtp.migadu.com>

Hi Danilo,

On Tue, Sep 29, 2026 at 08:40:25PM +0200, Danilo Krummrich wrote:
> Why not return a transparent wrapper around enum dev_dma_attr so we have all cases covered?

Done in v4. The series also builds on your drm-file and sync series;
I rebased these on the current drm-rust-next and pushed the branch to:
https://gitlab.freedesktop.org/alvinsun039/linux/-/tree/tyr-ioctls

Best regards,
Alvin
