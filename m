Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4520FA98
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459767; cv=none; b=gfH4yeAIKg2hk2wZsgge59s6aXSYmQdT8j//ZVyV0jljqIl1Xf2bkz7d4ntR7oMiXHiX6/BOqwzkzkAp1klqhGjOmQLgPdhg/BR/ZsQFnmGresTgOLwEG6VARDmPp2GB3Xzn97JFEPZiKu89x7Hf5p2dU08dNAufHzkdE4eMGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459767; c=relaxed/simple;
	bh=KNJnFdpohVmIa9lQL3tDOPD+TWPXmNHbRtdDIF7XKFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hhBf4eI2EGfevMsq4YJUkdM2hCT8eHwVOAn46gPhUH1h5Z5C2TVy3Eo0giqMktzDkB6wP/gkJIy+hx3BsO8HSyeVX4bEn7tXxe7N31Y2/+A4p14v3zYtcB5va/vqwU4bdIrB5S+FJrkb6WVa4puCmtsFUGzE4s2wepjxmNRRXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nKJ1iucM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKJ1iucM"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4394c747c72so2695635e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742459764; x=1743064564; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F//KPN2uLlDC+J9SdRcv9HHuEvs+T8Y6Iwqb4VpEjaQ=;
        b=nKJ1iucMm4+Ft7xY7dWQjBzS9hYTpOAaS0HrvwhD4WKQglGeji44zIKnRc5a0tC40U
         wIzQ5R42sHRNnC8jJUrfnQ5PTnUYUt6IGwuKT+isj56g+xZuK3bF6oy4e4Y5xHXyJPgy
         oQXDIqJNlz7w5sgdcqSdg0hj02IzXurvJzEKGhwDiskbA2b24KBJ1KAEzmlZkumWcCZd
         KFgsufXXs2LwyrwzqjfduLjOLWrmtil1671KKqXeBx+TsfAQpy3YSybba/7D3GoknfWF
         mflNIdQpmLDbIo5vH5Q5pjVi3/rmjRqOcMExqFVSzJ+wUC7+Dz9VlRUAISePfLsv2Zit
         U9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459764; x=1743064564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F//KPN2uLlDC+J9SdRcv9HHuEvs+T8Y6Iwqb4VpEjaQ=;
        b=cm93sLn5WBG7N/PGHEEzGxrMhKmdiNzjDTNiIrh9AbTRLtNDhQl93nMKf/EKgg8/kV
         F8qR0tgt3NmxdFvbA9aZ0+TkrpnhXiFeylFBleZK7oEmvCkwIU2gYcHRveCMf0jGBPbs
         n+A17/eWCJofCNqesvhtUdDNhSczdDVev9yha+nsBNIevLKh/SDty5fbozc7kuDfz2PE
         0LA11tlSv2w+3vqj3Yyotk0yHYUx2/Uabc+yygU379QCi49OByFDRfIQS00M+xrvdPPO
         4GgBM99Y8FlxhnJ04w/pgAwpju9jledSptRuBOZvRGynkpnz0waOIh1RSxP7ieqeI5G8
         hJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWQjDK9RQJrkAUWp/L7r50AZfdwmLc+W+YIrqsDXD07X6bpkolqVzNxpQ3fg5pkDe9YP1bGjoZWqiu2bi74Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJvMOMRt+5N1FgveGAm3VFMEsvyXaifGjoFi1ViFi+wm8tP3b
	UFfZqJBw4Y9VNXoWtD0L080Zz7Lbupt4ods2DokOUIC9S2lk9xXn5gkXN012x8fdS0ErWgrJ/sL
	BW0xT40j3ZYkm8A==
X-Google-Smtp-Source: AGHT+IGae8DQmm0qB5K/T2yS0Ts18/juxqQiCR0uNBRGxkWQTVlUWPIuqtVDcfSLOrlM8VzPf2m3TStxTVObcuM=
X-Received: from wmby10.prod.google.com ([2002:a05:600c:c04a:b0:43d:1f4c:ccf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f86:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-43d4378b1bbmr48923425e9.8.1742459764068;
 Thu, 20 Mar 2025 01:36:04 -0700 (PDT)
Date: Thu, 20 Mar 2025 08:36:02 +0000
In-Reply-To: <20250319203112.131959-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250319203112.131959-1-dakr@kernel.org> <20250319203112.131959-3-dakr@kernel.org>
Message-ID: <Z9vTctFR7QAOa4tn@google.com>
Subject: Re: [PATCH 2/4] rust: device: implement bus_type_raw()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 19, 2025 at 09:30:26PM +0100, Danilo Krummrich wrote:
> Implement bus_type_raw(), which returns a raw pointer to the device'
> struct bus_type.
> 
> This is useful for bus devices, to implement the following trait.
> 
> 	impl TryFrom<&Device> for &pci::Device
> 
> With this a caller can try to get the bus specific device from a generic
> device in a safe way. try_from() will only succeed if the generic
> device' bus type pointer matches the pointer of the bus' type.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/device.rs | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 76b341441f3f..e2de0efd4a27 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -78,6 +78,13 @@ pub fn parent<'a>(&self) -> Option<&'a Self> {
>          }
>      }
>  
> +    /// Returns a raw pointer to the device' bus type.
> +    #[expect(unused)]
> +    pub(crate) fn bus_type_raw(&self) -> *const bindings::bus_type {
> +        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.

Is this field immutable?

> +        unsafe { (*self.as_raw()).bus }
> +    }
> +
>      /// Convert a raw C `struct device` pointer to a `&'a Device`.
>      ///
>      /// # Safety
> -- 
> 2.48.1
> 
