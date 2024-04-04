Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6486AFE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234275; cv=none; b=M/u3+SzPaEaavLHej7owt2KDbVClKQg4CX/oEn+IP/suo/0iLGiNr3KjLfCZIObjOrkJIBmnT1EWHWdztqyu+wAWuiqdUGGnvuk6dOd1IbgJAV914kpIvW4Xw9uzDE4TzOC/rv3v3KE9dqxsfJpLfc2aiaGeSalU8TeT60Aaumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234275; c=relaxed/simple;
	bh=1UOOj7HVrQt0h9PL4XvYt/N7rCt5/4KjtyqyN7vPb0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUpY850Gh4NQZ/PzzZFI9BT7l9uV4FnhInZnSxKnQSv/aIxs0ntgJw0fxrxlB4GjhD5smpUGtetUR6d8HzCTOFZ9sGlJj6dJGoKiRC8q4IjgGUBaToqse/0b9uMl8mqZGJSZkWcdrQEQkv6GF77wwXbcYict//WhZhCHXnHeAz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNvk5Qg4; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNvk5Qg4"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4783964353dso356772137.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712234272; x=1712839072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UOOj7HVrQt0h9PL4XvYt/N7rCt5/4KjtyqyN7vPb0g=;
        b=CNvk5Qg4jn4MASHaVNXKBCfCKe5E/9ZkYIdfc6c90M075koIeArWeT4g/7n6e+Uh1r
         xbJk99XY8ZBJ3mciA8lwcExeOVc6q88b1Ez6d2VLxn53XARBN0ZPLqScMctrA7XRbQPS
         BvF6UEG7lNCko6rugP+M5K85/LM75YxVz7G6kEP8G/8aZtJM76sD08Lc07RZadvx230R
         E8pRPs4tKosnBZGQhZaDqS6fTbRIH5l5a8EUqui9ef22hUp8Et6ob1HBUmL41zTPGf7C
         HOKh2N5qR6fPNbFVX09weqQh/liwqKiV06Pa1srQZLZ6AZQ52TObwUEog9Vsb8CoaB+a
         EDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234272; x=1712839072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UOOj7HVrQt0h9PL4XvYt/N7rCt5/4KjtyqyN7vPb0g=;
        b=ke7DFDjxRabG7Md5qwtNcZ2v/oyHWaYDSzp6MIwJgjnhBPA2XoKtiMOwOrUZt8L5f1
         R455HTxJk/2mBvlcP8NUglnx8WdoMmrPik7O/jcK7/R2yNGN0vWz3fi2EDlw2oxzco3r
         r4lJJ0XsKgQ8/jJpVNts0dkhenEuOZjgq7mpvWvoLMers0EnJPJMo+aRF2ualTwgaJnC
         jCb9dfx0sGHL6pVCHAR/0Z/HZZCHsgzgRe3TMg84l5e1XqaZC+xaWInCXQGm8WUKmeuE
         RwPZlL3T7K6owVWnMV0aN4rjbA1nhsYUrDA/DN6JrFmEhg8sVt1gITh3lVZXTj3+T3yH
         IXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUToxSgsetaRtHce3ftqQDQKcOCrpA0P5tPLp/v5GRayk9+tKl7elCLmLzYJwmTRbKY1RqIYiBNc+nOuwKd20MAEm0f35IaBEqHenc4u0k=
X-Gm-Message-State: AOJu0YyQ1q/o8DeHcqDDVd+Dj0s+vuqLwidLm3HTr3RblYlcJRBcgFFu
	fZuI160j2TE8Ij1lhxlR9rAUM+9BI8/kWurBlx9JkhgBpBw271acLj2h0/rCsCrQHxqfR0otQ+y
	2XnwlWOmfZin44mRcvCQRWDXmn2qQ+WytRbfh
X-Google-Smtp-Source: AGHT+IEwd7Gf6hgJAw4LIn1Bho0OU4WXw10FA6rDXMkVbkwBgy1MbcK51lDeLQeZtkXBfDSj49VYXwad3mLdbMUlAsM=
X-Received: by 2002:a05:6102:1898:b0:478:5850:cc64 with SMTP id
 ji24-20020a056102189800b004785850cc64mr2168641vsb.6.1712234272614; Thu, 04
 Apr 2024 05:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403194321.88716-1-benno.lossin@proton.me>
In-Reply-To: <20240403194321.88716-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 14:37:41 +0200
Message-ID: <CAH5fLghG1W0ivtERe_WZrGn1zSAxE7v0W7YDCh21_XO1Pgpqdw@mail.gmail.com>
Subject: Re: [PATCH] rust: init: change the generated name of guard variables
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 9:43=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> The initializers created by the `[try_][pin_]init!` macros utilize the
> guard pattern to drop already initialized fields, when initialization
> fails mid-way. These guards are generated to have the same name as the
> field that they handle. To prevent namespacing issues when the field
> name is the same as e.g. a constant name, add `__` as a prefix and
> `_guard` as the suffix.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
