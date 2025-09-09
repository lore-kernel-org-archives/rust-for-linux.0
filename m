Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036283081BD
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403678; cv=none; b=DfNJbB/KuZejdP1B1TeT1dS4pRBSikvoFMPgIm+urC0GP84mdISTddV7k9vKa+j0zTknADAwBGrLe+p8nzghvD02fz3u+rlsHvspFGEH2fcoryvpH977P8q93O1Wk4UU1cU1ZfG1j/tnCIYof3moeiCYcIUBoV56lUlFTpJ0WdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403678; c=relaxed/simple;
	bh=mCe2NoIOzspNZQbWGoTFtZVQKJ/SMRKgPfNPuArYuyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEg3EsZB8q5m93RMb5UW2O+/wjXtXxtvQYkAnT3kX1i3FgR2Gu11dp+2VsagkJJJc6G3yE675n/6vo/BegtI6GXmQOLuaT0E/JFmSG9vakkkyDQjQPU4JFAL1jISCVz6k+CjYwXI8EQV6R2FSAu7k7OXUAzsQmZP/l4zbH5dnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZj7xuom; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZj7xuom"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24cda620e37so11292785ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757403674; x=1758008474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCe2NoIOzspNZQbWGoTFtZVQKJ/SMRKgPfNPuArYuyI=;
        b=ZZj7xuomdY5IeWpJ1uc1BqXWesaaZvpUbT10Z6MXWZgLky1dL1LeVhJ0fuDpiD+nqj
         8v3937EXfWDw6YpaeeOAf9EtsCUPl+/TqCeFE6e8HW0Lo2irEsHZJww4XuhFCMOVrqJQ
         kPgwVAWtD1GGiVPZrxhI3cxI/8DeoKtRM6Mj55fBWZSiiFIrwVX5lCaZ8mW+s7A/MBGS
         +tUePsgVKbVdnSrCYTILsMKT3oJjvflJAfpdG3JgJLWl0exh9xkuhNB4iok+3+Vv2l6B
         5UJ78PG0b1OOmoUZmT1Lj+zy2JAqxkB00PYuaQ5qRP4mwa0eY2GMxg3ksqi5I0mTQSYC
         0l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403674; x=1758008474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCe2NoIOzspNZQbWGoTFtZVQKJ/SMRKgPfNPuArYuyI=;
        b=fAgGlL5TLpMuRd+7sElMsApXI6r8jJiRpmpIn+50E0Q6KOj/DbjdiZs3/DKbMbsdp5
         Ce8dgTIAkoM+Zadz+LTJJzGEp/KN3JV9HbKYZ3aX/JzEjcI7dzcl7bHW6PFdx0SriuLs
         x6l7KkkujRuSiuuBQI0V8aXhra0aT60cJM/mwccUQSRb9gkd9UyuFl1UvZZ78dayStqV
         7c3zAYmBVfhWEGWh+zmCZIfaEVB2yju5K4EBKS1yhUOl88LszbXld6nqb17M8UU0BCA9
         AinfzLcmnFW/CIDe6yOISjlDVB7i1/wWxp9iTqTdFvgV16OsivO6HQpBAD8jBJiDzPjQ
         rvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGbz+kFBbmX1gB0uyLGC6fWmsq4q8iL5S3BYUIRZ0qSjL/7P4mi/O5B/RKRqK3ctuvVzGhcrB2CYbylauayQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Xwqs6q5mGF6t4BO3IinUF3xJNXBUgfJC0eAPyi2wT1z/msN6
	A/L91sIfLoYugl7Lo9FrZEiZo9eQM7NnkCk1ZK1juEDo0crqxpBvTkAyQ8yil/YjvnyTt3It4nl
	lExlE3yJssWtbutY/6NCnZ0Jk43PSd8c=
X-Gm-Gg: ASbGnct87505N85mai7hXtjhsTubKhIvAexGQd3+CZpZwlr8hlkaJBjc7t1BdIOeeI9
	B16aJ59GoHN8UGMN6DtQeLI7lA4A83r41uG9qAIb9q7LvjLg+zAJlo67c/8sYlFaMsZh0IoXEjU
	cbyT61XrrrY19SpejWQDcu1GWEfSd2XNu3H0TRZZ03/zJTa2r265/ri3TSrrDy8zMthN65TW+sb
	TJ/ws2iXZhA2Hz3glmcUeSPJ7qzmxqwP445kTJFZz7hfO792CDf7+Zqjcw0NY2opgbiUIqa5uBZ
	B5pX+Gu01jvNOelXewYTtowE8IL1WyzHsBOK
X-Google-Smtp-Source: AGHT+IEGuGdElEOpCf7auHQX/q0SITXnsP9j9+YEcmIcskucUh26FQ7it3p4kI06zfGAdQbHrxVvfGd/OS+fsYIlp9U=
X-Received: by 2002:a17:903:5c8:b0:252:e03d:476c with SMTP id
 d9443c01a7336-252e03d4954mr49541125ad.2.1757403674162; Tue, 09 Sep 2025
 00:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com>
 <CANiq72kJxwEncXVVrZoMyjXrtsJUGf+kamz0G+d2we7Fk1Vp6w@mail.gmail.com> <CAAofZF5JbC0=zKMXRDSGfbLaZ7y8Ems0x-5GEVADkHJyY3BkMg@mail.gmail.com>
In-Reply-To: <CAAofZF5JbC0=zKMXRDSGfbLaZ7y8Ems0x-5GEVADkHJyY3BkMg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 09:41:00 +0200
X-Gm-Features: AS18NWD-omM_asMFScQ6JIByC2XPzhEOLPIuAYb04r0LC5uWBf8o3Gkb3SziWaM
Message-ID: <CANiq72ky8snUu71Q-P+reuNtUtjUsa7pOjzFeiNMQ0kwk5P0jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: replace use of system_unbound_wq and system_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 9:25=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Unfortunately I noticed I made some mistakes not updating the cover
> letter accordingly... sorry!

No worries! It was just a bit confusing :)

Thanks!

Cheers,
Miguel
