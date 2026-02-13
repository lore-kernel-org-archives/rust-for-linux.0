Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603936167E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993840; cv=pass; b=udC9Dg5Cxg/sYsOCsrrNV+gOIQmIMq4zxMl6S/zXCk0brC1bVfB3724rhOzXIk9gOS2xfPncmuMoRtoJkmyfGttputngKB0H39rEOrE/Y1EFgrhs1RyZWw4A1onOFwKF0PeN4yS9vEjopl7zAgO4C21112MYxK7dUP9awo7IofQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993840; c=relaxed/simple;
	bh=95lJnaXOqG6dlEPatDL83cmveXX6CY8l4GlJA69e3xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hh37FTJTYjkMgPzyLyGxAo+nkY3yIp60TluKprI05eQYC0b8IVS4ZHx1pwxV1nBA7k/XFKcLWmMW2pqqUCBdKTgFqzmIIg51QjuFMgzWyxMnobOxt3yHz6Oguc3KX3caOnNQnE/cgtSqS2uNa/6+qM1O4ZnW/vWyESpPTL8xwSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V36yd+sP; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V36yd+sP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so8479a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 06:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770993838; cv=none;
        d=google.com; s=arc-20240605;
        b=YakRyYvnRbUAzDHWinf0XB5oybXcE9Lhjj4d2oD0j7jNAtVDNIU90EwMYGbSLTYDiF
         hsK30RN0H5868WcAVRmLTEC+hquzVwWhVY8qXYRwBa79xuAsbpP6wKxC2QPTMSosFO/r
         EZD0/WoXlqAYArhUYr2fn5DSkePXe2FlSYYUOv2sgtwuBVvTeaCPn+l4xQKBqnrP2t3i
         WOMDsiC5WqqLLF/3EgyuBuTY0d8r8/FzGDFinPGwo7c16ZDBV2zy0O2PewTJtGV/1SeW
         2MsyavPdfLz07P6q4fyr37YnyE099XnxG+p4XAYKDZ/fBqWrd/tbvOEcZIR2UDRlfprP
         KjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=95lJnaXOqG6dlEPatDL83cmveXX6CY8l4GlJA69e3xc=;
        fh=sEg2nHAaZ7sc0iEBhS1Jl3FjWtuMP5/pqFeoWoFoQBI=;
        b=QJhIP7NjRZCZdAvyU4fpfiWSW3+lWEEkOpZjVygHSBdaDop5nIOC+tzs2XutFMHZeF
         cNLt43s9b3nyQZgpfPIin7apjWHgo78Vim32208jTUpN/Vmavp9cVovOUE5SrsAiWxXK
         6onPodnuuEnQMzIb14cx1gM5jnmziqHztthTfi+gjD/mE9jdcw4TEB4KZ4Myj+oHe4oZ
         /flndl9uRjPWXBVfrJu078u9adWKTp/iCpHwiQKwwcP+iOvUDyuoajj0w9nRz6KIsUmo
         XUpbJmPmJ2dzCmXu5442noxVAHiYqgnj9DQ5RcnrNJ9meI2qh6Gz06MFTMWItRDgJXqq
         PbeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993838; x=1771598638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95lJnaXOqG6dlEPatDL83cmveXX6CY8l4GlJA69e3xc=;
        b=V36yd+sPAk7m1YHOpbS+KEwHMewO0HpU4QEh//aYOorb+OnuxAywE2ifh8xc1SaoZl
         M3mG6x3Qqd3n8F03yst9xw3i4OhzQmdggCP/KSNgzNGUJcEahUeajDC5MqyGYz4nFhew
         Nhpu2Mj9l6YoJuiKuxSE80r0R8dVFA/Y8iQcE7/jSSQqjx0E4afbZlijlZ86JsP6AEc3
         E3SO7cvXrnkaCc7PKIoDAT5i1lZ51D0wUlqdgxfYyYMka6DsAdSLvPdYVUbbcsPKbDtD
         Rg01c003qyxkQv/4NsEEzkISL2RqV6D6pL2NPs7oE11KTX1uGadezPFCs0z1IdvTsmhA
         k3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993838; x=1771598638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95lJnaXOqG6dlEPatDL83cmveXX6CY8l4GlJA69e3xc=;
        b=t1kL9VGlOnPm8JarP6GOITAe0QAlt3DV0n4RDtIpo+rMQPyUs5ZnAMrjPgCRfwFSSw
         kG3Kf78xGMIya8/AdlfYVORQqeMpJRrhmLJYnyJEkwO0OB2aeh28vJFTjoDHI936tTCj
         +Jcbpt8UTiJdhhmTXAM4WKRO+8xmU/EeYlVOWWWzyYI3Dt3NROejQpn9QkvU5DJliRhP
         hwQYLt+K2dFY+yZ93MTeO7fsY8gFhzgrIQqqq+uvTpzU4UGJe1N2wCYaQaOA912bzZEB
         vXmQqCj/oMk/JpmWk2X0NvbpWFR9GsaN27vHWCXaX4ib3d3rDL2kr9bI3Z+ebkXJeJ2j
         owOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnVntp5Q0cDYVgjObofCbcAGpQoq4CT1q0IXFucr/FnrzxnChRSXBl46pIhX+AlXFAFAich3H9bpP+a5wSxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6XctHIomi4Q39wz40ZDMhK0D6aNl1sZITRzrluMODsj7dj+lf
	8pq5906xUWTL3mXSLO+4lu5oa1wjps3btVOCQ5hwNgbctoj8Xzjt8BWYllLbFLXAcE6jNWfvfuP
	s20xEp6syBxs1cCwkoLFrRSbqVPIFLewp4EYHP+ab
X-Gm-Gg: AZuq6aJ34BsHdFjavScYUnkRZW53W7JvUEhcFdN/YJW3w6lCPMfWRE6OZF7vx0PFlg0
	+UVEPcxij3G7KqN9Hp/+ZNWWOaqwNCNzw1Kmxs4G2zrNhBt8e/qmBU9Jt498XLdCyQ5n7mk+9l7
	hBZyTCLx5gcBcyI6vAiD3+rh9VxFP4BB1Wrn4m+sNBvdoj/tr89P3pKGBe4B3gjVStt3Bz8Wt6t
	2A9Ds0HE2e4G5Xz7wzBCTJ9yl2M/7U1Q2Z5pJtx9vaNrR2GBM1TEDhVxNP07nsDd5HO/rnkrLKs
	RMJSpGM0jMHnGExVtSqcZQH56sZmqpYil6eoiQ==
X-Received: by 2002:a05:6402:4048:10b0:64b:560e:41e2 with SMTP id
 4fb4d7f45d1cf-65bb07376d5mr19426a12.6.1770993837408; Fri, 13 Feb 2026
 06:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com> <DGDPG8TL1IGS.3OVN0KU25D9YA@garyguo.net>
In-Reply-To: <DGDPG8TL1IGS.3OVN0KU25D9YA@garyguo.net>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 15:43:21 +0100
X-Gm-Features: AZwV_Qjw9zojk_i5YF0Q7qiRDRzvonDfLFN4qG_NBwhRFJgH9mYUqrdbYgc8xQo
Message-ID: <CAG48ez0=4Tw-FKF5VF+MZNj4sCqi3CTnbB5PHqvC4mo=3s3Rvg@mail.gmail.com>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
To: Gary Guo <gary@garyguo.net>, Todd Kjos <tkjos@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 9:53=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
> On Fri Feb 13, 2026 at 2:00 AM CST, Jann Horn wrote:
> > Linux has separate subjective and objective task credentials, see the
> > comment above `struct cred`. Clarify which accessor functions operate o=
n
> > which set of credentials.
> >
> > Also document that Task::euid() is a very weird operation. You can see =
how
> > weird it is by grepping for task_euid() - binder is its only user.
> > Task::euid() obtains the objective effective UID - it looks at the
> > credentials of the task for purposes of acting on it as an object, but =
then
> > accesses the effective UID (which the credentials.7 man page describes =
as
> > "[...] used by the kernel to determine the permissions that the process
> > will have when accessing shared resources [...]").
> >
> > For context:
> > Arguably, binder's use of task_euid() is a theoretical security problem=
,
> > which only has no impact on Android because Android has no setuid binar=
ies
> > executable by apps.
>
> If there's no setuid binary, then the `task_euid` can also just be replac=
ed with
> `task_uid`?

That would still be wrong for binder's usecase though.

> > commit 29bc22ac5e5b ("binder: use euid from cred instead of using task"=
)
> > fixed that by removing that only user of task_euid(), but the fix got
> > reverted in commit c21a80ca0684 ("binder: fix test regression due to
> > sender_euid change") because some Android test started failing.
>
> What exactly is relying on the current behaviour? It'll better to fix tha=
t and
> remove `task_euid` completely as I find "objective effective UID" quite
> confusing, even with disclaimer that it shouldn't be used.

I agree with that; I don't know what that failing test was. (Todd
would probably know.) My understanding is:

In the current version, the ->sender_euid reported to a transaction's
recipient is the EUID of the sending process *at the time the
transaction is received by the recipient*. (This is wrong if the
sending process changed credentials after sending the transaction, and
especially dangerous if the sending process went through a setuid
execution in the meantime.)

With the reverted fix, the ->sender_euid reported to the recipient was
the EUID of the sending process *when it opened /dev/binder*. (That is
secure, and capturing credentials at open() time is a standard
mechanism in Linux, but it might be surprising to userspace code that
calls seteuid() between opening /dev/binder and sending a transaction.
I guess that's probably what that failing test was about.)

Probably the right fix would be to capture the current_euid() in the
sending process when it sends a transaction.
