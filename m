Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD01B4F0E;
	Thu, 16 Jan 2025 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062078; cv=none; b=YdcectE3rhqcfCFSYMgfC8RFi2dmvbyi8ZhY6veOM5/CnKLE1MDuEQv9X1JbC9joqqZfSX14IIZ/KGSdEu/oUWF8lZNtfn4szCLg2zSvBlnXb/jcwRieVVDBoKlTyTdFJlKGVp8jyux15E/kwFCbGcv309wVRSlKwJWY3103c6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062078; c=relaxed/simple;
	bh=2uv9Lbu1Nqqg12kLGsNskpbYwuEncsa6g5cOTJVoGuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APjXFgJHNavLtPsBZy+A4fjXK8lx7/vUBPBBoFscAE7x3gSY9L5I4N5TY5ejUUOitk+necb70OchPv+rtGreouo6JTqu5Z1MMBs3bNYsmP9CaZjhgPuxCvNE+KWS6hpFckg3BufZOXo4VrGjCPvsI+p2HoQm0gbkdz3Tq8jlogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHb/H+q3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHb/H+q3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so9420875e9.1;
        Thu, 16 Jan 2025 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737062073; x=1737666873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jE4K3WNZH60KRWIMndmfIAXUSOAfO7K+WFQ5rVBHfSE=;
        b=gHb/H+q3vWZKSLhKfNl0dCP6af2gycxFP3XWd7h5ESLG2S571ad3NDD7VZXrACif0B
         06FYQXrL/mQ8J9Ohkt/D8UHlfbdrFDFbKpfnOUmk7l7+QyoPzNa4DnkIaMPZm/Saj6HF
         YzIfQn7Y8A1OQrrS8exB6CRxERVjOCT4U7spHanNKpXPLku0PVHp9a6TYqKY443tYGWo
         mcf69ysaMuoNlvzhDUIOiyh7xGvLSQu/5NPo71Bj5E8fGihsisXq1DTnaJReG3bCjOi+
         ZrziVz8GAfRLxJXQ7j68l8gM6oOxn3fQVUbiFpjBPIu5ziREGcsAPvgwv+LhsbhZ08it
         9MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737062073; x=1737666873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jE4K3WNZH60KRWIMndmfIAXUSOAfO7K+WFQ5rVBHfSE=;
        b=rZxOK9WAsIsfO8/wM5lvuhPO9Du9ohR8IsJqkwnK6DKcpJdFqx/ax6nHf8J1Dfqm5Z
         oyuLtvbjjLMKHHdGwz8Pk+j7zXbS3cMlrskC3vIo6WkrYBwla+W88oFPJg7g26Oap6jK
         9LboTIyX8wNlRIo6mKazxBrI2MlJIFWyjuWn1qsUVqSzCKT7Mu15SC35yI26ga+eJ9Ce
         tWfCvBNqXGYa4242+3DEg9yaacR1UrG2vmSCL1oB6V2rZtIznV3FtZ7suMBLhpa81Ju0
         Ufyeae3IgmckUBIgdcUY+KM3b6238+e9YzI61MdtI8+5aKxBCXMdRPmWoSNiM6RHRHd0
         X3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ivIkU4KNG5AeP2tVbhqmLkjFcflpOPSA+oBf2+SBGIptOEC+ODH6M3QS/wNwD0qXM3hHPXJNrhSbbQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+bIl8mjYy+QupewJWuwLF+lwBF0rrEYA4+aZ96du1qtFlxHa
	8pdz/DzuuFzbo/munUSPE7yhtTdTHL76ekFu/JD1VOzZmzcWWly1
X-Gm-Gg: ASbGncv3GUCps5HUj+0F5w050CZ5zhJVy05knIeynEZhzponZ2sYSkClJ0UWU8rYt1y
	QKabdsD6cu2xxVqzchaj85qVvkciMF3/aeDbMnlgwcNVlhGUO8Y9/jL+c6O4oX6STr5V1w5gjsc
	x5ywhU3LG75RVkV6we4OPEukZ/jpCKnvCWip76LVQjjtI8bno9XPQ4bWXQ6gMCeMJRfvwrVnRg1
	eKyjGet1f8M8WRozM6xLQMzXMI6WaIB/sJhlH3OCtTxIqG9z+Fy3hVKXh5NpZY/sRaSAA==
X-Google-Smtp-Source: AGHT+IG5Rq7uikxaFn69WaG6dQPjh2ZylXHg23Lzaid1+gn/wVxT+luDyGV9iU/ydN/TRWfdSvPSVg==
X-Received: by 2002:a05:600c:1c21:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-438914391bbmr1901085e9.29.1737062073209;
        Thu, 16 Jan 2025 13:14:33 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046250csm10581845e9.25.2025.01.16.13.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 13:14:32 -0800 (PST)
Message-ID: <81183281-ce70-4521-9c8e-9701328c0713@gmail.com>
Date: Thu, 16 Jan 2025 22:14:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250116125632.65017-1-daniel.almeida@collabora.com>
 <20250116125632.65017-2-daniel.almeida@collabora.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250116125632.65017-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel

On 16.01.25 1:56 PM, Daniel Almeida wrote:
> In preparation for ioremap support, add a Rust abstraction for struct
> resource.
> 
> A future commit will introduce the Rust API to ioremap a resource from a
> platform device. The current abstraction, therefore, adds only the
> minimum API needed to get that done.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/io.c               |  7 +++++
>  rust/kernel/io.rs               |  2 ++
>  rust/kernel/io/resource.rs      | 53 +++++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 rust/kernel/io/resource.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index e9fdceb568b8..f9c2eedb5b9b 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -16,6 +16,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 4c2401ccd720..3cb47bd01942 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/io.h>
> +#include <linux/ioport.h>
>  
>  void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
>  {
> @@ -99,3 +100,9 @@ void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
>  	writeq_relaxed(value, addr);
>  }
>  #endif
> +
> +resource_size_t rust_helper_resource_size(struct resource *res)
> +{
> +	return resource_size(res);
> +}
> +
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index d4a73e52e3ee..566d8b177e01 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,8 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>  
> +pub mod resource;
> +
>  /// Raw representation of an MMIO region.
>  ///
>  /// By itself, the existence of an instance of this structure does not provide any guarantees that
> diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> new file mode 100644
> index 000000000000..ca92f9af613b
> --- /dev/null
> +++ b/rust/kernel/io/resource.rs
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstraction for system resources.
> +//!
> +//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport.h)
> +
> +use crate::str::CStr;
> +use crate::types::Opaque;
> +
> +/// A resource abstraction.
> +///
> +/// # Invariants
> +///
> +/// `Resource` is a transparent wrapper around a valid `bindings::resource`.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);
> +
> +impl Resource {
> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that for the duration of 'a, the pointer will
> +    /// point at a valid `bindings::resource`
> +    ///
> +    /// The caller must also ensure that the `Resource` is only accessed via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &'a Self {
> +        // SAFETY: Self is a transparent wrapper around `Opaque<bindings::resource>`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> bindings::resource_size_t {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {

Please use bindings::resource_size_t to be compatible with 32-bit architectures.


> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { *inner }.start
> +    }
> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &CStr {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }
> +    }
> +}

Cheers
Christian

