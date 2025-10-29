Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177FB2C0291
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743175; cv=pass; b=UCxu3f7Uok2/NsFp0mGCxWewZQrnIxgA74h9BjLdzpkYC7vMJvsg55mCqD30nQdui763tOOYgf7nMYihUGemCPYo40UFJBlKA6DlfUAVdnPRFD5qS8IGPv45G80n9P1n54KEby3kVxMkK+qqulmWguKbqtuepqUNWa7NSV0b69Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743175; c=relaxed/simple;
	bh=/rPAM83fDtUY25tcdvmO4Vi857sVIODrXovqIa/r6EM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=L+S6AMVBKx1/dQl3t/K4+p+irbc3M6Hbj3uLSnLjxnhvkQIa/+lORhk44WZWw3UjcgjPDfkPwxbA7iS2BB9m5uimpRI73PU+Rfn5YCK6TD091sKA8RXQNYu/9gi92xtFyEPP1YHIBWqfWlB0V40q2VDRF9Ak9kb52eTQ5W+Kxsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WaUrwil8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WaUrwil8"
ARC-Seal: i=1; a=rsa-sha256; t=1761743168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cnc+1LvEzl3svyQtm7ATuDF6Wud9sdaIugygDC1G+OV5mAEIwiw6hxzeXIAt+DTuauxiyZCsILN48ObxjExR0jtmhZ3wuThKP6LOc4c6HcE2H9jW9a4Yn6pWaz4REqmbpjZefGIfHApxdI2cTN4p9Z/FzO51ZJRiTvE2DLsOYXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761743168; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kdqKVP7iV3NUUFnjDlnqa4kgFFug+Pmq6CenXn9MfKU=; 
	b=JeB1mRfo83yep8q7FOWcj04kVOhtn6eoZ5SnGR7+sm+reS8kMLKfZJmkJv7ORnqlbU+w3bBWaFCC9U6W36m04/rar8HLzVKPlBW4kehYDOb1OXv+7H+E74xIiPuzBXDAQZe0gbC0cAtgnwxMZWuBDYT5mtsrGMe3C8coBXhdM+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761743168;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=kdqKVP7iV3NUUFnjDlnqa4kgFFug+Pmq6CenXn9MfKU=;
	b=WaUrwil8Wz55era0EsTDbBHb2oEyKgFdVGSF1RVM4FoYIIfOcT+89awIMEJC1+f/
	LPYifhmZLEuqX3N2FEK18oHsyUt6gIn8xYPldHeTxA0Oy2KsAoaSQTv0DCAtsooouce
	lwdCgn0OPEN6+o504HTt9upOv29b5TiQALEKyYzg=
Received: by mx.zohomail.com with SMTPS id 1761743166713719.2330861108525;
	Wed, 29 Oct 2025 06:06:06 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON
 INFRASTRUCTURE [RUST]
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251028104433.334886-1-dakr@kernel.org>
Date: Wed, 29 Oct 2025 10:05:49 -0300
Cc: aliceryhl@google.com,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <B9B25D51-DF56-4AB0-8002-1E39AA32766D@collabora.com>
References: <20251028104433.334886-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 28 Oct 2025, at 07:44, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
> GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
> through the drm-rust tree, hence add it to the corresponding entry in
> MAINTAINERS.
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545a4776795e..952aed4619c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8247,6 +8247,7 @@ S: Supported
> W: https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> T: git https://gitlab.freedesktop.org/drm/rust/kernel.git
> F: drivers/gpu/drm/nova/
> +F: drivers/gpu/drm/tyr/
> F: drivers/gpu/nova-core/
> F: rust/kernel/drm/
> 
> -- 
> 2.51.0
> 


Acked-by: Daniel Almeida <daniel.almeida@collabora.com>
