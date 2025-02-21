Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49881E7C1E
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740168715; cv=none; b=DzrjU6WpgBiyNztBCP9OlMGkibVeXsptBGZ3HhxkEyoOPDXsQl3rf1CmuyUzoKIn/qXuvBQW9WHa4qfNvMX2u23uqHKVL3z7rSd/YZTSTZEtAcm2gzwdw1k8v8Xdwq5Ym4wjhuVU4c5ecU2zPw434U267OTK6XIAxXbLk3Y5um0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740168715; c=relaxed/simple;
	bh=sHDT7bse50uCAtNjA78tyEQ3rjAX9mJG1DMhp6e+0tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSlxwSuGHfNC/6SBvr2PNQ+tWpkpkGI7TaxVQcclULwDyrG3AhcG+tYQ8u/RN89+gmsR2Ho0qlf+E6RRtPydedFL+Q5hC9BA8B3/hDNfzWn4qpR1gawgL33Va8YfWNwqAPsmZSGaYtD5bb0lTsS111ezmxefDhWoVSGmj0a72tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ifx8txNa; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ifx8txNa"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab744d5e567so437857566b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 12:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740168711; x=1740773511; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CcGCG2WSdQQovy8qS/ohnfSZbfooRumEZHN+xZ7cilE=;
        b=Ifx8txNa3aZd2mXmXPHM0flt+njiEbTk1z6/Gir+aDORjgFJm5Dz/Ho1XT983nHOgy
         6LOC1HtrxfccNwNxXG5ljX9D/RCqVcOTlAg+HwxTkAzxojeN3VGhU9/yipQ5302HUuou
         ue+e7jvHNtX2qXavZSNh0EsLLBFBU+sCMp+rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168711; x=1740773511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcGCG2WSdQQovy8qS/ohnfSZbfooRumEZHN+xZ7cilE=;
        b=S9FBigvbvuXxx+EL4XMKg/OnfzrOuBHg/IzF/AkWu9jcF3Oj+xJJtmhyZnuMpS3plA
         vQcCCaZC2FSXh/EMqmfzS+l7OlgIXDo+EWPjZ+g5061Dd+rzciibz6QCLve/EaYWV0fv
         w+JFOnloA/Zqy21c4PSd4gDvCLNC+JX5QUTUx1+BWhkSnVuyIdRIkbjbFXE2p1j/K6Mo
         n10RYrYg/DKCCx9yIgxWvzqqEiEtHKrlXyfRUHwG2jWHA12DJOsv9trvDgykmqEkqrZU
         xA0Cfpjzlk7BZWLnsCWSQoiKcLZ33ofjuy0Dvucjnyk8NxsC3wiOsA1oyRdRotRkCYwV
         uYjA==
X-Forwarded-Encrypted: i=1; AJvYcCVc1sp0mCGQjjbj8JHOX9zpDrwAIdcnOD5DfShAxVeZ7IYbUxpHQeKXoyahQT2neIbRfhVLQq5LnZgx8mI7SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxCFot3jv7h8yX6y6U742tO4B0xGYD9J9Wuoiwcp0ZWAf5hE7/
	Lnn08nHUJEb4iFSEEh8/m2GTOEb10MscCDaGfJSzjiwpAPOhtM+i+8o/23J0yeQfzXADsqRbWOu
	tS4A=
X-Gm-Gg: ASbGnct5q7+CGywxqtCBL23ZPCPi9RwfUP010Zl1yfCZ/pFKw3Z9mKNzIerLW436z1G
	XmgnfKjd/W61bQqnRY0QZifArCKExf3y59Zbr+QbPMp02iFNyhLwM/mNPBpK49b6NeYhguxUwjJ
	WDaKtVICbvjWhdeq5GH3d5+5w5YkLUGw62rn9IIEIzxwhxqqGHPaaCdqc1MewNnpUIRrvoKZZmW
	9FeRq3a3jpDFplgbFYWxI8mbrZgEY1IscdHY0x7kZNRW25zTV7ZxqNJDqUPHi5Dsiyxndr3+PQv
	GnND+h0CojTZYcJNtQtNMdzZxAhvFNTkQI8+Xbx2ENB8r+P+TFCe2ZIr2x8uXI/rS5EcoP9x3bq
	1
X-Google-Smtp-Source: AGHT+IE1ilLv52ZZyD9WBUHhNJ9l2IgXbRz7dH5tM86/DEi2+Rk4+3kgt8jv9FWJU9D75026Rs7cpQ==
X-Received: by 2002:a17:907:8b96:b0:abb:ebf8:72d9 with SMTP id a640c23a62f3a-abbeddc91a6mr998784966b.15.1740168710821;
        Fri, 21 Feb 2025 12:11:50 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9553fbd0sm1080773966b.84.2025.02.21.12.11.49
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:11:49 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbdf897503so594217766b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 12:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRWpJ7pzBsuSGyUC6iMzzlZY5fnpq2kVXeNFbB9MEXaaaEwgcpe5thA80hsVfjlKZzNWPsFKgdqK9z1wOqxA==@vger.kernel.org
X-Received: by 2002:a17:907:9989:b0:abb:daa7:f769 with SMTP id
 a640c23a62f3a-abbed5b21b4mr870873866b.0.1740168709416; Fri, 21 Feb 2025
 12:11:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com> <008cc0939c130ee24fbc71a0407ff82772076668.camel@tugraz.at>
In-Reply-To: <008cc0939c130ee24fbc71a0407ff82772076668.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 12:11:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj5Rt_xhp_n4_gEyGG9LKFOiTrsvN0ueo3q5PyjJPU+AQ@mail.gmail.com>
X-Gm-Features: AWEUYZnIN0fhlIm3BbR3TnvejgU7vmWR4MU8kuJXCz4EmowYIdocxYD5OpC83wk
Message-ID: <CAHk-=wj5Rt_xhp_n4_gEyGG9LKFOiTrsvN0ueo3q5PyjJPU+AQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Martin Uecker <uecker@tugraz.at>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 11:59, Martin Uecker <uecker@tugraz.at> wrote:
>
> The standardized version of __attribute__(()) would look like
>
> [[safety(ON)]];
> ....
>
> [[safety(OFF)]];
>
> which is not bad (and what C++ seems to plan for profiles),
> but this also does not nest and is a bit more limited to where
> it can be used relative _Pragma.  I don't really see any advantage.
>
> GCC has
>
> #pragma GCC diagnostic push "-Wxyz"
> #pragma GCC diagnostic pop
>
> for nesting. Also not great.

I realize that the manual nesting model can be useful, but I do think
the "default" should be to aim for always associating these kinds of
things with actual code (or data), and use the normal block nesting
rules.

If you are writing safe code - or better yet, you are compiling
everything in safe mode, and have to annotate the unsafe code - you
want to annotate the particular *block* that is safe/unsafe. Not this
kind of "safe on/safe off" model.

At least with the __attribute__ model (or "[[..]]" if you prefer that
syntax) it is very much designed for the proper nesting behavior.
That's how attributes were designed.

Afaik #pragma has _no_ such mode at all (but hey, most of it is
compiler-specific random stuff, so maybe some of the #pragma uses are
"this block only"), and I don't think _Pragma() is not any better in
that respect (but again, since it has no real rules, again I guess it
could be some random thing for different pragmas).

              Linus
