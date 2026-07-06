Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FB395AE4
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321665; cv=none; b=eeH+gafcQAJ/uzCWslcUFqDniknlFG+qQPJAB4+PLRHAk645hUiYnMsIvVQggqQ+32dHQ6YZfVkE+EEQc/ob8T97hyCyuPcv2N2wHk2d4mk7iV9NJARKVm3jBf86wNxUAigSj/VTwCDFrm2p2XhGNu7mkD8lczcEYHLs6P6HvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321665; c=relaxed/simple;
	bh=pHaT0UF2+/TYyEtU2KWnSTLxajZpJo3t4LkID/vIQT0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dAkMB5j8XZoC7pT3oiB3IE3IATbVnvlvFMLbfF+1Ks4k7RzbS6mdbKIppBntJxXG2zU3tFPe1Plbr0XvJycTufNsFNofEC//gfDGecuSRtGJMQY4EEuoeSFyWLsrCAj98pS2B+ealcLBCh1e24XQipFM/75D/etZoyVmEmp/R7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qLG46Nfw; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qLG46Nfw"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-473e18559b2so1368614f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783321654; x=1783926454; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9KUrzbaJQC6Xrx/utKgCBD6Z3BLENLPOFpin94j9wAk=;
        b=qLG46NfwLFRPit0lUzdcg9PM3+R153it5Z/VrkY+LRd39PQi9oK7QkzG1NWf2IApYW
         mYH9WqfHR878jJkjCBEbaKMvdfmn2OzBif8w0p1islmrPs28qo/yoDQJWcvjEIvksrO9
         cxNhLV0bFZbP3q42MVx4OOu3YWAUEpwugNyAp9v4BLSkSyKcPCRigSVUTgfeeQ01twcf
         3WJaaQxWwSJqTLBdVOAcDfe0RTomW54ZcdgIaDCAJ8SLJQyqacuBr++UGbdc3xpQbFAo
         XikZtPbsO4PSQTQiNEQ9yirSoQk4WbmV5k1oHkxCS8qB+M15cNBaHifSzUAh43ap89Pp
         IWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321654; x=1783926454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KUrzbaJQC6Xrx/utKgCBD6Z3BLENLPOFpin94j9wAk=;
        b=focaLGMffRhijsW/0rOlumsbbseZpp0D8tv/RhOc43hEe9m23nm49TRYrcHtvFSnSi
         ETy94QCOEAzWOC93aiRZ6z6nOtRiCVgtqTHn83c8g4WS2ydOVE02Jz0FNLSdlBXY6MLe
         gIDlRk8r0lvqM7ezip5gD32u81HY1Rl9rEpBU6lxTlb5valqkFWj35dWLGsfOp/GpYde
         wApdrhCDmdA8XdmRnUHmHM6TEZG6TfxQoVwl4JsZvR2D1//5el7y2UlEJ1kUqMc67mkW
         ViPWn0d88vFk1u+ZSU599slM6t6XJ1RN/gQmbGrPvQYpC8Z46nNghdvgRL620tV4js9e
         WE+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp974wnWlXlsROqdtmUvWmjmTWaS5Fk9H4btMQoM2bvXPrm1BLDrZw4ZR7SByX5T4F6NshHbVI/IQuji9yBSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWBHUoYo9ezk8uMvnkybVtcxdYfZdLtDRFeic0IjipY9l8Ff0
	eeDKVJHwP9jaan91IjJIipSX55LKC5QH0Xa4a79I/btMtAjgvl8duogil/0dnSr8SHh4i3FynNr
	M+UlwX3ZpLOl3WdFXaw==
X-Received: from wrbfq16.prod.google.com ([2002:a05:6000:2a10:b0:46e:e0c2:b4c3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:299c:10b0:46f:7127:9f70 with SMTP id ffacd0b85a97d-47aaabde0aemr6910526f8f.18.1783321653615;
 Mon, 06 Jul 2026 00:07:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 07:07:32 +0000
In-Reply-To: <20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com>
Message-ID: <aktUNAUerQ7rHN1F@google.com>
Subject: Re: [PATCH v3] rust: iommu: add device lifetime to IoPageTable
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, samitolvanen@google.com, 
	laura.nao@collabora.com, boris.brezillon@collabora.com, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 05:28:44PM -0700, Deborah Brouwer wrote:
> Currently, using a raw IoPageTable is unsafe because the returned
> IoPageTable is not tied to the device driver binding lifetime.
> 
> Since device drivers now receive a lifetime parameter <'bound>
> representing the interval during which a device driver is bound to its bus
> device, add a lifetime parameter to IoPageTable. This ensures that
> the returned IoPageTable cannot outlive the bus device binding.
> 
> Also remove the option to create a page table as a device resource since
> currently Devres is not compatible with resources that have a lifetime
> parameter. This option can be restored once the lifetime-aware
> wrapper for devres is available and if a use-case appears for it.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
