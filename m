Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB93502777
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677499; cv=none; b=M4XXg2a3W4tUcqLJKOWy4IfcmLgyZ2dbHBQ2hAAYqHa5ySKEdPgsOb0A8aDP7tPpstpjCpwEIXf51wB5qjuAXeOR7l6azdEsgGAJdpD7FweoXTN6nvBAM+bQN6bjdi6SSdIrwPx+Ns71rrMkpEGySNc3bqTWFJFemVx+ZwAT5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677499; c=relaxed/simple;
	bh=Eot8cEg/hCVEQCRt7kTdD6pD/MCUTSLsgAFp5RbY1SU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Idr76cSkZ0CgonQdb959FMkgZ6NCY/COBmbauNEwKo1/qUE1pvgjsNwJlxALw2LLm1sZB1h+p0TrYxaEHE21EekRDAzdDeoQnn2MwhHoLQ6INco+ovwvPpPmwiSsYUDT34BgcjWjWCuJJKHjYKhD5Qj5XFyPQhbpv25zlrqSC/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0q+RSs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0q+RSs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A762E1F000FF;
	Tue, 29 Sep 2026 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677489;
	bh=/rVf2O0JTYEDoiN4Nj8RRj7N07I8m7kIhRk3ZpRZQ1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=O0q+RSs6UKkSaApvmLoshdgcx5DZay6ngjqP9DtodZsZz3fvpCyRHGbrY/J5TnOSP
	 pyVub8gEh+3jOm5HLVlm9vNt4KGPJJ8scJIn09zV5ERklhiOLAVGMY22yY+uSwWsf/
	 Tw2eWKEzHzM+W9g1YA009r7d5d1vh59sUPsvBFVh632pNKdarRUyZJfQkkM+Bca0NM
	 Da1ByzSwJqKKdsBG0ns7+WMA62WH1k7sZP+dcGPPBHqhEUXq7KwUKN1wtd8JIf6mNr
	 9EW6xtjWHsoTbhGhSXbwG6u4X7u5dhz3dkE01tYCiG7vZbtTYkaEkOAAPdhTTzYvT1
	 50hMxzRWlYL8g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org,
 fustini@kernel.org, guoren@kernel.org, wefu@redhat.com
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
References: <8Hw8rFOzHELmQvD7ZIatk1FJqh39-AbzNppa9asPFp0Cp9gFzcQ7zs_34jnuQGt5ukgNPqz0yxdaIyT2SHtACA==@protonmail.internalid>
 <20260929095612.1072417-1-tomo@flapping.org>
Date: Tue, 29 Sep 2026 12:24:38 +0200
Message-ID: <875wzotkwp.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!
>
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>
> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
>
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg


