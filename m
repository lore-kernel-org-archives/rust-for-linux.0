Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA73770C
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Mar 2024 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710763850; cv=none; b=nThsY4J5Fl2RTUbo3FCe9O+Viyzt3dSUsetkJffIYiefOoCAnmGaEfOpFqSWQmK1ewNZKtmt36b547JwtKiN2emfK1zarKis3pCmcZ6H0jYDUzqwFlGLjbWssKOrKkJcsHKJfgBZq7M4qLIHfNRmyvsRtRYgYggloX98yb85v38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710763850; c=relaxed/simple;
	bh=7C5gRByOTiBepMYDEh4/2vOam5byMw39eopNXREv3n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7Ia59eCayPS/XmoPHZ7xvf370hNfAyn/uULdrQprVw2z4wjqDbLUdBHSqNeUPsPbpB7SgWFZSw9P+vu+0Dp8GjSks0qA3Gg4WoDHOZMaGYg+PZbHBsR0fp4IBUmOlpsKYDeXujqwSUFJL7bcanh3+bNY2IRHiJjrFRewkTh+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OGeLIBIr; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OGeLIBIr"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so4076997276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Mar 2024 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710763847; x=1711368647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8XaTQbE1O0a0/DruCXEWFfXkhfUXOtTJuF3lZFPpKI=;
        b=OGeLIBIrbBl1wS++5IgDfxJUtQhbKyzaUJCruOG93fptOob1QfcsFndguweA41xS4o
         cz3bAmvrcu2YXeoBZ7HfJRuYmkGVEZhpW9EXGsA6+EYnaGJ2qA5WE8PjKRR6fyNxeVKH
         n67aJGVdddG+v+xtcbIcjj825N+tlfFZHtYi/RN9kxzDEvYqqJNKvXDjxCAwX7KuExIo
         ictT+8VdXNXXzucx2sZ+ltwgldkis0kEpg+vU3zB5Afg5lUA3ktbaRSqsLI35bTqlrHx
         SiI3QzGrc/w7e73VxGSar9mZvXkT/fHxFp6azJcDPrpKfadmgP3YCxDgSpLJ0KPbe9EY
         P7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710763847; x=1711368647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8XaTQbE1O0a0/DruCXEWFfXkhfUXOtTJuF3lZFPpKI=;
        b=Pp+2526Ybz9fMfquNpNZl9Z4bttEhxod/N6a3ytc7b3F/0MBUofleGo5/THBcikGfh
         6r8OX6J0VF5KCym39L1XnKcLDGsOQ4RPhKZdpACZ9fVSMnZVuFbkYSxZGybUtcsoLbDX
         n82HQ2uUsD2CANd4r1BlwvFGepkE6RmLRzNet4qf4Ki1VjrGPFtsbnppRlcaNIHYr3ea
         Rq2+46XpZSsaiO+GutroCdwRxt9QhGXwSjv+42U58jvDn8qQ9WtWL0W6W+9s5Bt/S6Sd
         3ePnH/0blLEg1dC9UD/3ldgn8ENgtXpAN3MWgECsan6qA2FAq3mh5O2xTZCr7BaxkQSK
         6JrA==
X-Forwarded-Encrypted: i=1; AJvYcCXSzSJbEBfoC6CSM2ZoSp+4TlSAKrQ9xXnM/hsZCtNjaEFTxSTkvO3eER5yDA8ZmsonWbvRO6MgQebTVdJ1qTPm7JTFmO5uqu/8N1gbPxY=
X-Gm-Message-State: AOJu0Yw8K9UKZRU8sdtUZOVFQqwtt3z2+x41+3EFYmeaRaTE6m97uQEi
	KbhdvIHGmf30qDgpXaENur/i/XYVlQxeeG9PzC8djPzHMPME5IulWQpIvgIWj0wo16gwWv8ZkCT
	672OZkTDPiUCHpK7V6dj6WCZO8Q1RUp3Eklyo
X-Google-Smtp-Source: AGHT+IF0o8YCJwyZootm2txwhqaD34gHDzLw+VYz4p/Uyk4KgCREaF0sTQ1a2ev5uipb6KhEUuWEa8OZkGTEaGcgl94=
X-Received: by 2002:a25:e0d5:0:b0:dcf:a4a9:98bd with SMTP id
 x204-20020a25e0d5000000b00dcfa4a998bdmr10530889ybg.20.1710763847155; Mon, 18
 Mar 2024 05:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309235927.168915-2-mcanal@igalia.com> <20240309235927.168915-4-mcanal@igalia.com>
In-Reply-To: <20240309235927.168915-4-mcanal@igalia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Mar 2024 13:10:35 +0100
Message-ID: <CAH5fLgi9uaOOT=fHKWmXT7ETv+Nf6_TVttuWoyMtuYNguCGYtw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: xarray: Add an abstraction for XArray
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 1:00=E2=80=AFAM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> The XArray is an abstract data type which behaves like a very large
> array of pointers. Add a Rust abstraction for this data type.
>
> The initial implementation uses explicit locking on get operations and
> returns a guard which blocks mutation, ensuring that the referenced
> object remains alive. To avoid excessive serialization, users are
> expected to use an inner type that can be efficiently cloned (such as
> Arc<T>), and eagerly clone and drop the guard to unblock other users
> after a lookup.
>
> Future variants may support using RCU instead to avoid mutex locking.
>
> This abstraction also introduces a reservation mechanism, which can be
> used by alloc-capable XArrays to reserve a free slot without immediately
> filling it, and then do so at a later time. If the reservation is
> dropped without being filled, the slot is freed again for other users,
> which eliminates the need for explicit cleanup code.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

Overall looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            guard.dismiss();
> +            Ok(id as usize)
> +        }

You could make this easier to read using to_result.

to_result(ret)?;
guard.dismiss();
Ok(id as usize)

Alice
