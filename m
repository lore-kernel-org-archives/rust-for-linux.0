Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0797192B75
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734195566; cv=none; b=SuPhDqk4yQQlMp14if36VeUoC5wWMEpaay7+Gxa+ngfoJcaBOdfTawN3QqSZpLc5imsF7n2vHN8v+XHdBp6YqndLUtQF0fxoPntNZQW6nZZdihCSaEgxpeIaIR2lwMS20iMN3IaCIQB3KRcdwv2Sha55XVMeMCvjaEePe5vBlh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734195566; c=relaxed/simple;
	bh=VpwhmVuFREzWXVXH8gnnNco4qEiGRJv9gM39JCdSzBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=on4sEEdx6EjHUucdjiV14ahDadpMWLMgbBJXELHgmYk2XY5YG+mBPXOyZ7nAFp6lYupQDy5VZmnVj9T3tsUd9fto/ej8QBJGU2wdu3d5jkhOorHdocVHoRS1cgd36tZYbw07oB6uayODAgB0AibgqxLiIHWmpDoAAK07o1707U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RmCaU2Tg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RmCaU2Tg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9ec267b879so443806266b.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734195563; x=1734800363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ6dwpHnhWlqcuUvdCT/LS27IX2tWCaBK6lJ5BI2H/E=;
        b=RmCaU2Tg5lZLvfiEvZqpFyXTBHzpbg3XGsu563/fhZbzlYVM4Kv71JI2uV1QineC9H
         e9iKRhf+T9iBdz0cgCd9hbZyk7ghfTDr3GPEMwtjnbLcmEIzUe1/79sg3c9ct81BGN1Q
         lE++Gbk334D0/Ap6AGJXK/kHqQJ0XzR2+0crA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734195563; x=1734800363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ6dwpHnhWlqcuUvdCT/LS27IX2tWCaBK6lJ5BI2H/E=;
        b=Xp+FwAcIV4xCK8wohwD/6amkfWNZk9oBJ0WDjKZbxqkJ2gEQSJYaQHyWwiG5KnBIvp
         oG7cqg9DcRKAkVbsNNnsGQJGgLtBzXlR2VgxkR7lPxKTYm+fyfxxKfWYrqLeHr05gpAH
         FBXIBx3miHOaTNFPQHvePTa/8a9qHDFfY5tDyArY5YYc3T4UrxGWJ2+HWeZrvckepeF+
         wDwouJGpN0S8FAEkQXsRwv7ya9IdxvHSAZcpbLWSe+Zh2qdKG4NKY7rxt/uhs/wR2Rwt
         BThzqAgZd0IR51aLodu2HrPpW/uK229/82WEq6tNJ/0iLth4a6iKZxLBsVKN3IPtskeY
         yuhA==
X-Forwarded-Encrypted: i=1; AJvYcCVZAi3mKgt5+VPTMz0oeCJ5bw6He5ax/S9l2H7rMHv0U2vU3Esibqw9CW9lG55MYHnprP5d88Lo7gHqZSNUNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EOyKZfJynoWaDUYn3+l9ne/yA8Y3dtCRJI2ZKVV5BVdLMPdZ
	F0niuisfb1PdYvt4bCnADgBJxiUYm2SL/dEeOhDqbvmbgwcqqnkWW+fbLvl6h6W1J1XNUL9MJ1k
	kxu4=
X-Gm-Gg: ASbGncvRSKvEffDz541PCFqyB1GNzxW4/avrfSn7HBjuhga60cMZDoZp0IafR0ni/c4
	7OqnodEMECDlBSzRrRcixgTueX9c8ykWowzfkSCO1LkZO9T6OeVczipDQw91ENTc8uqhKwLQQae
	kypaEnIE/M6vTcksBLdg9H941xTQtcysDFj8klxyl+eyMhWcUsOKvqc+T0VkKSL6pO5BE0/DdM5
	VCvRHK9tmNr0ypcmtnde6EONGF+Dkv+hFGrAxUYD12ijEa85WpYwhCnysP/qgsLDhmlh2o8Z9ej
	v3pg761B/ASGPTtDk6jpFNU1bJmbrOw=
X-Google-Smtp-Source: AGHT+IGzRZiPGEvpWYPxDnbxHJN5FRI+w7gvmWsAClV82gwg3G9fhqNDxKkLObeWrVSiYMw7shwOVg==
X-Received: by 2002:a17:907:6e87:b0:aa6:a966:da12 with SMTP id a640c23a62f3a-aab779b050fmr712800166b.29.1734195562888;
        Sat, 14 Dec 2024 08:59:22 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681a4sm113243366b.54.2024.12.14.08.59.22
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 08:59:22 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6a618981eso437125266b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 08:59:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWksUaYt8MyO0NauDZ+kDGNmSW8iJRcrxlqH+51VnkW14RwNOv5TuED5wP0nTWBqvgxhx7VZGXBY3Nn4ec5rw==@vger.kernel.org
X-Received: by 2002:a17:907:2d20:b0:aa6:b5d8:d5c4 with SMTP id
 a640c23a62f3a-aab77909d77mr776435366b.17.1734195561732; Sat, 14 Dec 2024
 08:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214065217.195385-1-ojeda@kernel.org> <CAHk-=wgXdJswe7JWZ2G6m11rL4Yxatrz_iFBKpqCO5xHPwMyJA@mail.gmail.com>
In-Reply-To: <CAHk-=wgXdJswe7JWZ2G6m11rL4Yxatrz_iFBKpqCO5xHPwMyJA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Dec 2024 08:59:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiHC9ATW72NVqM64kFjcO9BhMR+Hh1oLJrn0PZ7xcK3LA@mail.gmail.com>
Message-ID: <CAHk-=wiHC9ATW72NVqM64kFjcO9BhMR+Hh1oLJrn0PZ7xcK3LA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 6.13
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 08:54, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. Is it just me, or has github become almost unusably slow lately?

Just to clarify: it did end up working in the end. But even an empty
pull - when I retried the pull after merging - took two and a half
minutes.

                 Linus
