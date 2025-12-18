Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9142E8B66
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045141; cv=none; b=l91/QErDDDCf81b71/0QehMb6BZ/nKDnVfNcFzqvLTDnrUmD1BIQfF0EPr7+CLIDrLjKbMO7V8sijAOnsz4eTgkquDeuHlU1uTndww7fiUsRY+6ZdK2zEfmJ0xu/t2bmUHhWekZmpOf/Z41yQVu23dVe8fWViZrVz/tsadiJqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045141; c=relaxed/simple;
	bh=6rKPOGPXlYYGRCxmOlkj8zTNFzZIpvEVGK/jWSp9CeI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PXqT98gjt+jjLgq3p8k98GvvOZGadPbKdQpIegyjW/1KttRqRdRnK+R5J3WG69G0k7SKvh5B6w42gU9OBZfAVvkD0bXNe+SrtT9vYyDniqNP0DpHB2xRa/+Ngv5NzohfY0MLBMnJlegCYtU//qb202clPipkJYy5Zu9/h10f+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gXMUOUe5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gXMUOUe5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47a97b785bdso2088005e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045137; x=1766649937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRQ5e+m9uoKPLq4mwQ9uY7M3Le121e2VbM1UWFU+Zek=;
        b=gXMUOUe5yfqqIbob72J+I4ta5vNZezHM8kg6M1Yye+39EUNQ56NJLxfcVTs5pb5sYP
         4uIMjyRe94L3pLP15s4r6HO0FX1bIvGxE9Z6rO6AJlM9+K0bd2+Z3disCTx5iywXfunk
         7Dgmgyp1rF4Azk7qgYw6nPH0ISuYouQogRJeSt0pNAhBZZJwUoSk7n42iDahDK+jCTHZ
         NHyv4cMiG3TrMuCiCHvao0wiwkTqiktBeZTida9FMMQyemPsuONTEhxWEcDGRiEdb+8t
         TdPFCydwpWwTYWfTHBQESvw8CoOaB6w0l0yb7H/XHwuKDzMncJvj8Ik3wONx0yNdZyJm
         VSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045137; x=1766649937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRQ5e+m9uoKPLq4mwQ9uY7M3Le121e2VbM1UWFU+Zek=;
        b=kln+VPW5/yjwQa6939HhwrtLiZJpUXQU/V6PbSLNe/mt7x60tpaNfODZkK9oREJpKn
         Y90mrSDZU9FYMvT7devLIP7PnmsapI63dlHUVkDTEpgj7seETk5ylmhG4VHijuvu/xD9
         NQfn7BdNOcLSW1DUuh4OPPnkTxZ96LepJqqVM1GTEIf7+X4rOYYFuY+NdDo377PVvdrm
         QHL4fecY5uuiHLetvSXzwNZAN6kru9Y2JXHcrFZ9xGUktTbfkl3r+Akjm3hKMVJJ2pQ9
         jJeJnOZ5uPG9AI+NULEEaI4/WFNg/mpluvs3R2lDxiTqMLKYNm9oGiSvCCQ91YFltKa/
         HTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWodpN9zy6EFNDdnW7xcHGOr6pVPFixG/vt7Yz8TMRRYvOw3M+f3X7s3cj7sDxAdeVtSCjeui4fKn9wPIQ78w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQja4KNRERrCUs8TkGz2rtTA86NsiwyvSny2Rl+75GuH+BglI
	FplqdnD/TADAtRoljrK1iYcgPFtCTaWL9dBRIsOtZ9at/EmldzroBsDmXr4yWelw879CXglz76+
	4AznwGbp8QD5wvLj5xA==
X-Google-Smtp-Source: AGHT+IFVLyUGqFPXJ/jLNqh/Cl8WufsEt+eQXJAGeUY8rF/nuPbWg44OEIh9nHDvKSQrufrdEJV+VPCsyhXDC+g=
X-Received: from wmlm24.prod.google.com ([2002:a7b:ca58:0:b0:46f:b32b:55f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cf:b0:477:a3d1:aafb with SMTP id 5b1f17b1804b1-47a8f90d757mr205509055e9.29.1766045137608;
 Thu, 18 Dec 2025 00:05:37 -0800 (PST)
Date: Thu, 18 Dec 2025 08:05:36 +0000
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com> <20251218013910.459045-2-ttabi@nvidia.com>
Message-ID: <aUO10KftOHuOwDeP@google.com>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 17, 2025 at 07:39:02PM -0600, Timur Tabi wrote:
> Add a name() method to the PCI `Device` type, which returns a CStr
> that contains the device name, typically the BDF address.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 82e128431f08..125fb39f4316 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -427,6 +427,43 @@ pub fn pci_class(&self) -> Class {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
>          Class::from_raw(unsafe { (*self.as_raw()).class })
>      }
> +
> +    /// Returns the PCI device name.
> +    ///
> +    /// This returns the device name in the format "DDDD:BB:DD.F" where:
> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{c_str, debugfs::Dir, device::Core, pci, prelude::*};
> +    /// fn create_debugfs(pdev: &pci::Device<Core>) -> Result {
> +    ///     let dir = Dir::new(pdev.name());
> +    ///     Ok(())
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
> +        // `struct pci_dev`, which contains a `struct device dev` member.
> +        unsafe {

What's the actual unsafe operation in this block? We generally try to
limit the scope of unsafe as much as possible.

Alice

> +            let pci_dev = self.as_raw();
> +            let dev = &raw const (*pci_dev).dev;
> +
> +            // If init_name is set, use it; otherwise use the kobject name
> +            let init_name = (*dev).init_name;
> +            let name_ptr = if !init_name.is_null() {
> +                init_name
> +            } else {
> +                (*dev).kobj.name
> +            };
> +
> +            CStr::from_char_ptr(name_ptr)
> +        }
> +    }
>  }
>  
>  impl Device<device::Core> {
> -- 
> 2.52.0
> 
