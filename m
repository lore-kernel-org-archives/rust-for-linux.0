Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895B1FCFC0
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918154; cv=none; b=M8oCKRD6vUzgNgD8PfkeJGElqIymLQGXN5745kn8SU1SW2vIEmunHhX0I3iaIqhT8kHkd8cVeiu/wxoOWqCkhnch2b28X6zPL134kvlrnm3VbaOGcegtuEPxZqQkaEGF7Us5xo2l+GmBv8q3uA0xGWZ8uXuZZMj27e2ZIX2VEhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918154; c=relaxed/simple;
	bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWNB2vkFfUE7KLkB7L4AL/Xotan4QChU8dYn49hn/fRUHeBSd1qkMBjMFw6Gx/T411IKdh9DLlPA6VxiMlq6rM3PL6Rhe7zx4eeo4kj2Ye78xJVjk3n000v4Q+ZbkPWF26IpIYOgzPAh+gemwrsI3aMD8FVyIbCFgx66bl3wirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B2hYwaqz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B2hYwaqz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5790570f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745918151; x=1746522951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
        b=B2hYwaqzpwQYRzkOZ5D2TfaIKy9dzWY8hmT5aJdgDQCCTkyLcz+wJfTrrh/eJQhIka
         1ObOWKw3lXIi+ReJVbxj/0rPS48Z80+nMX8n25EhJwGJDuciqjSr8C8OH3D1fdpxqgX+
         Rc8R+X3Z0Sv/jOfEJagxAkq5kpcUg307lKeFLepzub1j6/wHbUfbe9eIo5op7O3k258l
         Uq/xQWyMzpe0dbPTwf586NUmd5WG+K+pEGLR8e2P1bYD8ZbxwiKhKqvbvcGnI86KAy3V
         8TRgqPf2JYOq54FAXbt4tNby5tX2LdbCT0YOuR34NWtF1+5TV7njrO0FKWRoxRemnKzS
         2aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918151; x=1746522951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
        b=RMond6zXPOqLhifqrR8eSx98N1A63HXSWRcM6Bdbc5Y88Y2pufYY7e9ko1Ol/04u0D
         AaNrvzF4K1FPKzao/5TCJTKwIqutWRaT9cVp52ougjerZ5LCiJo/T74gtj899cnSx9XF
         2xfY+Hg/VUidwn7sQ2y+6H/404lapsDXuMT7AH4AsffOzLrM6waePKRjrtdcB1DtWGIH
         bK+rjdBTrwUwJSazf3QF/lKtSUEe3AnVDPHPl0EsIxZki6Cb/e2daWqp3+1NNMGZl+Po
         EfUsCh5MXq7kab33Kou6GDkwFRg74GJoF6pAxV3EVNDPtAs7jo498gXPO3blGwy0L4Tc
         4zFg==
X-Forwarded-Encrypted: i=1; AJvYcCWo97o5ug4IjOD5KseQcfIZDCXZ2DqMbKBG3wG72c4IceH4E3C1gzSIQICCfPIOBRrQdu4PzV0gZ2r/7o+fsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOS7yFb5/31r8mtg9JiAumZTwbx4eiQvk2eTP7dNEG7L18Vzoa
	JDvDufVT/24ePk6eCuPWm1i9sO668Q0qbouoZZ7xVMe6WKqMG5VEXJlJkuJG2DPMgOjbJmYnvPM
	u1wRrwW0IY3bauL9kb0nAD+XP1gOzSOW1cddH
X-Gm-Gg: ASbGnctcRL58JnE562ULxxH9Vi9VBDrD11Dw+sqmXPmrxCojz5oyjieqyG5Hywil18d
	i9VtNQzMRzTafkYVL6Qa7xaoKg9G4389Cpqy35/gAH2vN/QJT8cs66+EEVLLtPtIM3J8bttqNuv
	iUpmRfoJz9VxsBKGfhp7pfkdpifcGZePmu5RfXiXyjJ1tUEHeaDbQ=
X-Google-Smtp-Source: AGHT+IEncBtE85ntUD+6ecxTM2Stq9GOdP+/zLQpd95Lc8WASb6cmzfeblmdD3wxaEBUDJNBrqJPisFkCiFY9yZAsjo=
X-Received: by 2002:a05:6000:401e:b0:39d:8d54:5eac with SMTP id
 ffacd0b85a97d-3a07aa5fc6dmr8605336f8f.11.1745918150814; Tue, 29 Apr 2025
 02:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321080124.484647-1-kunwu.chan@linux.dev>
In-Reply-To: <20250321080124.484647-1-kunwu.chan@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 11:15:37 +0200
X-Gm-Features: ATxdqUF1uPAfSKmGHM5pjmjxa5bh82WME0R0VffTaZqHCcY9807HE84scLngDZQ
Message-ID: <CAH5fLgiqFWs+Mw+8AYOOx83A6vQGYaaPJ1RbCZFEKALabLxDiw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page:: optimize rust symbol generation for Page
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 9:02=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*Page | rustfilt
> ffff8000805b6f98 T <kernel::page::Page>::alloc_page
> ffff8000805b715c T <kernel::page::Page>::fill_zero_raw
> ffff8000805b720c T <kernel::page::Page>::copy_from_user_slice_raw
> ffff8000805b6fb4 T <kernel::page::Page>::read_raw
> ffff8000805b7088 T <kernel::page::Page>::write_raw
> ffff8000805b72fc T <kernel::page::Page as core::ops::drop::Drop>::drop
>
> These Rust symbols(alloc_page and drop) are trivial wrappers around the C
> functions alloc_pages and __free_pages. It doesn't make sense to go
> through a trivial wrapper for these functions, so mark them inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
