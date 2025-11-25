Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB42417C3
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062644; cv=none; b=K8pN/ejcGSqcNqr3XJn9KNSWqYlhRcdjw/rELcKc8yRoFg7+EH3JD/kRNgVHc1XwV2p4I6ewTLMfmcvcy1xe95S22LjRTBT7DnF1GqzRiBjyyx9o4Gndn6NR33UKxWfg2JtrTpO52ZKhwuPaRva80aQcrEjtwJ+dnlH2SiBuD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062644; c=relaxed/simple;
	bh=lQaMeggpSibkoVsDq5NZm9Spvse5PL55lVnAwvvcJWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U1B3Ofj6nIP7CHW68lQzoy+QHYxF46Xjgf/2M95WKQ91oeH3fSULGk2PrMEbuT+bgZxyC0zhq0uqv3MzdoLn3zUNzoS9kZy8hWh7t/Fczk0IAp007NlUOZsd3P2QKv1ZE4Nrdocfelnrcm6gkwu00Xy1OmiicqTarK5yjk4sfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u49vRKDD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u49vRKDD"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47799717212so41488775e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 01:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764062640; x=1764667440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gdct6hRNMC2a33F1SDQTUemoosYNL7hA0Cpixkq+5aE=;
        b=u49vRKDD3X97fgMtQXNTe8jO08fDrin31VucCBIMpm6AynLGjygg9U4WLmlv/XrEck
         LqDblpRGeJ3t0WE/Uxagoco0UZwuBTdPo25uERoMLE7chF9meRdI67M3llxt6ddqYj4T
         u47k5bdrbju4VeJ1amSGqckVi+Ndi2FXBsMuX19LErzDcLiOUmT29nmBRM50uzq0axKb
         o5USn40cYanfdGaEXe/Pg4c0H/dRqUaAhFxtLAf0hPpied44AGfLaynUH+v5o1eYYKen
         npMUexQISR8TWTzHPjBUOcUTDlYL+LT96y7YHAeZCN1T4xqSLDYNzmphakTkD/A3ANBQ
         lC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062640; x=1764667440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gdct6hRNMC2a33F1SDQTUemoosYNL7hA0Cpixkq+5aE=;
        b=OZ+IP52fwc6+8h1BKB4LAl79r0ZFi/gLbP/BjdJWwro1hvr01f2Y/1VPK0oa+fnb5L
         pbXpsGyRcjR0XHhg1OkWrC+TBOmEXWmORuR6WX7StG8HFUsOU2bLPrskMalGupjeOA9L
         cvALlBT5Y8lgLD0m+RWtZyUdcHoHX8RI4r9A6TvcbuNVj1926bvsHxzVsXlaxVQ7Pw7+
         sRAow/pWONTqrOwIyMVC9XSLUHdb7NTngbvg1w7vpY2WRsF6edAkvgD1n4/UdjwAXsJp
         Rch6hCW+pe3r7U1TVzF7PQ34M4e/O7wVWLfBNutOLnDaNuYfZ/WmgE8TUBwSS4czoLLR
         BBCg==
X-Forwarded-Encrypted: i=1; AJvYcCVXF9h6ejAQ4R8iwD9pMU35msMYS6heSrr7qzHxvQzuKmYJVFvogH7tQW/D9xmkpglR7Dvy/v7HzP/s0mcjSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6iuIpyKZIuc4YzuFcaaQzNcoV4V0XQHjMPS5F+sT17SXBLHY
	pAhSY3mi0IQStdwVDqx+VBo77ptl9zmeJckC3EFAFNItbA6ChMjP0vVKUFJVq7MrMuAI3QyYQcd
	6TmDSs3eIwcDzscHpzQ==
X-Google-Smtp-Source: AGHT+IGgXo8y5EZjUDnBVwTOnyAZJVGtwWGypNxUeeXb63lWRcPTjmeoWUCMdN3xat5RPemCnmCh9NC4gbF2QE0=
X-Received: from wmih8.prod.google.com ([2002:a05:600c:1448:b0:477:a2ad:bddc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr162794335e9.22.1764062640310;
 Tue, 25 Nov 2025 01:24:00 -0800 (PST)
Date: Tue, 25 Nov 2025 09:23:59 +0000
In-Reply-To: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Message-ID: <aSV1rxXq4KuInexy@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
From: Alice Ryhl <aliceryhl@google.com>
To: bshephar@bne-home.net
Cc: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 21, 2025 at 02:04:28PM +1000, bshephar@bne-home.net wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This ensures that the allocation is page
> aligned with the system in cases where 4096 is not the default.
> For example on 16k or 64k aarch64 systems this allocation should be
> aligned accordingly.
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
>  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..a07e922e25ef 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,10 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> +    page::{
> +        page_align,
> +        PAGE_SIZE, //
> +    },
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> -        let aligned_size = size.next_multiple_of(1 << 12);
> -
> -        if size == 0 || size > aligned_size {
> +        // Check for 0 size or potential usize overflow before calling page_align
> +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {

Maybe this should use isize::MAX as the maximum size instead? That's a
pretty common maximum size for allocations in Rust and big enough for
everyone.

Alice

>              return Err(EINVAL);
>          }
> 
> +        let aligned_size = page_align(size);
> +
>          gem::Object::new(dev, aligned_size)
>      }
> 
> --
