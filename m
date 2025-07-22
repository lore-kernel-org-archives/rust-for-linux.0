Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E433B226D0A
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182892; cv=none; b=DOgeoTFhYzLxgRlDJIgs63M4SIawa54udMpm8GmVPXTQ/pBQNTGjZ2S+10P7dWOUkT/KbvOFkKP8sVXt9knsSwY1nnCWGtvb9FJ4EU4On7nv8KEbNO3DBdYV6UA7ghjmiBqLI2GJtdlIy3TSrvzFThzCASFN/s358EmxXWMLEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182892; c=relaxed/simple;
	bh=QBIPGfp7FbHcutWBJlKogTk2ZO/hQ8ASWIk1T3iyCj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdDVmeRW6itko1P9gqkCjg8uFn0yFqHR1hjNQvN3V8u+5RCR6kIggODIwnGzSq+UgmffZfPwtJGhlEboiMzMdoyG0VsDOQfrPnaY2fi2Y46/nF+tj2mjVTR4tfJHy/Se8j+pwmEuzstPLvPEro/ZWHYynmwhPMhGdSQCXJVPJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DXnZFerp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DXnZFerp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3840921f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753182889; x=1753787689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBIPGfp7FbHcutWBJlKogTk2ZO/hQ8ASWIk1T3iyCj8=;
        b=DXnZFerphmfSE+7kwlMJY+TQ8WuEbKAuLbgTAvnAHnFoPXCz/lPLJNF3umiNlOTjRG
         UCiQp0P/gYJ4qwPvjwWxmSSgkw9wSFZ2tgaFgJRz7uZcJcL5/g/8SKdhy+kJN5KtMQZD
         zIwybzlNtotOwWQtsI4DxQOZR+jEsyUc7slrf/DPZEHahExtt18IgX9me3Sz9pVPxQ5V
         tortYk1bOKds+BA10repo4ZvnQm21zaQ8XkezhxoO0AnrmoOO3S0CFCWNY8qd8ZzEDos
         UQP9F2QiJOZ1neUKKuoSCFmXvPExBEAIWu6Jl4S3FltZVN25bWKNmduF6w6LU/hg4k7m
         EmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182889; x=1753787689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBIPGfp7FbHcutWBJlKogTk2ZO/hQ8ASWIk1T3iyCj8=;
        b=iEeM5fBPEfWlcJKR8RNlGZ1L6LkV3e6RRt9Qbn6+j2ESpJeV2csDDYBnyDoshQKzmL
         iJAbTiuIM8Axz7A0WkFSFBcHHxjUC05dTLl9R4RoaaH3rm5RildaNa5YCvVWgPtxok+E
         gmH0sQGwsp5Dv1dV9VdFX5oloJqENoXaVLsIWp/1LMynYFrdPhSY3yVKa60emgCZPubK
         WLRJYIGaWS6XBx/qCtjP+GV8rQ2EY3u3fnIyqFs/ttlrWYfoLGIRhnUPcKOUW7GUqC65
         Zz3NO+wndRiGn1cMZX2BB0bfXwJxk5SSmSyI59BMAEseEMrj6JdLm9jkWTFNhSipVHSd
         f2tw==
X-Forwarded-Encrypted: i=1; AJvYcCXvsOBIgY63ZbLSid6tUIH20Uw3K9MAxzATiFbBNgFjJCWhmTxXp5H2nPgAZdm85sfDF3hFTF5Dy3nXsBNoiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5qIdsxb7WUhgPZiy7o2OQkEOtSljoLDtt1auRPd13W1z7vc6
	RjjsHtTVmTRjUBKaTiUAwLc+6E5Fa6xr+SzHeAT9RP4k3TmAHTSqhX44pl9TinL86y5z6ptAUbd
	ozIMeJMBaeDhRaEn3vwbAglzM/2ERaUcE2lq4jvsP
X-Gm-Gg: ASbGncsl5Ha3zOTn2KDQjyA31puj9GnxWLtTuoD0M56I9F3kRC2b+zwPSVauvcsdjM0
	Vp70Ma2ce4d9DKO2c8w+DHwX5FNc6ff+2C5WzO57YN3TsBiHwfrYtLVp0m5TiLGTq6iWSd0fR5S
	cWS6WE7emVZMFC/VkAOpUqTfU+AlG6HfKv1KGXDTpaZTc7OORNGGHttwWVdPbYjoPorLsgd/h3s
	Jb8lAaKQxv7r8l/8eng/cL+t61J1NkvsZxZtA==
X-Google-Smtp-Source: AGHT+IG0P22eL8IvvgAefH6rcYYlSNuAa0jhSmm/EquOzDBvVg3gWRNH+xJaIxfbUYM6P7L2iT7JbnpLNl2gPS0x2fU=
X-Received: by 2002:a05:6000:25e2:b0:3a3:5ae4:6e81 with SMTP id
 ffacd0b85a97d-3b60e4c99eamr17188449f8f.8.1753182889107; Tue, 22 Jul 2025
 04:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520231714.323931-1-lossin@kernel.org>
In-Reply-To: <20250520231714.323931-1-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Jul 2025 13:14:36 +0200
X-Gm-Features: Ac12FXwQP7uxv8WKaNMJbn_lWW_pabgA98OacNeTtJb-K59fB0YUB3u899Vcq1Y
Message-ID: <CAH5fLghkiZ1AH7Uy2Rh=J252+TSOXrFJ3NDRUta6s9R_7O6U7Q@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: fix safety comment for `static_lock_class`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:17=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> The safety comment mentions lockdep -- which from a Rust perspective
> isn't important -- and doesn't mention the real reason for why it's
> sound to create `LockClassKey` as uninitialized memory.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
