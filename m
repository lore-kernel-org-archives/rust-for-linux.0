Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94E25F7B9
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866450; cv=none; b=Cxu31jeBmQngAX/o+aHC7Lwx6ysWqu0oi5qymc7E4SDc5zIqEH+sfsLf4WyZmu4HsaGUcu6P4Quqp6JaJ3wmIv9nJepOar4Yat/0xGI3+QDVCrtwAUesdUHZ6LfmniztYOTSKJG1C1l7mDEuIG+tE0EqUL1KfD0SdMthbco7PyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866450; c=relaxed/simple;
	bh=B3tW+T3+xTqFN7KjQ7CwQXAjt+4LE0T30rQy08uzlD8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pxe8DjNRfAiyj0iOX4fMGYp7G0U+43klkO/j4bmtLGZbIK0vVBuEwFciDpQkqcsqOv6Zc/WRQgQlzqkqAuslhlp1+H7YP3lI5uEZMJwwuC+zBKiT+sfddbmFKwZmgf3yVCAJ822mXXWNwdjZtdt0YGZmSPn2pIb4xFLsT1Q1/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr9uV/2v; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr9uV/2v"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432755545fcso1961872f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 05:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769866447; x=1770471247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GMDkRHv2Khx/Muzvkcr6QDmiyEqHb/dntZQAQVhjCU=;
        b=nr9uV/2vtw2hD3wZzckrmHpKRl8EL1jFiH8752JizKUiDudOce7+QJIsd7mvl4tGz+
         rZ4O8mvxaHgkG/uLa/KItDVKxj0bf/Me2Dk7R4yPyIX70ghoOgBlSXjldLwsbFt0t/OW
         4LLccSwYwYs7coFG17ZYr2Zk/US9TALaFNxXKlANjc874FaTJfiEKFX+HM1b+zgMKPuV
         RH1QTSP377/Zf4vqbTKIVjjKh/DBUAxEq89di7ZFBROjikumMNjewAtmWeuH9t59wGkZ
         OgcIpnZVpy8Jz8yOETB/7wmHd8IY0BuBmYQK6xY6gyFkMdtxcu4/VP5fQTNyGkTOSO+8
         iVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866447; x=1770471247;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GMDkRHv2Khx/Muzvkcr6QDmiyEqHb/dntZQAQVhjCU=;
        b=U4ax1FXkNgxb42+sFYmtsF82q4qbmEUBAY5lEGNeQLslnRdcbyiy9Jmhrb1RiPnpiz
         xXM0o9+na1fQRra3D0lh6NQGj24NHhiHWmfambQIoBGoR2mqryo0DuTE9DmBGj3lPaRA
         NgeFDdjxJK3woajCpzMRTGb4c1tG5JTj0ddLuYlq0S9rVCvEtndbm45319X6SnW7vFXj
         5wBqeyYcW3A+JJ67qciMinHZe9X2sKW1cxSIo6SGbcpV+JkQXX3NqJOG8NEEbaXeYJY5
         x36lqJ786BeKg7a2vIoA692N/axE+wTPVQOdVaePGmI7G9lIZAAZkuDMiK2wd9y24wFk
         uIBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIE45rSM1bEnzu0pPC0NLNAC8HXpHkBYKCNgc5b3cx7ezVHAsN12dS6rJ3r0hU4BuU32t3TR9SEM53NxpV9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDdgF0CIobNWxEcz4FtdbJkDal+8KKSyIf+DgorJQRYoZkvRv
	GHKpMb6JGz1oMMlNb4naswm/VBPmqX3lkm3qgeB5Wi5/s3Qksck6bqh9
X-Gm-Gg: AZuq6aJD5QH+UuRZWANT0+XUfsy1fI13tCtmO33/Sqlpa6hbghL3mp217yKdF2400eD
	jS20RtzTQSNWxbAtpOn+WxtEu0H8cDAIirkwRpYpREgu6f4gyWEd/UFnQqbN3oVFjZdOq0D6DJz
	2COT15QH9L49WIlPg3cf5+iP6JknnDijZn3ZqPDS5MC9yCPfh3N+n0+XEaDqE+b9JN8FTewdwcD
	hevc/ZzT04af/Cejk6+Hsj52wPXWXN/0VqZ48BiJvqv2b00dcMphXDZEkOpxtI60Efa4w559rFu
	zTdLbFuFBUywQrz/YWwrwzYgKZ4JqJNyKFCU5nZRyRC/Ubk2aYateZepJV+K9RTW+HqYY9x7TF9
	c6OhEibBTV33cn1Muo/gR+ijBPW4JHHUoqKWrNB2nutTkobdSzv4pdxeoBJvRcJQNWL+2oIO+Y9
	mSiczvSMu6H+r4cctZ6/cLYRJSs5BcsqKNoFY6ctIHGg0DkwEAqaYDcLz5AsrGJ/uuNzfJrrat4
	NFBoLI0qpOHg3Ko0168bIq5TUXRAg7L2JqyTEibIp9H3w==
X-Received: by 2002:a05:6000:26c3:b0:435:bbd7:18e1 with SMTP id ffacd0b85a97d-435f3a6f621mr8477082f8f.9.1769866446676;
        Sat, 31 Jan 2026 05:34:06 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:fa3c:28af:ecab:143f? (p200300dfbf2de300fa3c28afecab143f.dip0.t-ipconnect.de. [2003:df:bf2d:e300:fa3c:28af:ecab:143f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e13235f5sm29300881f8f.29.2026.01.31.05.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 05:34:06 -0800 (PST)
Message-ID: <49693073-e49e-4b5f-849b-6dd5fd3de712@gmail.com>
Date: Sat, 31 Jan 2026 14:34:05 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH 2/2] samples: rust: pci: exercise capability lookup
To: Zijing Zhang <zijing.zhang@ry.rs>, dakr@kernel.org,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
 gary@garyguo.net
References: <20260131040200.1242566-1-zijing.zhang@ry.rs>
 <20260131040200.1242566-3-zijing.zhang@ry.rs>
Content-Language: de-AT-frami
In-Reply-To: <20260131040200.1242566-3-zijing.zhang@ry.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.26 05:02, Zijing Zhang wrote:
> Use the new pci::Device capability helpers to locate a few common
> capabilities (standard and extended).
> 
> Also try a best-effort self-check to exercise the `Some(offset)` path
> when the device advertises a standard capability list or an ext-cap header.
> 
> Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
> ---
>  samples/rust/rust_driver_pci.rs | 90 +++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
> index 4dfb8a6a4707..195d37edff2c 100644
> --- a/samples/rust/rust_driver_pci.rs
> +++ b/samples/rust/rust_driver_pci.rs
> @@ -5,6 +5,7 @@
>  //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
>  
>  use kernel::{
> +    bindings,
>      device::Bound,
>      device::Core,
>      devres::Devres,
> @@ -89,6 +90,95 @@ fn config_space(pdev: &pci::Device<Bound>) {
>              "pci-testdev config space read32 BAR 0: {:x}\n",
>              config.read32(0x10)
>          );
> +
> +        for (name, id) in [
> +            ("PM", bindings::PCI_CAP_ID_PM as u8),
> +            ("MSI", bindings::PCI_CAP_ID_MSI as u8),
> +            ("PCIe", bindings::PCI_CAP_ID_EXP as u8),


Would it make sense to drop the direct usage of `bindings` by the
user? And add an abstraction for this in pci.rs? E.g. an enum?


> +        ] {
> +            if let Some(pos) = pdev.find_capability(id) {
> +                dev_info!(pdev.as_ref(), "pci-testdev {name} cap @ 0x{:02x}\n", pos);


Just as a heads up, using `as_ref()`in the `dev_*` prints should be
obsolete soon:

https://lore.kernel.org/rust-for-linux/20260120181152.3640314-2-gary@kernel.org/


> +            } else {
> +                dev_info!(pdev.as_ref(), "pci-testdev has no {name} capability\n");
> +            }
> +        }
> +
> +        // Best-effort self-check to exercise the `Some(offset)` path:
> +        // If the device advertises a standard capability list, read the first capability ID
> +        // directly from config space and verify that `find_capability()` returns an offset.
> +        let status = config.read16(bindings::PCI_STATUS as usize);
> +        if (status & bindings::PCI_STATUS_CAP_LIST as u16) != 0 {
> +            let pos = config.read8(bindings::PCI_CAPABILITY_LIST as usize);


An other heads up: This should use the `register!()` macro soon:

https://lore.kernel.org/rust-for-linux/20260128-register-v4-6-aee3a33d9649@nvidia.com/


> +            if pos != 0 {
> +                let id = config.read8(pos as usize + bindings::PCI_CAP_LIST_ID as usize);
> +                match pdev.find_capability(id) {
> +                    Some(found) => dev_info!(
> +                        pdev.as_ref(),
> +                        "pci-testdev selfcheck: cap id 0x{:02x} @ 0x{:02x} (find -> 0x{:02x})\n",
> +                        id,
> +                        pos,
> +                        found
> +                    ),
> +                    None => dev_info!(
> +                        pdev.as_ref(),
> +                        "pci-testdev selfcheck: cap id 0x{:02x} @ 0x{:02x} (find -> none)\n",
> +                        id,
> +                        pos
> +                    ),
> +                }
> +            } else {
> +                dev_info!(pdev.as_ref(), "pci-testdev selfcheck: empty cap list\n");
> +            }
> +        } else {
> +            dev_info!(pdev.as_ref(), "pci-testdev selfcheck: no cap list\n");
> +        }


Could the indentation and nesting level of this block be reduced by
moving this to a helper function, e.g. `check_standard_capability()`,
and in that use early returns?

Same for the extended capabilities below (e.g.
`check_extended_capability()`).

And, going even one step further: I don't know much about PCI, but is
this a common pattern several users / drivers might need? If so it
might make sense to move some of this `check_*_capability()` to pci.rs?

Best regards

Dirk


> +        for (name, id) in [
> +            ("DSN", bindings::PCI_EXT_CAP_ID_DSN as u16),
> +            ("SR-IOV", bindings::PCI_EXT_CAP_ID_SRIOV as u16),
> +        ] {
> +            if let Some(pos) = pdev.find_ext_capability(id) {
> +                dev_info!(pdev.as_ref(), "pci-testdev {name} ext cap @ 0x{:04x}\n", pos);
> +            } else {
> +                dev_info!(pdev.as_ref(), "pci-testdev has no {name} ext capability\n");
> +            }
> +        }
> +
> +        // Best-effort self-check for extended capabilities.
> +        //
> +        // If the device has PCIe extended configuration space, verify that
> +        // `find_ext_capability()` can find the ID from the first extended
> +        // capability header (which is located right after the 256-byte legacy
> +        // configuration space).
> +        if let Ok(config_ext) = pdev.config_space_extended() {
> +            let hdr = config_ext.read32(bindings::PCI_CFG_SPACE_SIZE as usize);
> +            if hdr != 0 && hdr != u32::MAX {
> +                let id = (hdr & 0xffff) as u16;
> +                match pdev.find_ext_capability(id) {
> +                    Some(found) => dev_info!(
> +                        pdev.as_ref(),
> +                        "pci-testdev selfcheck: ext cap id 0x{:04x} @ 0x{:04x} (find -> 0x{:04x})\n",
> +                        id,
> +                        bindings::PCI_CFG_SPACE_SIZE,
> +                        found
> +                    ),
> +                    None => dev_info!(
> +                        pdev.as_ref(),
> +                        "pci-testdev selfcheck: ext cap id 0x{:04x} @ 0x{:04x} (find -> none)\n",
> +                        id,
> +                        bindings::PCI_CFG_SPACE_SIZE
> +                    ),
> +                }
> +            } else {
> +                dev_info!(
> +                    pdev.as_ref(),
> +                    "pci-testdev selfcheck: no ext cap header @ 0x{:04x}\n",
> +                    bindings::PCI_CFG_SPACE_SIZE
> +                );
> +            }
> +        } else {
> +            dev_info!(pdev.as_ref(), "pci-testdev selfcheck: no ext config space\n");
> +        }
>      }
>  }
>  

