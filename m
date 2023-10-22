Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86182901
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLWnKMtf"
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73BFF7
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 05:14:16 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9ac9573274so2233824276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976856; x=1698581656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nha/7EDH1/xPAS+LVMDqBw1Gl9LC8I8Um+Po+5nwgD0=;
        b=aLWnKMtfy4XxAwnBv0ojlVX4h2uCheMkl2we5OhUqXM9rVunJqMlB2XwOhBUG6rKUj
         5IL668MT623ZnRdbyVQ26NCnpn/3EUiIv822R3TkbtDYtgPPJofhvOY6iwIXTVg8/qVH
         7Uqhpbl2fBzAWsi2n34o6/DX52w+9lXsHqzmizXejAqGPsiJNF0z++DSHXYCOZYYkiwx
         WPPKjb8/2XkG4R1lHrQnRjuWjy2Kr9XGbvspYbiXH1b/oF7OFUo8+17dHBjLdk3asCjk
         hRaZPyWF7RDbLaFaV/X3mEEmNNGu3ZRwq3RjAZ70j4cIux4JqqWB/TeOdJBbABxf34xg
         wxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976856; x=1698581656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nha/7EDH1/xPAS+LVMDqBw1Gl9LC8I8Um+Po+5nwgD0=;
        b=YtAca8TLG2JbAo5uBRSd4wxSphEJyxk9MdEBc8xavYiQY7rx58tfBIKRkG4KI4x4et
         YHK8YK/znJIlzZcXHnwMrMhPeAWafopdCwvoEcgOTe3veZJ8FI07Bl8btQvz4P07jlUL
         nehLfj2vMrcz6OXN+kVqCf8hRBEqav5oyKW8rgmCwZcylKA5MNq662yBE2Gd4lXO/DtG
         lGEz44mpbL0iFP4wr+aCbCassh4kgtChXoWkJmzYM9FkzSs2dQJsbUy5Fo3uPFCHQ1h9
         aSFn/pJhTCn/KFyS9177BjNMZx7Hv5NEJvk4YvGUwcHcOFcgr+2gAM7HqNI7DY47EE8U
         66tg==
X-Gm-Message-State: AOJu0YxTUBxuq9MYIJOWcyr6BVJkx2sI4SJE3JxuEgleJUl+wTDUZW5c
	VE8aipH0ceowqtXO47Ss1AgQnFJnAHU1O9MkX9M=
X-Google-Smtp-Source: AGHT+IGnsPTxyFby6geqM8jechMXmbzeVqAK0argzy3xrQK44Z9naBRaDJK71v8EFXdT8MX0h3ta7/nZueyQe+d/Vm0=
X-Received: by 2002:a25:455:0:b0:d7b:9211:51a5 with SMTP id
 82-20020a250455000000b00d7b921151a5mr5708525ybe.44.1697976855913; Sun, 22 Oct
 2023 05:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <ZTKuxaIeX3QMgdeI@arm.com>
 <CANiq72=hpO8dP_B0=gOocCeaC-GDNQJx1MeA2HDZcEKDt4ZepA@mail.gmail.com> <ZTT+GMucKZ192yuv@arm.com>
In-Reply-To: <ZTT+GMucKZ192yuv@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Oct 2023 14:14:04 +0200
Message-ID: <CANiq72kDxhDMwdEo2QTSK-aVskCB65sMK+30wEhVwHnRVur0hg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 12:49=E2=80=AFPM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> The main reason I asked was that the first patch touches x86 and none of
> the x86 maintainers have been cc'ed or acked the patch.

Ah, yeah, they should have been Cc'd.

> I thought
> there's some deal that Rust-related changes go via you tree.

I see. The initial pieces went through our tree, yeah, and we are
happy to take things if needed (without the intention to bypass
maintainers), but if maintainers can take things already, that is way
better; e.g. some subsystems have already started to do that (Kbuild,
KUnit, wq...). So thanks a lot!

The only thing we ask for, for the time being, is that patches
relevant to Rust or that contain Rust code are Cc'd into the
rust-for-linux ML if possible (i.e. in addition to their usual lists),
so that anybody that wants to follow things in the initial setup
period can do so in a single place (e.g. maintainers that want to see
the sort of thing to look out for in reviews).

> Thanks. I'll reply to the first patch and cc some x86 maintainers. I
> assume your ack applies to the first patch as well.

Yeah, it does.

Thanks again Catalin & Will!

Cheers,
Miguel
