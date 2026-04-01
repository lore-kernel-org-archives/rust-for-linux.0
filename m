Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D82264D3
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775073079; cv=pass; b=YJPgi+LhKxFVgB9fK0F2RSEQPnvIXN796Tk3WrX+oFMxdIBPXTY8QjUZ1o+Mnx/L8/IC7WojP8lVdB2SDLcJf6c71Fs6iZDIti+amEtUAyplzUGjWw/XWf9TSn/yy3IpTfDG6KVEpCU2EOqGkgsQ1jCQ66P6ydCcdRimmWzplo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775073079; c=relaxed/simple;
	bh=P4LWbaJqEoUHybb0vM9JAM/mN6MFDIdqrzNqUCWu8sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maGS5C6B5qgdUQMxSDZQBqT3RjMGh2b4kULqQ2blSM3VipUxUg5LJXrzkyUXUE7ueXl+nKnaW2O/cUtDvq40KbDEePVLc62IvwqQReI1YOu9tlEERobY+XhCM55R7myaTe7aELWbCK892SIKeIvdnh+Pr2owmEBIphqVeGut6tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ibtmBs2o; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ibtmBs2o"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so173238f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 12:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775073077; cv=none;
        d=google.com; s=arc-20240605;
        b=dc2q7kjJvEQNP5LOJ+IYTtRKEU4Rz8HEbJKVcb/BXuB7RZIeGjb/3gxY7yq9e+COGe
         EeSYtSvJAcq132ZWAGX+XWU4sGV9xx0bGLRK4uOipZykNBsECwDlXjQkOuTFxJDF8sZu
         0RpiDp02pvTvzVKnLdK94xMIa5taPpG+B0LKp5eoF4rbsEOn6IhUD6DD45WD4rMJwkiD
         Q4r1oVMMe8scsvcYr3eB22oHm411yhk12FQpXkg9/oKIDicApZCLOQl8CXWFAQ+Tlr+E
         ULtj7AXc8Nvp3FEJLfkoobPJASy1VTKaiWEkuYMcDxF5QuQIMiNW/Zy6z4rM0LzSh9Kg
         6JRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4LWbaJqEoUHybb0vM9JAM/mN6MFDIdqrzNqUCWu8sE=;
        fh=UpFiid4I6r4fXfU9LWPIRo5iZyMVuszq9U8SrGqRZnw=;
        b=gbwA/Q5jyY5fmBqUp1dNazdypf35f4ubuUhSDvbW9HF4NtSBbg7sptnqKt+pO2rxb4
         GmrWU8B2M5qL9/iNjLwtsVVqgSE8lPSoskUrWLTFRZeTuJafs7x09UUITBlBBY9E+O9d
         P8emCgB6fZxufbBMCizCFjId5lfiE6REDvWL8jtE9ky3pg9/bHukwJh8m8SGTkL1Eh9J
         vPuUSU6uLabNjPQpjdtgcPoBm9X7b/L/QtSQIgu6Hbe8JAtpQkFyG83wRkGVzmsa9Bu9
         7x2tGhQ+oC+VGwOfDhWkvQfFznDodC7b+iGxE+Li3um2d9IjqCeaMFKPcpAqfKM8gj5h
         bSVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775073077; x=1775677877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4LWbaJqEoUHybb0vM9JAM/mN6MFDIdqrzNqUCWu8sE=;
        b=ibtmBs2o5WuvW/nKrMU1KZeGZb7p8PvuJiIrZwhyeZY8FuzpgwupbymYt/9BBbCE6G
         kahkHA8g3H6qIPznKUjo1xVwITZ4PSF4gYZDKT1YVKXSI/8gvTKytu7L2BVTcQRdvjmM
         UWdpf3XPVsSXLyb/bQct2SuvNjzznpUonudbd0XHlQQNs4rsjwmJsYWIQQ/mfn+JARtk
         vzA/9IpUZ7SmggOZqizXQZD5o3ru1V5IEhYZ2fy5erc23LC1nnBeHa1iyFI1MlOlPUoy
         Ht1alE9BzCn9bA+kX2gWynxCV1O6CNGY9mWLnXL5wQjg6iciodIVleztTez6HfTR5tf5
         e7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775073077; x=1775677877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4LWbaJqEoUHybb0vM9JAM/mN6MFDIdqrzNqUCWu8sE=;
        b=If1CpxbPUHtolz6T2I20eKc16wZXG3n4zTwEX4V3v6fu0VkymfV6BcPnoyI412K3/a
         1qYI4sbRAULBumQZZ7bISAs/loODkC0tdrcZWpVX4cWvlmKfjqmWKOdDwzSlVfoAQ64+
         Ki+gBXbjIZDqsDXb2ElIwMgl0qzEZVGXdeJQmMBRjdlAOjY2qAQ6KH6xCBvn9QDhQiJF
         MJuKnjmNcqt5EtjmVPxDJ9YiNRDnPCYAB4FFG3FJCxasWvSCNRjj3Wt5uL620rsqhve8
         orl+29YPW7Z9G+tEYxJNENAI/LAphef6jlO94XhDcRU9g308Ww55C2Iu0b8sc9rMTWdA
         9GBg==
X-Forwarded-Encrypted: i=1; AJvYcCVBuSgiXAlBqJ8ARVPvGKblnB9/2srbK2DQJncgI7eJ+plVzuomY5rlSn/0wXQistSe5E8FeqzGH0IwDGxEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7TfxLRxX4B0vzrQOFpjsYnyERP99kZrdk5txcq+9tuKfLGWn
	4Dk/D0Y0juwscW6cKwcPdV28SGSaWRx4j9PHa+AorMIBHCOveJ1f587ETRnLCqYaRVceHgSkjx1
	MkwbsSzyTvAoPntne6C9Q8LBOBZg/8ZPNAjFZ2E4V
X-Gm-Gg: ATEYQzyu3eeEisUrTW7Ta+4wGUJ9Do2/r3OkeWEJVIZ8r3VdOPAmx6pjZOZvGNwkQ5Y
	Dk80fywiX+PdiYA1s1FuY7cMNpNsrV6fr/bsPznLD+w2YNnMdBiAOMNQ2LwGgeBxwctOP4YB6lQ
	hZel6h163YVdfdmxVK766rVFJQmKzFNN1e3Kdu3+ignHulvpbfdfBwStx5J71QWrPCm7E/NXM/b
	ilN77/IBw535PoZFFUzPRvJF3SwRkc2FDpdDyZSCEKocPrLh6zNYz3zHz0pFTcalUKAT4WszNxN
	fnw0jQOhJHTIprm8dv+QegN88fUadCHnYjcKbw==
X-Received: by 2002:a05:6000:2409:b0:43c:fb9f:150c with SMTP id
 ffacd0b85a97d-43d15102205mr9343830f8f.43.1775073076336; Wed, 01 Apr 2026
 12:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329104319.131057-1-adzicmirko97@gmail.com>
In-Reply-To: <20260329104319.131057-1-adzicmirko97@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Apr 2026 21:51:04 +0200
X-Gm-Features: AQROBzBQ7aqMhb7vkhizgv73vdSDnSYwLJgxPSmsSZaKXdQ_X4EoOQg3xOLF1-A
Message-ID: <CAH5fLghYPQtSVQncBpWizSdWFYutByELc6LynDGaB-4RyEHXMw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
To: Mirko Adzic <adzicmirko97@gmail.com>
Cc: ojeda@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	daniel.almeida@collabora.com, khali@linux-fr.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	alistair.francis@wdc.com, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 12:45=E2=80=AFPM Mirko Adzic <adzicmirko97@gmail.co=
m> wrote:
>
> Improve the doc comment of `from_err_ptr` by explicitly stating that it
> will return `Ok(NULL)` when passed a null pointer, as it isn't an error
> value.
>
> Add a doctest case that tests the behavior described above, as well as
> other scenarios (non-null/non-error pointer, error value).
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/20260322193830.89324-1-ojeda=
@kernel.org/
> Link: https://github.com/Rust-for-Linux/linux/issues/1231
> Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
