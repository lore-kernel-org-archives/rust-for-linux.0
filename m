Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278B20DD4E
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742553347; cv=none; b=C7C1nbJbwzZ447IvS9OY9MmCFnk3r/qDdTjGAr3NXG4WWpXwOQ5/xBJqNRAOzH1SGQzQQ59UUyN0z/WznhPMeuYhE2xSjvAykKHRc9qV4dqkEzzmvX3Jc4hA6F0jhKPkOn0dKvWOfD2QxrVsOhS2be/ohNZ9kcZAwN+oX9UnbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742553347; c=relaxed/simple;
	bh=UFU0KTT+0ZXUZfo4jTJqt/1srLaMuyKRdeW9iHScmXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iA0vhZV+fYHZ6hiDYPORGEILyEp5CuHPAFR6gh9A4Ge31nWgoFVJ11pfgiUTyhBt6j47TO5sHEtyTUTzZAaFKZXjsXKuVTxcEL0JfOzKvue5O9EbWj11gFEsI2OoY7Ka9ruuzF2uNLIGdCXKWVlGT2aLiP6sC03ZEyb3wj2MHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QqJ5IXTz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QqJ5IXTz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so15828025e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1742553344; x=1743158144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3Kfp6sALNxTTtUe+bIHaZwZakvZcPmpmO3uXVTBrCw=;
        b=QqJ5IXTzwMmdv1+3WjARdrwOOi1wYxIc5Ya8McNBP+MX83XutWB3x0j6FFaG20ML8A
         5uv3o2zIIGBSzbl9dTLGgD1E6HJ1i94TgyULMkx18y0IAH8fW0EI7Tetfi3aJ8Yckj7r
         Gw7/PCtDSqPgCnjaYFD41Hd2pJDanGhaeVsX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742553344; x=1743158144;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3Kfp6sALNxTTtUe+bIHaZwZakvZcPmpmO3uXVTBrCw=;
        b=KHWT1im+eWxX9ZwgUmEw0zNRQ7Pp+IZ+Jc9tNRZO41M4Jt+HbnPHq2/rwDZwrJ3RR5
         z9JHWjoOjvxaF1mBzofkwvLEobMRtXwHVrcg5DrDlkBwPZZDstglLZeVs1AFRcTDuePa
         O9J8bYbz7zoBjdfXj/ZzeF6OYcQQpaL0IUbwXSX/Wp8Qh7vOWhLYwSV1Y5opML8M6kyA
         sDJRsE+qq+a5RnvC/prUWTuSpze9nE9HAkNbG2u2E3JTuS5mGshbtHHEs+Wt+mJMg2rJ
         Bbrll2eGBb7B/JH1MfEUmlgl9ROsAGLisIgFcxF8drJTMFHngEOe8b3Y1ujjxBNntJau
         lxXg==
X-Forwarded-Encrypted: i=1; AJvYcCWIEwBA+YV1MtOWypCfrtsIAGb3aN7zrAHn0wWhBGTdEKNmqqHuVvkk6SGPNku+tT5E2EAmedNQHb4D9QNcMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KBoHE8rcnDNndqOU+21CAeoSb5awiVduEq94esp26uidPNuP
	hQNpLyXnLp2fAIVAkaE/6spRUEqa4syTcnhENSDTxrQSvekdfVRW4WdqtP8x9d8=
X-Gm-Gg: ASbGncuGNPh5BwFnMGSwZhrBaeyJk3G5uMSRfXNuvje8GOA+Kv1mTYUPI5atkQUkrt+
	O9x0ME3yEO5+aH2KHlwi6VgepgbD7eRnlS2uPzkSZ0YFTQHlY+GW0tiEgM9ZTu9jfsuWaqHw2Vq
	m1W4qz0AVRiclIzkqpImN22q8xvhU1g6zHVneMqZHL/eQd+BQ5wPPZkd17vuBC9UYkRJuPz8NtH
	7qJrpadmZmR13i1gGXnXBiUeUlB2XNyF2xvit4sPbsCihT+YrIcDBVHPNnh9fuU0nF1zqSxRLSY
	7HcaOrj+ENYIM6mys1dPKZedGWvY2dzEQSCjIjA6OveoMAeZdwg7d9t/
X-Google-Smtp-Source: AGHT+IGdgqrnktS88HQx0VeXm5vsHxDPIPUGT/Sqr6rq09y+ynhAfmQF/0b/+MUc3ZwiGzOBD/Pjgw==
X-Received: by 2002:a05:600c:3c9b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43d50a361f8mr15516775e9.27.1742553343656;
        Fri, 21 Mar 2025 03:35:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eff79sm2000820f8f.95.2025.03.21.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 03:35:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:35:40 +0100
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
Message-ID: <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
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
References: <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
 <20250319172132.GL9311@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319172132.GL9311@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Mar 19, 2025 at 02:21:32PM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 13, 2025 at 03:32:14PM +0100, Simona Vetter wrote:
> 
> > So I think you can still achieve that building on top of revocable and a
> > few more abstractions that are internally unsafe. Or are you thinking of
> > different runtime checks?
> 
> I'm thinking on the access side of the revocable you don't have a
> failure path. Instead you get the access or runtime violation if the
> driver is buggy. This eliminates all the objectionable failure paths
> and costs on the performance paths of the driver.
> 
> And perhaps also on the remove path you have runtime checking if
> "driver lifetime bound" objects have all been cleaned up.
> 
> The point is to try to behave more like the standard fence pattern and
> get some level of checking that can make r4l comfortable without
> inventing new kernel lifecycle models.
> 
> > Yeah maybe we're not that far really. But I'm still not clear how to do
> > an entirely revoke-less world.
> 
> Not entirely, you end up revoking big things. Like RDMA revokes the
> driver ops callbacks using SRCU. It doesn't revoke individual
> resources or DMA maps.
> 
> I have the same feeling about this micro-revoke direction, I don't
> know how to implement this. The DMA API is very challenging,
> especially the performance use of DMA API.

Ah I think we're in agreement, I think once we get to big subsystems we
really want subsystem-level revokes like you describe here. And rust
already has this concept of a "having one thing guarantess you access to
another". For example an overall lock to a big datastructure gives you
access to all the invidiual nodes, see LockedBy. So I think we're covered
here.

For me the basic Revocable really is more for all the odd-ball
random pieces that aren't covered by subsystem constructs already. And
maybe drm needs to rethink a bunch of things in this area in general, not
just for rust. So maybe we should extend the rustdoc to explain that bare
Revocable isn't how entire subsystems rust abstractions should be built?

Cheers, Aima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
