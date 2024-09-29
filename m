Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A722075
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727583536; cv=none; b=JMj1ebbeH1/gmRy1TknvbWIEZ+9O+NZq1FrYPSYzUYnU+ZcySOYvJRJO6WJoCrAtoWxznP+ZRlVLPcAdroID1iiSOUPqbeJabTjojisjfh9NKbJadAszaDcsqVt8T0QNU8RKbLIY1KfF6wIuTSVT6rWOURFmvne4uuixklDhGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727583536; c=relaxed/simple;
	bh=f3AYE4EAY7+DIMSg6zZBDw1KLgq1Bt3GxtTiTGtRrOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEK8HP7esqJYmBVjrARCCQ+qN9/AiP303f4Bi/sLwupEWnJd2XBS7fD9LYnpNlogeFiE8FL7MYgwr59Ir/xSixoC7q0pwyIcQYp6LY3n1cmMTMaIyk8z8iUdOEfx7ieYRUdRSG/gkJ8v4BtbqnmxuALuGpZD4RyQFHLk/rwdiK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=eCRCLb70; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="eCRCLb70"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ddceaaa9ddso29042337b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727583534; x=1728188334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3AYE4EAY7+DIMSg6zZBDw1KLgq1Bt3GxtTiTGtRrOY=;
        b=eCRCLb70z8OxrwSlA6eC1Gm+AskYkDNr1/x1StOZJ18fsC6GiINFtN3953P/+Zi6Wd
         2fr/3bo/gK8IlVXmNuXesWDoUb5WEbJuhkAiPBrwVeOXgrY5fpsgfYDUAHCKenodXa7R
         6YlVZiz66/LZ9KmGyE1byMhsI8xywZcy8eGfD1tt8nN2dKlveGJM4w5+V69bOqRr0/Tb
         e+eXNtasojd0AeLtc0YKbRgy8I0A6tnD8txJMkBqzBsLdLWhAcE229bk0UCfDa3VJC+P
         boeOXWxoM6LOpWhzAa2594TTzT9utzX4af1TlI8Z8cG/8t3jZ/M+f63Rp3L0nmhaK47P
         3QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727583534; x=1728188334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3AYE4EAY7+DIMSg6zZBDw1KLgq1Bt3GxtTiTGtRrOY=;
        b=m8ZBdUIFaSTikNEy4Qqd7+wZlRWy2tbUkBsjhzzcKBJg9GofOpl5NKaMxqqI3jqK4A
         Bxm8wPYY76tq9oQ0FxEcrxtzxZCsGKAw5WZ1cAzf2MISKFjHvbf6vBqX+5dauk3OtUn0
         jaI19iRb3E3ZqSekrMQ2JvSO3SrzfUZcRoyK3HBGJ0c2h3cjVwRgTUlueOand7D/9ZHr
         SK2ZQGIySDug3NMjjSh8IXTJCiN73WUOQ2O8bTILsroH9G67jGpNW5H/HK0sHJzEq/H8
         C3f0CXKhc0jb8qHSRbQWOFiSRFxkSaroN3f1jpxWEwfjVwXPUXih/+rFazuDv2JunRb1
         +4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5eyYEVHXlv4OMcypBd/2SyFvyQoCKl6LzzS1M5L8s6+q7/7hFqHsLB6668JQuTJhtfC9uZbA2WmSL4q2n+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpIXS5FzbdaZwLVdo0B05/GJ0Faci52hevH5NwItHsteDeDSq
	uvr27/keW0ot1Yqgt6Zd262SqB0bLIiM7P1HZwg9qffHe4v8JYOsQw+Jrm74JOSsjueecwlsSb9
	iGa39aIf6M0lwxOE4mdhH7LmB/FG5mW/jtoTkuw==
X-Google-Smtp-Source: AGHT+IH+HCA/i8rZh8JidjsUomu0azwpuBChRZ5m/iwQKitnQIu0YDMzjdhAOLhRYeUuP7vLilNtecFjiWVpiz02oWo=
X-Received: by 2002:a05:690c:448f:b0:6db:da26:e8c6 with SMTP id
 00721157ae682-6e247610a6fmr48073547b3.44.1727583533702; Sat, 28 Sep 2024
 21:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-3-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-3-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:18:42 -0400
Message-ID: <CALNs47uftdC2wY=Se9dx_cavd3yB6rJ09NSf2CHDtS31OZMjKw@mail.gmail.com>
Subject: Re: [PATCH 02/19] rust: sort global Rust flags
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Sort the global Rust flags so that it is easier to follow along when we
> have more, like this patch series does.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
