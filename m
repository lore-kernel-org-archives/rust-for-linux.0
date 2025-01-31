Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84600EED8
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318775; cv=none; b=Wa5sLZKYRe/jsCELzp5vAKHRLNRrUaOHVPd1MecqLZiMLfet9kjJCwC8fmR9/y3+ktLoN+JIi1g0lEZKbndH8zdP2JU4tOf+X1f1s5+w8bANXOHAl+2TlKEHcZ9kog8UtrL0WSXZe/jqSQ1O/BmJSTol/9R35huwa7x929qG4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318775; c=relaxed/simple;
	bh=BDOj4kHKdt+SAl6ePoV/E/5kNx2w0slU847QKaIlf9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq65QWBlfyd9LnU2FdHVrzlCTo4MHQ+APiWXI95CvCB3167tOci04CaKTdBDyozTPH0JmYmVXoyLhaepMIi+yHqxb/vkzt/LeqKX0HZUTM8Kcd45o0OKeUGeJsmcLvc8A0Bu/6bf2bbr017xOCyxlJd26fkwl10mVrGxam12Vok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=XTrHYb+7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="XTrHYb+7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so812992f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 02:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1738318772; x=1738923572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6K/3eYyv7Aa2aF5hOoKz5SNDtn3TKmBVLDHIqPgDlA=;
        b=XTrHYb+7SQDk/O4lcibWRYFmRx7ppgT74EQ6pmUyhf+O9idnGbjFKG11o+ZnUKPtys
         tYsKTA97YLzhJNdk4ZCiukiSc6zHSNDxRFZGWV9GwWqyeko2muTleQOc/vJSdQR+srrw
         pBIHcT2urlcG0E2q1BnVMvK6FuLW24oOgb3Jv/evWpaAuXudXmy47LtqxFrQFwRQy5QD
         /o5rmqJJYLaFasTOXtAch1PjCOG2FfxKU/sy6QesZsWye6Hxd0Y9sV4Tq5T3/ljtRa/Q
         ouCDxJ9UDj20uVntnDAnVOGEBz/EfVAD2+nFAB5w9IWg7L/u4KTHcHCzLbL/zmfEcYrT
         rrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738318772; x=1738923572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6K/3eYyv7Aa2aF5hOoKz5SNDtn3TKmBVLDHIqPgDlA=;
        b=c5m4sicVo1TFC/nlBw5q2dbbC4/HAupxtKJVMCGFxZfkzq/hph3QCe31ECMR8khgy0
         tmrESdxXjTyqL8WCobXg2hpfdBby/bRLd4L4xO4dpYIKjg4Rgy4LspTACfOn+r6UvSM0
         NNUW396FvO9avHGrEq40rYyDClslT0xJMqkHk3/7CMdE92Ft71kbm/M7llsSxuph5kZT
         BmvEUyu2zrVcq5AyBEj8F8w+qxsqCUeIoKJ2M40jbWYZLu1mqRhsv4J5Scas6nuPW8Be
         iJS1xCusGvy8A5g7nA45ByTxiw65yeJ96jTmeraJAv7/8b0Zo4fLwec6M35RNvJClpYl
         aNvw==
X-Gm-Message-State: AOJu0YyXXlsJMVcQMgrRYgvC2V0zmRcpotVVJYrnUQK1B1jG8Y9Zvfgz
	e/V/VVIxQw/Dl/giuhpYmCEY8x3ZpOHZRH24bLXi7jS2lcwQQyCK4YskMZiAXaM=
X-Gm-Gg: ASbGncv/Xq1fkwXdOtjnj3fihx+8sXHmckeXpjQF1oXr30S24E4uO95NgcEAvJei66o
	mjSbxKnOwEk2Pcv6AOl2GR0GrV46A7FCp0ZCPm5blu1YoqTQaYm3/30X9UPf20QY9Q7x74rlJ0L
	KYav9e+wpDi+MGC2yzEcDjT1JYVBY4agwe5S+qO4ov++0gqrvZQwy+kgiHssb2PCcGz2wLHlgtu
	f7JcaV3OlM2kfUujLDg80osBsmyVIBZQrSrpV0Av7pRnreUuq86rUJvl2/jJphtI9sTe5Dz/qzv
	buqx5HtkypC9oTh+
X-Google-Smtp-Source: AGHT+IFQNSgXP9aUx2oT4/Irni/kObbVuJn4/biEnOhya8E86087jnrRKG9MLhmScv+rmzyrlWy/qw==
X-Received: by 2002:a5d:4aca:0:b0:38c:3fd1:6162 with SMTP id ffacd0b85a97d-38c520af863mr7059992f8f.50.1738318771657;
        Fri, 31 Jan 2025 02:19:31 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b4e99sm4280246f8f.74.2025.01.31.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:19:31 -0800 (PST)
Message-ID: <4518f68e-c6cb-4c97-957e-b8988e2b309b@sedlak.dev>
Date: Fri, 31 Jan 2025 11:19:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] rust: platform: allow ioremap of platform
 resources
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-4-daniel.almeida@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250130220529.665896-4-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/25 11:05 PM, Daniel Almeida wrote:
> +
> +    /// Same as [`Self::ioremap_resource`] but with exclusive access to the underlying
> +    /// region.
> +    pub fn ioremap_resource_exclusive(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<Devres<ExclusiveIoMem<0>>> {
> +        self.ioremap_resource_exclusive_sized::<0>(resource)
> +    }
> +
> +    /// Returns the resource at `index`, if any.
> +    pub fn resource(&self, index: u32) -> Option<&Resource> {

Maybe we could utilize the Index [1] trait to make the API more rust~ish?
Or at least name it `resource_by_index` to keep consistency with 
`resource_by_name`?

Link: https://doc.rust-lang.org/core/ops/trait.Index.html [1]

> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
> +        let resource = unsafe {
> +            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
> +        };
> +
> +        if resource.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` as
> +        // returned by `platform_get_resource`.
> +        Some(unsafe { Resource::from_ptr(resource) })
> +    }
> +
> +    /// Returns the resource with a given `name`, if any.
> +    pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
> +        // platform_device` and `name` points to a valid C string.
> +        let resource = unsafe {
> +            bindings::platform_get_resource_byname(
> +                self.as_raw(),
> +                bindings::IORESOURCE_MEM,
> +                name.as_char_ptr(),
> +            )
> +        };
> +
> +        if resource.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` as
> +        // returned by `platform_get_resource`.
> +        Some(unsafe { Resource::from_ptr(resource) })
> +    }
>   }
>   
>   impl AsRef<device::Device> for Device {
	Daniel

