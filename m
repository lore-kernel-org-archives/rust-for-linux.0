Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E5254849
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755552167; cv=none; b=AiLn25HFSD/dopJFdi+C/Lyb1BMr4mGLWFdS1B/0y5zUnML+ZpWfl4IAPWZa10ReF2XxciTMKp7CstEEqkA50E1dsECBFHy7ZlC3STLKxQuS375coodnO7RyEpub/5u8/vFZ7fAB+rOg7i4HpdKuRk2UMMpY9Zc7gJCk950jdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755552167; c=relaxed/simple;
	bh=SV0SovoncvtQUIWdiz5ZimeTSUpDBwkq5eqoPwW+Sy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSv2QFQWxu3JRINJbnPN7jQ9HJ1ya8IJnPTo7vxOCdEm8qVMdfr33NmPQs6YE3dh1UM6UjO5wINrJD49YRu/ivrdxMwZBhgZlQHU9SHoTO/tBG/8wsS4mKR7UrepW0mFYfCCza13oL5AorhC2DI4b98IDcz9ka6HZagAFW0ahBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TYafCGnY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TYafCGnY"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2e613e90so3333209b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755552165; x=1756156965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV0SovoncvtQUIWdiz5ZimeTSUpDBwkq5eqoPwW+Sy4=;
        b=TYafCGnYL/KXogHJLkvcXm3NOyc4KE4KkR2QZ513U1WcBGTJsFVPVFqNXzU4iWNMEc
         lCTXxMJs869490o/wIGJbf9EaEGTBPAlSLzVELa+ipCNCswRw0WdOTNeRAKYq+iyfOb6
         t3X0oqwGoxFYhGMHzngc8AERibyBQ1G8V3seOWdZ28MlPuMDY+xZWzLpPqSPLVOyKAsh
         W2rnZyPDyANwOkC6E16dN+KRCAYh3IiaRJFVdVwgmGsmLL99mBMuq1Gc0thfhFnwvZpQ
         rX/BaoZkYALKSugMMOhmAi3qxMxItSZlubNWQ+ayiMum/1jBT+twJ5kFb9tPJuKgVGP0
         kdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755552165; x=1756156965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV0SovoncvtQUIWdiz5ZimeTSUpDBwkq5eqoPwW+Sy4=;
        b=CYI/wXA04YvSt4cpngxojvCEmHZRrPzqnt1/3NooZ5mGX/GgA3V4cYmWb9J4Z96kl2
         5oq0bV2FurbcE/OjJ96SqKT5ddZT6oq9u4I58WyyOeedTlsncZBBe9XDeletQJ1gusIi
         /AshmrhcHar72OEgzL5DAlmAYAtRx5FKRQu+ouUDw9GCvVeUR60MB0x81Sj3WXD6wjdW
         31svDARgTgoCCENeInsjG1HA278bqA+HxynvDWmI5SpeyIURTP24GvewX4YcUgBJaVp8
         zTn9S25AQzZbggQeIzOrauclTwwuSPNiGZpPut8zafaDfXCfyot7Gv+CIaV+DmuDjBTE
         FThQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgmBO/GS5h4wwRob3nP09czI0eJZvRIx1h+WPVbfzE14WplTQuQXdAwTsB/itAwnuDrQ6ySq/UGfgGw7Fn9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzic6OkYXyn0UYqKNQOBzlh937UrBW0NVOY0H6dGhOZL7KiuZEk
	370W9mo0B6OpI5GmFXj5O3pmBQgnddhrOp9N9z7ICtWxGPlgIOsY8kBkgSgMYIM+Ri5h1Sk/Y7Y
	K81X42TTWH8TNy/TkUiAdbwMA+eaaJSZ/QXmZ/8+N
X-Gm-Gg: ASbGncvUuHrcsFAl8ujHdgjq/Swzh3pIWa2CJxCKOMR/OulD2ooziR0xY6EftWXjmxx
	QSvcdz1reaiLjQtLFY0Kd4+YYudIiJucQURz4caUdbHP4EdFh5VZIwQ5AmhiBApfoND7mPdHF5N
	ahctnaFxGrzGdqDZXQehU1SNkXGgHdR/3kREbz5sBRS1UwCkfhPG6kEoILDTtOWFf5pHXcXXXym
	lkgV4Y=
X-Google-Smtp-Source: AGHT+IFrpf2SwebDg+GiltDgtPrrGLf0iUO2py4Zq3qOIraT9VCfP5Xv4Pr/eE1gzrWGIUk8h6MeQPTZ/yeBUsgJzAo=
X-Received: by 2002:a05:6a21:3282:b0:22b:3da9:fb33 with SMTP id
 adf61e73a8af0-2430d2fa39bmr98481637.12.1755552165437; Mon, 18 Aug 2025
 14:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816114409.10107-1-shankari.ak0208@gmail.com> <aKKdULYbLFRMS9qe@mail.hallyn.com>
In-Reply-To: <aKKdULYbLFRMS9qe@mail.hallyn.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 Aug 2025 17:22:33 -0400
X-Gm-Features: Ac12FXwqH4hs8Wu1pRkY76N_A0MiHuz9hahX6-bMGzQ9hZA7cdN0mZsOzdI8Fsc
Message-ID: <CAHC9VhRwpYx0jVybcAnGdm4AGDno-GwyCzZCS7U+56Fwu2tuCg@mail.gmail.com>
Subject: Re: [PATCH] rust: cred: update AlwaysRefCounted import to sync::aref
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 11:26=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com>=
 wrote:
> On Sat, Aug 16, 2025 at 05:14:09PM +0530, Shankari Anand wrote:
> > Update the import of `AlwaysRefCounted` in `cred.rs` to use `sync::aref=
`
> > instead of `types`.
>
> Thank you for forwarding, Miguel.
>
> As far as I can see from the included links, this looks good.
>
> > This is part of the ongoing effort to move `ARef` and
> > `AlwaysRefCounted` to the `sync` module for better modularity.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
>
> Acked-by: Serge Hallyn <serge@hallyn.com>

As mentioned previously, I'm still not well versed in Rust so as long
as Serge is happy with it, I'm good with it too :)

I'm guessing it probably makes sense to include rust/kernel/cred.rs in
the creds MAINTAINERS section just as we did (or will do) with the LSM
Rust shim?

--=20
paul-moore.com
