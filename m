Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10D221553
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939707; cv=none; b=iHrQZFZVqCMWafQDiICadO8c+6rKURI7prVkzONKw00baywBiEGJiddpTGUwuXVg3tMQ40Rq3Islry8QksHsYYbqZ3UdlWDvS+t47f6UkwPI6oA4V40mLtJHumw3FsQGQ64iJCHatvnl4UfSFlA0bdCUuSWPVzSkf0aTnLyh6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939707; c=relaxed/simple;
	bh=dxm1FrsGgVlgCCLy0I4UJE6TNbX3UhsbJHvGbXkPNP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XBhP3qf42EGdT7O75wssUb06cWQM4xEOGpV3BEUaE9VKBamFecrLVrGd3GCf5hAQJTEysmwvIWReHn+Ip95r/qmlBh4K/7shF2amaQSUgkQpJ/TDu/wokeQBOwxvlRNMYJoZt7kW3TM1I82F32apCSZrck0+Yv0pVxODunzUmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w7xNdG8K; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w7xNdG8K"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so28557805e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745939704; x=1746544504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sHfLJ7igAkbrZ0VODeWyutAbR2LaZATT/RXEe3Pu998=;
        b=w7xNdG8Kuo7rjdYhuS8IeATeFxuynpMS1YXALetANLLRfcketgjzGp8H6W888KIDwt
         nmZIjrhc0O8SqudLsFaHa5e7phlDdpBjD7XrzWpF2t9hbuAXrLXwNoMKVzpS+AVVlxti
         aKfmDQUjYCWVWHmRu92/s1ZnKsFuQp4R7tPvIpX/nYl1JwIwM38L1wNv3WuhzUtxlrqA
         tBpH0NBbL3LTUSWKZvTtwHa1ySqWyoHRUWUlA3pZFAfpXC+RducRmd1pTg9RfV9T4NEt
         Ko5v15r/C56l+bERXnWfel/j2MDjbY8tMRs7cnWN4fEIQWzf/3dT54ndX7XO59HbLe6Y
         c6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939704; x=1746544504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHfLJ7igAkbrZ0VODeWyutAbR2LaZATT/RXEe3Pu998=;
        b=npMuNqA1p1iGreJhTOr5f6TDfZTswcuKw2wWzWfIInb3i/7VuiIBTX9f+ZuQEbnJ7/
         y+2PJql9M7t4zNHu6VDpttWovrRL+aiOQd9H4pplM2iJnVCYVftYX22DESWxZVxQ58Eq
         +/Jmr2JWgDn2yl+05M7/v/49iUUKu1Mg4IRzPHTg1kuz6fpCKKdHwoQlk/+vYu4DtVKi
         oqm4gbcDn6w/0CDxbQTZFwroGzMAU53IHvAICRCMf6EEQAOPvIEov8Z+R0G1Sg2Mtcrl
         gjPEp20bSLVoqpNeREu7IjtSUkTpePtX2rygKLB0hxWEqWYL+MezmRzRUkJoFRuA7hoE
         UFGw==
X-Forwarded-Encrypted: i=1; AJvYcCUiqyU55Ekyp4ZS/5O8VI0K7IdUG130yLwNDeYguETAbXWs0HTcrdnaRt7+Se8cFYvw+CDwzdXaBvBcTq7ZYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vCDWfl1Ee2Ww8PVCJAfCN2qhaB+e163axW0UtKNyKlIbTNR/
	Gy30ZUphtn1etvk10uhJvZvAFGMRXopzqU1OvvdZ8mrQ+q/an/blH8rDXC//ia4NdEnK4CTwAOi
	2UsCT25i57mDyjw==
X-Google-Smtp-Source: AGHT+IGxOCFCik8aNb38CvI8deht3xDhuNeNmMopB2k9LMWwBUjROgjf7yKI30OtFVYebpDz75VrLlr4INjPSV4=
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:43c:f6b3:fa10])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3585:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-440ab7be061mr114041135e9.13.1745939703803;
 Tue, 29 Apr 2025 08:15:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:15:01 +0000
In-Reply-To: <2025042946-accustom-bankroll-d934@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com> <2025042919-varsity-registrar-fb45@gregkh>
 <4b54a2385923b1312606dbb5b651e163@dakr.org> <2025042946-accustom-bankroll-d934@gregkh>
Message-ID: <aBDs9aMQSCLIqD96@google.com>
Subject: Re: [PATCH v2 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <kernel@dakr.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 29, 2025 at 01:48:19PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 01:38:26PM +0200, Danilo Krummrich wrote:
> > On 2025-04-29 13:09, Greg Kroah-Hartman wrote:
> > > On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > > > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > > > +        if len < dst.len() {
> > > > +            // Add one to include the NUL-terminator.
> > > > +            len += 1;
> > > > +        } else if len < buf.len() {
> > > > +            // We hit the `self.length` limit before `buf.len()`.
> > > > +            return Err(EFAULT);
> > > 
> > > How can this happen?
> > 
> > See my reply here (if I did not get it wrong):
> > 
> > https://lore.kernel.org/rust-for-linux/aBCrqJe4two4I45G@pollux/
> 
> Ah, I should have read ahead :)
> 
> I agree, some comments here would be good.  We want everyone to be able
> to easily read and understand this code, off-by-one errors are rough.

I will add this comment:

if len < dst.len() {
    // Add one to include the NUL-terminator.
    len += 1;
} else if len < buf.len() {
    // This implies that len == dst.len() < buf.len().
    //
    // This means that we could not fill the entire buffer, but we had
    // to stop reading because we hit the `self.length` limit of this
    // `UserSliceReader`. Since we did not fill the buffer, we treat
    // this case as if we tried to read past the `self.length` limit and
    // received a page fault, which is consistent with other
    // `UserSliceReader` methods that also return page faults when you
    // exceed `self.length`.
    return Err(EFAULT);

Alice
