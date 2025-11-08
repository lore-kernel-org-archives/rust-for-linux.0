Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AC31BCA1C
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 03:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762573160; cv=none; b=Zt/77MJVw/RlZw1CumX3Bi0NSDv9CyjrfxSFlZC/DQt5j9KTHHIa2hZ/fJHcWZzP9QlvUx7w6E/JyhLMEhdBogpMtnqlm1iT4lM+0f9D9ZGHvObaKgeKXLu0IHxvPoSLy5XDrufK8b6JL5dwFdlTbFxHnqYF54HYY5Gcz0SvCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762573160; c=relaxed/simple;
	bh=cpeEB2eQdwz7J5BbckHZI1v/gGhFt+B61YZabTTCLg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrT8ULLuHhh10G0EeHaRKXNB6p/O+hpYpM/GRAGeBzG6x6TFn9hgnvpQ6H3pf/q/ofakhOwHePe39EYUAT3Tdd1gWZjL5uMxKtgNKrykaaRGZyTkm7dDOZjmGQZ7NIGq36yZwBg7pIVMD9ik4v3s6UgvedAI/g+Mqfykt+JsEG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWOkEe2o; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWOkEe2o"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7866c61a9bbso13047037b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 19:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762573158; x=1763177958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9h3FkFllvRL301ULuxgOtHl5uOTbxkQC4ivgx2/U0MM=;
        b=nWOkEe2ospG7Rv/zG/fRu8tNZAWZsxnM0+Ieup0kx5Nt7EkqamLrHbti2jXOPeTxtT
         6oYeQ18+k+a+qzzpSuFXD0AZd8Bbc65F69k1OJyVo7j28KSbMV8KoHe7dtqd89W8Pfk9
         5nGu1EaAiWhuDRKQGjpZB3MZaIJ5LL1okI9An8KX9qBFTgTNcuaNvFwK+vs4Yb5noV8M
         Dck9AWrlI+nGYczEWDW7zRzB5no8bIlUkFy1EgSho0dkwmdEf61BiZdVVjIMbotImxsB
         ditqlcobzOCkIzjAOLlfr1oiX6bUCkqmUYeNuqqZclPfnP4iu47GGZ/EHoWPXTeHQzsS
         ZedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762573158; x=1763177958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9h3FkFllvRL301ULuxgOtHl5uOTbxkQC4ivgx2/U0MM=;
        b=am6/1QvSwAn7rIOx/c+RbY6oLMsveCGYUEhFhoqsJ+AScvD9FaQ1ueqGXfn3WAB9LQ
         RdJpUA27BLKqHLQkLk1li2Le75NtAsoDPGAI8sZtKISMqE/opf5paEiU9MNHI/ufp0sE
         UoZDKyVoBozAKaAPc4LsU77AKs9h9NETlhWbh1aUPZXBAwSB0peHU84K8HfZercgO2Ls
         0ZYmbk/hs9tyXmL2ObI0ZAroERRGS2uacJE5IcLpbLHDyLo/b3nivCJ6clT9WeYHpSBZ
         ZkXr7NDIdpIjvRnBJzZ341R3tjibbz+AbttSRdUYv2/Ux4EmWX3tUkSxJHrnb32wo1Xq
         G+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjyiguSpwS+dMxqjBs4ltOVgWkFKQUHIEd46/SJtYjIfxKvyA1I9ahM1JN4bFqz+Fhdhjd1bZsuqjz99+h0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1cqhy4OoVUyFgRaxJXyzxbEuoR2883VhvshgkYty1YQQN0MbH
	3KWKBb7tFcX+luKrOiWwPzLzokryS3BVWNxSPz3HEIauWzkQZVjin2x1
X-Gm-Gg: ASbGncuAwKYG7bAhGdyN92sK24xwcXEqjPPiyzFjBRVjef+6Xbl5u9dEhYoV6y5pjax
	JMlHvMPOU4raduyPKrPo7MQevZLJy88sp2Tln4+FI7eFX1/7tyrMB6FraTk1buB4j2PmNlcVYmA
	QxM4uIyNHw7XWAihIqs+0rJNT3C6WA3I4n/4/WBlzfOKuymzStCOIwSSn8ZeiiN2LK/Nrr1rl+g
	mYwit/sQNllKe53FQCNFqhSGD35c8zdHYn8BBjEdmSxi7YGtrEo2R1p40ePc4FNZK1B4SdzBgdb
	sVvi6WBrD467WVDaPty5UuKL1lf2JknxxvR/okzVTLzWFW04KaWmVz8cV1gZ9y89SgCMqT9ajh5
	Kq4EI6Jz585icuBcKeuqgey1jKsFmz0TfVy/AOIcp4DL6wUQYezZZgqZS9AlEnwnGDtgQRAwedD
	aa9Ae36VfZIaEqzGKv5y7kE1Bg41RaY42qPzE634BZRmo=
X-Google-Smtp-Source: AGHT+IFYVT1fUkHV6VJLT6N7hlDvCT+tD4Kfn+cnUafAF1yf5tELB6GAdHtxmqPcstSWjWMEWAfufA==
X-Received: by 2002:a05:690c:6e0e:b0:781:4b2d:7261 with SMTP id 00721157ae682-787d54156c4mr14832407b3.41.1762573158025;
        Fri, 07 Nov 2025 19:39:18 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d6a2947asm3452237b3.55.2025.11.07.19.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 19:39:17 -0800 (PST)
Date: Fri, 7 Nov 2025 22:39:16 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Mitchell Levy <levymitchell0@gmail.com>
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
Message-ID: <aQ67ZC__zN6yt7Ln@yury>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-1-984b1470adcb@gmail.com>
 <aQ08d2NUVsIf5ukH@yury>
 <690e897d.170a0220.3b9532.0c02@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690e897d.170a0220.3b9532.0c02@mx.google.com>

On Fri, Nov 07, 2025 at 04:06:19PM -0800, Mitchell Levy wrote:
> On Thu, Nov 06, 2025 at 07:25:27PM -0500, Yury Norov wrote:
> > On Wed, Nov 05, 2025 at 03:01:13PM -0800, Mitchell Levy wrote:
> > > Add an iterator for `Cpumask` making use of C's `cpumask_next`.
> > > 
> > > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > > ---
> > >  rust/helpers/cpumask.c |  5 +++++
> > >  rust/kernel/cpumask.rs | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 52 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
> > > index eb10598a0242..d95bfa111191 100644
> > > --- a/rust/helpers/cpumask.c
> > > +++ b/rust/helpers/cpumask.c
> > > @@ -42,6 +42,11 @@ bool rust_helper_cpumask_full(struct cpumask *srcp)
> > >  	return cpumask_full(srcp);
> > >  }
> > >  
> > > +unsigned int rust_helper_cpumask_next(int n, struct cpumask *srcp)
> > > +{
> > > +	return cpumask_next(n, srcp);
> > > +}
> > > +
> > >  unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
> > >  {
> > >  	return cpumask_weight(srcp);
> > > diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> > > index 3fcbff438670..b7401848f59e 100644
> > > --- a/rust/kernel/cpumask.rs
> > > +++ b/rust/kernel/cpumask.rs
> > > @@ -6,7 +6,7 @@
> > >  
> > >  use crate::{
> > >      alloc::{AllocError, Flags},
> > > -    cpu::CpuId,
> > > +    cpu::{self, CpuId},
> > >      prelude::*,
> > >      types::Opaque,
> > >  };
> > > @@ -161,6 +161,52 @@ pub fn copy(&self, dstp: &mut Self) {
> > >      }
> > >  }
> > >  
> > > +/// Iterator for a `Cpumask`.
> > > +pub struct CpumaskIter<'a> {
> > > +    mask: &'a Cpumask,
> > > +    last: Option<u32>,
> > 
> > This is not the last, it's a current CPU.
> 
> Ah, I meant it in the sense of "the last cpuid we've seen", though now
> that you point it out I agree the naming here is poor. Will correct to
> `current`.
> 
> > > +}
> > > +
> > > +impl<'a> CpumaskIter<'a> {
> > > +    /// Creates a new `CpumaskIter` for the given `Cpumask`.
> > > +    fn new(mask: &'a Cpumask) -> CpumaskIter<'a> {
> > > +        Self { mask, last: None }
> > > +    }
> > > +}
> > > +
> > > +impl<'a> Iterator for CpumaskIter<'a> {
> > > +    type Item = CpuId;
> > > +
> > > +    fn next(&mut self) -> Option<Self::Item> {
> > > +        // SAFETY: By the type invariant, `self.mask.as_raw` is a `struct cpumask *`.
> > > +        let next = unsafe {
> > > +            bindings::cpumask_next(
> > > +                if let Some(last) = self.last {
> > > +                    last.try_into().unwrap()
> > > +                } else {
> > > +                    -1
> > > +                },
> > > +                self.mask.as_raw(),
> > > +            )
> > > +        };
> > > +
> > > +        if next == cpu::nr_cpu_ids() {
> > > +            None
> > 
> > Please:    if next >= cpu::nr_cpu_ids() {
> >
> > > +        } else {
> > > +            self.last = Some(next);
> > > +            // SAFETY: `cpumask_next` returns either `nr_cpu_ids` or a valid CPU ID.
> > 
> > Now that you've handled the no-found case in the previous block, the
> > comment doesn't look correct. Can you either move it on top of the
> > if-else, or just drop entirely?
> 
> Actually, now that I'm looking at this again, I think this whole if-else
> thing should just be:
> ```
> CpuId::from_u32(next)
> ```
> which does exactly what we want here. I think this should address both
> of your concerns, though please let me know if it doesn't.

Looks like that. 
