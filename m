Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C8205AD6
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733268396; cv=none; b=aoFtpf+GKFs++40Ug37ajI71jzjvdcmPnC6u7TPyZd9ZWG/dMYyleSrtC2dW+uNkUX+g380qPMz+er4oPbSVvZ8tzvdBR6yA2sYM3REofXIkYKi2mxbrfgCxAV2aDh/6yr6HNtY3fNyVOUrlhhHsstRGBKrzFReInegRhOkx7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733268396; c=relaxed/simple;
	bh=A+NygRxfATzmDDYl4BW+aoTxyFsALc+e05mYyvBpsWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDxxxwjxrH3JAqOOF2Te7KH8gLbBTCQid+radA3Wm1I/Tm7YRJPeo0Z0Jpxc1nAyjdQs5MLHjolpHpUxZNh7puA76sU0quXwHmE1qXyIoePFfO+4n2pBwfo5fMXhCaTA6q+Er63yBBjV15Q7sTbBoI+HKK7YzgsYLPihxGVc1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5GZLFX+; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5GZLFX+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d10f713ef0so565388a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 15:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733268393; x=1733873193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0gsOOV1IK0tbYsC9eBpU6WfUiWf0dqVzzhWYdaHF04=;
        b=g5GZLFX+dNpdx1YYUJf5LjvBATqDc4vNwiLsd5Vg5f/Q0v1vpIo5LbOagutF6tWpuq
         6YPnniNdcTWkE0F9Pvnvrnyoz9rQRpLflynsw2tat7MCaNvjdvbRURLlw6ilPDuWJGjM
         jwltgiwduh6ZCo5qqzKW6ZY9o5YAhNmfK1NZ7+gO96u9qTwIAKxCwQT3n6BFbosUl7NU
         KJy+Azpyyugs2JXMN6hZZfh1JmHZOlJqSATah+9PVo8y6wgRdTm6n6ssGamQGnEs+vHT
         4lOi6RHdVh+hafoWNSS7MvnG4IuACOc9ad8h6t6tXTl5T+0V+0QY0DDdQXw4VU8auBjZ
         kqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733268393; x=1733873193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0gsOOV1IK0tbYsC9eBpU6WfUiWf0dqVzzhWYdaHF04=;
        b=oGGxxOzx8BkZENoFhxghJssec1bB8WDyZTpp3lD3DHUDEFFhHJ5qAPLJBSjRTXEzoZ
         kk6P6dK4JmN6jlcKw1z2oqVuAcWfzItPHnIG0vONMy9zGZfcV9pIjkkwXIUWNUCLwhEc
         bCbAxbpnNPV8VUnHmFLZiVgq45xCNlbcHjA4PX0aRLJ51PB9nmYNVwbGI9ZUuHwBRjte
         mveFEZNIMTMH0RFsv7a1UuCPzoEAenohCokAOBDXaD16Ov44stTG8zH30TY2x6FJm6VJ
         5uEmlEZ/D5eVUdY/kTDyrADMele3NxCmjUQrc+S2oDtXWjt2g1rwKUOBzVx/5jQ1U2E0
         1OnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCwgp0jPY2b/8CVlpwwHx+rBLveyaxxwk3A/QxSDvlkAmhJI3YJiNvmA+d3a0Ulb5u3jUFtzZS9Zoxs1uiJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4V6oNX/4b2aBn2gaDin1kT4cTHpFfsobqhugLNxxBYC2Ezzol
	2KLhq9gSeZn4Qr8G5SH3KAkCJybVE2gQQa07szoDE8A3lNdcIqFtpeI9EzYJusov6yXagcDJ+wy
	hHZa5ptn1U2GY7JVAK44Jtt4wY8in9ZVDyeT6
X-Gm-Gg: ASbGnctT3+kLP9Ouoqv03HcQKqTntFoQSVPncL0GiO0JrnUndZ8CTHimSNU8sAz5Irw
	BXa9ktgbbAoktr/x1Y+/QlHd602PXp0t5NjtJVYGA5OV6gTZiUQzEIqS7AD+4ilVI
X-Google-Smtp-Source: AGHT+IG44HltO60JYgYmVvMEo3QlcFo1P0mYiAAGDSp4Skz4zAxbxt9ZfqfNSvUY79c414MNywqlUX98rVVFvuuFn2Y=
X-Received: by 2002:a05:6402:1d49:b0:5d0:e9a8:4c96 with SMTP id
 4fb4d7f45d1cf-5d10c2498d8mr3918350a12.9.1733268392481; Tue, 03 Dec 2024
 15:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CAH5fLghFZTG2X_mYE2yGJwPM31NrJdkA-cpZTCYsdghR8YdY8Q@mail.gmail.com>
In-Reply-To: <CAH5fLghFZTG2X_mYE2yGJwPM31NrJdkA-cpZTCYsdghR8YdY8Q@mail.gmail.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Tue, 3 Dec 2024 15:25:56 -0800
Message-ID: <CAABy=s1sEzJZBR6Mt+ujFY_SSbU_OgKDtOs0+bxXQhTo9QZtGA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 5:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Nov 12, 2024 at 7:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > From: HONG Yifan <elsk@google.com>
> >
> > These are flags to be passed when linking proc macros for the Rust
> > toolchain. If unset, it defaults to $(KBUILD_HOSTLDFLAGS).
> >
> > This is needed because the list of flags to link hostprogs is not
> > necessarily the same as the list of flags used to link libmacros.so.
> > When we build proc macros, we need the latter, not the former (e.g. whe=
n
> > using a Rust compiler binary linked to a different C library than host
> > programs).
> >
> > To distinguish between the two, introduce this new variable to stand
> > out from KBUILD_HOSTLDFLAGS used to link other host progs.
> >
> > Signed-off-by: HONG Yifan <elsk@google.com>
> > Link: https://lore.kernel.org/r/20241017210430.2401398-2-elsk@google.co=
m
> > [ v3:
> >
> >   - `export`ed the variable. Otherwise it would not be visible in
> >     `rust/Makefile`.
>
> Despite the missing export, the previous version worked for us too.
> I'm not sure why that is.

It happened to pass the build when KBUILD_HOSTLDFLAGS was empty, which
was the case when it was not exported. But that was definitely not the
original intention of this patch. Thanks for catching it! I have
verified that v3 correctly exports the variable to sub-make and still
works for our case.

>
> >   - Removed "additional" from the documentation and commit message,
> >     since this actually replaces the other flags, unlike other cases.
> >
> >   - Added example of use case to documentation and commit message.
> >     Thanks Alice for the details on what Google needs!
> >
> >   - Instead of `HOSTLDFLAGS`, used `KBUILD_HOSTLDFLAGS` as the fallback
> >     to preserve the previous behavior as much as possible, as discussed
> >     with Alice/Yifan. Thus moved the variable down too (currently we
> >     do not modify `KBUILD_HOSTLDFLAGS` elsewhere) and avoided
> >     mentioning `HOSTLDFLAGS` directly in the documentation.
> >
> >   - Fixed documentation header formatting.
> >
> >   - Reworded slightly.
> >
> >          - Miguel ]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: HONG Yifan <elsk@google.com>
