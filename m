Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2C2147E6
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792088; cv=none; b=iieKjXQ7oKARcR53JeR7SH3dtJtl5WMENeox70tKagxNFduv6uD8CgxiGPUCR5PUwFlqaZcaDw8tAt0+w9+Rg5NVJ2M+DEnIXgckK+ZbR9nV3pk7oq4hgfDjBz9INPpHpV3/r/tgkl9OrcWcsYpxXTp3azyweB3u3hnBRPa0VW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792088; c=relaxed/simple;
	bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze09wCooJKPXTB96QMrB8Ws2PgnI3t0y5w3rDdGZEWR7fN2dT92UG4GxUqus9zcu4a6FSQ1KiT8/uHvS8HwZJ8R31VgYZaZbWckPStdQNg4/XH2yLTzupwXNaOyMNJ/OCrEsrT+4MQnLonRZPcwYM8RNI5MHN9swr/BH5zzkf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSN6io5Q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSN6io5Q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297cf964774so3442925ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792083; x=1763396883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
        b=NSN6io5Qmv3vr11iAZqwp9cyOycPzcDRDVEcKrzJKZh56lFUDluqoRQx659Eu57PGR
         qB2n5VF6wJxyNrwuxbYqu1nL3GNzOCt8Z7ia2ln/fnwON8saW2OmjsaB47+IG2J2ChtX
         gxJiel0g8Em1B7bwrxtopMtKfoHC5EWmR4RjU1+Dr0fLl5emNFFUSfCtIjvBYj1wDLNi
         DGo7BlYrnLfUeoq2vyzF6RISAYZ9PCD27idCRLQVC6bYSaDCkpeijP7jichFpSlVSFO9
         +lnF7fkDwYVRN1xpMQWwNLOiwhgriHZe9IZABImshilq2xiZwM+29ipr7NWyJcVTERnc
         cAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792083; x=1763396883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
        b=YisUltk4Js4dMlMyZDNw9Op1b7RNZLbjKUB4QxgYfOuiLnbwDz1HS0oEY9Ey0DVnjz
         R+1Wf4TvjT4hfae85bNxnv1bzZ858ghPZCOAXRQ2GnuwtcxYoeH5Dl4PQW/KAhqBmWto
         5RRRZKNnJFU5cxCsdcG6kZKBwJZvCrkrNYE+kKbf2O5I2KIPzhL+mJdmRAZQ71jHW3kL
         6LbD08KHpAsAuLakDXpk/SvMygExTkn5/0mTLg+twn1a3/Carx9VidaWojYVQOj3j2wi
         t4GVrZeM6Kv60n3QLB8EzOT4Bo9VslT3o4CTF1uF0uFud49rS5nGRupT0X4rXklCmprD
         bJNg==
X-Forwarded-Encrypted: i=1; AJvYcCWTiaM1kHqbyEdV0KLViKLqAgH9tfQem7v3+Pt5pKn9JNdbGg+uHf0ngB9gLK1qnuBzAoOAX7xOVkorRLSA/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/q5z8EMMoQguq0cMlcjYJscQIxpwcLxpYpn/r3bQXgt7Q+810
	Ew4+rs6P5js+rG/8nVWQGlfq1XfkY572XmeBUWAqkJRnISY3xen3tGscFZBMf5XDEQWTM9jpBsb
	1TfJnf6skU4Pe8RneKcwpEadtt2CRFJ4=
X-Gm-Gg: ASbGnctpBLgK9BVcb3MlNs3hfGHeFL9+gWq1kYDN0AewjQWyXA3WySgMhJKriM1f+u/
	pg9fSabBIS1as25cPW5r+bFXmmsq2L+/NCgjllaCeq8s2g1uEkMDGNTN/h72XZZtp4ABpr8+UVz
	vEf1sZycpSmhSCbrykb1twfq/H92u3vQ6VUJFu+svhQQiks4n6FU5dOVaduhZGFER1ZaElxKR51
	is1lZowUfmLj02NmouRrnNAVNMFnUt76UAX3yMwQNQ9ucf/e9v5ykOacf344+XGr6g0yED3pM5r
	xKAHWcVh1nTTQ7WMCjjNBgB4s0icJgITG8AMjfk2pkfoipOg1pxHGrFBb+htNvz65700cPJl7go
	cbwJV/yqhStJrMw==
X-Google-Smtp-Source: AGHT+IGEBFmVPMI5NICewEorUkL0ds7+z3bi+UEi4xsWzIwL5kT2S2mSCMP/63srdW6rOxPPTGD2icUW9ucKWI0bRKE=
X-Received: by 2002:a17:902:d48f:b0:295:54cd:d2e2 with SMTP id
 d9443c01a7336-297e4d096a4mr65754305ad.0.1762792082779; Mon, 10 Nov 2025
 08:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <874ir1zxng.fsf@trenco.lwn.net>
In-Reply-To: <874ir1zxng.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 17:27:48 +0100
X-Gm-Features: AWmQ_bkGZ7lpasgtIBPX75wmrrnwpcmnoNKRPRgat20Oz33yBel4ISwgnlmOOUc
Message-ID: <CANiq72==SimzoQARA5uprXs0-iKnBNS+EiKCz1L9V3K6LO1ftw@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 4:59=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Just in case I'm not the only ignorant person who didn't immediately
> know what "syn" is and why we might want 57,000 lines of it in the
> kernel... :)

Thanks -- I will add something like that.

It has been such a long and recurrent topic in our discussions that I
guess I was writing from inside the Rust for Linux's bubble.

Just to give a bit more context, it is the most downloaded Rust crate
(according to crates.io). It (or something like it) is essentially a
necessity for writing complex macros without too much pain.

Cheers,
Miguel
