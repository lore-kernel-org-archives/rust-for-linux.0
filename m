Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7271F32B135
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256618; cv=pass; b=CHczpJR5EKamW2qsx04KfYsQaxkVaRfm8TmpStt/UxKAeQ0OTlkdmxDx8G6RxB7ZKFj990/a/0QQTmHvacuFADjyIP3RIorSqTeBitDBYX3fSwotp99LjtOoHJiUnd1NJfh2YL6+qEIYyjU+0ddsvNuQxKOQA1Q09ueZGR5roOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256618; c=relaxed/simple;
	bh=AVRlE0G99BC+L7y0nye1ZxQzkDfQkyMJSbR7r+WemrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoUuxq9fZLZ68Od0H90O4X9q8DCH8Lt4sXGbe8mYX3NjpSBtBkk5dXwZ4B3YApcmFE0YsKtTkd++330RIw9jCLTWncqUgZ0hkiG3dedqbhkqlP+Sz5cVkRzPjrGooYxJaUhHRoa1ez5L+i9c/gkKK5j4Be3UCu7XAb4TjBLBjtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC3cpC6b; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC3cpC6b"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so865178966b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 22:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779256614; cv=none;
        d=google.com; s=arc-20240605;
        b=EscytKpp8+VuVOHIbFEQ5uOQuRiLO4bsZ0edmmnRFxwN6COaRPZTG+b6lI+hpdjEdk
         KGNGs9reV3GpEFNRtLGu1MG86W+/N3vnFcqde5h/9L/aefTU5yFJMSdwxFX+YZ8XBJXt
         IvixXFewEBfe//YU3oTnuuUAASmGh7WHLZNGRSkyXxGv3EqRH/qobxaD1ex4sCVo4k7K
         LpxvmaZq77aTNcGLblLCHFPGbn9XcJxTuc3JcTc8qXEx24mZSw/9xNo+9Au3g11z7hz4
         65f47/DedmYn9891GnMFt3PYghK2SP822r46VOLsTzYefybOOc5BlVQMaoUJnUjxG+zb
         O+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etsMGOIVq2kJS1rwImtVQ8IDqskkHwe2NYV85OoKq3M=;
        fh=FT6f9hHa1eZjfUlaH3z8Ty1POF4TMv8GH/SPBVE+KYo=;
        b=JY0aaWr6wP9rnH/BHEnTzqkyob0BYpiV0OKHGfbVmcoEr3iDS452qY0rLqlQmGOO6W
         /2lu0yAQSFSgyf2Mie4f6GDAZesCJcJqGvf0XpRCU+t1g2jkKDzqsxPkOjq2UMtHZBP4
         duBCXT0c7qYHC49kEqKKs7Xs0eY6QUQK7r+d1th/zhURC8gj1t5TwnJmWBZdsP5zOQcY
         kEkvGQ4eNnphLt68li+CQNDIp9JwbaYxxWY4wFDsFPMrN3QDv5IhGGlCqQAYLr6muH6A
         u8iIGNTwZN0sN/PBkilbcBxsMRfCvrntUPilqfwQiC701MKB81qYCzO3VIOGFf7zNCn3
         9fHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256614; x=1779861414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etsMGOIVq2kJS1rwImtVQ8IDqskkHwe2NYV85OoKq3M=;
        b=PC3cpC6bLm5EWnctfQW1snECzgyoJjl5STmtJ8D6JiCz/UzJRAUALv0ho6Wu6HKRBw
         VZNuXMT4gZArwE+Q61ckzLgIrlyumrXcE5H9J0HyG7cZKCwn9L5L8S6kKz3ileYERbsc
         2euVZuYp9h6SAn3J19A6G0YrfQjAO8Est0EZRKVXNEv+B+Qk9iKH0+WEK0t9fZ4GtnAZ
         li0F2d2/nXPNQpXRLma/8ERnNuWm8cgT40vFNftYf3JEjSxH3Wzw/zeaat6e5xug83Hj
         KwdlhN7yvB4tvaSmpdvcBdprrhUrUZEYOpV0v3ozt8FeQw8EX9Rjbc91+uvilotbdBHX
         JfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256614; x=1779861414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etsMGOIVq2kJS1rwImtVQ8IDqskkHwe2NYV85OoKq3M=;
        b=J8RMMVvCKeSAEnU/FjmjUMmZJxYHd5ojtaCAla0S87xBfB6n4SptNC1FTAPyWMvuww
         rGLNpPLZBj1QklCl+pXJt9pFoo9hmVK9P4OZ12FmefRd/tRUcP4P3F7O+EMgq9Elq9CD
         KVhgwrd0antzKRb1AFeoICe1KFDIN/noFhXBA34eqWJri0AMUNim/NVXG6Cv1mlqzVLO
         cBt3bdfEvJxqtN3jesG88xlSD2ZN5g9xeEzh2nxSsGhWVGd8gIwwVqgX9JaupfmTRglg
         1IGgpOmrUjIeqj6iWqos3XTeid/UfPPrLyMGsyBoF6ENYngpmpv56AlqS6MvWDnfURG8
         tHHw==
X-Forwarded-Encrypted: i=1; AFNElJ+jL2gq3Ww+kB66yk3d31UQaHKVTXc3laaMSzyS8N+Q7VJODjjgzXjxLGf+v1Rx7XSFEKQbsyKktUc/fIsg8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15jR44Lq7C1sznqZDAyHRO6gH+Hbl4JGUXaY+3zzR9b4C64vW
	QtMbcFQawQTiLg+7ICFvvAIXBJxqlxIsZdvs5nymivH14scu7J/laGmaEXOX1u+DPzIiyueWb4C
	cJA5NRAw2yl7eWLkAbTKc8KRnozqQnpk=
X-Gm-Gg: Acq92OGAZEVO4UFYS9dl0Q9kdiCWDNQGUyt0mZSl2h1pFoNdJ1/5IL/VOc6KeE4Icw8
	fcz4iZu2Z9JhukiKG3sIaZJtbQOWxQTi/B1XKNwPjzUXofMa3cOq5y16tPgpghH+ac35ZLGtm3W
	8sPJylOtUjU3VnWE1/3y3kqijCWO6HU9qUoTRf1Ut8Uqp49yEHEzgS4zwclNQWG/xuVfVhuhrJp
	aOXqH9m0OjcQVja6PI7nMyGZ8jdH5lgLYq4D73s/GHMIi5UIomuFcdN26H2u8KMjpvUHlsd0p9K
	9mVNNT/3ar/T7B45qROs/TcjLn2nWAkplLPX0w==
X-Received: by 2002:a17:907:c206:b0:bd8:f7f1:d31e with SMTP id
 a640c23a62f3a-bd8f7f1d8acmr470179866b.49.1779256613629; Tue, 19 May 2026
 22:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508031710.514574-1-alistair.francis@wdc.com> <20260508031710.514574-9-alistair.francis@wdc.com>
In-Reply-To: <20260508031710.514574-9-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 May 2026 15:56:27 +1000
X-Gm-Features: AVHnY4KniR3r_N3kxaUwuJ2NdVV3JVmbSqiPSHds9-OenhdEMA5je4KUw5NkTj4
Message-ID: <CAKmqyKO1L+sCHWMDJ-tH1WVc+=oMVidnVSMttr6ft0-ewSjMVA@mail.gmail.com>
Subject: Re: [PATCH 08/18] PCI/TSM: Support connecting to PCIe CMA devices
To: alistair@alistair23.me, linux-kernel@vger.kernel.org, lukas@wunner.de, 
	Jonathan.Cameron@huawei.com, bhelgaas@google.com, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-cxl@vger.kernel.org, djbw@kernel.org, linux-pci@vger.kernel.org
Cc: alex.gaynor@gmail.com, wilfred.mallawa@wdc.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	ojeda@kernel.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 1:18=E2=80=AFPM <alistair23@gmail.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> In the next patch we are going to add a PCIe CMA TSM driver, as such we
> need to ensure that is_pci_tsm_pf0() will allow us to connect to CMA
> capable devices. These devices don't necessarily has DEVCAP_TEE or IDE
> support.
>
> As such for Root Complex Integrated Endpoint (PCI_EXP_TYPE_RC_END) we
> also check for the CMA DOE feature.

@Dan Williams this is the patch I really need your thoughts on.

The current upstream pci_tsm code only works if IDE or TDISP is
supported, which isn't true for CMA support.

This patch works around that, but the more I think about it the
hackier it is. I have a local change that reverts this and
updates`tsm.c` to work with a DSM (`->dsm_dev` is NULL), but that
doesn't feel right either. Do you have a better idea or how to enable
a CMA TSM driver?

Alistair

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/linux/pci-tsm.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
> index a6435aba03f9..5059954e4853 100644
> --- a/include/linux/pci-tsm.h
> +++ b/include/linux/pci-tsm.h
> @@ -3,6 +3,7 @@
>  #define __PCI_TSM_H
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/pci-doe.h>
>  #include <linux/sockptr.h>
>
>  struct pci_tsm;
> @@ -129,6 +130,8 @@ struct pci_tsm_pf0 {
>  /* physical function0 and capable of 'connect' */
>  static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
>  {
> +       struct pci_doe_mb *doe;
> +
>         if (!pdev)
>                 return false;
>
> @@ -146,9 +149,15 @@ static inline bool is_pci_tsm_pf0(struct pci_dev *pd=
ev)
>          * switch.
>          */
>         switch (pci_pcie_type(pdev)) {
> +       case PCI_EXP_TYPE_RC_END:
> +               doe =3D pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
> +                                          PCI_DOE_FEATURE_CMA);
> +
> +               if (doe)
> +                       break;
> +               fallthrough;
>         case PCI_EXP_TYPE_ENDPOINT:
>         case PCI_EXP_TYPE_UPSTREAM:
> -       case PCI_EXP_TYPE_RC_END:
>                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
>                         break;
>                 fallthrough;
> --
> 2.52.0
>
