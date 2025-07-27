Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95A2A1D1
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753640265; cv=none; b=k7oZh6jAGX4l39uObV7uTOkxZdhLdim86JVSA4lB+BWgTcTNK6ZA/1ThBnOwA0lYKbbBf3+Duru7Gab3LpVnko8lgRFEXny+CQbyQcuDd3WL0eNGLcCslQW0OvfZuvpX1ndkM8n0TLxjjiS2heoEgbHR84XyH+wr+fKcSJZWwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753640265; c=relaxed/simple;
	bh=XqPXra3Sg49xsVOULVqLEdPHa3FrIz90CUdmdwsQGLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwPTuUek6yQTtYe8S3c65u9cCEGOBzG860WpAOwRaE9DAQ4Lv4uO8Svzm1y2XMPsClD7SgXFDBckLF3j1IYNITPVbrU0W6p45sIsPXiLdq5ar1pg03BJTZXyQRWHxRO9BrB1HkvG2WshQlyMu7i5keZkEduGI9K4PmNGS6v9mrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOj5JHGr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOj5JHGr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31306794b30so660605a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753640264; x=1754245064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqPXra3Sg49xsVOULVqLEdPHa3FrIz90CUdmdwsQGLk=;
        b=kOj5JHGr9pemn/PdjJUzo9SwdjiabXaaEMNgwcrIwLhiPOn9nBhqHYZvLewCLz2g08
         UBEiVnpbpl/SF1Q/pry317AMAb6tURtnCaMegk2Lf9O30Bn5+b1DDSlGEFpkiNXoOats
         AwRSb0NlwPxdtDa9nqK364Ae1JSl9zlEP4oO9ASCbXyZx9xlACocuInSrXH+ly0gYeRb
         CnAcBr+I/IYM4DbkFSE09GzQ3qfIqKCGaO9as/6gVorEmCfnoE7CmtMLuV0hHHPUEr2/
         fNfW/OmYApyAOow9w/UeCnT5wxOl6qlCQydJaLErfiezxq6WFBqKPMEtTIVC9xsftCUb
         qXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753640264; x=1754245064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqPXra3Sg49xsVOULVqLEdPHa3FrIz90CUdmdwsQGLk=;
        b=lHkpQ89EvDQ0M2PC4BmZpZkb/NwzE36s3IRw6NyCOJ+1THovOsgO7/4Oq4B4OqNJRy
         Q7WvgqkGjgQAY5YR3Ai2ZDYk7N+U21IC5pqlSJbqlnliVdRfpynNvgNck6gH2NcZ3s0o
         xghON2FXhJeC669MmnimNP82QhLXvO4HMEewfiRhFa2ibeD4rCHCUtaL8uFp71QfdCwI
         yKlMisqGJY4dLn9kh0Qo3dNi1blWrQgPT3xdEs9Lr6DtcD/Gn2WdsjGiSltcQY6smMxP
         tPCNmFpUN0VAOtkICbBmJMuKXboH4rMTXMqZ91xK6SdHX4cZrVXTNHMSat7UfPRGI2Ts
         r4EA==
X-Forwarded-Encrypted: i=1; AJvYcCWcurqSPhNCW3OHAlxouZzbD7Yz2PsFZoIYfnKZMI0jmq77fzuuflMQJ8Un8zru+Y4iIuZ1dGITefhqq9l0tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MBQz+QprGd+hNGp/vwHtV65YfEtvDkOQgTDkkYc8WwXAhIJh
	ITKpyWziNuHXtpIaCMsavhxt4eSWvaEhnWStYdwU2uoOSdkY6k+G9hru9Nxejc757N4WnzmJfhK
	LpEwRoS7Nbrmpgbv4MWF4NRKioFCQEwk=
X-Gm-Gg: ASbGnctul/hxVHoSz9HfRIM8Qp5dEDkWhOfQ48zQ1/TdgDOeY2RArG81P2UnK5b+7IP
	vPfVm7IbmGbQ5d9rKJYzeS8qD4hh/hPPMP0H30gdZggo6QiApDrVaQ4tLc4O5xcDjTQtqXU5ppp
	x6I0qyZcUG4PB1LnBwJb6SUs75+6GuDjiFw4ATHhpB+Wh3BMBwet/BbjbblOOd95ZX7Jt4RL1uZ
	OP/AtxX
X-Google-Smtp-Source: AGHT+IHmT1Ld74eSexitWjE7SjQKrOcsL0r3kEXQ18S3Y2CVeMqUKcXf1MH1WCaMZ7RPAb//Lv4VN+8WY9hoD/eARkY=
X-Received: by 2002:a17:90b:4acc:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31e77aa16ccmr6298496a91.4.1753640263896; Sun, 27 Jul 2025
 11:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523145125.523275-1-lossin@kernel.org> <DAI9KRPT45EH.RD7AB7OI1RTR@kernel.org>
 <DBN0E1JW5JHS.2RU9ZWYJ7TBVM@kernel.org>
In-Reply-To: <DBN0E1JW5JHS.2RU9ZWYJ7TBVM@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Jul 2025 20:17:31 +0200
X-Gm-Features: Ac12FXwcBxJCL6UEg-PozGZ95CELyiPbO7saXJurLAMEhzIzF-dr5evUXC9Yw7A
Message-ID: <CANiq72nzG98-5qtmnf6t6bKctUTnu4tbAwM-_EmZmrZ=-NeUPA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] `Zeroable` improvements & bindings integration
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 7:21=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> @Miguel, I guess this flew under the radar for v6.17, or did you have a
> reason to not pick it?

I had it marked as applied in the spreadsheet -- I didn't notice you
expected them to be picked as-is next cycle, sorry.

Since there were no other comments nor Acked-bys, I guess it flew
under the radar for others too. So I would suggest re-submitting the
remaining ones rebased as soon as -rc1 is out, and we go from there.

Thanks for the ping!

Cheers,
Miguel
