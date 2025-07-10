Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABC28C5CA
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137269; cv=none; b=HRhn0li0yjJPT2HZnk6GGBAkEM1+KC3L6DYx2UFjvUvYX3eJtt0ofKS84XP9YdFY2vkdnwiww4t9p89EwxxN1K9pSJtH2WrJCJ4KaA2dGaHq1p3o52o5PDTvLUFMv9ZoHgNdkfFZLlSzXcqTy9vSbcs8g/iuEGEJeAgwotFrs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137269; c=relaxed/simple;
	bh=57V0TYHG4HiRpDjObfiX8523KoBb7uejRCFwjUXkGuQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otXGZdjnkb0VS7pAACkddbCYAy7aFnoTr9FNkwFlhOdyEm29oICiDTtmhujfRm907RB9NWb2MHQau1CqmIKfdQX1AN+T5/QZObZBKI5TzJrf4ri4uhAG24Urah3qlQxNrUX76c/YDi2EUtAKbbllfJdv+koUiXGt4mUgJ77UM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3iH74tM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3iH74tM"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450db029f2aso3762815e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752137265; x=1752742065; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiT+cF5jie4GC59R8tbVZyTkxmY5kyeE7d02aQYTPCo=;
        b=g3iH74tMDT98LkIjPjN1EVqMQnCHFxDi8QJeab45CF+BsyIqroNFjo/6z4eXeCs92E
         KmWmHphBvcOW8o1cFA7AxMFrCjg68tNK/q6TXiHkmQ4u2UYhHdlcRuxENacdD3GCU0w5
         W5GcAXSayuA0N6AIgQhatV8FzfRbbA74uOjSas5JvYqSpSa7QRTc+CfovBt/Gc1Gorj+
         7pDW3q4UG3zfn0rF/16qJVvDNwUXCwnAmYT2z5J3qhwGbPIHmDhRbOGtl8H50SfMgFwg
         3v5ploEMWoSeC19ERIy6HtjTDwLrvgtQXvBmo/hiHxv/goIe60aTaGxMrQ9gIuv9JJBu
         oUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137265; x=1752742065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiT+cF5jie4GC59R8tbVZyTkxmY5kyeE7d02aQYTPCo=;
        b=Q6G9fXAD7NI5U8b53LeCawNLD9caAP3xFf6SHKMUSAHkz4N8vIX0luXNJKmMVVemtN
         FgfTgR/LS6kcJKJ/Ruo51UmroN3D8XsM0bGtFk1mn8Jrm1G1VMmHNXZcJHpu3eFsoGSF
         DiPygRuYNN3ng84mnxpcfoPdDUNwXI/5vJNPgVnpNNJKJxwPaswS1MKhpPr+r7/+QOZU
         G7foXcIzqZBG3W1u/6n9K6AyH2G1K6PhDghFUnCg93Uo/YRtRRlu5vJOQ6NqHWwZ+vg/
         SfprcKubPcN8TqXX7SOgEt1gXT9ql/59bTwVucLlMMaYY5W1cCMSklOUrNumiOV228ne
         YCBg==
X-Forwarded-Encrypted: i=1; AJvYcCX++o+RZVjH5dcWU6Srl4G4zmdi0asx23JP3CrFz5/weASSNO6bqP9qO2iH3xmQ22E/Bbytj3d/H6M0xDYlQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwDy3jfnpFM4HxjBJh1A3M0W6c0gDkqMePK3/JnSQQkMZITwD
	bsfMydJ17oKxtAhSbRbJrDz/V4PXwCs9WfF8kSf78FTrRB3fQ5JhUE4rJHYSMahjZtiasYzXb96
	oybno2d07LeARoseDeA==
X-Google-Smtp-Source: AGHT+IGK69YzUiltyubhCeTYslvStKPrTGYmrpcKUFP45k02gQ/9NltQd70XDpa+u73OYmjTLWZ0yP9DJqMc6GE=
X-Received: from wmth15.prod.google.com ([2002:a05:600c:8b6f:b0:442:f9fc:2a02])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e55:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-454db8909a8mr28725405e9.30.1752137265730;
 Thu, 10 Jul 2025 01:47:45 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:47:44 +0000
In-Reply-To: <87qzypjrdm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250708-rnull-up-v6-16-v2-0-ab93c0ff429b@kernel.org>
 <20250708-rnull-up-v6-16-v2-3-ab93c0ff429b@kernel.org> <kpVk60lBMPJ_b4glgS0w-BfbIjN1cMCDSKDoM0RAB4p1Bg1BNfIdA4YRuOu70BbSZjlserkd8EJDwy0vVmR7yQ==@protonmail.internalid>
 <aG5tObucycBg9dP1@google.com> <87qzypjrdm.fsf@kernel.org>
Message-ID: <aG9-MAwbNbjuoR0i@google.com>
Subject: Re: [PATCH v2 03/14] rust: str: introduce `NullBorrowFormatter`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 09, 2025 at 05:49:57PM +0200, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > On Tue, Jul 08, 2025 at 09:44:58PM +0200, Andreas Hindborg wrote:
> >> Add `NullBorrowFormatter`, a formatter that writes a null terminated string
> >> to an array or slice buffer. Because this type needs to manage the trailing
> >> null marker, the existing formatters cannot be used to implement this type.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/kernel/str.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 59 insertions(+)
> >>
> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> index 78b2f95eb3171..05d79cf40c201 100644
> >> --- a/rust/kernel/str.rs
> >> +++ b/rust/kernel/str.rs
> >> @@ -860,6 +860,65 @@ fn deref_mut(&mut self) -> &mut Self::Target {
> >>      }
> >>  }
> >>
> >> +/// A mutable reference to a byte buffer where a string can be written into.
> >> +///
> >> +/// The buffer will be automatically null terminated after the last written character.
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// `buffer` is always null terminated.
> >> +pub(crate) struct NullBorrowFormatter<'a> {
> >> +    buffer: &'a mut [u8],
> >> +    pos: usize,
> >> +}
> >
> > Do you need `pos`? Often I see this kind of code subslice `buffer`
> > instead.
> 
> How would that work? Can I move the start index of `buffer` in some way
> without an unsafe block?

Yes. I think this will work:

let buffer = mem::take(&mut self.buffer);
self.buffer = &mut buffer[pos..];

Temporarily storing an empty slice avoids lifetime issues.

> >> +    #[expect(dead_code)]
> >> +    pub(crate) fn from_array<const N: usize>(
> >> +        a: &'a mut [crate::ffi::c_char; N],
> >> +    ) -> Result<NullBorrowFormatter<'a>> {
> >> +        Self::new(
> >> +            // SAFETY: the buffer of `a` is valid for read and write as `u8` for
> >> +            // at least `N` bytes.
> >> +            unsafe { core::slice::from_raw_parts_mut(a.as_mut_ptr().cast::<u8>(), N) },
> >> +        )
> >> +    }
> >
> > Arrays automatically coerce to slices, so I don't think this is
> > necessary. You can just call `new`.
> 
> Nice!

I'm guessing it used to be necessary back when we used core::ffi::c_char
since &[i8;N] doesn't coerce to &[u8]. But now that we use the right
c_char definition, that isn't the case anymore.

> >> +impl Write for NullBorrowFormatter<'_> {
> >> +    fn write_str(&mut self, s: &str) -> fmt::Result {
> >> +        let bytes = s.as_bytes();
> >> +        let len = bytes.len();
> >> +
> >> +        // We want space for a null terminator
> >> +        if self.pos + len > self.buffer.len() - 1 {
> >
> > Integer overflow?
> 
> In the subtraction? `buffer.len()` is at least 1, because of the type invariant.
> 
> Or do you mean I should do a checked add for `self.pos + len`?

Ah, I guess self.pos and len are both <= the length of a slice, which is
at most isize::MAX, so the addition can't overflow an usize. Would be
good to comment this, though.

Alice
