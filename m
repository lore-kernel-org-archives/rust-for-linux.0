Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B453A1E99
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061926; cv=none; b=TT102JObZ1Nfvfo/zEegAUZ6mo54h745MB3GYK1qEkdoDV1+ecCDZLyqub1bFgTXxVpip1qnPGdkftcpM40Xfp7+KQRIDJKLCPU2V9qxVTpTKoG6K20YFxkU/lxt2S5IGQfZxw3t/2WD5piXYEeUmW2Vl8JEm33yOrJ/byWlVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061926; c=relaxed/simple;
	bh=mZpcFsiDsMdfzDQ7IkSay7abYOpA/q/3rUXpwFeDu/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFWpF4xfUMbzNfDy2E+m+FWB0fn43TYNG602PFlkvzHhMFBsXxkdDWtioqGvPGhUJ7wp5hD4+kSUVOyGEiPeEo55HhZOwmcBgwRDV7UREqKMPoUsJ3DjyjuD1ilnn5Gokd9MOjvHEOMZM3fqVewa7LT9N5LwlsbZa6SM96fBIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b2c117a2e52711f0a38c85956e01ac42-20251230
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:099157f7-c7ad-4107-9b9f-afd02f59fae9,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:099157f7-c7ad-4107-9b9f-afd02f59fae9,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:639f8db1dce0dd1cc4617e42e7eebb00,BulkI
	D:251229221205OKNVCSE9,BulkQuantity:18,Recheck:0,SF:17|19|64|66|78|80|81|8
	2|83|102|841|898,TC:nil,Content:0|15|50,EDM:-3,IP:1,URL:0,File:nil,RT:nil,
	Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,
	TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2c117a2e52711f0a38c85956e01ac42-20251230
X-User: sunke@kylinos.cn
Received: from mail-ej1-f42.google.com [(209.85.218.42)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 517902280; Tue, 30 Dec 2025 10:31:51 +0800
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so1218378466b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 18:31:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWqjL+Sl/9qb5oaML8+sdbgeUxNnNEMhPz7VeJGS39FdwRKF2dDrDzmr5KXdBadF1Nfs1gheBA63hAIk5ktQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wzsfrB0VcfIV6fjonVuyXzUsuVJ3vW+UDLotuazO0spDKlau
	TKl+YxeN/LBViakhH7DaQ4OBqY6gtAbG2LdHnkxlD5e/Jd0gECUetaSc2LkkwEhLAo8p0ftNV6I
	4wx94eWpZgziLyMVXf/b4zBEYDzQefz0=
X-Google-Smtp-Source: AGHT+IGbPx6yPZXb9Z/fUGND3qLuvlD56R/syfoH7VyhQyOLynZA9J+NdVLa/qkq1mujGBuKJvKy8lE3nH3JPVl/Hfc=
X-Received: by 2002:a05:6512:b90:b0:594:2654:5e3a with SMTP id
 2adb3069b0e04-59a17d0e9c8mr9855575e87.18.1767060209593; Mon, 29 Dec 2025
 18:03:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <aVKMJ3prJu6cqANm@smile.fi.intel.com>
In-Reply-To: <aVKMJ3prJu6cqANm@smile.fi.intel.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 30 Dec 2025 10:03:17 +0800
X-Gmail-Original-Message-ID: <CALpAb9Omfq8+KoC6Vwgpi+hzy9RezrG+_FiWVc6xf=71iRDj9w@mail.gmail.com>
X-Gm-Features: AQt7F2qTf3Hnmm4HBPlTO9kgEe9bycPn29ixHAsKtxlBPTnxFZh8rNQsStCgzsE
Message-ID: <CALpAb9Omfq8+KoC6Vwgpi+hzy9RezrG+_FiWVc6xf=71iRDj9w@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] rust: Add safe pointer formatting support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 10:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 29, 2025 at 03:21:18PM +0800, Ke Sun wrote:
> > This patch series adds safe pointer formatting support for Rust kernel =
code,
> > providing three pointer wrapper types (HashedPtr, RawPtr, RestrictedPtr=
) that
> > correspond to C kernel's printk format specifiers %p, %px, and %pK.
>
> I didn't get the motivation behind %pK. Also what's about all the extensi=
ons
> we (currently) have?

I'm implementing a R4L wrapper for the RTC driver and currently only
need basic pointer printing. %pK is typically used in seqfile to
export information to userspace.

All extensions can be implemented by modifying and exporting the
corresponding functions in C, then adding wrapper types in Rust.
What's your recommendation on which extensions to prioritize, or
should we implement them all?

>
> > The implementation ensures that raw pointers are automatically hashed w=
hen
> > formatted with {:p}, providing safe default behavior that prevents info=
rmation
> > leaks about kernel memory layout. Users can also explicitly use wrapper=
 types
> > when they need specific formatting behavior.
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
