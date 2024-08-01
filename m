Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04C91A57D4
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524138; cv=none; b=Zlg0xe1SUhyDLxOQcnKhnIG38XNOULJU4sTz/N4x/YXRjlqwe2dIiioHl/yEk+wBpHswDXmQG4ct3mCzZv1PJO0h51h8064HaHWIRgKRSp7Wle/ACo55EZzp+4ad95QLmzCrZU2SXllJgx2S14CnlRxLJv/pdAI4NeKSr7S+CBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524138; c=relaxed/simple;
	bh=xUiRVXdqJnJHGQsTlKVIdXPw660El0a1032LEw6t+N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=un29ZO3g53ArhuiciskdBxJlb9feJQ4S/166VlwqcnL+8cpFZhaLV7hRZ5R1Y6uQwS4ctOGkhu6nRSnKw/bhLjbiejshVwWzMCMsl0mY+Os7sadkArZp/e9tQA0LfbwTF9SNSVCFNVO2pvrZCqhvBdJb5SlzlDJ49SuqkwaOTVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wno8p+Qu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wno8p+Qu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3686b554cfcso3586181f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722524135; x=1723128935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUiRVXdqJnJHGQsTlKVIdXPw660El0a1032LEw6t+N0=;
        b=Wno8p+Qu6W/dwvjXSVloozpgHuNo9b/FA88WKDDMFtpZ4i3RtnH/U1NHFHbMR0oIHo
         plyoartlKOEQ9gS3bRr8TVC4pzs0UryVJLj5RKFziLqcSSLMLu0VHz/LeII3Xhs9L9Ro
         xBNzBKvprnUjzJ3VovcOIuN0534qncVZVdXqEgRN6agMbLxUH9eeNCFxbE9jZpQO/gO2
         4PTviqCNX8jDqkwgpGf11FdYj5aw2tXGCmPO1nFo+EeDAftodHGb5yap9/J7FB5aRXur
         5LUrap+ESVN0yD2zlTXaJ/1In3MLuMV8IfUbZ5C2MIxGtSi41dc+qdIs0v7x24NN89qK
         EEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524135; x=1723128935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUiRVXdqJnJHGQsTlKVIdXPw660El0a1032LEw6t+N0=;
        b=NPwj3XDjAPTTGMaydTs1CbnLWSR7r+TzCYBEoqqEHOtxRLAbUApCpnLNSiCQIG0r5H
         sGxFMdPkIbHEoCKYd2QW3S7o2UGVMzWuUSfY0mPfn+7UGjkvgKiyH/78Sx5zxqPMHQVj
         w3fx02TXaY/TG0Bb0hH5p2JDwfxK5iOe8lASal5LCk8Kc5ESDb/B3QYcqGv5ym2ShcCH
         9oiFg9nToYUmalOzgV/WaIsm72yxoi53czGGSws3qE2oJCcuB5y75CFFvo05hUlFe4w2
         pRclGvIGxCW/y6+dCQF4pe52cWaTUS71fVo0OYeTfs51YadJDEMOTxvtjsZlMKeL7p3w
         HVqw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGoeBatmTxVRS4WWlHCpQAOx4+H40cFofX0WJZs0JAQ+YtrIkKOThwldrQVxkjz9Je7vL2Qd6GO5O6TgsT+/1xOfcRTOhgUGJdQqyhwE=
X-Gm-Message-State: AOJu0YxCP+qKAjX9waUlulMK0u2uoFdaSf6w00aTCQ2KWKpQL0HsZKEk
	4albvVpJgqBfQH1UJwOyP0hLFzGbhmOGni1hSzKuPG2D12s88TCB2X+dE0YxDbmDUDhADjqKoV7
	WAB+GnXtpsqo0o6pxPwAyUCZi8lkbo0YEIi+Z
X-Google-Smtp-Source: AGHT+IE+a8lfGWpFJwmXLx8kiiDn2dCpGA0/L2Yd6wxto7PZKwihGMM8kJ87GNXQ8hR3TN8GXU0NYbGKBQXQ/hAe3n0=
X-Received: by 2002:a5d:6112:0:b0:368:5a32:f5bc with SMTP id
 ffacd0b85a97d-36bbc1b6f58mr52879f8f.38.1722524134871; Thu, 01 Aug 2024
 07:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-15-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-15-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:55:22 +0200
Message-ID: <CAH5fLggXrRyUEf0aQL9qtjHbOQjKsq+9XDMHVr_vx+TgAZM4wg@mail.gmail.com>
Subject: Re: [PATCH v3 14/25] rust: alloc: import kernel `Box` type in init.rs
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:08=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we removed `BoxExt` and the corresponding includes in
> init.rs, add the new kernel `Box` type instead.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
