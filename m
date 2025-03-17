Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98521B908
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199194; cv=none; b=hb3CxvPyjFwqPWSsCb0qXXkgOGdR2t9G2dKs39vCD7GVE7aZmVfRafn9/hjpX0bzYZhwKKYz3c0VkkVbAL1hpkaP6GkqMyF7oSpheqZHG4OIRw3n4U9zVWqdbrBCBaByqmzm2qKmjwPBvcG9zsVKJ+WL/S+pt+oVaNDDi/rQe40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199194; c=relaxed/simple;
	bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceLdOsF3EHEWyLXVPJtqMvzIaj5sX3SuHtt5egLi3m0/vtWpKjHfbPdTGTJ2B0qkt5ylyxlrfDcUSQsKDevR6D440zYGhsHfffTCNTXU/So4AIq3+YSB+Xex2bh/xOLK/p+3J1mGswvIhNdAJU3GdjSONzUWf62Dl9pBrOfBSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1gTeC5J3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1gTeC5J3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913fdd0120so2072561f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742199191; x=1742803991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
        b=1gTeC5J3/3cHqIo6pQ6vs88zlxImJvpz2Gh9a/6+t90lyLDe1Dl4NhtOXFyHp47+IO
         L4eR1z942iAZWXORIeS80n6ksz+51GA4Any9Vbq1b2PlRaotRLaHWaYaGbw6wLHjJPCI
         3S81krcLT9gj+5ogjJLROp0ospECcPKPbTGsOxnSF5I9LRNlKriHuA6cffIe0cVGUvBw
         rGy1AqXt/6npU5mvqhHM3Z/jYj1C2lcoRvc2+rCV7xjx6nGYQP5bHBfjLO+JkcwczBKo
         900/C0JdrgmrPfdtdr3tjgSdK2Pil25hmK19jdi4T0cqU56xOsTD+OUZGi/ODi+d0adm
         dFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199191; x=1742803991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
        b=RP/h8dEJJg5VI5bcVcuxHl+Fc2/OeCH9S5pOPGzdGae1ZiYWqHtYJ5sTVCUY2cEspH
         mX5NPER+EORsSQAuX+435nM1DLeYR5OYW3C2Z4duTYyX4/oqW7Xywk10edjs5JmB9VyR
         NhUmNJ5AaxsKJQmgTAtmFfw8GQQ8XjV8UPY+vA7i/gVBFOdVo4z39vA9p7T+t4E73RIj
         KCuNUbdmZKnlqAJ7TEF7vvlSaSzBXBgOA0mSA+OmoqhZyQ7MJ6o0zZKLXXPZ3v7aCmgh
         0Y8mkYbZUoUX/OIizqQ9e45p/vi7lEfmSTJ2aZERvhCdVfw7C1wy5AGi01e5GHmZ0FAp
         +xTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzty8qWyqemyd/yMaFodrWzzHaX49BraoAW7NWEsd3B88WWOvgxECJQaufbDjKk+k4giDqk2Qmp5oS/vMh/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQ3fgoYDRsG58nicKAWBSUkQJ8BfOnr4ZkYF3We/WVMEszx6x
	E9C5PlDbVsUUPT7wr/mwAgSFVX3XFH8XKhqxSU8+YpvGGLlJTiSyU/u8+7S2FOXIV9+shlMqEal
	Ojp34kxaPmD3W78K3o9hBHMZ6x6gnrRKzgUSR
X-Gm-Gg: ASbGnctEa4xPohi/meGeuAiIEtiTXM7fbYKa0yGh+Iuyb/dsl4YR/J+Ogis7rsCNDv8
	hEKnBmt0rmb2NkpTjUVU9iNYj2zepXhqwghnDXOzKnpK0SS2vbx4OzvvV/AfHf2DfAozRwCUxQa
	j6tUMLHsGj+5U7YDNLJY2nfhQX2wd2c3FshCH2lG4dO9Uyrsl6JkDIZs4p
X-Google-Smtp-Source: AGHT+IHcLqG5WHE0LOJYXKmJh7WPwmg2PfwcibN1in7y/66c7Db4/DiFnCA71g1wAecSs71bQBHGcgcFUkpKlphRHMU=
X-Received: by 2002:a05:6000:381:b0:397:8f09:600 with SMTP id
 ffacd0b85a97d-3978f185592mr10169130f8f.13.1742199190815; Mon, 17 Mar 2025
 01:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317030418.2371265-1-kunwu.chan@linux.dev>
In-Reply-To: <20250317030418.2371265-1-kunwu.chan@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 17 Mar 2025 09:12:58 +0100
X-Gm-Features: AQ5f1Jov4Za46UZWu9q06eR2JvM-UobNRlaF7fBfeVOrdeJd7W9eiP7leVAj_5A
Message-ID: <CAH5fLgjOvytFDnz0Ms_3R3bA7GymCNrF-T=Du=UQi5GaqfZYJQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: optimize rust symbol generation for SeqFile
To: Kunwu Chan <kunwu.chan@linux.dev>, Christian Brauner <brauner@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Christian Brauner who picked up the original SeqFile patch.

On Mon, Mar 17, 2025 at 4:05=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*SeqFile | rustfilt
> ffff8000805b78ac T <kernel::seq_file::SeqFile>::call_printf
>
> This Rust symbol is trivial wrappers around the C functions seq_printf.
> It doesn't make sense to go through a trivial wrapper for its functions,
> so mark it inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
