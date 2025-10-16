Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD12D9494
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642549; cv=none; b=YoUS3kmfrS7gS6JP9GpbNwqDWEtU0fgY2RZdCYfsebTu8uiNQvNJ86LTFI5UfoV9RkLAX1B1ssCZ9Z/Tt96bO8YQHc7b428n70QhDAs5k9njvUaZ6ILYNIrY36KKm533h3oTMCdDuRwBt0C0oQEI7Z/z1Y2FkriiNkWJJjQZ46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642549; c=relaxed/simple;
	bh=u6TNI6P7uxhJsMAo4Mhkv+owrlXQyJn08NNCI9uXiro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgVNTnFYFuZRNpkoXLSZPWCNGVxkRkf8zx1BLN6JxpuNUt+i2btQScKNsBcP+MF5AUPDbW83yPFJfIBjjpUgN95r2shLr/dav45el/dE4ADpZb7iyFc8XuL4F4ttxqdE6x7d0vmy/wtJJMcjI7BV4suUJZzsrziis15Zyw4W4qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMYJSQTO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMYJSQTO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-28d18e933a9so1784965ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760642548; x=1761247348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
        b=LMYJSQTOQx6/68djLsNmPLV9djmCB4JNusOBZPW6rwetVzs4Pux9+ucfnk0YUnfAs1
         RmHfA5tDF/Cb3fMjMjkKFAg6ndBuXXsViTcCS5uruWdR96+x9/apfOs4O0nEethEiOWR
         PX2Hnc/MV1MA2WIwtXxOEF7OymM+hqUcclo2l5VS7zcUPEgWfW/KpOoRBr691NODe8sS
         4KEJ05XjLBNhYnwoNk7iiW5AscW+IDkXfl21Z/gQk5b1iYb6Z67m12KfE4vQsCZoVA5W
         ghV8LeRCU7DAJ2kkMfAc/Ztfaui5o3hKbSf/q/WmmNVg7HKjz/4+4Bu0ulkPQUsLCOUA
         nQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760642548; x=1761247348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
        b=vq2k60CfH+hc8XgksXtQFYZZHXTWaf4kPTwHlLCGLVWcypFX0EBo9gR5n+9FX4bgL+
         am4l+S5RPtN2WqmtRLclC6fD76J4Yvmu1o9EZ3QLdmjvsV82ik7S+R94zi6AHAodQMLC
         BQGMGNsNDjoQXFaRLt0vKPH815FT5rKE76Ag2CtYYudr45jp5TSP1otzIdD8rN0hOdWc
         WBjYyJWmJMoLudJJ5Sg8wyfkKlVIhV0JijPElZQfmvHRKDLi7WC7hOvghoNTipSbEIzc
         H00mR8bLHF6aSLglt8JzZNCXIJ1UtlNerkeP+k9+IKvAv8m1fEq6DHxHDcc+0HaieQZL
         vH1w==
X-Forwarded-Encrypted: i=1; AJvYcCXTh079X5tl0ZSyWE2zA0xNzhDaLJEUk73MjVLntwrkK+qwDUfXWn3qoYpYjVCwbNowBWJ58/Nk8SKWNPlGyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFocN0xE9gS4kGPwrLhfZ90Fmlgm8fIoGKpoe9Xw3eznYpDS5
	jC/vQGWkesVlZQeHxPOyZ3awwIGv21Buizkx39RrcqdoNmWF1lDbck5xMSOvrgRrFIbty0jMPmB
	M+ZPI6gKPEcYJ4ezU4hhOVGdZBK/OJPA=
X-Gm-Gg: ASbGncvu8HbI8HKazUupAM+fHZajItbVPKR3vDFVGMOl23m3plTmt4jfFOotCTiIzrw
	kwcMNxe3b+vn0jwb2xAmMm/FsogJHnSAOYuFpyf9r8cBYbFmkxHOEFOLqiQ+nGTGgSuHtxvq7ya
	YMYCrllNxxcb3PaUXSqLHgoUvOotZi6gsq+Z1xwnAH6UttLHIIYWYUilz08IquYyCWG9vwFQqK3
	XgDo+nIUFEq4ZUacDaX/mQjFNQQW8W4xfuaM7k0Gzmyyh2PcO7V82O/awurKUDBAkIiZDdTi/Lh
	3rVi3u0+QGxFwoIG0QtLNIgvQsRLDJXnCHNjQk1sTFupKUZj9y+rSqnCj8bZfbjIJU5gTfyHC66
	sPftgoJWhYfj7oQ==
X-Google-Smtp-Source: AGHT+IHjy8KjEMzI/k73gqsgnhmTui+XTn/RvV7qTycBPo1XmiJr5yhiR0piRHANoQ1JkvBfjCgn9II2uzdLiDAifMg=
X-Received: by 2002:a17:902:eccd:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-290ccf29388mr7338615ad.0.1760642547522; Thu, 16 Oct 2025
 12:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com> <20251013062041.1639529-7-apopple@nvidia.com>
 <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
In-Reply-To: <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:22:15 +0200
X-Gm-Features: AS18NWDEkVfvPPz-PXmo2P-iezhkJ_4yR77lvhxdIOXjaj9vZ-OB3fMu7gnX7yo
Message-ID: <CANiq72kWof2RL93s5L7t52ax+G65iBrOnfMa3XrqC+LgSO49=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] gpu: nova-core: Add GSP command queue bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 8:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> There are lots of unused warnings when building on this commit. I know
> we don't like big patches, but since this is semantically related to the
> next one and the two touch different files anyway, how about merging
> them? IMHO this is preferable to adding lots of `#[expect(unused)]` that
> we are going to remove right after.
>
> If you have been told to split in a previous version, let's just add a
> the `#[expect(unused)]`  where needed.

A possible middle-ground is to add the `expect` in a "more global"
position, e.g. at the top, so that it is a single line change. I think
that is fine as long as it is removed right after.

Thanks!

Cheers,
Miguel
