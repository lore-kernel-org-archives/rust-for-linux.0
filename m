Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A01624C0
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056318; cv=none; b=sRCpazA42gCXLpYECegW6pMS9eTgNONT/u03chS25qYMYF5/jfQczejs3gZLlQzCYCvOCpCZvwrMASUEnDZpAkfza2B1avxAxOPvLUzcSuSCtL12EpDEf8aeuwSxOYJ81D/eWJRdZxhh3ddV8+TN78OxIvJELD55/65miSppj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056318; c=relaxed/simple;
	bh=G2i9yWySi/v48Ebjji4Nj64nKEyYHuwWB9jaEsUT3DE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uY8urAxcJEnqVJcqEtZZk2JKz9tuDvm7XhwzLDEFr1TYIX+1BYS1U/6z5qi5HzEU8Z2pEtIuhrhAZDJydzmB8T9KCveHqm6C24Dd7jtnK3NJt/+lgVOa5m7ddigRrqXPBsxtEIvrQfbdMT5cAxs39E/o6Xit70M2euiXrE9joHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nr19N7c/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nr19N7c/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471001b980eso34958935e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761056315; x=1761661115; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQdVaPHWC5nGyUNhdHevRrTzZGcav457nDokZnpXcmE=;
        b=Nr19N7c/h7d3fwRpb/h99ELNWkelev9MnkLSsHQYj/hgySVTaxLPQ3lmk+kYq71S+i
         HzaiYbdcMBNJuhqR181f/QT0wXfb8gW07E+jLF5DmJhtcYRN8Wy3rZsJx6JSlA0oB+Vz
         X+2b21zooj7+DO7qMd7EdzZ8+5LGQblVGExoBiI+AhkY3RGWl2iBllh2WKFF+X1Ofsnt
         ofq25V94OGZYabq7VzgjB5BivLb1QEqfYBVXEcNKIjRbPsSIQtQ//n5XEw25bftLAmH9
         TrAknecx76GQm0oLNJVUgPfT3hpQG5fTzdiC0V1Ww2R/FKqC3m633PO5BXoLKw81xUNj
         7P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056315; x=1761661115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQdVaPHWC5nGyUNhdHevRrTzZGcav457nDokZnpXcmE=;
        b=iI3rXzaCGn09xxIOe0KF0DLFooFa6FurOoJN7qOngg1kbSRz1uf4Ad0Au6UwMyPg1R
         pJRMzHi9JS9Q3lBLTxzMvHToNSJr+kTRr4ZXqXHWpXsozy7AvzWathch9vzXuq3JZ2Ph
         iocr2nmrQIQo6uHmjTGXAIxdtbAQY/NfJIUjz02RsA6F0XQZo4Hvt5c8Fp8FmW0kXup/
         sHnftUyD2bHWJNdt/3YeOmJREg2nGuocsokN4DyqdjF+ilF/GBSEcyfLrCC/m/xm9xpk
         bdmVrhZLPMB0sXinTBcabM5OLwDN96z73bZHDzyMBs40gId5NspCgumKxsHPemdE+lOG
         Hsbg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5CUqMlXUdSpJxb4hcHyzmE+G3DLxR1nXEdXAJWU/2IiLQEa8BOpS7TWTdpPXsIKt277arYKhwj0M54bNpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+rufNvjFNHGm2KQ5nAxi30ZDofUSjr4q2FFjVmU+DWtY5k48
	w1lgYfB04D+PNZo0EWsdo3r+7BGMNow9gnsTAgEt95AGd9DsAGQIEkiG7SLXTwI0Uv4yLeWCqG8
	RU6M3rRNtVQspycRSIg==
X-Google-Smtp-Source: AGHT+IFrZyky49hPiz1bF4Hr0vaY0X6dj1C9mLZbtlTkEVUM0X8fV7t9NoWsF4Vvt3U68ZAUeguXBFFNKpmc0+0=
X-Received: from wmcq11.prod.google.com ([2002:a05:600c:c10b:b0:46f:aa50:d701])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f10:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-471178afb7amr119090415e9.17.1761056314830;
 Tue, 21 Oct 2025 07:18:34 -0700 (PDT)
Date: Tue, 21 Oct 2025 14:18:34 +0000
In-Reply-To: <DDO29UN4UBVV.E90DEBURH63A@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-4-dakr@kernel.org>
 <aPeSCuFNrV-_qvBf@google.com> <DDO29UN4UBVV.E90DEBURH63A@kernel.org>
Message-ID: <aPeWOhycOIl_rlI-@google.com>
Subject: Re: [PATCH v2 3/8] rust: uaccess: add UserSliceWriter::write_slice_partial()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 21, 2025 at 04:14:22PM +0200, Danilo Krummrich wrote:
> On Tue Oct 21, 2025 at 4:00 PM CEST, Alice Ryhl wrote:
> > On Tue, Oct 21, 2025 at 12:26:15AM +0200, Danilo Krummrich wrote:
> >> The existing write_slice() method is a wrapper around copy_to_user() and
> >> expects the user buffer to be larger than the source buffer.
> >> 
> >> However, userspace may split up reads in multiple partial operations
> >> providing an offset into the source buffer and a smaller user buffer.
> >> 
> >> In order to support this common case, provide a helper for partial
> >> writes.
> >> 
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >>  rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
> >>  1 file changed, 24 insertions(+)
> >> 
> >> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> index 2061a7e10c65..40d47e94b54f 100644
> >> --- a/rust/kernel/uaccess.rs
> >> +++ b/rust/kernel/uaccess.rs
> >> @@ -463,6 +463,30 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
> >>          Ok(())
> >>      }
> >>  
> >> +    /// Writes raw data to this user pointer from a kernel buffer partially.
> >> +    ///
> >> +    /// This is the same as [`Self::write_slice`] but considers the given `offset` into `data` and
> >> +    /// truncates the write to the boundaries of `self` and `data`.
> >> +    ///
> >> +    /// On success, returns the number of bytes written.
> >> +    pub fn write_slice_partial(&mut self, data: &[u8], offset: file::Offset) -> Result<usize> {
> >
> > I think for the current function signature, it's kind of weird to take a
> > file::Offset parameter
> >
> > On one hand, it is described like a generic function for writing a
> > partial slice, and if that's what it is, then I would argue it should
> > take usize because it's an offset into the slice.
> >
> > On another hand, I think what you're actually trying to do is implement
> > the simple_[read_from|write_to]_buffer utilities for user slices, but
> > it's only a "partial" version of those utilities. The full utility takes
> > a `&mut loff_t` so that it can also perform the required modification to
> > the offset.
> 
> Originally, it was intended to be the latter. And, in fact, earlier code (that
> did not git the mailing list) had a &mut file::Offset argument (was &mut i64
> back then).
> 
> However, for the version I sent to the list I chose the former because I
> considered it to be more flexible.
> 
> Now, in v2, it's indeed a bit mixed up. I think what we should do is to have
> both
> 
> 	fn write_slice_partial(&mut self, data: &[u8], offset: usize) -> Result<usize>
> 
> and
> 
> 	fn write_slice_???(&mut self, data: &[u8], offset: &mut file::Offset) -> Result<usize>
> 
> which can forward to write_slice_partial() and update the buffer.

SGTM.

> Any name suggestions?

I would suggest keeping the name of the equivalent C method:
simple_read_from_buffer/simple_write_to_buffer

Alice
