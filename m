Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6B8460
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238593; cv=none; b=GuXNU+Ov57HioznIFlmcZ80MhLUJ9HuzM/dNYx9RnnMTnCRkuAZNJIdAsLUkOmtddJe3tz2b2Um53ibXNK+Vh0lSxlg7OYXrXZP+cwuXfYMR37oJLWr9RtElvHMVSOJscOBIOoUUBvKJxKZ+XAZqj4DBbIDoYjs0T87LK9GaiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238593; c=relaxed/simple;
	bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xlg/qjmMb7JWV5GFYOowjrC/9V/LRF589Zbh4Zt5RSa3OLbBjcCvw+QZyoTlaHscJQyR3G+ZLURkEKt+f5h1H9WFTdAMw0GvHqZIf7/oZfWzLjMrjeqa65v+M+tPkVrBAChCCgXWe++A5DUwK4wSsm5joCjJ7Xdp1pryKOgP/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xjqIY9UP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xjqIY9UP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4533bf4d817so24555935e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750238589; x=1750843389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
        b=xjqIY9UPe1GKtHdSLku3sTgzkfCKqYYp6UpyAnBKU9nz8dlisM2j4bHUywZI9/S3Kz
         O8HOyUBIyJ6NIpTFysxshM6mXz3NBRAe7l/WE6ikDFLkoZLFn4q4hfg5W5CFqZNF+6yL
         q1vVDOs+0jXzGqtPrfiVEBaFcIZiuqjZ+1eczDIn86QKWurFsc0oA9z54rc6poBMFyhp
         WrYESy/KVivGeBVrUD9wCXIe/O5KGGsAwWkx+HyPhw06WogJhfISf373k9h69FtobrYk
         J9zLGHvYVMqhTZuDsV6K7+F9l3OfZCk/KH8N48Ch/r8fNWV0bVoMdzE31OYzCo5t8tQI
         0d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238589; x=1750843389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
        b=ckb8eSalivpLYyklk61Qsv7vafhcAAsueUqIFsmXod5cH2I2R2T8LB5rKT6i74uFPB
         BNuRJo3nXZSfTEV9PnrGPFJ56i5Hnl1hrpzokj9IHk1sSt94ZEeip5v87+mZQyB4oeFr
         64KiRjBBoZ19QV5++ktAnvu0O2yHq+DAk4HWbaak2EAKX/PfSMS9KuQeZTBYVwIusWnc
         M6Ai57SxiU+71wshhL7cklldStJheHhsWaVHYx2N48tvXRDZw9t1T+9mpHVhDitLn1+F
         ThI90S+I19co39wk1XRMMuJFkI16xPGmLbtn/PhmBMg5WEYV6hyamBg/3M4Dr3Cz4k82
         sLgw==
X-Gm-Message-State: AOJu0Yxpx0G1jG3ZAJBblgknerm1vTdNv/79HknfUt1QlhqPw6HTN43R
	39F3pUjrKSSMsnLxhehOOJLGyB7K/WBccEXkLszuZq6vosM+WPoRsEHJuqhUiMxZdlaz4Xx6CdX
	FspDAJvEqXT20ym68wKNwRxxhX711CoNAAGlhPdu1+rTyCOxIRuXG91b7
X-Gm-Gg: ASbGncvCVpRnNOx9nine0JE3lur6TfJGdp8jvhW3r3yWcCD0hKpT20bsayq/OCvHLfx
	dGwxI1gcsQhUPrV7BItQiLkXYAOLqNkKRLA30CtgwydzDC1Kqpm2HOdz2rtiWsf9w+pX4FXq403
	Is2UdPbAT7MAK1hhlA326xN0UjG7DNlJQCa6cjTvg2pMMWx5Efy3RxSQQRyzJaXVfv7GzOt3z4c
	xcwgJOLRSwk
X-Google-Smtp-Source: AGHT+IFDu55zBpLTjN0YBZ0/8S08wBdjH+mMHocco39YXZmhbhmmSXQ5wtBu7D5AZ5XiCHAHE2Mwh0RzhSUyiGnz88M=
X-Received: by 2002:a05:6000:310f:b0:39f:175b:a68d with SMTP id
 ffacd0b85a97d-3a572398e87mr12580033f8f.11.1750238589173; Wed, 18 Jun 2025
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618091442.29104-1-work@onurozkan.dev>
In-Reply-To: <20250618091442.29104-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 11:22:57 +0200
X-Gm-Features: Ac12FXwBWm2g1vrL71ZUV7peDg5fj1BZheM81_V76WXGGFZadcayIxH6T_7o4k8
Message-ID: <CAH5fLggmDKjis3XSW16_E0motkK98KgHEYq5wcJHekai=Q1tcA@mail.gmail.com>
Subject: Re: [PATCH] rust: make `clk::Hertz` methods const
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 11:16=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> Marks `Hertz` methods as `const` to make them available
> for `const` contexts. This can be useful when defining
> static/compile-time frequency parameters in drivers/subsystems.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
