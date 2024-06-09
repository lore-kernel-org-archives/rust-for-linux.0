Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4251CD3C
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Jun 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717942702; cv=none; b=qKRMGvs4xKc+g9MZv5TTxWO2Tw7kS2f1YAhxg3Bbd4EJbel1OYMw1fLv9ALPI/38fAQLkUK7dDfoyre1Gc9OJ51p+cDa9yAy66vQt1cRMywL8eFGumldYYrYOgphajc+ybtHYz7yq1wKtPbz+YJkRL0JSrq8+dr/6a1CyTiMr3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717942702; c=relaxed/simple;
	bh=+tIF+L0O8D60T7bi+aoQxieV46zwUkRLNZSQ4d0TJus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pRgr7HmmCLT+9Z05SspP8dON7XBNHWkhTbyrFCzJkRQulCj3z6iizaZww3P4pAMPyPQZ+I2tKl54/MRabcl8eI/ARWfbkmu24LMtga3aGqk2UUV4hbffQMpt08RvQu86k1P2ARZx6Prs7knjBz4hBrITLXI7bDawra+P9R9nyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aH7eJ7TG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aH7eJ7TG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717942699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cMyIMuZIV0J4WT/bbuPywT6mF+m6iBHlzM2Be2NV7Fg=;
	b=aH7eJ7TGMwjekjAUhFK9xuioVVMb/dEmxlUkPtncPl1BbnzTJHiLneyUl5lY8eVtROL8iA
	i+of4eCxV0wDPMPNJIW3I8GipoJTDTkSI5/1Ky86pYNJaZ7DjRbMAgokI1sBbxgxlDFrvs
	TA11uKDLG4GyHq4G/tH+GLUMHFdv+q4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-QmCUD7A8OEGKXBQSMZQBIQ-1; Sun, 09 Jun 2024 10:18:17 -0400
X-MC-Unique: QmCUD7A8OEGKXBQSMZQBIQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6f9b0989f50so269967a34.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Jun 2024 07:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717942696; x=1718547496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMyIMuZIV0J4WT/bbuPywT6mF+m6iBHlzM2Be2NV7Fg=;
        b=LFekzWx0A7NmSxroQCv8bBftDcN926skZzCBepiQJdhTISk5LjEARUIdNeLF7a2UtT
         wcZe9/eR+QCxSC4NLsUeWx+zUmo0fcPZJI2MADbq+Hy1E0Ux1w/NYNoDu6KxlBSKSJXW
         ymiKDxUdTp/JzmgmX/OtjIv45T3mQ/eMq2lh636ult3whlunyHdfCTAU5T6HE+cqM2Ms
         G+zXmLeEBWNndQUpiHO95OQiVWQYr21EdeTvnUK45QjFDOh5EZQn7TSj845PV22q4K5R
         nChNRCLeAGdnmzPUK/+NcsRMY/cGPBmW10FjTEpiX9nzHaNuhgpQXiZLbRrsyZ+v5QZ7
         tXhA==
X-Forwarded-Encrypted: i=1; AJvYcCWBhO3QPqTY+GTkZvzgks+M2abI+Oqhptn+vYOVvobbIKksSoe95MOWCJ5BWR6/2voyfp7/0c6xVHZgyErx6/9jMAsidWPRxUn5ikdzxFc=
X-Gm-Message-State: AOJu0YzeT1L/s/sWlAJ9JHG4GbDUBycEyAJ+GfDk6thrWVcHGkuHB5Pm
	A1zOuiMtyQwZuMUQ5q6UIRF2vQhH+l7Mc1EQYvBQC5N2Lh9TvDqihCmZJFmQTodxrB/Q9qmyQKZ
	0ys4sBhvDYlO3jUIStG0VrQO6FObDg+UvoGU41eEQQue+eLImR0R21Ej0Gm7c2r8p
X-Received: by 2002:a05:6830:1306:b0:6f9:b071:28c6 with SMTP id 46e09a7af769-6f9b07129eamr776374a34.18.1717942696222;
        Sun, 09 Jun 2024 07:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEgFJzPhPL9AfxoVR1rmqk6GbXBxcYfuvjBNWJrBUiacSd3hziDK5FPsK0p/sHN42elFxnZg==
X-Received: by 2002:a05:6830:1306:b0:6f9:b071:28c6 with SMTP id 46e09a7af769-6f9b07129eamr776339a34.18.1717942695725;
        Sun, 09 Jun 2024 07:18:15 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:34d8:5ea8:12d:c9ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f97eb7c200sm513850a34.20.2024.06.09.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 07:18:15 -0700 (PDT)
Date: Sun, 9 Jun 2024 16:18:09 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Rob Herring <robh@kernel.org>, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	fujita.tomonori@gmail.com, pstanner@redhat.com, ajanulgu@redhat.com,
	lyude@redhat.com, gregkh@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <ZmW5oT7knQh9nKeD@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
 <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lina,

Welcome back!

On Sun, Jun 09, 2024 at 02:15:57PM +0900, Asahi Lina wrote:
> 
> 
> On 5/22/24 6:23 AM, Rob Herring wrote:
> > On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> >> From: Asahi Lina <lina@asahilina.net>
> > This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> > I suppose some are legacy which won't be needed any time soon if ever. 
> > Not sure if you intend for this to be complete, or you are just adding 
> > what you are using? Only FEAT_GEM is used by nova ATM.
> > 
> 
> This was developed before DRIVER_GEM_GPUVA existed ^^
> 
> I have this in my branch since I'm using the GPUVA manager now. Danilo,
> what tree are you using for this submission? It would be good to
> coordinate this and try to keep the WIP branches from diverging too much...

Trying to prevent things from diverging was one of my main objectives when I
started those efforts a couple of month ago (I also sent you a mail for that
purpose back then).

I am maintaining a couple of branches:

In the RfL repository [1]:

  - staging/rust-device [2] (Device / driver, devres infrastructure)
  - staging/dev [3] (common branch containing all the Rust infrastructure I'm
    currently upstreaming, including PCI and firmware abstractions)

In the drm-misc repository [4]:
  - topic/rust-drm [5] (all the DRM abstractions)

In the Nova repository [6]
  - nova-next [7] (the Nova stub driver making use of everything)

I regularly rebase those branches and keep them up to date with improvements and
feedback from the mailing list.

The device / driver and PCI abstractions are getting most of my attention
currently, but there are some recent changes (besides some minor ones) on the
DRM abstractions I plan to send in a v2 as well:

- static const allocation of driver and fops structures
- rework of the `Registration` type to use `Devres` and combine the new() and
  register() methods to register in new() already

There is also some more information regarding those branches in the cover
letters of the series and the links included there.

[1] https://github.com/Rust-for-Linux/linux
[2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
[3] https://github.com/Rust-for-Linux/linux/tree/staging/dev
[4] https://gitlab.freedesktop.org/drm/misc/kernel
[5] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[6] https://gitlab.freedesktop.org/drm/nova
[7] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

> 
> That said, I don't think there's reason to support all features unless
> we expect new drivers to actually use them. The goal of the abstractions
> is to serve the drivers that will use them, and to evolve together with
> them and any newer drivers, not to attempt to be feature-complete from
> the get go (it's very difficult to evaluate an abstraction if it has no
> users!). In general my approach when writing them was to abstract what I
> need and add "obvious" extra trivial features that didn't require much
> thought even if I wasn't using them, but otherwise not attempt to
> comprehensively cover everything.

Fully agree, I think the point here only was whether we want to list all the
feature flags in the abstraction already. Which I think is something we can do.
However, I'm also find with only listing the ones we actually use and keep
adding further ones subsequently. It just shouldn't be random.

- Danilo

> 
> ~~ Lina
> 

