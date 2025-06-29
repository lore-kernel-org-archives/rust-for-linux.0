Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B24C80
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751181322; cv=none; b=q4Zc0Nw8NSQWAl72vIKqC8nXkpX26NLq5o5EJ0eiiAjWiKfl360Iet1tMLAMmtvluTaGyxNlS6PDW5wSSClWJ8exy/emLKgkMTpt/tQ+4rM0huWoxxX9o6h/6s2xYFW9w3q5SkKH4BPuUPrdp5aTzuxcGfmXB/9xcmq0ghKTXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751181322; c=relaxed/simple;
	bh=J8GQT2trkTb01E7MlkDuPeYC87iUXGHHCqRIpxpFgDU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NCs3cKWj/f0vGTfu522Bpu7Jb2WQVDyGlaFKreNfM0EfDzy2rQORhKGenEpScuJ7q9+LYFij5mk4LVJF2s7bgZCHKo8rD31VipDonlZNWrqFyrZo6sPmLPC/AgHY/xwMtsfr/MxTbkXp6FoEFZbqEKTORWj6cDYOP3Fqg74A3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=cyMTcqSD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="cyMTcqSD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so2219490a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1751181321; x=1751786121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozDbBML7YtdYOzaZLTQmITakoUDWV09n9sOABaWE4oA=;
        b=cyMTcqSD8aP4sVTpeA3QXO+6/RsCJKcgGUdQX0YD738nfmVjIes7jVHfkG3lEKaaOq
         cadeSffi0XuHmUUMPHZOnNr6fF5VwP8KYxriSHxRaBTHqyBNsDL7qti0Ad9IamAqlESs
         ZkKvz9j/+TdjmkXDatF6cHu5NMR2pmPAOyDTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751181321; x=1751786121;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozDbBML7YtdYOzaZLTQmITakoUDWV09n9sOABaWE4oA=;
        b=BcqZubRQYsZweBQMoHzRRb5oevOG7Cy9XxT5BncxY2IPZyo6f2ztMbPfbD0q+wWD9P
         2+HMREcT7xu3W7zZpJC8AupcF+2Z+9efqMnCWYLLrGM8rU6+8MOQeeLr4YAJtj2G605+
         EUZE19665Yb861Af9G5yD1IZ1xe7Hk1V3JJEohIQnqCWZmUVavcFiZsemyn0MVpP65iu
         Avg4xQGWnapVE2AdWrYN7JfabYwE3JyNpA4/PLfxAK7hTLBAIOWhcePUuRvTgxat1ole
         BUmlSnFBtW70K3eBWrQ1g9X/+Q+qI+n0Ew/72O4bb69c3LDWGXsNaB0tnNNrLmh61beg
         HLrA==
X-Forwarded-Encrypted: i=1; AJvYcCXjsh0jpJW8etwnumBZteRF5zcaFdzQKDGtl3z+DgdqVF7Uy8i48Ju30q1jsfLInO1yZg25WGN7ndE8dkzufg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcq4Dx1l3I10Mg6edF05XdIRSgcSq+jnCV/us7yjRH+W2i3E7
	PCAL/JY47uq/BPtogJd8tGiYnv09G3oMDTzkyLvVS9ecX5x5QE/1VRllDYRIsmsjjg==
X-Gm-Gg: ASbGncu2I9WP1JH7g1KzTP8xXw4VHSjPEnuZuKYFH+x1zvsLWn3m+BJi61CwLYICYPR
	EPF1Qjp1yJ6hVkr+2DaB6ZdQjYGMdeLeXMroV3DWL2+yOxxoOx0VHMt9JyE5dqRqc9Zx49BR3/p
	20KIIC2DLTGPx1oHEGdj8sxOkTVVlKicnEMtnUPnS+/Cg9znRKwI0lQlcQG4VUoNQjfxqI5H+uv
	RACCWTd1zPiyAsqfBxKSB4hyo14MPa7b1BPoreQL+hFFasvWQHyGWb2zY6FJwWO6NSqzGFSTmLn
	SV/iUxa1DBWb4bjJBWFwc6aFiv8q66wQNyZC0AupWbfmLlIfCdPG28fsoGddGd+fTH4AsluMSeH
	Tx/tSdjuOpxlP5B1iaaBCMu6DD2bzVdOcDto=
X-Google-Smtp-Source: AGHT+IGiaTFsmWeXVJkTv2VaiKMWkITWTwekLu0wrtx94GI2QuT+/ZY1FtfDIbmXjtj0P9P/jEY5Vw==
X-Received: by 2002:a17:90b:58ed:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-318c8eb9aa8mr14409504a91.2.1751181320729;
        Sun, 29 Jun 2025 00:15:20 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13a3a26sm6342594a91.19.2025.06.29.00.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 00:15:20 -0700 (PDT)
Message-ID: <ee8636ef-ecf5-4e1b-a304-9a96df1ae4ba@penguintechs.org>
Date: Sun, 29 Jun 2025 00:15:19 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wren Turkal <wt@penguintechs.org>
Subject: Re: [PATCH] rust: pci: fix documentation related to Device instances
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
References: <20250629055729.94204-2-sergeantsagara@protonmail.com>
Content-Language: en-US
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

