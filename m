Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE93EBF00
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769236266; cv=none; b=akgf2Ux/dW3RQ6Hnw2mk8xiyXTD91oPDy3gJ0sqmn0DuCZZdNxyJsTgoDWsWLLCNDXu55YP6XkP+dkVPtkEgnGYbh4o4qPvrdN6I8f/fyNx0sSUPLZ7iI8c9W+1+JLOsBYCNQXadW/i8XTGG/3z1Rk+RoVI9DzKYfx54hkZvSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769236266; c=relaxed/simple;
	bh=AXbsp0iA+kfhsYrr7IT/8HQp7O8TAuYUd5VamoNhZWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdYkrRoiqwhykrJwSaTIeNN0WrCUomzc6vv91aLb2WbgQDmtsfNg6xYt6IkmYn8ptTyGHzgx96A0KzAz57z0UFCyQ/8PdkvSQin4ZgHrcSU7dSUs0bf6KsTbCNjOrCZ3PiwLSQaob9Bf6kK+gyQrP8XAlI2mkPqxiFz/dkD0dQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWDzpH9b; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWDzpH9b"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4359228b7c6so1798425f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 22:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236263; x=1769841063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGRbMOTASBrvGeUUbJ3PGk+C0O4AnQDM0U+seE4zEkQ=;
        b=MWDzpH9bTcfjEq8AtFBO0QUY2w2sYyser2QzAdrPTLcxXSl4O9AAoKFbTbD/mFqF+W
         cWi9Xc5ETrAjUvnTqFI8Ot5guDmrImqFrPG6Y6Z1K8e03uDPtpdPYsNy09PKl5ayExwq
         12RMDh4Ugyvds+g2SLVKLwwbyzErFbMF1oiI7UAWVH3qu5tuDFIqoTXu40y+8U8GY3Xv
         KjadY+5lOnX3zg7jjhI5cb7OWFZ7D8cenuFTjSVB4DIZDgr6JU1Yn8mUPh1kpCvr4Dit
         LrnR5ITbR30eXTfsTpYq2zX502sU+h5hOTiITOOgyxKOc2S2A01imOHSXTQD8601j9/J
         XDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236263; x=1769841063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGRbMOTASBrvGeUUbJ3PGk+C0O4AnQDM0U+seE4zEkQ=;
        b=ChKrtGbPUJd6d+z5gB65or8Mqpr3z/Jvyj9gVLoid5H/qQnIOdxsFkgRVhTbJVa7IJ
         dbFHUHljGar8rVFyC3IAmTNy+MlSahw6dJRzGTpQkJblp3bfOn0u81lrcSWccDmHBJaZ
         RWQTa2JXM8VbS1FoflSDxRag5xKEkRck+QVwiY69O1/YzFi6sentd6VKdYC2x7q89Z2m
         oDn2GsWER1FzA0sJ7wojbya+y3Fma4sMGqMG3gJ7IIF3L2yS8VuV0TVa51TgynC2ntL9
         Yyy1+l40Be/gtyZSBVt8j1rHuNB2/4AWW29w8pmB1EithLXEctDSzyKBVCWmQsruvYK/
         F1FA==
X-Gm-Message-State: AOJu0YyqcyaHj0zyHJN90YIvFKIq5GokgChxdlJdqO/CIhAH9E5iEUQe
	LSwhXDn0/03ODvel2MDlnpKxFpJZeXLx79qjzYU2csJXlNR3QbbsgKvr
X-Gm-Gg: AZuq6aJbiTSaIVAJdZDY498KZmnRCxd/8H2XS+72U5hV2mkCZbj/HF6BDZVc+qiU2Vq
	IPEkrhn33Kqk2Xef7iZ+6IexcFNUAcGDHuf/Ju//30PFwMRpgprj0uxAO9R5p9VzcRKpcq44ad9
	ot8NOT4GTxFRpElePFruTm66qyCODi0eSOBnuKxmGtW5/0MqJ5NZ1j66g1ptrGBOUsKdEWHzQxQ
	8hPekfVsC992Iv3U7L9UGpcXOzVRmY0dB0pIXxQM37O3RtyWPZgnhcAhFy8sPgy0qFphOkyBZA+
	6RNgnzeTUdi/r67o8ZBwmSfyMgIPOc6eDT47P5LnI4ywfIIMEU94Hx7OzzWh1V6ADY/2xIT774S
	Ar2MiZW3FY3iNPW27YmgauHR4fh37AAc6OEKexf/7kuD4wyaQATtdn/ebKtg91clqElaJgUTMoU
	XRAxvEeyNKXUsGDLcLEgGegO4ctGT8R2vNMUTd4H8JlFtn8ouao+CadeCDRqYb7LZ1MYV53CQ5s
	UgyD3gC7t0X8tsdcH+p+4yJUXtc0UkpJ0TQEyZfMRMpXA==
X-Received: by 2002:a05:6000:1a8a:b0:435:9801:d393 with SMTP id ffacd0b85a97d-435b1603648mr9336909f8f.37.1769236262816;
        Fri, 23 Jan 2026 22:31:02 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:84b0:9a99:cca7:e10c? (p200300dfbf2de30084b09a99cca7e10c.dip0.t-ipconnect.de. [2003:df:bf2d:e300:84b0:9a99:cca7:e10c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm11347081f8f.8.2026.01.23.22.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 22:31:02 -0800 (PST)
Message-ID: <cdc52b14-bf2f-4189-8594-25c25d9f78c9@gmail.com>
Date: Sat, 24 Jan 2026 07:31:00 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] rust: device: support `dev_printk` on all devices
To: Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123175854.176735-1-gary@kernel.org>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.26 18:58, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Currently, `dev_*` only works on the core `Device`, but not on any other
> bus or class device objects. This causes a pattern of
> `dev_info!(pdev.as_ref())` which is not ideal.
> 
> This adds support of using these devices directly with `dev_*` macros, by
> adding `AsRef` call inside the macro. To make sure we can still use just
> `kernel::device::Device`, as `AsRef` implementation is added for it; this
> is typical for types that is designed to use with `AsRef` anyway, for
> example, `str` implements `AsRef<str>` and `Path` implements `AsRef<Path>`.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> 
> Notes:
>     v1 -> v2:
>     - split change to samples/rust to subsystems
>     - converted more cases where `as_ref()` is only for dev_printk


Many thanks for adding the additional cases!

With the discussion in [1], I think the rule of thumb is now:

* If `&Device` is only needed specifically for printing, then no
`.as_ref()` and no helper variable are needed any more (as done in
this patch series).
* If you already need to obtain `&Device` not only for printing, but
also for other use cases, then a helper variable like `let dev =
pdev.as_ref();` is fine. An example is `probe()` in
samples/rust/rust_driver_platform.rs [2].

I think we have a trivial warning from the kernel test robot on the
USB one, now. But with that fixed (if its not too late already):

Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks,

Dirk

[1]
https://lore.kernel.org/rust-for-linux/DFW5LUIQVZK0.2W01YO54KTKR7@garyguo.net/

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_driver_platform.rs#n103


>     - Link to v1: https://lore.kernel.org/rust-for-linux/20260120181152.3640314-1-gary@kernel.org/
> 
>  rust/kernel/device.rs | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index c7b5db9dcca1..94e0548e7687 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -601,6 +601,13 @@ impl DeviceContext for Core {}
>  impl DeviceContext for CoreInternal {}
>  impl DeviceContext for Normal {}
>  
> +impl<Ctx: DeviceContext> AsRef<Device<Ctx>> for Device<Ctx> {
> +    #[inline]
> +    fn as_ref(&self) -> &Device<Ctx> {
> +        self
> +    }
> +}
> +
>  /// Convert device references to bus device references.
>  ///
>  /// Bus devices can implement this trait to allow abstractions to provide the bus device in
> @@ -720,7 +727,7 @@ macro_rules! impl_device_context_into_aref {
>  macro_rules! dev_printk {
>      ($method:ident, $dev:expr, $($f:tt)*) => {
>          {
> -            ($dev).$method($crate::prelude::fmt!($($f)*));
> +            $crate::device::Device::$method($dev.as_ref(), $crate::prelude::fmt!($($f)*))
>          }
>      }
>  }
> 
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d

