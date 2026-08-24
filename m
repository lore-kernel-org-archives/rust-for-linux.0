Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA140E8CD
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571398; cv=pass; b=J1H14UMY6B40QeQqDVGSJGorvrO6YoadvizVAPjZmVu87S+KLOVbWTGLRkX/gkI42S5oZ1lKlPYCz1Y7UvS+6a7SpfamfKLA81NM7z2XDgOebrvH78j3/s3XabwEBcVKVtRw9XpKXkggG8h2rZM50hu8U2Ly8hM4SBaZ9p8IQfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571398; c=relaxed/simple;
	bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T01Wj1Fd+gSGubz3WlKxMMwx41I7+tI/fQAPzhpD6zIq7HTaU33lJHAp3jSvtH0rDeHonFAsbZsOZvv/t41BJrBwCmcw0EFfaIO231CqIY9ob291sZ5c5jHidbWMi0tcqOG6NhKF5wIZBG5iaxl4MDYQTV17cf4UDgL1gWF0U7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFt7WRk9; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFt7WRk9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cecdc24b1cso3229265ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 04:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787571396; cv=none;
        d=google.com; s=arc-20260327;
        b=K+5LmeHnVxuG8gDNQYo7JbgJVl58OOnnrYRbVO3UydkbLmS2s65Cv7IZKn3TYlh881
         /rGS/PciiCcwjnLx/HN2vYO/ioMem1gB4C1YrXhIJRAquh3QWWq4B5gQEJeLeUu6huhq
         syrHmqUtwlb+b9s2ih9mdlSngT790O32s+x0OCUdlwIuUbQs1Ffl5fNkpGVRSrFcxon/
         wsU58zKoOK7k5b6+q8S5G+gb25OHBwkIsN9zE6ODDs5DlkeidshQ3GF1hlK6DFxGX9nm
         u+JwF5hLoDyXiCzYFGs/7QtuXexUdHmCh4Choe8te1jrgUnsBC6AbqylBoPTV1ALp5ys
         7xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        fh=owtR8uP95PFY38ZiCfCz6wlRQ1ldZ1BZvXSMfcq7/W0=;
        b=Cujn3Gcpm0BXBHV+cR0scWQqqxHdPUO06yFuYw+CR5/iN9oROE8G4tlxbtdgBo8y+y
         oCwOAcBCkeZf29A5sDb+sdibdnCoKy6VaIIHlaNEcfy8DqNZhvV7z10gkEouSllM7D0I
         Qu12l0PunbLx72LVENS/HGKsO2oU06CxQ9D1OTo3s6EJNkL1Qf4DzidX+qN3JVfivRsA
         fMxFaPuj9aIMJ/GXjUfV/frUQHx+XlHuSyoKGA8xB7RnzjVJ7ydNTKKq4U0m1a5LnPjg
         g+fS7OdwWaCjBCHPMtXn3PTiLjyxfBmQ2hmcmrQgIvqlR6y+GK0Z08JXWx4spnOx73Om
         rz+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787571396; x=1788176196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=YFt7WRk9Nw5n+i/byMsiEaa4pUCFMwIOshTiaBYfmARkFAcX/qqf8idooFji7JpJ4V
         8I34V5VPE/KG8FVWrMOwRcHp0UY7rjPa7LnUR+B2rG5woJ3E9vuC/Eh2yg/2usdoBvp/
         sgDBOYdtWrBqrUWgwPwBFa0oDvKfFJLzefi2in5uq4x8w4fS8H4cBSKU8F9Y2M+WR8RF
         QkcAvfYl7OjkWvMO/Tb3tcOzaneE014I+i3hMlZOBVF9dLsLPSrerORIU6H1VrLq3Jh1
         krdI/j7GbiJT+hC7CSjdD2Uv42ryCAzdRaCZFoOZqJ9FlvCJBlxcPbPAHtRNv4k09cv3
         hG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571396; x=1788176196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=PWeUTE5n9EX9Gx0r0b9HjOJlhcB22Q4HdiJX4BAapEwcweVUK3VKGDwJIYn9QUo6JN
         i+KBbiUArlWcyf0z1R0R6qkpRuugmInHTG0EAVvK0yoQep+i9gXO9dHk1gRb9T0updze
         8WtKakiE1ElNPszVaU5yaskG5h4UM8jO8JvqDK5Qqe+8tcBVy5QaY0sba/8gcV3+W2/H
         ozVo11Wyfc7gUz3sdl2BTZDsaVsJwDHUV0SE614bFDN1h1jPywhdr36qwLxu3zIJZb8I
         XqG2IZPCv0af9BymcmBtMEqOioZLtLU365XcAokosJJirrdkZRPOPNbAIYL3T83iIqf2
         0Z5w==
X-Forwarded-Encrypted: i=1; AHgh+RoB9KWjgxgV+k3YyuPjxlcFAoKHYGoK0ISIoxKgNOFo5q5JD3rm5TjiLD4El798Ca1WdPOP3V5uQg1jgFRguQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kY+D69ZtEzrvKu/umom/TkC4K+dDvNiV+aCRuHnOXgttTLukJO
	4FYVTyUTHRtZHCG6QEiu0RgFhZT2faALX9jNlg9e7h0/bIWH0Be4r+Zuc36h5Ws2jA7KA1G3Bxs
	yYeJqnARgFRZJxZO1hNaB9SoxBCPrQLw=
X-Gm-Gg: AR+sD12ql7PVBoXCfiG0pr8mLujIyblef9KQw1W1Yh0kQ1U7OsEUZcYuWloLeyID4JW
	xnH3R4gEnTurtNsRn964HDv2E5Z23IYgdKpi9Xp8ZHgvfm4lQjULFvFw+1T7BYHUuwTyvne17a9
	Nd3isye2+AkQvxYM0tgYVIOlQLU8IIqpc6ZIUeh3qWxybwUSvUlBw+PlE/+2cCoVsEiCQ6NIj4j
	DzSjv7VGRzHI8tWSbEaKoDO1ktv1Ylt6c8t21Ediy4Y5pmiNhLxDmGVfhk6eLvE3QWwRu0YVRop
	PWuX7ouWjwZrTYxnB0/NeH1wu9S0c3X8q4GoEjT/3g+NAWO3hxFyM4d09GQl16TxHSN8b/REWtA
	q7aaV7LcOcQWKNdH9wpWPEpwabg5gUEWOwGRbX5OnRVXuVm25AEgpi7zJnUw5mcY21qtkQ+c=
X-Received: by 2002:a17:902:fc4d:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d64a9a668bmr222250785ad.0.1787571396025; Mon, 24 Aug 2026
 04:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org> <20260824-unique-ref-v20-6-490735672187@kernel.org>
In-Reply-To: <20260824-unique-ref-v20-6-490735672187@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 13:36:22 +0200
X-Gm-Features: AcwNN1XvVB-Mna-bMRr_-WAakhrdmhTEWRag6uYdZi5jKauuC-nwA9j0nxkTDxw
Message-ID: <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
Subject: Re: [PATCH v20 6/8] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 1:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Please see/link https://github.com/Rust-for-Linux/linux/issues/351.

Thanks!

Cheers,
Miguel
