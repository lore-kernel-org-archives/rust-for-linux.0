Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B92165F13
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732923073; cv=none; b=lwiaGfLt1uLefdn7zS8484je9kmZ/8N3Dp4sPcKBNc7Trqos2u+XY3K8SBq3JbfYGKu+6tCFCV0r1GohZG4hJc9cPEpfu4zZjBYWoBWeTkx3tdNlfbic2fXpOb+wkutfxwvjkrRZZig74JW09XiO8/W5SfTCI/cAXPYWpXkMeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732923073; c=relaxed/simple;
	bh=TzeLF3QcB3Hf0datyvWeAMYglj1yvT4eY0FnhcZxwBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK/t/rK1yjZeHAz+nU+PGQsvWnW4bpk2/0Rm2+1s3vYbyD1alYU5KOMs/3WSgtDVPOy04DM1EVWPAaAjDzU1AMrOQb2LdaLhNcZxeQ07EOZELwWMBEmJQ9SEcSXW+Vxbys54M1LJ01kqsIAgb3FwUAm+0c4da/2kWugGAnG9b0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zr+fQ40d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zr+fQ40d"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a10588f3so15145565e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732923069; x=1733527869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fwf2ZpyKf/ZtBImPmb08+6DmBeOBIjCMYguEVZ/4P84=;
        b=Zr+fQ40dl0sC1Eh4pSzOJ4uK1FzBZrQ7eWXHmyWD//HEI1FaO48TvjJ0hn06SsPdN2
         +M4KM5DoS9008fGk2+3P++o6grTTYD0WtYuAv3OtPNnjcPVtex278fkTpqYXU98xRdK+
         MMLjk0NY+zMqB82VCOHu5dTHTrYv1+zp/fu7T+Iblyghavj+P+K4APDq0HpNfOadctkV
         MaRUQAaSpMiCVCx6oolbJtxlpWTKQlnSY9talsqG7qpYfbM5ZHJuUv7raXg+XOh8bmNN
         IoPHD72JPXutfQBiSi8pEUzSTJhbuILtx00Xok0HxQZBitN2OJsUh39RYbKLCmWKjaCi
         KV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732923069; x=1733527869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwf2ZpyKf/ZtBImPmb08+6DmBeOBIjCMYguEVZ/4P84=;
        b=sNF/LOwlgB3b+yrz2jhsb5PUotqYK0O14sZh0qzPxUTcdn4EyuLDqKxMvwQFWTXvQa
         REx1RV+okDCKDZn6otv3JvRxpc0x8pemsliRbzY7fJC1VhK+lFZ9TlgBDe8EfFEbMwO5
         gfsNhwlpYdtU5YTFMBhYmaXxPo9CH2sEUGEWuFTOhZqWyJo8RSn8p5TaeWbs18zrYX7F
         dxUPMcEfT/s0D9fV0jKHnV9fZo6Z9hYnAnhWUewKQ4HR+1XMKzpvn7Vv4Ti6MYR2tk+G
         EbWoymoGvsttunic7bkbBCPSpgpjky8zhAJSUMNol6qpbDh124lZCXZ/X3Fo/S25hfDs
         vYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6S4fufM8eLMlc3x20VPyqdeDDIr3OVRC4ah78MdJukPyH90L5zv/ommXbSpWALbRvR6TwH5Pl5oMIqk7AgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztRZduxlEDrWodFqVgswR/5eTSs5Sl77KgZNpPBf+jr8xD1vGR
	/icRzIk474WOEcruq65d0XFkECcaFy/lgKKSWCtEDJdd0RkBhpdLTgbIN6giUHfyyXO7IxqDFDA
	e
X-Gm-Gg: ASbGncu5zlvusLiBge/0utwAQn73i2mTNgisTISx5RodVa+AHCvEJhPg99Q56cq42g5
	iDBHlsjtOhFbCy21CCjHAmXZthA7yz0EoaHHfgXBZejy7ZzyXtAKR4fnwLEaRpGhSZR7M/jeG5/
	wky2f3qZW/Zc5gzprf5g2+buNmXPqF8a6hUMkPVpvPNBdVBb5CJcj0FfCJXXx29YQVMUVsJ9bDc
	lEsQMfn27KaY/0NQYxAC+FfSWScgo3zmEIEOd8JnoF9qFyxbTXqno6dhjAS4UONJRMjqauF/6ZE
	3/gjRwDZUZE7PMEBF046r5R3
X-Google-Smtp-Source: AGHT+IEykCxTGZMCKJYW5Uspz4zr6yyrHOVmE4xBgO7Vj/5z1tSmuzot/DIJMWX3+1MAZ8NoNO4Q3A==
X-Received: by 2002:a05:600c:1ca7:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-434a9df6aedmr110283385e9.28.1732923069512;
        Fri, 29 Nov 2024 15:31:09 -0800 (PST)
Received: from ?IPV6:2a01:170:117e:fc:8db4:3ffe:8420:e745? ([2a01:170:117e:fc:8db4:3ffe:8420:e745])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7dccasm66191865e9.43.2024.11.29.15.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 15:31:08 -0800 (PST)
Message-ID: <b453017b-d719-4984-91d9-f28d34352d8f@linaro.org>
Date: Sat, 30 Nov 2024 00:31:07 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] kbuild: use absolute path in the generated wrapper
 Makefile
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-22-masahiroy@kernel.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240917141725.466514-22-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Masahiro,

On 9/17/24 16:16, Masahiro Yamada wrote:
> Keep the consistent behavior when this Makefile is invoked from another
> directory.

This breaks building in a chroot for me. I usually compile the kernel on 
my host and then use some tooling to just run the "package" step of an 
Alpine kernel package definition. See

https://wiki.postmarketos.org/wiki/Compiling_kernels_with_envkernel.sh#Packaging_kernels_built_without_envkernel

Since this requires mounting the source directory into a chroot, and 
then symlinking the output directory to the package "src" dir. It relies 
on the fact that make can be run from the output directory and 
implicitly relies on the include being relative since the absolute paths 
don't map inside the chroot.

I'm not sure if breakages like this justify a revert, but I noticed this 
issue in -next the other day and thought it was at least worth reporting.

I wouldn't be surprised if other folks with other build systems get 
bitten by this too.

Kind regards,
Caleb
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   Makefile | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ce646a6994a6..9f0ba07e8f25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -643,8 +643,9 @@ ifdef building_out_of_srctree
>   
>   quiet_cmd_makefile = GEN     Makefile
>         cmd_makefile = { \
> -	echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
> -	echo "include $(srctree)/Makefile"; \
> +	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
> +	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
> +	echo "include $(abs_srctree)/Makefile"; \
>   	} > Makefile
>   
>   outputmakefile:

