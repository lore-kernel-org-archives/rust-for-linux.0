Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0D269811
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876342; cv=none; b=UT5Fx2udVROoacQOXxAUDw6e+IbOe5Z+LzObwl/6jyDo5UCKKbvg7IK5gsEdCy0swIAYQsRwfWRcmjLw+fkhL55O6Wi75QUBM6o476+/bTpTGyBn3vnYqB6FqpstK+yFMXKhdT+dkNOjDpDcgCBVk4xFcOJkLyU8aah8j+UC7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876342; c=relaxed/simple;
	bh=/yrqr/kP1EJR9t5LJP6eSDqwNOvaQpO0TbRbpzschK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elN26G9T8SGz6h5HApcM03MDw3Pcvgbysw2hJVXj4xO6P2SOcyjiuZRSiaXrCA2IkJ9lx9kd4ASUqZwri65lEq29fHJbGDUwZDlyIh6Lu+8UaPNkEko6kKsSLegh2QpGhrHCdreM++z3LjVqEh7Y5P+B2iwzqYjSIbLA4nCMeGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=E935mYfq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="E935mYfq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so844475f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741876337; x=1742481137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmJEZa8bhP51f5WeMX8gVU0QSf/9tpQBkqyv3+FpHNc=;
        b=E935mYfqFbvgA5YWSOjjr7GKTPwzlBBCidu4CB2841mhxVHhgcN8l/FylbB2PZX71i
         6cqHOIToP2bRRvWX6zWHmcg5bMaZ7XHfMfC/AhR/5p3EwtdLG4kHffoXWbRlieYYm/Gt
         0uHIP/wrRufjjZtXfF9fcXmjXAlhRTU7XnJKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876337; x=1742481137;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmJEZa8bhP51f5WeMX8gVU0QSf/9tpQBkqyv3+FpHNc=;
        b=YC3Bs4w/Cytd/tw6hYSQV5RHUpSXTuc2QrK0Au3czq7QKyCi5j8280ARqH2a7A1goq
         hZ8zGh+jH5uQGp6zqZeRBYHCJvwUJSrdrVmIqHc2arH+zJLuoEYNZcX0kHstTInfbPTU
         a/+e++4vgvQx+3twrUotbLhdb0SMnCfSZb/YC6tyt0bQFHSJ0wqViSdnsd5ex8ugaAZe
         WNI1OT/FMdcTBjm42iE/BF2e2XRhIthOjIwCSRCQ04oojHOPaU2yFcZL2LPiYqR+MCGD
         /qYA/9jCGklki0hcpLkEf4j0FxhxDpsrmKnG/U9nc1je0KSg/df+idN+RjSUNWDQoZJ9
         qvGg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hjOpxFa9sYBKLnkPFEYgjNr4KjtTihLXm6JPfmUzrf33xRpsCQtZWQc/lKgioVm4Ggn2xxqh9H3e8uP8yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydqG5Uz8JOUKtqDCJwf42u6mYXXPoveUOON4LnWm1letnP6gN0
	f1ksnAB0xBhXvUxLxMnLgxg9kNgSHwd9EX/wdk+e3Naz7irkyvHcJtd9rNeGOF8=
X-Gm-Gg: ASbGncs3mw/x7TmEVzsVZTwOGiJnIFvhPOEFIbR/83fyzM/JpCBxIYF8s2zcFW3JTXr
	tIRrwdxwWzeohVoUW/BN+bRDje16lsGefZg/FPBL54QWXK0aqo3EpKf90EpEmoR9OAOgwiiCJeB
	2OiNc6VL/pUS2RhoYfWzewCI6r5MsrwgIdLQ7NXiZIFgmC2+21DXh0zqPw7HsmFyzsa6f4cwD2M
	0FqF+JaIfa/pLh/wmZaM2/Tg6q6D09knnXd6zQVwXNd6jD70VihvWA2rEsKv0VO37w2gMCKS35Q
	GYAXKPAP+5rshSj5/w/VjJCgaaEkfZnTTydBiR205TU5HBj5shFy84i5
X-Google-Smtp-Source: AGHT+IHONUiodfS/fWexcjBKJ56cHcP98PgHHjaNe3WzTXhC4/in7mzoTQfPI07gJnTJ+29TnXggtg==
X-Received: by 2002:a05:6000:2109:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-39264693887mr8443406f8f.23.1741876337388;
        Thu, 13 Mar 2025 07:32:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b70sm2338337f8f.30.2025.03.13.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:32:16 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:32:14 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	paulmck@kernel.org
References: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307145557.GO354511@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Mar 07, 2025 at 10:55:57AM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 07, 2025 at 02:09:12PM +0100, Simona Vetter wrote:
> 
> > > A driver can do a health check immediately in remove() and make a
> > > decision if the device is alive or not to speed up removal in the
> > > hostile hot unplug case.
> > 
> > Hm ... I guess when you get an all -1 read you check with a specific
> > register to make sure it's not a false positive? Since for some registers
> > that's a valid value.
> 
> Yes. mlx5 has HW designed to support this, but I imagine on most
> devices you could find an ID register or something that won't be -1.
> 
> > - The "at least we don't blow up with memory safety issues" bare minimum
> >   that the rust abstractions should guarantee. So revocable and friends.
> 
> I still really dislike recovable because it imposes a cost that is
> unnecessary.
> 
> > And I think the latter safety fallback does not prevent you from doing the
> > full fancy design, e.g. for revocable resources that only happens after
> > your explicitly-coded ->remove() callback has finished. Which means you
> > still have full access to the hw like anywhere else.
> 
> Yes, if you use rust bindings with something like RDMA then I would
> expect that by the time remove is done everything is cleaned up and
> all the revokable stuff was useless and never used.
> 
> This is why I dislike revoke so much. It is adding a bunch of garbage
> all over the place that is *never used* if the driver is working
> correctly.
> 
> I believe it is much better to runtime check that the driver is
> correct and not burden the API design with this.

You can do that with for example runtime proofs. R4l has that with
Mutex from one structure protecting other structures (like in a tree). But
since the compiler can't prove those you trade in the possibility that you
will hit a runtime BUG if things don't line up.

So subsystems that ensure that driver callbacks never run concurrently
with a revocation could guarantee that revocable resources are always
present.

> Giving people these features will only encourage them to write wrong
> drivers.

So I think you can still achieve that building on top of revocable and a
few more abstractions that are internally unsafe. Or are you thinking of
different runtime checks?

> This is not even a new idea, devm introduces automatic lifetime into
> the kernel and I've sat in presentations about how devm has all sorts
> of bug classes because of misuse. :\

Yeah automatic lifetime is great, until people mix up things with
different lifetimes, then it all goes wrong.

> > Does this sounds like a possible conclusion of this thread, or do we need
> > to keep digging?
> 
> IDK, I think this should be socialized more. It is important as it
> effects all drivers here out, and it is radically different to how the
> kernel works today.
> 
> > Also now that I look at this problem as a two-level issue, I think drm is
> > actually a lot better than what I explained. If you clean up driver state
> > properly in ->remove (or as stack automatic cleanup functions that run
> > before all the mmio/irq/whatever stuff disappears), then we are largely
> > there already with being able to fully quiescent driver state enough to
> > make sure no new requests can sneak in. 
> 
> That is the typical subsystem design!

Yeah maybe we're not that far really. But I'm still not clear how to do
an entirely revoke-less world.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
