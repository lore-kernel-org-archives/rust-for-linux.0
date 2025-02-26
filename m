Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9527561C
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602099; cv=none; b=Kuapr3Op5bjWbpLqZQgGqqLILaqoqT/x5X+cRmzLLW6x5ewD3ZYl/vx4YRqlS58wU4vF4+qY6pVuzZ3za/snzp7rlZqdrs65GFltdxPJ5NtUOYqPyOLpWFcG9ioTVpsQG4H0INwmMNcm95GABfsSr6DBa/ZbAIZQDYnmQt65s2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602099; c=relaxed/simple;
	bh=BsjkObCZOGJxyJ1E4M58vXDesam1iaUd49yxo0CQgKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEmm0eipwWMXFmQwLpFVgUqa+1BznmQvar8z6S/Aq7G3QI93xz7CgSng6tJwtK0N/zafgxlKVGYZdzkLCNTE6U65h1GOkpk7Ex7Eah1q+JwCtuKvXje2F9wbL8JAxLhG3SlF/U/o4fSjl6E16wfSpRxVXG/0dL6f//bvN6K8Xmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=x0KqG4eu; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="x0KqG4eu"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so232724a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1740602096; x=1741206896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNNBNCG63y+hw99CeSG36gYBSbxZTQ5PMbvNbhu7Ucs=;
        b=x0KqG4euj69rKfVyohShdWWAch0lIlaBrDc83Vo7l6xTzathxENPWZpxN6MDpKyb1R
         4DexNKwQ3uD64I76OqqgihtVlI4xBB5T0Rv4qzjsGu6tjwL1a6vjWWoghB6uBPd3mRsf
         W+gpiZvvIZrMOpmSH5S+Ia8jds+hMGf2NXTK/GjKd5u51h+mXRtKiP4YHOAoRh2HcKe+
         A3X/vIx0mTpqEwDAlkRD0fsAl5/+R5fjJmwbhTL+MM9ImTDzNODkmeZBvKmZxneTXha2
         1JIqIczsdBMAz8jLfbem+B7U/Hdw5k4eTc1UoUlQslyABfCuuhIHRjIOkl5/LjqhoWbG
         OX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740602096; x=1741206896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNNBNCG63y+hw99CeSG36gYBSbxZTQ5PMbvNbhu7Ucs=;
        b=WuODMj/Fq/bFYZY4VJzDyL9ZTl5v48JBRatRtotivKrXMTFL9xfyJnXChRrmmM/oCb
         sR7qGiA4GJ72TeTvSD82U70IAtOB1t0GIGABNSjHnS6QWJnfUE5xNIHwwPmOV5nhxMgy
         cS1ZqanVSrOP/c89qz6r4D602WAfYcRMQU5DYo61uuGrUFxIC85+Ul8uWyVr2D/keAfk
         hMcZ8EZxxkY6NxnSwI/pAA6S4bJlODA5rFqQOrUFIROJ+nypvgwluhq9ArbBjf7DAc7P
         S3V70SWZbKPC+rXkxDBw77GunlGpecVBW3oRCb4AszzJSQwanEnhI4n19m0sRrP+9Od9
         /T9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPUEjZiFlnvRHUxRwN0ATdqEuj69ph9HJahdx9iMnKuBp4rPnXGdOhxrCuOfwwuAejFepwjDF9MqWGS4fTrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuUjLoSvVa7KHx7FSU2q1p3saUk7WUOJ6t+s5vGtS6S+Hw3om
	QiBGGvpza7pq6LnCfOmqt/4u+UDUr9Z3f55zKVZxyqkVFMzsVroOfsO8VJT/APu9evefTZZpxzV
	gpat2ZcaAEcTEz7w5rMEU4ZigGg0YVks4jMeb
X-Gm-Gg: ASbGncvLwE2eLi9cFxBBfPlwDe6C6lVzoO06JzVFnEV+HyNYE4NIzrSUoWLleLOqONk
	zJO2RcvqOaAEuxFfFIuEo9TgHEn6FsHmFOBKU3mVSxM6SN72dMl933UZNBs5G5vsIlaghoa5fbz
	8Q/yxrjQ==
X-Google-Smtp-Source: AGHT+IEpD0bL4v9cVqbM+mXKhEESXlvA+VH0GzcrSUQIWZvKuDazTin9u4dr6k0WDBAgoL9Etj8BS5SONGwDZcdL8eM=
X-Received: by 2002:a17:907:c29:b0:ab7:86ae:4bb8 with SMTP id
 a640c23a62f3a-abc09a0bc37mr2387353166b.23.1740602096179; Wed, 26 Feb 2025
 12:34:56 -0800 (PST)
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
 <amebiomyty3gw7gwgpz3sbztzdac6ce2pslq3jjfe3no4w72dn@sskvzdp6l67w>
In-Reply-To: <amebiomyty3gw7gwgpz3sbztzdac6ce2pslq3jjfe3no4w72dn@sskvzdp6l67w>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 26 Feb 2025 12:34:44 -0800
X-Gm-Features: AQ5f1Jq-YVyDssbhA7TUSjB18AyuOEnmF5EUBN1uZ8DJs3k5rbz-GioqT3VdMt4
Message-ID: <CALCETrVc_eBjBSPy=nLHP7fh5h52u_wdT2YRnUZJDWmr-C2q_Q@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ralf Jung <post@ralfj.de>, 
	Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:27=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:

> E.g. if you're doing a ringbuffer with head and tail pointers shared
> between multiple threads, you no longer do that with bare integers, you
> use atomics (even if you're not actually using any atomic operations on
> them).
>

FWIW, as far as I'm concerned, this isn't Rust-specific at all.  In my
(non-Linux-kernel) C++ code, if I type "int", I mean an int that
follows normal C++ rules and I promise that I won't introduce a data
race.  (And yes, I dislike the normal C++ rules and the complete lack
of language-enforced safety here as much as the next person.)  If I
actually mean "a location in memory that contains int and that I
intend to manage on my own", like what "volatile int" sort of used to
mean, I type "atomic<int>".  And I like this a *lot* more than I ever
liked volatile.  With volatile int, it's very very easy to forget that
using it as an rvalue is a read (to the extent this is true under
various compilers).  With atomic<int>, the language forces [0] me to
type what I actually mean, and I type foo->load().

I consider this to be such an improvement that I actually went through
and converted a bunch of code that predated C++ atomics and used
volatile over to std::atomic.  Good riddance.

(For code that doesn't want to modify the data structures in question,
C++ has atomic_ref, which I think would make for a nicer
READ_ONCE-like operation without the keyword volatile appearing
anywhere including the macro expansion.)

[0] Okay, C++ actually gets this wrong IMO, because atomic::operator
T() exists.  But that doesn't mean I'm obligated to use it.
