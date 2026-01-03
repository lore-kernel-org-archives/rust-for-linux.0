Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2656288522
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767471441; cv=none; b=dVUADvJfDyzWUMZgC2q9lduGVca7DzMUsFsHQMOwT32za2Azs4Rxdr0UbVHKwp/Mme/wkW82soMOoLO0Vmkt0KxBITGRAH2RV1IAyl5zP811xjU3QHnbMjCknAruq9a2CkwrXJg+X04XTJharxTGED1BYlRKJpVMX32+wR64M7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767471441; c=relaxed/simple;
	bh=5HMr5QJ2oE3kULBX7QCLd2NMoxwWzNwYt5mGuGiHwew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwDSR3TY5AHyDcLC54EqXO7jdG/nOfZZrO8P5y6w+kdQsVTrS+koBPVRmnIOySnnNXMLrwoEKBT+UAGukh/oPw6saolXlmoLvmD7PDioTPw1heXupPgnQncTnbev3CkBYAZontQsbT7oxgHLNqWLq3BkvKKNV50bPgysRQRoNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjBtLH5E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjBtLH5E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso159460025ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 12:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767471439; x=1768076239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtsB8cTNLiViD0x12Gv28T9z9GvkLx2I4rkvj2Cl/LY=;
        b=UjBtLH5ENu2JEQt3NhpzuINLgk3A3OEOOjuPPtbYyu/gKXlf6K2GUbE5kaBMTElO7L
         paEprtoxJ8857jib4W+H5gFF4Nr47srS9dFrMlZh+dFNzGsU/00MEZDyDvl1Kkywh3DU
         4H7yry6/BrbjEhuRBNbdD42DqpX6Z/hbBBDazvGpvfskWEcipMsv/GnNIFFvB6YSfNSD
         6xRnoq/XeDs9gC5sgq+Hhyimoy+i4SuLKyDCoOnzghwojvgn14tHzsQdFL7sz+igbG5T
         02yAczX5ljWp49Xpis+LPNGbDM6HKNXz4h/1HniBFAxbhWVQPf4wE7i6ijDQ2itcaA6W
         3VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767471439; x=1768076239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtsB8cTNLiViD0x12Gv28T9z9GvkLx2I4rkvj2Cl/LY=;
        b=DSzvP3RKdN6rWIOl5KRKK150Wp2UHJNjljj5eQrvg3bb4U9X4PizI2nfvz14sRpRUC
         C1eYzbCwC5QwuHSgBt3YovZkRxrZiSdFSrRuwndJ2zBiL38W3GZqdrr2t4iScdBEGS3J
         xj/XFX5QBC2FrrVh2FDwjGocDbEbZZ3fjVdcub5NhnHDli9ruSKdoj3GOFqSVdXlIeu5
         Bj1Po6uG6wMAK8atPGa99eDwfgheI48g+VsV59+ZGiXQQl8nDZIpVQPCHi6JNlV/tdiu
         bDvag3awSD3ufB9B4OpCq/VBx/PNkluR7cgymwP3PkZRP7ATG5Cdk+jvlANPbJjFbvRC
         CZdA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ahnmYKRAVgc2ptE3myNA7hWYpG76UHDwO0LF455blcxRLA1MAwcLdHSd440mrsBmCRk+MzXhPj9W9zAHUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUta12NS64PQ+UumUERJ4ZtEV6GSQchHxm0ZdpQwu6u4pQGo7R
	Tn6PfsmjLyWthyAlVuHFXFsAcLaW8N241pGejiw6O1qqq1neRpNSVMBi9iXIJLve
X-Gm-Gg: AY/fxX4RLXqAGX3unGIbgrzLXyygmWeYwO96i2x5kiKbxMNEqWQPfnxMJ6traZZkWYw
	6qVXCMpSfO3sf8jcWXpbk8eDkLaWelsMJG02B+/5sCSaXqi2kR6q9U4SJE+e0d3RQDRvrNmpnP4
	DQR/kjo5f0a4HQOhtpqKacQdIfNPFsguze/TbeAOxuW6izNDjB+BAG2L4vRAsfYcuH1LMtxX7nj
	RUybpdRMHuUagcH90CN2Igg1Knvhq+NnuXvRadFXHD8RywSLvS6BLxgel+rUGpaXAps7Bgoav66
	SncQn7xa4MhPPgWaNgSOlaKP56g2Q8FMegrSqfvVqTpQxmiDr8K/1+31qrL1thLh9Dlhaw8RP6E
	UAgPhdDQQ8MkKfWakFsBBlaD2E6aChjaAYQiRJwVmC7a3BoZ67Est1lNFC3OIY/UeJq4nmI25Xx
	WI94TRzdBoGVu5SNi3M5RXyJ+t2sd8H6flhtXqgegY
X-Google-Smtp-Source: AGHT+IFn0QsPNbi03S3ptqNGcuaTkVlhDBXbsgpPpfC8g+ldSq59Ldn2uQL7XT0Qm5h+gludC7EqVw==
X-Received: by 2002:a17:902:ec90:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a2f2737be9mr463217395ad.35.1767465973396;
        Sat, 03 Jan 2026 10:46:13 -0800 (PST)
Received: from [100.80.119.234] ([146.70.250.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb30sm413509595ad.66.2026.01.03.10.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 10:46:12 -0800 (PST)
Message-ID: <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
Date: Sat, 3 Jan 2026 18:45:59 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20260102202714.184223-3-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/2/2026 8:27 PM, Shankari Anand wrote:
> Update call sites in `i2c.rs` to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> v1 -> v2:
> 
> Used the direct module name instead of including the path again,
> re-worded the commit title to rust: i2c: and
> carry-forwarded the Acked-by tag.
> 
> Link of v1: https://lore.kernel.org/all/20251123092438.182251-6-shankari.ak0208@gmail.com/
> 
> ---
>   rust/kernel/i2c.rs | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 491e6cc25cf4..9f5f18792916 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -16,10 +16,8 @@
>       error::*,
>       of,
>       prelude::*,
> -    types::{
> -        AlwaysRefCounted,
> -        Opaque, //
> -    }, //
> +    sync::aref::AlwaysRefCounted,
> +    types::Opaque, //
>   };
>   
>   use core::{
> @@ -31,7 +29,7 @@
>       }, //
>   };
>   
> -use kernel::types::ARef;
> +use kernel::sync::aref::ARef;
>   
>   /// An I2C device id table.
>   #[repr(transparent)]
> @@ -407,7 +405,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>   kernel::impl_device_context_into_aref!(I2cAdapter);
>   
>   // SAFETY: Instances of `I2cAdapter` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +unsafe impl AlwaysRefCounted for I2cAdapter {
>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };
> 

Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Since I still don’t yet have a public kernel tree, I’d appreciate it if 
someone could pick this up through their tree.

Thanks
Igor

