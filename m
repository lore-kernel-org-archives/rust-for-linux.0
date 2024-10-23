Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD01A7264
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729690790; cv=none; b=Vb15sV3kmYO/8u8HJ73zYU7ufH8k98ziYwI/qmXcCGozP4c7FnjDBlOK0asB5migQx65S061sqVSvQBndiUCC+99dWMdY419/muTM6AHtbtNQvSJnr74TpyXPsBoMTW396jXQCGU3Rdw8QStb8HPWbHEuSNvsq1vXru3nO39LeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729690790; c=relaxed/simple;
	bh=fww7zGlOWrl/yEtr8dz2hpsxY3Qtu4KDv6285xEAWQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/Ohjl6LlUDw+xE8/qyusKruRciUCmCUGuoJtokMCmgBQ6x2ymqkZPWVVtoJS+7bRjeljpjycRq40EF3W0t6NXAySAJYN98A+EQcErmtifJ3qXyoraahEkpQKEQX4tHw+3vKZl8kqGcI7r3RXgFbHk+XrOgQXS1HQX7P2pj8UlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0u3e/vJC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0u3e/vJC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d49a7207cso4974437f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729690787; x=1730295587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fww7zGlOWrl/yEtr8dz2hpsxY3Qtu4KDv6285xEAWQ8=;
        b=0u3e/vJC0XslKXq6vkdd3s2YL4nXm43WAh2o2UISYk/UUZ2QMtdaBzqP1qGDP1UfBy
         JNKbWzJONpCvpJe4QTbdUD9ft/rGZi5hZ9P/WdMlET1YOdhNDzxqLhqxEj7aO3dugtF0
         q5x9yJr+C/3zESBJmeL1Bbx2B3EQxdhM4/kFA1yMEC2ExS7gsfcNuqp8RIJDWD+Wrazm
         IW3DYgvVUPhsNvHMHUbHkJzqQbtGoI84WEmHcdrjifWTxOMiXEyb2R60SCB5EgGhUIex
         9/LLPfJk1z8Cx35OtrHQOWxeO7k2VYZAUrEKRIWN+dWBpT4QDA1VRORVgqNZWiI+nkoR
         EnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729690787; x=1730295587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fww7zGlOWrl/yEtr8dz2hpsxY3Qtu4KDv6285xEAWQ8=;
        b=aoskDXSY+7A39FMbFxagJKdSUx9NwPqzOm1L4wOZ6szDS9Su8Iw+jVNN6kBcuOaXeb
         ZFE3+mYwzBy/5Sezg9k1ZgehLW7FVLXCFVLHTDX5HQslXcOxNUVMYEE/2/c+mQl+PuE2
         zrU5odJNsAWr4+mU1cjKtWJAT1+pLG1q8LtW4KGxH9csa780clSth8oyLpTVp3SHdMI6
         jmAdbznU3aprd72BtFCoA+YbGMjgwZAa3Uln1LWu99FWAGE+dJIS3F4xLy2q10Y2PE2z
         AIg6HT5Fk77zQf5FDSZGwP7NuvdK9nU4QWP5SJiS0gQwV4zY9auxsBQIevw2Rf+EtsUx
         i05A==
X-Forwarded-Encrypted: i=1; AJvYcCXyC5AhQ6IyDXWSCmLDNJkKk7w5xjjxHX/Whec2gWp8fXrfIWo4lMr3Xi+obtSI4AEMB33l82arFsvRQO4oIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qE9U4N6rD4KIsrYXUSu+zrNlpgzgqCwy0t0EQxiiZvmZvfqf
	jHkBT81I5gyP7ciN25guiCb3TesWKrT0N6OPLqaObrKAYT44UGFjSyrbCoK6IjzrxzALyliGnCm
	T373KZkwhX6wwQlAbtvq2hPlo+fEZK3lmcIlI
X-Google-Smtp-Source: AGHT+IFShRBq552oUY4eUcelrXqUkBVVSMabJL3W1OrWwQN0r374hQr0VJ1S2nafrc9Qz652fXB6W0lDm/i8uYQMOBg=
X-Received: by 2002:adf:fe86:0:b0:37d:39c8:ecca with SMTP id
 ffacd0b85a97d-37efcf91ec4mr1467018f8f.55.1729690786711; Wed, 23 Oct 2024
 06:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-static-mutex-v5-1-8d118a6a99b7@google.com>
 <ZxZxzjEaSZ8e_6mn@boqun-archlinux> <CAH5fLgg=Hb5NDaQQJW4SVh+hCj51bp+BzCMQs=Pg_L+_MMiZgA@mail.gmail.com>
 <ZxfWglfYr52xTIO4@Boquns-Mac-mini.local> <CAH5fLggv98iPAPm=PPa686osmfjqcdH9D3wD47ytCqkqbgwx7w@mail.gmail.com>
In-Reply-To: <CAH5fLggv98iPAPm=PPa686osmfjqcdH9D3wD47ytCqkqbgwx7w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Oct 2024 15:39:32 +0200
Message-ID: <CAH5fLgjNMNX+BGEecy9paDfvB6etvBuvPSDTgcLtuy0CwnDafw@mail.gmail.com>
Subject: Re: [PATCH v5] rust: add global lock support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 7:24=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Oct 22, 2024 at 6:44=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
> >
> > On Tue, Oct 22, 2024 at 02:46:19PM +0200, Alice Ryhl wrote:
> > > no contents, but implements an unsafe trait saying that there's only
> > > one static using it.
> > >
> > > This way we also do not need the helper module, as we no longer need
> > > to generate a struct with private fields.
> > >
> >
> > Sounds good to me. Do you plan to let the user name the token type? It'=
s
> > fine to me, or do you want to name the token based on the static lock
> > name?
>
> The name of the lock has the wrong case, so we can't really reuse it.

It turns out that we can have a type and a static of the same name, so
I went ahead and reused the static's name. I think it turned out
pretty nicely!

PTAL: https://lore.kernel.org/all/20241023-static-mutex-v6-1-d7efdadcc84f@g=
oogle.com/

Alice
