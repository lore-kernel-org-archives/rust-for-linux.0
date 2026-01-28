Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51BB3382FA;
	Wed, 28 Jan 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597636; cv=none; b=CqWJJ4vvSOQbLT4G3QRAJFv8esYF/XxcQDHqoIyou/g4fYEQyOdsmDlRPksoGAUXrxO3h+vyZ9ViKMPeAFxHT/UiNEZnMODIYO0kMyR3W17q5zXZWRwazaIfw13C/XPbu87ZWkk3sUkJpn9LsEu78RCT9xSm6BgVO8g2ncH391M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597636; c=relaxed/simple;
	bh=VTLd7vd+WPNn7NR0v8u7rGagToa/9uYN3+K/raVxK/Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=indOSPQtA8br4ZfCl0ILhaFUBD+sbe13XkCtSic3wIhupwVtCBGlJuK8uQwlpaq6YRqAUKNHe8VqNiR/YQ1Vaamec5KTP99Bf7Vb3kFaTrMuNmn/lrHcpfJxTbW6TaZFzOmDskuGzgXvs7UWmyM884IK0RblEAdRKOgKjmpK6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQQqeZn/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQQqeZn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1510AC2BCB0;
	Wed, 28 Jan 2026 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597636;
	bh=VTLd7vd+WPNn7NR0v8u7rGagToa/9uYN3+K/raVxK/Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MQQqeZn/PS82H2I0BiwGmgQ0Es/plFXiloDRMKmpxzUhvqPevwbL542+5QITNyZtU
	 up/j2BkdX6VCiLztlMVnpPhqwdy/BhsErmW0jHE2rVRNULmxfLtrZ0skQN27sluyP6
	 a95zFRg1votKHCV6STIz1NUYtanysA/u9krLZ7CX0hKyiG1PUn6ZE+vHeARq0xVehX
	 sXXnInrrgikf+WNsUYJqhwIlbS65UdHhXdx/hEwE5PHDMEkhzwm1W0tR/NgOwkhJwr
	 logbW9QpMlEbl5C2uoY/5E6fCXt1GBQDTD6BWIqUVTnykJkc0f/oEGVzYl63/LjXtF
	 wlaKiS7SLYHvg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:53:48 +0100
Message-Id: <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-2-joelagnelf@nvidia.com>

On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbi=
os, cmd: FwsecCommand) -> Re
>          let ucode =3D bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
> =20
> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size() +=
 desc.interface_offset());
> +        // Compute hdr_offset =3D imem_load_size + interface_offset.

I do get the idea behind those comments, but are we sure that's really a go=
od
idea? How do we ensure to keep them up to date in case we have to change th=
e
code?

If we really want this, I'd at least chose a common syntax, e.g.

	// CALC: `imem_load_size + interface_offset`

without the variable name the resulting value is assigned to.

But I'd rather prefer to just drop those comments.

> +        let hdr_offset =3D desc
> +            .imem_load_size()
> +            .checked_add(desc.interface_offset())
> +            .map(usize::from_safe_cast)
> +            .ok_or(EINVAL)?;
>          // SAFETY: we have exclusive access to `dma_object`.
>          let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(&dma_object, h=
dr_offset) }?;
