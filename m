Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD81DE88C
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751181263; cv=none; b=dzp+W20bKkb/ytDGTDA3s/c6RkjYiHP5bp7quRnWL5NIExQaaucBKgU68quZhaGJrh26xBY4kpQ9k7CMEQs+28JQBmLf1qwjC0oxu+P8L46GCDsmsHA2VU2NWaYvhZ0/HhGf2ffuYk1sjJBbAL9SNQhvB3NpBxgfBLIMjBhY5Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751181263; c=relaxed/simple;
	bh=J8GQT2trkTb01E7MlkDuPeYC87iUXGHHCqRIpxpFgDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OslV9QbPUYfS30zTCpU3m0WwgcCAcK/EGZE9Ax2xof6igyhO6HNbvp6G4N8BLY4IDsMdUMMcTMPiP9tkpj5yPpMXhoeNFLlTPA4D5zTANpeK2U35Ix7GcdZBwVyG2igeSSF4FfMUw1A/K/QxSIpFsG5H97PNTR9Q3v61YKmuCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=inxUrbOa; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="inxUrbOa"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7490acf57b9so863069b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1751181261; x=1751786061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozDbBML7YtdYOzaZLTQmITakoUDWV09n9sOABaWE4oA=;
        b=inxUrbOast7zN6/ywUy4/VkpGV5kQFrciMOk/LygGtvXQDhlLoE4iMLtDNxcKyYskb
         ianQX7IsrIE7uucCOTNucOYrRvu/awz9faQXJGoQY6HGE/S2os3cQ4HcPlOfZ251a+LJ
         ILzU3Oo3GMGPxD2hLRlto4tybJIjVJb3c3j1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751181261; x=1751786061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozDbBML7YtdYOzaZLTQmITakoUDWV09n9sOABaWE4oA=;
        b=A0wDjSafhxnJsj+g0xbcV/P9/RMbakFozvKN3WN68/d4TXph2epcKavbvlq/T1oCpp
         Yt1K+Vp4S/GKpuK9Xn1Q2YmGWi5fisf/M5JrSu0enEXMU2/e//ez2arVKyk/DL82u38a
         ObIBu+m+P+AGZ5Nr2cVDmgvV6YrKtOVpgerY+OMoK8jhxJgi9M9gND0+MZwPwXP9hXQB
         lOlA2lz/rfcfTkG31r+3D503537FGMLvW5ulaGipcyUnmkzb3c7Z+CMRP8qc07OzrcUE
         uVACQ3gsIodCjzcHQFa1MDpY0gpZbNYrVsO3DzBpFzQiC76ks/j323/Ha03+HPYXVP/K
         wgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXqAnCiEwhtQStPCK1svyjdM+LWUVLsF7+U7hW+J7F59936Nh8rKB3zJmnWDARaoRMEsS8qUmbzAmSQLu7VfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMJA9WKRFFmHlIN4U+OMCi+qiYWHW1WtTu6rHX5WXnsQ4suth
	+lPu5I0h19e8Qs67lKy46ja7d6O2P2jWLG8d07cErVsf3F3uAwDGlSzgo4ZGurCahw==
X-Gm-Gg: ASbGncs/LthHGhOMoXRqRxqCR3vAeA6AzHY+44j8iGzikSr5zyJKwDaTcCR52mD/uYG
	onBYglb2V6TA6iGw7CKzChNYEghxAwh5LkrshrUJhDd4062ObcIMN8UBJfpg67a0DIG8HC1nAIC
	KWbB2mopk5tDl8abIhDcGXwQVcOSF2X+i3RM952GshDWApV05zWiyXwo2WEHXawsL5En+1/p61N
	HfQASeanY23FF7LonxPPjzGuNb6ITQgCAl2VCu9mgeoKSAuCj6XdtAVK2npxaUDkKOiGuUZ6HBE
	2wDtZL48afXuculp1yILj0rqbh7eeLHZqScO/tGrlcbwhRUQdLoXPeb+OJP8jsCCpsHAyoQzlqi
	3xqe0OkIHogMQxmkiqm/vgRJp3Xtt/3QOT4Q=
X-Google-Smtp-Source: AGHT+IHtG/45BDZt70yMwwuz4Y6ZIXl1jatRRQgkfDIMJeFfDl5ARXbNOyDtGoGrQYqRCFHKlnXo9w==
X-Received: by 2002:a05:6a00:9094:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-74af6e61c70mr11839656b3a.9.1751181261080;
        Sun, 29 Jun 2025 00:14:21 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cffccsm6282694b3a.130.2025.06.29.00.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 00:14:20 -0700 (PDT)
Message-ID: <954c0915-25d9-4bc3-ac82-452650902a3c@penguintechs.org>
Date: Sun, 29 Jun 2025 00:14:18 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: pci: fix documentation related to Device instances
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
References: <20250629055729.94204-2-sergeantsagara@protonmail.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <20250629055729.94204-2-sergeantsagara@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/25 10:57 PM, Rahul Rameshbabu wrote:
> Device instances in the pci crate represent a valid struct pci_dev, not a struct
> device.
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
> 
> Notes:
>      Notes:
>      
>      I noticed this while working on my HID abstraction work and figured it would be
>      a small fixup I could send afterwards.
>      
>      Link: https://lore.kernel.org/rust-for-linux/20250629045031.92358-2-sergeantsagara@protonmail.com/
> 
>   rust/kernel/pci.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 6b94fd7a3ce9..af25a3fe92e5 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -254,7 +254,7 @@ pub trait Driver: Send {
>   ///
>   /// # Invariants
>   ///
> -/// A [`Device`] instance represents a valid `struct device` created by the C portion of the kernel.
> +/// A [`Device`] instance represents a valid `struct pci_dev` created by the C portion of the kernel.

Should this not just be a "a valid pci device" and let the type in the 
function definition speak for the type instead of duplicating the type 
name in the  doc comment?

>   #[repr(transparent)]
>   pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>       Opaque<bindings::pci_dev>,

-- 
You're more amazing than you think!

