Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95236C9D5
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 23:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355631; cv=pass; b=DvJUVq7EX3/AkkKjjQpxwsc3TQ9X6IZeFAMEsv9xXm2EiMreNUBbk2CMVV3J9gdP5Cyp0yThBrEvjqT328oagaxU12/Hlf0A0E78Hjc0ZvAJwrsgTSvGXWiY7yMFGiDKXRLg0ZtJgFRvqvs4KgRROzQQWTp7jpZKR3+NdW1XAGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355631; c=relaxed/simple;
	bh=aHqU/GAv+Kwj1BqBbcVETpbD87Fi+TBisbMXFFy+wTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7/dv4DCffpk2HGir+WWBdOLvEq6uioJ7k1b3/3wl+OYJ3THJNvVGpaBHuruEahOWnUOtUxQ/nV2iqj67tniWYTNLj7OmZItMGF7qDJRw4l3r6I5QY5hxx0323CF62E8Hmm3clYkrpKdXHqHdbZgeMKU7sDb8BelXYL+dTAgAWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LnIjykco; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LnIjykco"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c3184c71so13043685ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 16:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780355629; cv=none;
        d=google.com; s=arc-20240605;
        b=FIKCUrIWxyHcgtZ2CWVoUm2OtX5Fti03va4HWKZOUpWB19WDeq7RVQ8YrWCkEG6tdR
         rLG2YD2Ea8cFQJfyNzYrP7mu6oCd1g6Y8eA11+5ybNcK6I6LXuVvT34EQuxafuXisob9
         kyei8YXTkHYJ7tmu4bHBYgH1id1DguZisOO0bAZXzE7kwZppr7K0bBxJVGbeq2blqLMR
         UsmwdBvcslgkbDsEu6xDFNHCKyQ6+tjp8e55l+uQFlonDRaFMU7cvJzb50kL90qE8LZV
         yuT7y/fLtP5A8Cw0TLM+jQ51X8Xb4BtdDRGsJDlCcmXwV+D4j6ZkkCNadod+bYAatBsN
         8Ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        fh=76a73H2K0mBG9dExp7PhkBSvKzSu69LJPBfLCwh6M8k=;
        b=dyfAGa/vKfCVlatcT+hKi6Fhgbw0m50PhItjpwffZU26mvRFvMwE7/7FNn/Dro0mMR
         zry5ERgiwcmAZw7W4rFKG2koa9clXbhAzQpBjhJpkR7IYvBj/9iwULo5m6iWIT7pwWj0
         40J1KqGs7KPBaRLOIa6EIHR3i33RveU4GK38oo73KDfMIMs+4hud66ye3enUWBLy44x6
         V/j3NzDLNTBVVi69SLqt2hlx3oIoSmCg9KtPMUqy+3B9m10lRLT9Oq/P1TbqlahAOVPe
         +IfDRazbOsPkhyMZLLAlK+LqS35ZyHCoiwsLDORCDe9Q/ae+XZK5D2q+9+fIBSRlPMYP
         NrNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780355629; x=1780960429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        b=LnIjykcojR6vyy08kHpOWVWsSFeDXGxpMMVde26QTGOjhFB60YFvmGgjCjuRfUuzFS
         J4NUevoyFi7xAgvDJeQjjRAuB3AxsbOb8aEkXZomD5dsOvR0G+tPFCCr9dkq0SLSz9TF
         YxhMcpdgKDKOjSdPI4sB4izsz9o7enwjLhNnEs9sdz8UGE5UEYeImQiB0DoIuLBf2iy/
         sRwWZKExf4h6mEZ92zOV9P5qXShSzvqGWFBpwPO7+a1/jXhmZuDSd9dsufalQP7hokiQ
         g771zr6u0J+RySuiC3tKdFp86Hg1O+1juFHYhY8i2pM8vKXcpaw/69fa7eG//m8ITQkp
         nA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355629; x=1780960429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        b=ewvdlRnB3fkha10vHyn7bPJifAxhOUHWjs8piouRgFILLMfQMJ61Zxdx97EQHh3ZxC
         NgNNSnHhMxeDAQ7uPe4NTY3s5Jn21j0dNw6C5XNNi6AS3c4gpafA7fhmr+QOKmrtIOQR
         bhzxaj0hAV1oynANeIx+g9MwTl8RVfnwh7dR7duJB4geEMwSNy5bjhK6+6IASsHyWEAo
         oas2Dm4a5SAMRfuWnPYqo1elVOTJRRh8Jr8/4QT7fofsKHY6iB4AWF0U5zw9Q9cXLtVC
         hR4CM6pE1G93uue7JTlOP7Dfu4iYgBePTq2hc94wqLDXIYDQvUGSkBcuuWwux9L/IMDa
         jJ0g==
X-Forwarded-Encrypted: i=1; AFNElJ8C4tsUmUq8YZJ3V81pRTHHBqVDPSbCJG6xcpekYDALhbiNeQ5rStVpaQKvb3we1dzyG6m0jxtBfG77+X2jCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9yXwo3S2pRAPWEtjaD07anT5MpyyWvKQtikVP7lBl3AbHgXs
	OFrzyJyGi1einfEupWvlXX/eAIwXCWqzhIGhlU4IFUDX43xsDPYCb7js3pYZGXJz67E30zZdaCi
	hTRgjyyhchKut1pLhj8G3f56oUzutcGb64dLf6JY9
X-Gm-Gg: Acq92OFksl5dvO0k8DheygCwnz9v0ZrW3mcvy70o/Y1lILZ+l59Xy+dzDjZ+NlIvwtX
	3mztuz2avuK+stv4//Xx51avsBgsTP09ONn5ZKgKkwruJlQ0Df0pL29oKonF/Bq5cU0PCTtvz1r
	0jltmW8VWkNP8WMpjhMFFKBJsFG4waCi58rd7ZZgOheTD0vCWuy5eKR6q0JQ+G+Uh4tmxgM7m7R
	jV9XtObeA1hSAPVIMmTQzP7R+Wm9B4LZKSvIQdF9UJfFrYSW2dCj1LiiewxUw+CtGxS5UAV/SOu
	aUFAcK7IJFOwtCQk2iJyvSosjOjM
X-Received: by 2002:a17:902:f64a:b0:2c0:c940:dc1e with SMTP id
 d9443c01a7336-2c0c940e206mr79129685ad.20.1780355629409; Mon, 01 Jun 2026
 16:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
In-Reply-To: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2026 19:13:37 -0400
X-Gm-Features: AVHnY4L0VLMjaF6hJi9yQFqw7kmnIWO5yk2GkkTGfjEcklH1ybYU-qiacr6meWU
Message-ID: <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The task_euid() method is a very weird method, and Binder was the only
> user. As of commit 65b672152289 ("binder: use current_euid() for
> transaction sender identity") Binder doesn't use task_euid() anymore,
> so we can delete this method.

Given the problems from last time, it seems like it might be prudent
to let the commit have some time to "breathe" in a proper release, I'd
suggest merging this not for the upcoming v7.2 merge window but
instead waiting for v7.3.

> My suggestion would be to merge this through the LSM tree.

That's fine with me.  I'd also suggest updating the commit description
in patch 1/2 to indicate that binder is no longer using task_euid();
it currently reads like it is still being used.

--=20
paul-moore.com
