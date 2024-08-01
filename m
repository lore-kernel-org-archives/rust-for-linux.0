Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428E3D97F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505547; cv=none; b=pLzPqgogcV7NLQC8iEJJOXmhrDH5IzQ5fBxhuesQMtZlm6F+qpBewc700rTiNsC84iUbGEbUgZp2DAbB0agrGehWxFjQeInE56qdsOgS01RbtyWfnUNF4ojcWwAYwtNauUfEHvdC2RGzg2a6EPimy5WflkEhRC2xwt5JAN0HOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505547; c=relaxed/simple;
	bh=XpkAxp7okrXGe7fsOgq5G/ZKFTAHqaBYu2PoXBbFtBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg2mkZM1Gr0EM5F+TlUomN9wtBRKrB+XXuTjXY02uMNzwzurvhYTfoMl07Uk741ZRLoy5/SgtUoob3SD0WmGcWzO5feSM5GTsucba7kAFPEhUFqcz6+zyDtotAb5BDpg7jPAVGsdAoEvFDrUJ8aDJFfvF/G0sdgOmRr5dQONl28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ES70TpgB; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ES70TpgB"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so1460742a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722505543; x=1723110343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpkAxp7okrXGe7fsOgq5G/ZKFTAHqaBYu2PoXBbFtBI=;
        b=ES70TpgBHJ0vBN4M/5quHsvLcX8YyA3M1iVwQa/k7/Yssqm3/YQDf9aKJ443CLxmAV
         5kLzSESxs1fzois491XM+hijbUnUZK7KTjDeXU0sCzz661ezxKgK8CvvV+E/Ye0L7FRU
         q4PQ3oCcdvxyN/C0vHySAcybbd1hOPl2n6SkR4uNIz9Iwp7G8Yk/YvQQG+zJczg0g8jW
         UXMy51yZBI6JOv0auMKGEiLmEdu2wg9QgEXT2dmTBaqxFdScPsSdgmVfqHSvM4eqXTWb
         gmUB8mEWMAne6432EDS4fEV5CaWadtBDT+k3prMBhY9+j11VJKDqwmx6oIcO9R2WTpPA
         blEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505543; x=1723110343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpkAxp7okrXGe7fsOgq5G/ZKFTAHqaBYu2PoXBbFtBI=;
        b=d7inIl3rA8A1waJVh3E1uKZLEMvSu4dWzQS0YS0PZ7jIR64fsqACUDfaG5al5z1lPK
         5XZb3gfW8PvUFH6tvFfaBglsVygcD6ycS36Hjsz3LMYNmQ8Sew22ieeugGJ5Bo9FM0ar
         5V5msmJFcLh6fr53OAQfum7rKavNuIGDFR7e61VbgvqRb++reCWV+jGX8C9aFeajm9x3
         CRaZX+PEGqriE+k48MddDLQyeOZ2l6t9I8JJZFDX/tOJAfBJcY74IsQXcU67FQL0Wdhr
         HwvVj8siHXVRCyE0Wn0cuH9qtWZsSL5UOYNwlQl6hJ3hVznNo1J8jDvqwbC4T6mJ+Gd5
         ygew==
X-Forwarded-Encrypted: i=1; AJvYcCXTK7XLexvuWJaMkpPTFfkuJkTz5EOLjFlyTxu0FhpV8fw27eCX58x3kJyVRF7c8yxkX5TS9CRUSf5mBm38OgpEh05JsHktqRfW7UBEhA4=
X-Gm-Message-State: AOJu0Yw0mz7ORYjd3u7w1WacwMR478kHrkygpWuFLaI8ME3NkgB1Dbrj
	ZxUjzvFkZsikBjnhCUvO3NDordZp1t3P+utW9o1RVQ6ysMqMfU/XJv5bk3FkRqn64A2yPpmn+B0
	a20jjnLUvv7jbmOWWF9M4qM4IMrqi44XlrC4A
X-Google-Smtp-Source: AGHT+IHgNblA39iWI0MtC5wDRwbhiQn7rkgImIvStKgTFOsbnjctz/BVvpws989SGthdiKf/2ftETDgmCV1WPewANGk=
X-Received: by 2002:a17:90a:ba97:b0:2c2:c3f5:33c3 with SMTP id
 98e67ed59e1d1-2cff093a154mr1266464a91.6.1722505542973; Thu, 01 Aug 2024
 02:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731134346.10630-1-zehuixu@whu.edu.cn>
In-Reply-To: <20240731134346.10630-1-zehuixu@whu.edu.cn>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:45:29 +0200
Message-ID: <CAH5fLghrX91Ad2eYOR-d8i31vkKAWs8tj=noFMZrTSsDumcPyA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Kbuild: Skip -fmin-function-alignment in bindgen flags
To: Zehui Xu <zehuixu@whu.edu.cn>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 3:45=E2=80=AFPM Zehui Xu <zehuixu@whu.edu.cn> wrote=
:
>
> GCC 14 recently added -fmin-function-alignment option and the
> root Makefile uses it to replace -falign-functions when available.
> However, this flag can cause issues when passed to the Rust
> Makefile and affect the bindgen process. Bindgen relies on
> libclang to parse C code, and currently does not support the
> -fmin-function-alignment flag, leading to compilation failures
> when GCC 14 is used.
>
> This patch addresses the issue by adding -fmin-function-alignment
> to the bindgen_skip_c_flags in rust/Makefile. This prevents the
> flag from causing compilation issues.
>
> Link: https://lore.kernel.org/linux-kbuild/20240222133500.16991-1-petr.pa=
vlu@suse.com/
> Signed-off-by: Zehui Xu <zehuixu@whu.edu.cn>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
