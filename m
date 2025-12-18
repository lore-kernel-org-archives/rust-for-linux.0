Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A419D071
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048138; cv=none; b=nQu7yk9Uq9Mnn+vVvoUvKuYU8RIHZMz+S4pWdgnxhiUSlJV7dkhIOzNtL4nE7dTdOrt78xtxaM7j+ysWaApRJZVVdYunHj2WmzS7HcKuSozCccZZtqX2ZTPtLsib/b5M1Vd73C9k87SApU7HwfaNT2JeTpxpXk+czKLDbcH0zpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048138; c=relaxed/simple;
	bh=APgZFUJ+vBo7lg8PesH/7B10j9ZTgBKzRnI9GYl+hx4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=WP7/4IV3LL7RBkjHmcufy3ty3nfPqUmAxXhsnkKtvqSyJ1tqeiswLnXi9PGDsDa/GIMw7tuVW0yBRrvGMuuDxeNtJlVvAgXg8IuiYbp68Fqki39vguoPUFll5aB+l7gFqR5QNjQkoDs/ntogDZh58FtF++noO9JThftRmticxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsAh0o1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsAh0o1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03058C4CEFB;
	Thu, 18 Dec 2025 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766048137;
	bh=APgZFUJ+vBo7lg8PesH/7B10j9ZTgBKzRnI9GYl+hx4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=LsAh0o1b17VDFNIJCmsvw8lYVKnieaD/Jjnud3cAi5rA84NjUJm1mhdedfoNwXs3a
	 zrSnsgDgmpDu8gopwiTPaxDWynXM9udXjPvOkYl+bK9NpMS5sEzA10Z42voq1UzN9T
	 Ux1VqcPydya11y6U9kT6MZisVDH9Vv/OxS/oPEZSm00RmvhAPmOgiKMO6V+Wd9n5zA
	 qADQmTDlwf4bPOyYvEqLBI2On+nYZ3i2y4NsWZFpLz9zqejqvNlZgwp0oL0CYOQudv
	 OSIYze5O53LOpZsua2hPixiS6+oO89WOU9ccVQdEse6wIfUJZX8+VlAPS83jWcY71+
	 BTMViIVsdVTmQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 09:55:34 +0100
Message-Id: <DF17TCJPO9RT.2BK28ZOQSF9SN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, "Alice Ryhl" <aliceryhl@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-2-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> +    #[inline]
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw` is always a valid=
 pointer to a
> +        // `struct pci_dev`, which contains a `struct device dev` member=
.
> +        unsafe {
> +            let pci_dev =3D self.as_raw();
> +            let dev =3D &raw const (*pci_dev).dev;
> +
> +            // If init_name is set, use it; otherwise use the kobject na=
me
> +            let init_name =3D (*dev).init_name;
> +            let name_ptr =3D if !init_name.is_null() {
> +                init_name
> +            } else {
> +                (*dev).kobj.name
> +            };
> +
> +            CStr::from_char_ptr(name_ptr)
> +        }
> +    }
>  }

This does not belong into pci::Device, but device::Device.

Also, please do not open-code the init_name dance, please use dev_name() in=
stead.
