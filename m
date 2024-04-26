Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4DE12C493;
	Fri, 26 Apr 2024 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150118; cv=none; b=PCvgimkLhfMaiFx6pghrN+H77iuCeDfIIbywW46foVlaXro+KZOxvYFxnzqD4ijqRrBVLVLJXYFQPDsILNDVbjH7q4jrHgPGOzDBcEbJwDsqRBdoyuIc+xO34f1cipo3UH3My8+kIt1JyLl4W+o01adL/dLjnbBC8FV/aaQmTQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150118; c=relaxed/simple;
	bh=isJanjft6Ijm3USO7GK2BudIrWLYWU6b2nnmV6911CY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyPYkL1jayWR9EnXY/BagWnlXa0hqAxGC17Ac1zeKPBiroatZUVvVtc7lo0818GGA6nB8vIaSk61Jdlgc+bcS6irIflbPSMbLxxi9c4vIPk1uzQSLhh4njA65NyDplG3kuYMf38KKgVDxkTveCDGORK+EwYB8nrQWUV3h1LFPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4GNtGnY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4GNtGnY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a5ef566c7aso2094048a91.1;
        Fri, 26 Apr 2024 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714150117; x=1714754917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmMXkGy7VPsvwtkKsXV/wpxBJRPdn7aku2j+I7TeRZI=;
        b=i4GNtGnYY6gYNWxYnMkIMW5cM20mJTmbKrCH42IHcL164NoIIsHwyjlWyQJTGeNLI/
         A4HjgxdIxAiYSuELIV2QlK8bYhEoD4MrLUDx7ZH2IOmmIoL8lxQogUj+I9CLqIRtaO75
         gDQNAUJeq1WH/qUFELUdbSr+VtitFBXPOemRWIayRAkjNMqmHdUz50mdqxpdrzb7qYpK
         gI+iLOGoz+A+Wef4VjfFdqcEbgrjyD5D2svIzhOFJfRYhkNHCj9at31geztNtsypLwb8
         YZ69pK/g88DMsAYN6nbX68nsW+ZcrLmJ02U0SLiQYljswZWWTakgoNCmHpIhoqwyxz6/
         tD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714150117; x=1714754917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmMXkGy7VPsvwtkKsXV/wpxBJRPdn7aku2j+I7TeRZI=;
        b=sQFEc7bvL4GnIo+TuiuQK5szxhL9C5jm0zVXQJt148i7JXGcpnSYOeoO9/iYT3BG+2
         Ha4Xfvz5aRlaOiipP3Uvo3P8LE/9KBhc4xjBr182prweq1j70YMng2wSNmD+rRCZJbe4
         tQYKpl9a1rqBk6bUrd+ZML9saUN058sMKS651acjAJ4LqipOUslDFGRPTxdcMn1lqamZ
         HG/zhvOsB8tNKxkeXwpKiqRlfkbzyIhxzteC5wLpRupN8J12shlKYiiqYOmbMmYZHOiu
         Vz57G6XxVvNO4yTDAesTgNjBpZX7o7wl0QhAG7sfSx8LNJkYzWVClaDq2ZG8Ab0izkdD
         Effw==
X-Forwarded-Encrypted: i=1; AJvYcCVnRa4Zdt8w/exTfUcXx9JIipd79g2CkeWnyzzpB91lJ075fNhjEXWvqxCuv6/UBN+fLXU6Zw4JmT+PjEOg8B4w8SSK16BrnuxhUZmhYALrvLcfhXbe4idD5Wb6AtzQE4M2vmWk3UY1N48=
X-Gm-Message-State: AOJu0YzmuvUiBKDGszklP8M4QqbAbAzt1TkxmYu4elz64vOmp7UjzFVL
	19y5yoHO7sCuElzbIcN8Ey293FLRj36Z8v3XOacMLsphslGVDyis/COAZs889S8/9KSISw77lYU
	b65RZo48gYEe1exCXW2NtEn4YLOeJveZ3
X-Google-Smtp-Source: AGHT+IGUzYot4aWxYmJQmmtJTaU0cDPgRlNF43MSJ+xR+zOvk17sLDT893O9A18W2SmanyZEbP3mYQ0mJ7tS2z0ZCN8=
X-Received: by 2002:a17:90a:34c2:b0:2ab:9819:64bc with SMTP id
 m2-20020a17090a34c200b002ab981964bcmr3011377pjf.32.1714150116642; Fri, 26 Apr
 2024 09:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
In-Reply-To: <87zftgnsun.fsf@meer.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 18:47:30 +0200
Message-ID: <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 3:42=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> I guess I don't see any reason why the translation couldn't go through
> docs-next as usual?  It will all even out during the merge window,
> right?  Or am I missing something?

Yeah, that is what I am thinking as well, although Yanteng is
mentioning conflicts somewhere, so I may be missing something too.

Cheers,
Miguel
