Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF147ECF9
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152757; cv=none; b=rwL5D1jdgxWajukgJFoC5onGchj9CvJPoMLqiMZ7SiX3UVocelGhglMg6GE4kGEwUpamrT+NnTIKOu049Q2hQemoXHrPlDqn9pbqSweWCDO/sYiFgx5fWGmzjekvi1hzIH0kXBdnx8oDCztbJIBvIu+jKDK8u8ywHerRiJrcnFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152757; c=relaxed/simple;
	bh=NoH99aicsFlriFvr4iO9OOUEPgUPA3yDZM37SVANJLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n/F52UJ2G5ma3Cyl5Q2Mq+/wg5YlWOc8UlAuE7gCf+JsTclZv1cWoN9tL5U6cfQXBrI1JUPJJEbuWLDDfvl7LoX0wcUnEpftmSFB595OZix5rG9ZseIkoFaaGBGi6XZRjweJ0187Ze9U0iVDIM4ozxhxWnMlThtiJMkB2PdnZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNA6xt86; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNA6xt86"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so25092105e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792152754; x=1792757554; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=NNA6xt8632OBb2w6c8prLrVzFmwuext1C8QXNfJ6sc8j54V4Bue69P14B6aEu6tXU7
         Ae9op8hBbsVgAkZplzJCciFoPlAQ4inBT7RNddS5xEPiGc1ukjLgEmiRqSQeC1QcgmZl
         aku+4MW4Ez6DVpzs8jnTQOxQH5riiI/+czMCgj54eD2Az/WK51UuXhrCAXg6O8qx74pt
         qyNpVHp4mslAPix/yo6K6UM4IGJrLIpeZC4hNS9LVQaShiWHbCV5wBOAtzb1xzGFqDHT
         v3NkMue5h2irJHEKRG0weKxBT6M4boaKBvoUBaL0DNjlaDXCfn+VRLwYCd2XncokAFG6
         T8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152754; x=1792757554;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=O1rys20f1bFOt6elvSiUv0H7iT1zNoLbsJMWdU92sP9Ad3u2RZCrE+MavcXxO2Vn1Q
         8SAJ75Sh4aGNGgO0al1FssLteMUEcP/dYksLaG+cAY6RlRVo7kItABNOloeSj1tHsxfY
         AOwN/+3yIE8yBAseAVMFKAZXWIVRRQz/w/XG7793F35HOo4jy0sbG8axabZywoisTP6j
         fuqHT9ruFfv9gl8a3SCq4f5UVdiXv1qz4PI6MnsEHw860K/UfX+c3EjDOugWFPbAo6Hr
         95aTk/rLbmNIoMyWw6yd5AcC5m/7ylw1m3MMYScBoJdEjyj+KYRNdSXvKLFowwFUZQa/
         qeJw==
X-Forwarded-Encrypted: i=1; AKwUvBy24VvykSPyI3DOx1e1rHQdRUFVjund0oN2RmOCqW+qwD2Rd1vuymmynjPhjB6eSHpr500dFRqFC+4P1G7FYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVFvgpruVZBM2cXF2e/GFIsLwOOVusXrdAOUtKTYSeYm2oI4gT
	Dai5eBW2Hbfr8LAnkvrCGPnkQRnVs8cw0RM7wFuFWZtBWgV0aCOe4s9gzYJTq65aSUZlrhtOKC0
	IwPycvUlCaYYny7uodg==
X-Received: from wmdd8.prod.google.com ([2002:a05:600c:a208:b0:4a1:787e:6a00])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr446361805e9.32.1792152752925;
 Fri, 16 Oct 2026 05:12:32 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:12:30 +0000
In-Reply-To: <20261005133857.1572243-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com> <20261005133857.1572243-3-beata.michalska@arm.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016121230.3724323-2-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> @@ -223,6 +225,14 @@ pub trait Driver {
>      /// The table of ACPI device ids supported by the driver.
>      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
>  
> +    /// Provides driver's PM callbacks, if any.
> +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>>
> +    where
> +        Self: Sized,
> +    {
> +        None
> +    }

Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated constant
`const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>> = None;`
to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?

Alice
