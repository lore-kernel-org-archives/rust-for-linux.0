Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1FA3EA76
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727585853; cv=none; b=fBPjJyp1t8v0hV6iTE9sm8MLV017C9xLg7MAz1g7hF4bTPUP98pl6MW0jy9AS4LWkH/dVG+/x4Jksd3IGSIDhPG0bszrsko1L5XY5mfN8hC4ceZBy2nBbVS+moLTTZwqQ++32sic3yOuezMUeAGoBBtq5qkloW7CYiWdwkgEZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727585853; c=relaxed/simple;
	bh=8JAXnDgwC0E96DmvB7UMxZsYbUOAqQTVFvH/v4Cfgew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9oL3PyEkA+yRzFxs0sX942S6ZdBbXkEPHq2EruMWEDIwEvrCPBRj+CW/WGRe2qIti9Veyh2KxQ78YtbNCuwqQjSZKAJYx1qdan2EdPQShA8vOEzK/8zERLwYKWT2o8Awmtz0CADn0OEQT40QAv0AP6uyEcLo383GdUyf7mrYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Gx+vr5EN; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Gx+vr5EN"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dfff346a83so27507167b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727585850; x=1728190650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JAXnDgwC0E96DmvB7UMxZsYbUOAqQTVFvH/v4Cfgew=;
        b=Gx+vr5ENXz2emDavv6lAJy7zE3503VhNh0ai5NNt5qehbsYutnQAs8TG5P5x8z732g
         5Z5SVxz7KTK47tblddBtFwevMEc2gkRTwLnrF0KQVCAG5Nf17PmsAzlQrKEWmZmq59LA
         PV7XRwUK5CeYwrLorE8o7MCLDBUdTUmLCOXJUeR17JjvVg+Pl4ggIzb8PDGmRZCYBIz3
         0HqoGo32EsT/iLCaxHcRyQA28U4hpe1NpFdQgIZyYix3I+D7jEk+aegmbjfplceAr87P
         iQSTeQEqUYYKa0rnhEeIKkyzv5hbDsGvK4Gcg73g543fivFsoj0p1sbGmr2aKq28YsCr
         xxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727585850; x=1728190650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JAXnDgwC0E96DmvB7UMxZsYbUOAqQTVFvH/v4Cfgew=;
        b=E5uGSyuN24NBlu8SgLb6q6168RKgaWGCFT9R0WqN3EsByhEC9VPzWc+PSwoF/dB9pX
         pQCHjz68Z6hqC06Ew8NmxDLB2MMiiMfi+FIBAdg2cdIDzIuv5FH9ER7e0jmR4UlJyZEe
         BhiKqQHjYQak/3Xf74HuccJOEmxkjbew3TJ8rX/dPolEY4006RZExNJxUDs9cZMaCcP9
         fisxZZkFuqWi62Y3FHO0h9BQ/Hb+LikmN1Tj+Ct8PksWdMSb+zwp45SErIezKYJtIsKX
         3YbNUVFmWKmO8ZuFXHRDXu8DBPNMJJHYG3v2g0RkdqrwD/sAa1xy+TL4IaAMiXvlLcV0
         XqmA==
X-Forwarded-Encrypted: i=1; AJvYcCW1VqNUZeZyzKkizMORoR7tqFEOmriux3JLlm7xXMBXxJiaae3GsfGw150Buc35oEEmzg0rofdmWMVK0iJ/tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQG3rjukI7deZ/gyGt4ZhzXwM1MdGasWksZILZo9qw2mnyLdw
	NwzVEW+eM9uLq2Gd1WAjkFCG3eKShu3jj6PYalibb9VUTGoAdtN+nO2/hTRZqfkPT69Cccti9WK
	3KFX4JhORmLg4WZsfWsX3II+s466oJWAbKos0ww==
X-Google-Smtp-Source: AGHT+IE++v8Td22nI2Q3soyTzNnP0Aq5WWr6h1etnmJLmPLRDEcrld8EaVYYkChWaSBJSUid1U0hDsRreiPYOsW/qIg=
X-Received: by 2002:a05:690c:6788:b0:6d6:7c9a:bf58 with SMTP id
 00721157ae682-6e2475e6741mr63957807b3.28.1727585850530; Sat, 28 Sep 2024
 21:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-16-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-16-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:57:19 -0400
Message-ID: <CALNs47uSN723+vO9d+sTry7XRDZf1BS_pyA1iu57Yk4M0rtk0w@mail.gmail.com>
Subject: Re: [PATCH 15/19] rust: enable Clippy's `check-private-items`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In Rust 1.76.0, Clippy added the `check-private-items` lint configuration
> option. When turned on (the default is off), it makes several lints
> check private items as well.
>
> In our case, it affects two lints we have enabled [1]:
> `missing_safety_doc` and `unnecessary_safety_doc`.
>
> It also seems to affect the new `too_long_first_doc_paragraph` lint [2],
> even though the documentation does not mention it.
>
> Thus allow the few instances remaining we currently hit and enable
> the lint.
>
> Link: https://doc.rust-lang.org/nightly/clippy/lint_configuration.html#ch=
eck-private-items [1]
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/too_long=
_first_doc_paragraph [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
