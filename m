Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC130DEB9
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767533784; cv=none; b=osnsjA2Mbqm/oqIJI7yNmzb285DHlZ3qdnJf+E5pStJHmn+KUbJVXnYCq2iqrm40ZAzWE3NhQgYgNSwLJgErJgvznfQC0SRhWFDFr4tATGaMrizp2PrIIvz1/wXS1XVGOPcvl8VXn0eJFEhYv/d2/0BtjlprzHwQBAjLQhDOX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767533784; c=relaxed/simple;
	bh=fM0tvjidnmZmrCxmNN1ThKMIacRhe3hXb0CNah74qlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYDFw7h+Fwa6CDeo+mnvct/tHQfqjWdcpFqUc3QFJCz6k3rzbLBNPyDvTFpv008W7/8aqgiZvypvkNN65PzcTZ6BTDIyGIxv/zPp3Q4yZnOREGYbQMBAUR6579/rvfxRS//AYbOFindot18C4oCsOM9ixxfdIH6puqRcZ49aOfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPUrd+39; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPUrd+39"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37bbb36c990so11043121fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 05:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767533781; x=1768138581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM0tvjidnmZmrCxmNN1ThKMIacRhe3hXb0CNah74qlg=;
        b=SPUrd+39yZZNqrWreq8+oBzbm6cHDkYxO503US+uW2wSlluUPtyP2WucZ2ISB/EkzZ
         tR7yLsU66EYPUBpg2/twYv+8wFTR7ZU2kVGqSplSQYPzlbpp1E6bGF1RErouDaASxuZb
         bWgmbfTdCWkf15ehP1Mp1gVQL1TlhHvKEoVU4goaGQF+UVum9WzrR5MYZx36tjMewhCt
         b7YRfXre3IFVgMwODAIspuDsAHxZFfy8cSR2JmBq/un6sQd+cZA4gDspt5t7knlnsssb
         bFzw5JpZG+Gz6pEWHluFWmiYsxckkRIZr5JLM/q1IgH7gVHInWHiESeU21gimZ70TN8l
         wcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767533781; x=1768138581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fM0tvjidnmZmrCxmNN1ThKMIacRhe3hXb0CNah74qlg=;
        b=GZHeXOxyzgqQiEioSIBCFRL9iaqEjLmHhiHF/UTbDYNP6zlodSvKeMGJQsPbGcR7nF
         kSa+ZqJSLfXfhCF5DiBhuXZ3DRK+ZJHVC0ZnEfOitTV8G/RfW0RNmZv2aZsCz5uiod31
         KAX/z60WsrG3gXyJl5edOO4Mo7KGn65CdABuh2xtEpziD4wvIxrEj+fLaltq9gSvqBHG
         NsKfUUc03JVq+d7V+rFiVjUlQikVGG+/ckRjlb+0/4eCMUUAoBUptBHEFsAtHQzgSsjX
         wQdaJ1lF7IKjhw+NH9zlwYl/ULOzBEE8nLduUmlpBbZTaCE+Msjjx29hAhGJclBig0BT
         ZL2w==
X-Forwarded-Encrypted: i=1; AJvYcCUqNbkrUrt77XrzYpH0AU6zDW9lIGczeNp858bqtsupVZGLVFVFZ6RQoYPQ7XxSjuw4lSD/0IBly06HuX/kfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+PvmMhvWL9WwCnzB3h+lW1LTuEEGyutQ+tRe8m/u/515efry
	9cbBCMS7gHv6UkqjA9em8kZOKuBAq051r6YJ8bJdiDy0UYFGfXfoxEK14ddY7zG8gkBxo1kXcuR
	OpMhLwsxDvksXF87R2t5odo+zu3vpQ04=
X-Gm-Gg: AY/fxX5e1srADlCt7sE9/KsploJ/K/8hdbut7Y5vdTxsJ+SbEWllq87UEHipWRcHcoy
	xE6PZAv/vvLOAIalSWtZB9Xw9bR/GlMVVULU4zm6C2oQd3jGOOB5PW46OsQCLu4WtB95QJrUB0R
	q+JXovGVxR9irYeVKj6Fec2lizXxOIOWEy6d4ABWTTvmTMR3XLkIQ4Fa7chBK3gt9W6w/vEJxc4
	KUfll6zIEhBaN53I/EHP4XdzeL4vObDtjb0BjZKw+yaBvtw1UQnFR0qznaX9nsAe0BcGvTocJen
	H8Y1FLEUkit29PTy9pfnqZL776Wv60xPLB3gv8e4dgtQxKHU/tdvI22BPaHFyRqX7eJixduZsPN
	6VHSzSa3hjy6eKs7T/7vlKfs1cpoWdZK/jvpuPr9t6g==
X-Google-Smtp-Source: AGHT+IGGARMTlbk2/JXpVUpPlrtFKLF0r7asCQYIQPCRHzGPx3qlLjjw1+bgwce4NWJKhe6mkHK+UrGyVYqLf7cb17Y=
X-Received: by 2002:a05:651c:906:b0:37b:9361:711d with SMTP id
 38308e7fff4ca-382c513e457mr13211211fa.8.1767533780464; Sun, 04 Jan 2026
 05:36:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-2-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-2-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 08:35:44 -0500
X-Gm-Features: AQt7F2opfIXTQMl54ZzdC3O_mISZ1osRlV12vd6nw3iV31h77bbPbA0RNbnlOUo
Message-ID: <CAJ-ks9=Q53FX=5TdLoYnM3pgtDo23nHjFy7e7B=-02-U0vZ+Qw@mail.gmail.com>
Subject: Re: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2] and
 quote workarounds
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:28=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Benno Lossin <lossin@kernel.org>
>
> The kernel only had the `proc-macro` library available, whereas the
> user-space version also used `proc-macro2` and `quote`. Now both are
> available to the kernel, making it possible to remove the workarounds.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>

This adds a dependency edge from pin-init-internal to syn, but syn is
not actually used in pin-init or pin-init-internal.

There's a comment in rust/pin-init/src/macros.rs that suggests syn
might be used in the future, but as of this comment this is a dead
dependency edge.

Cheers.
Tamir
