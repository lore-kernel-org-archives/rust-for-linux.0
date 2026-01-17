Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95623093B2
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648183; cv=none; b=CPIuealNSPTF8YSnQmH9EOkqea5LVFRwOiep2W+69Xg+G//neEKar3OOEkElXRm0/mL5kWPe8YTM7ZuQ9tB5P4auZ2M7KCY3SdV/2GyDRjASTV9Z1i2bh4r/kkMPPm3sTZHdnSuv1ZfJTwvVgWQyQ0aYsq4DWr0/laqNojmzVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648183; c=relaxed/simple;
	bh=kbE1DSqN+rccLY1JWsgg75NViBt2CK/o9u0y2a8INzQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BL2qU0c4859IxXZ6nuvWY/GekIQLhbmwVCbVFSgt78sgl7Ggm4mseaS+f26aVsOGuNuBlzKskdG5uY+LvfVBf4LXNmvmz9I/Sw5g/DGqlGgLq8bWNKtWr/Ir3T1KNdWSuTN0SGqei5EdUYY/5ahWoUjz2Lh7H9e4DzoaXLm/8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fem9nmkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fem9nmkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E746DC4CEF7;
	Sat, 17 Jan 2026 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648183;
	bh=kbE1DSqN+rccLY1JWsgg75NViBt2CK/o9u0y2a8INzQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fem9nmkEeoHe32FoOTZ7ThwNLLg1lks4gJLIj3E8dH0Cc4VaICGuihZkukhBl2AOO
	 pCHfcNlf6PxmBOk9H7R2gXhEi9QzyVDdXkZe/W6IEoTScxpfuu8kGsbi5rhbCRgPy5
	 EybTH280Yy26EKH/n+7NScvodYAjERPychBdGT1Fh60sahuc2rmiQNRiOrHq1bP1hB
	 HDi9FlCTu4xE0Xs3EqQhccM1T4KijwcV4fd/jUM6s6lozK7Q7yfuVSx+C3K3grWj0X
	 x+6pQ8gGmMjzYiCOVhiQBYNdycPrr7qldzYXaLuZfn0MI1SP7Dl4ugEAnYEqrWgk7Z
	 qvoGa685HZYeQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:09:39 +0100
Message-Id: <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-2-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-2-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name, typically the BDF address for PCI devices.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/helpers/device.c |  5 +++++
>  rust/kernel/device.rs | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index 9a4316bafedf..4609b62f6a06 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, vo=
id *data)
>  {
>  	dev_set_drvdata(dev, data);
>  }
> +
> +const char *rust_helper_dev_name(const struct device *dev)

Please add the __rust_helper annotation.

> +{
> +	return dev_name(dev);
> +}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index c79be2e2bfe3..636c522a8374 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -483,6 +483,22 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_ha=
ndle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> +
> +    /// Returns the name of the device.
> +    ///
> +    /// This is the kobject name of the device, or its initial name if t=
he kobject is not yet
> +    /// available.
> +    ///
> +    /// For PCI devices, the name in the format "DDDD:BB:DD.F" where:

This is driver core code, please drop any details for PCI. Also, the subjec=
t of
the patch seems wrong.

> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw()` is a valid poin=
ter to a `struct device`.
> +        // The returned string is valid for the lifetime of the device.
> +        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) =
}
> +    }
>  }
> =20
>  // SAFETY: `Device` is a transparent wrapper of a type that doesn't depe=
nd on `Device`'s generic
> --=20
> 2.52.0

