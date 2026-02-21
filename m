Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D3BA34
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664967; cv=none; b=hvai+iqH+aWWXpRb4cVqUPE+jC+k38oL/0otkz0DDZ4/PdAsyRtBMRFDRYkPb6Q2KVhl1ckJw9qsZiGLdrQeq06kWkX7Xf4NN+QGTKkVwWHEwx24PsqNsMr7Z5WAzqz1TJs2PCJ5XpOuAJHHq5iLpinp1BRxPeW3koAXkUH0N4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664967; c=relaxed/simple;
	bh=nXsY1Y1WyV38WfDGxjMkQbSrSZssTBkdbIx3gnImlao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eMByM7ACgbpryrqNIgJ4Ko0LywI8wmoCOOlHJdL5QzXyulrlHrhc6CInoVDWwnMmCLfOzcOOP2cBlJq95u3NuJtUH0gm/ygK8yoclL2XESb3/DcWXDsF6D4+jYRGdSUJp6jpGKemFevKaOlegKKoCoUfp7LsTxYTvJay1mwD0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R1tMn5m7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1tMn5m7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48372facfedso33295755e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664964; x=1772269764; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjL3co8gOybFESLAf7giPjhwsqQeHlhhnyGU8ZVONRI=;
        b=R1tMn5m7mUnHc1c1gU3Vz6m5oDEua3j4HqRRxMleCW3NsQzxKVWzvgrXuBCZdsq4uA
         EGUcQdnT88y1kxtKuBZnBg82p/XIPfozRA/Ll6hxBlFQVDnbBXHjo3UwF4RwTpNO9kpk
         gRb8NAUvH810Z+ndUyXdAia7c5kmdh6dUFG6trNRQxvcQFIALdc9uOoEudkHUyEicoWr
         F3KIoc0kcZrcH3zAzLbXHeZLLU66rXXNstoRNArkB/jgpFT8i9g5a/64BtwA6UxEztMR
         H+HXmPVnSILAYLNL87GJAMf6W8RmXNFX+m8s04riHM8gNEBi0ZNBTPJ7Yoy0C2u3E6eV
         0eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664964; x=1772269764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjL3co8gOybFESLAf7giPjhwsqQeHlhhnyGU8ZVONRI=;
        b=Kv/R/Qv/NYI63RvqqUUtqDHyQ7OaBW3t0hn9OB4OaskGIsof4T9LSnNCMPE/kHvIL1
         aqCObeElL5PZ2Gnm2d8p6664rCEedVp+W5oFwb3QlKirLSL/PE6TlxGtxFx2Av/zRfBM
         CNq3OqskZcqzgE0OyOsm9RUlulNtZO9jiZEiuIUZEejewd8O+QtTRbHWvrJ0iSdeCz1l
         IAdpT7VYYKui+1qhUFpwlRl/LhxqDm/1+J49Rgz1uTIc7LShKS0WdAOryBta7nhnOt5Z
         YgwoW4jgIBQR5HXGo4EF4h0t1tHzU/Oyrq96aUFt4dEsndz7XKM1OVx/xQD4StIB4dCB
         cd4w==
X-Forwarded-Encrypted: i=1; AJvYcCWxiaEufrPRUqycpJ1jj43yNtO+aor4RbPiK/Cpx3KiMIJJZ8iWM/hvuX8gUGQxuMhrszNKH6am+7s4Y3cQGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJf2PtKxy31XbXE1j5tVhXano0Xm4k6en6vNytkbpgE1535xO4
	2/vsL9K80R6NK88GLbzQnZ1ADrx+B90JD44PiHYr7oaSPew2FLgNAGlu9y6D8vuDF5mciIm02qu
	5r9/VOEZiuHkbMJ5Oew==
X-Received: from wmpz1.prod.google.com ([2002:a05:600c:a01:b0:483:8b61:16bd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358c:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483a94a0b4fmr44283405e9.8.1771664964168;
 Sat, 21 Feb 2026 01:09:24 -0800 (PST)
Date: Sat, 21 Feb 2026 09:09:23 +0000
In-Reply-To: <20260212013713.304343-6-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-6-deborah.brouwer@collabora.com>
Message-ID: <aZl2Qzl4knlY19Hb@google.com>
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add register definitions and constants for managing MMU address space,
> including:
>   - Address space translation configuration (page table format, attributes)
>   - Memory attributes (cacheability, shareability)
>   - Address space commands (update, lock, flush)
>   - AsRegister helper for per-AS register access
> 
> These will be used by the MMU/VM manager to configure page tables and
> control address space operations.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +/// Maximum number of hardware address space slots.
> +/// The actual number of slots available is usually much lower.
> +pub(crate) const MAX_AS_REGISTERS: usize = 32;

Not necessarily a problem, but this constant is not present in Panthor's
header file.

Alice
