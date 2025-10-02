Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654011CAF
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443119; cv=none; b=SqlqOUuI3kNWBv0yFLwNLg4crqi6VCtJd1IlddTGF3+LeJ+9l5lCdMLGqKWjPdAVLoyJplVxDn8DHCJNZ2R0AvYGp0uSYqavPyCXWbfuEC17CzrDRs3DQAQI7/2n6dzhnOZ1Yt0yR5r/XY27S4Ys0kAQlOw4zblLML/dH3gIfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443119; c=relaxed/simple;
	bh=lraP0hz23/2MXfOmQ8ZprXbjkp5lv6pLnFTmwv/0En4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eY4V+qjXuAtk88C8xdkgeCRU0/lnqQB/3I9T32DDgQGjXYgD3JrIyTnqUxBZUecg6ZbNjCYLdSbSqGQ7OT5LrSSkS0cvNfZt4AFmq7N5idUGTDJl3ckMnHMGSIzcsErv642joS/hYWMq7Z5EgfbGv00/dEGAzrjWTLMaJQ9fDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFLp/Uec; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFLp/Uec"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2698d47e6e7so2452835ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759443117; x=1760047917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=CFLp/UecGK2okC+ZBtyo25OGUI/s73E3RYQWb+F9qF6CCBnFjhFltQJzlyb9w9Z3vn
         tCynUo/i67joX+VtJc8C26vOcV6VZwsxR/q+BVpigRhQbJWQG27POQ5rfAsYj66wsA5D
         IRzYpWXTV6sV9ejw3ep1cq4Hf028TKgh5Stx6OFrH028/7l+2AaBrLIXZQ0tfecaQRIu
         xjn0WXopHRkwbGETUfmeg1OZxCMIK7N0s5tE34MpmS5+msxVOpJSj2RgIee+1aW6kS3F
         TPSTrYu7wQyusAbswYfZWxISxwMefeOA4ekDiv7dUBIXNovoWBfCA+ELDz5mi3BZTakH
         3B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443117; x=1760047917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=AxfL3IO0mNilfD5YsLFBUL5/a1m+Sk8OwkQpC60J152/PyhD4Tp3QHhuJV0IL8KcyW
         nbm3GehKMzMfZsGEcoDuhTGzwhm0iC+BgjTVf/Z/FwJyD3sqtWHwu5qSM8Y7IbdNjAzy
         eI8mLv1Th6lo0+utBjk+UxWLmUeLPrxrVgA65TgWwCLzMfySl5XqaZTwDYgH3rOCcPbY
         seokB9KGMwT0v327Dd/WWglv0fy10i0HT0Yzn1sZMNJFmtysq8/FL/s4Rw+zaRyjEjY6
         WGpMKHp37sqFxlsl7XVdJaZrTo69+vb61HeuJqxLEUwv4Dd2H67FFIpAX0mxwbNPjZu1
         6Y7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvDXZF12Yres4kVjdnGET3eIiBMa/nuDUrCMDlsLh9LUlqCX6Bf/j7KzMohlkJvBlcX6ShbDA643gFxl1Blg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZSDmfG+Ipv62iW2RgNZfcLRrnvUDdmIVSbcL+YieqocQ89Bv
	kNtaRPJmmToGgwCuoHiBkgMFy+8Z3fo3nfx2bxUwePgTmvd8Ndr1SmD8DK0I8wEqqDh04nXKyHo
	Az9vWrHnQlT5OkidZwyxszu1WjkKpnqnLeCWP3F0=
X-Gm-Gg: ASbGncsl6inoxi7kVrSFK9QfE7NTCE58/uqubgGT/VrZYCWW/A2tMFi9NkjgxtGbcZb
	iDe1kR6TWNH6Fl2aOeIGKXAZbefIMQnhX8dy+/XGydhxTwMiRuiImbJtJqvZmAKmDyEzWRqk8Kh
	cY4Ai9hHPnHJK5KMC5VySX7mJA3D5xamerB2eqlrcJtFmcXdhm9QxbFxKR3sWyfBu3x1k6CQojU
	3OYV6fa7WTmWRJf7plkXUgkRKK3rIQfOIkEoErsXV5TfoeOJcCHoBehbb4EIBu+hFXzW4cnzE0X
	ArTkt1furg8FfI9PC5cRhm15hdjdPYNVHcjrA3wM/peffnZU6g==
X-Google-Smtp-Source: AGHT+IGwKnqSVieJ3MfyTgFFO/O9vpr8rro3ogT4lM4nX7G7iGhsfj8Tx0MNi0UQc58JqTsdSFoH8GBJjyKfBVPnZAY=
X-Received: by 2002:a17:902:b196:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-28e9a665b6emr3287285ad.6.1759443117189; Thu, 02 Oct 2025
 15:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
In-Reply-To: <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:11:44 +0200
X-Gm-Features: AS18NWDnPckM1PfneojmzdbCoOjMOJM9kMDMDSDk4r7YVa59EgpddvEXF-NHdJI
Message-ID: <CANiq72nE2gAuK_ym2=As3yXRDoNFbKuSa4oac7abhpjy45ZQGA@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org, 
	John Baublitz <john.m.baublitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:52=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> It seems like bindgen's --clang-macro-fallback argument can avoid the
> entire class of problems, is there some reason Rust for Linux has avoided
> that option?
>
> Although, in order to make it work with fixdep, additional somewhat compl=
ex
> build system changes are required. I've got it to almost work locally jus=
t
> now... :)

I am glad you ask! ;)

We were the ones pushing for the option -- John implemented a
workaround that I suggested, with optimizations on performance:

     https://github.com/rust-lang/rust-bindgen/issues/753#issuecomment-1674=
833380
    https://github.com/rust-lang/rust-bindgen/pull/2779

I think the last time I tried it was early this year -- here is the
test patch I had:

    https://lore.kernel.org/rust-for-linux/CANiq72m20pom+B9EmWO+91E8fjbMEob=
3JmvHRQ6UaXe_JmatfA@mail.gmail.com/

It is in my backlog to go back to the option, test it again and so on.
In any case, note that we will need to increase the minimum, so it may
take some time.

Further context at:

    https://github.com/Rust-for-Linux/linux/issues/353

I hope that clarifies.

Cheers,
Miguel
