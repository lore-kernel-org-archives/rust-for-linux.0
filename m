Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4F379ED2
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 04:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238449; cv=pass; b=f6hnMFqiyAYd0ziBwqCRfs2hnFkA7ezQfU6N05p1KX5aZIW+bR89C5HNbLqWmODSXNRH1DShusc6OE+g4u7+h6Wy5dP7tuotQuV+qqSzJUpKtxMfWe59uy1B5QU4c/JCBbFP+l28ghs3vhDoytDKsvVJHTe2DCEc4145YH2dAVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238449; c=relaxed/simple;
	bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Og8pMy/rZFXTVIAiuxgHGznIa16C60wik7P6B5dm8G5QqtglBgwDjWDcFbOxllS1t4A9VR6NdmtnzRGuVlUQxz/mJuXFZTAOQMKszldCHhExpUGgVZ4+sD33CmPwGf8je8OdjzP1UIix4UCkvpdiKNyXfNdlaYpPGkyOFdlsDP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+NLp0Jc; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+NLp0Jc"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cd4631090so7496336d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238446; cv=none;
        d=google.com; s=arc-20260327;
        b=owEZegNQ0Ek5yqoMSqWPYLHEer12z4NzK3wlsuFtHWeNkLplVgEb+kvwF58wdYRabl
         /JQtafZFkW2yF2setrn6Iz51hYNTOGrWN9PgWXfxCHUbJG4QCEOLCSfurclG0sLXzx9w
         seyQY7IWAeqm6nUZsaVyWZe4ZCmerLWwcbE408ixSahHHueRB/xmE0dex9tff/sj05r5
         WQki48DlJjiwz1vvXruFPKNh5xdwSJjQG4rs0KJIXmbafdq6CSzHQduCbOfUrdB/YHpN
         MA6VNS7pS4hNCgmmIQ2VdxrOKrC32uN93uTV49fTcHM+5GPrgyRjGeVIIAja9vuUJfjQ
         jHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        fh=6ktodZcCptTDOFl7lLW9vWSIc/bn8wVKFd2dzBEgsgQ=;
        b=VMbjizt6O1wWgt9Wt8CXEz/ixboz1uxDkw8PIep8p109sPOZk7tUo7r61UPOSBSrue
         E911UVoyoCabwDsXeCyi6UC68Tc2O/VZdQdp7dAI3+TmJVOfHQ9h3rA72G9++Zt07BwO
         qfLuuNaiPZWjWkVjlB89edtdtZ3ZsrcBWr9H4uSRBWzmTMupyv/aefyFzxwcf2tmLyyp
         w0+rQ0/OKITvuABoaFvkwS5UN7GSOslxLPBGEnPXeO641O+rSyIhkq9Mg8zAVR0CrKKa
         4F+CYRV9cJWWanC/Btbtt8OUhpUg2pp/DCFgyBaYHtLKG+hINXf6ekTOY1svUEWK1/pU
         QPLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238446; x=1788843246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=m+NLp0Jc80FG4HwrbLcEKEAVSQXG/hORtZjytvZiPGoMlZhVHc+IMgyUnSWSt9ExPi
         DabQI5GGYrLcpcKfL6eybC+L1nfBo/Gka6P+Y3lbtj10TK7i4O00rlM2vGeMZCwxLUEx
         anBzWBHBcdkGKn5Wh+EImqkgEiFlmixxf467CGg+MhaPl2k0Mb4pOkzinXN0OX2nH33t
         Etql6aG88QOhjTs8R0pXGHwVRHLIa+odaczQtJBCuDENkKuFCxGYqXqZr+VOYzaMtvFN
         M9UA49xw1SQFSdYfaqBLfwDR0Fm10IxHIHZIsjMtjPBLVdETwUq39hGQrDAXwVn/glTF
         jTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238446; x=1788843246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=fiedNSv32K1LUpunetGcP3YtTuhomy9YLwaZjyNQk4PgD/yjE6gL8yN0pii1ApouAF
         6TdXGgQzeCcqf+HH/u88kNI1/DDMzhPcDBIGlWOcgzOml1fXNRjpG8C+xNj80NKU+W1O
         gzC4FXLAzryty4clF7TATDb2BwSY5JDzc/dP1u3nVm/UE/lYKnOaQO8Q7s0GXLGQ0aGI
         IqLcZ1eZwdEjzThrBy49ilEsy6h/CCVd++hCTvZ/4QV4LEHixsXRbjJ5zALDS3innEst
         pc9lvEYEfVE4bK78rZC6s6ag1riLaKJa6Vko5z+GL1lag5AImwRkEhlJq8K6ip7UkZ+0
         GniA==
X-Forwarded-Encrypted: i=1; AKwUvBx+5d1z457Q+/84jdo638Mb0OOM8L7tozYPLBceV1uKg3TzkpREwSqcduDDWFTq+ZupIlwuEcuYitOr+Ylbag==@vger.kernel.org
X-Gm-Message-State: AFuF++mkTi6c56RiGqR/xlPam+GXWad4gxSNgUHefwRs+Bx0mKSQY3kw
	LG1G/0J/bBohDhUWqnb/vhYcjtBtw/usmcT8tjnsjcMzCiVWc1l2ZQjW6p1+eZNwLpZvbKmpHFv
	hfbn1W5XkklRA3eZf63DNr5s09i81iNU=
X-Gm-Gg: AYBFou247Fco5eOtqPBvBinkiFn9m1kRxN/lKA00YjJRwX4RtckS3eEa8kNq/mLJH18
	L3i4YRdOtglKGVoTwSIzedcDVkqBl3GXNsKZURK9nI1tsoLyuq5Qc2th7PZMTELz/EsyUR1UR46
	q1yxCjQDCAJ2dvwQ6Nu6/mk/YOhRFpBKQ6ZDhgJ5ORFsKY3ODOdjKcipZm+xOxMzUwr9is9GixC
	qlPfuP8wPBW81PEIWKW8mICuqM/+T3F8nZcdgwFMF8ASu3YjOT40mFMQV8szBsXTw0xseA+rKXZ
	DHCRRWQ/qr2ZdmuEoRMkFEZyCKaZlJO4MprRq9btKBO9wVHoYbFTi+z2B8kC9V3hq5QVH3F+yqh
	EpqbFeijaBVSrlgx5QhkrVjUB3um+Hd/aTaLqQBIm
X-Received: by 2002:a05:6214:5d87:b0:90a:7f98:15f3 with SMTP id
 6a1803df08f44-90e956e7aefmr37476106d6.2.1788238445773; Mon, 31 Aug 2026
 21:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-6-apopple@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:53:53 +1000
X-Gm-Features: AcwNN1Ud4VFQrRun_tYvFTt-qwucbEEO3S9gIfzjiQyf2D1HVIdudvpKJIZc7pw
Message-ID: <CAPM=9tw6nv7UbMvKOGSsZKKwoZwCG2hvwGk=JjmsxQcH=wGfqw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 13:36, Alistair Popple <apopple@nvidia.com> wrote:
>
> Add an extensible info ioctl and use it to report basic GPU information.
> One of the first things userspace needs to know about a GPU is its
> architecture and implementation, so add that as the first field in the
> GPU info result.
>
> The ioctl selects an information type by ID and writes the result through
> a sized userspace buffer. The kernel truncates results to the supplied
> size, allowing information structures to grow and new logical information
> groups to be added without introducing new ioctls.
>
>

This is a higher level for the future, I think we have two paths for
getparam type ioctl.

Either we expose a big struct full of values with a add to the end
mentality or we keep a long list of value pairs, and userspace passes
in a list of value keys, and we return a list of the values.

I'm trying to think ahead towards native virtio context support, and I
think having the sequence,

open
get_all_infos
create vm/channel

might have the most optimal ioctl count but also let power management
avoid booting the GPU on every open if we never create a vm/channel.

Dave.
