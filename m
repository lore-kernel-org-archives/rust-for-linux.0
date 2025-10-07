Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681992E1F08
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853176; cv=none; b=c7icDjOJSGi2P0i6dGk6ZsV6PTxF1QqMy8ycMDU3ir9Nczc87W7Oli/4IlK7+WJ5jscN5MbVvYIph+T53YaYqM25OX0yHaG3zZMlbIOJvKtw1RHu9TbqlOViI9708ZG+J/JHgqggSOmnXDRpJ/JulfD61Ru8GgE0Spzld9/ExXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853176; c=relaxed/simple;
	bh=X65wHkpJhWZgne4Ag70cATb79P5sdfgFOkB+4Mn2Nac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nf4IbR8InJ/6NNBIX56QExoHoEheR1u1fnhHPCaxrerSNjjkWadfNseUQqg1F5cgv/VTDHZHTm4VUdPYV+cPspqU/n/sAsP9+SemQj2G2NLh7sW/VqkH5FlqOlSPWxx2aYPNlqoc7pistNo24o25/yC08qTrW+R7SDwQvyUOU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcDmNlNO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcDmNlNO"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-73f20120601so77724987b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759853174; x=1760457974; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxd7w+3c/2swwtIgYgecKNq0yqsZikLr6MYY6N0WKtE=;
        b=IcDmNlNOx475w5C0sVAVePxq0u6fsTmLL3QtWE3svilGouWVyUnqengbFDXxntl+3Y
         jKbxQF+dpQc/b0wqBsSGO1eAhpPbPY7Gi/3HfX1ABB4PUKzdtVKXg7t0MHBhVjG+TiKa
         dtDDSE21te6Z3AsjhU1uOtRufxvYvbBLCMEylUKM5jylHvW3fl8Ojezh08uutLJqIoE1
         UPhOvQuEJT+IMw4TvU4OYp1CfWGFtsSr4F9i+1bC19KoW4TTz5qU24/CIHAdR2nFVnj9
         NzTCLzMA8kYAuAAyBa4EFWh9iYa9Sso2FjEfTo7qFuSRmTUDyUp1ZdEUGENQGsmi8PK9
         kJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853174; x=1760457974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxd7w+3c/2swwtIgYgecKNq0yqsZikLr6MYY6N0WKtE=;
        b=fhAefaK9XW/hsWKSyyys0qRBAP0/W8dmaBZ/X4AptYHdcesQCcVj185osbiGfMZOBV
         FHvJIM2QGD0GmdoobW1c6mYIUDYofJYHorGyKyt6lKOoOc+yhIrxibb37dof8lfbV3RH
         OdZSJvoDSm7ICx/aCowR+TTx2jbE9gYTMvrUGaDwxKJIIf1dWImOkc34Q9YfLXLvhpTY
         iSNYRUMtj5ietDp+45SdSnJDVquVKfn+4Gw5GIvRxF43SthJjMgFD7Jxyfsri55WDztD
         oYngnLWYs5b6PXRe5H1oQYJz60tKS323fj+LPKPqvC/bM6ivkwT7yQm/qpQ/1gcMbLJj
         4AvA==
X-Forwarded-Encrypted: i=1; AJvYcCV+MykTJy4KEFR5TV7ttjyiNY5Jiz0gJSncne/QEhkxQp20uU1+auMSzPGsYbst3U+qzDaaRGAN5IRpzYK5Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCDfih3d5IFT6acrnALvuBZoqiaVzDUl0vOb0/HifnvXVb14i
	8/i7ACPhejygT2wt3B4v81t9pDp6jhK83KEJ5wQq5+QghXJ50BTbc90v
X-Gm-Gg: ASbGncv4BRmaQuOfmZjiJ3O3NJy4Yt6so53l6mxRav3LC+tKlLa4M7X8c6M0zq3Rx2i
	6o5W8bu3bDmw+ft3FrIuS1PDw57FjrqAQCxAi18wFcKSPLMsJ9OLlzArdeNnPEROCsNKRlmVXf7
	DLtW6QwwRCtmMIdgZiZBzMaiJK9hhD6BplyBZNQmTUXwHMnjUwHHX+V+E85rAt0eRmkrj+7f1iF
	zbwcyQs6ttawOdNRpveIpaluj+baqkcgVMi+0pebm9H5QX6m8NpuRmA4Xq3EvboYREgFs4Wg0k1
	kcFymTP0ut0PS26hU/XN/EtV6objf5t/srfaIUZPnS7kGJ7FQq0jvlMn2gpASz2fawaO7r2ssoC
	tItMDHbVFsIBg4mAQ0UpPEHxs4vuvRnmHKDt7BsldKR6cOmxp0oYndxXgWrv5qUHNc6ZtZ7FYxf
	/0omU=
X-Google-Smtp-Source: AGHT+IGOfFA9QkKleZeWTFtFw7q0cnvtzA4e283IrCuPbzkVclh+0FUFO6eeZ9qg2IcZjjtJmEaW9Q==
X-Received: by 2002:a05:690c:4a05:b0:77f:a301:4634 with SMTP id 00721157ae682-780e17aa12dmr3158717b3.45.1759853173810;
        Tue, 07 Oct 2025 09:06:13 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c0c2cesm54284547b3.11.2025.10.07.09.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:06:13 -0700 (PDT)
Date: Tue, 7 Oct 2025 12:06:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dakr@kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOU6dEEedEnK5ZTk@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury>
 <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
 <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>

On Tue, Oct 07, 2025 at 10:20:54PM +0900, Alexandre Courbot wrote:
> On Tue Oct 7, 2025 at 7:42 PM JST, Miguel Ojeda wrote:
> > On Tue, Oct 7, 2025 at 12:36 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>
> >> We can assume maintainership of this of course, but is there a problem
> >> if this falls under the core Rust umbrella? As this is a pretty core
> >> functionality. Miguel and other core folks, WDYT?
> >
> > I think what Yury may mean is that this should get an explicit
> > `MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
> > agree that is a good idea.

Exactly. Otherwise we'll end up with a single maintainer for a huge
codebase written by different people for different reasons. This is how
lib/ is maintained now. Not very effective. 
 
> Ack - how do you expect things to work in terms of code flow? Do we need
> to have a dedicated tree and send you pull requests? If so, should we
> host it under the Rust-for-Linux Github org?

(Not sure you've asked me but anyways)

For maintenance hierarchy I'd suggest a structure where an author of
the new subsystem obviously becomes a maintainer, then some acknowledged
Rust person co-maintains it, and lately some non-rust person from a
related kernel subsystem becomes a reviewer or co-maintainer.

In 6.18 we did this for bitmaps, and the maintenance entry looks like:

 BITMAP API [RUST]
 M:     Alice Ryhl <aliceryhl@google.com>
 M:     Burak Emir <bqe@google.com>
 R:     Yury Norov <yury.norov@gmail.com>
 S:     Maintained
 F:     rust/kernel/bitmap.rs
 
Check 11eca92a2cae ("rust: add bitmap API").

Thanks,
Yury
