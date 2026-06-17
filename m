Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7339A4DF
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690093; cv=pass; b=rB+dc6gEMLVFCBdSY4ZRl+Pip5XsatO/1MNpzCqRc3b3R2NYeifjOw9ZJXFHTVi8gS/UNDCFtaeVpj+a9xseTmwy5YzeMukAApwBFjqnUYZ/Wx8QCmldp6C+KvU6gCewoim2NkSBrPr8Vs50gYsSvzAimiZhNBaCU2qkRjuuxI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690093; c=relaxed/simple;
	bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODzeDld0WEffQn9Kwmbsxs+5A+PpkVm7Vj1XthMZ7E7kHVIt5vs45WgijFw0wY2z1VU//xomS6TWa9yc5OT00jOfxnZhz9DFDgQfzS4ccpOU3Kz6HLvI38/P+V298LjaW1r/JvvSi+KM4A7vQbawz99ohXTiWpXvMbYUrFZmcrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5uxNMeG; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5uxNMeG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-460166910e6so2987442f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 02:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781690090; cv=none;
        d=google.com; s=arc-20240605;
        b=eVgiuJkWLmRI2pnRQhW7y4r5feRjf5wUPmdXjpLZV7eOUDkK/9tofFjZ2p8qr+apez
         uNaf2/XEmSvtvwTNON+mVlxo6YaSCd6QPz1TsZC9g96hpa32YAF29YEOIKm9LoUOYn0L
         yXE9OCaLhE4Du1vE6yGLg11wZedauPyA9J548iuapJGIhyeW72KhJ5suUkAYl7x6T1mq
         gvMORcvULvsvNuotJrwEHX52vqI8bM3HMxEyZIYtM7jswqnmbo+zrSWSQG3YM5pBH5vT
         Ner0qRmWKp7i1qQ024Xi0pMbt1YlxopCELrPmcq+b3nkZr3TauTZsM52XWnBavLLQhOL
         fszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        fh=awZIOvLqhqFzyj5iy6k3H1dc/69dw6DNaBa5BGTTLho=;
        b=ScYbbdmYQMv2KcdkdcA6XYIYs2d7CFCsycOvfMMXKzP1SP7M/eAHvnVJEmhwCCu2rx
         ZwbDrLfcRIDdkfjgD3pJKIh5OfpmW/ca7adEvIcDhtz8ipEwsDb2d6IxU1yiIMC9Sb+M
         e2e1PN6ZlJmrd9/RR9+eJMouykkhTrjHpzszECkD2anWEVKReqz8ZMptxc5PZdfokcgE
         M9nzqnnY4wcKH4x+X++Bvwu9Q/DerIjrePNnmkkm5/vagF57TDA4M5vZe34XImfrINJm
         jDGfvs3o7FogPP4W+OZzVUYAuayBXQkn5RM+30ySXkY7JgioplJU/P2hqy+1akqrx7Q4
         4y0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781690090; x=1782294890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        b=P5uxNMeGcDIN8llkO0LerOZseMvI0xoedivCJ9FZTvVkZQDpB2XH0vEThBBsXiWG9u
         sffI4uZumgWiX1nzBNMDek3/+k765xSl2pY7u/w/2RicT1DEfhmO3fV0tSyaaYwcGcUW
         sDIXq7Nca7LlV1xIEunZuyJ9m1LZ+oEW7N8dbZE1czoJgFmOXyNTjsG/v55Westq675s
         acUzZoCXnMYEzFXbS8+neVOK/fnhKQe+EzbGYwDbJeOrcvNmrqkC4agNzuQkCHFs6iTV
         ZeHsur1G/4T4lhO749KNW2vcfZXCrVawQX8QPjkJVWTDVb+5i/q9LvGGwrB4P6paWDbi
         4AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690090; x=1782294890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        b=FRKD/QJsWA4nM5x8fTaGMewVApjYjgnxjUw5f0EMS0HN0bERUIJPjWOAsqW68rMWIF
         bNZwbtuVV1aPGMpl6al3a4px95qFjmzsZyhJ20SIOUeAj6fd3lIcbI2yS3g7Q6F+9O74
         iyQWrp+T1J5zEqYgRMIsd9alPbvQTy35mzzFnhNaPcRsbscyqV2hr7udQBqGztHIu1AC
         lcg33N6dDRT0OrCBWbv5eUtDyhzyCiQ7rzNdJA7p+5z2DZdNTDpCYfTJdnGAHiz1aS3c
         bTubmbmUsxRBAloc/GRSuSmp69vcp2LGvGGKdadYPhmSChYCLLy9/d7BGUc0aorxsBkx
         Gy8A==
X-Forwarded-Encrypted: i=1; AFNElJ9s7y0fUqoc2tbVua9gK1RSS/LIfHVOzQDMevpt84F+1HDBwMyk4TceT7ufLDVt/XFQzykfK3cCIPfRNcLGwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxskALTI1a03Z1I6L5Auy7mfW9HMIoJcPghXP7xB3a1pqls+W3i
	fHUa/s3mZnPaSaiAgywYV/1Ohcm2zsDrqOWqv8v8CZMhEHfMo/tYJgkQ7YZn6kGLdYFjK69XrYm
	l+/euYq0xK67aZTh+4Xeb7meNRiHgOPd/RqAd8dEu
X-Gm-Gg: AfdE7ck6VLwhM71xqUEQT2KdeEiZaMvWMDhIhqOq3AvrkCqIbibshzRnfu+ZHzQqnod
	w8OO7PlUALAk/y4KyrXnH8b7Qlrc85FxpUKnAZ8KaNuYkQdNjgCe0N8XZIXETIfAnwvKQ+kTcjD
	sF6gPMtdCr3N0mWwZFe3Q9AvhXY5C0FQ1KIK6DBlM8+KFK3dlR5wfXYeQtUWb4FbxV2AhtMkaO3
	eVFGWsWPfLenwrhhuh1egrqoHXPt5lIoOe0PpVqyFyJs7u3xtGPlazGTL2Duq/EXc/dn9FkqLmR
	ODbQN4B2AlSPfCioHIKPwW61pF3TGF0MDEmRfwudJRM1e1Zpz9LFUwJo0sU=
X-Received: by 2002:a5d:4a91:0:b0:460:f36:79b0 with SMTP id
 ffacd0b85a97d-462376a4df0mr4361735f8f.19.1781690089839; Wed, 17 Jun 2026
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
In-Reply-To: <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 17 Jun 2026 11:54:37 +0200
X-Gm-Features: AVVi8CfPlpZsDlv9ciJ6wpjG8CPXMs720UTUcxwfh8qgpqFIXUpU1m_9T99wYrA
Message-ID: <CAH5fLgggdf0CM0o4Oa1VbY+y8gQxrU0VU5z_yB4GWCxnbqsFuQ@mail.gmail.com>
Subject: Re: [PATCH v17 05/10] rust: page: convert to `Ownable`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ Andreas: Fix formatting and add a safety comment. ]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This will not compile unless Rust Binder is also updated.

Alice
