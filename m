Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FD12F5A9
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708098594; cv=none; b=WsnCHo9LVlBJaHKzd5ZXPSRfPg4tnPVLsVH2B9km1+G0SBiQA8acgbII7/WvcBb6zL1bGqgK9ZNHXCCwQR+GTG2z7Xq/nxgxE/q3SrmiB/4ZI+YlheEjMD13EnF/HFkFl4nAHiiMyEqgwct0fag4wLYPvDwSTZORnWmNAJzX/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708098594; c=relaxed/simple;
	bh=6p7cJfgCAEYYTU2u1OdYN0EtrCgTQ1erqggD+neD8eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhjPG8kDEYL4j6hTOsfLIAasNagCagZ99Vj/4uJiFQyrvp1YJBUtXiReEyCfSwB3qKaAlSJy09cBdF+SX3ChmEa1d1Jp18GMPjeTXfrQcjxWQ7I3l4OUPKCf7GHufsHHzA4JckziWWU4QJE/zlCNfPydNqU3KYkoesqMb7mxuWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWRM/ymY; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWRM/ymY"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607a84acf6aso7845347b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708098590; x=1708703390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p7cJfgCAEYYTU2u1OdYN0EtrCgTQ1erqggD+neD8eI=;
        b=WWRM/ymYVpOGleSIsBnOi/luhyODD/yWHXnbK4ezwlait8jso7/Dw9e0V1MB2P4yhg
         Jk+O6wgysVioX2XagIdRIMz2Ye+jr1gTSvrx7ucGzqaQgr19KTSqScBVzQNQFkrlLb7p
         k0Pkaxk/PAiyuFXY7KDb5ibkwJVNhIARO8LE47Cn5g58HcEjshJHaECc98q2qMDXw4tZ
         SeoGKdqXsw9dgmUGSlTRjZNzmbkfyF470qa4YjS+J7jTkZ9iNn9+sdGeoka4vkYUFW16
         wDQGVzAgelq6mWBx6MaQvfIngQJNwVisCnK/nLN7pHMItHGhZZIq67cvqzB9GMYgwOPw
         WWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708098590; x=1708703390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p7cJfgCAEYYTU2u1OdYN0EtrCgTQ1erqggD+neD8eI=;
        b=CeR878DtiRgXoOOjiZ617+I3snBWct13XSsE1Yck/wnCEXsWNgtPQlo1mzUR7zO6fz
         CiUv6IqT+2wdW88wkc77Xf6XwCQ4uLELuv7pDBmDcM6LXkQnnbZ+fkksD5ey/S2W8V07
         IV9tEOc8zuu9Hi1ShUA+EjYDhwrrk+rXFIWKfYNJLcnus6/wAsprdrLs52RD4Np+uNyp
         X4pwc4u5OtxfoLb25Wim22633Hc8X9fWT0fksjSl4zcfUfAbp4lTMQ6tQDQLRUXWst4D
         NZPrOvYiwr7AM/CVMyTFd6Ue3tMxMap+9RPKGep3pUtr83x5OwkBr856oGyz/Mldl0Ed
         poYg==
X-Gm-Message-State: AOJu0Yy4y0bswFp87KbfEjiq0P2n1VRzOy4VPPOx2Ym0Hk/XUDXaM0Lc
	UNCu0eLhaZO5gUK+4MUR5CifeknMju13frCItOwAozjdllgl8hqR9QncQygTJhzks5zJv0TFQi1
	3B0o2vbmgdpeNXFg5hISXUnh/dow5nYxVNnHdEw==
X-Google-Smtp-Source: AGHT+IG4f8/C0whQ5JA87B9NP59E/2ZLlChizaxxf7Z5Uh8Jf3Jnh/TjQNEYVsHdvRZGf1jsVxZGOtl3V60hUykk7ZQ=
X-Received: by 2002:a25:7457:0:b0:dc6:bcd5:9503 with SMTP id
 p84-20020a257457000000b00dc6bcd59503mr4763012ybc.48.1708098590546; Fri, 16
 Feb 2024 07:49:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Feb 2024 16:49:39 +0100
Message-ID: <CANiq72=6oea6zNvC3LUGN98tSdPwGFEeO78N_-p2hkUEuuvKqA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: Order headers alphabetically
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Roy Matero <materoy@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 4:27=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> As the comment on top of the file suggests, sort the headers
> alphabetically.

This is https://github.com/Rust-for-Linux/linux/issues/1002 and there
was https://lore.kernel.org/rust-for-linux/20230426224748.34056-1-materoy@p=
roton.me/
(Cc'ing Roy).

But since the v2 never arrived, I guess we will just go with this one.

Thanks!

Cheers,
Miguel
