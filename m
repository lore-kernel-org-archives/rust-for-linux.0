Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCCD2E8B97
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760900377; cv=none; b=QFVXWjnWNHnM3oRgGrpppsFcT7z3ZGIpr4LT4zHbOSJIM5yzOJ3VqoL72RK53g894WktLlMBpj2M1u7sAVYZKdFg1kez1BfdVGTQHsdNNJ4ZxeCtHYJiMT3q8dP2A2lS+WB6Hql4qbTdGjQ0iH4wFyqlr1QK3jnqtzQSPs1J/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760900377; c=relaxed/simple;
	bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGljpsfKEl+MDSxjVdec7V0dP4mcOkytbfYDpNPTrf1LKSz156GHlHH6b9wU1pWOtrSY+mm9egLXcZadcePyNxnoIQy2FN7y19Giq/wwMeRjOOC9AmB14HT9qXfAP8iqjNguWL1jQj9PkGcLb79UpSXj769sC7G7nbHCc/laG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff+dH/WY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff+dH/WY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269640c2d4bso6426735ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760900375; x=1761505175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
        b=Ff+dH/WYrF7SlOTBPXwcBru0i1f7ilZrA+ixLMb4+Go0yhP4lG5/0/cek+wndzCs3l
         gn10Ms4HRaNjJxvxDnHOXXRJSuCAHQ9wFaVvXYNv2l8IvFFoD1mRGUb8reQrhMGRqbQr
         2A9YI34DmaAUjsTviffyEcOguEMlkWK/9EBuKhFVMvYI1zivlDZ411v4Qmi1pMmLwoen
         8x1Lfldx15SCFxAU9W8rmZtA+JBzdns6VwTARMkvKaLkE/oGOHdsrCa++x/t7AH+4a/m
         IasM+KsCbVMSXQSi4DIn1CvaB2kLK7HFUM1QKslGAX6arGlz+mC8mhLy2atFhbC9TFn9
         bB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760900375; x=1761505175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
        b=Eymw8dEZ2qP314CNmUUf2nMMVliwLBGB7q1zrX8psmdgre/92YBnZKSr05mX2ILJ8m
         KvVEipyHbeo1Qx43DMO84xNLfGq7e4MWGpo/HVFQ+/2Lxp5+OumEN4jrloxEH85FqXjt
         nfgXr7lYARugUEWnqinmCObXPtauhJcCsyQM1kxlrtflYjNJ+KUPhASVtK0t99Mbgd9Y
         lbXOCYUhRXBQfnXXwToIUa7NVGgvx+vues0n87fB3Tw2PkcX+Md6d7pnRsiOfIvYlVpg
         JXa9/QDoHJ8ByMsLe6XAu0Bo3cvBYlHKAyWU1zdEDPdeGitbdMFRj+OQJ44vQZOOKvG9
         SkcA==
X-Forwarded-Encrypted: i=1; AJvYcCXwu1wvhp24pqRV5aHPPCmOEoCVdiEXEycj46EkkOiuRovMk9qZLbWI+8ZfMgRGmK5LcVA8d1mlDUKXgTnj2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCZ3fQ7aeHas2fQn2/TbliP76S3w+ZF/rJ8O3OYbiV5L6OY2a
	zFSGoFKj2wa5qs9q3+wPXUwkjCtQjHdjCPVq/UCg6XmNXG5B8fsmADkMBv+A1Ro+VEpPPmz10ZZ
	XAv6uoxl8asYiV6VwH/A3eZNc1JL6ybY=
X-Gm-Gg: ASbGncsk7tMC5iZF8I1HzTMADFC+FE5jX3WI/sg6N1kRGDjVnoYYE/VbAL/wATPRsBR
	HId1a7TB4DtmIQCwxH+Yp+1t4vLBsXlWI49XsjbDhuRGsdngo2972pePB8wpQVQxKEu7wwxv3Q1
	J/iRCJrpPAvLsvGegUmW9qnEzgTBlWuBfpt7XkyFxgsIm6rgqThpMHyxAqcNPJZ6mabTMRtXZDO
	TW/MnyVpzoetXtdMYhDPu8WdxKq9bERvUq9wTCoPSmJIr+TvVhU+pbU2A/4Rip3Ib0ET09neR3y
	dXZBhWCIwfTuvLYa9CRI1k7oX0DA/naP3gpnXbgRNdnzmRQjtPhd98Dgpkml6wlrVLT9a/Ho+gP
	m8iPgbPwhoaPZiA==
X-Google-Smtp-Source: AGHT+IFUNFNsgIHwngvFwlMG8aMEOLjZJdhe4E9fo3Ad+ao+mbyr4xKCUfGHRwuRI7LG09H3cfLrVwORSg5QxYsl3ks=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr69411885ad.11.1760900375198; Sun, 19 Oct 2025
 11:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016231350.1418501-1-ojeda@kernel.org> <2025101758-mystified-prideful-8016@gregkh>
In-Reply-To: <2025101758-mystified-prideful-8016@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 20:59:22 +0200
X-Gm-Features: AS18NWB0V0r9stVsy6SHvBBPktKhMWz1R1H5p861HWbvzNbwfaAR3voM0H57gac
Message-ID: <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix formatting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, linux-usb@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I don't rebase my public trees, so I'll queue this up after your changes
> land.

They landed in mainline, so Linus' tree is again `rustfmt`-clean.

Thanks!

Cheers,
Miguel
