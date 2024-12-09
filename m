Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54821765E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741060; cv=none; b=kM20LdW2rKPGZzGy+u8pn7rUd4Pgz/ALofic2VfVVnH1wSZ5jZiPdIixQdUyp8akYsqWtrM4M+tDOI+ZJoWaV5BxZCbGnjLNNiHi2oDo4lAjoBIwfXSi5whlwtGvGZ2OJFnLAd5gBuc/A9K9eczFTXNtP8xPhO7vnKVyiv6Lrww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741060; c=relaxed/simple;
	bh=6BqBE5aFm4ewSSXypyzZzTAT8ClVBUtCqUHdDBItBdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwiBHuQBLVh6F0z8HOE/FQTBLqoxz2oisYn+uKu/6WcbvTIzfHIIRRqZe5/HCh09ivKzQBlmmihl20aXps7EuZfA3Yis3FirU1zW2BZYVCgWtxUcFFYCbsfZnYYCwPNxID3aJOF8Vtg7AAKtxctaw8s7rTQ6yZ13BEfoxDcVzas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPvN8Enp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPvN8Enp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349f160d62so27692575e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733741057; x=1734345857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BqBE5aFm4ewSSXypyzZzTAT8ClVBUtCqUHdDBItBdU=;
        b=vPvN8EnpVNA5rc8qqkxAJtara8E4ZuJGvWUGneyLKIwD7jB7bidxhK8j8g2D/p/D/J
         uuJeOHoYpEJ6+pndgXVi3QOco4xlP32gd7Ic1vuKYTIO5gazrU27HaG6qCucTdl+IWJ9
         pkC47s2qo3K9wDjxlOX1sCB4fk3LtXY7Tu/sIC1JX3n8hHPmewCkm8b6FYt71iZ5kB8f
         SYF8n4KpLw3P1iZZmEchE40vzj1/ziU91MYpAIJaIO1TtUQnyhNC+BMGYYkN0tzcRqbg
         oB9UPSJNHsZCPZFlRIMORvEeTuKJptggfjvG56Uv3KqidFU9k74PlGpBGAHqLfZiApew
         1zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741057; x=1734345857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BqBE5aFm4ewSSXypyzZzTAT8ClVBUtCqUHdDBItBdU=;
        b=eWcuZfkLAi8EgZ2+IFeXeWT2prepMGVaaLuvRdU3BpffC0z9sVSO2FTWLWvjUe6YZu
         YIoYjV0NptVuYDaw9Jjto+EnDwnsCO5ez0807kiypU3ETYGikafFzv2IG5SKykwc1KxN
         KV3V1KmmaGXkoKwwNz9GGhhaS2PTPbwnoyv/tI972S1FregIjdR48njoRX7PwCt1UOab
         ytpwhLo7mH5jmniPkgSVwmTsFjfBF40R/OofKiouynsb9AzqdXeKCxiaf0tjB+F7r3td
         Qukp1XbcnokRBmW74Q7GuDcXVc3Iu43eUK9Buinc8b5LwUDuK4pvIQAGYMHRh1knew5r
         ctgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB12h1NyHuc6KyJ0NIcXpoHgBU6yFcc6m30h1HfqInEGZuaT8maQ0oTYVoIJenSTEyvEzArkd4BbichcomUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq981mytOpyE7KEdig5CJHQ9E/7iWe3CoS2k2piKIy93r5T4AG
	SzA6kX8ELJGO3rMhICY2mnDhxBu5lSe4X8C8jsgOrBqWgy0QHZ4uAQFfsnAVT3dyKyyjBIZCNbR
	YMKz1EEYJToccEtrm895sdwDQvdQdaFk9yRtF
X-Gm-Gg: ASbGnctkr7dbvBgRc27NpvaxPy2BKAs0ER+5U4kDUyim19NxhL3Jkx5XazCf4EyEJoI
	jygnpW1px3+mpFJOlkloPLzzoJRUX3dQxOVvrsKvNTOP0D82pq5maDw6E+7Ny
X-Google-Smtp-Source: AGHT+IEtz09n9EgbFd7plwXSP8yb6/Yeh+KMUJh3CuOljqy6eQuyvRHTd05ms9lQNLPlGEDxjngHLcH/n7gSBSV505Y=
X-Received: by 2002:a7b:c8cc:0:b0:434:f0df:a14 with SMTP id
 5b1f17b1804b1-434f0df0c1fmr47702465e9.2.1733741057349; Mon, 09 Dec 2024
 02:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-miscdevice-file-param-v2-0-83ece27e9ff6@google.com> <2024120936-tarnish-chafe-bd25@gregkh>
In-Reply-To: <2024120936-tarnish-chafe-bd25@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Dec 2024 11:44:04 +0100
Message-ID: <CAH5fLghxiX8PjJH3s+xcXpJTD_XLuKKEjRM2dOqXkX7n7PoQ6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Additional miscdevice fops parameters
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 9:43=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 09, 2024 at 07:27:45AM +0000, Alice Ryhl wrote:
> > This could not land with the base miscdevice abstractions due to the
> > dependency on File.
>
> So these should go through my char/misc branch now, right?

Yes, that would be great, thanks!

> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> No need to sign off on patch 0/X :)

That's just the default when using b4 to send series.

Alice
