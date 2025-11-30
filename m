Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A636D50D
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 23:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764546658; cv=none; b=Fui4a9cWqt6sdBuzXBnF4+qFJdTAL0hWAzH6JIa/TlkYnb0pLFOVKa4kfHI8bVPFgA+uhYF9nhBQ/PzyjdnTevIcG83j2nyKT+jxeHKJfcnOkQPAaqY/YjzoxbmR8n+iHm2YFgqFcMYhI727M4d2E8O94FT0qifRWphBrFwoh+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764546658; c=relaxed/simple;
	bh=MVSWYEfxFHtIDzyQlztPeSPHAgb2EyjhmiA5e1coyTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaIuXgZKj4T59q44FFT8c06qaV8GUMpsTvKL6t6Xr168KSyXpMn4mMEBu3njjmugU9TY9KPXdIdyrr2Q6LQm3IunYSqlc6CCe1G+JM/+B1JQkv7l7YyKGXgFGWXC+t19WeS+u3kCKH1oZVvNgVAskz5UVBp1MrJP2oigIXL28Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8hZjEzR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8hZjEzR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297cf964774so6016925ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 15:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764546656; x=1765151456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x583T66YrtxxHir55ZZs2VU85jHtK52GUMOLX9aETN4=;
        b=J8hZjEzRJ0uiIsUOCSRWDukRX0ve1nKH058gKETTsKgzYuKNBqp2z0g6jfeg4juVNC
         hjcdYI4s1J1XNsfnnc9TG/eX1S8Hb2xmzCYbRMrnpGI+cy/0UjZNDK8xgxpgGDq61Zc3
         FfHrVwv5hejCiHhZMhwr/nXuIyrJt9b19M39bpiQtQjDnN1XaJeEPM77sRYQpYYopY6i
         1tBrqDDODBdW8gLjRf6BbUZd+IcDGQPf9/q8qjFNj+VxYrudjYPlIz/vkPPWt48WBaBh
         TpxlRtmlxK7Jd5ikwRhk/kjb32y8nKnmAUR6KCp63NtEmKuAT3K2dhKUMODBEGh79tu3
         FDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764546656; x=1765151456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x583T66YrtxxHir55ZZs2VU85jHtK52GUMOLX9aETN4=;
        b=ExWbvG8/CpQ4PekxfV+fcG4tUFwzWfll5d0E4CA7aBzkIStrtTW7sbfqDnOj44zrfm
         ZTlgYBKDDw2lkyCfTMtrmvWoptWimD0tsMqXmcoyXesD2TJCMZrAjB5YAYpasG92tHIn
         OtORfZagMrPnCfiqiwYfolajJitWOtshPpGs6vd1lXkpvEjUjmEVyFjfNVeotsUZMtOn
         UR8xQ19SH5tzuwapUarFbxkbHe+GjuC7ELhy7n8OcJCGp1Meh7od9qa1TNS+uvcoC2OE
         5GukU7kH5yXUAcEfELFLzjvO2TD2MinUU25dfallU2aSL14JnsHbfVh017trpGRDRSn2
         GRSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLoui+y5FfjzI9FO8KlQqc/IWqZLc28BUTeyT2a0VmD9DfjkhcTQslH7Ty7zqwlNosDrfbsBvlTQG+fb0SYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpWagIUiJa//5Q7oBisuehf/o9XxaqseagV5Xf5/iwSQPsfuC
	5A9Uxeu4ggbXpXPXHJzhjy7zatK23mk7SPfmGlh0rhQWqSq5cpzmGPy5GDQufzIe1qZoGna6h5V
	D5Ca4iSa0xYFR6Rse6zit+I+SULEfIag=
X-Gm-Gg: ASbGncvpL8q3EwO8FEcRHgytQ3iOzDsnWUIHsbe57/UR4CtW7AJrEzK2v6cqkvYuGmW
	komKNY9Pl25b1Gaq+amreSScldT2CIVH8RtrOmpU6pzkeZDeuAlQxw0/8woydsVOXKbOdpUoXkR
	7MrU4Rdd7O6gX0ujAEcnW6Jlk+xY87R4wKnA4AOmGBxRzz9PlKq0mdMxisg2I3rz8GB06jfMFhz
	BQx0iMw9TMhGey5jo9iDif+btcOzNaJIF6H1RsTeoO1u6XHvj490YiAmvgT8QQ3wFL+3kjjTDGJ
	NQJEZbc3KkTFhlWp4wPw1YYAU/qYXEZUyG5Hl3w7BP9Xs4J3BEak1gAKmlp6Y76VWAHjd1/MT1h
	+zEYHFepf32oD1A==
X-Google-Smtp-Source: AGHT+IFjj0wBSHTPcgdtDw8HUrYf0Sb6w5WtTamwagf04WOQHqHgn7IUTxuRuCwqxIQz9lpa30Eh/8OKeJ86AFwyF68=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr20287923eec.0.1764546656377; Sun, 30 Nov 2025
 15:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130191535.77498-1-mhi@mailbox.org>
In-Reply-To: <20251130191535.77498-1-mhi@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 00:50:44 +0100
X-Gm-Features: AWmQ_blbrLz58FDE5DritafMbXjkKk7PcVse5gtSVeOhdY0_tr4DEl-OIxXMg5s
Message-ID: <CANiq72mTnNOfCHv0f_ByXV1UTgF1T3LiHU4vCTFPN5fsEniVGA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: Add message to
 sysroot assertion
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 8:15=E2=80=AFPM Maurice Hieronymus <mhi@mailbox.org=
> wrote:
>
> - Send patch to all people received from scripts/get_maintainer.pl

Thanks for that!

>      # Making sure that the `sysroot` and `sysroot_src` belong to the sam=
e toolchain.

I guess we could now remove the comment since it is a bit redundant,
but it is fine either way.

Cheers,
Miguel
