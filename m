Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D11B423B
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375818; cv=none; b=RksEYKef8adpD/thFW12czLlp9vP6Mh3Kk9z8Np87jR9JOPIxL6vUu5Dqz0fDYrCu+0csidVmul3vdl1FvQGGE+YdkPuU0ns1RizpyZFuMBk05fx+XXwvbbOxyV7Ki3Xshn4haOUmqvMbpkYvNSrKw/YHk3rYF3OBehB//8ejgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375818; c=relaxed/simple;
	bh=vC7RWNazEQw8SHO84BYOhsU+Fq47hH70Yj2HGICY+tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ix4U8AV0Ht6jt2VX8zMvJpv5CYfLTW/IbQD9dR5I7Jlij6Kf+lQLJPvixHUa2p63zjc/fzaYLPOvpkxXEVTQMpmwuejKIGwsFGvTO8ZI9UKzsSMKKrHNTUEwNf9duJjAl8jrDHPvJfsSVznEwQe2bKxp/5Edz8G1gl5EWqXnOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVrjGYSu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVrjGYSu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so77373815e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765375815; x=1765980615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sH7JNMw89euFON+lTWkqyHT9U4TKnyHQz31vhEK550c=;
        b=XVrjGYSuajhwmcdKKPl6M34sjr8SAFBSPI7f1FdkOrk7dfYKaH8sZXpLfYHGZNcuF4
         KoJyK69U9m06gOXgoS8zcgCrPZ5Nf24osNa15GBCXgv0A7pUNY5YZaetpUrkSWx7x4O0
         DA6FGWAYIeO9ZsqufK/hgOc5525GhsVYs+33XM7SGq2UOBUGSv9mJPKhZTI8Tu9LUuZd
         XfrUM6OQ3Fd1ZuGXkLWKAOTENSgxIAi+Vvbi2nX2WROWrHEyPH+xPP6tXpu4EiRwn4uz
         oi5Guro/ynfTRPN6omo7LwnZrm4d36u7erG90GMCee0IempT2e/5THVkvXclq8K4UBYr
         bpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765375815; x=1765980615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH7JNMw89euFON+lTWkqyHT9U4TKnyHQz31vhEK550c=;
        b=ZE8BaCRwcUFMUlhTCpYMk3mgK+FZfi1HJxYX13SEOtBrVUvmGxh+1ewhUG7yvMhKJ4
         PakZwB2k1CmciroAxHvRWXCpdAGdnn1wlkGMI+UyJgf0p+wJMckr3fdJx+StiCBooPwQ
         d2MCxMNeNruJUt6GPFMrZaL6ExS6ady/1GibtYd4kuKqZehPQL9AoXWiDrIxkSx7QmIS
         ECGuZcK+KGFiC74aIhaq39cV3KuSU5B0quxUsivHJt4tmU9+4QzC5U5iy63hkkzzjC04
         E/ny7cOkwdP+i61LM0/pqViid9OQ4FQOcLTj62S9pysBkF4LAKYVXYceFK8s6btXoa8m
         JXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlSIZRP2vTamZ+FGB7zcm5SyZ6jE8t/Fkue8rDzIBtlvmjDretB9zp//9sjz9zlD2mQfs4JxKMyhhzMwJCiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybMHmSsLoTZ3fNBmTIMxUapUDe62MdkbDEHEO5qGnf1U5eGIr0
	gx5cgvaeDm81A+YARNfNPeCibYrH0882DnDr4aZ/b5aQ/4IxTlaEoWMy
X-Gm-Gg: ASbGncsDUI5eN71FvttvL8VKEUuVIkstgUdp/96jcrXI5isoZc5b7ZOom7blEwAeStG
	c6/2LKrZS1iljMhpHZILHoleRoshHC2TRYNhayhoPRITFVPU24i9L+6KBqmOrV/cAZCSdITqdRs
	WN3XELAsXbeSgcIfXFL5QVStQcH2BUUwjip8/Q6JH6AgKaBbC33l1Um3lOEw5uw1Mr34btSbixD
	rLn+9Q07mCZokgjdMXv21iMQRvBLwnOAY4ELCdf+YHxWY4SWx1FheaWRZ55ZacUdzDDWiiUoWZI
	G3kcOb/JY0N7G2+7NKOCg9RMkfDRTzFYlFS3fhLDHljxeHJCgDG6aZMw1tJBOCwGU+ulgLIBaq3
	5uIeGhqc0UJptOUomn7iCd4m0UvXQcbT1i9GPKLr+zQfm+G6qxop5NVJb9cE7KsbyjQeNjXDuXW
	Xfv/o3GQleSHmJgTkaT96WPXNwCSZfaGfTgGieApTXk2cxqpi/Ce7vTDHCKisWgpwqIiEB2pJqV
	k7RIMjFqZVaFJ4PJsg+r4jU3C5/905H87sBbPoNAVm4ng==
X-Google-Smtp-Source: AGHT+IFL4Dce+iS2AP/9BKbMr5rmVqef9MiJuRV86rp31kh7Gm6lbR3JrPFyWk/6qAOeGdT18Qg/Vw==
X-Received: by 2002:a05:600c:46d2:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-47a83843246mr27645065e9.18.1765375815135;
        Wed, 10 Dec 2025 06:10:15 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:ddf9:5fd9:1909:eb2e? (p200300dfbf2de300ddf95fd91909eb2e.dip0.t-ipconnect.de. [2003:df:bf2d:e300:ddf9:5fd9:1909:eb2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d3532e7sm48107705e9.1.2025.12.10.06.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 06:10:14 -0800 (PST)
Message-ID: <cac484ba-904b-447d-b802-3e324c843ffe@gmail.com>
Date: Wed, 10 Dec 2025 15:10:12 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] samples: rust: fix endianness issue in
 rust_driver_pci
To: Marko Turk <mt@markoturk.info>, dakr@kernel.org, bhelgaas@google.com,
 kwilczynski@kernel.org, miguel.ojeda.sandonis@gmail.com,
 dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251210112503.62925-1-mt@markoturk.info>
 <20251210112503.62925-2-mt@markoturk.info>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251210112503.62925-2-mt@markoturk.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.25 12:25, Marko Turk wrote:
> MMIO backend of PCI Bar always assumes little-endian devices and
> will convert to CPU endianness automatically. Remove the u32::from_le
> conversion which would cause a bug on big-endian machines.
> 
> Signed-off-by: Marko Turk <mt@markoturk.info>
> Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")
> ---
>  samples/rust/rust_driver_pci.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
> index 5823787bea8e..fa677991a5c4 100644
> --- a/samples/rust/rust_driver_pci.rs
> +++ b/samples/rust/rust_driver_pci.rs
> @@ -48,7 +48,7 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
>          // Select the test.
>          bar.write8(index.0, Regs::TEST);
>  
> -        let offset = u32::from_le(bar.read32(Regs::OFFSET)) as usize;
> +        let offset = bar.read32(Regs::OFFSET) as usize;

Yes, dropping from_le() is what we talked about:

Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks

Dirk

P.S.: I'm not sure if the `Fixes` is required: As far as I understood
there are no big-endian machines supported by Rust, yet. On all other
supported little-endian machines this is a no-op. So I think it is at
least debatable if this is a "bug" which needs back porting.

