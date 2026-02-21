Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF333123A
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771673105; cv=none; b=fVrSrEa3Isw/0DktvZpWhGIGXdZhlJp2c2qpuBrQ0BAKkcZ6xIWpvzayKjyPcEDnR/Sytk0UlVt42Dv5xfRUTcZxDZU9/1mUHrN/LshFSXOAP5jZxOaE441sCsGoIINxyrIVSU2eGC2CIazJzQ4/2qOWE9IRpDXdIPAxlYcy3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771673105; c=relaxed/simple;
	bh=o1LdGKuIg2lJhcTCWvDo9wc92gsJU/DYi97mysqhTrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UtGO9IB/cj3bB42dbM8piiKjZQpDvIZlv1cQilsal7HfxE1VXPDlgqRVFUTcmmc+Ci8phSLTELtnooh4PyPeRDtFnTGHVw0t31xpVAxhiqYmIAOvkPDvjhGLUCzcYKa1TLBkORWi6wAt/aMws1hDWPnEi5p12pqkWlAHjouUpLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0N11Yfrz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0N11Yfrz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836abfc742so18641665e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771673102; x=1772277902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8YL6PU9vF9SwHv8rkTr1QPaGp/GGsGjVuq4QPNTros=;
        b=0N11YfrzSiBC0H3nfymZt25Q6eBiv/45g3XoT+17YMwfdJUOXjn7Xq5TndSy64jDTY
         LUT+aBUAy4RtANcobHVFM3TV7Y18zLwGMnkL0unqsNOydutiWt9LY066HRaOrcDFHQ8z
         Me4/UdJn5FBmgJNqxvuvT0w0DDEUsRlhifTBB3hDcKURwMuF+6Ej42+LknQ6TEqjhLys
         MgsQaUIRu34YoKMFLQfl1BWA9kdecKzkKm9J+iAlsSYeYKRxtqrju4EQdl+faQHgcX5s
         mD40Un1y50Oq15AXlzQcFyh13OZzURIeut27Q1w4gZpSVE0anMKU6bnwWclBy4DSHf2/
         Guqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771673102; x=1772277902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8YL6PU9vF9SwHv8rkTr1QPaGp/GGsGjVuq4QPNTros=;
        b=RWMM6WmJj6e5Fbgovz1q6q/lf+atDe5Vl4/biuKVQ9pT77c2Wx7gSgt66gkpds+qSU
         rDDD740Nspy25RXmSFQKveTryIf7Ijpy1M2Izs3UpGtmUOBQbYgInW5/AgiSvbGrhIXi
         3lcvKoEh0z6EdSGoGs0QpXOzWye1tQik+UBlxT89t+HJO7o5XRKQdili4g7kCpRYSRCM
         Nw5yy5+lyKRvAqWKmco2iXSw3vEiZdwnzz3cMtDfsCGdweEUGNIz6TjaPkNndE0hEPft
         5ppNkWR70cZD784AmgP9wSgfXGJzTH4RoClPe0iQClczsrsTJi94I6ZjQ2CSwjNwr58r
         pF2w==
X-Forwarded-Encrypted: i=1; AJvYcCWiPl2XnEfI7vpg6gaWuPIu5a/kmbSyFxsz1qvRjBHsYUf0WTInAdWshRJ0lyibgPGS30avJ56qMQed+EKb2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLm141LYhMa7tzn3skxlo6eLkE1TL7gvPD6YbqYQ3HkH2hPOtN
	GAkL1p5F1lSkhEco34iI2JpWiQhnEGIKu7CDZTEzgVqn3DLQ9XPRMcPbrGH2y/VzLkJH+9nGGrk
	kyD6RF1hkzhbISUXK3Q==
X-Received: from wrs11.prod.google.com ([2002:a05:6000:64b:b0:437:812c:3178])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c2:b0:435:a8e7:62de with SMTP id ffacd0b85a97d-4396f18f942mr4497791f8f.58.1771673101699;
 Sat, 21 Feb 2026 03:25:01 -0800 (PST)
Date: Sat, 21 Feb 2026 11:25:00 +0000
In-Reply-To: <20260212013713.304343-13-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-13-deborah.brouwer@collabora.com>
Message-ID: <aZmWDIITgaEGkTU0@google.com>
Subject: Re: [PATCH 12/12] drm/tyr: add firmware loading and MCU boot support
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:13PM -0800, Deborah Brouwer wrote:
> Add firmware loading and management for the Mali CSF GPU. This introduces
> the fw module that loads the Mali GPU firmware binary, parses it into
> sections, and maps those sections into the MCU VM at the required
> virtual addresses.
> 
> On probe, the firmware is loaded, its sections are mapped and populated,
> the MCU VM is activated, and the MCU is booted.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> +/// Loaded firmware with sections mapped into MCU VM.
> +pub(crate) struct Firmware {
> +    /// Platform device reference (needed to access the MCU JOB_IRQ registers).
> +    pdev: ARef<platform::Device>,
> +
> +    /// Iomem need to access registers.
> +    iomem: Arc<Devres<IoMem>>,
> +
> +    /// MCU VM.
> +    vm: Arc<Vm>,
> +
> +    /// List of firmware sections.
> +    #[expect(dead_code)]
> +    sections: KVec<KBox<Section>>,

Why the box?

> +            let section_start = parsed.data_range.start as usize;
> +            let section_end = parsed.data_range.end as usize;
> +            let mut data = KVec::new();
> +            data.extend_from_slice(&fw.data()[section_start..section_end], GFP_KERNEL)?;

Could this access be out of bounds?

Alice
