Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E71A76C7
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164079; cv=none; b=aIMxzd0VFuRClTXapJFL3mfMFVkRbJKsAeN2JBhzJkKZ2Sz6rlZAlZ4bVBEEYnRXbsqwS6KqImatldEAlz2ovYlXPDQ1p4nOPQ8QqS4usQmYLXH2Bkd8zel1Ol/IfmajS7C4Fe8BNXS8JEhtT3jonm0RqpaqaNE5CZFor/2oKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164079; c=relaxed/simple;
	bh=h7Qz3YbgMTKfA109AaINz26MBZxVoKCf+WFT5fQl3oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvyFzky0vlWFK7qPNbNDszpTATYvy6NuYgp28BNoHtuXgCKCGScVEChnkq5YKsi6IZdImUbMQCSP+uuqxedIvVOyNrNrEqrlUIzi8EgOWUTPNpIgOw526ozRgESQALNjROfsAMIK/ScQpye8k/GWDCJWlSiQjKKYYB5YlwdqJJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=RJyTrdAL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RJyTrdAL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso12088939f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 03:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736164075; x=1736768875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/MbpS464td/3jT1JH+ipdkzYuHnQoMBAlkST2476XQ=;
        b=RJyTrdALvujLNzaxDWdKghhlmOOxakdR+tCsE/UiHKTvHREYZ51yiEBHdfGPdfA/vB
         E6/H9uRgTfDkVLJzHJrKfvtCOYU/ZXiGikQH8VfZ90n4NxoSDGHRJCEud6JsILZge/Jf
         cxGgJdWRMUj+HofKf9FzX0bVzrqqptIKU6auY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164075; x=1736768875;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/MbpS464td/3jT1JH+ipdkzYuHnQoMBAlkST2476XQ=;
        b=FyKYHN03PZgB9d+bCC6hhXZ09f5YdViCwhsth+gy2eqr2Oknj+LjN1f4iua7SbZf/Y
         pNPWwEefXGHdNZa6df082cL1nGNQKQBy3IK8juWv+3WTtrFcAYWBObUb2qWqzXayVvfn
         /KUm3u8PoKkP4fjtTNsQJiiULavLVxrzbm+IvFPB+MvbS6sE7bVkglGkVPGYbgaoehrA
         HqBl0B/I16a0xLW1+0MFsoIwJBAHWysvk/hlT3W6HVNOjgOIE9euv+Zf7RlekZMYbzzx
         1nv4XmVEiS6FvoIJiUbtKXnKTVBb5sKQ4uxYsxRTSgO+dNnmawHCDBOAd/htKdVcZEJw
         1g6A==
X-Forwarded-Encrypted: i=1; AJvYcCXtvg+yOq9B7IxGH/2nunuwExGFj/INsUV84IkYkRrT0avViBxVspnJdifrOouToOyyN3U4eKCm6SB/X2HI0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jZfyri2Xkel9ImWY9KVMlV//ic8R2DmYbQoIyzDszlnI2SLj
	u3i9BRaoNb16HXSLC+82AzDE82IRky9COJzWboi8mUCdgMaLSss835o1nnCeiSc=
X-Gm-Gg: ASbGnctzPgN2AdSCvw1mVaVfUGB7Rz5D6emtF/0jPN9Te2JRzh+cCT8N79LCwPIkTyP
	40BRwPO64ova+bXnhdVCtHJcSk96Py8C0aDz/d76BIy0HCsp54yZga9FbbNNH8z6tnydChMQnoo
	yPV9Wgzxi8XIl6egaVwoizVEUWqQFF/YNqVreq2ayG6gkA5RVZPxRD8vYVjLp6HCY2lsPNJ4Jp8
	/LRwCpbvc2nL49Sn7W9URrJ+QzUcodjjYac9W0/S2wS7HaHyKowXv2mlXhYQDHh6UXW
X-Google-Smtp-Source: AGHT+IGOflgPU+NVSsAVFlcwWzVQdI7yMInNV0UbkiMxLuhQNqRh80eH22sAZIbrzgYuWOiU6zSQxQ==
X-Received: by 2002:a5d:64eb:0:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a223ff5bbmr52251029f8f.48.1736164075444;
        Mon, 06 Jan 2025 03:47:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847d7fsm47603495f8f.60.2025.01.06.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:47:54 -0800 (PST)
Date: Mon, 6 Jan 2025 12:47:52 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] devres: add devm_remove_action_nowarn()
Message-ID: <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250103164436.96449-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103164436.96449-1-dakr@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Fri, Jan 03, 2025 at 05:44:30PM +0100, Danilo Krummrich wrote:
> devm_remove_action() warns if the action to remove does not exist
> (anymore).
> 
> The Rust devres abstraction, however, has a use-case to call
> devm_remove_action() at a point where it can't be guaranteed that the
> corresponding action hasn't been released yet.
> 
> In particular, an instance of `Devres<T>` may be dropped after the
> action has been released. So far, `Devres<T>` worked around this by
> keeping the inner type alive.
> 
> Hence, add devm_remove_action_nowarn(), which returns an error code if
> the action has been removed already.
> 
> A subsequent patch uses devm_remove_action_nowarn() to remove the action
> when `Devres<T>` is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/devres.c  | 17 ++++++++++++-----
>  include/linux/device.h | 18 +++++++++++++++++-
>  2 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index 2152eec0c135..d59b8078fc33 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
>  EXPORT_SYMBOL_GPL(__devm_add_action);
>  
>  /**
> - * devm_remove_action() - removes previously added custom action
> + * devm_remove_action_nowarn() - removes previously added custom action
>   * @dev: Device that owns the action
>   * @action: Function implementing the action
>   * @data: Pointer to data passed to @action implementation
>   *
>   * Removes instance of @action previously added by devm_add_action().
>   * Both action and data should match one of the existing entries.
> + *
> + * In contrast to devm_remove_action(), this function does not WARN() if no
> + * entry could have been found.

I'd put a caution here that most likely, using this is a bad idea. Maybe
something like:

"This should only be used if the action is contained in an object with
independent lifetime management, like the Devres rust abstraction.
Anywhere is the warning most likely indicates a driver bug."

At least I really can't come up with a reasonable design in a C driver
that would ever need this.

Cheers, Sima

> + *
> + * Returns: 0 on success, -ENOENT if no entry could have been found.
>   */
> -void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> +int devm_remove_action_nowarn(struct device *dev,
> +			      void (*action)(void *),
> +			      void *data)
>  {
>  	struct action_devres devres = {
>  		.data = data,
>  		.action = action,
>  	};
>  
> -	WARN_ON(devres_destroy(dev, devm_action_release, devm_action_match,
> -			       &devres));
> +	return devres_destroy(dev, devm_action_release, devm_action_match,
> +			      &devres);
>  }
> -EXPORT_SYMBOL_GPL(devm_remove_action);
> +EXPORT_SYMBOL_GPL(devm_remove_action_nowarn);
>  
>  /**
>   * devm_release_action() - release previously added custom action
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 667cb6db9019..6879d5e8ac3d 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -399,7 +399,23 @@ void __iomem *devm_of_iomap(struct device *dev,
>  #endif
>  
>  /* allows to add/remove a custom action to devres stack */
> -void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
> +int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
> +
> +/**
> + * devm_remove_action() - removes previously added custom action
> + * @dev: Device that owns the action
> + * @action: Function implementing the action
> + * @data: Pointer to data passed to @action implementation
> + *
> + * Removes instance of @action previously added by devm_add_action().
> + * Both action and data should match one of the existing entries.
> + */
> +static inline
> +void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> +{
> +	WARN_ON(devm_remove_action_nowarn(dev, action, data));
> +}
> +
>  void devm_release_action(struct device *dev, void (*action)(void *), void *data);
>  
>  int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
> 
> base-commit: 06e843bbbf2107463249ea6f6b1a736f5647e24a
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
