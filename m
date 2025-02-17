Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438C2253E1
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807301; cv=none; b=kK+xSwZ7bDwdIIgp+tWyD88vY2OwxyETqAUPlOxR3ILAi/4okaVvZOomwD+N8/brV7nK8nHIQyupRVgTMNxMKCpKUZ0+mSAJYkZNUTOHd4+wt+ZG+u1KoMdc1GX/E3rh8WwmiECistJla2+bDAJbRkk3IWKYHTGGnwRwSVbFoBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807301; c=relaxed/simple;
	bh=xPQST4IbdwkBuWEQlgziyUdfc17TPPIa/rFcr4bkzng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBC8msKV51abcz9a4MQv0QLi6s2sBsy3u+JlN/j4HI8rh53buM3K4JcN9263NlfSyyp5CkuopvHF3TPtCxmpin+gcFOQRMQWJN9CbwZdfI8KVCxEpO8PHAadMDHRo07qYTk47TQX2BH4zrJy5GdmDFMskASEHpkY0//v/KqPu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=RcsCqdHR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RcsCqdHR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so27294475e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739807297; x=1740412097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFPS7jWerxORL3qYOvf7GvgH3VVFrmdTXhBMeC3dyLU=;
        b=RcsCqdHRFl0A+OoSkMSgQ9DNLbd//+A0yHeZGp68uPI3+nUz6Scp7Fi3xA4apemIWX
         03Cr5f1HjwnkYuooF6wbmJN44CCEt3oAZtNlrspjzt1sD4z+YOEGT+qfY5YjX2s0SdNK
         sGlboYbzDHDFPhGIc8VjnywbpUF02mk1uNMPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807297; x=1740412097;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFPS7jWerxORL3qYOvf7GvgH3VVFrmdTXhBMeC3dyLU=;
        b=Fo4aHvIcpF2n0mr3LkWS+jP6e2oZZq9YgTTsbK0JxSkqeG5t9SOiPiQfA1xOcL+BDx
         UgGwXhel87qEePIBRR5lwgXNigD67l4gd4WfGBl7jur+U/PnM9UjPtCHAUHLSF7tUXMf
         qYgwbD8rm9UkaLtFrv8K4kltWOW6VTNAaGfxwG82u3imcK45zrlUjIWdY99QnKAq1Ejy
         nyDEjzhy5FSwmy4po1L7BZzXCifFy+u5cC6cl2B0BYBLK43gJK7eRa4t08C7t53cvNWO
         4tNjldFoNmWFDcL1QZD6ULcaBAckjA7651jbXAeD+Th336jKDs1efy6FawnRJn9T41dc
         o1dw==
X-Forwarded-Encrypted: i=1; AJvYcCWQTGMY6AhKW4Xhr3DdwoNfb5sHxw8nUC9oQW46uM9x3e7VsRg7HEmeN5z1OGXSh3LllRXDe2zixb82YEkqfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8lPngERpSspNSjKNoUxUUfbJipqqnCPY/ar8WRsZqxxuStmt
	W4s4/KopimPNm/1DHvVAjDwWlN5PQ0jsgbQfX6ajIS0jxfaNs5e69MXra6AnKoM=
X-Gm-Gg: ASbGncuLNfcsOY8/UogGOxo8D9sIExb8ZwitKNZqJbIPRBkawOUa8AkKCDq24yAJ7lO
	9XYOGYYhvsFMDPklSxl8jVFor0wUOOkiURQceuWQqTq5ROusEjwf00ZoO2EbkRApSy+7jDAkS7t
	buWBaKSlmnt3GWUqGw9EcFOqmkPxLU0EAcX05FvHdIRfMx+NyC+1IwqL4Yw2dJQPSG7zHZMzIf6
	lblWqkNa3M+8Sk4dxr4vlm3qlSRYzcESh+J5Q86d2fJytXyLA4dlsbJV/nkNFHjb+DRtP5/k4PE
	G3r519PukBcyNn46hYVaPTrAAI4=
X-Google-Smtp-Source: AGHT+IGSPCdUDCd1o/i4T/qnIV8TpHBkXWunEDUWfKiArJRtbwbNRix+QBABPgefm77mFrNCuPLfcg==
X-Received: by 2002:a05:600c:4688:b0:439:89e9:4eff with SMTP id 5b1f17b1804b1-43989e951bbmr23616275e9.10.1739807296485;
        Mon, 17 Feb 2025 07:48:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961645422sm75891405e9.2.2025.02.17.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:48:15 -0800 (PST)
Date: Mon, 17 Feb 2025 16:48:13 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7NaPYvuRF11uxnM@phenom.ffwll.local>
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
> Hi everyone,
> 
> This short RFC is based on top of Danilo's initial driver stub series
> [1] and has for goal to initiate discussions and hopefully some design
> decisions using the simplest subdevice of the GPU (the timer) as an
> example, before implementing more devices allowing the GPU
> initialization sequence to progress (Falcon being the logical next step
> so we can get the GSP rolling).
> 
> It is kept simple and short for that purpose, and to avoid bumping into
> a wall with much more device code because my assumptions were incorrect.
> 
> This is my first time trying to write Rust kernel code, and some of my
> questions below are probably due to me not understanding yet how to use
> the core kernel interfaces. So before going further I thought it would
> make sense to raise the most obvious questions that came to my mind
> while writing this draft:
> 
> - Where and how to store subdevices. The timer device is currently a
>   direct member of the GPU structure. It might work for GSP devices
>   which are IIUC supposed to have at least a few fixed devices required
>   to bring the GSP up ; but as a general rule this probably won't scale
>   as not all subdevices are present on all GPU variants, or in the same
>   numbers. So we will probably need to find an equivalent to the
>   `subdev` linked list in Nouveau.
> 
> - BAR sharing between subdevices. Right now each subdevice gets access
>   to the full BAR range. I am wondering whether we could not split it
>   into the relevant slices for each-subdevice, and transfer ownership of
>   each slice to the device that is supposed to use it. That way each
>   register would have a single owner, which is arguably safer - but
>   maybe not as flexible as we will need down the road?
> 
> - On a related note, since the BAR is behind a Devres its availability
>   must first be secured before any hardware access using try_access().
>   Doing this on a per-register or per-operation basis looks overkill, so
>   all methods that access the BAR take a reference to it, allowing to
>   call try_access() from the highest-level caller and thus reducing the
>   number of times this needs to be performed. Doing so comes at the cost
>   of an extra argument to most subdevice methods ; but also with the
>   benefit that we don't need to put the BAR behind another Arc and share
>   it across all subdevices. I don't know which design is better here,
>   and input would be very welcome.
> 
> - We will probably need sometime like a `Subdevice` trait or something
>   down the road, but I'll wait until we have more than one subdevice to
>   think about it.

It might make sense to go with a full-blown aux bus. Gives you a lot of
structures and answers to these questions, but also might be way too much.

So just throwing this a consideration in here.
-Sima

> 
> The first 2 patches are small additions to the core Rust modules, that
> the following patches make use of and which might be useful for other
> drivers as well. The last patch is the naive implementation of the timer
> device. I don't expect it to stay this way at all, so please point out
> all the deficiencies in this very early code! :)
> 
> [1] https://lore.kernel.org/nouveau/20250209173048.17398-1-dakr@kernel.org/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Alexandre Courbot (3):
>       rust: add useful ops for u64
>       rust: make ETIMEDOUT error available
>       gpu: nova-core: add basic timer device
> 
>  drivers/gpu/nova-core/driver.rs    |  4 +-
>  drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
>  drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
>  rust/kernel/error.rs               |  1 +
>  rust/kernel/lib.rs                 |  1 +
>  rust/kernel/num.rs                 | 32 ++++++++++++++
>  8 files changed, 206 insertions(+), 2 deletions(-)
> ---
> base-commit: 6484e46f33eac8dd42aa36fa56b51d8daa5ae1c1
> change-id: 20250216-nova_timer-c69430184f54
> 
> Best regards,
> -- 
> Alexandre Courbot <acourbot@nvidia.com>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
