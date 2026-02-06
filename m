Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1A22A4E9
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340045; cv=pass; b=f2T8lPva+S/aRlbp41CHahjASDjDthjUejBv8WWSUMBaQHSGb5RNoMpdQkWkEXqa70kDXnvOVTIY+yLSwTotqjGpmQ2UW/2NdVrSbcSEDx1sG9/3c+3lo1Xj335zVzXCv1nwStgC9vFs8wKy/T9cLy44PtcboCvENq3hIlfUY/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340045; c=relaxed/simple;
	bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZD7/9qNJ6TkCHxiXDmjhdAia3swjPnkQiUpTQ3LiZKnVMDQgUDvy5y6mKF/9WhR+g6V1ZuOGg/3lbZD2go3CrIjei3+wnZZGgXpPkCf3bpy3FruZmtCHE7FvpjuaVWxRytRvRN/qCZ3LcZGYGueuDPyfyHoMbw99ZVMQEyxTNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBSUUK+p; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBSUUK+p"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso21544666d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 17:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340044; cv=none;
        d=google.com; s=arc-20240605;
        b=Uf3u/L8+AFGIHoWGVF2DO2hfSUXXnQ3/73VsbuzJvyKZVKVi5g0MNmPNtBl32a9u5U
         XKNlYrpqkOVTzcuYRJ1ysL5zWMcFSiJmtdIT9DbnCUR6TyyBS/YLxteg96vNZMc1gbaw
         Z6/on+ENFzGyEx4C7raVsScMCIsAgGj8rXHbr06KjhvPdT50e5W9mawVhgm+The27EX6
         O8CvrX4NRlrAv0VcmAE3LTp3/XxH+A7g9EzkFqVtdFz4c+cUZlnQUbULOxJ0lVFvfbOz
         kdCq+wwbjr66/Q7Y1RwGNWZ7xC4GhKb8N/GzOwTb8wBt0peyw95+WIUlUbcALe31qw8y
         qU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        fh=kq3ygaXsAejh902uMPvRGet4is2Z2V+zICkJXbKfsY0=;
        b=LVam+SDtS5SrHONoyNUMdNAoB9o1o25MwF94cwD51cTHH+GOsEUuJEAJz6XhxhUcP7
         ydLsgZkLU/iylWGmYyTSsZCZXp11Dn/u2wFqDsoh4nAD2aj1q6V2Uxc+8/DO6kMXWYbj
         zZxCXi08tRlrvpE/uYABY71q/cDDAZYiNDCfhqZolGX+k2zTH06HM+CPNsAFd7WXEa77
         cLqk12HI4UStnuPlWKUk5OVlHr2/ByGtJd+gUeQnPtGGPZEbL9pDez7X17Fm41fKla3o
         QCq/LIev5UMfHks99DMHTaS/KErLnmRxeJZaIgIC6nBk9cxGzZiXL+krcj/BluK7JvB1
         TzPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340044; x=1770944844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=QBSUUK+pHEQKVDWqU7aVtVvNN+Z5y3qfTInfv+o7/d+2U/Uh98z2l3j5dJzMDHo3Zp
         7KKRnsvL51LzOWN+hUhOeIfyuKXIdl1AsuQ+9ImzT10RJQrmJhcU/ERBypEEGwG3/5i8
         sny6S4hqC9OojiB3yjMI/4xI0HaVn/ERoMhuAmXv58idmsWrURwif8g/EEhH1jV6AfGQ
         jln7vpt5QNkBk8Q829AqmRYgQsGCqOzIKNZyRNh+XVEmsmC19nnmfcuVySZZZKgwA0EA
         aam044VkgskRdJrJcg3J5Fex8XYRGFJKrLcV5M0IwV4LGKHYlwhHmqs+v1frn9zxK6TE
         oTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340044; x=1770944844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=sphCbvgylwYDT7AQ+8M4QXW6VKGa66W5vCKOH3IDMD4zixFX4BXRhyY33Tc1T1uIQS
         +QRKpRzbGKr+zzhxcbO6a07NV/PEUyTp1vUVDgFsO4rXBDMAR3qr06zSwbTq3UxcGaoh
         hGCuYpgEaLrz8Ct98KnItTTYWUmpd2KX/w3TmkzUleNYJ4keLtsJpdBnoHfOuwkbiqeV
         6CGaatoHBC/ATs9cxLAkV3c68cDE86QpKmFdbUbeE358m/XygUQhSBY/MpWTaTKVu6QY
         kJ5aK0pvtzw4UVCmzUUkP6hCEz9VUMp7eAKqyHbcIEvhC5ftpoGpNq5FVuZbIFMXu3JG
         zZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCwfMUWCnxCcKb/ENp3Um2pEwtrGku9L/O4cCkLcsSJS4uZ5+1v3hwWYPVAFU2v7AVh5rSkiUTVgws1Dipug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Z9aO2Z05dxtPzJem3ib1D7Z9qqA9V/jh57XuN/8rFWttKyKi
	pSIEtoAneUDgUQ4DVgiazHIr3GbEiB7AkJpR5RHAr4hhaD30snATgdwY1C0TOgW2q/UKcct+nKC
	l+DDzvYNeVMTJ+Vu5ah5ml6gRLfyAmms=
X-Gm-Gg: AZuq6aITuGyUvcM//pMnfS7Tku1xZN/FoQUjm0Lt8Al/tJAKaJTP/YEn5irTkqoBKsE
	7mJeFBlYgsSHRr3vO8bibtRm7//r4znlvsYKCiQf67jYkqa6slrrlYs19JkvkQq0TB8m30lkvrM
	AMP5Bur5m8GML7DsIiBHdVyVZYeEqDlek5CfKC0foTwuZ3OdExwp0XSp5uVh7s/XfUItnjCT0Mb
	2FKwhv/7LZ9r6PeG/CWLFXnA37bYAREj7F7XXyz1Vo3P44HwHPpB1cbSv0f9d/L/ZgFCV1QYA4g
	KBxC58u82uJp7cUTOUk6zKcZimQxivyZ0h2kMY4CSJxJq4H09FrpQiY=
X-Received: by 2002:a05:6214:c29:b0:88a:44c8:fe30 with SMTP id
 6a1803df08f44-8953000350fmr75404466d6.10.1770340043910; Thu, 05 Feb 2026
 17:07:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-3-joelagnelf@nvidia.com> <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
 <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
In-Reply-To: <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:07:12 +1000
X-Gm-Features: AZwV_QjEIAozPEFJ7NdCW81HEOLtXZUhxCZzFmSJOZbp-SMcdPX-QLYah3tkGzE
Message-ID: <CAPM=9tzafj_-L+ia8q=tL5DBWZU9PdSq9vaCAD7ituoMR+CaQg@mail.gmail.com>
Subject: Re: [PATCH RFC v6 02/26] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 11:04, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 3:55 PM, Dave Airlie wrote:
> > On Wed, 21 Jan 2026 at 06:44, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >>
> >> Move the DRM buddy allocator one level up so that it can be used by GPU
> >> drivers (example, nova-core) that have usecases other than DRM (such as
> >> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> >> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >>
> >> The commit cannot be split due to bisectability, however no functional
> >> change is intended. Verified by running K-UNIT tests and build tested
> >> various configurations.
> >>
> >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >
> > I suggested this and think it's a good idea.
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> Thanks, Dave!

I'm going to apply this to drm-misc-next today but I'll move some of it around.

Dave.
