Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2E40DFB9
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360447; cv=pass; b=arEFZu06zFdH8brNV3bg300ZhXKrhiPSuO8yb9Q7A2Da7gUWVy9b1G2ltQtYfjQ0rrsPTk1IuXuRqWYhSctIcn/MAf22usmnAusx3P6nOaJq96w5qY5bRt/oXqFO83UrnzhZ2g/63cCVcut4wK4jR9KZ/ujm/VLuJRgi+sBtV+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360447; c=relaxed/simple;
	bh=wXO914DzlCvt1xCzISvIcZB3spoiCMyWasvLAd0ea50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SA4DVTnZpzpyta6GpPlvczB1sAlWXhYkx0MVphyIGV0OgooNkan6BVFXsFQAqWpCvp7LJ4zQrKJpRhKVaRVueEMw/gOyyGJkwP/PwAnG7gsGY2cjmmtWLjoDlxjNZuN0GPUxy2ujqGNOpLs4QPWGy39mdvXv+ovQWdmv+Cx7mro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc6yal+5; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc6yal+5"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899a9f445cbso130427576d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 00:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777360445; cv=none;
        d=google.com; s=arc-20240605;
        b=EwTJiB+qoqc+WTShzByQY/uqjrIJab6WBYKD/XbrdUL+VU/1w9ktGl03aH8/SUhH3u
         FeCUmIH7MzO+vW2Gin0upPX+InxHvKRc6BQvGdz12Sgd1rfzHqJN5whZ0CHfvWwcSl7r
         JZCG7+pyvtG4Nr1bFnfbe/WCrgaXMe4wt0SrOwe+2tTqby0x8vDbtHJeQSIvLgU51kym
         dSbxZXSM/z3EmyAmqLIisow9uj4Ph44c1nO9qqkWTZS4B8O1bnMupvsPtGZoXF7NAnM8
         qmXatBfNlKPMUtMblkMIe+5OTg3SRep6TE5xFzm2BlfoWRl5GVdSr3FbD9B86ga6qUMf
         eNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        fh=tYFKqNNJGjpHVVsXI+s886/SMeFjA5bJVidbxidocn0=;
        b=el0lvetI2S3mljMgsICfSOH1Qv9vHEECxA2m3SoQa+lpe6+TiDvb4yKJJnSfkWZMiN
         VzhUCeKCWedoynz+2yCQmMGOmkFaLUudp3Ve9ozK1qq7NRTH/lzEbW5t225lfTRg+lTO
         7qX5O+RhtwExhtBnWJWB+GE9l3bDmfiKg6hRmqRYNQ1Wgx5zSeXYvG6u4bdRmcGUeYln
         ezixS5xIBvb2cOvGlJkpS5flOxtjrIV2LGXQhdlGTtabAsSCQnGj9cggN8Qe0+Uy91u8
         4/J3vlP0Ul4jBCL3Utqx7jRj4zoy2EB73DAjDhFeSDvCPyzLLhrexQba9glGn98h6Q1R
         uWlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777360445; x=1777965245; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        b=nc6yal+5Cks9P9bR7kAkoOiJFSdyHtO+KOS2SXtJ6BsZaQku6YbKpdKnFowpK7pxpm
         OLb0YvJWJBkoPNxy/R64/rG/68BuugWt1VZL/2IbiPu6EoutM5UtDusTOr4+3JDH99sT
         1eRaBskMpzknHVxujRhD/0yMKs01dpIuvN6nVXuaXoMjN/7FlTP5XLCic98Nrp/M+A2R
         lm+DelzbJT4LPoX8Q/gfvQXuuAKq26orSuo/bT7YNB2VwxN+uMNjlWe/GBuqgotD9Vlf
         91gyhVuWrNnayXdP2JaH76rIPeVJSgkMIJ5ZmsscMt20uPe47do/D7GNI9UeeTIBQUk6
         VZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360445; x=1777965245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        b=bIl80ZHaSyj3e3jvSk3W3wiuwl0ttDrY662XkYRvihHEKRqRMIKZ2AymRhdjuLk7fc
         O9FHfi0OqStr2Sac8nGKk9ei8qDnzZ8b7hBWdUaUu6js9AHBc3KpDDsTf+qfJVnllC5B
         PCmEpVSLVpLHafdnGVz6aFaudbQ9/8y2DB6CFUgRvOzG8iSvbveJl3mRG9j6kVOV3XGm
         6BuXWxBfPkAxk+iIicqk7Zg5g1c9w4+UKpIsWWP+s7UtzButJqEz846tcE7mQ5bTuEXr
         yvxo4DI3A61RX+pPOFcqNX3htMtJntgeU34x0LirmFgbb3bS3ENd/SbVm0R8AG+/m9Ah
         jpXA==
X-Forwarded-Encrypted: i=1; AFNElJ8QfoUcfwIplVyDwyPkAXpYs5xuG5bb7CXciUs66Qw9+lXkZrjLmVhfL+roaRRHI0ZI8hi/+32ojoP4EQip0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6HKvEGAoJ1BmT5h9eWjgfag2vqsl5HJA4iyfPCMWntoow02Q
	RMSCGaJX2/J2Vz8n7zgFCqlfb3w8X/0Vw4JuZmapwZtP08i9JefcILzl7OiGPR9N31mMLmP6BXY
	hlMOvcjjGPTZ+yD626Fb2xq5GBOWJUjg=
X-Gm-Gg: AeBDietcRDUs6+ALQ/qlDyBmlkHWT8RF1NrpR/eX1uLwN8Y68lzTEmYVj+ylD7YbGXK
	ZgIFVu7xu3jePzuDd2Vauhwp0+xHfPxz6xHmcwaDrHrUE2iq6hghQAvilOUHi2FtodCrKKXmGnZ
	ZiNDSqllv/TmzKLHXXWVI1B2TgycBko4jmHC24iX8HR2QdvIaZwq0n4GSO8Tv2bVkd8cLY1RsJS
	kHD8gEi90D8EJCCq+TvCjEhi0SM08Om5DWIhFHI3nv+T6iCon8KQ6uxiqTjfk3TvNCRfwz5r55c
	1h/732sMffzp0hIXLWaWYv+8PeozwcOPJR3gmtLRq73/dZNmlHkQELujIZqvZ6FaXTIaqwBWd/y
	hV0ZmnzuZ5NKQ
X-Received: by 2002:a05:6214:c85:b0:8ac:7e8d:859b with SMTP id
 6a1803df08f44-8b3e3042234mr33557846d6.16.1777360444839; Tue, 28 Apr 2026
 00:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-nova-unload-v4-0-e145ccddae66@nvidia.com> <20260427-nova-unload-v4-6-e145ccddae66@nvidia.com>
In-Reply-To: <20260427-nova-unload-v4-6-e145ccddae66@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 28 Apr 2026 17:13:53 +1000
X-Gm-Features: AVHnY4JXyz-pKFTieaHSl_cn50HfzH5pJCH8mAkupYMsNUdKe3qRNzjTlM-mr8Q
Message-ID: <CAPM=9tx_QJf1VNh7TDMFuaWoaZqAhte5ybADef7vfroeB5HSew@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] gpu: nova-core: gsp: shuffle boot code a bit to
 keep chipset-specific parts close
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 16:57, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> Some parts of the GSP boot process are chip-specific actions, whereas
> others (like sending the initial post-boot messages) deal directly with
> the working GSP.
>
> Reorganize the boot code a bit so the chipset-specific parts are clumped
> together, which will make their extraction into a HAL easier.
>
> This has no effect on the GSP boot process.

So this is something that has changed in open-gpu over firmwares.

Older firmwares pre-595 always queued up the async messages before
hitting the boot sequence,

on 595 and later you send the async message later in the boot process
once GSP is booted.

I can't read enough context in this patch to know if that matters, but
I just thought I'd point it out.

Dave.

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index e75c4b235aab..2e1401cd6171 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -187,18 +187,13 @@ pub(crate) fn boot(
>          let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
>
> +        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
> +
>          // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
>          if !fb_layout.frts.is_empty() {
>              Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
>          }
>
> -        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
> -
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> -
>          gsp_falcon.reset(bar)?;
>          let libos_handle = self.libos.dma_handle();
>          let (mbox0, mbox1) = gsp_falcon.boot(
> @@ -227,6 +222,11 @@ pub(crate) fn boot(
>
>          dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
>
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> +
>          // Create and run the GSP sequencer.
>          let seq_params = GspSequencerParams {
>              bootloader_app_version: gsp_fw.bootloader.app_version,
>
> --
> 2.54.0
>
