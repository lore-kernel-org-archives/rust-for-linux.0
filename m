Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DC285C86
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005781; cv=none; b=X0HLwKqs+tdXyV6SWfaLjTjo/BKdCz01aGxYJdP3HKbgAxW8cJPWvQZUseOm8nQpdGrvVFtjCEiLuiZHDCpgM9xySc0Cd4tumg/FBhKbqN5hIUZ2LWuTh8J9Ve2v40JX5AwbBEtwQerYJogeoMJ/IujDaZKf4RF8DNZ3q7ShYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005781; c=relaxed/simple;
	bh=FfeqLL6dQOkRGa+2qH5Nfx6sExnoJH9Br0Sq46snNaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2bGmDd/1jwn0aEbQzbEZNXCir1+MwwjSETfB8khw4ZklkPBkrKke/7XhCTtsukvdv1LMG/91qyIbi6i592WOY2P6LIwtw7E0G4J2iykn6qy5cTtR1FXAyblR7wkGWuF68IBtzcssY+6St52YU5/xDURbeFkp9rkfRUYxbpqZys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GTtbRx97; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GTtbRx97"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b783d851e6so4649681f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755005778; x=1755610578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfeqLL6dQOkRGa+2qH5Nfx6sExnoJH9Br0Sq46snNaI=;
        b=GTtbRx97XiaJEGG7UCftlkG3XhyblU+WxIIJB8SFySDMDZl+kzOYoTwC78pW6c9u0f
         b0Rg5NVjpYz6I4mvdEOi1/eOsvKA3lKeCmOP2vfNchhgJCZ3UAhZDUmO+ztp4DD8Y0do
         QD7hDrj4GRj86jTqoznrj1xjuMOg5MH2vKMioFfeFnjBPlh+haJkyFKBEzZkUePnJHJS
         xMGhJZN3Va26lK3As7hZQz/8HJXyS7lhRQkkYDc59SVxalRcu8TkuRKnEUJFjW+YNq2a
         wJcSWy35IVRHN2lY45Tvi4FuUr4wU30q+uc9cwWzfA1yy0C9D/i/ic2aQGjlLP5PG29O
         9Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005778; x=1755610578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfeqLL6dQOkRGa+2qH5Nfx6sExnoJH9Br0Sq46snNaI=;
        b=Fa+ENrUN9OP1xHDZVSOVUhXXWdZlTk8LDmnOKvph2sByig7uUbTO+Vwknc8GblmW/5
         YS1LCoI3n4ozDpWujbk6y9tyPq/iueH7W5MtkwIf8P2r0FMgr6S9R1ygkPQh1OVc6qoj
         g9NuMF5flsPwF4Geo9B3LYTkRHxqanAjes1YVTLo1/35eGiMCnfJ8nRxpF3OGcsg1GAx
         +QXS8MFY3OajRVw4uNQFhnquZ5bJvON5j8yVz5VinqdmSjKJt78JkmMYvrc1K7qbOwRt
         ffREj2/c7Kigho6tZpse9W7fkuZ5AU8yNwoII7U8O+DsALTkEtYGLfPtgKyypQz+/Qmp
         hHqg==
X-Forwarded-Encrypted: i=1; AJvYcCWMlmDdIxIlK3a7Rg4W8j7qQ8rAG5Abfg9K9YcBcM8LUj0Z3jLn19xU0Q55plp3/n6cpUY7IQZVsF2IxWWRgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrPs7yaNhQlQGofiKHjKp3s3OktIoRBMu89RjF6bziz3Ro79U
	pcK6sZZwkZzHlrKA3PyyZV68b3/XhUgY/2M6TGxKC4/Cxwx6vyqlYuCjq62dJ9RTiWRHX8i3p38
	siDOnsCw30OGKUJDIdshaGugJOkEpEBbyjHPqfYsQ
X-Gm-Gg: ASbGnctsmY7ux68FSRhvgyy9z6/Bl1IudWVhHd1HXjCOd78FQ7MD/aXwtg+IAXscAgQ
	vTrA0Ylq32WEHuJYuVLAbwo20nAINJGyvvE/k9/E15QWoH8GcXpfIs2WlUUeb0wcOuhennG8haz
	lD8tUd2YNOuuiNGqA3cw7W9sq3xTf72zTbImqLxp6aiP2T4xZPhfAQZpX3xrcok40Cxo0w8rYr8
	tZub0UY3s+jP0E9HWRAwLckOP+jm7z9bI2fmQ==
X-Google-Smtp-Source: AGHT+IGvi39HzBKuKECl3B4URDI7XM1LzzhtHLRMHVg4OfVEDl7Qv4mmJaL0Z/gOx5HNOgcCpFj+tchSrBuJVnqWU6o=
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id
 ffacd0b85a97d-3b900b83ce4mr14406064f8f.51.1755005778141; Tue, 12 Aug 2025
 06:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812132712.61007-1-baptiste.lepers@gmail.com>
In-Reply-To: <20250812132712.61007-1-baptiste.lepers@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Aug 2025 15:36:06 +0200
X-Gm-Features: Ac12FXy01SQUE4GxmHxLMqxN5BkDGNIVt8wh-Nzq-CeDX_ijk0ldVPo5VW0VQoY
Message-ID: <CAH5fLgi4idH+bU-fQm-kup66+-oF2MkH5CDWp0jguHbkLHqU4Q@mail.gmail.com>
Subject: Re: [PATCH] rust: mm: Mark VmaNew as transparent
To: Baptiste Lepers <baptiste.lepers@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 3:29=E2=80=AFPM Baptiste Lepers
<baptiste.lepers@gmail.com> wrote:
>
> Unsafe code in VmaNew's methods assumes that the type has the same
> layout as the inner `bindings::vm_area_struct`. This is not guaranteed by
> the default struct representation in Rust, but requires specifying the
> `transparent` representation.

Right. It's the case that the layout matches in practice, but we
should use repr(transparent) so that rustc guarantees it. Thanks!

> Fixes: dcb81aeab406e ("mm: rust: add VmaNew for f_ops->mmap()")
> Signed-off-by: Baptiste Lepers <baptiste.lepers@gmail.com>

Andrew, can you pick this up? Thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
