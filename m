Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3881DFD8E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732657888; cv=none; b=j4S1t41FFrKJ3nV2lECWSnaxPQ7FxCIp5ncOskCXFjWx4TPch8H78JqyqwcxxKYP0/KaDZjSMx8FvUvdc0Mj/oAOLasCzItzgo7XzysaNY0S1fYxhQNGuKK+IY85vRNU+jJ7t9crGalCwmy+eepjVoIgOZK1NpOsAmc2AXOrryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732657888; c=relaxed/simple;
	bh=yvlDvtEahYtNUso+6qH92gmUyN3C/oxlbIcZCyFM3B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKtEoPunG8RhvsOmYjVQDBpJteW0GF+U1CvoZY4HdQhOBXF7h8aELdpeSCqPjrNFLP0giL3ieYV3x8iFHUxGdqzBicCFfakTffJS0dJLbcf+kiHhzZ5R/gSAKhR87LeSFJtK1IJHGYirp1lf7R5Fa5bnqLI3ujZ9XunABt1yGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JRLRpqbi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JRLRpqbi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so535a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 13:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732657885; x=1733262685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvlDvtEahYtNUso+6qH92gmUyN3C/oxlbIcZCyFM3B8=;
        b=JRLRpqbiqMlXDVn5yw658ha1oEOJYdhN0CjmNFgAFjyWwYftzLG2QtvpRz80ewEdyp
         XFiIzSe0W2Qjkt60CQRcBHjamJER9yxxRl5e8wYc7Bnaxbr0opT22YRTsx0/3OhWNaIX
         sZMOxW6dS1bgTKBaTGkzgTamgLnY7yIrB8DpxaZF85DtWdE0xo9xgXJg4EJrZuTqsYLU
         THt08ZdpUVQySPiaqVsesjJygLxQhhUQeWo077QaW4VJaRDvYeWvVxdY5wJFTysNMe/e
         fgRyQ76bNqo5pC4LVuJ3SG9vMsv/Dhz5TQvEtak6GHIAqeYWZ/O/Le+MXjPVzuKJj58T
         fEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732657885; x=1733262685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvlDvtEahYtNUso+6qH92gmUyN3C/oxlbIcZCyFM3B8=;
        b=hqszc7Ue0ILUm9xn0PvcaM8Wz9fP7HpZB63bI8zzlRV8xoQKyWmLSogEU+/0td0NJ4
         Nu91UFSWkDpkJJzpz9snHYT4gP11eW8vGGHaWXtJDBvBufDQ/rb//6GOGPSr9IOOUAqb
         zNd2UEHoNyNC/A9dwpJWg3pAHan8awKRYsYchmiaMaROPTx7qzfVFlzp8hHhKsKxbbHg
         okOfHN0lzbnmcswtZvE63A87AdfWHvYQhOv28yo3JFSTX9doCsCx66WDdnHQPP6XnVDg
         qsjuAAW6UGEdcOEp6X/goRk3ct87a7ewICPO9ZdEJ7huasLKACq6ydao5Y9bVrTcnfui
         GEzw==
X-Forwarded-Encrypted: i=1; AJvYcCVjfjaKp9rYuNL+XcKU5a0y/UPCXiURBzVAod9jLH14Qg063svOrkmxcWZEGXb6ER7v5oObLoWAFHe35VfFnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgl91KU+NuARwdqszQ0AIgtZvqdI4LoUvX+4PXTjSJLzXEbdan
	yy56yLn3qA+VAQJap8Ot+lwBy9x2dd3lANa6U5mR6SNOQr0PU4LrDq/3d5ufFksAfrKbPLYQcyG
	paUYy9LPb3IOFa5uNfx6mUB+ZK5/eLW/7Hns+
X-Gm-Gg: ASbGncuASgQeV+DtpFDnYy6hcdXKHs4ojZZplOcmO87h356NRZ22uPQ5vta8DdS4eXg
	fEXVkOuVSwrREmcokMsxSYSmTePOSQ3aJwOi3WApYqxEr90JWSKZ30rPwO8A=
X-Google-Smtp-Source: AGHT+IHYQJvZD1gGExfwDIDFj+tKBXqsEL5uzf01tAJOezpTzJHEU8dGIvX2EzXD8gHsvJpS7xP/SwNGKEiMqDRt/dg=
X-Received: by 2002:a05:6402:1774:b0:5d0:78d0:f845 with SMTP id
 4fb4d7f45d1cf-5d081159fccmr23577a12.2.1732657884146; Tue, 26 Nov 2024
 13:51:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-4-7127bfcdd54e@google.com>
In-Reply-To: <20241122-vma-v9-4-7127bfcdd54e@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 22:50:48 +0100
Message-ID: <CAG48ez1MGawv0EVA7ZFgjWi76DRuQax-5PbGqG-msAzqRMkA-w@mail.gmail.com>
Subject: Re: [PATCH v9 4/8] mm: rust: add lock_vma_under_rcu
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> Currently, the binder driver always uses the mmap lock to make changes
> to its vma. Because the mmap lock is global to the process, this can
> involve significant contention. However, the kernel has a feature called
> per-vma locks, which can significantly reduce contention. For example,
> you can take a vma lock in parallel with an mmap write lock. This is
> important because contention on the mmap lock has been a long-term
> recurring challenge for the Binder driver.
>
> This patch introduces support for using `lock_vma_under_rcu` from Rust.
> The Rust Binder driver will be able to use this to reduce contention on
> the mmap lock.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Jann Horn <jannh@google.com>
