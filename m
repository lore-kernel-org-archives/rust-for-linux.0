Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B3817C219
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224059; cv=none; b=PWNwQCoMkgxu5m6Hfp/oKw0oyL2Fb+gLGAq+IVXOrntyw/Z1AoEoK3q0XbthKkmCsvzZ6GH3TKsx4mjiilFwhD25sso+FPFRdhdsaQvgTP64AHx7loJ7T2DJ88uZuIAZ2ndz4TgcbRm1zADmzqEOghs7bC1UHJDmuWe9+4EAsBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224059; c=relaxed/simple;
	bh=r20Hp1GzFhpCB/RIbV1V0m1EgtNA/FHD8wovlCpH5fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSlHAguJDkZysu62k5hX/dzAw18gSKbRT2LoSXrN1tY6e8BTaCpw2X6wodXbMRXsQgEkp667et715jiBkJ/CfSY/q/3TTn/7V3AC9CP4uQcvpCsWVIVFZtzxLAwfIAeZqUOWk+VDz7Z9OR+DixbiS1uZ4K1A5LbPoiRmd4lLnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXZb6P0t; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXZb6P0t"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313336f8438so225385a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Jun 2025 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749224057; x=1749828857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r20Hp1GzFhpCB/RIbV1V0m1EgtNA/FHD8wovlCpH5fg=;
        b=fXZb6P0tKSIddqlD7Jc5mdTzxE8xnBLUDOvkr+ljgwnvjhM0FXQqUMAuJhFvcJzpwj
         pftUwPg9dwDcQxLBC0oS0EdN8ag4WfM6Tuq6bddcXnFXUWqckjeesA8+IhF6feWm7UG7
         MeiSvaF8D+WkIygSocRhwOhEeQNh0fcAyFw1jLnmN+3bhgvUEGoylr4/b09WJxHL4Nze
         yt48rZL0S9pNkJ1MW8HxoZLly8HiqyU0TBVeRvLj1qHJb2jHfrZ/1S+i57I7nfTWBAH/
         ReIJNZvow7izrYNw0F1q6LTv27uW72PYWaqUfMHrwmHYQzYQomR6RWlmMOjmiCTs54mV
         KATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224057; x=1749828857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r20Hp1GzFhpCB/RIbV1V0m1EgtNA/FHD8wovlCpH5fg=;
        b=P+ZrUleepBlxWrahw4decGFufP7a2ogOpHyX/gVJtr49Tbbckt9PBImGpw218OATzL
         h0rg1ovCIfoHe+MCB79PrBwdnu7TPPIkXc0Awb+Rjqr2ZVYupPI7o2kuZ1bPA/ga4ZiJ
         f7TlFCTiFXJXY8jIcpsXm6Ny9X+3YrHM7coXzpXjZ0AlV1zTNZFrzopvM4Nm3bj/OE5X
         0UEg4B5y9C0v9blV/dIaSwoALo2ZFCRLkkQLW58qRR9Fapg4Yhz5aTRCWlt6s2L3Z+LE
         aKWKDIvwI59DxDR7hNYOGCweNajOeiwtJ3cwkkYkkcKqHxHz+Pc7I3lAZTJMAkd6Rf28
         qudw==
X-Forwarded-Encrypted: i=1; AJvYcCVtzpigbdNZnWwj3PQUadcgOX3KyZpogqVJ1GFKxWGAxy/zeaxbUaekQZW0PSj1yF9qd+S6eb9eEbF/+bD0WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wb5eGiS4A3CUfb+kFDAzl2oILpe7dQdW5h2urT0uRAsI7GEa
	Wa93bSwTseIbnmMO4Xsalzt/G7puFM0WmRfXfjmMNxEAM46dLK2cugKzIAUHDQA0Dyq8PKJsQ91
	PruB8tyulpoynYKWz78bayQ2i9x8HSZc=
X-Gm-Gg: ASbGncsDshFF6labWCHWSP8dFA20JsBpPn5RnVEEApSRnnq/l7j7Wt/qOl+hHqjrAZG
	XI9rBIyil1MdNJgnvsLhTYxhBogyhgQ0yGzF9Yj1U9j05dw9n2ppP+/2Wo+5NlSF4b9Xv80n7vi
	ofj8y4FO8Ey3QOllRIBPvzMU+eSoL1e8D8eAHK6li0w5w=
X-Google-Smtp-Source: AGHT+IHkrkto1ZrXEg/tncj0BnR4PldTklC3ypFJ5pdn0wuZFFXwBWG0VlmuGtYeKQJCSQnn8cK0zkY+K503ZWU9rWs=
X-Received: by 2002:a17:90b:268e:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3134e3e4268mr1474732a91.3.1749224056901; Fri, 06 Jun 2025
 08:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Jun 2025 17:34:03 +0200
X-Gm-Features: AX0GCFsf5YfL8zlgXxUFaLqGgUzUPiMxVF9YjBAex17P-xmfcyxf9IYxAELHhPY
Message-ID: <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:06=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Fix a compile error in the `impl_has_hr_timer!` macro as follows:
>
> error[E0599]: no method named cast_mut found for raw pointer *mut Foo in =
the current scope
>
> The `container_of!` macro already returns a mutable pointer when used
> in a `*mut T` context so the `.cast_mut()` method is not available.
>
> Fixes: 74d6a606c2b3 ("rust: retain pointer mut-ness in `container_of!`")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Ah, right, we missed this one because there is no caller yet and it is
a macro, sorry about that. So, just to confirm, the build error is
with extra code on top, right?

The Fixes tag seems right, since the code already existed back then.
We should probably backport too, even if there are no upstream users,
since there should be no downside and it is easy, so:

Cc: stable@vger.kernel.org

Thanks Tomo, I will take it as a fix then.

Cheers,
Miguel
