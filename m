Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF223CB
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Oct 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789768; cv=none; b=PkQjn7m2joXHYE4CFwB5GFo5RrwGmkAKQ+b63J6K1xcDHc0xoCoKgvvQqPU5EEThmX5ibcK7UZ2VvPXVyCmzG6gTiiI3JPCj8TeuUJa+DtpnhI41s59q7O+/kUCUcdIzJkDBhwj3TVaVrZjIM57FvDEh1frZ8uGgY3AzYm27hr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789768; c=relaxed/simple;
	bh=mFaBUuFsiRPLWNcrtm0mYjeFmk0YgNWS4VulFHRDEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drpnHnF28XGKOt4ZXXK0xZTQe5Ibd5ovWUbeePYpOFR8LcM10+AT2DzRsCpwQymCgoDXu3xmlHSfpgS7ZGsO8+tYTybc6Wlpnna60df9fZtnRSo71GTuaSkbArLW2DBaz6/U0PZeloeHz8f7QP8PNyK/h87RZ66F5a36zh0ONrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAyFTRD3; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAyFTRD3"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4da7a3d0402so60243231cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Oct 2025 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759789765; x=1760394565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVmyDp3clLGLS8kIW7yJXXQisPoyp+nIoQv6rloL8GA=;
        b=bAyFTRD3P4l/cuUJhSyHgJIYruvNH05P/gg28FrSBtp4pEUVX+3dZPXVI29eNGAaJf
         kGHGFLveS1fPIK0To5gL4gtxAajE1uQ7H4iNtbNeyl9EBceDjpbyxEsGfMFobUzvfBRU
         s03pVQIwvNpJWF/ruoUkdKLvyPHP7zwMFMF6Mq7tSRTuafBU+iwcwcG4EtL/oc5Md2vo
         gjIe37zg1FLbz34Mdm28MFIG1IN9GpPCPyAX/elxPbrjhWLIOKZ9Faq5KgmlfyoPMNuv
         TjwL395AIrE6KSOFRdJhqcnq/Vj9X4ZTN307JkxDuCKzYpzdTd8Amtm68ciKEdEEg2Ur
         pKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789765; x=1760394565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVmyDp3clLGLS8kIW7yJXXQisPoyp+nIoQv6rloL8GA=;
        b=w8c8NBrnOVSZvzVbJ6QJGMGNmhI7LlqtvK32SiuuFlEid567cdMGl5+PF0pWjU0D45
         CVIUGMpS2TQSJQlICZm2HfgRSU8B6E8o4BbNllxkd3sKDS4X2zvWluGo/0SoOKo7n+jG
         FAhQeAQ97fL9s1ET48ZpuUpiXVw1btycRCzFhIoxfieUvLjbcKxONlhsPjY5qQDvFIQk
         JKQNaJZD77GxV812mPmM61tl8eRsXejHSbKXLxRtvxiKb7ME7hXYjkZMM91wGmRWS+Em
         ciQ+AoqK0kgrhjWnkjypxVCqxKQOmBt2RvBvpIU/exXXNsphCP6KQmZTQ5LjeU4QBYmn
         Qqmw==
X-Forwarded-Encrypted: i=1; AJvYcCWSchB56RgMRDFMrRAHlOV1ipXPqPNZ1wPG3RF1caiz0Rh9Ln3ePj0tmStdx/By34BQ/xQ+0+x6cdV5UpDnyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQzyhkc118X8x+BLEBjuc5nXJ5H7tygXf4DND6W+q3IKtYJeC
	VZS9uTehNBguCuPmGb/+LrjBctI66PnJ0F2CA9a8du9k/pSDzDDbxY+b
X-Gm-Gg: ASbGncsqVR9U4ETEhnML+UGKSHdXKyFcM+GksrJC0/5yBJWYoW01vZ82mRqqHHoXBhj
	LsyyhuDliPwQR9mF16cRaGNPuvTvdbrz9PKHRK9VJgMWDpOpVkGKE+Vz8HfgVZOozeXFbxsqLOS
	d1mLXu9087JXgi3CAXVnDDlaPo93lj/bKTw0f1P4AsM1bojZPJK/6reDtwMXU5UFL4KecFF1Iy1
	0LFEI9eflVO/JsIIc/hLf+5KTFv535y0/drBEsZIwOgx+gAOeKjXetSuUi5P7V/fEG6CLtvSuDA
	3BPNYGL8IxgZFMKxjpZ3kNqgw5o98OJSbC04R6+sMPFxnSicVUMdjW8PjBMPfWxltyxAmy9XXC6
	v4ZaAGnWbg+PPNU6Xg+4nXrjmlfHb9nDmnl20nUl4W5w=
X-Google-Smtp-Source: AGHT+IHPqikPMwG5q0hEpff7no1z9szaNg+f/yIWTC45aDjchAEueYobJpT+cU5Ru6SV8Xq4v0V8Ug==
X-Received: by 2002:a05:622a:1807:b0:4ab:6e3d:49b4 with SMTP id d75a77b69052e-4e6de794646mr17493561cf.7.1759789765354;
        Mon, 06 Oct 2025 15:29:25 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e77bcsm131484451cf.24.2025.10.06.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:29:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 18:29:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dakr@kernel.org,
	acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
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
Message-ID: <aORCwckUwZspBMfv@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>

On Fri, Oct 03, 2025 at 11:47:43AM -0400, Joel Fernandes wrote:
> Hello!
> 
> These patches extract and enhance the bitfield support in the register macro in
> nova to define Rust structures with bitfields. It then moves out the bitfield
> support into the kenrel crate.
> 
> Since v5, I dropped several patches and only kept the simple ones that do code
> movement, added a few features and added a KUNIT test. After Alex's bounded
> integer [1] support is in, we can rewrite the dropped patches.
> 
> I also dropped the MAINTAINER entry for now, pending more clarity around that.
> I am happy to maintain it, but I need more input on who all will co-maintain,
> now that the last 4 patches were dropped. Perhaps we can maintain it was a part
> of the core rust-for-linux? I suggest let us create the maintainer entry once
> Alex's bounded integer support is integrated but I am open to suggestions.
> 
> Here are the v5 patches [2].
> 
> [1] https://lore.kernel.org/all/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/
> [2] https://lore.kernel.org/all/20250930144537.3559207-1-joelagnelf@nvidia.com/

Hi Joel,

I returned back to v5 today to just find that you have posted a v6.

There's just 3 days between the versions, and I'm pretty sure most
people were not able to even read the material. Moreover, there's
an -rc1 window ongoing, which means that people may be busy.

You're still receiving feedback to v5, and this makes even more mess
because now I'm completely lost about what I should review and what
should ignore.

Please allow a usual 2 weeks between versions to let people have
a chance to give you a valuable feedback.

It seems that you decided to drop some material, comparing to v5, but
don't even notice what exactly has been removed, except that vague
"code movement and few features" notice.

Regardless, I don't think that this is the right path to move the
bitfields into the core. The natural path for a feature that has
been originally developed on driver side is to mature in there and
get merged to core libraries after a while. Resctrl from Intel is one
recent example.

With that said, I'm OK if you move the bitfields as a whole, like you
do in v5, and I'm also OK if you split out the part essential for nova
and take it into the driver. In that case the bitfields will stay in 
drivers and you'll be able to focus on the features that _you_ need,
not on generic considerations.

I'm not OK to move bitfields in their current (v6) incomplete form in
rust/kernel. We still have no solid understanding on the API and
implementation that we've been all agreed on.

On maintenance: no core functionality can be merged unmaintained - it's
a strict rule. While in drivers, bitfields are maintained by the nova
maintainers as part of the driver. If you make it a generic library,
you need to define a responsible person(s) in advance. It's also a good
practice to add a core maintainer as a reviewer or co-maintainer. Alice
and Burak added me for bitmap/rust because I already look after bitmaps
in C. You can do the same for bitfields, for the same reason.

It looks like you have some offline discussions on the bitfields.
(Particularly with me.) Before we move forward, can you please wrap
up all the input you've got, so we'll all be sure that we are on the
same page. Right now the process look really messy.

Thanks,
Yury
