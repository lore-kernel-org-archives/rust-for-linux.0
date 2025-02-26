Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8115852E
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604925; cv=none; b=XhP0hMH+Vs+l0WYB09Sx4dvOGC69hQcmzJQRRTMvfSc4QQyf7ApKKygQfZUTvsKqCSr7Cijq5ZhrVT3udjACQWsiAUCb9EkmDJt/7VBg+lEtK/4Q+f/Zv8yFqFhy6fubdGY+qnuQkl7GhFwC2xogzdg4sq45st0fH0z6HbwS1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604925; c=relaxed/simple;
	bh=+N3TkM1NRoZBHh9Ynr3C7aEtzpQAI6OT4vv0R68K6KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM/mdmQT6g0fCsjB0XKPXZUqcl6nISmzs4xAGDnjdqdgXW8Jd7Zxb3JJpxqdZHZN5PqSnk13w47Zde2aP5+XhNWXQ3V0x/1CqVLyXR0UFc9ho1Lxfzz4TFml2z062j4F5FWWo0Tc5c65jRJexG0ybGorWzFXk0Ewh4O4YqeQYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PfWRcF2b; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PfWRcF2b"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb999658fbso20207266b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740604921; x=1741209721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdNIeKEV298BHIClZBktZsY+11PKkbWSpfNyTBEPjKM=;
        b=PfWRcF2bOj75C06VajXYc1efKDph7pl3IofMk/d+j1bH8aKFUZsHb9E2K/KwIQy+n0
         1WNoqcymQlRTOYJPaM/At7GTs/hoODgqyPM7MHd7RK1fboFDrnF9DI/Hd32Ab6z5RpHP
         R9Lro6Xgl7ZJPuZE94b7IUektFDzvHokylAmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740604921; x=1741209721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdNIeKEV298BHIClZBktZsY+11PKkbWSpfNyTBEPjKM=;
        b=OS9sxx5L4tEwqrO4EqhyoulIf6AfN2SNYwQdADpB/lG937xTGJLMFXubdZ+07GrMco
         0kFYmoR9fJh4+JPQBTwa5sTtXR2MWwRQbFwej2pzfvjMx+/U0IUdfeYPv2GXpQtnQ04w
         Y9tFiQ4Oynl1eK4UmEga8TUaN3UsqQ5Y9t1vINYFxTjiyZ6ATlENAvnOsA57GY1bkkBs
         sZqRiCfSbpdEdPwUoxSyefKb/OuxDzfQOc8DADNZT+ZDZ43hUJ39J0VXIG9iF0hiXI5F
         cIvx0DC+OL2YF560sPlZ1F14kuGtegvXtKbu1PkmiEpwXywiiwd4OeUIS+jcp84lIDqU
         /TIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNn3DRi5F2ysZXP9LMYj/qpBUgsa16/cfDEp6dFHZwey3mW3UtBvOa0XeQLrDZaKnsJhZ/y/KB7HqzQHlumg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnB2Cb9LQMxXDxoSckcP+Qow702mXbxKc+LLJNUP3rQI0Y0Fno
	DfXG/H57Rnng+uUb7IifEFLLBYXJfkcTJXZIi3jjXjMLIENedKx2DmIrcfOpKeZWRcjt3Qxccjz
	tjWV2sg==
X-Gm-Gg: ASbGncskRLkU3n1krFYIHN1BRiNhpjySoaFRoibhh36IXMwoZtHsy08EaXGURo4VUB+
	u42HI9hW2GLciBiyNEB1KTASW+FLViBwa/OMFhL6pNjZFNDhqtNsPOdJGC3fkZjJd7w1Yt5G+I4
	UwUUMinSpO/7jG6qeTMeqduGWagYH8SfaeRBc3ZTVXqkVt6vWzTjU8K21qu6CzhqnFGP3FOljZk
	7/4Lv5Mr+r78J3hHfDO8xQJusDOIMD7Mr8cXbSIOYp4JqfoYP6l1ITsuQhcMHL1yo1565xZmTzB
	CAa9C5RGwKU83aa3n7+r+DdsMWGxy3+7N+2hVqXtMOHvSYTnPgay9EeLqw1CVuPVVGUSCN09SmN
	8
X-Google-Smtp-Source: AGHT+IFB+I/Cx1tHlP7NWwERQ7+5+xST9OpwIMp4BgGpj5mIgROxJ4S5NCWmeyVnv4atLPpM1Ea27A==
X-Received: by 2002:a05:6402:2113:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5e4457abb93mr22031858a12.9.1740604921590;
        Wed, 26 Feb 2025 13:22:01 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa2dsm52341a12.8.2025.02.26.13.21.58
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:21:59 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbae92be71so17054966b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:21:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNSTkQZjz8tMrXvCw4H0tVl9PNhcSwxMuPgc73YUWhfFQ1mcDqRrgMJrVqHympNahM/4jojhwDGlhDJlCU1w==@vger.kernel.org
X-Received: by 2002:a05:6402:40ca:b0:5e0:922e:527a with SMTP id
 4fb4d7f45d1cf-5e43c17fd68mr23458418a12.0.1740604918551; Wed, 26 Feb 2025
 13:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at> <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
In-Reply-To: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:21:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
X-Gm-Features: AQ5f1JrrDtu6pQtaXDIWizvRpIKwFgJHej09xYvppc2qRPzk9XWU6Yj8paFL6N4
Message-ID: <CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Martin Uecker <uecker@tugraz.at>
Cc: Ralf Jung <post@ralfj.de>, "Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 13:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That "single read done as multiple reads" is sadly still accepted by
> the C standard, as far as I can tell. Because the standard still
> considers it "unobservable" unless I've missed some update.

I want to clarify that I'm talking about perfectly normal and entirely
unannotated variable accesses.

Don't say "programmers should annotate their special accesses with
volatile if they want to avoid compiler-introduced TOCTOU issues".

Having humans have to work around failures in the language is not the way to go.

Particularly when there isn't even any advantage to it. I'm pretty
sure neither clang nor gcc actually rematerialize reads from memory,
but in the kernel we have *way* too many "READ_ONCE()" annotations
only because of various UBSAN-generated reports because our tooling
points the reads out as undefined if you don't do that.

In other words, we actively pessimize code generation *and* we spend
unnecessary human effort on working around an issue that comes purely
from a bad C standard, and tooling that worries about it.

            Linus
