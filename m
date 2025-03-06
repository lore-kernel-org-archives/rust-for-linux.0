Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751320AF9D
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260681; cv=none; b=d8IhMxtV0cYXdmVI3JNUxcqn5N66GcPmjaquiy3a4JxHTJjHwURE9RzTCjSWaS1SOmRx5enDSta75OTIWJtiFpnR23RVTqwbmx3YlCdt3h8IhVuwU/BB0RTfOzY9u+sQSqzyBw6gR/y1YPllZ+MmRGuJ6d+U7FYgybmV0/iW+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260681; c=relaxed/simple;
	bh=FqGWKIYIxEEdI6TEmmKXSitgZ63vn7LwRjV3OTJakKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b8OJKBVwqZbw04frKSEU5ekuQr17Cm5gHducz5ybC8Pn1/srmaCQhaPk6eYCTkMsVbUHiwV2C78MjT/nqLhZa1/Kt4nqEg7/lYYLlSHQP++t5EF5Og2+J0PGexT829KESC1gpWR6lG4LmSjN9qiGlvAFELJMh3xiJ9soV3DDEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nw30Q9BE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nw30Q9BE"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd8fd03a2so2425235e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Mar 2025 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741260677; x=1741865477; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0tCVb3iIaIyBkkkekA7WO/rmW0W0Zi+Itg16RAYECk=;
        b=nw30Q9BEry2n1s+28/uPk0Exscj+ujDektiZesvF03SnmIJJ9JItYNBvTgr0eYpEvq
         HfnNjJ0teiHfRGpm4FH5CDoouNcuEFztR1Kze/f14F9Sk7ye7Os8nYUpV0dp8wzV69+2
         AdEwVHIqol3hVLTIvPf6AL1is+Eu82a4m2lvuBamCfGd6voSLKbWQrOvwdykHm/qIGgW
         t4oC9GpBu6BJmB5+D80hGWF7wVbiFpr/6GaKnVFNzse3H1mZGst5R8kQB3tB0Zn0/6/x
         hjVXvmioleXCYegPDFqaUguRtQeADkjcqn/PO1BauZuuF/ke3QDY0bkFD/q3KbvgV8CS
         AI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260677; x=1741865477;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0tCVb3iIaIyBkkkekA7WO/rmW0W0Zi+Itg16RAYECk=;
        b=qdcXR9xIMR7d+4ml/PyO3n1WYyck5YlD7xBL4ABN1Bg8PkYmEHE799CIm+9l0jT/Pi
         tWrJZJJUN1oY6m5vSivoeqgfhKT1rmDuKY2aIHks6xdFFXGHEuzWKFQgNr8ctUvuthK4
         hZxOQFVZB5CyHtquyDNyo1Adu/Uj0coieu62TRM+t9Zicr7dnZqJpE2rsMiWVOrJfWBr
         JlEA9ru2/jhSSQ0JF54PifNpq22aJO2jyufyDKJHgYL6xg86zBHHwxpSGipT25JYKbkL
         0uf9IoZSS67+FW3RfI+cBAwj1qa9wKrP/IhbmwExSANVWshaq59y3yUSXv0bhLCQVJMI
         Jzfg==
X-Forwarded-Encrypted: i=1; AJvYcCUIq5YRuF49Cubt7mpRb6b7P7QxvlsEjEPPiQia71x9mxdisk7f5kF70+EZTYwD0BSfHPPj/rmZ/lYyf3uxsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oydve+GQOnUsGUNp3/iX+N774NRiArPbaopgBA0nLfWUVADf
	s0fvvl49wYFUQ7b9N/jkOhFTNmLIKU09+1iurmBzn2lFZ6VRyENCjJnquWXuRpPcOnqK5S5kQSn
	Z0nCdghedgfpzAg==
X-Google-Smtp-Source: AGHT+IGbjIxQ+LXn3IimoRkTh08izP5tV0mAeGWCiKncwsCuPuVt5SSfdtPUELb1s0fR5mdTrGN0Vdo8WYa1GGU=
X-Received: from wmrs15.prod.google.com ([2002:a05:600c:384f:b0:43b:cacd:235e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f84:b0:439:a138:1d with SMTP id 5b1f17b1804b1-43bd29b8545mr46277695e9.22.1741260677638;
 Thu, 06 Mar 2025 03:31:17 -0800 (PST)
Date: Thu, 6 Mar 2025 11:31:15 +0000
In-Reply-To: <Z8l1Zt3ibanzBhnX@mango>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Z8hUIPtE_9P60fAf@google.com> <Z8hmCkeZGPwc5MuU@mango>
 <mE_To6ll96gFJQD9YKkT-mwa2KCHFCgOaZFxxczeDVJd0hr1rZCKFHD-vHQfm6deCjlUJIu4U-reNMtrwfyT7w==@protonmail.internalid>
 <CAH5fLgjFBknTmhxQBPUdB-iNMjEkcyuLiu22-Nj-DGB1Gb7NkA@mail.gmail.com>
 <87ldtj8p2m.fsf@kernel.org> <JPqvzrz3Zy0HgwNoHh2psup7imFItiN_j_VmmjVPBfwJzf040DTvZAwUDjNv1FQiLXFiSAANIxc2IegeKGCJvA==@protonmail.internalid>
 <CAH5fLgirYTV6K2QoH9LLwhHxJzz=h1R0jB4G2kpKQ_pBtBgePg@mail.gmail.com>
 <875xkn8k5z.fsf@kernel.org> <Z8lsetLbHvn-6cai@google.com> <Z8l1Zt3ibanzBhnX@mango>
Message-ID: <Z8mHgyNxb6rv6Vhm@google.com>
Subject: Re: [PATCH v4] rust: adding UniqueRefCounted and UniqueRef types
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 06, 2025 at 10:14:05AM +0000, Oliver Mangold wrote:
> On 250306 0935, Alice Ryhl wrote:
> > 
> > Ultimately, if a struct implements AlwaysRefcounted, then you can always
> > increments its refcount.
> 
> > If you want a version of the struct where that
> > is not the case, then you need a different struct that does *not*
> > implement AlwaysRefcounted.
> >
> I guess so, but it would be possible to make 'From<&T> for ARef<T>' opt-in,
> by requiring a separate marker trait.
> 
> That you can call 'AlwaysRefCounted::inc_ref()' directly doesn't seem a
> problem to me, as it will only leak the object, not create a reference.
> 
> A quick grep shows me that there are currently 7 implementers:
> 
> unsafe impl AlwaysRefCounted for Credential {
> unsafe impl AlwaysRefCounted for File {
> unsafe impl AlwaysRefCounted for LocalFile {
> unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
> unsafe impl crate::types::AlwaysRefCounted for Device {
> unsafe impl crate::types::AlwaysRefCounted for Task {
> unsafe impl AlwaysRefCounted for PidNamespace {
> 
> So it looks doable to me.

How about this:

* Rename AlwaysRefCounted to RefCounted.
* Introduce a new AlwaysRefCounted trait with no methods and gate
  `From<&T>` on it. It has RefCounted as a sub-trait.
* Introduce an Ownable trait with an Owned type like in [1].
* Given an Owned<T> where T:RefCounted you can convert from Owned<T> to
  ARef<T>.

And there needs to be a safety requirement on Ownable or
AlwaysRefCounted which requires that a type cannot implement both
traits. Alternatively, if a type implements both, it needs to be safe to
have both Owned<T> and ARef<T> references at the same time, which could
make sense for a type that has one "special" reference and many normal
references.

If you want conversions ARef<T> to Owned<T>, you should add a new trait
TryIntoOwned that's a super-trait of both RefCounted and Owned and has
the `try` method for the conversion.

Thoughts?

Alice

[1]: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
