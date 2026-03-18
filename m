Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3423EABC
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844288; cv=pass; b=nuuXSm8wvT9jqbaDVbbVnGPd/YEiR8u2SWjpITmY+VOXU7a9xgax+GDLuwGmgw78AIpmFQ2fvFd6JJM8Y44rdpcNTxJHCYR5PR35kg5Ceqp2ad3fEqGgeGF5Z6K9fbgCyDbXSdvbhU4zoZHM7IKpR/xmBVXVmg4G0NL1vGI4Hmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844288; c=relaxed/simple;
	bh=yo/HzWSmo18kRP45/efRc37F39eN0N4aihI2I0DZzEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=of1MrzNM4oRwZ39oopUtdw32j8tQftIaIEjcA2VmPSWkoPEjE0HP2Mi1CSPJ5TfUsVY4Rk1ZRcgNGY7HK3IPxVAwMmaRZt7jASvwCkkpLW1ty+NNa87zfyDvFJDao5kO6LWMqCVYmArLaX721liXEr99C3XDmjRTSMtWfjjTIMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uvg6ZO4y; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uvg6ZO4y"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bcec8613so5411243f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 07:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844285; cv=none;
        d=google.com; s=arc-20240605;
        b=gf85urPdd38Qv5rizrVUaPShay49k6tzhvJ4Bgt7bkafqPkE6PqIx5/CxcYzrzzY3V
         x/k3M4FZ9V1OYcsD/RkK64cDjw+8wvhVwVdTsmNfhH/3pCSl+XvkrkYyzRBLKDQPZMrV
         R5nwzh855i/X9/0k6Pd9llzFOKLhiR/ZfuD7HE8j7j2xTO0IuJeWV1oUol2wKO/69us0
         RYA6p+X0CMDU/VGnxo204YchXYqgisueD9O/Bbh2JHJhyC7LOln689+jr+8TlUTpbRoU
         y6t22k7ILzNfTbGiXj51mkU09hWBxBRolCDvkbbikLP/MjCaCGCDn6GlZd1Bvr+2R+Sv
         x5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        fh=h1v46Jh1vAetiQO39WLP41Nu9Fg9mnlbFK0wxm2W7j8=;
        b=Zx/qLrBEVGfv34hs4cSCDJQxXSVWh72EalYVSNiZ9N7UgqtokYQt5mRkj2Ib46IJ++
         EVvdZ65d72ikKxC50jCtC94oMgiydtzI9v3q8N82z7JHeI12l5+dTQ0vcWzu3rka9rDE
         EUCEpRh8mPhWSPI+2zUWlVTOn7HXRh4tTp337kWzN/ANzzVND288njjTRkzk4f1wMTu1
         9wyqoH7BlLYrJ+62hTYQRaq5PKpQw8gdpMYpUewVE+GaICgrnq5jLX0/6lSks++ncLau
         sfh1u2RhondRy6TGGCOzPUj7b1XWTSRenGfgdHFu1LxaHsnXGJIO0bZqUjdW/gYIcvPh
         qgRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773844285; x=1774449085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        b=Uvg6ZO4yuFbCNzqx5IgkFjE5jT0+fReRtVmbA59JONr6Xm2hBLufDuAl+HwRA3MumJ
         uN812HoVq01bIipHv2xtXa3ZZHJublyGr73DFSuYVnGafGadt8oAaJIEyXKmeZicpw6F
         4x74RW1WCz65dZX/ujm1LnMPGWHnjCrihwE3HSRHT6XrrXCfrAxRnpYT8EmQsH9cMYyh
         H1+e88ZdZwC2RuAJCbrUmoqjlwbzbmt/4ZLu5r/Ym52d7SUuYfAAjkMIZwyC+Vcmwbdv
         7dbRLq1muvFqVMPphVbH+YS57ehpRFi60j78tAgyWXBiRz8oKCVK0wgDNLzolcyzVVjF
         A1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844285; x=1774449085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        b=YxXIP2I775LJEhFt+OSwa+k0nM6xk3l/obuV1LawH7IzFUQ8v74xYL1vtk3TXskC7F
         4aDzzFx7UeL8fhAQGwDARadxiTz0h/vks8jqkjX00By9iufbr1PQLqEOUUrk7NXTTUCq
         fXXKnlmW4UYnJS8D6jpMaSUKyCbgr/MGzqOMoN83aPcqdl0p/0nQRVSsJG1dkU1wg+aP
         xHvPwQvflv7xhWfKlo4HtDlbjpvcxL7pec0UD5ruaXM3ODZw9R4AF/KbILy0XtxGKBc8
         WWFa3ahQ1c4ef8iPVnFlIAy1xX2im8+Ydg9waVC3dNMwk4VC42iIC0vIjAxwdC6S+t9F
         1MXw==
X-Forwarded-Encrypted: i=1; AJvYcCXGeLAkvL3qRdxoRiR6Zbn/yvZrcp5wOdp9I30m0ceegxBNiJ6Fmh7+sjzCwB6hnTchNkjRZ/PO53wDR+7BFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Ffzs/LEQWkfaeFAb/ZFRUrGz180DZIa4zrrNPghazAvPUOlW
	y0nNtG4AYMm5ZHrThpod+YigRhVUdcL12D7zJmBY5rUJbKy3ui4zvJMxi7B21QwfCWQ91QmS6rU
	B6MUI1s01xHyCaB92Zt3d7AvSJgNx4fsLBUxhPlma
X-Gm-Gg: ATEYQzzfYoCVCCsTytiWJLfWUTqabaN6dPtOUFq9AzPmkvgczhu9KisVia8UUpbqcmu
	dOIm0NMB063K/Hu1qQlak70+DkTjzfj2TNhwwWExELHmCW2ZrOQZ+Z7PIBDqtnvfwN7Tg+YoXtF
	3jhmc9J/KuUm2hS4am3We9INPzZejEITM9SSyRdZfNvr6MKD54FUmJZc4jecSlCmKMXqBCHY0+3
	hn8Eu98/zC5BIt/olgWyHexOl51jYhfmTZTMnsLb4pgzq1PZoL2v6WSf+vyKA7Kr2KSrcgHs32h
	KYVbpLhvH/bJRZGxnz1fSr1vlNbhTa0S0c69wMVJyfkrHdtgXnCAIIS/R5alt2yveTt13g==
X-Received: by 2002:a5d:5f43:0:b0:439:ca85:8848 with SMTP id
 ffacd0b85a97d-43b527aa344mr6004289f8f.16.1773844284463; Wed, 18 Mar 2026
 07:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com> <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
In-Reply-To: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 15:31:12 +0100
X-Gm-Features: AaiRm51O3ZORqMPG2oSnP3bbIvsHXlypg7QXuPo86XIFyKOog2BgXzbGuVDuzJY
Message-ID: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 3:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> [*] I would have preferred a middle ground like  modules being inside
> but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
> will ever be supported upstream since one probably wants to support
> the other ways at the same time.

In principle this is possible using

#[path =3D "pci/pci.rs"]
pub mod pci;

Alice
