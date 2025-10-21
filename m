Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A61F5437
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062462; cv=none; b=FW68aaCXHGGrZ9cAW7y5d1D+wbVFlElJIbHGtfynryKkmETOs+FoneJ7j6j32ebwCXSkS8JwU1IxvxSgwVGj0kALyr9SOChNpWGyv8mmRGWjyNaF3F+labt4huuLNZwmFhPK6J3RDiYS5OLleFakkpmWyyvGnwKGH1PKaKvDvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062462; c=relaxed/simple;
	bh=l9McPck7+fRtP8oHsbqDK3T9B1jxgL5s0koTgcHDrMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmVGZo/9QN8SZrNiUucoIoK3jT4r/HAaC07nbrWYeHtri0vZz4RYTmsDXo5OVkNWm1LkimdTUUFdfp1s/UDBWVhAuoEHhpjfQfxX0/XN8yFDah7sDkz9OOlAYHVCU7qtTK/ApyM8v8oWtSu15ZcO08VjXQjuCpYtYHK4PbDZjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lp100qYW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lp100qYW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-79e5e17f6dfso209275b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761062460; x=1761667260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9McPck7+fRtP8oHsbqDK3T9B1jxgL5s0koTgcHDrMI=;
        b=lp100qYW8ZZePqlGpiIXCJNN9rKA6JH5MVggkns8qPNM2eGTlGDvmyfQhkd1AXvtxF
         N0LFYwGt2cDq/pz0sRyyWR4pQ6+JEdKTeviIKhTLuFEOmrzF5PHfHug+wdK3oRTv0Q5G
         i5dWey9LP8GwpRKM+j4lpL8CXjkurZ8mztK78evFPgZ9P/D2PHvoEKOCu3wVQYJ5LwdO
         JpfaFSC5fknkXAqlAfDixvnTC6ZWrYPh+jZelgQdkRJTvAZTa2JjZkczEUkM50xuPicQ
         LU1OpqvQxpqElFirhboA9p0WLwcRpcKoDHCCB8Ys2e2lYs5rFud+1SAUHCDflZlabjE5
         d+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062460; x=1761667260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9McPck7+fRtP8oHsbqDK3T9B1jxgL5s0koTgcHDrMI=;
        b=Bq7mqtlhc+DRD/xPrxhYSuisRNLb7mtGfmOE46604PtahEZQvO1Ps2Z/lPYUVGiXjY
         yMN70bvU+pWqaqi/xq7JyHYx3WE63FNTFf5m57nG3siYX6+34y7/fFSTRxkjt+64hVnP
         c5dzbtjOlhQRQozDTnupxFQYEpok8vmbKJZkKeBakQWQDc/teca8jApV4MxUdzA4KPrL
         m8/26pictdgaXmv5zO/c5oQWYTApLg7hn5pzX7kDVZ0x7O6+BCw/r+RwdQR0qbv0o2Ij
         Fn3zWzgCh9ACIRAuR3TnfZIxiivIA6NVMVU+t5RoiIyj+PZXlnNBtWRPT9ry4orgkGse
         78BA==
X-Forwarded-Encrypted: i=1; AJvYcCXnhi0fl3Cck9V1JdFvVL3Jq+oAWi2+9lfWI/AHtuL22YBbTwAm9LaMJdnFz4CTvQ5fxEHQy4IaZJRuAdvi4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7uV0hsbgwFIygmbu8I6PBWcK2YuPyhIr8kNaiZK8baaI9oND
	8qO3dWtfoJF+7A/bIlxgVomUXAsyY0YQ4px5NExyXeT8PNz8IldqRy0j9scwMFevn30DNW3x0o0
	0lfMABklRmCgo3ulUp9HZj+jgzh47jZ0=
X-Gm-Gg: ASbGnctd4mAXY2glwTJs3R/N2/Q79Gu4EKTl+IVf0hyQGHYLo/BxUM5otagHPR3JOYd
	ctOPSOhVOFisIVHDRVOOdtTsEDvUb0UREwyZlm2198zQH5Qp+/h03xnJNWOqWjAnJxMJ1l8kCJj
	YyUCtqLN/tBy23ZRAayYluqj1Xm2cixcuYINUHyV1imbfFmNGrksyHxQSFHc3FbY3R96owqgnMD
	pJxP9NCWeGXrngxStgCtoK7UQHZ3qrnKnOcWYIbkPyWV/iKqNQSrrgn8eOt9RG42HtVAWSc5Jmw
	sjhMZytjBxSjY8JSlSE4Drbd7CNMtMmzw3pgnhMfGxXMmSMbp0z96BkFNoSG5rrx4WPNh7fXIUI
	aFW2EfTbtuuf/6A==
X-Google-Smtp-Source: AGHT+IFQfi/s7O+AS7+ugi0AvG3Obf7x6s4gJSfq/z9A99N2GSsEFGD6AtODHA+FDvs4i/OimtZEcD5AA1Pf1qMAScw=
X-Received: by 2002:a17:902:ef08:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-292d3fad068mr25694605ad.6.1761062460097; Tue, 21 Oct 2025
 09:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-2-dakr@kernel.org>
 <CANiq72m_LSbyTOg2b0mvDz4+uN+77gpL8T_yiOqi1vKm+G4FzA@mail.gmail.com> <DDO3T1NMVRJR.3OPF5GW5UQAGH@kernel.org>
In-Reply-To: <DDO3T1NMVRJR.3OPF5GW5UQAGH@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 18:00:47 +0200
X-Gm-Features: AS18NWBiq5dOJe6Pnbt51CNfFzfArDoMX7kF8GitQ2ivyHNjHdvLaE-OZwfPRas
Message-ID: <CANiq72k-_=nhJAfzSV3rX7Tgz5KcmTdqwU9+j4M9V3rPYRmg+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rust: fs: add file::Offset type alias
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 5:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Yeah, I don't think there's any value making this a new type in this case=
. There
> are no type invariants, useful methods, etc.
>
> In fact, not even the type alias is strictly needed, as i64 would be suff=
icient
> as well.

Even if there are no type invariants nor methods, newtypes are still
useful to prevent bad operations/assignments/...

In general, it would be ideal to have more newtypes (and of course
avoid primitives for everything), but they come with source code
overhead, so I was wondering here, because it is usually one chance we
have to try to go with something stronger vs. the usual C way.

Cheers,
Miguel
