Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEC182B7
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 06:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764398808; cv=none; b=PMuHZk1mWqOowXFDXKTyfZAxeZ4oHdz735m5it1gSJ/ruuUu0IMl2cClZl46vtkuKhMCzm9B+tzAstuDeo0/VxLVAUow5pzQWq2Vh4aGwXMVDm55Lzs9kKxr+VQQv5KsThyzLtVefU9h50MJnEKCN6aWFigyP1q40ByZ8x7IhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764398808; c=relaxed/simple;
	bh=vrVUizHsfVQHvvuJCRyEp/ZVtTOP/4QZcYhctW8cmkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLSGW6ye35BtehRpztTd3XhAONALw9LrLBa3DMLiEpFsT3IVTiLhkn5jd3BTjWj/9Xl2aT+Ob8BErV0ouvWpUvtrKnwawEaTUKfF1ZGEfZXXxAckW5UZMiKwqeEo+R5RQFUPc3LIm53dHi+RS9M+h6XaBwg7stYs8fsADHmiCig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Btt/I2aa; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Btt/I2aa"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so3844977a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 22:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764398805; x=1765003605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ4Ac5J87qRoc0UDjhik9FaI6ERJsI+1N5VMhTD0tKU=;
        b=Btt/I2aaAGvInzHy+DiySpdfwhXYHsHUmzxVcuoxm4hqGrE3QFhdwqcE7uuvweXWAC
         mw1+OQssvBnEwxDugVNs/G3nxjhBXUu3Ao9CDVE0HxFe1GRswA/uxekqFGpNczHdpNHV
         7IM5dTNFJMbev5Etz3m33Hkk7ptUplGTCci+rouGhGrJmVxKl0YM9d8XaDrkiEgE24/5
         3LPjSI28q+tIMBetOTm7hapOlTPnaUZR6rnEpwgveqN7LQmUI/dF9Luew3NLv3OUo7ma
         73QCnzUizrEnHYPwAFD0jhud590Q57aHC/EFymIFfBw8fuV+BK1PZ9NfP2n39/TKwoaF
         MjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764398805; x=1765003605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ4Ac5J87qRoc0UDjhik9FaI6ERJsI+1N5VMhTD0tKU=;
        b=h9A6nixFlDytirLvvkSOm9hWi+L9c2qekJfXR1nS/cFj3QoTE1BVIiye9oAFE44+6W
         tmSXl5aDuGRc4ULSAYYVg/u5ShWoeQhPVmKLdpJWr05sGCMXOUYJH92JzKg5maOuSYE+
         jXnf/Dwym0aimGRJ0sJbA644TLQ2TTjKHXidHz38QV3wXzsQFU1cosTktIK9SHifhd4o
         vMDD4PHTN88PuVOe9Uy3x+/phBsqkwT8tqB8RYz5nz/aH6HOYBUaNOV5O8QiS4183ic7
         gE9VitBD1GhPFpo2ehXkbtWfkaGvMe9NdgivrWEk/AJ9esp4sxxEtxjU8CnIDTn2jQUQ
         0nog==
X-Forwarded-Encrypted: i=1; AJvYcCV9v5UHu/uXZunBl4iP/I65cv3YZ6IKRIUTWLz4lZQkziWpNMfawUAnTBTvekKZVs2PBbtC0ol+9LiufuQvIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIxiCOfxVFlhoNCn3xafpfN1NO3/HHiGWidaBFFHXAifc4FEC
	g+QeWY4lrytSnfjw8wb4BiKikdhEIo/9csw8rVLGjZ/9X+4vu5y+/Giz
X-Gm-Gg: ASbGncuaTwK8tBEjr2xQvJCQQcbIhA1/zzhT/QDZ0VUNAoFxrVS/Xsrzfs+3LURlbeo
	FLhIqO5efZOjp87xYGu68W5PMWxY38lx+HnMUI2XucxMCyNkegUp2i0FkJzvotJpxkUqyLSwtgZ
	lB/bpfs8ah9Xv1G91TAjRalPchnB3l9fJ/SSEFglADwOPJ/bGTS62Zf3DJQzYggnOSCLj0qroHT
	voKBDHrAZtZGmDd5fDE9yBLbF+DSqrQ4L2YJwLZoWzxvHwtt1nSdIp0JeriNfhwP9lvRUUgUguf
	cBTQ+08UATfDYPUEbmH09OH9ZrXylBcV11j7QFu4SBfugidlSojIIxEywsKugq7ZcX8H2zSQmnN
	AVkjZWCL3ziqkuSjin98/CpDWuQBFFr5l9XRb14kxeWaCgEhScALFgKArfxK6F7JGkGzgN1bubL
	vj6noCS5BSKMFyUpnmzP8GXy9XTdRtySQto2GIvzbEuXLaiupuTx0vmibUg9EkEgUcZwCRSlUBX
	kVxSOn5ZyaMkSHb5uX22bkZ5WKgtL+cwTikpuJ/KuUfeQ==
X-Google-Smtp-Source: AGHT+IFaL9iCf6pmMxfebNASmaVM/aMapXzXHiOLDjjSW5S9hudj1X9EP+LNDGnIQT4cuXwKA8I2Ag==
X-Received: by 2002:a05:6402:3550:b0:63c:1073:4a69 with SMTP id 4fb4d7f45d1cf-64555d2aebamr25449286a12.34.1764398804943;
        Fri, 28 Nov 2025 22:46:44 -0800 (PST)
Received: from ?IPV6:2003:df:bf22:3c00:bd7d:4644:53b7:3323? (p200300dfbf223c00bd7d464453b73323.dip0.t-ipconnect.de. [2003:df:bf22:3c00:bd7d:4644:53b7:3323])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90caasm6159605a12.11.2025.11.28.22.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 22:46:43 -0800 (PST)
Message-ID: <071c5fcf-bd7d-40da-ad7c-c0edbe780671@gmail.com>
Date: Sat, 29 Nov 2025 07:46:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: miscdevice: use `pin_init::zeroed()` for C type
 initialization
To: Atharv Dubey <atharvd440@gmail.com>, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251128162337.12082-1-atharvd440@gmail.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251128162337.12082-1-atharvd440@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.25 17:23, Atharv Dubey wrote:
> Replace manual zero-initialization using
> `MaybeUninit::zeroed().assume_init()` with `pin_init::zeroed()`.
> The `pin_init` helper provides a safer and clearer API for
> zero-initializing C structs without requiring an `unsafe` block.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  rust/kernel/miscdevice.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index d698cddcb4a5..e168e9da8f4a 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -20,7 +20,7 @@
>      seq_file::SeqFile,
>      types::{ForeignOwnable, Opaque},
>  };
> -use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
> +use core::{marker::PhantomData, pin::Pin};
>  
>  /// Options for creating a misc device.
>  #[derive(Copy, Clone)]
> @@ -33,7 +33,7 @@ impl MiscDeviceOptions {
>      /// Create a raw `struct miscdev` ready for registration.
>      pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>          // SAFETY: All zeros is valid for this C type.
> -        let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
> +        let mut result: bindings::miscdevice = pin_init::zeroed();

While getting rid of the `unsafe`what's about dropping the `SAFETY`
comment as well? As done by Benno in [1]?

Cheers

Dirk

[1]
https://lore.kernel.org/all/20250814093046.2071971-4-lossin@kernel.org/


>          result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
>          result.name = crate::str::as_char_ptr_in_const_context(self.name);
>          result.fops = MiscdeviceVTable::<T>::build();
> @@ -421,7 +421,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
>              None
>          },
>          // SAFETY: All zeros is a valid value for `bindings::file_operations`.
> -        ..unsafe { MaybeUninit::zeroed().assume_init() }
> +        ..pin_init::zeroed()
>      };
>  
>      const fn build() -> &'static bindings::file_operations {

