Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D21DE4FE
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131136; cv=none; b=djPkkvHV77sVnjeHru1QIKJpXyCxWTeHk2gPonISiSAHBvaXl6dSODvxIg6e7g99A1JtLGsAFdgZJqx5MqsfSQZJBFBqM3wydiffpQ9Pbim+cj5CBhjxRF1Ttt0JkQdwEfYxkJwe5Hb8jdhIygcqGyBNjY4YCijMLxsuX5RsneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131136; c=relaxed/simple;
	bh=J9anDrBxh2WJciRGDRJXkaOSyYQe/FgF0E/ywdzpjaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=reAuTiX2Ik4twrjEseUgmjvQJD3vdMz7vTGqzmm32Pu/l+N7Zaz83oufZYfzRuxjWCk3AoyQxhtpY7pm68fLBomq6s2g6Yyn0Ol3FRLixqdVxC1M4y9FGxG/e6fKTqVFahHmTSdA055I/4pDfmY3MNxUF0UibnKzOsnV7UuimuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNBnPHts; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNBnPHts"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea6f99e6eeso287846a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730131133; x=1730735933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9anDrBxh2WJciRGDRJXkaOSyYQe/FgF0E/ywdzpjaA=;
        b=cNBnPHtsaeZwK7nOeifOcV+gbi5znfvaI3AnqwxrPEVkkPydQm4CzqO7s/dPJfd0WY
         Tm4rImn2RK0R+QNECFwkNJbk8x/0xEiqWXwfkDj24fSfaWsCCOhcOrRW5oHp8gNor4hy
         Z9xnF8AjIt5kxCL+LnxSyRafvANpbq2zkOv3Na6nBwvRDoOpvzih0kriyaCWa6xjq5fI
         OoNVO0TzgLR6cgfWBCpd/Sh4UGp2qAVMrqtt4eeL7xe77aH2Ud05zzY6r3RvBKYr71B+
         C2CmlrgJVGKGltU4dtq0d3u4ntiLE7RneZF+E8TcYbSsvUESxi5+f4RCN7mSuXiE/brO
         mTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730131133; x=1730735933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9anDrBxh2WJciRGDRJXkaOSyYQe/FgF0E/ywdzpjaA=;
        b=MQWZmKrylbxTyr2bAPEHSctEgE470X9an8jYzWd3vbSWzLEDM4ZiWNuHzh3Xtwsis4
         ifjrDs+pgHh8JdgMBqo249+OQXAIDpm2l2e4M5yKdsEzVa5YOmjEC5J+9FtAFV/ec5HE
         l+oxP2uHfxj57Lqb5MXKWCNl6c+OyqitxEMjcNT5bjADaM1wpPp26cDfvaNWchBMgwEj
         L5zhM8ImlDiU70+km93Cx6igGA9SZE9xd19rdLHMmgRgFWwYkybK2Eact1AuCI0mmhGF
         3CCKa+Y8CXgwa+rXewdf1CI6x120M7wr8OI6cjhbj8XMWv5uDV1uqB9Y9Q22U5Z2+5zT
         z+3g==
X-Forwarded-Encrypted: i=1; AJvYcCUoTRiUJiMn853g/us0uQKvcGS1MUnnWSQ+7LcQBVZMAXfyFA3/jb3ABfJkWEeqiFxjATeM7D4trPi0g6P6LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDO8WZTrF0Q7LeU0S2XV5HLxhaedoGCk4vryo9/1UmMXbDXjw
	IXUuStUsyGHgKL7oj2gzcouP0wvjADMjjisQjpEMG8tJ9IVPMoi943ES19fMBPw6rZnKHSDfblV
	qarEXxMMx5N/Aqlox+XM2hiC7nShIkFs2yeY=
X-Google-Smtp-Source: AGHT+IFzI/yDTrlbzw0o4aoR8kmqaGPikY2NCw4LoMu2fn+R8IF6DgvbVHOB/BqqJUh4eQrO9XpTc3m2CM/aq2n+YM8=
X-Received: by 2002:a17:902:e549:b0:20c:92ce:35b3 with SMTP id
 d9443c01a7336-210c68a1aa4mr45917865ad.2.1730131133560; Mon, 28 Oct 2024
 08:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
In-Reply-To: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Oct 2024 16:58:39 +0100
Message-ID: <CANiq72nQz0nq8sZ0kKfwihRKEF+X3ADUxOmYoZVckbgSR+xK+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 3:58=E2=80=AFPM JCKeep <2407018371@qq.com> wrote:
>
> Signed-off-by: JCKeep <2407018371@qq.com>

Thanks for the patch!

Is "JCKeep" a "known identity" (please see [1])?

[1] https://docs.kernel.org/process/submitting-patches.html#sign-your-work-=
the-developer-s-certificate-of-origin

Cheers,
Miguel
