Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0432C1580
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766914468; cv=none; b=UnK+EwZtLFCW0he2nEWm0RNcD2J/hIeUG5bLbQfyBYxSSUQL8oJB36NKWJYsvjx40U6nvz/OZtjxG+MdCPpiP0k8UWFJn2Wx9Iq9QHZmndWDm06MjS2HH4WGSC0LQbdmf0Ovxc1crfmK2NhZVb+xWJBgNryzromIEwzdWw7eMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766914468; c=relaxed/simple;
	bh=UpYP+NfbNYb/5cI12lLSJq/hh3cozmfvklcxEUHRuq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OUxkUF+krNUUY1c6dvvbggpbp81Zf/drqhR1bHFlKbq7UokLf20ZWl1MjNFIia+S88YDNm6FLPuNNWPZEGXG1h41YWz3QGtDQrDpC/5rkx+cq7qSQEl3QfjDB6r+jCiI/Wqd2KReY2iT8wAHrkVJmeZ4mHi1oRY0SwIfyfN3n9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FjBCnlS1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FjBCnlS1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so78655755e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 01:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766914464; x=1767519264; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SyDoBKLlFDm6X7YvWEPRli00m3Js5BcrRAsHwDYOeh8=;
        b=FjBCnlS1PgKawjtdPTXDLtxFTuKlgsv/tmtnob96hWi/5tdr2ibj2SE8Se3kWfvsP6
         KhEm/EppRKxNPk6Gl/ElVqply8umhXRGGKxGRuZJwpEq7EmmQu7YG6qF/jILsNtXmryz
         oAdQdZ1IGtNARAmU8YH8fQXlpW3IF1rNjUocAovkS3uQnGECvKTCMOdvqwrk3IIfUX6o
         WlyeAg7WB8i0pomP/ITz+DNRUMvp2Hvn+xvXGKAGVosCbNICdJBeObJcr8caeLDdLgRr
         PrA2EkFwMnPX6bAmroQWgg9gStHpn/jG9thCShrKOQ1y/Bvgq99wTlCEDpOJJJHrz0r6
         GAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766914464; x=1767519264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyDoBKLlFDm6X7YvWEPRli00m3Js5BcrRAsHwDYOeh8=;
        b=YDKzLdFhjrpafN5oQBmwf0tx2bE+kBpGIbI3oWEonxXk+Jv7APK4iXAjI9AvYiYwu1
         xSMdI14zz8I2DM3GDMTcpdzR66dkjUE7I43OND+IW2mMZ+q8mxSp/cNbAl8p8LmxnZAq
         yJ0o1nO2GNhF9x//n42OirJ2W8vFHsIkSuhguSvSo64+E9hBtgyCw+wJoj6crKKZ8HNj
         8epnkZFoDGWt4P5syiPaHOmxTrcvBsV8SbDbtdV9fsLALIeDV8rqwTahizperuUmCg89
         EHuEKfeFXlRV9iyRgVCmWc2Gt5f48bIaPKu2/X3np1SVr8wGi6kWgAc8sgygyjBfzcNH
         X5EA==
X-Forwarded-Encrypted: i=1; AJvYcCXImzbKvUbK73hLjxDVQ1nc52HtF10alm6H7RiiN4DSYDOveqmAGjAwneFrzti7c+gCj4yX7IZ4z4pbmqkSXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxur+V7BYGzTQLgTgSMo3pTE9/k70iqQyxeO3+Pt8FMTiH6XoLd
	WwY2vc3X4mxDuZodOkRsRYt0OZAfMREd1sSZSoMBdqZm5ovUQDKLAbx0se74DuawnWYd2M5/Stq
	vU35baTeL2cIuUOq2Sg==
X-Google-Smtp-Source: AGHT+IHo7pCHMAblDTgfHFeEja9soRj4lOWXPk5g3V/fIQz7xk3TJoKa3VyvAsLqN/oKHDmyKURQ3hBGHwEaI0o=
X-Received: from wrbgv17.prod.google.com ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4711:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47d195c1a71mr339326945e9.34.1766914464172;
 Sun, 28 Dec 2025 01:34:24 -0800 (PST)
Date: Sun, 28 Dec 2025 09:34:23 +0000
In-Reply-To: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
Message-ID: <aVD5n5taYlJuMGKM@google.com>
Subject: Re: [PATCH] rust: drm: Improve safety comment when using `Pin::into_inner_unchecked`
From: Alice Ryhl <aliceryhl@google.com>
To: ewan.chorynski@ik.me
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Thanks for the patch!

On Fri, Dec 26, 2025 at 06:22:36PM +0100, Ewan Chorynski via B4 Relay wrote:
> From: Ewan Chorynski <ewan.chorynski@ik.me>
> 
> The safety requirements for `Pin::into_inner_unchecked` state that the
> returned pointer must be treated as pinned until it is dropped. Such a
> guarantee is provided by the `ARef` type. This patch improve the safety
> comment to to better reflect this.

typo: This patch improves
typo: word "to" is duplicated twice

> ---
> Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>

The Signed-off-by needs to go above the --- line. Otherwise it's not
included in the commit message.

Alice
