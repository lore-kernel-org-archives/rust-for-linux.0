Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386623009DC
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760550748; cv=none; b=pLFuYHUIo11OmN4O7s6hhv8d4vQZVeCdwYUOKmqRpRL5UohZCSxaSKd6b/U2gAEpBakKsx6NCmq1x+1MwtCw5OKSaSS3itovBOz2HkMFb33e0koFeuG4Xu13ESCXCNs1k4IBjSbSZYCw2G29rWU+RtJoNkfpC6ItNxfJKfCzEbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760550748; c=relaxed/simple;
	bh=J+g3YSL0i4xb+MJMmSStI2HhtGo/O8qWkdvFY6zvo3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=d82FChz7rCJjp7iqnTu4CfR83RphsoogR+KTwY6h5kPeyMn6mhkpwjAcbu4110tezhhsDZEzIagZ5vJXt8IdvBboqrmRz0jUEDUCpeOmSt0c0WueTMV7uOWcFQEL+6y2v38nNAIJOjzXYbv8g36DtESRX2WRaby4iM/XV6zvfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mkEfclLh; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mkEfclLh"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251015175217euoutp01cca981d4df1b6a7d7ca9e67d7807d573~uu5FqdIu_1974019740euoutp01G
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 17:52:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251015175217euoutp01cca981d4df1b6a7d7ca9e67d7807d573~uu5FqdIu_1974019740euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760550737;
	bh=6jaEB+5YbVnEIOkSVtaCWc+rluHmQnP0qmqJ49YNg7M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mkEfclLh4qkq9JqiPJ+ikjlMZ3zMtbmENHzIUw4g5zjHDx25Mzf2u0T7bM+9KIfUE
	 3QTAs/+7MqqGAkTcXD6tmA45+GJCKDo5Q8S2OBSaxWDrF0F9RieTLZuXuzzMKraMOU
	 vWpRGgGjmp1SAgFDUOHaO/Vo2F7ezJC49w1UUSI4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251015175216eucas1p1f80c6213d42a5c41b346ae04d0ca3edc~uu5ErUozk2581125811eucas1p1q;
	Wed, 15 Oct 2025 17:52:16 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251015175214eusmtip15861a84e9ecea100785f9d589f38661e~uu5DP5xvd0425704257eusmtip1v;
	Wed, 15 Oct 2025 17:52:14 +0000 (GMT)
Message-ID: <99a41538-ce1a-4130-a093-d0c600e63d16@samsung.com>
Date: Wed, 15 Oct 2025 19:52:14 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Elle Rhumsaa
	<elle@weathered-steel.dev>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251015175216eucas1p1f80c6213d42a5c41b346ae04d0ca3edc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
X-EPHeader: CA
X-CMS-RootMailID: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
References: <CGME20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d@eucas1p2.samsung.com>
	<20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
	<ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>



On 10/13/25 18:48, Uwe Kleine-König wrote:
> Hello,
> 
> my diff on top of your changes looks as follows:
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index dd6db01832ee..e7f770ecfe84 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -812,9 +812,8 @@ config PWM_XILINX
>  	  will be called pwm-xilinx.
>  
>   config RUST_PWM_ABSTRACTIONS
> -	bool "Rust PWM abstractions support"
> +	bool
>  	depends on RUST
> -	depends on PWM=y
>  	help
>  	  This option enables the safe Rust abstraction layer for the PWM
>  	  subsystem. It provides idiomatic wrappers and traits necessary for
> 
> i.e. make RUST_PWM_ABSTRACTIONS invisible, it is only supposed to be
> selected and there is little (or even no?) use to enable it without a
> selector.
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index c9fd1d8d17bc..a5666052b7ce 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -121,6 +121,7 @@ fn round_waveform_tohw(
>          wf: &pwm::Waveform,
>      ) -> Result<pwm::RoundedWaveform<Self::WfHw>> {
>          let data = chip.drvdata();
> +        let status = 0;
>  
>          if wf.period_length_ns == 0 {
>              dev_dbg!(chip.device(), "Requested period is 0, disabling PWM.\n");
> @@ -141,18 +142,13 @@ fn round_waveform_tohw(
>          if period_cycles == 0 {
>              dev_dbg!(
>                  chip.device(),
> -                "Requested period {} ns is too small for clock rate {} Hz, disabling PWM.\n",
> +                "Requested period {} ns is too small for clock rate {} Hz, rounding up.\n",
>                  wf.period_length_ns,
>                  rate_hz
>              );
>  
> -            return Ok(pwm::RoundedWaveform {
> -                status: 0,
> -                hardware_waveform: Th1520WfHw {
> -                    enabled: false,
> -                    ..Default::default()
> -                },
> -            });
> +            period_cycles = 1;
> +            status = 1;
>          }
>  
>          let mut duty_cycles = ns_to_cycles(wf.duty_length_ns, rate_hz).min(u64::from(u32::MAX));
> 
> i.e. round up for too small period requests ...
> 
> @@ -189,7 +185,7 @@ fn round_waveform_tohw(
>          );
>  
>          Ok(pwm::RoundedWaveform {
> -            status: 0,
> +            status: status,
>              hardware_waveform: wfhw,
>          })
>      }
> 
> ... and return 1 then
> 
> @@ -355,7 +351,7 @@ fn probe(
>                  "Clock rate {} Hz is too high, not supported.\n",
>                  rate_hz
>              );
> -            return Err(ERANGE);
> +            return Err(EINVAL);
>          }
>  
>          let chip = pwm::Chip::new(
> 
> at least pwm-stm32 uses EINVAL. Having said that, I wonder if this check
> is sensible here at all. pwm-stm32 does it to ensure that
> mul_u64_u64_div_u64() does the right thing, but this exact issue doesn't
> exist here.

I think your changes are correct. For the existence of check I think it
is helpful as it fails early with a helpful message, but isn't strictly
necessary.

I will incorporate these changes and send another revision.

> 
> Otherwise looks fine I think.
> 
> Best regards
> Uwe

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
