Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CC48B39C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710211; cv=pass; b=pjlLI8GLFXiD6x13Xlo3jK6Wb2LFNylmbb29ZCVDZBJuijUMVXzeWYfoxKXFbQBGhqlNGk9T3HFwBOiVBx/U2be79OzdRLzdmfeZg+cP/hWyPFRTRIDBJ72B89H43/zXqYBGWPijm4Vjkiz2rmtw5eOdSjnvCzDGSspVwftyF+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710211; c=relaxed/simple;
	bh=KnIqpH6OGDbGzTcOq8kvIxcRXrOB9Mrj3jiIKAa9ZIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftAKoeUaBmvVw3UoK+0g3wSZQMyQoiZu+heO4slBxP982M5Luxoe6OrMNKYGcYyuqaTxeCP7iiUWpSirdMulWSh4v5IrH9icht5Rpn4PohAgasdVW3JjGc1W2fp4K9KimJ0rEsCkX68gsFS4hw8oER00o6/zme3SVt2DgiI6RaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ij9b9kSQ; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ij9b9kSQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so832168a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781710204; cv=none;
        d=google.com; s=arc-20240605;
        b=lK0h0NjLXwZesyLAoQDLnXRMpAOmNBNw2MJl1DpsbMJLWZZGyYVEWRbGGHCHXQsuvB
         iSDdE4RzUUf+jLojPMKgfzxciQNFOhQf2WKPsLEwO5bDr80L43T9JYxBPeJyEkhYNzfB
         fFuCspDcdOs9pSj79B0qy2fEwKtu6S6f7aiKfIiWDgDxHxzL+glzCryAyIOc00tE9PyA
         08pt8KFbHAWXky+LlRji0dLLvoLeOtlvwN0bmE/0B2lQ2pK2EIiFaHLTU9HhGuuEoPEC
         kIOSsHSJVdWzJZTL7bT1rkWLzD3SxQ2Me6iKELC5ggK7sxdU4To+W1lop+iE6dh/0dS6
         rJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnIqpH6OGDbGzTcOq8kvIxcRXrOB9Mrj3jiIKAa9ZIc=;
        fh=EUWfBTY3rVCfPrlqstOrtjXqV7/+Fiv9HKoJ/TLCVhE=;
        b=E6dwyQ9cfY7xk/XHXpCpMIVvpf7L8mo/v8ckVeznPAPRA0Ljbst2VRPvO4FMB11apv
         nbU4HqnRQGvseI/rtPl8kvI236xnff6UFd+1fLIMnNKtHSW3sE9PT542Li9GBXQPUJdr
         sQOLogy+IIKzfmGSopKBALh22y2NeviB5Ut6VhQ8mnevUx+lnCWz2crlaBTesaUrBpGo
         C/qVs3TpFdEMRv9KQ5sh0pidRsMQJiISuxoz7G0u1OQJPDn7yVpTSmz1y8RfP8IjPNqr
         bWrJK3vsZ4+GaC4nDZc0loq/Bab+y43uZ9IRXUhIrM7mateFZxLb+HBX7DzFoWRoMap6
         L8Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781710204; x=1782315004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnIqpH6OGDbGzTcOq8kvIxcRXrOB9Mrj3jiIKAa9ZIc=;
        b=ij9b9kSQsjghmXavnk11Q0Q//rmFfZP+x6uDwGb/Wf9mknW36CeuzLCyz0EBd+TSKI
         oBi/Mq6zbVDoif3TzWDzX5r3/Fmn70uIZ9LBaC+1f1l2NJ0kVesVbvV76GNXEZJDf2i0
         QjIj9mZsz2rUazge/qe1DUXexPUfu1mvWZSo8B8WdXSZam98x4cM53n0vubgO41v/G7J
         krG9/MXdDqjzMDBaYmgN/XQu09D+HMBNHap2/4LUHgxTPtbCPFD3LYpGfR2VWhmItx5k
         sXQLljpGeIVx5j76m4WGtsY9wcvrC6ZDHjU2P1IRwvc85NIYN0UvMpdRoU8mvThkwrK4
         NpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710204; x=1782315004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnIqpH6OGDbGzTcOq8kvIxcRXrOB9Mrj3jiIKAa9ZIc=;
        b=dBgY0jlKOaAlftZ1NRf5gi3OXeWAOjnI88ZbmG4Kg+ueboEmzotLmONBM7ZgPFmRVg
         NB6KmEPIuC8E92evXPRUd7hHPvqVJF6I9ALlz8BNAIDD4upUy/0x6pez9v5zhF+tz0FY
         FAJOtsUY88/h8xdWmnParQGIXlJUfTp0dW1MBNnzSyeYfztoAuK15XniinPT/Tj+VDp3
         kSs9gagjSCiXrfd6lDjdgMhVm1lfIiwkXLy7NvO3jTrHLQL4OyXGgTz5uJmstoxG5A87
         UKQz/c8ZMUmckvs73pH5q+pcIFpoHQfk3KYA1i9QUG9LFH6GxAvi+n55L2yVMgDaeB90
         mG1A==
X-Forwarded-Encrypted: i=1; AFNElJ8Mbzmyv/qDYL4ls3yk5yDxY5xcKDQZluq2d9K2JnxhHothaRWMQWuptWvPqOwc7NLQPOCRM6KVx4m6AGbQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGX7Rt1PtWJok6ju80aDJz6MJ3Tbw1fLXJPl50lfLnmqwwBGv
	Fd/8irYmcv0agzo+bBZFusRoH5GAYEkLn9Ra4pxuPt6AE1UmymLWjTFrzbWO/m1Pi/ILXlza3mh
	lPygRp8dFIwlElWAouHxV+YV8DXr2q6ZC1ETcF8A7
X-Gm-Gg: AfdE7clc+rLKU8M9IqXJqqKZU/7lngAGLywIfBpIsZVNuhTuPOgL8tJF4EhtvJgV2qv
	TjkW4FB14OQV/Jwi1S+sfLLlu3m/tNkKYz7s+Z4u8TBhvJga0BmOq7zCUtdrmEJkQm6XMtnWBoe
	OEM+v4MG1jG/RlJMSpkGRcKtmsme3fNUxDT8diBP/U2kLpXi2R7WXGgOHXGOeXHIR6Ix0GtYuBM
	gG8TGKOxOesqIQ+CBZNwMjNaigEiu1VCSOfQLS5Un+eEe5pxPh3Ml7Ch91VpRFKJVnplzDQL3UA
	EWd0qSnqfb6Jk7wHUnIMt5pwq5jm3g==
X-Received: by 2002:a17:90b:3909:b0:36b:a162:a1be with SMTP id
 98e67ed59e1d1-37ca685fb0emr2389867a91.4.1781710204524; Wed, 17 Jun 2026
 08:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617150232.2210-1-mike@fireburn.co.uk> <CANiq72=PBnUkJ6yGk-CiiR7972=oHTfv0ebw0EfRchVarwoEGw@mail.gmail.com>
In-Reply-To: <CANiq72=PBnUkJ6yGk-CiiR7972=oHTfv0ebw0EfRchVarwoEGw@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 17 Jun 2026 16:29:52 +0100
X-Gm-Features: AVVi8CdeYzV3lBLgNE1TxBP0vqCOSBnyeHYWBHRALq7HsVMP4IbnAjMBNhkfV44
Message-ID: <CAHbf0-G1ESvxMTYG9+a3rnwvoD5d1yCJGSBeYmOTQ7-X5PS2cQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] rust: drm: minimal KMS bindings, EDID read,
 rotation, HDCP defs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jun 2026 at 16:11, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Mike,
>
> A few questions on the cover letter that may give context to
> readers... (for this and the other series you just sent)
>

Thanks for taking a look

> On Wed, Jun 17, 2026 at 5:02=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk=
> wrote:
> >
> > It is deliberately an RFC and interim: it does NOT add safe Rust KMS
> > abstractions (CRTC/plane/connector wrappers - an active upstream effort=
),
> > only the raw binding surface plus the trait/visibility tweaks a driver
> > needs to call the C helpers itself.
>
> Do you mean this is not meant to go upstream?
>
> Or do you actually want to land this interim state? If so, then it
> needs to be well-justified why we would want to make this exception.

I'm aiming for this to go upstream, I'm a bit stuck though so I've
posted what I've got so far

> > drm::Device::as_raw() is made pub as a documented temporary escape hatc=
h
> > for calling the C KMS helpers until safe wrappers exist. That is the pa=
rt
> > most likely to draw objections, so it is split into its own patch (3/3)=
:
> > the feature flags and header bindings in 1/3 and 2/3 are useful on thei=
r
> > own and can land even if the escape hatch is reworked or dropped (e.g.
> > replaced by narrow per-helper safe wrappers).
>
> Yeah... this sort of escape hatches aren't great. What is the reason
> for not directly working on safe abstractions?
>

If you're happy to give guidance I'll work on safe abstractions

> > Factored out of an out-of-tree in-kernel Rust DisplayLink DL3 dock driv=
er
> > that drives a virtual connector and reads the dock's downstream EDID; b=
ut
> > the bindings are generic (the same path simpledrm/gud/udl use).
> > Compile-tested in-tree against drm-next.
>
> What is the use case? It is an out-of-tree driver? If so, the
> maintainers may not be able to take the code unless there is an actual
> user in-tree.
>
> Or is this driver expected to land upstream? Do you have a link to the
> source code?

Its going to be a complete driver, but I've banging my head against a
wall with the bring up

The project info is at:

https://github.com/FireBurn/vino-scripts
https://github.com/FireBurn/linux/tree/vino
and also at
https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

I've posted these RFCs so make sure I'm going in the right direction
and haven't missed something stupid that's stopping bring up

> Thanks!
>
> Cheers,
> Miguel
