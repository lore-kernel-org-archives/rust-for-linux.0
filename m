Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577AB46982C
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764058; cv=pass; b=BZlpuFfcyHSg06zSjCfYxO72iC/RmuVdoZTXYbYTACtY7jcYEwjWcW+OyIuxgBIz5pJqwdMSj+M1+JClU74V0yfkD06FpZG2zulKCaB+2GVzhE6lv5JphzzJ8QUKdvxwQkidsT2qDj3hSuvoczJ6jdqQ+DbUUhCte2kWeiEB4GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764058; c=relaxed/simple;
	bh=XvCWzYsO5117WS0fLcPugtOovWWwKR7emRvgKSPyYEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDVNriQvMgFjp25mqwDlMUc31rJzah7IOLIcJBQs3d+vKhKaaXo5hyU1eG0WahzQpYXgq/t8AcRdNcIIVZv/ZtHPxDbQILg8O1l1B0+GHJfwNYmwWeIo7LxHrP94c8A+fRucvDJuFnyX3D4rthaCDTph9K66NdOKLsS52npFp00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqDfQK32; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqDfQK32"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so57611eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 03:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764051; cv=none;
        d=google.com; s=arc-20260327;
        b=YgzASbr+qmlk8yIKwCMUKWGmnfuyWZSEyIcagptdQVpJFe20JK5n1q81YU3y4EvKfB
         t3LIlukc5efDXplT7eRkW9IBEoY6Ica+7R/R/ovJ+J2S/k7EGgw778Y7iMD6m6GfkMKi
         g2TaEjl5SXW+8ely7Xgrz3qiDL7z5TllDWhK2q62I9NMQG3RvpLeOcSakcx5Rclxqayz
         Pg0DHvXndKP86GRZbP5Ou4uLYyY/6Im4Fay3bnYCAc6X0aNWTGTfdSZI35o7D88lepYL
         0uKLdGLY36PDbmi4J1GGyXXTokKgb4vq5GEzNpZE78JtzGkGlLFlFu48m9FMChzVJY4v
         kcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        fh=Ja4nUWfwBxxNzJf5bnDVa3dHLWVUPr3h6HRoDjRZXrY=;
        b=afeoXRBKOqrvAEhsHP3lcdYThrGlmMHQhkdtRGIrknDuLSsc6myZT57akGqz0YsciC
         dWzAhaiHpvpm+HQw93NJCZVYWuoKcvBszl1vUL5XCxv+SRWKniNVmnn8CqzCbe9FGsEE
         AsHoVIm8jXi7PX9enSL0euRMrY+sLfqe/V4KmMA0N4q3ihXeXwmlItvDhAkyVheyImaC
         HoynfgTZcAcEmbjWgZh5LD+knEovvaaxy93/85uwmzBrqK0S22ydwZbfoYvn1+7jaBax
         itP3sBSDUaI6/GNc/Vr5VOVYFYmcmGrDCq398C/bOMODq11zvlqnGcqbFvK1fORx3pP0
         Rxdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764051; x=1791368851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        b=ZqDfQK32SxdlMSL7AML4DDYFSEn83S9XNnE8si1DlLMNsYKj+18tth+oXi+aVYu4iN
         qdK2VKpn3Bh9PxYNSNe+Ab7nCNB7/rL7TqLwUrTbqSx1Rs/1ena/9EPCqlsMXr23YEmU
         EMcdcamK7z8YhYRTaoB7hECpHWiMLiaMbI5zRnehidhHeL7CM6UKDWCwbMbgEmudN7a0
         MiB0chDVX/EV6XTAiLqLtrkcgTM2czOWF6KLhI23rgvtzuJKS4TIRnLG9AXTZPEMGz70
         vW4rZR5ErPqW0JEP7h1yBKERxrNJSbbGSk+YSpKgFVSfwVElqAKZfi5smSo/gSX6z8lH
         Lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764051; x=1791368851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        b=LaXFDb8fsROtJ4ItIzi+NfFNG8Qgq7d+KD1V1Wswnp6bHDLYN6CnDBemEt+UHvCbKm
         myi+R/xJBFQyytvd+/u+6e/yc7uPkCbgcwPDMru1ucYjSWZh8rlO+jAF9MJsVnXsfKdA
         JyixAdgWgscODjunjfCxz0o7/8D/nB/Q2dcJx+3xbnAS/W4B2Q7mu+jU8n9OTEM/t4kd
         vUaFfGbD9JM+uXiD2as9BN0TYL//rUC+UavIM1FzlCCKcHqQxNWtcpVI1AdaW9gsDUab
         lj8jNW6mqy92EplB8dvMR0PbSWfLDqNnqd4trqRm/BGUBQIojSDsxehLdWd1GIF0XXCw
         uJWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4S3Ljy5323rvdVFygQCoF/dtE47ct7VQvtWwGCS9s9TaIWe+Uj6GX7sTYdR16NgkgrfXhcUgTXJKBTPG5Lw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEdPmlwBEnMeQnJzHiyycWJ7J6GOsx0IgO3GnVBRbH86aA7XMh
	Bfa6sdvX7URbIRQUhERkKL6PQqOk3bC94bW7OM4b+dnoC8XaCPzndk4Dvvxktn1WJmUnpp1Fw+D
	tV3cVQUoe90lITJPGT+qka2IrxQeyy20=
X-Gm-Gg: AYBFou09ckRw1jQxErqJrEPDDwMNNF6osW+zaHl/hFuANL+UROFExeElNcmwGP54PHl
	nDWcxB8bCCIgcg9xGLMkxof50SesBLwR6XISd218WuaskHEQ08QIqbetAX2Bz6E6eya6ePAh5N4
	j0F8vBObMo/DZnS1QXZtLwMPOZc5sLgxvjchLLMO8dJqJBWcsFebsDhQ0hA6yc7paW3Igp+x2uR
	aC9yfceNkuhF9w8Yj9Vpfr8oZvrFuyyFUXHbBpZjfIzc10YrwVUsNypS0y4P9zJoRaOZOAj5izG
	JKr1se4K+opRh0OxSTri3zyX0fhy83CwHCDOU45j27xgvdpNunX+U23vuXE/Fq2peq7er7cCG2t
	53dTY8ZDaPI4mD2DyyDH7AvzwEuolbrqnwHbMTNAFqjXLxIrQg03CB4sw4OqV/3Ky8dXEiLwkTA
	wPqfPJLLCBm0dgMAIN/Z1uNPU22SE9Z5ZnLK6htaE0Bo+ZaXTjbS0=
X-Received: by 2002:a05:7300:e9c9:10b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34cd8795e5fmr2234714eec.0.1790764050978; Wed, 30 Sep 2026
 03:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930101257.1649945-1-tomo@flapping.org>
In-Reply-To: <20260930101257.1649945-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 12:27:18 +0200
X-Gm-Features: AclHuK9Nh6JsI3E6OnYTw_dMYdR-qYkmEpYkodh3Keia0XE0NzXFf93RUybHrnk
Message-ID: <CANiq72nRjBM5gPGKbEka8M6uZ8aVmoCZx9z0aXSMCkm1Od42jg@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ukleinek@kernel.org, 
	wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-riscv@lists.infradead.org, lossin@kernel.org, m.wilczynski@samsung.com, 
	ojeda@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:13=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' un=
defined!
>
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>
> The TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
>
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Cc: stable@vger.kernel.org
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/=
topic/64bit.20division.20in.20.60pwm_th1520.2Ers.60/near/626825599
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks Tomo!

If PWM wants me to pick it up for some reason, please let me know (I
don't plan at the moment to send a fixes PR, though).

Cheers,
Miguel
