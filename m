Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBA146A66
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762910339; cv=none; b=K/lMJiGuY76yHkt+usH78Tc0jcvFCbFAiXhgUEVhpH1GWrFxN4xPuqStq/2xwhfapO4oGfQVL0mCcy5GMY1DrhWW5E2Vrt80AGRTo94otORAI3wjLqIi3sBEsX01ejHLCkALP8g3nt2hh+MAUUVtm8dpB88sezOIz7atfT49gfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762910339; c=relaxed/simple;
	bh=U1772FxmfKtfi8ZqQg2o+fPsIvselX/DTiCfSdK9rhM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kUo7+MktchlHew/ju8uLi9hoDu3poAboC6PFeVrbZ7gbHpKCnh9I+B2htzVeP1YhTvd8+y7YmLuc8iZhAy8jsbBNjhn7NyWY1PttGgRMgsuggFlKrMQJ0B/LHLMzWE2k788gZe8GZbnK7mRbPzCWVMffESyQGnXniTquNQNAvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPzLfVIu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPzLfVIu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297f35be2ffso3169655ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 17:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762910337; x=1763515137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8GZM40tCNlvxK86P6UmcRlYcg37WH6CSmgvpcE4YOU=;
        b=lPzLfVIuS4IYZde60QWeqv3QRO5AY2ah1RHF8kEP/xOsaAKDeLOoYuCAfRTxEM/eop
         jm9N0ZJbeMIpYPWuMKJNWJ+U92eA+W2Y7k2lHRWE30qZcpvdk/ijS1U5PRr9s5NS7zCQ
         VEhmqw2uGme2xoY6WoFFVtTGl/rCvF+m2zb9rQDNPNDrYnnfYvvCKrD4gWprT2mweg7p
         H0i5UK4dkimbVH2VCYkrzxVpAsAxyZTlvOoI3p+irsRe0Hy7aOVt044nCCS/vnpsIaA5
         jkZ6IXVvtpGFl4Fe7zj6vKdNOIkZAXGZUcIreRK7TDa/VLA4RALKj9Z1TqlXJ3MrSnad
         er9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762910337; x=1763515137;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8GZM40tCNlvxK86P6UmcRlYcg37WH6CSmgvpcE4YOU=;
        b=LurHt2WsO3Ww/HBlD/JLmHTirWkDvZ6bbEKxDYrH1/XcuW6HmkrquuR3aghPLsQIDU
         cdO59qLpTpeg3DTaxfOa8a9hzdF+Z9JG8SZy6aG+RKyY0XJIhEZq2wlitxuKY2hCcRbU
         LjXCVUKtvmV9uR2D39a2zxZt8qKVwBv/U4ZEIbGn49dXo5AgueVxRFDwEXxIypoTmaWK
         iYZBZ9Je2hvvORePHOe8xF/kISbBnboR+zDOH3+z8HGSe8N0j8qHCs0+a11f/aq18hm7
         REYCzLRfGyyRhVIlkjs0Z3uOLy5SyY13a2v/YXxplpv78huskGOfe9oqxLppNqn+eFRw
         gQLw==
X-Forwarded-Encrypted: i=1; AJvYcCVrkznTFgmczU0Jj4tqP2sQDfcyuiblIdIOJmQ0F+G6fqLPlASVoV05qbUpzKCRlOqRWv+tRqTScSAzXzSMZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywnay/4lGGe0DRmu0oxP+9FJlQXOo23GBSAkUv2pz8/QwlRa1x
	TkKr/QmGTA6/PoSDW/ua2hDAC4hCDlybRtsa8oVPtVIdcdo95hFnydmc
X-Gm-Gg: ASbGnctA7h0576PEJoN2duW9cNl0fxKcGPkoQREfN0CNFAUbJ0wB4YlLa1ougpqlSEf
	xLYhNSutwWvl8Cy3vvYkWPFtf65xXVbZpmXhfLP/w3L4yhiA+HlOZGaeOEzd1bhcmua4QOck6Q5
	ho/iQ0+DnU0Yf5c2nCHxwDlINRG0q/7zc65kTvJz8e7goKomi9I9R9GfZ+VCQWmF8vLjV3zYOEO
	mDeOwLd8jLa6S5S44m67HWz1YEEQ8TDqkwFhuDU5dNvSnwuB3X4iaLgj55Mx6dFzsL8Kux7si4Q
	gpx9DQyr1h0fv5ZlSDZe8ql0oc1VsLqWCFIXBiHMb17/vahIH0IR1I+5FJh6L//BDv+hy7Mtagw
	JHyJE6a91YfGtF9kGH+ZlDZ3KDMTX8pSbmxuXRzCInjbxsTo6AguyrLh6G28aMCpsV+Sqwk9boU
	QCi6t81Ch8x2rLHyv6UxwK69+cgwu1Pg143/YAgjYSytgjOA7nXHJd1A==
X-Google-Smtp-Source: AGHT+IGipYF4mZDov8GT071nlORrkJZTprlrf5t82OgbpYKAr7dhD2v2X/DdsLeHYnlBP2jjCg32qA==
X-Received: by 2002:a17:903:244a:b0:290:c0ed:de42 with SMTP id d9443c01a7336-2984edc95d0mr16844625ad.36.1762910337057;
        Tue, 11 Nov 2025 17:18:57 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca024dsm10539015ad.72.2025.11.11.17.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:18:56 -0800 (PST)
Date: Wed, 12 Nov 2025 10:18:53 +0900 (JST)
Message-Id: <20251112.101853.1558870636834355421.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org, ojeda@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRPdGg01VDJucAfS@tardis.local>
References: <87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
	<20251112.094508.554651669948369724.fujita.tomonori@gmail.com>
	<aRPdGg01VDJucAfS@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 17:04:26 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Wed, Nov 12, 2025 at 09:45:08AM +0900, FUJITA Tomonori wrote:
>> On Tue, 11 Nov 2025 10:02:46 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> 
>> > Boqun Feng <boqun.feng@gmail.com> writes:
>> > 
>> >> On Mon, Nov 10, 2025 at 01:16:44PM +0100, Andreas Hindborg wrote:
>> >>> Boqun Feng <boqun.feng@gmail.com> writes:
>> >>> 
>> >>> > On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
>> >>> >> On Wed, 05 Nov 2025 21:59:06 +0100
>> >>> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> >>> >> 
>> >>> >> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>> >>> >> > 
>> >>> >> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> >>> >> >> pr_*_once macros.
>> >>> >> >>
>> >>> >> >> A proposal for this feature was made in the past [1], but it didn't
>> >>> >> >> reach consensus on the implementation and wasn't merged. After reading
>> >>> >> >> the previous discussions, I implemented it using a different approach.
>> >>> >> >>
>> >>> >> >> In the previous proposal, a structure equivalent to std::sync::Once
>> >>> >> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> >>> >> >> to provide Once-like semantics by using two atomic values. As pointed
>> >>> >> >> out in the previous review comments, I think this approach tries to
>> >>> >> >> provide more functionality than needed, making it unnecessarily
>> >>> >> >> complex. Also, because data structures in the .data..once section can
>> >>> >> >> be cleared at any time (via debugfs clear_warn_once), an
>> >>> >> >> implementation using two atomics wouldn't work correctly.
>> >>> >> >>
>> >>> >> >> Therefore, I decided to drop the idea of emulating Once and took a
>> >>> >> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>> >>> >> >> variable. While it would be possible to implement the feature entirely
>> >>> >> >> as a Rust macro, the functionality that can be implemented as regular
>> >>> >> >> functions has been extracted and implemented as the OnceLite struct
>> >>> >> >> for better code readability.
>> >>> >> >>
>> >>> >> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>> >>> >> > 
>> >>> >> > Please consider if it makes sense to base this on `SetOnce`. It is in
>> >>> >> > linux-next now, but was on list here [1].
>> >>> >> 
>> >>> >> Data placed in the .data..once section can be zero-cleared when a user
>> >>> >> writes to debugfs clear_warn_once. In that case, would such data still
>> >>> >> be considered a valid SetOnce value?
>> >>> >> 
>> >>> >
>> >>> > It's still a valid value I believe. In term of data races, Rust and C
>> >>> > have no difference, so if writing to debugfs could cause issues in Rust,
>> >>> > it would cause issues in C as well.
>> >>> 
>> >>> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
>> >>> asynchronously modifying the state atomic variable. It requires
>> >>> exclusive access while writing the contained value.
>> >>> 
>> >>
>> >> I mean if we were to use `SetOnce` in pr_*_once(), we should just use
>> >> `SetOnce<()>`, and the problem you mentioned doesn't exist in this case.
>> > 
>> > At the very least it would break the type invariants and assumptions of
>> > the `SetOnce` type. There a race condition between `SetOnce::as_ref` and
>> > `SetOnce::populate`. I don't think we are allowed to race like this,
>> > even if the type is `()`?
>> > 
>> > At any rate if we do this, we should update the safety invariant of
>> > `SetOnce` to state that it is valid to revert the type back to the
>> > initial state for zero sized types that do not have a `Drop`
>> > implementation.
>> 
>> I agree. I think that even if the type is (), a race condition would
>> still occur if the init member were reset to zero using non-atomic
>> operations. For instance, the as_ref() method effectively checks
> 
> I already explained this, the debugfs writes have to be treated as
> per-byte atomic, otherwise it's data race, using "non-atomic" to
> reference that won't be accurate.

Suppose the init member of SetOnce is set to 2 and then reset to 0 via
debugfs. In that case, if two threads execute the as_ref() method at
the same time, is it guaranteed that they will both see the same
value?
