Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A839526B
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540366; cv=none; b=U4hxx5LV1EGR2KemPjBffnmV6cnxQDTdNDwndX/EqHDeP5YtFhLeV10xd+hsHJkoQcGJ3dN9Z1rjR2xtn83jft//F1RT1MIC2cDabO8OtQi5hwQD+nfb7fCDv2N4L7i+T9uOFxDHyESULZetb89hjgQFLyMPBkGjj3SVmM50DOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540366; c=relaxed/simple;
	bh=o3bO4FAjuxVK0962UiL8rrguCj8OrcINAutnD/Afj4c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qLaNW1UT8MEeXda9YtGGOBJN96M9kguhl1yB7QLYe1tTlpwjK+f1BTCgeOqJLEgRIiPcESrf1ydzGSXUKAjcm9IuXhtpH3HNzhh8iLt223Xban6WuWiy/pkp518HLXGQKFSsxntBe2SuNj6HPVR+0kF1SB6b2gK0nWSrWMWqB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEqJL9dh; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEqJL9dh"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-44696b11265so794300f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777540362; x=1778145162; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8Z/q685PmwcT3tK0xjwvFofcgEB05Cfirscbd47U4=;
        b=oEqJL9dh943pzVc0XpvcL2nBYCSHeF8oC0berfukxf8qxE2wcsal2baoKmcWYugL4x
         GhCRu4H2vjafUhWXCZ7YQ8T7ZruK19P0gMPVNCTSGrzCHB8ylOnGamcs5qcf/P+E/Zak
         bmLU0sSvZQLSlhkO4pZMdDv03xaUYwBCsUUKVeEiuE+bmHV25ivK4gWjyzaD4B5Wm7hQ
         cKWS/vqVhIcITd4OIEe4LYB4AAbzP4tHmDKQTqaaFACHldYef7whDmKYpct7IdVIHggA
         BtFkcmsxWJjaBnvDIxeADKtw3zvgi1i5qVRr4oM2+GPuaYlwb/9VXs8e7imfr5aQUIlo
         dhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540362; x=1778145162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8Z/q685PmwcT3tK0xjwvFofcgEB05Cfirscbd47U4=;
        b=I5ir6wLfeCcuKtpb0RTtcq+5m7/yKA1qioqZ/JHl61xk1zkPunbis8BXemqg+Ke+9i
         ze5BFBgpg1P5qqa8tIq7prdMkWhMGCt+O0CEYr93he36qVV0YrN2Xn1gjIQiMViojfze
         Ty4f6iuj4IxbZduN8z5lzOB4iV3kpiaPsO222TYGC6rgO87zukR6b862v3OZUnbiUXmc
         L7W/VSWci0A9qiWlLA0f98usaaFIB3xS/qG0Clr6W5RBeplfxNaXMFm3E+C869zyLEwS
         H/wkL1CRI+j332/nv6Ok/1MJSqM8t8uL7ahJoVvCimUCId9884nzx4oWm+zGs4ZN2dD7
         b7Rw==
X-Forwarded-Encrypted: i=1; AFNElJ+9QyfYOy76Vq2kQZ7C66q3vINXE3Sf1eWfLEXSpJB+80e39DQxzGan8R7fFnC21lqr5ArINaI0GJpWomSF6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygPdqU4sQpl8hiE3J/Q53E4thdUKHG22/IT7kF2WMqXPPEII9P
	mDO6YF1r5SW3H12dgMGTkp1CQmtdfGal+D3rWR8JAStgfziaUGzr3JGdLyaUYkILa8HwBTPlp4z
	55W2sgVBZlX4XidxUpg==
X-Received: from wrtw10.prod.google.com ([2002:a5d:608a:0:b0:439:d5c9:3b63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f89:0:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-4493d7fa1b5mr3355911f8f.5.1777540362054;
 Thu, 30 Apr 2026 02:12:42 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:12:41 +0000
In-Reply-To: <20260427221155.2144848-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260427221155.2144848-1-dakr@kernel.org> <20260427221155.2144848-2-dakr@kernel.org>
Message-ID: <afMdCU06-Y2d_LXh@google.com>
Subject: Re: [PATCH 01/24] rust: driver core: drop drvdata before devres release
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:10:59AM +0200, Danilo Krummrich wrote:
> Move the post_unbind_rust callback before devres_release_all() in
> device_unbind_cleanup().
> 
> With drvdata() removed, the driver's bus device private data is only
> accessible by the owning driver itself. It is hence safe to drop the
> driver's bus device private data before devres actions are released.
> 
> This reordering is the key enabler for Higher-Ranked Lifetime Types
> (HRT) in Rust device drivers -- it allows driver structs to hold direct
> references to devres-managed resources, because the bus device private
> data (and with it all such references) is guaranteed to be dropped while
> the underlying devres resources are still alive.
> 
> Without this change, devres resources would be freed first, leaving the
> driver's bus device private data with dangling references during its
> destructor.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/dd.c             | 2 +-
>  include/linux/device/driver.h | 4 ++--
>  rust/kernel/driver.rs         | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 5799a60fd058..be59d2e13a15 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -593,9 +593,9 @@ static DEVICE_ATTR_RW(state_synced);
>  
>  static void device_unbind_cleanup(struct device *dev)
>  {
> -	devres_release_all(dev);
>  	if (dev->driver->p_cb.post_unbind_rust)
>  		dev->driver->p_cb.post_unbind_rust(dev);
> +	devres_release_all(dev);
>  	arch_teardown_dma_ops(dev);
>  	kfree(dev->dma_range_map);
>  	dev->dma_range_map = NULL;

I seem to recall that we discussed a plan to have two classes of devres
callbacks where device unbind proceeds as follows:

1. Run first class of devres callbacks.
2. Device is now considered unbound.
3. Run second class of devres callbacks.

Is that still the plan?

Alice
