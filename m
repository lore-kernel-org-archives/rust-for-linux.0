Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0F1E5B64;
	Sun,  1 Mar 2026 03:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772334211; cv=none; b=Ggk4ql7YjKBn+qnQxjovFBKZ+aV9RcLCcMxcgcYkzvLFuD0wF1GkOK5+9GCbwK9IIzFS2fN7ZsDmHV3pJxePWnLewKme0RUueJ7BGFkcBHAqfYLUsZXTTcIT/4w4xiGhEyAC89N83r/hjlU0TIMbpqHPR06szFtdILlj5xxN5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772334211; c=relaxed/simple;
	bh=jgg62RNduz6YLPoUe7v7X1oBlyRvWr5Ap7qSHKUMH48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKnZasr8vNejtGH68e1/MJgVK/Zgt0OpaGIxT7JhGUf9ja8Qvv4vrMdvgvGeWumYFRwcam51HB305Ud6HwerW8ejBTin5F9MgpEhGwN/2rdZyT0K+jvw9JWifIzdsu1OTODQDZE/unoL9VMjdByEatCbxL70T3jf9UC5VAlO28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EVspzjq7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EVspzjq7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=O8AQRwkuen2J2VbPw4OAhdRbe8PeJJKYGBh2E6Vfdaw=; b=EVspzjq79oLNNa56WDjYtDF+JC
	Bx3WkOv204TCjyORd7t9CZ1ARwuH/0CbDO4cvHqrgZgLUguInBGr3Tvcqhg1wwGyeNCOYoy2j+anu
	sfLXNl2LfXr2/mfPKfQMxNdpKw+c6bRKcBm3jadrxHdRZWtkwrfQ11/L3THgbCeQPsGD2pvPZWEgJ
	Kz/m8G0g58CTreOxRBLno5q8+U9p5R3WjMxNkHAMstRpQWzkZ+V5hfmF/PakQUlYA8oLfZ4++Bpn7
	0a4ycPB2091dyXEsAtPSeDPUOU0ejKVVEaQE9qm0h496EmzyfMtnVbrbI6aa73zfYYs2dTtrZHnBX
	3GxXwK0w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwX5M-0000000AmD7-3feh;
	Sun, 01 Mar 2026 03:03:12 +0000
Message-ID: <2512c6a2-df8d-41d8-8d94-4c004cc60f86@infradead.org>
Date: Sat, 28 Feb 2026 19:03:11 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
References: <20250306222336.23482-1-dakr@kernel.org>
 <20250306222336.23482-5-dakr@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250306222336.23482-5-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
Sorry for the delay. I just noticed this.

On 3/6/25 2:23 PM, Danilo Krummrich wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca11a553d412..ede8abee210a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7450,6 +7450,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
>  
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/

This is merged as commit 54e6baf123fd.

Entries in the MAINTAINERS file are meant to be kept in alphabetical order.
"CORE DRIVER" is mislocated. Please correct it.

thanks.

-- 
~Randy

