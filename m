Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC4206F25
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478234; cv=none; b=EBU9k7BpbCzlytK5hly9TH7xywo/jhDFoWkVy7A3mNejEsArF7MUIhyd1BRcm7gqMxww6kUS0T7KFjYA2wLfE7cmr9lENWE0HBKrhmKt4jAiuXpVfTTQNFlU/GE+hoTKlgnQSp07gM8xQi2EIWP5pTaoa+fhdZCAwkMBExMKGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478234; c=relaxed/simple;
	bh=HEsaUBqbvlmmIMeWKimYYIriYFk+t+jpsGuibbCtBMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blSXxrUza2xCta9VUnn+aHjrp42f3WwAis6xxxnXRLd9DbQ5g+6aCb67PhhuTHRnc9f95eqVmP3G8uGBQ4zRW9Rvr+HDGMlu7/a51hTiWYjkrUTFND+otwoMfYY798Y5thkEQtf0KZ7vskfm3o+qItQ8jCEDWhsYNv07oB49Zjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YB7PyxLl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YB7PyxLl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f5fc33602so3050488f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 02:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740478231; x=1741083031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNwJF7WbQ7qHyWG41GyMTL4WrQ1xaWCn+JBYGaDY5JI=;
        b=YB7PyxLlozGRuNxh5oxEwYbvI6QEOP2nI4VKQl8Ppd0J/4MExMa+hhBpe/7wO1piP2
         Hjef3ZbKNwz/cpgLzC+4mpzZF2D3wh6/pj08D3gXODyFmP4ZfXnVf6xvh0eEOXUoq6dq
         3qy0jzO7cxA4d60g/pyb8NO8KQhvuQSya8EXeZA2KkVqNES3XlGw7bGTzsMZqFGVI4qQ
         CaivB66K0KNKSOiqFOlwc4g0xGSeJbiLi93KybSk3yUTzK9NMY4YHPdkiHfgGGEUhO1P
         wPNTBml+WPRc8hSjuZ4dHrpOCIJj1P+6CyZjVC08jW45uiyL4yzO1rLLeOEH9zCTWCS3
         vI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478231; x=1741083031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNwJF7WbQ7qHyWG41GyMTL4WrQ1xaWCn+JBYGaDY5JI=;
        b=IwnijGBFSgzhEt3OfsavDhfADZKsJradKCWMFsySETzEP9zQtReiIfTT+K+LD4KVjf
         KdsuI5JnKNWqaOkjvgebeb6Y0CixXdlzDqFh+zrKdZU0ZapDGHre3fxSMa/z4CuQ3btz
         2vqd2+KkjKT4uMm/d/fE9ccWmZgzME6bqFNWRwxbEKZUC/czKI6QPxc9fYP6EjIH7hY7
         CsCNm2S4MlB4L6UE+npZADUrMUrvnRqVjdkXkiUu8JpeTV3C27ytkGiiCZrU/nbWDhfA
         pFwSenw2gArJIxtBFMERkPuJOcq4HxQDtgogaZjsXE7yFCoEQwKQh/bvIvtirUoPv+Pt
         8sVg==
X-Forwarded-Encrypted: i=1; AJvYcCVkeE6XOlWYtSc1v3qhTYt7vfma2NylM6lgnyehJKdT8Iv3PFB/ByPQnX35sWvcvzTP6ayWgroaPHBqj4A9zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygZXkeTItVDDa6Zp51dl/tPwfHBVPvsyPK46TcO8qVfTMMY9g3
	3ZwKiIXaaNsAZmph+CiXS1mDiPEPW4hiMtIdJnr+y/WF2C/5w3LArCtOuWoBdkT7cUAjExMGC01
	3y4gzhsistgNkblPZtDVEgXOFPtK2ljTGpK8d
X-Gm-Gg: ASbGncsFYq5N0waHbvgR+hePjg24pGoZV4S5ochG70RxG60z82FxABQly9KdttIi0hb
	XLoyJyfnJkiCdXp++/aWFe5suvOUYn3eLx16lp/ey7wAJtWEgEVjRm/XiNlUpTGguSBZpx9E66v
	/RMaNDHK0u/Z1WvMHo1PkYrsqaDGdkhzyZxLsFXA==
X-Google-Smtp-Source: AGHT+IGfaWyqkCsllYHWsajFAN0pn2xeUEdUV0MH6OkubIeJVTJI7wG01uTF59yTNz1OwLNz8deLmppVNDVmY7bgr/c=
X-Received: by 2002:a5d:6c6f:0:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38f613fa36emr17275090f8f.0.1740478230765; Tue, 25 Feb 2025
 02:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117-miscdevice-fops-change-v1-1-ec04b701c076@google.com> <2025021926-transport-fridge-bc43@gregkh>
In-Reply-To: <2025021926-transport-fridge-bc43@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 11:10:17 +0100
X-Gm-Features: AQ5f1JpRZUEexW9GquiI18Q-SWyBfLM83cXvJiOZFncKVQCL9J-DvkDBnBORXeU
Message-ID: <CAH5fLggCjB0ePQvPFeTuy9m0UC_KkHa6-qU8AhQ+P8oHbAhZLA@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: change how f_ops vtable is constructed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 4:58=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 17, 2025 at 02:22:32PM +0000, Alice Ryhl wrote:
> > I was helping someone with writing a new Rust abstraction, and we were
> > using the miscdevice abstraction as an example. While doing this, it
> > became clear to me that the way I implemented the f_ops vtable is
> > confusing to new Rust users, and that the approach used by the block
> > abstractions is less confusing.
> >
> > Thus, update the miscdevice abstractions to use the same approach as
> > rust/kernel/block/mq/operations.rs.
> >
> > Sorry about the large diff. This changes the indentation of a large
> > amount of code.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/miscdevice.rs | 295 ++++++++++++++++++++++----------------=
--------
> >  1 file changed, 141 insertions(+), 154 deletions(-)
>
> This doesn't apply against a clean 6.14-rc2 tree, what is is made
> against?

I will rebase.

Are there any other miscdevice commits that have landed this cycle
that it might conflict with? If so, I can base it on your branch to
avoid such conflicts.

Alice
