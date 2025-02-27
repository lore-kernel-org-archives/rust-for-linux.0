Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8BA26F44D
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740683779; cv=none; b=PsjfqpvrAWHH3rP++7SyD6epNZk6oucsMl8eRewVDWx3J7pFUrYFIWWrnJbPBfgpX9eiu2szQscHLg78lDgo5XIVOgd/ojcPMI8pjdI2bgXOW8ADjjtiE17qum7GOH6zbtUp2nghhExtxxYE7VByEVwpqr7T/zzQKn561rsg1ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740683779; c=relaxed/simple;
	bh=mwTHVN620TX5ESULnZIeej/5etZx+q0PaqdGdgEQqhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjYl8+tEKoT/K+GrD/0TlRd+zeV7J59RWc08RjkJcu4r7o5SucM9661ptmVFUwhe5LLMPlX3APZ0VDwwnb9eDFch08ugprXyeVDHc5FhvOzM2DjKVu3Z1Vo5yoJBKICsli8Xds8O2Xfcj8t7vMBZNmUT2sBJboLK3CEfTQffVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LbI8t/5g; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LbI8t/5g"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso1842305a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 11:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740683776; x=1741288576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hvB+JZlfkgHPFuQYjc4Ck/8suSwxp4Qhz+OIGbF3Mns=;
        b=LbI8t/5gF0uAp5jY9Ld96pPYYHmp9LxiI9ybexHb6xxg4pPvhQghew+uL6D0x/+g6P
         C3iPKVDtpaX0lAkdFjMWDTGrNCwdTdQRL48IkJodtmFCWf5Hyn/+vd8qUTvLxwTGsXXF
         sXlce2R4I7f4FuIRu0dwBfsJd6cdIzxaQl8gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740683776; x=1741288576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvB+JZlfkgHPFuQYjc4Ck/8suSwxp4Qhz+OIGbF3Mns=;
        b=Zu3fr/SKbK+w/cdTfAJDVKoQVVlqMDg64JJ6tmZ92zKXsMwwcw6X5J1EzhtHr2CVDE
         9+FYd3tuZ9I8YOTkM14B2bZt3hNzYYTPmDwHiG1t/Upn5EYlP+c+3Tht4RcCDzWByFKa
         pENWXT6IUZVN+vfcO0EPlPjQB0LA3+Rd2EWb+vYWxKD/ERPDu6TFhuOC8BOGawHNA0db
         4ttkszAhxvnZdQeFV40EZjsOPtwQX8kbHYTgTF5hi8gfRGGSXfudxHvrtUfAzu5OsaPm
         gsGWIQyIkv07yv04MUCVhFGykZvr/hCk4rXfdrg4zb4/Aixyvu+nzP69+b/IDeZkywr4
         cxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzWiE4fPaAk2Ja5X0oPO2tKwdwQ8qSsHGJDhsXe82CnBK7aT0THfQrtkkQxEtfofcA0vFBeOA1jldiPZArGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJP2fxJ2Xm0Nr1VCeVox3FDD3/YXw+DAsVoBUnhSRq4BY89b4
	Pf/COuMulqcYtmBJHTQi5JMOEyvhf5w5Vxsjmdk0KGgXIWH28isu+iMvzgc3Yz2TwjaKCxOV32A
	y7wHmBA==
X-Gm-Gg: ASbGncstnSDsKErrHwuf3VNskNcG0QftQ8zwfNOI/Cpne7QdcZNd1A9do86WMKqhVPa
	bYGrq+UIkxx5aIN6wqC4SgFFmq06S3NwFQ+Wk0lc8QfgFadjb0N2dfSUMbtipIOV8oso8MTZKhk
	6MBIHa5YkM5mbaxWlUJsQCDiSKEMRGsvDO2DmhfFVPbrJjAWwGIQ9VjEFUveDCTICNqSKNKRnRB
	2k7HYBHHvJdM35fOfjhn/Ky/wxXFr/x+kzqmykheRJvW5l8BvR/i2butoFKsMtSRrWh96XGzF6E
	KNXu+hcnhXNe0R14Sk3Uqrribu9KuiwmLAc7pTCUHOP0tUJtNjgAf7ljTaIYBg/ceJtlxiie9hp
	k
X-Google-Smtp-Source: AGHT+IGx91RbuXjj/+IYrkzc2mTfEJuPPfQANoeIrk6jpL3q85x41rAmOlPLa+Z9CHyR3iHXguae4A==
X-Received: by 2002:a17:906:f592:b0:ab7:d06d:b4bf with SMTP id a640c23a62f3a-abf265a3614mr67304066b.39.1740683775964;
        Thu, 27 Feb 2025 11:16:15 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ed7d7sm165248566b.87.2025.02.27.11.16.11
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 11:16:11 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso1842184a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 11:16:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4nc00atCk/V/yrtN7pObfi+ZVS0O7Yp8UOZxL7caW7NnZdFRxSugVE3fYPHEGQwD8X3xJswnS2p/RZwdf/g==@vger.kernel.org
X-Received: by 2002:a17:907:86ac:b0:ab6:df79:f577 with SMTP id
 a640c23a62f3a-abf25d945c1mr67115866b.9.1740683771357; Thu, 27 Feb 2025
 11:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
 <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com> <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de>
In-Reply-To: <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Feb 2025 11:15:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
X-Gm-Features: AQ5f1Jptz1SWwyUusZnRoigWvZHElhRRDe0KZ_mwrHUSOFHPo4sqdKCJh4Qdo6A
Message-ID: <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Martin Uecker <uecker@tugraz.at>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2025 at 10:33, Ralf Jung <post@ralfj.de> wrote:
>
> The way you do global flags in Rust is like this:

Note that I was really talking mainly about the unsafe cases, an din
particular when interfacing with C code.

Also, honestly:

> FLAG.store(true, Ordering::SeqCst); // or release/acquire/relaxed

I suspect in reality it would be hidden as accessor functions, or
people just continue to write things in C.

Yes, I know all about the C++ memory ordering. It's not only a
standards mess, it's all very illegible code too.

             Linus
