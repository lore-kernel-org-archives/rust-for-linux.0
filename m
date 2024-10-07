Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F61D31A0;
	Mon,  7 Oct 2024 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334743; cv=none; b=I2W7r1mhX2qyuu3e9cvs8kiU1RS6ovgR7XbBb9Vl2gPRStkWgO9WLcv9IxgOMke8mrjcjFM2PSDc3M3QH7QoftSAokt4JIOgscTthL2Q9gqgGuvK8BxdRuNj906gc8vivdlmhBdDmXwO2+QSY8Bchrg2qTWxaldhaUKKKr8aT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334743; c=relaxed/simple;
	bh=aYpceaxphz5NFexoDZ6bB74LuCq7YN4zfI4G1PsZqmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttLfaEaWOU8qdAaKv1ni8jqqQBe+teNf8rKQW2j+9Z0KiSebzLAYNs2KqYgA/YTm26t0HuHxsHd+zC+nX7RqdWBrYnqEHO3Fmz3qMImLzyKUpLEnJ9YOYQ+Do05rv9p2kxPW02YTlQOShqETdVBzmZZNkFglO0bx1Ys1/9WFeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCoPbzws; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCoPbzws"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e9f8714b9bso325944a12.3;
        Mon, 07 Oct 2024 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728334742; x=1728939542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYpceaxphz5NFexoDZ6bB74LuCq7YN4zfI4G1PsZqmg=;
        b=lCoPbzwshUkn8P/yw5FSZhqM7OMsuyzlMpzDWy0JpAAsUEP275o1m5T8wX8uAfVf59
         VxSaVg+rBOLyWiI9UI6/FVtyOi95O59ou/Bp8EWHe69+9O1nI1ad4KYwcgaq/SYiU9J5
         eFnJRTMnPYCD2+GXA7hU7WNMkwEyu0w2kPlDBOncQrGaAFioRwxznQTLs8mTIOMczFhI
         SntOgEOVQICnn2cOofsxGh05nAaUOTTluz/OEL1kontpElM9xKkZJIQsiltgPkfprl92
         ejnXLuGWlv/JuOv8HMBmXd2B/CWOaHWcPasx5wGtTIq1uKHkSswWVCgg7wDR2V0FyBBd
         JhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334742; x=1728939542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYpceaxphz5NFexoDZ6bB74LuCq7YN4zfI4G1PsZqmg=;
        b=CHwMimD9EGtQfENe2QUNzB//8KWEAE4w7kMaosdkdfrSxTch4z318xLELf8UGMndFT
         yaPKdKACkhvlNtUmnE5hGCIJW1FaxEGXkR0qRCZ9eVqCENa8Fw+zaPeNVOnW5kZoR8ly
         EbCeW87c3PHWMuDPzdvgJ8j6LdCuXmcR/grTWLFgQhuTwRqtE//xKo5vRLz8f4tZYOcJ
         E38dhRTe3tN+d2lv9YNc1N8eRQgNRiPXaPI6wVL+Ar4QFQF0LQ5JcUy6GgISuSICFqcI
         mh9qwwGgjvJdARnBMnLVgddvhCfE4SevM6VId66zhbZF7JlS0ji93JXszfMzD4YGU/jp
         95MA==
X-Forwarded-Encrypted: i=1; AJvYcCXc0Dw9z9n6SP0tGfTDvhSdUyEq/cADq+aP0y/zaEhOxgfrZWP30HaCdY4eJK5ST4dRwJ1fxKx1GpXDDd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcSbJ1+VbLjfn89RSJoL/UnPeplJTrUPwV36LoaXJ2HXGVDTY
	NXSC7qAnLBtoF7qcmVwyeLWY70L87fzkzRFfcgw21elYPwUFtxNzco7Z5BGFQVGTbLr5qWc7x6y
	N8/IwUCcBI50rLMQc8Gsu9B+E2bU=
X-Google-Smtp-Source: AGHT+IHcr4N3CX0ky3qtXM1hUYXV/VlBfgdmC4Hf4wYP4LImzm3LgHjPyWikAuqKB7vdvU3h32fyljmNuqwUTylnLtQ=
X-Received: by 2002:a05:6a21:789b:b0:1cf:2be2:6524 with SMTP id
 adf61e73a8af0-1d6dfaea49bmr8358683637.10.1728334741912; Mon, 07 Oct 2024
 13:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007202752.3096472-1-abdiel.janulgue@gmail.com>
In-Reply-To: <20241007202752.3096472-1-abdiel.janulgue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 22:58:49 +0200
Message-ID: <CANiq72=XBTi7eGE31m4qTWivGbD-du0qgRGhb6ZUOH28p=K_0Q@mail.gmail.com>
Subject: Re: rust: page: Add support for vmalloc_to_page
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com, dakr@redhat.com, 
	linux-kernel@vger.kernel.org, lyude@redhat.com, airlied@redhat.com, 
	boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 10:28=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> base-commit: 673d1648244c3840043e09a784164b38c2e2efb9

Quick note: this is a `rust-next` commit, but this looks like it is
meant to be on top of Danilo's `Allocator` series -- e.g. we don't
have e.g. `VVec` there yet so it cannot build (but we will have that
soon).

By the way, cover letters normally go with [PATCH 0/...]. Since you
have the base commit, I guess you used `--cover-letter` but changed
the title maybe?

Thanks!

Cheers,
Miguel
