Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33E2165EA
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Dec 2025 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765096675; cv=none; b=LaIkFd56GTJi1dC2ZNz8Vnm5JcePJM1GjkAdwGL5Xi6Lr3TQctXherdakLuHiQ/bNtBAFmY6VeUthIa6BQiRMmPVzZnXrNEObCmM/7mxclLj4jyIZzylk5UYPMn29P5Yv45c/VNk5JxHYHWU9oIxsxM/y9zQtv8R8qjnSFMWXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765096675; c=relaxed/simple;
	bh=/LR1XGcTPw/8s4MqENvx9JIq/PEmCHmXFp+zwo/6N0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ivchd7L8KvqWXIngItl5RwePeLAUC4yQClRRP+YlJGPLysWibnEq7BgxoB+V8+iDOhpP4YTIwQIoh7N7XH1gIswcZBKig/qOTFnE6z5yMq4uo7/OEhGgExH9oibcep2iN+HV1ls1JG+dXZhjDRcmH4HTy/eI0iQLjxqXDYz2xxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZK9EY/a; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZK9EY/a"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso5688676a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Dec 2025 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765096672; x=1765701472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUAqt5njeLVh6MrbdJefpUGQCUq+3iNdkFktE67ektk=;
        b=lZK9EY/a2FAtSsv+3dR+9tml52gDgi9JrMonHf2GcivP0H6J//cs6Sp9xvAGijyNvS
         /XhE9Vov3d4f8B/veYiNO/BecbDJjkNVdOV5fg4myClGc9Api4LqzKrc4SBzUWcrb5sT
         kShulNvvVDAxP1iEIEQAoOFp1j0zkrc0lqMoXSSsmF3MtEJxv+CJvFrnQUuCgLsqrjKD
         g7kUiKAVsHS8+slJZIqm+k6XnmPZx0UUgPlGqoq+AI1yRI/6eCrKR1UzS4C6E/nJfpQK
         JHy0JgNueV7X30ZWakui1xRA54XKliQzE+vjhyPb5qNu0Xcz1KjI9ENiqxgCxgohxv/5
         o2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765096672; x=1765701472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUAqt5njeLVh6MrbdJefpUGQCUq+3iNdkFktE67ektk=;
        b=VEhi3svyIIofiFigH8FVNvfnO/4QA1sAdOr3qpigx1qIbN6/WOnXKm5DSV80m1aXel
         o9HTQfgmH9DswEbw7GG1qus9yxhPEv7sA95n1CuaxiYkrnxW5+6kdq9U5AwNAVsakIWc
         hg3C1cTBSPlki3gzWSCyVkB2MknYqWB6HW4iRP8t3FjRO8G2IG8FQtt7UA8WcTHBLkxq
         SBOp46LOaHiuDqxOntyrR5wZR6BFggPg1wE4B1M2yUklWczMJsmQM1k/EhitYG/sgoN3
         1n88b8UYdFuy0hUHQIErTBJXnxy/2JqeDnlBL1UTavNwAd1BzELEarndZTn1JwOK26zE
         7zdA==
X-Forwarded-Encrypted: i=1; AJvYcCVzUiDZvM87ZCfsyfBaN4rx5K/1n0VXqKJ91o+fQwhOBIPR/VJeuMxX7HFvXz9pVvUzg0n9KZ13s7/VKqQiqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSbOOqs06J6f2BF2ceaBk6hF6FaGuYn8tP0NRY9pzqFGhO9su
	itw5OkXhR+ySaEXIuVc0fEbdgR582JMOkafK+HDhlb+KPWsIxQYB9R8ulVZrfg==
X-Gm-Gg: ASbGncv5Te3HLFyAwFztoLoahZWu5u7FTsbV5V5Q664/ZTLHlXip4UzgosPL4F8yycA
	wJr2j8C62IDii0HffM8H7XstgODPd1Ll89zOyBnVbqaqwkhJnH6H2gD0SfNuU6Iodqrc2fc69hW
	EnyiOd3USTyItVSuiv0Tw9qGz2x4jy+4A9OoHoZxKuEPiuK8TMp/dRFb2NCNYH+/R2E7oxJnMu4
	w2MTz+O4Xf4vQ+36uxw+FULZyEoi8zQfDFOTOeANGiIpBhcO1J8EgnZWkIOClrRWoEBZUiAj/7H
	d3jz9w/TlNFRRZ/Md7RSqEbf6/8rcm01cBLpXhaqQ8/ZmBM9RtD8OE5n4F6bBbLyGIbP3535ikL
	4G3zdiC9n7NKDGelC+EOhFPAC40bGKkbaUW2gwQi8eMPFeUr3gbMJE1pO/QLvW/xC4H4eHqKGP7
	wo8e0rZL0l1KLX86AkzrZgh8yZFlGpx4hFgKPKr7TMgZ7KeQcW45bC8OkgKdi0sbBK3HarJLuL4
	4Ir/Yxb3+dVVGHGlYGE6cZ57bY76dn4BeijsjC5hps=
X-Google-Smtp-Source: AGHT+IEVqNfD63Og/iUd5redAtxSFIwiSLJ5eCxMwzhmCuXyLMf5his7H3QmVu2l6AnzMWhPzE8plg==
X-Received: by 2002:a05:600c:3b07:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-47939e242f1mr45974225e9.17.1765089776787;
        Sat, 06 Dec 2025 22:42:56 -0800 (PST)
Received: from ?IPV6:2003:df:bf22:3c00:1c42:64e:ef2a:93cd? (p200300dfbf223c001c42064eef2a93cd.dip0.t-ipconnect.de. [2003:df:bf22:3c00:1c42:64e:ef2a:93cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930ca15adsm179162575e9.13.2025.12.06.22.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 22:42:56 -0800 (PST)
Message-ID: <7fe8b05d-cb49-48bd-ac0a-d993e173924c@gmail.com>
Date: Sun, 7 Dec 2025 07:42:54 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/7] gpu: nova-core: load the scrubber ucode when vGPU
 support is enabled
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
 <20251206124208.305963-8-zhiw@nvidia.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251206124208.305963-8-zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.25 13:42, Zhi Wang wrote:
> To support the maximum vGPUs on the device that support vGPU, a larger
> WPR2 heap size is required. By setting the WPR2 heap size larger than 256MB
> the scrubber ucode image is required to scrub the FB memory before any
> other ucode image is executed.
> 
> If not, the GSP firmware hangs when booting.
> 
> When vGPU support is enabled, execute the scrubber ucode image to scrub the
> FB memory before executing any other ucode images.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs        |  1 +
>  drivers/gpu/nova-core/firmware/booter.rs |  2 ++
>  drivers/gpu/nova-core/gsp/boot.rs        | 27 ++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs            | 11 ++++++++++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 2d2008b33fb4..5ae1ab262d57 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -226,6 +226,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
>              .make_entry_file(chipset, "booter_unload")
>              .make_entry_file(chipset, "bootloader")
>              .make_entry_file(chipset, "gsp")
> +            .make_entry_file(chipset, "scrubber")
>      }
>  
>      pub(crate) const fn create(
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index f107f753214a..f622c9b960de 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -269,6 +269,7 @@ fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self>
>  
>  #[derive(Copy, Clone, Debug, PartialEq)]
>  pub(crate) enum BooterKind {
> +    Scrubber,
>      Loader,
>      #[expect(unused)]
>      Unloader,
> @@ -286,6 +287,7 @@ pub(crate) fn new(
>          bar: &Bar0,
>      ) -> Result<Self> {
>          let fw_name = match kind {
> +            BooterKind::Scrubber => "scrubber",
>              BooterKind::Loader => "booter_load",
>              BooterKind::Unloader => "booter_unload",
>          };
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index ec006c26f19f..8ef79433f017 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -151,6 +151,33 @@ pub(crate) fn boot(
>  
>          Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
>  
> +        if vgpu_support {
> +            let scrubber = BooterFirmware::new(
> +                dev,
> +                BooterKind::Scrubber,
> +                chipset,
> +                FIRMWARE_VERSION,
> +                sec2_falcon,
> +                bar,
> +            )?;
> +
> +            sec2_falcon.reset(bar)?;
> +            sec2_falcon.dma_load(bar, &scrubber)?;
> +
> +            let (mbox0, mbox1) = sec2_falcon.boot(bar, None, None)?;
> +
> +            dev_dbg!(
> +                pdev.as_ref(),


I think you can use `dev` here?

Dirk


> +                "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
> +                mbox0,
> +                mbox1
> +            );
> +
> +            if !regs::NV_PGC6_BSI_SECURE_SCRATCH_15::read(bar).scrubber_completed() {
> +                return Err(ETIMEDOUT);
> +            }
> +        }
> +
>          let booter_loader = BooterFirmware::new(
>              dev,
>              BooterKind::Loader,
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 82cc6c0790e5..9f3a52ca014f 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -173,6 +173,17 @@ pub(crate) fn higher_bound(self) -> u64 {
>      26:26   boot_stage_3_handoff as bool;
>  });
>  
> +register!(NV_PGC6_BSI_SECURE_SCRATCH_15 @ 0x001180fc {
> +    31:29   scrubber_handoff as u8;
> +});
> +
> +impl NV_PGC6_BSI_SECURE_SCRATCH_15 {
> +    /// Returns `true` if scrubber is completed.
> +    pub(crate) fn scrubber_completed(self) -> bool {
> +        self.scrubber_handoff() >= 0x3
> +    }
> +}
> +
>  // Privilege level mask register. It dictates whether the host CPU has privilege to access the
>  // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
>  register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,

