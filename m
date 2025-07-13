Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D812CD96
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Jul 2025 22:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752444275; cv=none; b=N9ol+YPnTvNWxCpfhWl+C1yuSnMkoNA2GlysbY3h7V1ug5cblISqtB0AEgH7tRL0CmaWnCrU6TjcpHJW5J46zv93lKmtrQWWmiGBPQlITAOBBW/1aHQKdtF7HJkXHESMIFESKAMcZvgQtW/azVYwK+EK7xgH5YJvfL2OseaiA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752444275; c=relaxed/simple;
	bh=1pqw8oRxm6147yS8WlXE+ka5UG/bFAYp/KAqGpoiK8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3KkZH510WdI/VuWCWbJeaw0hkwqd//fEWC7FaPzueVdsG4mF7R8Arbykn/KzoxFEui1vbR+sqDlLPi60ssoxM39wPz+bsae9dIQXKwQ2xJBzF7QYQnUoPPgMZtEcsLFYuqtZ8MVX+DRNfLdz71/GkSnlsSkQ8B2XV+5T9XefXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fueJLWwH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fueJLWwH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313067339e9so734070a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Jul 2025 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752444273; x=1753049073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pqw8oRxm6147yS8WlXE+ka5UG/bFAYp/KAqGpoiK8w=;
        b=fueJLWwH2qs4Kb7uSKlgJ7YIxfqSnkbkgoZ7vcW4tX4nS2QLmSGc+H07fCsytrvv5j
         fn0eOFVo4J4mqqwIVrHgB2ra1XqzH8G8rU2oxWQabZdB9cEuZ6GXJqGiRJnYqNRZKOmT
         wV4U0vT4zi1ImONidRynklYnjaR2b2qumvaos5Jh3m3wphe2W1cNNk66SpGUwtAO5TTv
         Nz/XdQwfaPbzJCkoUz+RoxV1HS4c4ML/i6SG1wMcUZgTXy3KAlny9H9t+qamr3uoW+C+
         vBFbYWaEIu4I20eISrBosTyKZ9evqbyyV993H7VZz18qVMBqQ2sgYQBLXGlTBbsLERYq
         fhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752444273; x=1753049073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pqw8oRxm6147yS8WlXE+ka5UG/bFAYp/KAqGpoiK8w=;
        b=aJ0NKPndo0oH0iuwOsqoGuwHHdiYaN62Gje3YF0BviGU1Hd+5ZDEuc51G2ilaniXra
         U+BF5jKwEm7sZSdUmKZPaZuRxbG13LWaRH7VFWawFEs5ftghJP7ej5zh5XtE0JLskEgu
         wYxSnOYvW01UiPlWy7DHSDNZpltQhQ8dh6VdfVL/jYSqfZ6KGRWsfgVzz9fB/92I6nVd
         co4yib990MeAF0i3XPzSXqBE9vsjvErudJN4cOZND8V+iMETq2ecPSpeMdaQ+895+OP9
         vuRiGt5/k7i9rw5XGhqu7+CGEmH885PACKNWGCtrDtdezmDFbBobt9Fld2RInJBw7do1
         XSZA==
X-Forwarded-Encrypted: i=1; AJvYcCXe6OyUyJH8PCrqZqm4LECIxEbfxYEOX+hE9b65X4cqwKOgR4arLtrvKK5nAzvfoY8jCKBlyPE/8ebGFQxU4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SfDxcOs7Sc8vFy6UD4hnNQKMvdaKsemxs7A+n7GervLkhrCg
	u53AZKjkVdyXF/XKsMAXWk/oe5G37bDrfmb+GckTku0/MqJVOxbVRsl2Q/JsnPIwzZ92JW3UhfO
	BVj7ru8xH+4jS0N6nTRpalBcJr4J600FpSZb1
X-Gm-Gg: ASbGncuAgmFZM5TsSAgq0dKv4JqHfbJd3ZFAfFZbPeG1I4UDNoI5piAKsdns0AcmtNw
	UIRhFEgMD0HX8tiLLy1/lilkMl94lStAndplNQnEngwBH0ppz7S8H/CMXPVSMIz/82/COQPDN5t
	fzzfu1wctDOJxzRHmM1LLacAT1WZIv4xQO3Q1IOWBKy3N9racxDPz95O9U4+xMswkWwitC2ekYF
	qMl9IpV
X-Google-Smtp-Source: AGHT+IG6A69nq/YhGIJy6pYXCaYPqRZm+xy9zuUoWO0TsVv1AfbV8mrvK+HNsoeltvvXdsUpjjE9YXhKXUgjoBCo7VE=
X-Received: by 2002:a17:90b:554f:b0:31c:3871:27ad with SMTP id
 98e67ed59e1d1-31c4f34f822mr5843179a91.0.1752444272913; Sun, 13 Jul 2025
 15:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87qzysqw99.fsf@kernel.org>
In-Reply-To: <87qzysqw99.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Jul 2025 00:04:20 +0200
X-Gm-Features: Ac12FXwS2tc6ooMUmlu7J7wI0DAlJNcugovDwREiS0ffve_J9zJyPdA6Cq2RmxQ
Message-ID: <CANiq72mP7QAjnYuM44tu0ZaviWO4PNWV6Oba=LMwh8=FxJJU1w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.17
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 9:47=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> ----------------------------------------------------------------
> rust-timekeeping for v6.17
>
> ----------------------------------------------------------------

The description is empty -- could you please provide a bit of text?

No need to send a new PR, since I know you may be away from your usual
office these days -- I can copy it from email.

(Worst case, I will write something myself, but there is still time.)

Thanks!

Cheers,
Miguel
