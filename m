Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275C2702A9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611949; cv=none; b=t0M/BO8d5MNX5dMvIcBJ/1OwNgia5kkLApGPQEC5S8vqZyxkhIMMoHYUoBwSVaiH4Z8Faqmb6HoowwYJa+l9nKG6VjG5JOMicyqLPVTvOiVBTTzTGjov/Qz+QCyP8oSqE7ACpBE/Fb885pFwrKOxya/m1dNTw1bZW+JoG5Yu1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611949; c=relaxed/simple;
	bh=foxtZDCBK0dn9bc6Jbpi3rbKPKA2AjNZ4xGSo4ZEHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OB6ESnhLI19D73O8ZfV+zZp8sz9ftEY5VCBnfc4ZV8JKmWSuHezNgiDBKwOJRbcDesY4N0R38AoVTXen8AZVRt0i7EMyyO1ZkMcDoXy02fbuo6VFOjKKGVU1tLKvLpjVZwjE86/aeLIdmUGC/qUTbXAQDvLtw4TZzofgHJ4qOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cpVyPzsf; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cpVyPzsf"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb75200275so42835566b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740611946; x=1741216746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TraiYlbomd4QL3tOowrIKCTC40aTkxfdwA2KJAFj9MU=;
        b=cpVyPzsfc5BIvRAoXkKAGt5Dub5g9VimfSWdGuc3m40zRwDCdrWEn28hBeVNVZzTKR
         zxEOsfX18gUSD83gImbYRY5mCHGp17zKk8AUbk7rOULB87ncXBENSIEj36BvBH7rg9/3
         F+PkkoPr/Pq2YO1BjcLk/Opinw+QvYZN9FrX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611946; x=1741216746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TraiYlbomd4QL3tOowrIKCTC40aTkxfdwA2KJAFj9MU=;
        b=g/e+JhdNSLB3R5qbBlYunNFA/bC3pqdPSCjKNZBjBLJTg7f0Lispn7I7l3vbMoxpBL
         dutZ08+YzCKJYrvCu3+cvX3dUtGRF5dxL1k3TMGlHxVXg2mYe75bjTBNtgY1ua35GDCM
         JkSh8ESIlbFg7X34fFv11dw6qSvuiKQTi4NLLReVxZi2jQ4SJC8CeGx2QfKsa1ILccSV
         lUK+QK2p147BFX06Ne4Cu49gjq33gzE3kbPrPPF6fCnyGnt7xcFAPjx7PM7qqW36u27P
         lUFWiMNUj7ra9ZbjmTQqFIEEpTDGyIDFbqwcemfP/2NLqKkst9nU90Zf27R4WsH12cfa
         7f2g==
X-Forwarded-Encrypted: i=1; AJvYcCU7ypZ4cvkoDsxFvdnQp5STwN1CcOhQg/mkH7tpscWKkfFngC+KQkMe+6b/R784lTaOvBLJOaEJbr9uYd59WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/1CUfsZylNqyqwQMuXTBEq3Yb/FLfGVgh1aunlr1wbPTrvrr
	tIRY+aQr01N7uepFFWLmwv07s8C1B3N9FcoFbmqaOeib9ea9FMqILeKUoSFphwoq/VpSjUOvdBQ
	n307BNA==
X-Gm-Gg: ASbGnctHjI21IMFSq7w0y377CAnqZfaEMCem7uxvDR2R4vwPJ3RXrkjxNia23n7ve5O
	fPZMDkK5o3xTzVnz9llyscQRyMAc6HkRTqQC6lS/hh5OAfxB9JaM0GqNfn+PdZVXOvoT9h35egc
	+9IBBzQKl+mWbeN6uhI0GA1++oEEacEUeOwdai0NxLs8GaoKT4TIJtomlcs4j/ToeizwDrW2Gtt
	yYuVUfVATl7GDjvgbMLWq6ypiVh7SpgA1QMsg5+OUS2jXYhNrkspRApyKRuko5axDQabU/u8ce1
	hm9ac9alFco8TixFZ3tl+Ead1O1h532KB6xYrwIoV3yrukXA2819h85utYCGsWp2TRHyWAMbAj0
	b
X-Google-Smtp-Source: AGHT+IGPSnGHDpqd8zsjjsnvaPFEicakDJtwK9CsMYkTeQcBaKu0x4+RjuGC8Vx/PbHgdBE0Nz7sxg==
X-Received: by 2002:a17:907:96ac:b0:abc:919:a989 with SMTP id a640c23a62f3a-abc09e342d2mr2374422466b.48.1740611945922;
        Wed, 26 Feb 2025 15:19:05 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee43esm19108366b.88.2025.02.26.15.19.05
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:19:05 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso45165766b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 15:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq6IHPB4L8aYXBWqPEve9LrJj0oBBR0+r4RUzbe+CePByJDNOT31aTGQHMNT1UkMkF+tAeUEfnllmKIliHXg==@vger.kernel.org
X-Received: by 2002:a17:907:72d1:b0:abb:e7de:f2a6 with SMTP id
 a640c23a62f3a-abc09e35401mr2910896766b.53.1740611944724; Wed, 26 Feb 2025
 15:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com> <20250226173534.44b42190@gandalf.local.home>
In-Reply-To: <20250226173534.44b42190@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 15:18:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
X-Gm-Features: AQ5f1JoJL1av6p0bHCUuCTiHUulziFdE8-qs-EcbEYZ32grw4GEJZn_MqtGet6I
Message-ID: <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:34, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Correct, but if the variable had some other protection, like a lock held
> when this function was called, it is fine to do and the compiler may
> optimize it or not and still have the same result.

Sure.

But locking isn't always there. And shouldn't always be there. Lots of
lockless algorithms exist, and some of them are very simple indeed ("I
set a flag, you read a flag, you get one or the other value")

              Linus
