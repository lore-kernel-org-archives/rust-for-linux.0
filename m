Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB171DFE20
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714226; cv=none; b=hbJyiL7B2Oa/uDrbmJfLG4vc2C9uHpwYfVwjp8rWmC/16sTXz3EnhTYJ6E/W7LlOjiL1WCtvXf987FdHJcmmcz2uWOhOE2OALRWJzrWRJvQHdl/TlaO6fDzimp1l3HKylDbBLR05NEmFfk15u1a/5Icsr2PnOOFxB/f4oCh/Ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714226; c=relaxed/simple;
	bh=9nfAPjIsOC2qWLBaD4H4yv6D5TeRHAgZD/2yLTMEv8M=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=tt6TPJDnzta5L30UGx7bqiOiUY9SV5iPF9nSvjbMXAyhoIahXjvVpFgdiHxTX15QLNR5Ceal3oSXLgHPZGlaUj6VOLGMU3+xaPkfZ1smdqtPeeAnjDUOBj1U/9JZRJMtRV2p6eLRnO73ihjtlfs3zCNINZJWgcUU5MYjCa/FXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVFdss0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVFdss0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B79C4CEEA;
	Thu, 12 Jun 2025 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749714226;
	bh=9nfAPjIsOC2qWLBaD4H4yv6D5TeRHAgZD/2yLTMEv8M=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=lVFdss0m5Rk7uTCR816uvfCHVXeWsvCR+pgCbVvU5zdH20jUpPnJ/uLoVmjH5Ys5t
	 qrCe2mgy26k1yCoNCQNFzSxAvJp9q615Hfw4r7DEbl8x26gd7SoNgx3cJFI8gpHrSf
	 +FIC67O6YcALi0tCTGbatofTxVfEUawA1zAxP4Z18nkLLqdFIM6Gd7tzfCVXgiL3df
	 qTQ4kowAXiVnKgYQFdJETFm27S8QSi4gbFhgtbTN265Gipw3KHVMKylrrd0FVu1hDK
	 nWKfn1CM7jt5UQCPcgY9WLARg8fTxo5lHoNA1D+Q2jZEbJhWLPt6WfnNCL93Rweh40
	 1346aZcEC2H4Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 09:43:42 +0200
Message-Id: <DAKDXCX8JJVP.2MG7OCAEY73MR@kernel.org>
To: "Abhinav Ananthu" <abhinav.ogl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: rust: Use C FFI types in bios_limit_callback
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612060929.28773-1-abhinav.ogl@gmail.com>
In-Reply-To: <20250612060929.28773-1-abhinav.ogl@gmail.com>

On Thu Jun 12, 2025 at 8:09 AM CEST, Abhinav Ananthu wrote:
> Update the bios_limit_callback function to use C FFI-compatible types
> (kernel::ffi::c_int and kernel::ffi::c_uint) for its parameters and retur=
n
> value. This ensures ABI compatibility with the corresponding C callback
> signature.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72=3DWpuGELzLbH-fxdOe=
Jy9fiDFwatz6ynERDh=3DHP2z2MBw@mail.gmail.com/.
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index b0a9c6182aec..7ef2f64d8f34 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1277,7 +1277,7 @@ extern "C" fn update_limits_callback(ptr: *mut bind=
ings::cpufreq_policy) {
>      /// Driver's `bios_limit` callback.
>      ///
>      /// SAFETY: Called from C. Inputs must be valid pointers.
> -    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kern=
el::ffi::c_int {
> +    extern "C" fn bios_limit_callback(cpu: kernel::ffi::c_int, limit: *m=
ut kernel::ffi::c_uint) -> kernel::ffi::c_int {

This file imports the kernel's prelude, so you should be able to just
use `c_int` and `c_uint` instead of their qualified names.

---
Cheers,
Benno

>          from_result(|| {
>              let mut policy =3D PolicyCpu::from_cpu(cpu as u32)?;
> =20

