Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10243EFD2D
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073774; cv=pass; b=kUbbSlpMmxChp92ecSIqhIF5td2Jn+1SHBvRAEwcwtD2ET5bE9CxajanQoExRDIC0RWTIK9ViYq3BosTAVV2cJ2lpooN4hsl3YUEuheB3ZvTakwG67+kGMhyRjyv62vExXeYF372HGBbX+NdBh+V3dS5VrY9MD/N6QoN3/FNl8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073774; c=relaxed/simple;
	bh=LwXLiadq6NIJd/o7a6tAEEQNg8tMcx+oj50jV/p/xJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JefL7H+WrFbPjj6Wb3kptdu5JY7N7gaBcp4tnAOc3mNwq9q4T6l8HmP062MrnOTlRPZpOfWgUQKIecLMzeBVk0Uj1ckgyvdg5aHTVNN/CyIJylBJdW0nEH8e10rWPmkCXh4aT3QAJZfZhVI8B2QSVXVtvlfk36wiRHAyGEC6qW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRMQUC0K; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRMQUC0K"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304d4e57d33so188046eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 09:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073773; cv=none;
        d=google.com; s=arc-20240605;
        b=jFeiMsH4JwoGuVLjGPxMdTNRYrBlppKhsa8knuB3GIjR1kX55gRBcek3liSK6IPLOj
         Ee1+1IzyFB/9UxODJddVJsmCdrdy+jmZ75oqL8H8aN5fnXb1KnRt0m45/vGzf2kNp6Hx
         wZG+i57mGtw0KD04wWPmU3H9QjId7jwXd9bkEQsSg/0jlWG9HGsprOX9YySB+SqGEkOf
         +xrPFyTPwwGRFWa2cSKQ/ajCHUIXQIJyaE8yaUylTnGWU86ym5PUeoGVa5oLmAp9Wauk
         AFbZmT9guEG1sGA8Snng/Z+ilbTCCzUiNfT5pDAY1cHY91H9IZ5cICBsgkxzF+BuKG0n
         BJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwXLiadq6NIJd/o7a6tAEEQNg8tMcx+oj50jV/p/xJU=;
        fh=DRBUKsg5dEDV1CWSFlAfHXnRRrc/wes+dZY7wIFZkNw=;
        b=Pkvawg7PG2TX9J2kGbfCDQDCYbeZsROmqB5Fel2JqfrxY7L4B2Y8tFMtQTYHQ6yiSz
         kmi8xHLghzUWVvUcL8WXyYjueVZfFxVzW4uDMW12ZfPDegv9naVGf7tBjd/lSrFFjl7I
         fPCe107KaVy26BM/qGAX32lMf9iwEimJQAVPXNwCIlV9FqLSDPHYrzM9HZLp0FIHIFJA
         AhtpmtKcVPZetRjE0RhNpwgxXnFb3WjHcvcvHNqsvf3+temFE3VU5B+7seZDeHRGFTVU
         cLXTu1Q7Ij0yLt3hhtfndrYEXnuNuFHXI2Ilyy/O/cY1+SmjJ0nrhGDdlw9q0nsPB3pI
         qtsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073773; x=1780678573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwXLiadq6NIJd/o7a6tAEEQNg8tMcx+oj50jV/p/xJU=;
        b=QRMQUC0K4NYpQOpfVv05my6aOqg0UIKeDvxYmnUhgLdX+5/OpiH1yO6EFzNr8K2i7d
         gV2chj0GP8LDA9ICMgJRmiUO/wFhrAhkWPGxzg8Pv5MeqoVy3oow3Rlple6ljfI8Uvq4
         sEOvCOhfYwyG2orCVI3WrXnQO3kQ9bmYoIqde+3XiD+VHQQkiBAwrKC1uiIB5OMoWoRa
         qNmWKlajk0/r3L0fvCbQFkBVpdgWtN4DIxAh99gtdfgjT7hGTQYt9jy+02ad+j4zJtbB
         N8FXS0teleHaVexK74Ybi/chqYFh5gPpC4osiIYPAhOrGzsOyaLRdkoKSV4ScOAFA3dM
         RCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073773; x=1780678573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LwXLiadq6NIJd/o7a6tAEEQNg8tMcx+oj50jV/p/xJU=;
        b=Cn3Wdu0R1NPmT+dx2NeB2xj7IgXoU2guW8IgIcGmSjdonmC00A6tuUltJeT3/buaV1
         wJg5K41qD3g41LLVAcQNDK2ArAr/5v5NP4BWFBbOYm3xOZ9pvT1HkzfTmPXTsvvWQ2Ec
         xXCQ5SSyKqSaQf2z0MlnQRprF2b7EnvnmDxKKXjRCk/SOwGTIOHSWXtTHEXV3WTYmTw9
         KaHLYhrhS+PQuBVNIIXJZ3VhrqFod4yBZtyWyzwQN7D2fr0LYo0OQUgvHNnYcQt+9IFT
         4nREJe6I7yN8Ckg+ypYtClj04DVTspZKA9u2lLy+/6EyOdr26Xh6dhQ4gHwbn3zxstgp
         afsA==
X-Forwarded-Encrypted: i=1; AFNElJ9NDf2wW0clu6oNIvAiiYkOIbeWDJXqdpNqmuUF+V+EuVdNdEhCIX9GL4giamGlZKI6SulocBqfD/pyuVQ2jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0E+D5ZwB0l3WFvdHFcc1fhbYrHuJWtex7rr3YeiRRbHSETwbl
	dUKHVh671WLmiTuRzhg3eGLto491MuhPR2PbS5Rdy7o6+XfurBRSrPtpNSvL/rtupNqH+6nkiib
	08Srrz14sygybv11yzNBx7v4eFoaDWZ4=
X-Gm-Gg: Acq92OHIVf6+UCNLc4l1vB3bZlrTEKgeG0jr9G6+3ZQE5CD5avNYLezdoj3z7vN+D2X
	tTP0bHQiz35u2ye62fbRY6XnXX0k5ckGjQLJ1atgNW+TqB6Fej9nS5KWNQNJFGyjq/f8eucqNgL
	aYLv0L5L3TnbwbYGkTt8oX+nD3e4Ms+IRlReGTmSnAEetYvE5sP0g96/bfMUTqSvYo2Bsa2lXbz
	bxp3z8n9cyVTP9efZcZ4Gf0w5iZygJMf3A4ltJGeNNzLH6bHJ8fD2FlLXZcI1keusqLZn7hAGLS
	gs7jYwCZCXbntQjzSivUqXABQsfYhMvSwWR2uU2Je/DbuZE0CRdOzvBUZmhgHaSQz4a1kJ9CSUD
	6VNJPWCeP9fWCvnN9/5rYG1lq4lhUrrNeBg==
X-Received: by 2002:a05:7301:fa13:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-304fa68ef3fmr160240eec.6.1780073772763; Fri, 29 May 2026
 09:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529145752.1209016-1-japo@linux.ibm.com> <20260529145752.1209016-6-japo@linux.ibm.com>
In-Reply-To: <20260529145752.1209016-6-japo@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 18:55:59 +0200
X-Gm-Features: AVHnY4JU5YFn3d0kQk2AtDd9dJRBK1vTMPr-jZMM53-wj8FgS3NYNL3mG8GTmBU
Message-ID: <CANiq72mo1ysWRGskb61_ppZ0KZTuM8c0q9Ho6AhU0Kd8hyFoYg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] s390/cmpxchg: Fix KASAN stack-out-of-bounds in
 atomic helpers
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 4:58=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Link: https://lore.kernel.org/rust-for-linux/CANiq72m4GVWFYqnxNtCHTPu7XcGew=
HB5LNwOoayTfnXs9pPbNg@mail.gmail.com/

> Suggested-by: Gary Guo <gary@garyguo.net>

Link: https://lore.kernel.org/rust-for-linux/DITFTAVVHTNQ.380OHUHGTOI6M@gar=
yguo.net/

Cheers,
Miguel
