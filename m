Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404227CF30
	for <rust-for-linux@vger.kernel.org>; Sun,  5 May 2024 22:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714948341; cv=none; b=sQE+USbiVj0xWm9ti1CXigthkm++OMdWVa0n+rPMW8Z1n7AVMruW40VG5/XIMsocPQ4T7sHz0651nmdGFA6xeaHFdF/yUZbZwjULrMkTj78kJ9kvhJLrvrVxvupfinM0N8yB+Il2CmQSJq3FEzZqJIMom7lPDRdTs8o0K2CIB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714948341; c=relaxed/simple;
	bh=UeWgnf4iWTccUZxdP3Y1+m77vbJ68L/FdqzZBXeSTb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7TVdxaNhl8LWkKUpjj3Q7HbFfXaLHoUFrSZ0jqCL+CE5TL5zHmdpzZjicl0y1FuUKadDdxxkiH6zF/MYoz05kAvGoWikHxB0o8Q4HQ4QDw13v9SvLmN6g+MAN0qVAjh3a9bvDw5983MyzBk8uRgnOa1VVtDL5kEs3ntOzt/sCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R54zWS1k; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R54zWS1k"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b3f5fcecc1so1071839a91.1;
        Sun, 05 May 2024 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714948339; x=1715553139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeWgnf4iWTccUZxdP3Y1+m77vbJ68L/FdqzZBXeSTb0=;
        b=R54zWS1kkLXGk4/s+wg4Os2U2B3GuAI+iuXluhgHDoJv7OO54IXtXeIPZ5bWFyqvs3
         E532b8cWiNJg2lHjMs7iAYnCrmUonvOI+SKoX/e4ngwFWzzi64G/dA9byBST2aldfmSK
         DQQHFcyFK0+PtOjoWObxvFC1kjucqu6gEokTFM06ZcV05e2i79HH4hjeaEEkHsP40TRQ
         bp1+6qabOadLMw2c8qjm8QdszAVCH0kp9Kn78T8DIWHmxcLtBiCMyBpSkmW7NM8RSPiz
         fXdX0WiD80CDJR1XvJnx484aWFEgaSk3Z9dVNeSr1QlqZrz5zy3QxguX+sIcomCVYYZf
         AXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714948339; x=1715553139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeWgnf4iWTccUZxdP3Y1+m77vbJ68L/FdqzZBXeSTb0=;
        b=mGwsSyKRS3AA1Xopyo/LTYIUh6G7hM3hTEulejYE1vnNcP9zJv7YOaDfz4xbdz7LAZ
         bI6a4NBgk0QyCSGFPUf9YuRbKT3BX2mwHC40CVjf8XGCCQQcDJayT4nbsVZpjixE3LTY
         frX90C/Cx+4exQydV8VTH2P72D+ggg53AQM+01EOQGZ8ywYXOzHC7eRMY3bFFeSwHkA7
         bYPzj4VwZ2bDRemrl1RnkE1F/uZ09Qv0apd0s9HbsHr7F7t+jIkENecoop25TxUInVw8
         rzJuapHipbyh52CthjgbwQLvTrI9QO64YI9GIDTk7cQN6aO3GkyRarGGhwy2+MwgJslm
         EG2g==
X-Forwarded-Encrypted: i=1; AJvYcCUFVtF8k2p8ZdYGAQMBZAkxYBaNxxkarXWaReDKG3m3VCW/Ehf4AEX2ZTM74n4H9hMO3sUnvWuWDpFbENzwOfvK4Gb2lYtl0kk5bF9lFpRZuYgJdsdZ6T0TvAbvHe0/LZjvocrqjdneLZaTVEY=
X-Gm-Message-State: AOJu0Yxn6hs/+ZzX7B/k8YrhvQpbLE7fjmSJStXyd4xX1TLj5ojW4m2b
	2wuXulC3brWspgUQVVEBrIbZNlDIkSZkkynx9QnbQB8NFREAc83bwiC9m3y8FAUXAqxLhkmt3Jd
	/oU5CiHWfMvDpoMLEEVLWnAuNoHg=
X-Google-Smtp-Source: AGHT+IGLRvcZliUKMQ3f6PIbkKoKNR8RwuaK747JyyzWxHVlXWqItQNIVIOL9fIBJu6ghYhqiDw9fuGd2pm0tY47unk=
X-Received: by 2002:a17:90a:d48f:b0:2af:53c6:5fb0 with SMTP id
 s15-20020a17090ad48f00b002af53c65fb0mr5986820pju.28.1714948339459; Sun, 05
 May 2024 15:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405153841.320459-1-laura.nao@collabora.com>
In-Reply-To: <20240405153841.320459-1-laura.nao@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 00:30:55 +0200
Message-ID: <CANiq72nP74Wh4Z+g+xp4PU4JqJq6ZPxGDYJKsKcjOFFZThO9Og@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add instructions for the Rust kselftest
To: Laura Nao <laura.nao@collabora.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org, kernel-linux@vger.kernel.org, 
	dirk.behme@de.bosch.com, kernel@valentinobst.de, kernel@collabora.com, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 5:39=E2=80=AFPM Laura Nao <laura.nao@collabora.com> =
wrote:
>
> Add section describing how to build and run the Rust kselftest.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Reviewed-by: Valentin Obst <kernel@valentinobst.de>

[ Formatted paths as inline code literals. - Miguel ]

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
