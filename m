Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FAD1F9ECB
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751566; cv=none; b=r1DcCfSt3+QfGrIVVhCCaE9g78OKnlAiBzSQHbI1+DvrjoxYn/7d+YgVBNK9TYQ2RWMRL726u+8sNodViEbl+MAdVdcbULUY93K5cMZwOgJi7afJ59dEvzlYoS8D6wfFw1vJSlCeJqkgmilw9ZRfqFhdmiLZ1xmBy8b9HflEwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751566; c=relaxed/simple;
	bh=tXfl6AIcuFMz6z8MFhd9WBVT69TwUEd8U39Qrl9gQCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=inrlgxfN7r/H1c0YvUmbjf08o0CsHB2WzlJELiz0tfTcQR6Giq4vm24mDNFvy4SyFmrqH1Q5b4r3LpeV33mMUtx4dCW/UDPM3PuZG0ToPlYY+tTIfswEMv84JqiJAjW6Cwtljc60/epDB7p/8mnY+OpUgvRYyjXb255qu9UAFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zRi8Va36; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zRi8Va36"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so54757695e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766751564; x=1767356364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+W1bv3m3GSUdPTDj1JCdFEpo2xwyf2MGFejhwecAMMI=;
        b=zRi8Va36AFettaWafu8jN6bXDqqU/9SjLNq6+Jm1rag82y3kujXWRq9T0A4s/N9LXm
         zrhaV/peUPoabDT3bbmZRnpD6m/QC4sUKFWVCcEh4STjYoKMIwLtGFuY2ed4COon5lLA
         kgyDmQmC3u34IvA0USRRsbZ6UDhv/3qYKO6H94Ryq915K5e7znsfOzrFrLA8RpiUivFW
         xUWAMNwrcTAZkHSl/3pBQsB7htPSE6Th4s0KTClRoL6G37VYyDCSgowubuLxadpBMq5Y
         tWXMXyVB2UfT1s2p1z8xvpsEdTTJCEogYwE0Ge0IeFEOvws01/fZJtFA+59wFWlMW9BS
         SSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766751564; x=1767356364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+W1bv3m3GSUdPTDj1JCdFEpo2xwyf2MGFejhwecAMMI=;
        b=uaB4ioTbKvgtFuIflUz0HOA7VdPb3MwnRn2qxLWOkRQO7WtkvkdVafvVoXCrBTi+nY
         aJzdiZ36Jso1Kv2w9tPsgoPSBrn38PVZUXeO00LhaoWeWCAQD94Ktg1cS+nwXmB9lKep
         kQWnL+898x0s/IBzlQpSKYLKnhQk8RBDmtCd13L8L06D4u+F8LrKt/+sUKIQGeb01zlI
         96mGZmalITYhYi6F6j0Nl3GaDg5cGseMFp+LqnghHSJQWklh4dhC2+ZDqTlob/YWXJrT
         PoD1TsrDMYoyNLv7lbyD/yxSARO9IMUxOlhm4H3AOPr6qhdFNqxy4mrQrrH8HYkQvk+U
         kAHw==
X-Forwarded-Encrypted: i=1; AJvYcCUI5yFaJieZN+Aq8gp0ABj/kGTs7Y/SOg/csnGjaQbRdHZPuDjqw00Uk93kHR8NsnTvBEMmyIvtFX6lzQIb4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYH0gxzBARMnALxoONdSEqZqJRV2BEpb+7IrOajkv9I7RwbHbH
	AOxsLhdJPIlMUJbkotMgyLy7S64/WjzBY0QpPQL8JxQ3NwmnWzIYgxBo5G+2SEChLw7ZoB1FBgK
	rWdDpfHj7mqR3MsHmUg==
X-Google-Smtp-Source: AGHT+IHfYRBsdxYx8A+M6deC5zdbNM/+BrSSUp5hMyDaov75DGi0YM7QWmPujdqLb70RNtyX5B4BR6gvTl7eCRg=
X-Received: from wmbgz11.prod.google.com ([2002:a05:600c:888b:b0:46e:4c7c:5162])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348b:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-47d276f8aeemr191388885e9.3.1766751563790;
 Fri, 26 Dec 2025 04:19:23 -0800 (PST)
Date: Fri, 26 Dec 2025 12:19:22 +0000
In-Reply-To: <20251223115949.32531-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251223115949.32531-1-dakr@kernel.org>
Message-ID: <aU59Si4Syv6TzP5c@google.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, tamird@kernel.org, 
	boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com, 
	beata.michalska@arm.com, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 23, 2025 at 12:59:47PM +0100, Danilo Krummrich wrote:
> Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
> prevent script/get_maintainer.pl to properly work and pick up the
> corresponding maintainers.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Reported-by: Tamir Duberstein <tamird@kernel.org>
> Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-fixes. Thanks!

