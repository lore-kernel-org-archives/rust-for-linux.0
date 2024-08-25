Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9901446CF
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Aug 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724590235; cv=none; b=Ioyz/iqysnCq/EC1KcWVPb98N/6Fq/mQzGV6A8fARGXLE7hbvD+xu5iwXm6grSd++wqle7MKk17z3QIN7X6vgf5yvE4O66B8Wf9bHVN5AsO9ow/ACQFZLzb15whJNBpywfv1NuazChg/tRFeHB40RHUSE+nowDy3gfj5b/qe0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724590235; c=relaxed/simple;
	bh=+UufKnrGrEbbIjcJCMdL/W0wTPL2ASO1WYCt6iFHZPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOo1aE2gpoZXHceiltugYNlGdrWNESol+annJAXNfaOMUXvh2id65CoqwzJQqZmF/pdoM2OsQkTyFjoYW4WJirzvgXL45257A9W2whtnwUyApgFfYqc2LQ2qI95BKvBO70kzT+D6o2QMQLm/5qlxJswIfky+NkVolG98ozV9pkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1Ey0rSZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1Ey0rSZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d3d486d8bdso666289a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Aug 2024 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724590233; x=1725195033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE/dpX2ctGzdLY9jD6tywrg2K3Bn/BcL4zyyj4tmcPg=;
        b=Y1Ey0rSZnVlZICX1EMM6v6Lqb4enLZg/KP0T1IY1pmsy0wJZaM5DpkjjMM2E4mIXPc
         OPv6CATdqxxP3xkOwpZE7EeQEiIQbkpA/9F3/d9NGi4guP0aU0hjai5gExdpavUSVluh
         hW93Q63R67/1/86sOLUDaHTVmtFQxCoQyKvr/LhNzwK0QeWuvxZt9WJRgqXMDrr/5PeU
         CW9gPDTlXCwqLYF1V9bifS97XRDTI1BGgaTPNFk1HxovE/3RCQBHHFXbLJ9H1NXdlreF
         ycUayoWh6+v4P51IrXwqSwbGThUGV292hrr3XGA/tyz+XO2YTPZnYR7SM6RZq4lkGxEU
         OdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724590233; x=1725195033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sE/dpX2ctGzdLY9jD6tywrg2K3Bn/BcL4zyyj4tmcPg=;
        b=H4ZHjtAVuwehysSoaY6pjq6W3qbDfEMvzrKrq/O1aCimr0DvPkmrl/QXp6J9zZ8fWm
         yCO9FKcRn80FqckmIG1co9JzHIqiC+PtpBLm12zgB6fuZAX68eU4xsvxklekKw6QUBFX
         wzZhk0BjhpGXoPPStdKt8gkc4kmh6hC7GTPeo22VgRarPWCID0J/2Z6Qo8nmPHHv/TKL
         LWy8jqS1CYVV0N1DJBldoBXhRz7iJ5TATCOxAMbkU2+P5d5RrK1bFpmjDqGRs1jeMiFO
         L15gcDEL8OfBeqqnzeN40SpBsTl6OGPUVZDfkFaAl5OxuKKsGP+zEdP7DzIqYPmJz90y
         LGdw==
X-Forwarded-Encrypted: i=1; AJvYcCXShxGCH7d1sgI1XGyMLeTuT4XY+urGh5bL5SLODeGel/xFJDvNwInUgIJAgVnnh9dHXSU7Ffxuwf3vS5BlDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1hm0W5ukcB/g/XKmc2xpxFrTEee+fCeBnglJPS+TxR2z8POQV
	LJGplbBVCLnIWXZOWqmNy7xVzNd+pwRHXCBXT56SgJvF+3kII9luA7+Yj3p1Ith2QrWdD5io3TF
	JuLF+UzSbJy6MWWob4Fdu1VsT/l4=
X-Google-Smtp-Source: AGHT+IHATZjabKJDxUCGo8RppD4QbA2purQQtbLlFaYFUBXYDFIWg5Okz2A3/35nh0bjk+U5NH8wH7YGSKWFFQLdw20=
X-Received: by 2002:a17:90a:c798:b0:2c2:f501:20f8 with SMTP id
 98e67ed59e1d1-2d6465fa848mr5188418a91.0.1724590233135; Sun, 25 Aug 2024
 05:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820072643.29210-1-jubalh@iodoru.org>
In-Reply-To: <20240820072643.29210-1-jubalh@iodoru.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Aug 2024 14:50:20 +0200
Message-ID: <CANiq72kNTMb=W5aS8t5fnudRk=_8m4POJWR3ifzVciry0VyU-w@mail.gmail.com>
Subject: Re: [PATCH] rust: link docs.kernel.org in documentation
To: Michael Vetter <jubalh@iodoru.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 9:27=E2=80=AFAM Michael Vetter <jubalh@iodoru.org> =
wrote:
>
> Link to docs.kernel.org instead of kernel.org in the documentation.
> The links are shorter and cleaner.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1101
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Applied to `rust-next` -- thanks!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
