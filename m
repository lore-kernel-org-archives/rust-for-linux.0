Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8DF1EB5E3
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055514; cv=none; b=pxmz/HPAdXOq2BA5ESwjSKSPw3mcd6GwMsBaa+D4m9aAv5xRPgXUtsjaR4P/aLy7eZLeRgx379r5d3NfQXXVnhueFAkqyuwMdfhJ83GkbVCvbf24+qPhDDNiEdrpRUa4ooYdKftFuqX+nrltwHqbhsKRI88EYire3hmijpmT1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055514; c=relaxed/simple;
	bh=/uUypffnMG613Awp49V7FFWn7cnpNl2zzhx/VfIEIsU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bWJE5eyXL8S7+Syts5i6C36i7Fl01Whqwm9R8aHkBSX9URyVe/+h5xSLvxjLRYitwMCLUryFQ2sL/QFqEzDFX0zRip09jlvZcBNfl3bO39Cln4/4kpgkgxncrfBN+RLzjdbJ7C3mtWCSLen1KUmygsWhLYofrWPSxGlJRsrY3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/+506a2; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/+506a2"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b3d21b18e8fso590511666b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761055511; x=1761660311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwIBzfsemLNSgeI4JBczXNhpdEVl3XYdLb0S3kIsTLQ=;
        b=G/+506a2kCVe2ugg9kNzScHxDSiwbZ6AqbeCjhZuBjvcsaqP7J8mCxfLtUXlMHfz/A
         lXy9o+1N43Rqw2DmiuSlCnG2sDkBRmApTJU+UeSdPooKNd0oBL3ZIXWccfEF8Gg3jhQn
         zxNyx3OXaYt6B4is+byMxoZpWX0m9lEkmhutxy4GB+E88hmVtdop06a9JcgAIAy3j1tc
         9qaik1AVZOFxw4gDRRrGk9vtpPAp1zjmPCIFng9GM9A1Vprzowklz331yI70ETjiQcAe
         MykAudXbSNynpOa2Rq6Qdgfl5/DUUKXl6BdNeM26pH8mtZSVAJdWa6ZpzzqUFc6CYmRs
         X9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055511; x=1761660311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwIBzfsemLNSgeI4JBczXNhpdEVl3XYdLb0S3kIsTLQ=;
        b=RvBKmmDnD+OiaFgXIBFqyI0oh5vKp4dYp92suLUYZci2Ju18K6wJ0N27SbpWHAVxlm
         ZQZLwv6X28hWwdoDq6nmR1pdoRfk4lFoeAAcLDuf6+UQzhj7m4gwOg4xhpkty0CWGTil
         Z4c3dp1qdUK2wfMEvgoDJHkea1dqIvqQR6fW11OfZZJ31uTO2fysoEwHJJpT4ezsYuup
         29ZR68Um2BXPrXVw7O3qTtqRzElrWOkzmHmajbSQTSdM43Lrt5e0NzwdtzozVeGh35wA
         Jsb1HuzBGyr8DqABodm30KdGM48HU1FymtrR7/Z1JJDFaA4Vd6DFc8LfWvwYqV0ltZL+
         QNgg==
X-Forwarded-Encrypted: i=1; AJvYcCX5FpfLYX0pO+DYz2banxUnaRPJ3S5QFalzqjO8FkNQhek5h67VNRgQuA5XBZ/8KgNe/hwnNifdrMMaB/gvGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4BrIeHXXEn2fNqAq04I4C6pCr0F7O5406deJxSenet6Qabl1
	Ki69o8V4EQGSLLYQpnrYd/1Fk0WbkvQspV//xTW/rUuj5sR/5muxH+ahIIH8B4QRgUPFUZPqnae
	CvkA85NjwuSAdSVGijg==
X-Google-Smtp-Source: AGHT+IHKB3003A1U/JP1zNHQkqdcW6LnphrhxqVfMplJcO9n2MDKFCj3bL7Rx0+gvLE3N8tn0lnPPnSkhVRedzI=
X-Received: from ejbs6.prod.google.com ([2002:a17:906:606:b0:b62:94b9:76b7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7206:b0:b41:6ab2:bc69 with SMTP id a640c23a62f3a-b6473243ec2mr1734703266b.22.1761055509441;
 Tue, 21 Oct 2025 07:05:09 -0700 (PDT)
Date: Tue, 21 Oct 2025 14:05:08 +0000
In-Reply-To: <DDO06754OMN5.G0AN9OCWTFLW@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
 <20251021071146.2357069-3-fujita.tomonori@gmail.com> <DDO06754OMN5.G0AN9OCWTFLW@kernel.org>
Message-ID: <aPeTFMeVoIuo8Lur@google.com>
Subject: Re: [PATCH v2 2/2] rust: Add read_poll_count_atomic function
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, daniel.almeida@collabora.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 21, 2025 at 02:35:34PM +0200, Danilo Krummrich wrote:
> On Tue Oct 21, 2025 at 9:11 AM CEST, FUJITA Tomonori wrote:
> > +/// Polls periodically until a condition is met, an error occurs,
> > +/// or the attempt limit is reached.
> > +///
> > +/// The function repeatedly executes the given operation `op` closure and
> > +/// checks its result using the condition closure `cond`.
> > +///
> > +/// If `cond` returns `true`, the function returns successfully with the result of `op`.
> > +/// Otherwise, it performs a busy wait for a duration specified by `delay_delta`
> > +/// before executing `op` again.
> > +///
> > +/// This process continues until either `op` returns an error, `cond`
> > +/// returns `true`, or the attempt limit specified by `count` is reached.
> > +///
> > +/// # Errors
> > +///
> > +/// If `op` returns an error, then that error is returned directly.
> > +///
> > +/// If the attempt limit specified by `count` is reached, then
> > +/// `Err(ETIMEDOUT)` is returned.
> > +///
> > +/// # Examples
> > +///
> > +/// ```no_run
> > +/// use kernel::io::{Io, poll::read_poll_count_atomic};
> > +/// use kernel::time::Delta;
> > +///
> > +/// const HW_READY: u16 = 0x01;
> > +///
> > +/// fn wait_for_hardware<const SIZE: usize>(io: &Io<SIZE>) -> Result {
> > +///     match read_poll_count_atomic(
> > +///         // The `op` closure reads the value of a specific status register.
> > +///         || io.try_read16(0x1000),
> > +///         // The `cond` closure takes a reference to the value returned by `op`
> > +///         // and checks whether the hardware is ready.
> > +///         |val: &u16| *val == HW_READY,
> > +///         Delta::from_micros(50),
> > +///         1000,
> > +///     ) {
> > +///         Ok(_) => {
> > +///             // The hardware is ready. The returned value of the `op` closure
> > +///             // isn't used.
> > +///             Ok(())
> > +///         }
> > +///         Err(e) => Err(e),
> > +///     }
> 
> Please replace the match statement with map().
> 
> 	read_poll_count_atomic(
> 	    ...
> 	)
> 	.map(|_| ())
> 

IMO, this should instead be:

	read_poll_count_atomic(
	    ...
	)?
	Ok(())

Alice
