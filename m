Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF80372B2F
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509526; cv=none; b=Yy1P59ngfl17DbXHSbiqjsKSnhU3Zj2NbZE412Mx02KxfMxJD4VibD4RlEdKvZXwaZBFKuaUqvElfo6LFuFpDh9768BlbtHRr8dGDGRAEZlGjOs/wKMo1BgQ0Nd/lONhwcQJqUFnYdHSOTM4DJfKQEiVP+m7/FO9bJ2TcuM3gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509526; c=relaxed/simple;
	bh=0X/Tut+PCmYVXBISm/s/DOLgZ3lsP8fd6rCRzKxLZgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eih2/3NI2aTBEODuAeJ255kwV5b6uA5P9N5bAuwttnESWiL1PRHHw8lAz8RKPQqMPwIZxAYPma6JWWRw8GMuLAHRx7+VO/vviu5iX1emA2uE2W3TPUbawtrRY7tjxhK/g1DdRvZ9XLJJoFItMKdkQGsLFZBmR3UKpRrbw2G0wfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuoX26LC; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuoX26LC"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cced8309bso6890715e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Sep 2026 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788509523; x=1789114323; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFnUo+AtVpzkpyFiAWg/HyWe5ZIGvWPPvvCoWLM5rC8=;
        b=LuoX26LCeWzfZxdVNz3pq222Ezy0JDEu2Rpo1RCIVV6cO9mFdfY/SwWkHmLZQNJsUi
         yCl4fTXy5jLyIyeo8kqjETP1hOe9VunTFW0Ia447tPrtjX++0yWfvAPqnTMquSRlAib+
         rl1HGDJZF6a7cbWB9XF39o2lkU/C0PACq+bPKRoJkw9h/Xv54kitAztSwRQSriJWvtvD
         MdsYRbYpYFllOpMYx9BtsYb8mGC1hq9Z3OusOX/gWj6J74XQUy3zyFumVYgcdSjWdKEi
         Rke1/96KCSIyqzkL+fRUNxmYFngngzL3Lj/02e59zKvio03liVBcEEov3SaTV8jmXtPm
         E6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509523; x=1789114323;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFnUo+AtVpzkpyFiAWg/HyWe5ZIGvWPPvvCoWLM5rC8=;
        b=M1x5/zy28eUWUOh+uMJNpqxca6tqYFrdEy7nYQRkjKLrW9um03kHDGRSWjLql2KTeJ
         /E0Vm8Jp4ZpeonG/FSnTVt5GpNjT2GcPhm7Uh7AH2dDc2Q1A9lgLhR26YLD0ef0dnW3m
         fIbrS1CrkRxfQPJjdsbAgSTi71NYCnRMnL0HGwNwl5uTKY2Skn0XgSlUS8R7b9KYgHTJ
         9vLC6WOgApdQNwbiGhBSF+rjUzlsJuxcgwTs63e7kL3fsVGlhHyO7jq+sc8/HwwjDKWX
         6rTr/9MfMtrFwt4kIZWttulfk2wsXkyI+xBeax2uuqFEPLovgVNjkBkQYTTxPVNplMod
         bCJg==
X-Gm-Message-State: AFuF++msUyq0cgpYmZ7R4ldTvjSWGmtDVHY8MZJUG3qVS18rN6eCkQxd
	OjIyVA3qGI+NXAvRuVUHT9jZup0i8JYmZXwE6jNI8kRA42C4a2UASvgr0wswoG17qzRaVk5pYDc
	tUcLwv0YU37Xt6I+Pvw==
X-Received: from wmdd13.prod.google.com ([2002:a05:600c:a20d:b0:495:6261:8954])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr32870345e9.10.1788509522868;
 Fri, 04 Sep 2026 01:12:02 -0700 (PDT)
Date: Fri, 4 Sep 2026 08:12:01 +0000
In-Reply-To: <DL5Q2PYH8I9M.1H9OOPTEWGRVO@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814215145.2050599-1-rafael@rcpassos.me> <DL5Q2PYH8I9M.1H9OOPTEWGRVO@rcpassos.me>
Message-ID: <app9UXF4emMiJTD2@google.com>
Subject: Re: [PATCH v3] rust_binder: speed up get_node_debug_info using
 lower_bound iter
From: Alice Ryhl <aliceryhl@google.com>
To: Rafael Passos <rafael@rcpassos.me>
Cc: rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org, 
	arve@android.com, tkjos@android.com, Christian Brauner <brauner@kernel.org>, 
	cmllamas@google.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Brigham Campbell <me@brighamcampbell.com>, Jori Koolstra <jkoolstra@xs4all.nl>
Content-Type: text/plain; charset="utf-8"

On Thu, Sep 03, 2026 at 10:40:39AM -0300, Rafael Passos wrote:
> Hi!
> 
> I'm looking for feedback in this patch.
> I believe this is a good time,
> since the merge window was just closed.
> Maybe this could be ready for 7.4 ?

You already have my Reviewed-by and it looks like this still applies
cleanly, I believe Greg will pick it up at some point during this cycle.
Thanks.

Alice
