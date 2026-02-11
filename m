Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A286A7
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795203; cv=pass; b=aZ3HvC9jCYl6yn9qUeV+yD1aXv+MQipKZhDPeuMHvr9czD+Rdb3rYd3Z0yjmHSdBoqsqqv0uFpuIFCkoWpIEvlsH+CWOA1B/L3iogyPuAaxezPiG5zPJMJJAqygwfgXZIZlSkFiVXk+DA1ezvugWWGSZKAwZGpVxzBcU20owu5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795203; c=relaxed/simple;
	bh=J5TKxDPAqBy+ai0vglTOHv4VKYEY9F4hInonLPn1Cuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmj6yhQtwMi+JrxSqrMPCD2mibRlA3ZP5p+ZQ+J1NSTswNvO+vJIU6IhRVRis/ywu9LutI8f6Gc5Z9F+W16Mhqi5/2APArWID/N78hY3ZBaYrysMAdBhMM2w3nLHqeFI0UkPKrEnv7h4uEbAC4eU99xCHzhco+rle/+VzuTiT84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghYVhTSt; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghYVhTSt"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65941c07fb4so10021046a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 23:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770795199; cv=none;
        d=google.com; s=arc-20240605;
        b=QU/qQ4bT7NfXmVJkcbmIRkmfCRi0M7lHpDnbmp5CCK0UD0coL/EMoaeM5SywUt1FNg
         OYxE8CDHuOwCUYnp1DuuS+vSGEosa0NKX0WZ1KrIj4dIF6NlzH+l5Dx8THnF6ux3HYxp
         NLFh5Ku1A79lhpcbLd0EZhgwX93phKLitaUa/6IbCmH6jLxa2fkzTN5j7N4JrDgtgSTA
         8PlITa5KLEcmvx60ADyRmQw/1gIH1sUIVJqKs0sirqqD6AwHq5p9XwHoky8qJysXiXBH
         FYbYufhutFQw5YfSZB7c6LWUvs2vL9HlW/MzRoebNEvVuQx7gPYfvZgmJMdJ9yl17cDL
         zt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
        fh=GYyh8qrNrZejITZ9pkjFtFSJnr0EuFD2HOt9x5Z0UTU=;
        b=bgD56FCsFVk7bqlv2Wj5jytiDZU+LOrxnuRk48jLLOZCjwCKCYjfLyccnOrIf3Gh7e
         +pT6JURB93V9V3it/2pM2/JFV5MXEiPmIcuBF5IaZYNtT4sYzYau2q1Vhh0dLfnY6kmO
         0SndBIiggdqD8786KpwgIRZmP0hXoc/57DLQ5C6qiSrrqswKvAfnISqIRVj+1kPBt49O
         JgdmlPiYD56Jix72s7za2SSQe1W8BE55kr0lteGR9MHWj2pj2amKZvq74qFmvfZUhbjs
         vWD4tTHS3ihcGJ8QbfNtrDZvAscmkCPYFadRbcISOfjcD42N+2ryoLYflq38hp85lQp1
         LZtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770795199; x=1771399999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
        b=ghYVhTStQ/88e9VrSnEzT+fEAnXwtRUvk8Y/0qgxUfARFR59oCqbBt98gielZC/XQd
         PTQVfb3T9iiEfsZ5pn+0uR4ssqG7Q8UvUx01iG7X4jqAkbxnQbbp5+QHlmLtd+y2npjs
         TVnf45yMDb6ze6HCzdB0UrZHjZc+d6pt5AsW3ND0UUL027LMysTnjt63dSnCHuMPF9im
         V/rHTO0O6dA9tG+z1bY5OhYVZb7oR4UQd76a9WV/kTERD58klL2FAGXkggOdIj42llFn
         2OsbekYtlUYqt9F4bdNcz4Kr7ZxRTBabRQysFaLPRv9CyueuFScOYm0M73y5ObFY2HS6
         YUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770795199; x=1771399999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
        b=J40v+B5rRbFVlZtb7ZuXUY35aN7rIXRx4ySMTNY4lqdAt9m4iMkjnW71d521hMM2R2
         1gRNVS7Hg7iE2AJRmc6CsPcUXmOEOkNqLNjSQe473GdxsV3NOSAwwh/6Y4KM08tzWg/K
         OcCewWWRnAv+Pt0h4thcRcwEr6QpK+ztd2VrgFrUw5a9WmmCkvdU0VPBbga5hPqidRUo
         t9mTFziCUvT8udBOQuipIMirelTO0XZXC0ntv663+0Sz4iNaPs//lB6OrceX9QIgS+z9
         5BNFQnl2x+nq0MQmRA7YXzdSYqJE+DdlakoJ7codP7226SVuv1juXeSX3ujTgcMnFjtm
         2+ag==
X-Forwarded-Encrypted: i=1; AJvYcCXo5p6ss5UG32XSLkH4m2YwCzwNx0kNThXI1DBmxFFQ3qjIH0L5kN61ab5SjuxuqSWqFfECWBKW1QFBwxjCvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7P3fCrNymbqiSHYoUrHacWxOb7K5W5lEHc7Viia9SGT61aPaO
	qK9aEpqtP5kWELdUgCMnUqrBLiC31w6De71b7ajWyj1Zp/eC9aYC+lZdK8xu+wHZKLyEZiZ+vYy
	UyY72heYM1QhxO35EYcvnKw1UfKeMNwQ=
X-Gm-Gg: AZuq6aJF9c4sp2KEhfPgrZxnxAciqwBUXlqd5JtgwbiOg5QHT5mRrGVzrYllphlw2Sd
	4eJUMKf6LPObHVu5QQlBVARMRNKD94srU/cYa42NmfDtBw9KD+qkIWOdqlvwyD7EHpm9uF1JPtW
	D4e7SHCTIhh1MOdC2GDxoNVTLBofZuJoP0d9IA4RMJXwJl/R3zyrNTk6F7cOlrKAXvplPpwyUsB
	eNgO2u4B3+qBfQ6h9Dpbow0wX1GnH443eJCbCG2/s32m+gy5a0zMU9IoNu0MdjxFIWzw+pfoRP1
	tcjpKAMfrn7C39I=
X-Received: by 2002:a17:907:6094:b0:b8d:f859:d228 with SMTP id
 a640c23a62f3a-b8f5440515fmr282806366b.17.1770795198893; Tue, 10 Feb 2026
 23:33:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210183812.261142-1-work@onurozkan.dev>
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
From: =?UTF-8?B?5a2Z56eR?= <sk.alvin.x@gmail.com>
Date: Wed, 11 Feb 2026 15:33:07 +0800
X-Gm-Features: AZwV_Qj7Gk4cKKlrujf3XeOqCG31_GPZOZQjbDGsb0-tcqm1_zyBNGep2ZlP6F4
Message-ID: <CALpAb9MZN_Tj1n5Ju6cXVzYK=MSuf4gNyt6sNZGHB8GEGrzUTQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Verified on my NanoPi R6C; the GPU model is now correctly detected and
printed as follows:

root@nanopi-r6s:~# dmesg | grep tyr
[    1.894322] tyr fb000000.gpu: supply sram not found, using dummy regulat=
or
[    1.894527] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor
0x0 status 0x5
[    1.894534] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809
Mem:0x301 MMU:0x2830 AS:0xff
[    1.894539] tyr fb000000.gpu: shader_present=3D0x0000000000050005
l2_present=3D0x0000000000000001 tiler_present=3D0x0000000000000001
[    1.895170] tyr fb000000.gpu: Tyr initialized correctly.

Tested-by: Alvin Sun <sk.alvin.x@gmail.com>

Best regards,
Alvin

On Wed, Feb 11, 2026 at 2:45=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> GpuInfo::log() was decoding GPU_ID like this:
>
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>
> Before this change:
>
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>
> After this change:
>
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..da97844efbec 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres=
<IoMem>) -> Result<Self> {
>      }
>
>      pub(crate) fn log(&self, pdev: &platform::Device) {
> -        let major =3D (self.gpu_id >> 16) & 0xff;
> -        let minor =3D (self.gpu_id >> 8) & 0xff;
> -        let status =3D self.gpu_id & 0xff;
> +        let gpu_id =3D GpuId::from(self.gpu_id);
>
>          let model_name =3D if let Some(model) =3D GPU_MODELS
>              .iter()
> -            .find(|&f| f.major =3D=3D major && f.minor =3D=3D minor)
> +            .find(|&f| f.arch_major =3D=3D gpu_id.arch_major && f.prod_m=
ajor =3D=3D gpu_id.prod_major)
>          {
>              model.name
>          } else {
> @@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
>              "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>              model_name,
>              self.gpu_id >> 16,
> -            major,
> -            minor,
> -            status
> +            gpu_id.ver_major,
> +            gpu_id.ver_minor,
> +            gpu_id.ver_status
>          );
>
>          dev_info!(
> @@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
>
>  struct GpuModels {
>      name: &'static str,
> -    major: u32,
> -    minor: u32,
> +    arch_major: u32,
> +    prod_major: u32,
>  }
>
>  const GPU_MODELS: [GpuModels; 1] =3D [GpuModels {
>      name: "g610",
> -    major: 10,
> -    minor: 7,
> +    arch_major: 10,
> +    prod_major: 7,
>  }];
>
>  #[allow(dead_code)]
> --
> 2.51.2
>
>
