Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C63C8C48
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990386; cv=none; b=DWTg9vARcCj4LED46MeTMb56ze+CfOtZdmVVLk0BeCJY8OPnVaqYmmQ30HrGH3EqqQOO6pq0Fawpm8J1e9w90TXynHZm2ssJCIwvXPXCE860YT2Hq4hwB7hA7isrm9sTvmgCekmNWbZz+f4k4lcg2Xl+6IvDYxnFbbVdyWyBNkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990386; c=relaxed/simple;
	bh=hEjKsLw6JbLkC66BSkq1CjuR6SFo/HJNCc8wlFrl71g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PZg3ijmf2x3FN74Hvmtdg6MIln1C62cjZfbUPAGn3tC9mdhRDYE8IFUYWFrXg4qUBbBzA8S7cxmRCSLGVaAqIL5CIflZFzTyRiEB4z561IuunwDe0SccIEWRdtWSQLyecW+dd5Gmx9sTmZe/gIdWpfzNZrouUwYArZx3h4iubrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WsYGWo7Y; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WsYGWo7Y"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-475eba52438so1530155f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782990383; x=1783595183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hEjKsLw6JbLkC66BSkq1CjuR6SFo/HJNCc8wlFrl71g=;
        b=WsYGWo7YMfO3HOlZWJbUnHmXbhsxtyNnhmFcoYGkcwdtWJJ0zJi5b90tUc6986PY+Z
         gox5DxUJ48K1zQgq/uJsO7uGqEeNcmD1UeJbbZSIFWhJySpZAyDXeQjV1mObBjAgWurU
         Lj4Ki7iqBE5X7jopchBRPH1btgJVc9Ow49B8MGZuS1gLz1v8gL/5MjbWI7ZgqXKs3Mmb
         XEIl39MWmOngq3XgVEYPa1Kirw+n/9RZEdjrTAntBCL1/T1bP/tbKWuXIFpemLv/kI28
         /7udy5LWARW4bE3ahBI7SoEmDZswnffBGiZX+L+f2FPT+QKnnp8UvZGTn4h6oNldNEPu
         iQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990383; x=1783595183;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEjKsLw6JbLkC66BSkq1CjuR6SFo/HJNCc8wlFrl71g=;
        b=Q3deHopWSHWzY/iT7+2i8Uryzv3QpNZLnEXJMzxljlTfaDYdG1jcHCy1EZ3gnCbt/n
         kjZ8EBCZvfWslcEjbduDtg5IejdWn4VD+TpWUJXT06Cs44CMqvHv9mOOaxiWN7XsGE7E
         XhHyefT95H70NiOoJeimlaRK1cMXynnZdPfOdmcsjuKZgrioOgLVsvqNn+bmHdEc2vb6
         vV0DuicFwVZrWfIVDleeGJt4ctzzmTl/ioScyGy8tSCPz6s4dlzZvjuPawQimWVkRao0
         aUbyVNCkTsIv8nHn/exsAMo82n90h0zsYoKU6OqhrE61LuS2hsZM90/6EfJbM0shA9Gq
         D1mw==
X-Forwarded-Encrypted: i=1; AFNElJ87v9FsIx7o/3NDgxTY/8fLu8rs4Tvag9JScKazx2ghOHfznpUINmWhpSK1UGPsYkr0Bg3Jkw7PElQ+pYTh9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMxJKYkYPCi9XhIoPKxI/txicchYGouYZStEvi3jqUZKrJXcX
	kCGVht0EQJHNG9AG5y2QUZcurJ/c0RDIXZfee7f+kqKTliVYnutWkpMZKeMizz4317Dkm9Q1HtI
	9jn5/CmuABgPWWMNaKw==
X-Received: from wmsm38.prod.google.com ([2002:a05:600c:3b26:b0:492:49e7:fff3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:26d2:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-493c3cedeb1mr40482955e9.25.1782990383098;
 Thu, 02 Jul 2026 04:06:23 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:06:21 +0000
In-Reply-To: <20260629201046.423464-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260629201046.423464-1-nico.antinori.7@gmail.com>
Message-ID: <akZGLXnmUaF0XPtL@google.com>
Subject: Re: [PATCH v2] rust: iommu: replace core::mem::zeroed with Zeroable::zeroed
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Robin Murphy <robin.murphy@arm.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:10:41PM -0300, Nicol=C3=A1s Antinori wrote:
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `Zeroable::zeroed` for `io_pgtable_cfg` initialization instead
> of relying on `..unsafe { core::mem::zeroed() }`.
>=20
> This change improves readability and removes an unnecessary unsafe
> block.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Joerg, is this cleanup you can pick up? Thanks!
