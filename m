Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A42F49F6
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357837; cv=none; b=t7nJo1QMop06/Lr+6VklK3MLWOBDKE08y4NowhEB4JEqzotrc1LajzDTJ9idspCFY0PNrdRnyYSOv/rL2yArJjciQDWaoLeXoXJUiwZXtPEd53itA9/XeXHMniQWFYCONZXO4Px/ZVaVcdDtMeJ8zlEjdoua8y4Lxgv8yvKPWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357837; c=relaxed/simple;
	bh=Rxt1iFTY80G3NXVz8lanRkYmBpGdYNNt5aEo+2+W95E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkLNr/jlRQNbYW0rAGocUVbVV4+8UaL2LGsEqWpUKF9IHutnUCumHFJOEjZtmqjFIjCsMyHNHnAThWdre5bGumo8+ogxCA2J4kjrlvAc1XXI1Gznn6eMuLuqdiwmXfwYQ7kD8as6AXXTuP0h+zuwDf5HjulYKlOB4mutW7SGmP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab9e666ae7d811f0a38c85956e01ac42-20260102
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:12cb00a0-6576-4440-a394-64bdddd241cf,IP:10,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:53,RULE:Release_Ham,ACTI
	ON:release,TS:53
X-CID-INFO: VERSION:1.3.6,REQID:12cb00a0-6576-4440-a394-64bdddd241cf,IP:10,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:53,RULE:Release_Ham,ACTION
	:release,TS:53
X-CID-META: VersionHash:a9d874c,CLOUDID:6a4c0ed8025c96f9d29ea701a64cc0f6,BulkI
	D:260102155739LWOE55UY,BulkQuantity:22,Recheck:0,SF:17|19|64|66|78|80|81|8
	2|83|102|841|898,TC:nil,Content:0|15|52,EDM:-3,IP:1,URL:99|1,File:nil,RT:n
	il,Bulk:40|20|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,
	DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,TF_CID_SPAM_IBB,
	TF_CID_SPAM_FCD,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab9e666ae7d811f0a38c85956e01ac42-20260102
X-User: sunke@kylinos.cn
Received: from mail-lf1-f46.google.com [(209.85.167.46)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1949770753; Fri, 02 Jan 2026 20:43:42 +0800
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594270ec7f9so13284900e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 04:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrh2McgAxn1ND3bIcl5TOnzg4iDjKmDSjoueqLLR86SjLImIgtuSJJtUBfGgUx2Js5DRz2e/Wv/HGJiItH6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQwk7dYBRHW9/Gpgqpzlaa1v27hCNdP0uHWdWujNGU1iGNR+f5
	lHFf67kUEB6nDwjkbAh3P/Wq/AEEqp8H8x7zK6LjOy+3nkZBtRVADqZuQoX1YvZdPu5orNvVp+C
	yT6CxoWapMQy5OaSYQjxi4jYhdAZglO8=
X-Google-Smtp-Source: AGHT+IHTTN+OOL5fJSYw93s5U2lMjsBlDyZf1i8mGYMkrOA/Dnyp97w4B+BGzEIJ3hrka79lTzaPT54UxM5gJh4qEJE=
X-Received: by 2002:a05:6512:2310:b0:578:75b3:4326 with SMTP id
 2adb3069b0e04-59a17d46ac5mr10863887e87.29.1767357808475; Fri, 02 Jan 2026
 04:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101081605.1300953-1-sunke@kylinos.cn> <20260101081605.1300953-3-sunke@kylinos.cn>
 <aVe3R9_Jz-eOFJ6U@smile.fi.intel.com> <DFE3UQOFLT3S.F3KUNPIXSAPW@kernel.org>
In-Reply-To: <DFE3UQOFLT3S.F3KUNPIXSAPW@kernel.org>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Fri, 2 Jan 2026 20:43:06 +0800
X-Gmail-Original-Message-ID: <CALpAb9P9qXqHawSkF=cUUhS1a8C3oqJd2qEq=jjQk-B0WoCFPA@mail.gmail.com>
X-Gm-Features: AQt7F2pxqT8Wsu8wfEG0tJoFO2lL014BYjKviNLXzir2-pC5bEKv6adKm9x-JD8
Message-ID: <CALpAb9P9qXqHawSkF=cUUhS1a8C3oqJd2qEq=jjQk-B0WoCFPA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, John Ogness <john.ogness@linutronix.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Danilo Krummrich <dakr@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=882=E6=97=
=A5=E5=91=A8=E4=BA=94 20:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri Jan 2, 2026 at 1:17 PM CET, Andy Shevchenko wrote:
> > On Thu, Jan 01, 2026 at 04:16:02PM +0800, Ke Sun wrote:
> >> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Definitely wrong tag here. Please, do not apply random tags on behalf o=
f
> > others. You must get it explicitly.
>
> Ke, just to avoid any confusion, it also strongly depends on the situatio=
n.
>
> There are tags that are commonly used without getting it explicitly;
> 'Reported-by:' for instance.
>
> For the 'Suggested-by:' tag it depends, if the situation is 100% clear it=
 is not
> uncommon to just add the tag, but in general - but especially if in doubt=
 - it
> is usually better to ask.
>
> It also sometimes happens that maintainers convert a "LGTM" or "I agree w=
ith
> this patch.", etc. to an 'Acked-by:'. This sometimes happens with new
> contributors, but in general 'Acked-by:' is (and should be) given explici=
tly.
>
> For things like 'Suggested-by:' I also recommend to add a 'Link:' tag wit=
h the
> source of the suggestion.
>
> Please also have a look at [1], which explains which tags require permiss=
ion.

Thank you, I'll read through these rules carefully.

>
> I hope this helps!
>
> - Danilo
>
> [1] https://docs.kernel.org/process/submitting-patches.html#tagging-peopl=
e-requires-permission
