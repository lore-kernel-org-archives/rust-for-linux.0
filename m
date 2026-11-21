Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285317;
	b=dnwuaYBn87JGWuxPZTm25KX/pH4xKY6LHJUfYTANZCFqGT6ovrzviniaqIbtS1Oa0twz
	 6EVdM70gg88zehTMo72PM8Wo9c3kJzxhXE6gXWQOPdr2nQWmXQsOWfqT4en6xjLsqumyN
	 jZ4izdgPypVoYwRcLX3tos17WrEa+hNQN677Ye7M349s5uAoUyIPLQTSzGd7tUhVAgaxg
	 Bd3Q/ZBpXeeigHWn8HSsFdxJJtyDsq1O1VIYU+ZsfbGDQubhrLYsRnmy9xUkDNT/LKsH9
	 jV+LFMP5KEFs+Lmb4w9t3Kd5LiCYq0VgYbHLPHB+S9D37hAl45oxfgTWKdZKBMGSaLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
	b=G6ejW/wpUpyGSx6nAUjvyPtV2LES3IPdG8F6UuBtPwaW+TcxsWS9C1aLrssk/ELl81AZ
	 FKeVIA3VgEagdvkOJtm8/TmasoMHFPjHtbXjclLIzJYO33f+abnUEjbfL+aScpOgcnYuK
	 y/QTWxALTjUySstICxXCDctFwXoyvCK74sudctwk66/HC4/btiflHDx+LTkub/x+HXl9E
	 p+kXKa94zT3IbAS4eH4jfS9oB25n2lXekJq4RS7v+Xx4/Tadmk1cHuT/VxJOrH+empU0s
	 i53AbMcqG30ORfBlubZd2lPBa9gIbwr6VsdeALT2k5ZeruTlgl4Sz+dkzb3SIXvbRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q23mP5na;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C606A32A
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 18:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F14C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q23mP5na
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9f6a16afcso28695ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285317; x=1795890117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
        b=Q23mP5naY7SLjkCGQ4gcAbtgpY3pMW5IyWDaUOZP7xTTodDQi1pqvK3NVmyWCxR1SM
         8R91R8gJcltKxvrPQWY5OM4d1GKy388lY3cu/3sWSOwPUbE1x5R14Ve4IaJNQLhmQ/pQ
         QHjLLZALLyszViDCKpWufAxoe3iyvN+wq1sy5ecikJUOPqu5Lw4jk3trRTRVQNRgxtgr
         hpfHKlDhxd9VuiZm/NF0Plc88NTTMXoBLJkpKBkupbmlqhefPkWLTwrC4OXWXaDUZ3xv
         GLmD3hHLUKoN6LLp5rPZlyYTnauTWuFkkRAVEsUz8Q1JXqPds8Lo+Biem31P+pbAelGH
         ez3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285317; x=1795890117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
        b=pclswsv3DxwXVkUZpe3Hyw5/tXDbdDwGmZIMINtGa7ehdr3Y1M6nMjVftowEVqzcXW
         mQZRZPV/7LmRjBbbtBAFuf7vNdyMF1BETgvlLXXBRAO5H7wnBICNTPeK2Ylmh2v/BL8b
         rsb5PNWn3Pw54PjePTpVzvU5cTuUf/BSpw/wmnI3Wih+nHt66alZY5SQAw9kwSJtHADc
         +TEmdSqjPHos1PklGxgaSTkJKOlZ2MZltuR/GsxAz3/liMi6M1oSmDeioufPJr1Vu5Bx
         3zDtDa+RfT3e1eowoKSpwLwWAd215wula/Q5dLV7rgfeL5CuQGgB+lWX2ippe2Wmj8ho
         LMHA==
X-Forwarded-Encrypted: i=1; AL+hErEzE/BPorx1kS06av3OEv52DjnlHZgaL3tEhWVET6DdABc99SXxrbdGMLkQOezBTi5hRYD2qMipS+idsNGpdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pxSsgoWlbIUgOCkMFoLreadidxwOVP0knIQCO8kEPWz+/hCy
	Hwf5U5sMJCd9zl5AXvMsakSHYbZJrk+UWC0wpVEopRWsIT3TnhQDQq6JAebK/Bn4tw==
X-Gm-Gg: AZFdTZeuK3+e19zfznw0mHFYYz10dPETYyDrBqMT/9WK6VbsBoFh/3hu5HW4yFm05tH
	vlnee/ALQlWWooNkvBntJOgV5sON6egjCVb4AUb3M4Riq4PnR/jruBSPx/yrLm3Ix1ToCAD0TWl
	iJYkZuZG2m0b1ROEZ+Ori/0lA3isyJ8i3YEkXNnE/eXikRDHZparNy3Z3Pa/Rg3IxESfWHCHF1y
	ZE2bpZTsrn48WBuZinrEyLvlrQmYYfkhRvXHWQYCwhWEByCwmgZJDwxYkgyaERftJZNKJn9dZrs
	FYDc5+l8pEG97uLO7YddpxKpsA8nzhs0moAiR4zhP9EcegMKNrpaHYTsgONVMe+t8GxNjY/G1/2
	/hah+ZOa0cYRsSFEKovhIp/K7SkYDiykltnOS0W6ucnVgFE3deLc47ulMweIuu7ZE7GWMfPShvE
	b5jS44EWe0tiCnhSzsYmjSdBNDQkgZ1BBizfK2hqHRfdBfUnFToOeKgPpzVj+vWx2FvDxUoSWz8
	LSupeaxkxyijCIZL+1+HNU2Dxr+/OrWrIxLgbjJu44x+s4+RlQx26PbVO+QFWllQIVwzz+uiDbY
	GhrxZ1e5oPqQBJ4SdO9pg66ZHpZu6H7E2eBlh8lWIcbqYMQl7Zy5yWfWlZ8FhydEyT9qQT4M3oZ
	1fEUZf7piTleMj216/4J47ItV7QhCvSL56Kr1yKeYsmxmLSE/VctkHnS7u3enN1nvdGDkLKUYh2
	X3yRrgdyH+Y25uQHeZeIwg0WyWBJadzqRRHiaQ7v3R48DHmpgW3jen7289RwumjJVaVt1S
X-Received: by 2002:a17:902:ce01:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2f06242aeb1mr3622715ad.1.1795285316100;
        Sat, 21 Nov 2026 10:21:56 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm28689835ad.43.2026.11.21.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:21:54 -0800 (PST)
Date: Sat, 21 Nov 2026 18:21:51 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: disallow binder fd transfers
Message-ID: <awHhP5chY30mzbK6@google.com>
References: <20261117231927.2200674-1-cmllamas@google.com>
 <20261118112933.477541-1-aliceryhl@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118112933.477541-1-aliceryhl@google.com>

On Wed, Nov 18, 2026 at 11:29:32AM +0000, Alice Ryhl wrote:
> On Tue, Nov 17, 2026 at 11:19:26PM +0000, Carlos Llamas wrote:
> > @@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
> >          buffer_offset: usize,
> >          close_on_free: bool,
> >      ) -> Result {
> > +        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
> > +        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
> > +        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
> > +            // Binder FD transfers are not allowed.
> > +            return Err(EINVAL);
> > +        }
> 
> We have moved to using atomic_load instead of a volatile read when the C side
> uses READ_ONCE. For example:
> 
> 	// SAFETY: `file` is valid, so `f_op` is valid and aligned, and any
> 	// concurrent writes are atomic under LKMM.
> 	let f_op = unsafe { atomic_load(&raw mut (*file.as_ptr()).f_op, Relaxed) };

I see, ok I'll switch to this for v2.

> 
> however the f_op field isn't read/modified with READ/WRITE_ONCE on the C
> side, so I think we can use a bare access.
> 
> 	let f_op = unsafe { (*file.as_ptr()).f_op };

We don't but there are other fd's in other drivers that do. This was
flagged by my local LLM review. It was in some tty driver and somewhere
else that override the f_ops. It seems pretty far-fetched that a false
rust_binder_fops would trigger from this, but at least it would protect
against KCSAN reports and similar. So probably best to keep it.

--
Carlos Llamas
