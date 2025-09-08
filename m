Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AE1E8324
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757358183; cv=none; b=qRmJr2U8JvfY/0/RpSwQebsONjwLBBirp9zqukPwqL/MoukQnESDIWdr0IRDX1IZQbeS2HgoEmUpWXWHLKaEcQYFSCtOq4IVdtUKIhMUf/1MFCzxcq084W2xJxl3jWkRRLVX6HYZ70HblILuMTGizk+MG2orolgKdb40SSVnBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757358183; c=relaxed/simple;
	bh=kHTSV8jfrTaUVkrn/wg4xsZHJegEbBiLAKt+O42yjxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGNc5sEpLcB7XzUFkZhk5W2Q1y6kwma59qK1DXoyxqCWOYLqlcrKlRX5/c1lqL8NwO8esP/pdnou0GDXv36HbkeU/i0jRTBwnrbNmiHPfyZN9ltL/LRJXj50XKt8Uy86DVoMcmVUIz8f/zrcOomlUP/U5Ax5GW6pWyg0789tzqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D5Sg1Mdw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5Sg1Mdw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e2fdddd01dso767013f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757358180; x=1757962980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGkvJHfAPV/3bX3cS+jtsH6Oy+pYikY5VFUSFXl/ge4=;
        b=D5Sg1MdwqDnOr01SJSjmoOTan3vlAfPGKr1HP4sKqh0Ik0HvWqnIj4uRfO8Ip4Bwgd
         RomQxpSe+pKsbIAypJcv1GMFXbRpnuTfpo3nuVwdDlh2YFgE20x+RffS21SeCky71r6N
         9ddMK0uSgb/R8ocv/+kQE0JBxNK+xi+YtaiweFU4UkQVhHy8urja/mZzv6D4LQ8x1oSo
         AjdgV/fYmz74KtCxrZNkatqRy4uiNu0YO9Jx0ywIx2qItbAT/Sin1RzhM4PNeGxgKlGG
         WZzuPt83/Jm9H+e0d6KgqzXJ5eUiS8RybtzLOdcz9KfYdlr/j/Vo2U7CB9CH3Z1Ax/aZ
         1GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757358180; x=1757962980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGkvJHfAPV/3bX3cS+jtsH6Oy+pYikY5VFUSFXl/ge4=;
        b=rB+YZb58PMCuGl0v5Kn1ck33iO4iwqu6I+qVBbiTRzc5/yd1ZiIswp5NFL17G32pwc
         sYuROi5glVBSnaiUbfdKjNuDvVX8X8dOGqnVWr0BZEId7EaW6z1LTrz8lCo2KQ6YFtpf
         wgP63vGpU3ayHHhieKNsrbuxYT90pK15pJNxOrFtVVtENW9fEsHGGTlvH/hw0ct2LbRq
         pWVhSNe/tvNYZN3BhyVlQuvtvBoICBUGVQGFp1d71pRbxZtYx8RpS8xnftnAx65u8gcL
         WMUK+rkSbT+I30Ta/HNnKgxrld8te5gB0OGi1iEmQhdRMEWOIErF1/a3nySVereUrD1b
         amtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlWwGKgC56ETm0VbIrXMnn7kqGVsrZPxiT7B7OuWQS361zwQWqa5t1DO3y2lFhHTSHyleUEXrvY8oelp+ynA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1r8t56+PcW2S7DKVSzpaWlqHfjZbH0iPYInhIUUp5ICgdGOG6
	8kbWfpqtLNXReXNWwDIdWvWpv6FlSxdFFvGy7x2movUX4c8hMZs7xfmqtMdJh4sSDSITpGhmyW9
	dsh/zSFi6QJdCAC4vlHZk8dLHZyGA8laDl1I0hBP4
X-Gm-Gg: ASbGncsUAW0D0lIQfN6Y4yFTgAVzBvP0FhDa1XWVlhqHY3VealkWafowg+RBoiksDyQ
	bDtewPc+T3MjfPK8TASFIlKuXLzFcCUJAZKLgGTVGHu0X0I+12nDc0ieK4rW6CdV6w+9z8TqivT
	K77BmaP4cMdTLeHGhUBxTuBOf1fDTnyYXf/83nbiZBDMgUDlr5WaBunRIlV9eUU0zy6OZP3x4iT
	52vDksyCPXXWzEwF7Mermc4Jv0OOGXcVPpvsRcqqDA0vTo=
X-Google-Smtp-Source: AGHT+IHD9xXpzxFp5PJ1LiMALVk8G2qCrHktRr6s3MtGbxUdLsV0q4AzUS7LRxtsm9cmQI9P4cr+vh4V5ldORb0FTlQ=
X-Received: by 2002:a05:6000:288c:b0:3d4:2f8c:1d41 with SMTP id
 ffacd0b85a97d-3e6429ce523mr7165940f8f.20.1757358179561; Mon, 08 Sep 2025
 12:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185239.135849-1-lyude@redhat.com>
In-Reply-To: <20250908185239.135849-1-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Sep 2025 21:02:47 +0200
X-Gm-Features: AS18NWA9JjcfFmYV0JQId5ES12OkLgTAZUupg-74m7pAwM3NG9Y9Z08Ctn_PmSc
Message-ID: <CAH5fLgh8_pmtwgOPuXpDqhiK7rsj0S-ySrX9M_yEsn6n5pKHpA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust/drm: Misc. gem bindings cleanup
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 8:52=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> This is the first few patches that were originally part of the series to
> introduce gem shmem bindings for rust into the Linux kernel, which can
> be found here:
>
> https://lkml.org/lkml/2025/8/29/1533
>
> These patches don't have any dependencies besides needing to be applied
> on top of drm-rust-next.
>
> Lyude Paul (3):
>   rust: drm: gem: Simplify use of generics
>   rust: drm: gem: Add DriverFile type alias
>   rust: drm: gem: Drop Object::SIZE
>
>  drivers/gpu/drm/nova/gem.rs |  8 ++--
>  rust/kernel/drm/driver.rs   |  3 ++
>  rust/kernel/drm/gem/mod.rs  | 93 ++++++++++++++++---------------------
>  3 files changed, 47 insertions(+), 57 deletions(-)

For all 3 patches:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
