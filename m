Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1D25B1CB
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407077; cv=none; b=pcz/n1ipJfTDQzdPLbF2HRg6QKpRLEjIoXjyjKMv8CHF1vWTQuDYufhPakVCDu3VqXOFrWPHIMZwtOa3uilqo8VTqBMkvHi4FMvP0+PteT29j63Hltkp73KMJCsbNqnc0AbuQU5czw6n9WcQjqKKYRb3cWGaQ3ceerXn79eSIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407077; c=relaxed/simple;
	bh=ynAGL37s7FWBMrSgqUjiQMxCYwtmS+dVwdIirYlrhRY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q+JRQJN0od2b1+lqlNV70JtSAKPFCeq2xrVWTs7saxGnU2KKkwyUqZjkna4rpKfIX81aANrIrZ6Ora4RHmjj+pd8slBako8AskA7jwPC1T58awrlllZxZb/Mk9WZ+1K0EIrS5g36aU18lDvFB/FLSc/l2eKO0+SBm9WRLEonzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E0KiGf2B; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E0KiGf2B"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-436267b01c4so4461581f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 01:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771407075; x=1772011875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFgVqtfti6/svD+1ZiUO3++RgsvWnRMRX+ORPut57vY=;
        b=E0KiGf2BcVd844C+NUaC0txq/SfrprjiBTSF5ysBUBkWUSb0w15JRoOh2GVw4Xf/xl
         a2iZWR0glWICf+bFdgrte4eEY5V+qAXQcRgAXlAEtWmJ6h8zfm0PQvdLNHFbA7baoizt
         hJoGQM+Rtc4LQ49wkrZIqVbx+xRiybdPMEJJnSwfDFtI1B/hXIWDKkqr4dXit+EbNsKM
         dnR7Y59QKT75mhqPUQiemy90T2O78G7OIpL7hyap0AQF1rcyqTbopuYhRFjKNS8QITzE
         CqDTUl/b6hbEAKMwuUptnHeGJB2fzs39YKYp3r/VJVP3Hy1rxJ1se8A+9BVxMNReF4Gv
         qSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407075; x=1772011875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFgVqtfti6/svD+1ZiUO3++RgsvWnRMRX+ORPut57vY=;
        b=CASd0p9SBP+PORM+tnrWI+WocN2mWsEpviVdtUckhjm3m2tKxf8ZSpSgDuI3byHb2G
         kWps7VgKp0pNbeTnmRtys0clK+C0zXGGYCpHDQB06JZN7C1k5bPsXqFl04FV6iq+dNbZ
         JRWbtFy8kzWMTm+YiOq8zrl7C363yXCbdi284Goc4zKbfnzFFqzmaJUlFyL3cCXInXEF
         l7TrfKzMNo0UcvAT0CkE+23WKdm6x3E8BdBv251LNLEYBblhc1xdm0I3vIcqmt+2AJHU
         PogJrWInLmsTWrl9sJ0cAw+LlWG8lnAFS1NtSZ+KxfbMvtaUGW+FrSKuKR6LDLT3y9pu
         U0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXn1299OcDHVZHEbE5dU2vyua8IXaXf6kkULJYPJ1wLGHlJublsaSsJxD0WtfirTtdPpx/NfxEj//3zXGsFRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzGPsNzg4OtpKLFe4w7WKJK9paIU61WY4p3YkFtReBgL6fPIY
	1GmCx0wxCtQ+ZDc5Cg+TsCOKF+lkqOcmazS4wUl5LGotixgmklSBx/pwJft4vI6WLyUL8cFCHm2
	0evtIy7ouSteuF6S2EA==
X-Received: from wrs2.prod.google.com ([2002:a05:6000:642:b0:437:6bbf:a150])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c2:b0:435:e57a:9082 with SMTP id ffacd0b85a97d-43958e504afmr2125915f8f.46.1771407074382;
 Wed, 18 Feb 2026 01:31:14 -0800 (PST)
Date: Wed, 18 Feb 2026 09:31:13 +0000
In-Reply-To: <20260218083754.GB2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aZQ8lJJ-U_8j03Z4@google.com> <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com> <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com> <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <aZRokyTqsd_RwdkK@google.com> <20260217154800.GY2995752@noisy.programming.kicks-ass.net>
 <cbbea9ecb994df975109d97a7756d73e@garyguo.net> <20260218083754.GB2995752@noisy.programming.kicks-ass.net>
Message-ID: <aZWGq8EMxz4omw4L@google.com>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 18, 2026 at 09:37:54AM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 11:39:18PM +0000, Gary Guo wrote:
> 
> > >> Are we really good? Consider this code:
> > >> 
> > >> 	bool is_valid(struct foo *val)
> > >> 	{
> > >> 		// for the sake of example
> > >> 		return val->my_field != 0;
> > >> 	}
> > >> 
> > >> 	struct foo val;
> > >> 
> > >> 	void *ptr = kmap_local_page(p1);
> > >> 	memcpy(ptr, val, sizeof(struct foo));
> > >> 	kunmap_local(p);
> > >> 	barrier();
> > >> 	if (is_valid(&val)) {
> > >> 	    // use val
> > >> 	}
> > >> 
> > >> optimize it into this first:
> > >> 
> > >> 	struct foo val;
> > >> 	int my_field_copy;
> > >> 
> > >> 	void *ptr = kmap_local_page(p1);
> > >> 	memcpy(ptr, val, sizeof(struct foo));
> > >> 	my_field_copy = val->my_field;
> > >> 	kunmap_local(p);
> > >> 	barrier();
> > >> 	if (my_field_copy != 0) {
> > >> 	    // use val
> > >> 	}
> > >> 
> > >> then optimize it into:
> > >> 
> > >> 	struct foo val;
> > >> 	int my_field_copy;
> > >> 
> > >> 	void *ptr = kmap_local_page(p1);
> > >> 	memcpy(ptr, val, sizeof(struct foo));
> > >> 	my_field_copy = ((struct foo *) ptr)->my_field;
> > >> 	kunmap_local(p);
> > >> 	barrier();
> > >> 	if (my_field_copy != 0) {
> > >> 	    // use val
> > >> 	}
> > > 
> > > I don;t think this is allowed. You're lifting the load over the
> > > barrier(), that is invalid.
> > 
> > This is allowed. Compilers perform escape analysis and find out that
> > "val" does not escape the function and therefore nothing can change "val".
> > 
> > A simple example to demonstrate this effect is that
> > 
> >     int x = 0;
> >     x = 1;
> >     barrier();
> >     do_something(x);
> > 
> > is happily optimized into
> > 
> >     barrier();
> >     do_something(1);
> > 
> > by both GCC and Clang. The fact that the local variable here is a struct and
> > memcpy is used to assign the value here does not make a fundamental difference.
> > 
> > barrier() does nothing to local variables if pointers to them do not escape the
> > local function.
> 
> So how do we stop the compiler from doing this? Because I'm thinking
> there's quite a bit of code that would be broken if this were done.
> 
> Must we really go write things like:
> 
> 	struct foo val, *ptr;
> 
> 	ptr = kmap_local_page(page);
> 	memcpy(ptr, val, sizeof(val));
> 	kunmap_local(ptr);
> 
> 	ptr = RELOC_HIDE(&val, 0);
> 
> 	if (ptr->field) {
> 		...
> 	}
> 
> That seems 'unfortunate'. It basically means we must never use local
> stack for copies or somesuch.

No I don't think RELOC_HIDE is what you want to be using here.

The way to stop the compiler from doing this is to ensure that, in
LLVM's eyes, the memcpy is either a volatile memcpy, an atomic memcpy,
or an opaque function call. According to Gary's reply to my email on V3,
it sounds like an explicit call to memcpy like this apparently falls into
opaque function call, so it should be okay.

Anyway, that's why using Rust's copy_nonoverlapping() isn't okay here.
It emits a non-volatile non-atomic LLVM memcpy intrinsic, which permits
these optimizations that we don't want in this case. By calling
bindings::memcpy(), it falls into the opaque function call category
instead, which fixes the problem.

Alice
