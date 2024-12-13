Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477FB640
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094211; cv=none; b=d+APvxxAv2kygEwDbGTXAU/rZ/e5T1nwAmyPduBrmOUOSKAzjO2bByXLkTgEXC6jJmzoOxQ9gb01UgykXdAXvZmlk8DlU3X8/tHuJ6kuFsiEmKI76Pd/f36/aQZrG4sH+anu/5DYwxoTD2id/fjuO8t7FOPbwIBY2yT/01ISToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094211; c=relaxed/simple;
	bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTnH7ObKNa7K1lw1lxH1c8y9+q0fu6EczCp7L9MuT7sEkOC08g8uYPDOdJ2lRmCMvEyJ8iXREOqn9tJwtcrZgwLLd6Y39NievGW+OyHToFdyT4QinsHbpjop7FPu/WzgPlbegkZjteYYP7Si9T8r66uIJUgMYylH6uj4sI7vjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qiNEn3Qh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qiNEn3Qh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1097621f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734094208; x=1734699008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
        b=qiNEn3QhLiGGvjAIHhKeDgnHAOD3NHqwCwbPPcCb7Mxn8sH9Pkm3ey73LvaXxUN3O4
         AEyh09OpMp1k07cGrAI5PJK3clmNjF6wzi6r87xhTRKDIB10AswRiE6XRFjJYQYwrihC
         OKnLkYyUyBJ1coY8UyVwmJO8a0IPL6JxL61MIBmK5tQ/za4+tV7SrkZUAr/f1eEJ6kPb
         wokxH6tfHnjtyynwEeM0I1gyq5vQIvyuyfiy7o/yJP1nYwMlMhEkJLOfkZ/u5X32Nvc7
         AY1je6Z19DzjxH3gNIE2yRWbWmv/z9RkqRTk0THHS7KjAXaMD8p+YoFjTIvACAuashBK
         HxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094208; x=1734699008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
        b=tvQe5y9UaBk0D9/jUt8A5B+HwVgUynEcDiZXoVcaej/P5PTjbRuWEL8ooNP9B6XON4
         8asEU4kVdY1PJgfxJXWyseIE0nBV/q5d3SbCEowx30B+gkgfXTVzKwHnH9+gZEwU4FGD
         NZfcwt+I+FhV9wXeH2B/ETXZdyUWGnlFlAZWrlbqCQ0iajjBcJ/I9221VXRB9XyoQPUN
         h/TmQXIHOFKd7di1Lsf35is+J+UWmMtEYjt46nLbuSBqIJmSTJihH07Oi/L6+8/vp5Hf
         05PI4QGiCgnBz3QXH+XA5PoXPoLFEc1w2PTScuYjZ4WmT8ziCCM6izoA8dU07PsIQ/4b
         ehgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfGVHbkbXm8zO4Nz+JcrLFIN5sjNRa2jbGFJzH6YSSxlggRgmlf5VYTg3zfwjb/lkGXhp6LFTPCOzeObGY+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkmv4i2A0yFq/HL/YewIG2bRwDOSRBkJbpCU8KQg1RiyrQqrb
	KTrJHXsHbUZ+EsH+wdViMrox+bhjj9lCM1MERzWqXy2Z8w04Risz6CnRGcTv0/iyYRI2Ac5ijrc
	jBkeYUtF6DbORuIt9IVHxyDV72sk0psuyim4F
X-Gm-Gg: ASbGncuuV7VGSplnknSPVLHoTxeHCYOfz0qituEm+4WtYrgFJjcFqr9IvqGZ9rnPiFZ
	6sWey1rdYULc1o1quCW/6dpMvZdqEpm/DdqZjL5w=
X-Google-Smtp-Source: AGHT+IFJwfW3yssZ7+jsglJf5d+5FmvssL5C/KzY0tcQAh75c2NrYq9vh2lXeL/kRzsw+F2F/hFZXHTrxvm3QYHIi+4=
X-Received: by 2002:a05:6000:1fa5:b0:386:45e9:fc8a with SMTP id
 ffacd0b85a97d-38880ac21c4mr1917804f8f.5.1734094208479; Fri, 13 Dec 2024
 04:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org> <20241213-module-params-v3-v3-1-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-1-485a015ac2cf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 13:49:56 +0100
Message-ID: <CAH5fLghA6qHsSrC1YL9M=e-YHBa69xr7dp+_9nNR65C27ssO0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: str: implement `PartialEq` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 12:33=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Implement `PartialEq` for `BStr` by comparing underlying byte slices.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
