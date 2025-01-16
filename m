Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A818FC8F;
	Thu, 16 Jan 2025 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062695; cv=none; b=qEU1GKLo1AdKmM7PZLaGDDKDZtaJkohKcV9zkQNGspe4cVGF/sbDrj6Bm024LVXG5yAsu1VRS7pl6DHAoGfMxNgRFzhU3zEyVkn5RgFN3Evh6RCYeswS/TmX/1dnqVDR2iMns/qrswaWZOFyxV4KNECypqaprDDRqRqNHWjZNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062695; c=relaxed/simple;
	bh=azL/aAShsEW3acbFvA+7rVFTUF1pBIKwpH99GRCC2xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs89sEt3Rlot1NnjXJnhZD1zzt0eZU776hGBabB0UN6uoy5SIx8yFawj1e1mBrSLv16+scIopKVb7CuTcUyM0z7ds4Jo3z4vZH6/gZ/cBHD6MSFGkSaQwg8eLXTZ3f43gy+rjU3Tnl5sYGZr2476fN8S2hnDXpem9OGPmrQMNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoD6XJKN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoD6XJKN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361c705434so9298755e9.3;
        Thu, 16 Jan 2025 13:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737062692; x=1737667492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7R0SoA3/qMgAN0yJ3TePjKJZUaCZcdlE5WOQYEN2ec=;
        b=eoD6XJKNaPti/pGbAZUm5JaUe0/dGyL8ZegDLajPRAVuAOPmHZnp4TxvCDcuUONkTI
         tEPVXim65W35EsDBceOwVkbLwz1+F7NNKopgfXm+EdsOx32faLHa6RgffLMYNV811LQq
         WpcxG7q7AI8t5SXZbBWVbDG1zXJpfLDUHy6ZrwohaJTwzVCPvLTV8Qna6DZAM8NFyETT
         cc00/SxM5F4BesdqY2npjPjz9wMloQX2Lffs4shzrwiKkcr/RE/bHots01kQ7CKJOFRC
         nCdlMPO020oYDDZ2QvwXtF/2J+L6cEG8RoiE5W65sMjptAtHNzGTtPXXIMIayNQ9On/E
         FZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737062692; x=1737667492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7R0SoA3/qMgAN0yJ3TePjKJZUaCZcdlE5WOQYEN2ec=;
        b=J9hXplpC5QgjcCpAKz4OdnHmZiTi72UixXDqKXGo4z+72igTbP70A7SOjzQ60VU6dX
         AvYAx98pJi7GCOL9X9lB1Tw3nVaAwKyfHUq77Mj+ek1gU45nLPpZQPmMnuJjZ3ofpiFu
         lK8tN0Q430TdXUhkVLm9ENlRjVucLd3jWedIxO+gpPw7KPhE0u7Nw5qyLPWkfYFQDGr6
         n8qd+dqfDqgjt7ULzmrzobHOngFB1XoHiWBZiIpk3hxWbDPBu8ZzGoDsJRouA+KouEoD
         NAGUr9cfSw9KEgJEZDl2cdqbXGXhVSFkLActuSQFtreSc/ik+Y4beTEX+gt0yC5t6aGF
         95KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHbWtFoi8laFqxtl/IH/8gGrn3PwUp4mYFzgnLzt24f7myR08fgSucVCVFoc1aysn7/bzmU2dX5i914VY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfj7mtGBeGPrcYPYtTqpXOioMIYutcG4aJZbJ0ebN6Tn6wHdh
	XCyBJ0DMmQFc5Fwk5WjR6EbVVz6Rdt9QgXC19onFHBsww+FArDcl
X-Gm-Gg: ASbGncs9DgiITD7XM8njWCDFONMErNvPkl6miqeOT8pVAl5KmmFVY9TNP8L4yJlUym7
	ijBgvtm3sJlBRJrBbJWlzK+96Z3wMvVr4TWbLzMagEUtZUBxx4AT+LL5V3PJ/WXfT+p3XfekvfK
	kqpz2KSmhMQtNqZ3vc2OIDLN+VKqkxJtxDqUDLdenVt8oINIhpxf27hEaJNeN6dt5S+Y5mkNbKk
	AKMuOjzw617/NpnuynUynSRPtxJky2J2u9m9shi7swNlS7SURbcOQTIgJRw2Nw3DvykqA==
X-Google-Smtp-Source: AGHT+IGUVfELr0ArYKh/K3cWTr9jrHQ3wA/FfkPw4+Qp6motHMUxyrVSQvNOK8Yy4O7N7YXY+4OmaQ==
X-Received: by 2002:a05:600c:5486:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-438913bfa0fmr1889465e9.1.1737062692025;
        Thu, 16 Jan 2025 13:24:52 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389040854bsm11443295e9.7.2025.01.16.13.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 13:24:51 -0800 (PST)
Message-ID: <45db2a00-bd57-4fad-8845-6d9109622160@gmail.com>
Date: Thu, 16 Jan 2025 22:24:50 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/3] rust: platform: add Io support
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250116125632.65017-1-daniel.almeida@collabora.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250116125632.65017-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Daniel

On 16.01.25 1:56 PM, Daniel Almeida wrote:
> Changes in v5:
> 
> - resend v5, as the r4l list was not cc'd
> - use srctree where applicable in the docs (Alice)
> - Remove 'mut' in Resource::from_ptr() (Alice)
> - Add 'invariants' section for Resource (Alice)
> - Fix typos in mem.rs (Alice)
> - Turn 'exclusive' into a const generic (Alice)
> - Fix example in platform.rs (Alice)
> - Rework the resource.is_null() check (Alice)
> - Refactor IoMem::new() to return DevRes<IoMem> directly (Danilo)
> 
> link to v4: https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-daniel.almeida@collabora.com/
> 
> Changes in v4:
> 
> - Rebased on top of driver-core-next
> - Split series in multiple patches (Danilo)
> - Move IoMem and Resource into its own files (Danilo)
> - Fix a missing "if exclusive {...}" check (Danilo)
> - Fixed the example, since it was using the old API (Danilo)
> - Use Opaque in `Resource`, instead of NonNull and PhantomData (Boqun)
> - Highlight that non-exclusive access to the iomem might be required in some cases
> - Fixed the safety comment in IoMem::deref()
> 
> Link to v3: https://lore.kernel.org/rust-for-linux/20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com/
> 
> Changes in v3:
> - Rebased on top of v5 for the PCI/Platform abstractions
> - platform_get_resource is now called only once when calling ioremap
> - Introduced a platform::Resource type, which is bound to the lifetime of the
>  platform Device
> - Allow retrieving resources from the platform device either by index or
>  name
> - Make request_mem_region() optional
> - Use resource.name() in request_mem_region
> - Reword the example to remove an unaligned, out-of-bounds offset
> - Update the safety requirements of platform::IoMem
> 
> Changes in v2:
> - reworked the commit message
> - added missing request_mem_region call (Thanks Alice, Danilo)
> - IoMem::new() now takes the platform::Device, the resource number and
>  the name, instead of an address and a size (thanks, Danilo)
> - Added a new example for both sized and unsized versions of IoMem.
> - Compiled the examples using kunit.py (thanks for the tip, Alice!)
> - Removed instances of `foo as _`. All `as` casts now spell out the actual
>  type.
> - Now compiling with CLIPPY=1 (I realized I had forgotten, sorry)
> - Rebased on top of rust-next to check for any warnings given the new
>  unsafe lints.
> 
> Daniel Almeida (3):
>   rust: io: add resource abstraction
>   rust: io: mem: add a generic iomem abstraction
>   rust: platform: allow ioremap of platform resources
> 
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/io.c               |  17 ++++++
>  rust/kernel/io.rs               |   3 +
>  rust/kernel/io/mem.rs           |  98 +++++++++++++++++++++++++++++
>  rust/kernel/io/resource.rs      |  53 ++++++++++++++++
>  rust/kernel/platform.rs         | 105 +++++++++++++++++++++++++++++++-
>  6 files changed, 276 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/io/mem.rs
>  create mode 100644 rust/kernel/io/resource.rs
> 


I've tested this patch-set with my ARM 32-bit arm patches[0] on a De1Soc (Fpga + Arm Cortex A9).

I've got it to work by changing the three instances of u64 (mentioned on the individual patches) to bindings::resource_size_t.
I used a small Fpga configuration that allows me to change a led from the kernel driver.

So with these fixed:

Tested-by: Christian Schrefl <chrisi.schrefl@gmail.com>

[0]: https://github.com/onestacked/linux/commit/f84be45f7311ea5b5a76123028f9fb8fda9f9e7f

Cheers
Christian
