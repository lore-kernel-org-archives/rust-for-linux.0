Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC01EDA03
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Dec 2025 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765097576; cv=none; b=syqej8SaWGeu0ATve6r4vMWeIcIuZuWcpYbPryG38TjvzjaerLrAPKC5TrnoF0CZnWJYWkBUelkPRLsgtaeAK0wphHZrXMNIJFU2z+9weDG6CFEV/FU4PrpbDfQPB4/WkShkR4kN4t39PquyzQA8U+5ITX8deaVXzHAeldDfoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765097576; c=relaxed/simple;
	bh=XMqJYBYTtu4XRIcQoWEA3xfw1GeilePurf/OYgdwnSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hck82f0syiBoyv+rdFhAnctn4zvALvaunPlru3rvKvIn2ju+ZR3Lg71KlcvT3UenkNfiozLYx5BWdnj83xyHxkPDkSY5AZZkEE6EpaoVm1tEu8BxP7JcacVvESrVjn4VP8/b5nqBcbdbn3X+bD3Nc8/zk3K4FN9BothoHv6AA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN/1gLeW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN/1gLeW"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b495ce059so26857391fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Dec 2025 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765097573; x=1765702373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5b12hRnRWv6onGjF90Cte/QEE3Sc5Ju08UGYaWm18PI=;
        b=KN/1gLeWCehY+MSO7h5PyBF80nDrx7ts1GvH6KhbROwcgufVBgHYopZJjJuK0ymUh5
         DKauig+kmLW+KmZ7Wp3hHpnV1QOYBnCPZXTupZnOQxOY4SwbMkc4HxSU1Gc7pMgbBSKG
         +IPN393mBg7vzI8M0YXiIvoeMJGgo9R4ySxQMNz84WugEIYJgH+kQvpzn+lBMIOIbSFJ
         v6f0sn19wlLSefTT5W+9j+x8TVchshfiuAY8BB0lkQacTj2p7k3/AYwYmKNWM32FuolU
         Rj/MeRYBDZamxmfBs18BI8yicbUWCpaZuD8Mp/arwVJgDW+haLhyjpw88W82SCJPTdJg
         n7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765097573; x=1765702373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5b12hRnRWv6onGjF90Cte/QEE3Sc5Ju08UGYaWm18PI=;
        b=qmExa5HU77ZiyW300bZHVTVEzWX2sZWbwt0y/DawvDwUZxSgLn2OSmBWtfGpq9eqgz
         D8H0wRETS/JtyS/LRc+q1gncZEa4xAyba/cpi/bWxn/oT0oqDIXUNbTLaSQRToWuCkik
         Mg+anw7Q1xr2YGUY7kuDD7R+zhWZV2hM3mpQlppskDnnXWI0l3b7H8qvZ+a8seYlnslw
         nDyFPHWl1MoIYPu2lCJTuZHyPVgqXqZOqK3unfIpuWn1gkDR3Pnq8ggZjN8F2QL88oqS
         ooCwuCP8d7n7MAdlGmyYyXS6vVPagiEj/i7t1l84GTkdAygl3phJOn1XX5eN4ZSEpbWT
         XfJA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgZsEvux3I2iuk/M1EuiOuQSV+K+6SKBsWrVYc2aK0VK0Y+DTn77MJ3H6+N7aGjo5qjMFsliX7rTKW3wm7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqZeNMZvzLHjtIQ5Wq1YY5DqbmVZHHv8rr5jJO6q1bJTGHkC2
	PX7Eb6VWt5s/grfmaWPvBPNvgjDVTV/XyTfu6bc08CQF9VAva4XW4GOopq7zVQ==
X-Gm-Gg: ASbGncscnxDFbQX5fEznT7GA2i52+KWW97r5L1NpBbToJ2MEaj4zUp7JTri5bAs/BCZ
	i4mIDQTHN5gJXnpT0pQc8Wr77mBQcDg3GlFBoo8w/5viJhhDPTUAe472497YrNOwjWFUqktIxIP
	HvoeWjcENjMw1sCTW49y8K7cX0MQwoe9p+Cx9P09gjLbnPTVbIHHBtoRAYYnnoeaFAWnhINVdf0
	h14dG8y6JyD9OUb8yDhtMa8JCCEPZj3pYoBjDcVgE+gC5eKL8H1jPH8IsqAYN2Bfr58UQsKuHcM
	LgoSyXYr3VyO+6MQAxt5h9f2r2clhivIjklhi03SQC3n9XKLujoRXGXg08NtKpcVs1NvQr00iXR
	yHkIlICmfAZlRJ/9XKhFYD19SnY5LROagDBgy/pbINAdV4+o/xYv6c7RPGqhx+RK9BURUStC6w5
	TsTz8cGDMn5rGs5EoXB0qPkSeKPttul3+sPPcxW0xfUB0aqonuRbXvHln2/Imx7WeACd6BGY7S1
	JkRxCmntfObZpadMm3O7vu+7KzFivY+0omXkc11ExQ=
X-Google-Smtp-Source: AGHT+IHkpbBEjUpSSNR6c1N0xrVq9kG40VYKHC/sRRQKwimb+t89Kzoar8J3mhxBoq7JhZtP7BsBvQ==
X-Received: by 2002:a05:6000:430d:b0:42b:5448:7b08 with SMTP id ffacd0b85a97d-42f89f094b2mr4983612f8f.5.1765091533868;
        Sat, 06 Dec 2025 23:12:13 -0800 (PST)
Received: from ?IPV6:2003:df:bf22:3c00:1c42:64e:ef2a:93cd? (p200300dfbf223c001c42064eef2a93cd.dip0.t-ipconnect.de. [2003:df:bf22:3c00:1c42:64e:ef2a:93cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cc090bdsm18354202f8f.19.2025.12.06.23.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 23:12:13 -0800 (PST)
Message-ID: <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
Date: Sun, 7 Dec 2025 08:12:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
To: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, dakr@kernel.org, aliceryhl@google.com,
 bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org,
 cjia@nvidia.com, alex@shazbot.org, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 acourbot@nvidia.com, joelagnelf@nvidia.com, jhubbard@nvidia.com,
 zhiwang@kernel.org
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-2-zhiw@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251206124208.305963-2-zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.25 13:42, Zhi Wang wrote:
> Add a wrapper for the `pci_sriov_get_totalvfs()` helper, allowing drivers
> to query the number of total SR-IOV virtual functions a PCI device
> supports.
> 
> This is useful for components that need to conditionally enable features
> based on SR-IOV capability.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  rust/kernel/pci.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 7fcc5f6022c1..9a82e83dfd30 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -514,6 +514,18 @@ pub fn pci_class(&self) -> Class {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
>          Class::from_raw(unsafe { (*self.as_raw()).class })
>      }
> +
> +    /// Returns total number of VFs, or `Err(ENODEV)` if none available.
> +    pub fn sriov_get_totalvfs(&self) -> Result<i32> {
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct pci_dev`.
> +        let vfs = unsafe { bindings::pci_sriov_get_totalvfs(self.as_raw()) };
> +
> +        if vfs != 0 {
> +            Ok(vfs)
> +        } else {
> +            Err(ENODEV)
> +        }

In the thread [1] there was some discussion about the `if {} else {}`
"style". From that discussion I "distilled" 6 options [2] which I
liked for having an overview :) Of course not all of these applied
there (const), neither will they here. And all have pros and cons. I
think in the end option #4 was selected.

What's about to do something similar here (and in the 2/7 patch as well)?

if vfs == 0 {
    return Err(ENODEV);
}

Ok(vfs)

Dirk

[1]
https://lore.kernel.org/rust-for-linux/CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com/

[2] Options distilled from the thread [1]:

1.

if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
    return Some(sum & PAGE_MASK);
}
None


2.

addr.checked_add(PAGE_SIZE - 1).map(|sum| sum & PAGE_MASK)


3.

if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
   Some(sum & PAGE_MASK);
} else {
   None
}


4.

let Some(sum) = addr.checked_add(PAGE_SIZE - 1) else {
    return None;
};

Some(sum & PAGE_MASK)


5.

match addr.checked_add(PAGE_SIZE - 1) {
  Some(v) => Some(v & PAGE_MASK),
  None => None,
}

6.

Some(addr.checked_add(PAGE_SIZE - 1)? & PAGE_MASK)
