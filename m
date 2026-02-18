Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1600F3033EB
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416488; cv=pass; b=T+SoWt4CbmWXhr+vhzBDX51wqOQoFH69+ZKjTs16J1fs7O9bwC78RLCWdSEbHgxM2bx99REinUd6bKQxOdCMCCk7LnGbs4oVn9WfL7MKggGsbLK5yXBCRHJ8/GtkVRH7NcBcQ/VFChe/69lVQf48pFwcNPjjEGK29lg2z0d5KGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416488; c=relaxed/simple;
	bh=EWJozyYgHIhJJQDNAoxanhYWFd4biMKeSCw3f5P1+Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPMtkLrRwMwVreEFwDQ/7pQbyNv6Eq7ndDLro1YeGTHMSSrgJbkj8m1xpli68ycF3T7Arsny1vNjmqDPHu1yr9fS46/oy8lhWYPb+4rafXOSEkv2yQxTemQCEvdvPrNgHFovJCOypif3CtksLT2ElvwORF5uetAWWzlOUfWF9ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMxqmixw; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMxqmixw"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12734af2cdcso374642c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 04:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771416486; cv=none;
        d=google.com; s=arc-20240605;
        b=Tq6wQXSRAFy/vwKiEJPWvB/CqMaGqXsnzIpjybLi2/bCZPJEoemykCUGV1/LKk/hui
         z3vKx4JFC88u6eanKdg/pXjdephOqX7MvgWhxHv5kBGEddEzDi/Ur431oNeLccGWoX8p
         Enl6DFNbNGkDV1pJS96xwiqGqXOxF97T6MBfJ6sMXn/2y3ciSyteyAzfNSTbHdOZdaLB
         AY+uP+uIZpzB4GyP8dj6VCKtdovxogzmIxRX7pPV+w0XPrmM4R98VGkF0ax2LZ71exuC
         9ecvAjRd98YtPOvrtQT8DbT9qndMKjsY5qUc465RWtzzf2YrLM6pUMoIXxdr2oQxhjO3
         X0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWJozyYgHIhJJQDNAoxanhYWFd4biMKeSCw3f5P1+Fk=;
        fh=TvIaQPM8LPD4qnKOwSliVqkoFcd4pHq5tCbHW9qS/gw=;
        b=iGf9ZWs4ZLJyaVfGHueFP+HXAlSfuhQMvvJcUe7TWH0BWR9pWSWBJe0u2M7K/Bwd+n
         TfbZkIwr0tZVq6mEE/r78hJuUjuIXZH+WIjpbvljEC2T5hX1AQ8h1KJjW4AIz8hb18+g
         6HIsKGAa1K9DxK0LaqD6b0ogAusTu2988Sx1c8VtDRqAOiyywkwXJ+/6NSRONMOhpEUV
         npvdy41ViQx7FVyDVM5OfhZ5LKxL/oogVu+pxZDsW37DZWRwFyvqnIbQ2qu87SDPt6Zk
         t7HDH0yBN35XomEXBaG6vMtY4yiA8dY8xp2ZMaIuGOM+Tsz1XyforeTjh941QlKqEhXf
         glkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771416486; x=1772021286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJozyYgHIhJJQDNAoxanhYWFd4biMKeSCw3f5P1+Fk=;
        b=TMxqmixwOkZ4JE1dMFPS2zuWjrC1eG6ku7tw+hAAbdDqDa5MfSL6ZPB6C8vOBaXLMx
         C4H3FR2P9FJLWms1Ck2mC9tVick0PSF3nTpidz8+msTb7hUk/J9Ppib/UhYj/rCji9gW
         DEIgQa0RA+rMwmLzonyhXeB+7JwEwkV3ZlkSfzxfV+fJlTvL8aVxtKsmiq7hAMFTs/62
         DDFKQmKylJp7r0dS/JZBLiDzTDs+n3ov7S2Xh4RdslejWeJEO5jYVGB+rGWV0dr2IGmV
         7f/IZN5zIO6KTnnTGspbw0VFU9cys3WWrt8cnmHjOlNkB9sLKBc3kk3687WusGto8T98
         k85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771416486; x=1772021286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJozyYgHIhJJQDNAoxanhYWFd4biMKeSCw3f5P1+Fk=;
        b=FAxSj+6T1o8mc4vOAgtUNBUI1RbAki14ayOkP5cLgoD1KB1R7rJnYRaX/TE3vfSLYE
         zdOs08zonEBoym5tS0GDpyADJxKzgoaQtbNNYnGcd64eoi0gusEGYaiJ06dKCjOFaCit
         j7PjMuOMRfpwvvpD4NPvc+ByVhz/lph1HYjThsh7DXLENcOdKrd6QLE5urB2cexY1ZF+
         zWfnVKKeRD3Xu1d6uBmFGYGtBXaMlh4ItDSnDtmG2vIQLw49dh0HxIiT042WZxJaAokP
         OxsXC16tRDLQb0Gtak50XFgGLUhiEsNVIjF+TvW9MM5jqfhoD6+PV6LpyQ9BpxSekMd2
         Wqmw==
X-Forwarded-Encrypted: i=1; AJvYcCUrgvLmUVSshI39VBM2aUMgPqGzFh+M4f43NNl8bX9b6nuNS893u58vFPw6ldPryCOdTyTGNAC6KdFkmNJ3Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43UhOY8J+Zs94A5o/nFNC0Bp9mxNrg1uxquTHyz6u0f7H1KV5
	jWg5lR0PiqXQZm3WCul8ZWjkkLn3+2Zup9uIxwdlDRMiBoMHrq7ZzdMA/+Nye6ewI6gFJDmWG2b
	An2H/pOobNlZqs3IzNKY9n9joVOkMxwQ=
X-Gm-Gg: AZuq6aL5fecIYMtVw4nwLFR9i8N1q0RquYtXwTWRJ4I0D8JfD2dvUwvVC2aoqZ86YLe
	uJ81Q4X9bTgHOYGj1HwxrKWQqt7+54RgQ9Ow46GLc2Itt1bW3y7ohA9rs0T6umwD4V6kpDWECMr
	qBeWZS+Uk5HatdyX7jVrYs8HEY/Z7c7Zp+lG572b+F5GNA5lvOtJABqCxK2/KTbpFjyFhe5dgNI
	GK8oLiFN72exDlm2+xptuAHBbebnuC/ZLzMDHSSjRfpcO/f1MuA4SwhjR3hMeNvA+/mHPp0HpxT
	DE6xCZuTV/quvRZkTeYdpEVTtsPhhE3ohncaExsPjH7jkljV4bZcnqv/U/0kGkDrCmmMj8Bq6Mn
	morTVx5b4IRMy+W0///OOwqqt
X-Received: by 2002:a05:693c:3106:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2baba0f2974mr3533606eec.6.1771416485976; Wed, 18 Feb 2026
 04:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com> <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>
In-Reply-To: <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Feb 2026 13:07:53 +0100
X-Gm-Features: AaiRm53ciXTCNQ_ps-BQuSDA2XXw4eXpbCyjDzFmZTHRgWlet3KnVIqUuIAfwfk
Message-ID: <CANiq72nCmZ57VmXsXdXbP9edmWYqOWCYgWNTPGKvxC30sy94KQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> That's right, valid for reads implies that it's okay to read it.

Great, thanks for confirming.

> valid for atomic reads?

That is the one he suggested, so it is likely to be a good one if two
people thought about it :)

Cheers,
Miguel
