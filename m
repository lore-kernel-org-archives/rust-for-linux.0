Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9120FAB1
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922655; cv=none; b=T5LShQo5YYduXycs+cdo1XOR3O+gvdBoSNvkOUVvzo4iTAlKux0m0byQbePbuXM8Y8mTxOoXafVf3J62Nr48NwXYDe7Wdc2Jf2q3EXmECVQXoxg60IaCUZKofGcOcnAuYr0Qc+URm1KTcgtXAxMH2W+vAdF+daDfR2zXDTuF8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922655; c=relaxed/simple;
	bh=04voz7/BTZUb5byXuw1Puz41gaRYXd2u6G7MthIyJKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY2ZxWiRscUAZCqO5tTo5ymXFij83GkvosPZ2OJJZF3qILrOYBZy2/rHYvs51UnOMi9DIFX/0HVri3KTx6ChAVWRiALcQME6KniBPtZ2tcLR3x6eqQRxD+d4Kv0oyNNCdVZz8Iob46bmfsCkXXGhq7NKGThuagRcnIglFF4k6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMaD7Voz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMaD7Voz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so675119566b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745922652; x=1746527452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiBauZO2ElGRG8B3vbx0E57UweONyPLJm2l7Gk1dbO4=;
        b=OMaD7VozvpMa4bkMVEieUrp5t3Ku1QDn9QTLxKgp+aiZwbOUoQe9VrgQQwsjM2SyrP
         KSIo/qKYU9aSwegcncIM6FWe9SsSs0Xa0Pqjd3MIE7JIivLMZYK5Pb1rNn+vbTeoRX5A
         iDvTrl7ICn0aKvdDbxC+4P3/PKbTD4wVp7Qh6i1C2iHlfdqGfbAcjcmsx5teBYKmxWPN
         WbhjTOW5wu88XNR2em8t6vJHWB0aUTLEJBunir1g2XwOb/pkz9xPBk0YVs+GLr+hf28N
         7c1rY4r4yHgtnI8xOfn84M0ZsOu2s6duICPq+IZ0rFmjSLMwm6ZOD5p0PamjR0Bzf9if
         W2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922652; x=1746527452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiBauZO2ElGRG8B3vbx0E57UweONyPLJm2l7Gk1dbO4=;
        b=Iv4n02vwf4kktXcIJJOAXyRGh5sKDU5ocVsXplYPZOnkMadjFTx4NIVoe0IbuqIdjk
         9kBk8WdoOELgIxIX/iTHvdY1bbwfemX4j6GUiDbClnH7tb7/FRCWBx99CKGpFN03dRiA
         4bOAip4ElnbLi8EENNcSOMCyaJ+i0yHtnGbW0VWNmRHq8Ni7B64Q8X6OW5AQKI7J7/Bs
         K2qbR8/IDAPFnu6QcFNMYlrwLvM3yCfRVpGhtCCvUkBOfjihCVlUqAFDNM18h5Zpyow4
         gI13O2RmBr1mpq56SFJZXVcW8KrFe2ouSg3vzsjPWI2Lm2e9uV3QQRnzMf2WruDYzyir
         YOng==
X-Forwarded-Encrypted: i=1; AJvYcCWH0Ki5WrEDOkESrEZa8kdI/FeiOHx5LgZsl4XCoHIRjTPLuEGKlvqMiMB3DnH7KEwfiK0bWWkn1Dag6ijceA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSLgvLRmjYpe9GdPSssy22gQMvvF5dNpW07z8Ft2jNGXvnxXuV
	J6akGbMcw/atCHWzBGL8qlRFcj+MjuTc/5+ozkZ2s9GZ2m+CeM18a7dE45VXvsNUiCIURGVaxMZ
	wkDnVxykeXTRAnk//MKyH1gEFVNXNpdYNhY0kmiu3esSS9XPiooIT
X-Gm-Gg: ASbGncvqsUpOurf7Vs/QBvkmgQaa/8GgpaWai5ao/UiQmloLj2Eid2znOBW9ghvU8O3
	q587h0cBfCMnQ/FYvTat3QHO3bEUPTcBUyhyesiy8p3eBjI5W1MVhrfFrylbOK3tQkX16WxEBjq
	mnsuKHy3RZe9L0hOfZduM9MRxnwUUzYA70+U1RQmwJI5VKEI+cQWnJ
X-Google-Smtp-Source: AGHT+IFmHKm9kqNhujcVpdgOw96B4rLpnKryxzvvMQ8LDiaaEUClLTQnJ9pgBvY5KlSnoISbcndqYP37rgcSfo6LGIU=
X-Received: by 2002:a05:600c:3547:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-441ac853dc1mr23585585e9.9.1745922640597; Tue, 29 Apr 2025
 03:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com> <aBClyLz4y7a15WMg@pollux>
In-Reply-To: <aBClyLz4y7a15WMg@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 12:30:26 +0200
X-Gm-Features: ATxdqUFa3J0LW17Z4A1KkrE2MYyUXXKuptQZ7VbxgSdoPeqBASznqKjNgJpcxCM
Message-ID: <CAH5fLgj_wW=8XgdnceHGv=VL19X_c3es7w_-QDqgK7+PoEcdZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 12:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name=
.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
>
> If we can't think of a use-case to be built upon outside of
> rust/kernel/uaccess.rs, I'd make it private. We can still make it public =
should
> we find a use-case later on. If we have one already, it's fine of course.
>
> With that,
>
>         Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Ok, I can drop the pub.

Alice
