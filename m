Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90A2F8E8F
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508925; cv=none; b=Q2k46aFjQCH8tOJnx130HW88CLj3/Wd3Mxx/AGCkd0fRMpPlQa/XIUhTHqEgm6fKDqW820aL8aqPALriIL0upTPpjch48FLiGtyhmyJrKUosdnsHtmX3dSaagF+TK3K+uM8O5hdQiMFm1EgH4SOuSkPHNScCf9XtlmwFheasDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508925; c=relaxed/simple;
	bh=/giPkOM8S749gAdpJ+SHhYNMnuvXU63VwSMR0eGe8mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndp5yeqb7Yht/H7eS0uYgqt1EDapE417qhbpw67qcgtKNkRalaM+cg88IlvPnTxowyoEeBDFrqHMylwBQxuPQgy/TBMdCfgJUQyND0b0+rjIhLtE9Mqi8H5xWNRciNQLMQCtZEZY7lhH9iZLHDq+pTs38s/RtP0HggvMHXU0rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neyRZ/K8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neyRZ/K8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so22546405e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Oct 2026 18:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508922; x=1792113722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=neyRZ/K8F/csSLhtW6yuUUN1gWUdJjjW67ve13ma/j7gsK16yYdjZjM9xlroasCGU7
         7OzAD4TQ9mauM28tTxHor2CNpbDaRR1eN2jSDP+cVueboMKlrR0vBjR/PkWo1NCMvugR
         sYAbomRpGTBmNDVOx1hzcZbjHHe6J7DySlzvU6Pyl7yd63IihXNKmz4Hq48HKs4y5AaO
         w9VqOfSIBLIZLfFFdiN4/g4/POnxfAGQ/JnzyShixVprclONKPPcAYjkMnem6DfWC5No
         sq+a105hGng8+2C9c9BaPe4/Z6bDYSYsYJ6QbHJFTJ9M2CmW8if15DKamZcffJAApn8j
         c+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508922; x=1792113722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=KeflevHYrf2UNUSYbTT2jKSyREBb1NhGt2CzYd6ofxvCiu9KTsxaImVo6yQkKwHL5N
         EVAbpfY1ryb7TzrMFX7wfJw/4GhNpWaW7oDMbzUVCj/U/ktVy/VTVlQCCkdy9KehRgV/
         4OAX2xFKp5cRr80RbvIjV0TSsboIQwVgY8ID5MwQee+EFR2MpJ2l6ajk8Xhj5lMO3A9Z
         dA8FvZxaYRBb24x6ckXS8BZ4KOb33HeysjdJUW+xtAesSjRlQO3TXfFfvb0FwJ0o0Gku
         mTtDnTQMIx4xxFw7Hp+oIs9wG31XVJ+2JtYFfN2memn+XJ/nGB9szedsH49ZZZNKVBxP
         guRw==
X-Forwarded-Encrypted: i=1; AKwUvBwAlx6MB0U0KGd0jdel9hFJut9JXNjB/kuUGd57jfBb+j2S6/AoWJP93z8ub08MfT7VS3aBIeHhrgHRNZaJwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mLTQbFzh6VH2hekBZ02HURTAzhO4M+J0RqG15DATb1iR4FpnO2
	vIyKuuceT7vvkjH/adCxhkc4MfDuIO2EFPplYPmKBFLg0BpeFulSo8P/
X-Gm-Gg: AYBFou0s4+No9nFe7i6sei2QFlIJe3fwDCa+LxcOojOS1XwoQ5BR47WbfwC229A95ye
	m4/EAJE9PS1ISvQ1xAA8CLdgvnx7naDJRBH6TzIchrbz/o+BXjMvjuTlXfgd+NQRiJvFmzUNKGU
	r6zWH0rRaQKw8njuSI6FsFYTE2QSMtPfrcO/hH6CvoEp+eLOf19mOTWEqg9crOBqJIwNkARtv6n
	ocaqPwNnID/62tiKcK8KLdPz5iRENut9jxoHyFQnokdPc3xwFNqfsDEvBMUicN+e4T6sFBq/Qby
	K9nont91INsOXUsKkq2oUlHFSt2hx7jv3ZhZ6tjMLi3IFjfJy5KM5clouKsg0k5axgdoNY/eC8T
	02GCBLGlYWFZ4GfW1LNlKN9PxMRe5iOv3i83ohvG882xHwwlyCMbkG/iAKccVqun0Vhu7R32TdF
	+rKswOufki5iYksXDhQK4hdb51HJ93Ktcr3V6TtxFInju9BS8iDQPCexHHpI2hAEt2WSHh/ofAI
	tWzSuW94t7y1NGLSLugUUmqmqa8hBtQv3/PEWAtQ/dI0m+AzBTGDOasKLLRRXRe0bPXzJlVuM5B
	LI9MG6OLbyvV8TrvmYXBGeKpfSamiMaHKZb68zBBmTNReBrmE4zipalusZPoj6rju6QOyatDbAM
	ELcMVinA/9HpvL1eI+vNzoBhWDdBftK9A
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr3757845e9.7.1791508922467;
        Thu, 08 Oct 2026 18:22:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm1207925e9.2.2026.10.08.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:22:01 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:21:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Message-ID: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>

On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
> > +=============  ================  ======================================================
> >  Architecture   Level of support  Constraints
> > -=============  ================  ==============================================
> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> > +=============  ================  ======================================================
> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> 
> Can we say "ARMv4T or above" or something similar?
> 

Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
alone would cover too much. It could be

  ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.

That is longer than the list. I can change it if there is a preference
for this form.

Thanks,
Karl
