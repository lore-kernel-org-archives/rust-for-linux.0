Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3071D460F
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309563; cv=none; b=p6vSb1IgXXM3tB5i1INgpl5CFDwKey3xkhT81juyf2jkUrsPoDqVfMYSx0jb4PbLZaC3HCbcu3K04JdxavGaMr7DeHm9A9aqpXqEpKFxgEQa6tvmaJnTDp6ba31yrcWBQW5XIWLSv91rRGEqMRP4DcjvpIiwSzc1dE2UD4VKjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309563; c=relaxed/simple;
	bh=xc/x30uf9iyb5xezbKYekNH++PSzPkxlm8mpT+Naf5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMdPrBlXnzSmRiJZ1R2IgUkau3r11SKqPqd2J3vNoTHqxWsHyt4OTFcJ9hrmD/EabkPRngfYyDxV6tPtLbARXwSF5SE8YMEmqsFQDMz30fRiomb/J73udawcnouTy8CMDk7rqKsry2CVsI4tjaPejOUacsvigP22DkHdobstPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HN4vAl2g; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HN4vAl2g"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso2982816f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728309560; x=1728914360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc/x30uf9iyb5xezbKYekNH++PSzPkxlm8mpT+Naf5M=;
        b=HN4vAl2g+LwuAJFMU+IXfMWdo5Im20EHErQ2uFXinS4Z/EJxbZyYkTU+ojlXXztFDi
         LpXMkFdZXwRLpbQv1hTCCWOodCmk+ASEEasAG7D0IKIov9efxR3ZChlsG9eSz150OjjX
         Lf12nL8wXDLKhKnpczBVdmA1a2uAA6PL9mLoAk7WKyxvYtVJ1lbJds95sgYYjxHgTVFW
         /Y48FRknMfpfhQtfDTeHax2SvumuKW8UvPD5r6S/YKCzhml40tbv/dUBCIpBMAGBAiMa
         VmSgToCfuIaQ8IWDGCCoVRjtSKG4TIWbb1KvrJ6vCYwNKnkv7sW4qi6vD4/pYhDrpI2o
         KSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309560; x=1728914360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc/x30uf9iyb5xezbKYekNH++PSzPkxlm8mpT+Naf5M=;
        b=SHOrveEBbKnj2hLpmGeQ+gkvg14k59cFy/AW49Kz1SIu5HFeq/tiBeEpfLmmTjQBJx
         s344odflT54hI26fvarRYQf9Ei7Y7TDsXtIDfqetjXls1QynpImUDwJA0txNZkPRgSHD
         TAjBFHVr11HzKgn0DnLzTE0LofrirXhDuPhkM+VmAeblT/CtQlG0hzo+Pp538QEqEBcD
         XAPBGUu/6sMQoU3zPh5D0PFI62TYWx2/lvlu24me2UmYq7HTA8AIA2wJoj39bFBegFGG
         MQDeXCORHFySs6zyDHysUEiStj3sIudtrc+o1Ju0flMQ7JSYXZf3IX8O8jSoVFXoCAVE
         FSZw==
X-Forwarded-Encrypted: i=1; AJvYcCXfERW6qmKLouRzvbhez78j3HLzbgFuCY/BjcbHr1N9b9FOb4MC60PKTPru3Md/liFohwruMJWuXLRZxAWU3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgrzJhYz3WIe75XOaYarui8R06kJvfUWcAp+MczS7ILQ3Gk+0
	WYmwgLyT2MhvjUceG2MsoFpb+9G727zVf3WlS2unpgkJARB7gQyrS0LzbBAWKbB1QoGE6dou4bl
	Apyt5aFOPvROqn6DOQzKtjOYW2H9a5E0Ld0Qg
X-Google-Smtp-Source: AGHT+IEt/ppds1p51xP37UM+hKVF1KH288oFeowg/BwHOg7VYcXokM6av1Qx8ie/tkzTdafDoXlV9Nm6Gj+c3Vp38l4=
X-Received: by 2002:a5d:5e04:0:b0:37c:c5c4:627 with SMTP id
 ffacd0b85a97d-37d1902b4a7mr4418321f8f.5.1728309560112; Mon, 07 Oct 2024
 06:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005122531.20298-1-fujita.tomonori@gmail.com>
 <20241005122531.20298-2-fujita.tomonori@gmail.com> <3D24A2BA-E6CC-4B82-95EF-DE341C7C665B@kloenk.dev>
 <20241007.143707.787219256158321665.fujita.tomonori@gmail.com>
 <CAH5fLgirPLNMXnqJBuGhpuoj+s32FAS=e3MGgpoeSbkfxxjjLQ@mail.gmail.com> <f31d6f3e-e53c-4ced-920a-976ac44235e9@lunn.ch>
In-Reply-To: <f31d6f3e-e53c-4ced-920a-976ac44235e9@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Oct 2024 15:59:07 +0200
Message-ID: <CAH5fLghaLTMFS18cdjY6ntQ8BE85APjG71F1MvEEhxG667HU4A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/6] rust: time: Implement PartialEq and
 PartialOrd for Ktime
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, finn@kloenk.dev, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, hkallweit1@gmail.com, tmgross@umich.edu, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 3:16=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Oct 07, 2024 at 10:41:23AM +0200, Alice Ryhl wrote:
> > On Mon, Oct 7, 2024 at 7:37=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> > >
> > > On Sun, 06 Oct 2024 12:28:59 +0200
> > > Fiona Behrens <finn@kloenk.dev> wrote:
> > >
> > > >> Implement PartialEq and PartialOrd trait for Ktime by using C's
> > > >> ktime_compare function so two Ktime instances can be compared to
> > > >> determine whether a timeout is met or not.
> > > >
> > > > Why is this only PartialEq/PartialOrd? Could we either document why=
 or implement Eq/Ord as well?
> > >
> > > Because what we need to do is comparing two Ktime instances so we
> > > don't need them?
> >
> > When you implement PartialEq without Eq, you are telling the reader
> > that this is a weird type such as floats where there exists values
> > that are not equal to themselves. That's not the case here, so don't
> > confuse the reader by leaving out `Eq`.
>
> This might be one of those areas where there needs to be a difference
> between C and Rust in terms of kernel rules. For C, there would need
> to be a user. Here you seem to be saying the type system needs it, for
> the type to be meaningful, even if there is no user?
>
> Without Eq, would the compiler complain on an =3D=3D operation, saying it
> is not a valid operation? Is there a clear difference between nobody
> has implemented this yet, vs such an operation is impossible, such as
> your float example?

Think of it this way: I wrote an implementation of something that
works in situations A and B, but I only use it in situation A. Must I
write my program in a way to make it impossible to use it in situation
B? That's how I see this case. Implementing Eq does not involve adding
any new functions.

Alice
