Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969BE340274
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768054736; cv=none; b=etMtUutc9UH1PwaMW1drx7BFVE6mIICY5imZ9FmOhZmrN/2jmfztLzDZ5bzoVE2tc/CxGs8zdnzVZmO8rI5lk8EWnCJM2LWUotOf58fv8ZGIz/xPJoEcNeH3E4ROe9BadP7Jtt6A9V/ZLvrC7lar5jrLjDFYBpeC+QMFV9w1qzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768054736; c=relaxed/simple;
	bh=kRY0JqaEJXv5qQbOo+PQf0MAXQr5jcaazM3whYofwxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PueIlKWbp8OgnVsrlN0APdwleTfmMG0rA8PORpa1Ie9z+zwgiUDtKd31iA0GHDhdHSpQSQNrs1RKAjYqfU3XrA0XdWBAwYOZ8rtkZqaaVtF7BLuGNbfEDYgOWUBKXiMG1EOesUveTwsk6X9o/miM4zGNVq7/LHcgJkfRBtyeBeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pnz88Ei2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pnz88Ei2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4193382f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768054733; x=1768659533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P30oa28eaoIPl8AwLjzFvZMrpwraSTVXtEjRXijkH0I=;
        b=pnz88Ei2PKvd5E+1cHqKt+md8YVzGsfmqga3oLk+2p48HgLyfpYfUjPZK0Mba0Av3w
         1Erk2k0ryVhkRXu+Xd6bu/UM4woJiX+vhgzt6l/6KhsVo3eUDVh/XAjQLiICk+wYHBoi
         IBBE8p3JL/VPWIH8RwBNrVJpKcozBi/zFMwGOdGjmAWbIA1IR4cvnUO/ytZ6WdPR2vWj
         DhXwv0Sv7xK7FPpmeCLcArhTTMFlEGVhoPDBSs+SlfgoWNSB7uC88J5r2TwNHH/TkRzs
         58UCWtYCvDsjBVz+mZfRgv13HJNYhKYORK2dswpXqoj9uZhkguAtkwug5INcxl5qrJMy
         tjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768054733; x=1768659533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P30oa28eaoIPl8AwLjzFvZMrpwraSTVXtEjRXijkH0I=;
        b=JXlWtr0cpBbUHPBsnIQoIniGoavG9J14h2MZQPQgVyabTVPygfH4CoXLSVVRMc+JGC
         tjSa8rn/g32xcD/fJpHW3BPBI7d/SrBkz/Rl2LAUI3i8+N+G+UTp8rgtMBi1ZSLcQLqi
         0dXAYfLHm8m1LT87tagGCwEAdacKl7o4EMkL+M6Am+rqDTLQwAYLHjxnz9+nMXv+dWMR
         SeJFBBNv0NdZtM+THrb5Nvix4b37KQ3CPMQ872UNORHlQ+Uba7B8WfzDW3jzbFuQoyUu
         xHheiOFK7ufMC0cqtZN7+2+Lk4ml7RLMZKfOreAcvKUCTOAZKOfcZBn91MGbkpIrf/Rn
         YpIw==
X-Forwarded-Encrypted: i=1; AJvYcCWy87cvV2NPQl+MZa/iGuZ0RypKjH7kTuMK6gbS3cn+2tw6DlmAOcAoDTPnOGCPl0FrI/RyrAC7eY+nY+RXcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZnOfpXnvyebzJrq6uX4AqTpk+3pI+GtZIslibHkoonSoToAh
	LK2RlduCIWaBJPZsPsDz5iiRgve5Ze37/e2bxI2jrMR8qDjZ2eguTTr/Msg76N1T3em7CdgNXG8
	IS27jk4hwWYZk+aFtjCGBrkuHEmmkeDG0C3m4tvlB
X-Gm-Gg: AY/fxX6T0XxjpstbCFN29MNK61bQXXH7iNAe0KSb3/F2ZRFoaT9MC1DBQX26FZ5D8FL
	vbuK6FBfNvXaHwQA82/pJ0yaVauwTt+bPOWpsYWv7WjobU2QzGHryByZw/PFzcUBDtWvpAhydM1
	mAf0PL/2yr+TkNMNTJlNCAq3hiJ55c2RiM0Qm2dzqhr8ZWdHRKyrIbRr6b+x09kgPZx3a01fDn9
	Uv5UiY75NoJfhcmMACTR9thhhVU4iG07VOnFkmFxmC3LL4lifSfh0/Gns9zueJ8QF5A7j2fUIY9
	qfzPXJGE5ldrBt8wNqRtpfDHUQ==
X-Google-Smtp-Source: AGHT+IFglpBqZsftOEMBSk7GyoKYSiMG04MSMuJsSbVHeFpfdrYZ86aazWoXfBSw/e0KbyZ0G4EVfbsmY2hdXiL5WZ0=
X-Received: by 2002:a05:6000:2508:b0:430:fbe1:382a with SMTP id
 ffacd0b85a97d-432c37d36e3mr17276338f8f.54.1768054732845; Sat, 10 Jan 2026
 06:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
 <20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
 <aWC66BAmhDgyqpfJ@google.com> <20260110.214825.1069367234137458141.fujita.tomonori@gmail.com>
In-Reply-To: <20260110.214825.1069367234137458141.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Jan 2026 15:18:41 +0100
X-Gm-Features: AZwV_Qir2ktlGD2Z_ADJ-HahCFZ6-IT1GbpNjYAeVtUEuN0HAG43-8xLyU2jAh8
Message-ID: <CAH5fLgjtL4PdPOmsORBe=JmfsJuSbZmrU+R7zyjhPxRnYqET7Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 1:48=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Fri, 9 Jan 2026 08:23:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Fri, Jan 09, 2026 at 09:36:41AM +0900, FUJITA Tomonori wrote:
> >> On Thu, 8 Jan 2026 13:54:58 +0100
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >>
> >> > On Thu, Jan 8, 2026 at 1:50=E2=80=AFPM FUJITA Tomonori
> >> > <fujita.tomonori@gmail.com> wrote:
> >> >>
> >> >> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> >> >> users can use Atomic<Flag> for boolean flags.
> >> >>
> >> >> The backing integer type is an implementation detail; it is current=
ly
> >> >> i32 but may change in the future.
> >> >>
> >> >> Document when Atomic<Flag> is generally preferable to Atomic<bool>:=
 in
> >> >> particular, when RMW operations such as xchg()/cmpxchg() may be use=
d
> >> >> and minimizing memory usage is not the top priority. On some
> >> >> architectures without byte-sized RMW instructions, Atomic<bool> can=
 be
> >> >> slower for RMW operations.
> >> >>
> >> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> >
> >> > Can we have a `struct AtomicFlag(Atomic<Flag>)` here whose load() /
> >> > store() methods use real booleans? Otherwise this seems inconvenient
> >> > to use.
> >>
> >> Do you mean something along these lines?
> >>
> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> index 473d3c07e234..19750be1a239 100644
> >> --- a/rust/kernel/sync/atomic.rs
> >> +++ b/rust/kernel/sync/atomic.rs
> >> @@ -622,3 +622,29 @@ fn from(b: bool) -> Self {
> >>          }
> >>      }
> >>  }
> >> +
> >> +/// A convenience wrapper around [`Atomic<Flag>`] that exposes a `boo=
l` API.
> >> +pub struct AtomicFlag(Atomic<Flag>);
> >> +
> >> +impl AtomicFlag {
> >> +    /// Creates a new atomic flag.
> >> +    pub const fn new(b: bool) -> Self {
> >> +        if b {
> >> +            AtomicFlag(Atomic::new(Flag::Set))
> >> +        } else {
> >> +            AtomicFlag(Atomic::new(Flag::Clear))
> >> +        }
> >> +    }
> >> +
> >> +    /// Loads the value from the atomic flag.
> >> +    #[inline(always)]
> >> +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Order=
ing) -> bool {
> >> +        self.0.load(o).into()
> >> +    }
> >> +
> >> +    /// Stores a value to the atomic flag.
> >> +    #[inline(always)]
> >> +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool=
, o: Ordering) {
> >> +        self.0.store(b.into(), o)
> >> +    }
> >> +}
> >
> > Yes, that's what I meant.
>
> Thanks for confirming. I'll add in v3.

I guess another good use-case could be `AtomicTracker` in
rust/kernel/list/arc.rs
