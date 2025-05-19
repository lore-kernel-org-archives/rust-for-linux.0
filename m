Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B127FD40
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678391; cv=none; b=nbrBBbvMSJikK+9+kT3W43qEsPnDMl5xHm5tuD9/k+zB3jnTN/gJcnU6hZRKZgRbp59dtXKWVgMfauSDydp+jrIldz4WUf/FwFrNX1B9CEDCgaz824dmeJwEI7Q8PuZWKCdKVrMUwrxIPofyRbAVuPdrUknJC5xqvsk2S9JTKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678391; c=relaxed/simple;
	bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz+zYlxciiBGc4yVMt0AuNY44Juw0zKwB7Kuvm0d9VdDE5MqQw03GKk+Z3yE/fGyU9I8MncF5ijzhtn3YviXR5BNM2Mk/BVLKZraNVDCofw+E9F9xYzhDku5Cx5nMwEtW/Vjjyr1zLBo05ANQFB3T/FGrwSuz8YSjsjyeM5rwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j+ig2hs3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j+ig2hs3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a375888297so654057f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747678388; x=1748283188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
        b=j+ig2hs39jz6ha2tCCueeMYrmH8F8drIdNlvH42McF3aTDYcyzypMMXMwCfxAxcLbK
         oOMDJ9bH50WiA7TEf45yRTMONakCGp5NoN86o/aYEr13oyXDEfEGbdE3cTCBOyp0Sa4F
         7yRbVGbwOeLclZCIWb/rY8O81pViSwkDzXiEFjK05OHgccSlDTAG2UFbdoyfIOl02Rmo
         38wNxDPFUZ1bvnWnvEGD0FEi2AKivCoo8i9siBx4bzN/GcsNKA6M9at0UyVLjJNTN8yX
         4wOXfmkHaXdWNAWyW7S/+SPdjhU98gCPvwg6JCf1t/hu7zZqbzvM6u49h7veRYmBviKb
         piSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678388; x=1748283188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
        b=YvfNMgmwntc3caCGD3ryW9Z28FXITz66yOqA6NPmC0bSnIgopv/y3K64Vs1YTFr8ai
         l9hhOFdT3rS0jmd6w4cPLIOdZNhO+mSOgfQx1rj1jsRIsLkutEM9R7mD9cGAHW5ywdSl
         rs6ZDlzv1k3yY7GJWcCGokluZ9C/29iSALxPnVlNyyTWtpKhQY+dGETl6r2jNLNj414O
         KiahB1ZxBeg3vygM6KA82Jsa7b+1vEb+74jSsc8V+7bUYbu/AFbzgbiyapNZQhFX22tT
         9pt3twmQgVDq2KZGkWLtdYGOPh+sQCQ/BbcPJgeL9JFu1wdcx5gcQzJmNG13MbA4abqM
         orzg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rPL5Tu1gq1/N2RzYbb/l5l8JFBr0wXYnTdD3VvhAE3zFvbVcr3NXwsJw+QYXjgjYUCg0cOQUSoggvcPAfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybnQpnfkRdpYsVxEtlQQGQWoG+ph1p6v2TCdTO/Lt2rzvBhWlj
	Z4cXjhZEi/x0BU20hJNp4ouftMMSnosDMuKpFvLIYMXmTEMeDuwMEGdSL5yQhMdY38+Nn0VUmrF
	NBbAQfr/wv1uTr5caO9GnxrzPUjYx0rBHa30N58Es
X-Gm-Gg: ASbGnct3fGP2jmWbYYpFwkoCtokOKQo0qvx7ha22A4M73w84/s7Tmu1IfgIdfAESbvE
	obpdmshxTAzfLXAHnbPMluAf13mptSGdGJW8ZJYZ0ZA8vpqjSZDQ+f9U5BO3VnfoIw+Nf4EOL3J
	ef306Dr27DgU1eTBoRjP0pMYhFBxcQNgA+IZ+pg3NmVcc0Xt8DCOcnMQA95PBJOIo=
X-Google-Smtp-Source: AGHT+IEzMOKZMBkeSAD0ow2tHsmyWyV8vi/5NsezCGm1OU3PD+CuKt/pbnUIaf/Due2KAUhWZ4yaK+DNemgDcXcpkZk=
X-Received: by 2002:a5d:5f94:0:b0:3a3:59a3:fa24 with SMTP id
 ffacd0b85a97d-3a35caa2f1fmr13202792f8f.27.1747678388514; Mon, 19 May 2025
 11:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519124304.79237-1-lossin@kernel.org> <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
 <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
In-Reply-To: <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 11:12:55 -0700
X-Gm-Features: AX0GCFu4WoOhuem6Ei_w3r7-2rKbGcEyAcPt1ynSlpFx7_WYp_l_MpIIWkxmTqE
Message-ID: <CAH5fLgikAzVv5A_eP7vwqRNka5RAkkyRnSxh-jjnA9DGfbYf_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:08=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 7:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > I don't mind making a custom enum, but I do use this in Rust Binder.
>
> Yeah, Wedson added the type back then for Binder and kasync from a
> quick look -- in those times, I see it in a few places only, e.g. in
> `get_work_or_register`. Do you have many nowadays?
>
> i.e. I don't want to add extra work for upstreaming Rust Binder, so if
> that would make it harder downstream, we can live with it for the
> moment.
>
> We may want to add a line in the docs to ask the potential user to
> consider whether a custom enum would be better nevertheless.

It's used get_work_or_register to return either work, or a
registration waiting for work if the work list is empty. I believe
there is only that one use.

Alice
