Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41B42E007
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661182; cv=none; b=rnBKlJTI5NiB9cHVVDG2Nyio7ii3cj/fbdxr54+26ko5To2rQq9D1CkfJ5dbSp0+2GD2Or+FLUwDrzbncHNxDsBWX6k0KE0XFbLhnORvNJtsx6rICtABsN83jA+RRRCfAPDRa+UMSq9v37kSWrcjojSL1xGNXV6n14w+RSi4IZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661182; c=relaxed/simple;
	bh=vJt6tZj/OG/c4NLOEbG5p6WQuIEd4cW7vphgWLCDr5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VyJD/3rUFiT4jQdsY0IF4TimwPXHAFl/2QQkGKUfcppFGzkzjTqILylB2L3VtHYgvA++3tY0OWPrZQRTXo+G7GQDA38q01YpuS/XHRpM5FJj225emL6J0nqpOVxr1pT4M+cI0hi1xkRBAYlTzrGOl84m6Ndkr6rS6wIBTLLZ42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ga2DVdIz; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ga2DVdIz"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f810c8aebso2471063f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787661179; x=1788265979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlb7XfoBk1nmP2689qZHRSaAXYmnb0joWXGBYKuH+kY=;
        b=Ga2DVdIzNbg6Sl2yYppeV3iiAB4LCCmYsfzpJcYbjO0sYu9bKhIzN/9zT4v4PNP1f7
         VOj4xyV1FO1nHEoqpOgnah1o6vrLcn6dCMuvmc2EkT1dDaDl+uqqcCuRanPvg9CQbZ/e
         VJJZ9OkyS7aCIuP7+YMrX/bW6mJZUuiXIh+ytZsWBD84LURpPr78QypmdnLKzofPi2hJ
         W16DwkWQ1Af5BjwO+TcRX3XVnF2uYd99aXx/HpQTxVV5HRvdgnVA9XXdAQmHSio4Yri0
         pWL8zVtIqEaiRLxj0JaZDPlyWbhbfjZgtNcraV1S2XMdE+99doKIpF4w26XpSzI22eAb
         G7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661179; x=1788265979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xlb7XfoBk1nmP2689qZHRSaAXYmnb0joWXGBYKuH+kY=;
        b=heu6ejGR7a9C4ASAvAE9pRg9Yfo4PBO8x4ALW3KqjzK9bg4sGjdy/p+s8gsCtTt/Qo
         NoSh3SN8wSZvsxrhgQkHMrPNQA5ip9dEjz3YmbAafy66JW1QghnPi8RgYdVumsmtAhtN
         v80G9bWmHKqmsGl3bL+gH61cw83XRDK3m3CveEUqf4QUPFL2Vl1P7631Fa4MRbX77l4c
         7NQCLfEvjzFF2aiA8UqbEumV1zgBmzL6FmvkIM9t4oaCH+nPdRubWnNs4jdzBx7I5hGw
         xaFHrPjE/8V/5VWJbQLzeIe7LfBePMXiDONS5w5qLw+XZ4lDOHWhuEL9XVRie8Afa5cG
         Y6Mg==
X-Forwarded-Encrypted: i=1; AHgh+RrU72R7N5ERwc/bOg0P85UNwLA3GMKsSQCfC7gOh9xF/970tyKTQN3lYGhqV6F2llPGm6uM2D66E1A6vOP4/A==@vger.kernel.org
X-Gm-Message-State: AFuF++m+KZqO+pPwW50aSrRtyQ6M2nhqFVkNC2+SFbobU7IvbSL4dVJM
	kkp1TCKkF89ra8hiAtHcj0U5Na9drY+Ap4cahs6wtGQfMTKHc2p2CUf6N3ujrN8mMwgFgme7Ct1
	OCne9WM/4Pgyo8KAI/g==
X-Received: from wroy3.prod.google.com ([2002:adf:f143:0:b0:47f:51bf:11c1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5846:0:b0:481:5dea:3f0d with SMTP id ffacd0b85a97d-482c0b8eaabmr42274248f8f.11.1787661178297;
 Tue, 25 Aug 2026 05:32:58 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:32:57 +0000
In-Reply-To: <20260812-b4-rust-pci-edu-driver-v3-3-5d0b5594e52b@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260812-b4-rust-pci-edu-driver-v3-0-5d0b5594e52b@mailbox.org> <20260812-b4-rust-pci-edu-driver-v3-3-5d0b5594e52b@mailbox.org>
Message-ID: <ao2Lef62ZvkP9eWI@google.com>
Subject: Re: [PATCH v3 3/5] rust: pci: make Vendor::from_raw() public
From: Alice Ryhl <aliceryhl@google.com>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 12, 2026 at 09:52:37PM +0200, Maurice Hieronymus wrote:
> `Vendor::from_raw()` is currently `pub(super)`, so a Vendor can only be
> obtained through the named constants generated from the
> `PCI_VENDOR_ID_*` defines in `<linux/pci_ids.h>`. A driver therefore
> cannot match a device whose vendor ID has no symbolic name.
> 
> Such devices exist. QEMU's "edu" educational device and the legacy
> qemu/Bochs stdvga both use vendor ID 0x1234, which is not registered in
> `pci_ids.h`. Per the policy stated at the top of that header, IDs are
> only added there when shared between multiple drivers; a single-driver
> ID is expected to be open-coded in the driver instead. C drivers already
> do this -- see `drivers/gpu/drm/tiny/bochs.c`, which matches with a bare
> ".vendor = 0x1234".

IMO we should just add Qemu to the list. No reason to hard-code it per
driver for this case.

Alice
