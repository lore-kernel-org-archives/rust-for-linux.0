Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF17483
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 00:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762560383; cv=none; b=dcntpIS0K7uDwQbstmjmA9T4fTfBru/cCZ3uScphGvXDBBKaTxMsli17e5V9thzF0wR1Wi9j486Y87S1Q99W4pja/OsJeEP7+vLOm0GSxaD90mpCdMl/WhFi2xGwVkZousufExyLbLmx2PqM0Fxgwmve62gF0XQl2QaFgwY5TDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762560383; c=relaxed/simple;
	bh=RWNwQUBbAVeE18ZQeCAQjPTohyg7nDd8uV27SGaROmM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7eoRkzFvYtSRrojTxJOt7QJF4uuuu0OPG52QQypFVa1C63Amim1aK2NLI8IwB0vHk3MrtwUJGOD+/pAogUwuwUlZmU/DPitNDdVic02bEQrRFLQwKk5sYtod3og1F9ydpa7rpC5i8/JXvZ/k1HZTczaDiGna2rblriNuRH8gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeSmnNvj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeSmnNvj"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b550eff972eso785267a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 16:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762560381; x=1763165181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7h9CdYuOTS5h75lNFIMVYyqAeLAsvDUl8xAoBGVKS88=;
        b=VeSmnNvjOD72Vxo/caOudi+mQcbOwtZOwMLOcWq6a8U4jMHJnO+5JMNqtYQzQ70aDK
         SkkSicFlmP8JfrI7l/kPQbyGN8PNv6iWJoFGscHj55SgG/w1bTeDoTulH2BrkWjWF5+W
         inzvCfqurVOlBQTcFyNGhmSYLjEvnyqR3A8uPEmnggq5Ndl1F1IbHbYtntTUsVJhmo9v
         uSfVu6xG49VHlUpmklf2+s5W9ExsvfEC5rkauiTUOpI3FtxowWqdK2DrH0Ue1D4vXbHn
         70Rc1GVWiIJf8Ha6YtXT2vQ3dFxMGEkO0G8S2Y5+3KxZmVOfzHHU5Lg+nsTcmcWcUSAI
         ByAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762560381; x=1763165181;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h9CdYuOTS5h75lNFIMVYyqAeLAsvDUl8xAoBGVKS88=;
        b=lso7qTqTHCMhwpiGSIywhEC95bpuRHuMaTQ/dnsiTfFv5onvhjHtsbnl/c0hUNDGSD
         5FC8CZ4IE2QLD4iJDdON3G5b5QEQGnnZ+vKoYxKZDfDCSbpNir7GS9AYxMegEOgBWW5C
         IH0MtDfPaIvyZbFudxwNxurZ8FPfMN3/LljU2kHo3Sjqg8Jq954GrUu70AWM8XPj5crt
         YFyGH2p5WVmwZHhWMW4zgQvnz/Z6+FLeMEj5bqet02xx5FDOB6yCy6GcqW+xAZLy4cJR
         zab8jq9BGO3Gh/HmDu0lCWFij1HODOVY8c02sG492wLN4s4+jJ7Q/9XLseZ5ahBdpkM6
         Kt3w==
X-Forwarded-Encrypted: i=1; AJvYcCW3c01gcUTxv5FJFMeaxL9yEaA//TiR4DWFbBHtLXnlJSoL3vUMHnxdbBJH2yFy+PhlKp3aGZFs5YesbwPaOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVruaN3zxfPVgAWm0Xzyk76hbC2K4BkN6Mg9SuwMaC828acmA
	l6BWXxL7KM/NcLEUIlfnMmqL2FXoV7vnVcLdjl9lsN63kEYRgrUznN7X
X-Gm-Gg: ASbGnctiCY9vG5X6rdgTwfR9XEDti/t1RBBc1jFMvTuc7UMw+VoXlj40/9fu7M4w0bN
	3/VshYtqtPBNU0ZqjKZvctsvZP+jWY+D5AlSUAzj0HCbEEngj9C/8PNjPWuUEe/BvLbBKU4RVVL
	MdpMq5DTP4Fi5BEcx8V675dPimghfiE7eCZmYWH1UM3Gjj2J3OHrY+XOuzSH52eK76IuIeh7qXX
	GeVlyn7CVWWAAL4Hqp3f6qB+9BDPQBYarjQLa3UqodM3FSpWeVZ2hXUgS/AURAcfd7KZy3VFF5N
	StIuxDbHRvtjsELTSW9WSqtBQ30QMuUlm2Yq8RC95W8mYlufHzGO2r9Dnse4HspQmhzvxXsoowI
	/J/U3y9xlvvuGOdMXr2/bdZ3h00SKrdHRSzyGFX4WComIX4XsXBysmPL5KPleZTboSJYiwKUq6d
	95I9wR42Snk2t9rsg=
X-Google-Smtp-Source: AGHT+IH33qICY4uaeKk57pGvzo3XJVsrnq22IGhfO2Tvsbq1LFIDdEBpg7HfH7riDrhUDN3/lHoYxQ==
X-Received: by 2002:a17:902:f609:b0:290:b53b:7455 with SMTP id d9443c01a7336-297e5411300mr10140325ad.10.1762560381315;
        Fri, 07 Nov 2025 16:06:21 -0800 (PST)
Received: from Cyndaquil. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c9c310sm71930075ad.87.2025.11.07.16.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 16:06:21 -0800 (PST)
Message-ID: <690e897d.170a0220.3b9532.0c02@mx.google.com>
X-Google-Original-Message-ID: <aQ6Je9ZrTdaudama@Cyndaquil.>
Date: Fri, 7 Nov 2025 16:06:19 -0800
From: Mitchell Levy <levymitchell0@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tyler Hicks <code@tyhicks.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/9] rust: cpumask: Add a `Cpumask` iterator
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-1-984b1470adcb@gmail.com>
 <aQ08d2NUVsIf5ukH@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ08d2NUVsIf5ukH@yury>

On Thu, Nov 06, 2025 at 07:25:27PM -0500, Yury Norov wrote:
> On Wed, Nov 05, 2025 at 03:01:13PM -0800, Mitchell Levy wrote:
> > Add an iterator for `Cpumask` making use of C's `cpumask_next`.
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > ---
> >  rust/helpers/cpumask.c |  5 +++++
> >  rust/kernel/cpumask.rs | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
> > index eb10598a0242..d95bfa111191 100644
> > --- a/rust/helpers/cpumask.c
> > +++ b/rust/helpers/cpumask.c
> > @@ -42,6 +42,11 @@ bool rust_helper_cpumask_full(struct cpumask *srcp)
> >  	return cpumask_full(srcp);
> >  }
> >  
> > +unsigned int rust_helper_cpumask_next(int n, struct cpumask *srcp)
> > +{
> > +	return cpumask_next(n, srcp);
> > +}
> > +
> >  unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
> >  {
> >  	return cpumask_weight(srcp);
> > diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> > index 3fcbff438670..b7401848f59e 100644
> > --- a/rust/kernel/cpumask.rs
> > +++ b/rust/kernel/cpumask.rs
> > @@ -6,7 +6,7 @@
> >  
> >  use crate::{
> >      alloc::{AllocError, Flags},
> > -    cpu::CpuId,
> > +    cpu::{self, CpuId},
> >      prelude::*,
> >      types::Opaque,
> >  };
> > @@ -161,6 +161,52 @@ pub fn copy(&self, dstp: &mut Self) {
> >      }
> >  }
> >  
> > +/// Iterator for a `Cpumask`.
> > +pub struct CpumaskIter<'a> {
> > +    mask: &'a Cpumask,
> > +    last: Option<u32>,
> 
> This is not the last, it's a current CPU.

Ah, I meant it in the sense of "the last cpuid we've seen", though now
that you point it out I agree the naming here is poor. Will correct to
`current`.

> > +}
> > +
> > +impl<'a> CpumaskIter<'a> {
> > +    /// Creates a new `CpumaskIter` for the given `Cpumask`.
> > +    fn new(mask: &'a Cpumask) -> CpumaskIter<'a> {
> > +        Self { mask, last: None }
> > +    }
> > +}
> > +
> > +impl<'a> Iterator for CpumaskIter<'a> {
> > +    type Item = CpuId;
> > +
> > +    fn next(&mut self) -> Option<Self::Item> {
> > +        // SAFETY: By the type invariant, `self.mask.as_raw` is a `struct cpumask *`.
> > +        let next = unsafe {
> > +            bindings::cpumask_next(
> > +                if let Some(last) = self.last {
> > +                    last.try_into().unwrap()
> > +                } else {
> > +                    -1
> > +                },
> > +                self.mask.as_raw(),
> > +            )
> > +        };
> > +
> > +        if next == cpu::nr_cpu_ids() {
> > +            None
> 
> Please:    if next >= cpu::nr_cpu_ids() {
>
> > +        } else {
> > +            self.last = Some(next);
> > +            // SAFETY: `cpumask_next` returns either `nr_cpu_ids` or a valid CPU ID.
> 
> Now that you've handled the no-found case in the previous block, the
> comment doesn't look correct. Can you either move it on top of the
> if-else, or just drop entirely?

Actually, now that I'm looking at this again, I think this whole if-else
thing should just be:
```
CpuId::from_u32(next)
```
which does exactly what we want here. I think this should address both
of your concerns, though please let me know if it doesn't.

Thanks,
Mitchell

> > +            unsafe { Some(CpuId::from_u32_unchecked(next)) }
> > +        }
> > +    }
> > +}
> > +
> > +impl Cpumask {
> > +    /// Returns an iterator over the set bits in the cpumask.
> > +    pub fn iter(&self) -> CpumaskIter<'_> {
> > +        CpumaskIter::new(self)
> > +    }
> > +}
> > +
> >  /// A CPU Mask pointer.
> >  ///
> >  /// Rust abstraction for the C `struct cpumask_var_t`.
> > 
> > -- 
> > 2.34.1
