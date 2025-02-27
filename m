Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA7222576
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688113; cv=none; b=tmv27GNW0hqKlYS4fvnoNFujvf3ZjrQzJc8+57Q6PzzrqpcYnSw2/lN9cM7+J2YhXpsw3QJYSyw/xrj551qgBk64V32X13T8b1dcCV7Lf1yWjJ8Ebon22nuGe5OlLBO2204FvR4WXyNpsPJBa31z1q+vwu1ZFzYP98OEX1aycDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688113; c=relaxed/simple;
	bh=H3HVkz+A6rXVuiDniuy3LDGPxjutY3NbEPqK++G8ir8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEYDcGvbGQUyFQ6qci826ZTxtUtjbwD3kbSwo/aKYqXvy3yxTmxQkIqvN4vxWz846k45ldZeSGRtP20B3oUWdWQAv9eE4biMGQ1300gvs23v+Wzll8dgQoM8c6AJQs5eLe2k4JwtkiSrEaY0jdT1G7uY1hPE7G9h3hwg0WtOaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=e45TplTO; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="e45TplTO"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so2434340a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 12:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740688109; x=1741292909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iaC90NRH1e1Syvsd/il6x0lQMXHnv8BIHQEgKW5Yhc=;
        b=e45TplTOSm8H0Ob14vYbuNW0TWYlXKidkmhWlfT1u5BBs7GHmn3BBPOPdDVJgsNQHb
         STMbtfhwqiMV1KBf9ZSgI9BfQlQWaVGGFg1PFSVb1ISKVkCcIaPoVccKb5bDJgsPSTGh
         OsqOiiR79txEaVv2n3DnX2jahoyLxkTUQQ9vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688109; x=1741292909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iaC90NRH1e1Syvsd/il6x0lQMXHnv8BIHQEgKW5Yhc=;
        b=M6yuGDc/aekEB3ACbD9HpEzM52X4+BuNWp9AoDpbO6e2dKrm3moyi3F3txQDGvzJ+w
         NUfllrZkwmHpcZyx5OOgYK7tAXdr8/UkKJdRNyTxHG4hQheRAhqrLjRpp84egakITP0D
         QlRUIhGPNcC/3YPWFMY+AbFAwDeXFeu0kBIUerAr2DHADffBqiS8oiKq9yWcSSZcD596
         iMx8Zc//X3XkU3S7sgduSE3D1u8emqyTwW0B7CvjO5Dx9V9AdxbH/kevBXE7rqziCagt
         f5g5FxRAh0dKRXCQs5FRsV+VH2l8fzeANgrayFmRXKFRVHWQ68R7DkI6zE8cs9eGWsoX
         n4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW81TwCG28/B5GCjPHpp2o8ydwlT2pJvjbAKSpICXtuW6PZDERtJmFySIzyP57IhSjJqUIfRfJyfhUzOd20yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4sT3AF9K+U6hfvZxoABDJBoE2dPfbjSFDV9pJ890yc/ISx0v
	E21es8A9YJvzdQuhDOt3e6NgH/G4Jouk3yScSloZEjWTnPP2mwVI7FpncGlQb+txGLu5QwZOPtx
	HD8KG5o+l
X-Gm-Gg: ASbGncvjAKGLmJG9tsITgA/QL0WQ4zKP67xqHEzipXEf/pYHPcbTjq/LTaVDkZpMDS/
	/HU1Q3dxJX5r4hAmv2fR/4iSdqIeHjIUkmGh6MFJYvGrBFpq6Sacgj7HYDNStyR9e4K5O6FnDH8
	lnfCDuXmsIeSSbUwEVF3MIr19hoX8w22XCGJHIRJu76QJxoNSFuz5iUR9O/XRT+KOvtTOAbsH8r
	ovMWVKdRXRu8/KJEZu9Jbo0ehKTQrImTo8QklAMMnYxZW/OvaEwdsNMvkTOZ2J8+HuLeve1els2
	bYEoXS331vDQBUsbmO0QNWPyKXkcjfsSZ7usoTgUvsbxa2vovu7im9T+3paNXouXSaHn2ByvBlI
	6
X-Google-Smtp-Source: AGHT+IFSIpvUB7gowRYy5sPi91sRf3EoxZM/v17mK0l3zTFavdQI4/2q+sEgdRo1z3CUw+q21+0F+Q==
X-Received: by 2002:a17:907:94cc:b0:abb:fcbb:ab20 with SMTP id a640c23a62f3a-abf25faa1b0mr77790166b.22.1740688109526;
        Thu, 27 Feb 2025 12:28:29 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9956sm177335466b.16.2025.02.27.12.28.29
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 12:28:29 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec111762bso237571266b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 12:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRTQiN3m9a2WY3OHu3n5ARE10FIkG/2Kz+nLyMw5GSE+4VJUx3KMmW9VhFydzPe3eUvA7jq1vfkLZLQg7iFg==@vger.kernel.org
X-Received: by 2002:a17:907:c50a:b0:abe:ea93:2ca3 with SMTP id
 a640c23a62f3a-abf261d3cd5mr91983066b.29.1740688108692; Thu, 27 Feb 2025
 12:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
 <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
 <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de> <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
 <jei2vzllt5z6hufn3orqqupq3ufajcxv4zx3yfpkd2j54yr72e@vmhu4r3klvvh>
In-Reply-To: <jei2vzllt5z6hufn3orqqupq3ufajcxv4zx3yfpkd2j54yr72e@vmhu4r3klvvh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Feb 2025 12:28:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYCS6=TFfRHz_aG1HNFBDyLMnHgkvi_=B03-tX-OBtOg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr2HELUmBJIPyKcHVA4YKc0nNSI_EcgaYvP2EtpcHUej5s4s67UyCptmgE
Message-ID: <CAHk-=wgYCS6=TFfRHz_aG1HNFBDyLMnHgkvi_=B03-tX-OBtOg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ralf Jung <post@ralfj.de>, Martin Uecker <uecker@tugraz.at>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2025 at 11:55, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> It's more explicit, and that's probably not a bad thing - compare it to
> our smp_mb__after_atomic(), it's not uncommon to find code where the
> barriers are missing because the person who wrote the code was assuming
> x86.

Sadly, judging by the memory ordering discussions I saw, I will almost
guarantee you that the compiler support for memory ordering will be
buggy.

When we miss details in our wrappers or our users, we can fix them.

And when the compilers mess up, we'll use the wrappers anyway.

              Linus
