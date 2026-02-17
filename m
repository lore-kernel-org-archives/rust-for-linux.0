Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F129AB02;
	Tue, 17 Feb 2026 20:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359142; cv=none; b=HpYxqN44ALMckdqACUYAcRKRdKPMVp2C2xtWQvfc5vqKWKqZ5g2pQ9cNUIBIcX6R4oeTGLSM1tKXq3cABQEgWrcEt1DQg775wX4s6BZnIl6zBMrhQpQv2/en85QQqgtNs4k/VywT+0u/sQqK/80b2MS/RvDx1rxD/mCxb+xyblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359142; c=relaxed/simple;
	bh=ZcC5YWdcb8ht0sD/VHqGWITAQtnYdshDayFlHAhQmI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VnoGXi/Rj/67Ou7ThLi4bGrWHJ2dkxpEvBjR2Vckfhy6ZuwzUupqk89DYFmIwwDO4P2LWLmVw1q92HKHYY/yutMXb827v6EwqEZ1YvO4bxadyqkiHv6z0chD/bhVnQ8jTSs+vNRuEB9//bDUKpHNMIeVv+F5qX7z5yIBwOWf8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVUbjyk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVUbjyk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D71C4CEF7;
	Tue, 17 Feb 2026 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359141;
	bh=ZcC5YWdcb8ht0sD/VHqGWITAQtnYdshDayFlHAhQmI4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=CVUbjyk+orcZKfrNR2YbC3C98sTInR04S9r19EANwNUCrxKpIyxlpfu+Q4ycJ6BVh
	 LtzrTqlfzlUFCKnPvcqTjf6UtM2pQETR+1J5P40HxTfLwnWfARFU674G51ZtM9mP1E
	 iwRluzb+HhYzZl8GfQvq3AemPYuic9Q3y7GhuKRD/OxSd6b/eW/lY3DtAFrWOfTpTd
	 fveAtdSnGBzX7vbSiEIogJ45Z6KowHaYR2vDG4tJSyd/IhwT7P5ZsLBWamIgOEkSih
	 zRfQDbCk4xM0PBg4dxIr/b9Fg64uZdrke2ZAvb0H8fIkNErSwtBL15MBOLKUQBKWax
	 nkPLfiSVq7kFw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:12:16 +0100
Message-Id: <DGHIEPBEHSC1.1G155LGII83R1@kernel.org>
Subject: Re: [PATCH v4 28/33] gpu: nova-core: refactor SEC2 booter loading
 into run_booter() helper
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-29-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-29-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 465c18e4c888..6191986fc6b5 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -120,6 +120,40 @@ fn run_fwsec_frts(
>          }
>      }
> =20
> +    fn run_booter(
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        chipset: Chipset,
> +        sec2_falcon: &Falcon<Sec2>,
> +        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
> +    ) -> Result {
> +        let booter_loader =3D BooterFirmware::new(
> +            dev,
> +            BooterKind::Loader,
> +            chipset,
> +            FIRMWARE_VERSION,
> +            sec2_falcon,
> +            bar,
> +        )?;

Maybe we should just make the part below a method of BooterFirmware, i.e.
BooterFirmware::run()?

> +        sec2_falcon.reset(bar)?;
> +        sec2_falcon.load(bar, &booter_loader)?;
> +        let wpr_handle =3D wpr_meta.dma_handle();
> +        let (mbox0, mbox1) =3D sec2_falcon.boot(
> +            bar,
> +            Some(wpr_handle as u32),
> +            Some((wpr_handle >> 32) as u32),
> +        )?;
> +        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1)=
;
> +
> +        if mbox0 !=3D 0 {
> +            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0=
);
> +            return Err(ENODEV);
> +        }
> +
> +        Ok(())
> +    }
