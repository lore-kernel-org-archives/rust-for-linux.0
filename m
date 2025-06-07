Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842A15D1
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Jun 2025 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291603; cv=none; b=Fe+fD1lFIkKstqm3fW6xQnhbLQ+nN6c72SW93uc7jcIf4EXdyMemqC9KEU56hYgskiY8HefCGYr92IwE6LMmREYOd82MDiYAheag6nQcJYQ4bgGXp2eMkByDYW2ArCALiKbnv+XbY5RwaG3a3t82pJ8XvpVZZpGEFsbIknPTM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291603; c=relaxed/simple;
	bh=i/Bwj+64Ou/EmaOR0WHSzBohn48Qje1LGFiUwUnbNOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0R7mAUEa3n6NEMLXQHIZuZsbuBMpKMT+59yPQgypX4JokXXCd0bHiIHLLisaqE3A11zhfrI3HG9SPElf/csivmGPelUAVkQyLJVYLhZCrVOtd0bKDyeoi2K+uMvm1gMFE2btUales/tEidIPnHb4/4v7HQ3zcEI40YvOfAiSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFgzg29s; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFgzg29s"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235a6b89dfaso5082495ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Jun 2025 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749291601; x=1749896401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Bwj+64Ou/EmaOR0WHSzBohn48Qje1LGFiUwUnbNOo=;
        b=lFgzg29s5JO9QeZs+kAJ1/7ngAmaJh952mMk9fvmCHUMyB1OuLhr8S+2l4Reuc4WZ4
         0f+2olTefqsLhOXAS6H+gPEX39vV9qfu4LmPVR41m6u99LYhkcUnOYnIxviRwr4OEALq
         WwFFZpyX84E9EuV/4g8o7jPcM5LeAk0tpsgAyql9n945pYfQUG5+KK/nBs0OPtgk+N/s
         64ik2jCMma3K8RPKR/nTNH1BpdOpzyot1a6X7MdE6P+ndtXeUjGhdvc8xPVbKmE6sLox
         fj4NctZtJDg4gm8+H+tOUOhAIknLW2uJPMgzJNSlGGmRSYVggVrkMT5KsVwkwvW+Uoth
         NMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749291601; x=1749896401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/Bwj+64Ou/EmaOR0WHSzBohn48Qje1LGFiUwUnbNOo=;
        b=OUrXGDBCPxJ/2NofCxMtlJLlM7dD75BczicwRc/wdqrDXXK8UVlLPg0uYp48qqryPJ
         IR0JqcObw7c2Xq61QzWP2po95TrOUnOsQruzHFit7u2gzbMEvevGfSoqTuDcMPnb3FOi
         VCh0qDAdlkFf7BX9oniVW2Rqu1m/Jeow2VtkCj7AnjDIxBJBTXox5ajHSAoSmEW+Wh+o
         BZOcdyqrzaCmO44W+0WMaXpKjlqgxYCl6lrKTQnXsQojLQOpC7bOnGLNaOuKMBd8397m
         OfnY/Lxcot7hyB5C3MJTWvHYrdQBRzchIRuKaS8GJswpHo0MUFehinfsSELtwt0O5LMD
         MfZg==
X-Forwarded-Encrypted: i=1; AJvYcCWuIaX+enZuwQgfZv6CVuBkL87qW5BrTqUt019w1UAYX/5gzE7vjQ2AKPwqFwp16yvGzdz7I6AvmO2SuRg0RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlC7MmJa+c2L1RVI4Y4iW7WJ2l33EuENO4oN6XXYhJtb3OxvPV
	DBBsMBOw/B3fj94fvXvwvn5e9r4rFxsWQ2no/OMQjILtjzeVYk+u9OfmxdzMtlqDT6inktD7MFO
	b4p6yE5Pl68ueCdECl7oQ6jGCJxQBZBjWgaED
X-Gm-Gg: ASbGncsuTjje/hUW5QT4nOMgunQcr9ezsNUgtQN41110Q2/Vn8OiT/9sq6vCjtXnVFH
	UI7zOR0qzSPaFJFEKkkvlGZYj4UhYGnyM3p0+XrlHSgu+e3Pz2qybQqzMPWOzEla7bQdZDHdF45
	BGBh8Q4iBY1lDvi0hxnQxqJrFZDjLqY2VuZ7PfRutQEYie/bfnlkwHdg==
X-Google-Smtp-Source: AGHT+IE3TSE1lOjC+YMtOvsYDOqvucB7yz5YEtW9PuPWOP06gAYO6PEPAQ55YqqlJk0oCy+iz1pnXDKYnDwPnZDEU4M=
X-Received: by 2002:a17:902:dac5:b0:235:91a:45 with SMTP id
 d9443c01a7336-236040916b9mr28397205ad.14.1749291601557; Sat, 07 Jun 2025
 03:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
 <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com> <20250607.063617.455813499811073744.fujita.tomonori@gmail.com>
In-Reply-To: <20250607.063617.455813499811073744.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jun 2025 12:19:47 +0200
X-Gm-Features: AX0GCFsv79nHtx20kWJ-wFwdiKvhXWMnTp6UWfNlbuzpsxnjqGBHWHAIfEywPHg
Message-ID: <CANiq72kJ0aoa8p7y4hvp21SbKSCkANm7ZNM-1pW-OJO6jh8-NQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 11:36=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> The commit was merged into mainline in the pull request for
> v6.16. Isn't there no stable kernel version that this should be
> backported to?

Yeah, you are right, sorry. I guess I wrote that thinking about the
hrtimer commit, not the other one.

Cheers,
Miguel
