Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E3192B75
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734195271; cv=none; b=VMqzgfB5FC4OwUHSEmIw8C0SvcSoEGRmTmhLgisPuZXcmxjR9TDkAyvUcDYBDIXXS4DPwhO+G8nzJ+YPhFE4FpPv9Qj1vmoqbzJl9Nf8caA5cNfY719ca3T4TJ0qeoUrh39i6MqoNap85KsZAxyNIEYttu3DURI0I6ii5xsg8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734195271; c=relaxed/simple;
	bh=PgibwtyBOqL+PRLjUN9sePmURkpYK7LM47le0yK1D4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfdHPjq4Qnq42ZgQI7/J76cZaQB4we/6+48Bunj0ssXNPDC1k8JgxnbTvu6HYKFUntzq1I55GeTsT1JilTWLfHp/Agu9kWt6lsXbzOs3ZxiTY5DLOIwMoNaOU5ywBO9CRnCvwcJLyjiVLZT74KQ1KDNO3mr39dQBf6tzVrEuUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q8Slv0cm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q8Slv0cm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso3552202a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734195268; x=1734800068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3BPgW74v84EgngZMaqM6VO7t79ywSu3q8xW0bx365E=;
        b=Q8Slv0cmz4h+OuN0j4PXKHzwvFxvfF5iDwxXu5N5QMQzdYGPC5QBdKX0IOisxjjG7v
         wSGqlh5UMg56RvbGZvm/Q5FAFXqybIdxYhegfhhV5kq0DymLLF+Am723dbGp6+QeYGV2
         laaPzpIzb/2GYj4wYwnrNIl1zr2CeZa08O4mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734195268; x=1734800068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3BPgW74v84EgngZMaqM6VO7t79ywSu3q8xW0bx365E=;
        b=LZ0Cuwp2ZEVAZ4S6StL3eQkzKf7gVvMyHwX50q6bDYvE7GGkuk7Kr0nbShHrRNd5AY
         Jl+0JaX6FIezwCaC/+U3GfGi1g71HUXXg9aAqmcjXjn9wrcMVTiueB9G0gBdjpaYaISE
         c+qNKvdTqEVQBVncijHCur/gsxFHlaWXwyHK8xqGOwYycrjoB2+E1pYDhtuiTH7T5Z/1
         IciSSwI5ej4X1f9xIaPYCkj+C7aNQgz08DEMcXqhwzVdnfTDpUY1DOYdRU0jzCvUg+Hq
         efox9t47Q41724qwHNPMtanED1xLnOowXBG1Afdv6ENL/XTWQRZ4lnXe3Qmm7ffiACRd
         qLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC34X9srTqv+lvCKy6+b8zHU4vh9LssXg6xqNsuag/0tV4SBtUMyR9y0l73v3PbWXUPSVqWhWIy6aAN8Ajnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9uw8+3DaOpEp4hnHPs60dIcimXlz0vl8a0+9fkoU4DHBr6J+
	7q1LbcKeLVuf3hheotvS0OLdROyjzMDGQyD+jhdw8c3c7rUOKT3INYfzn8L/mdHB87h9iDnR+LR
	RMPU=
X-Gm-Gg: ASbGncvv1fCAIOJDP0VgsEglLgVaoVotdsjqS93U4LslNvmHtgMPAetykxfF6Q3BfFb
	71KgJtqif/mTihWQfmp2OU+qXHyrMXurNiCQJSqjsFKoTGnDFHQg2LOlgIrMVJIdQ1RsEgh/TJR
	K0QdoqlNQsIekkNh0w/NrNpxyAa23PHknyJeRSnfIdEfVX1VApid05h1Qgq59VYnDZ9KjNCFGg2
	a7jR2okuZI9J53Q7jgDc9juJvewqdoAIZ2LUon3GV330SjANSmk47DDk70FGoEl9X4je5OnXDs5
	1S33WP3RqvCsbCTJ82rukDNO78xJlbc=
X-Google-Smtp-Source: AGHT+IHxN6vEskNjAn4jhvaHPVl/7gWbxc2xe0XZr0TndmyUkTdspgTECCa1LzD4e4DaFehFSCa0KA==
X-Received: by 2002:a17:907:6d11:b0:aa6:8781:9909 with SMTP id a640c23a62f3a-aab779b2144mr766042566b.29.1734195267847;
        Sat, 14 Dec 2024 08:54:27 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9635998csm113646566b.108.2024.12.14.08.54.26
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 08:54:27 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa67ac42819so452447766b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Dec 2024 08:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfip0S0AhA5AqPIqZjue8taI+fzZkflhSl2fqJYN3xa1G+BGj09PwAOzNJ1Mn8MGAuPO24vo3x3YPWwa40Zg==@vger.kernel.org
X-Received: by 2002:a17:907:9557:b0:aa6:6276:fe5a with SMTP id
 a640c23a62f3a-aab77ea5907mr622880666b.43.1734195266679; Sat, 14 Dec 2024
 08:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214065217.195385-1-ojeda@kernel.org>
In-Reply-To: <20241214065217.195385-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Dec 2024 08:54:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgXdJswe7JWZ2G6m11rL4Yxatrz_iFBKpqCO5xHPwMyJA@mail.gmail.com>
Message-ID: <CAHk-=wgXdJswe7JWZ2G6m11rL4Yxatrz_iFBKpqCO5xHPwMyJA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 6.13
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 22:52, Miguel Ojeda <ojeda@kernel.org> wrote:
>
>   https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.13

Hmm. Is it just me, or has github become almost unusably slow lately?

It might be time for you to mosey on over to git.kernel.org, and use
github as a backup rather than as the primary repo?

But I'll see if I can reach out to any github people and see if it's just me.

          Linus
