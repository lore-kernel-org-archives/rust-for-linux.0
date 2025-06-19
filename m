Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C10229B02
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336479; cv=none; b=kyuL5IsdfaURFVgdk8j45TvSelTlxUFnAcbgQ++vdqWIJ9J/HGTMyQQlGA5ackf7+y6DT105VvkoBE5ny7LXAWO/qYYdjOY00uzhbZeRQ4siVF4uVJbYXWpNXVo6JYVgVNnBPvDg41HLAGaHdTaryW6mneB0hxEfN+F8LgYzH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336479; c=relaxed/simple;
	bh=O79Qs234XUuzBiMc8xVfL2ZNSqHbnSBFeTvs2ta+R5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNAVnMwYPv7Cux5jME+JwZJ712X6psZ6fU+5/aXFcsdCPgTD/UQip8sOomtqGzwDBZVdjluJxrMPKArf1mf694PGSV1JFXLCzwjt3jrXkMzqsDgLEoSZFsAPDhJq7f22HTu861K9Tv7iLgctOG0xQPD90NNCSauIObe0Aho1cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4WYVhW5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4WYVhW5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54700a46eso454658f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750336476; x=1750941276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUmxy/Hdai8107zqpCeX8C6jaNfW6QH+rBn5HzKsl7o=;
        b=P4WYVhW5OdgStT00YP/SHofFVOCHZL3LW8XHwwheSmn/hrt3riGJvR1ssxOdt/0MLz
         8o74W17VJtYvwOdC6BNLVK2Sb7R6RU4ZHjgwbR7ePpUP1dVOQ3WToavk4WNtrBT/ui/o
         njnAlwvzPqjeSvVbJFK9KqKyNkBq/wwAPqnKktduzbSkpo5wJR0Mlh2vQ8LcHEY0Y2hu
         IYa9aHX4PLSgpkEdUAzTfAHCgZZmeWCOBw1CHR2ZeXMzBjieyYpSA+r86VISsuGRNSEx
         6f1Qh3hF1/7SrGWhavVdRSbNnN11zyQo9LGk0TgiBN9OHX1Ck1hk0UE30UcCIsIYJCP9
         NgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336476; x=1750941276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUmxy/Hdai8107zqpCeX8C6jaNfW6QH+rBn5HzKsl7o=;
        b=Mxdf1kQwbBsWVyDHW7wwF9gBtZZH2oCsIKlUi41QSovfToHo2X8qVzsmvmRRypyEpu
         N8U25h7BlL2EEB0roFsQhz2yWVpRI5ejnQH2Gvz6awsRHfFJ1z3DGGFun2VtJrKzKeTw
         m8ko/OkVPzb6UPe/P9Oz9DN/zIrbWWlGdjNe08hd/+ooUAvyPJlTQis9ZRLwNhx6FlkY
         HPXxWmxzOSlaQMh+oeuMNiC+zZn2NvFmvIUjoIqeyCznowm9uR2aIeclv5btKRGFfS1a
         +oUrxu3/AR3CpGOcWl3sLp0oatW2lEPcjMCk5Dd8ARtaUNPk7y43v6tkkFRzNf0Cmg0U
         R4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXhwKzamuh1YYOE0SYPotVVY8GbyolGn34btZwsu//nu21pp6EQpLi+3nDTHx3iDaXd3ehPolaQNARLCLiB6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7UNVZOqPZyT0JNUkW3EnmnTwXiCqjLxuKhJ00HZwxdk86/7kx
	89HUvs5M58TJhIalqql1sTPPvyCHKulZ2EZV/o5bMNdaEqimixUEVX7+aNfTXmrx2W66YF53PkG
	pQmbykDjbnJ2eb4emOC7CCegFm9og4/w2RhR2y2v1
X-Gm-Gg: ASbGncuTnNRFtU6Nnil4bhy7s/esr4mysBPfTC35EN2HvPQ9Lq/1UX02BbPgy6qH6vd
	pJndmQEVvLBLRi691R8PGa/+QZkzTGmjsgWJVGGE3MJo4bNF22KZwES7k4bCXwh7fPk2uVetod7
	6RYDv0jcnP41SxGnEbAFbPEm002YXaS2j7gceZAzeqodSJeSWinLZDQJyZEQ4X9WuDg/AgY98mY
	g==
X-Google-Smtp-Source: AGHT+IF1gwD/zXJVqfwqTcm1IO6KBTRJQx5xJoQ9nmxLVDVOLDa0YMpOdlQTsc+e2Vchuf7u9PpveNnDcAMu2ctt+0c=
X-Received: by 2002:a05:6000:2f84:b0:3a3:63d3:369a with SMTP id
 ffacd0b85a97d-3a57237c5bamr18481410f8f.25.1750336476215; Thu, 19 Jun 2025
 05:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
In-Reply-To: <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Jun 2025 14:34:24 +0200
X-Gm-Features: Ac12FXyZ-tFdKD4al7sN6xdj4fhGj-fFwkD4_1_dcr3JFbcXggzsKpKEk98zuno
Message-ID: <CAH5fLgguROtxet420KZND9NYUYUZ4ob7TsczkYFNaMeRoQK5=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, daniel.almeida@collabora.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
	tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:01=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> > On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >> index 445639404fb7..12b296131672 100644
> >> --- a/rust/kernel/drm/ioctl.rs
> >> +++ b/rust/kernel/drm/ioctl.rs
> >> @@ -139,7 +139,7 @@ pub mod internal {
> >>                              // asserted above matches the size of thi=
s type, and all bit patterns of
> >>                              // UAPI structs must be valid.
> >>                              let data =3D unsafe {
> >> -                                &*(raw_data as *const $crate::types::=
Opaque<$crate::uapi::$struct>)
> >> +                                &mut *(raw_data as *mut $crate::uapi:=
:$struct)
> >
> > I think we have to document the guarantees we rely on to create this mu=
table
> > reference.
>
> If the C side is using pointers to read/write the value concurrently,
> this is wrong, it needs to be wrapped in Opaque.

There's no concurrent reads or writes happening here. I think the
Opaque was added to deal with transmutes to/from byte arrays.

Alice
