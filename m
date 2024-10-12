Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F517BA5
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728721113; cv=none; b=IoGpOuaqtzpWfTEV6Mi24k4HpiSktD+3GdZ19N+eYPU9v+fGWn6r2xVC5JlEJZiTStLm2zP8XNorqTre14MbGtNbQUhULvm0kNDusvOUzBakTqIxPFzp0Mkj8Bdir+PYZCbsYlKP8qaOSSrhrMBtSYWQco1qqA2yHiB0iM3QYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728721113; c=relaxed/simple;
	bh=0TZe8Z8yFuMZExlzKj1uBCNbbHzWLZT1AzqVuaD3eIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPs2zApLg/Zd5xtPLCzaegqgMRUHHmFw/JUAUZM74rV9NaBGF00O1GoSYA9KBqWQi4/8THcVRyP13X3xGrKHN7GuoD+jfdPWJFSGn/ySr+JYPv++ZvccaIzNsnDCVmicKdhV4+OgdmTagF+wnQ+ykSP5Fp3JodYV5GNqZ4tEXkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDSeG+xa; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDSeG+xa"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbe9e8bbb1so16236266d6.1
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728721111; x=1729325911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Fr2bxYJHMZsmRtij+XRyysynulppG71uDCBM8to6I=;
        b=cDSeG+xaTOLE2NgKnZstXK7v8qSvDuGgWz/6NTdgMUysMYC4HxCaEvW8h/xBmIJkbY
         EuSuSL3WcQBAZcWC/+cDx058MBDLFl2ixHzA6pzqsEKY8yziPiGFwoYIiw1G+d4n4uti
         bTeL++4bMmUtZ40/8BF1PPbgrc7BwzhWbpiBBpnjcmMqM7KdgoVZGkmQYTR5zsDnStRo
         qA+w1KICTaCLrQiFbDZCS/kr6j+AzsOcrDg7JwYwhk61i5fLs+L9edffIB2mfDh1ktg8
         SeWdL1U66cgLAnDnqWMIwfCb+AIbKMidWGh8sbDtm6407Ow9fY0wWIsLKHvYxGwHEK3H
         N3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728721111; x=1729325911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9Fr2bxYJHMZsmRtij+XRyysynulppG71uDCBM8to6I=;
        b=Gi7zA30nPImxKWHOIxUi3nExzBRZjo/8bk54I+yjeI6ecHrJqb3eid+HDZs2N+mh+L
         aMoxaaUitlBzsLAj81UzXFWcGNOyWwy/0EG7Mb3bePPzK7ADOi/88u+6MFaX4fs3ddHX
         MwDw9V9rfqd8xZg0lp5AlVOgfL+g7XP7oJbEX5tcdSFlFu4Hv1w1Z7qtcXP3FRw1QWz2
         0Ie32ELPD5YFroS12yqO62Ss2d/mFh+c+sRxoYUC6p52sTLZ4+swCpKBaL8/5R0JFWZO
         1xedQJx1ofPcJznojiHq/RH9VfpsD/s2w5SDT/4TOo5ChP9teDKm1P6t2lK6Yp/kqzQD
         vYuA==
X-Gm-Message-State: AOJu0YzLXvmj9yyosFuAn8IiJO761vITYmS56fXSBjkxWDNzL+ZMXcJr
	wuvO3+sh/Dqj51Zo55yf1hKlONlvZ+voMhdHu81SGmm2+HPmOxh4
X-Google-Smtp-Source: AGHT+IFKh5JndHh0ZiTst/hfYQt/qtdQs/RTyErvZXVhvrABTI36LUFP4A6iRytjCn1fjN12jFaAAQ==
X-Received: by 2002:a05:6214:598e:b0:6cb:e3ea:f07e with SMTP id 6a1803df08f44-6cbf9d4d80amr37749306d6.26.1728721110679;
        Sat, 12 Oct 2024 01:18:30 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85a76d4sm23439786d6.28.2024.10.12.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 01:18:30 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 045221200072;
	Sat, 12 Oct 2024 04:18:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 12 Oct 2024 04:18:30 -0400
X-ME-Sender: <xms:1TAKZ4v_kWfrEFyk5_rVjVslYM4kwiG2O0FOGBH3z2OQxAMKqycRVA>
    <xme:1TAKZ1fM2qr34YUcT5fhteMMoSwDBU6XPZDZ6F6fxOKwx9-8KTh-pCocSMxNjZKyN
    3MC5KKraNROSK7w_w>
X-ME-Received: <xmr:1TAKZzyDUxwOoEe2fgiCoa6e7A8xi9V03bvM5F1COpsFj0FfOphIGVc7D3h27Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeguddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepughirhhkrdgsvghhmhgvsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:1TAKZ7M0ql8E0XrWy-dDvPwdMdsSR1dIKm8_8LcbMR0JGbY8bJEo9g>
    <xmx:1TAKZ48GGbKDbwE1Gvq_7G8PxAYsVxO3rSUylQfleGY972y8rGfa0w>
    <xmx:1TAKZzXhRt8dVc2Lq5YkHMO7BufPZlMT67uOSKl5Qggspnj3YZveGg>
    <xmx:1TAKZxcT_cSla_LlZMMO92G_bceNdvDY4g40KdRBYF7sNLPSzlnRrg>
    <xmx:1TAKZ6eXzNJvwG2erewPQWMcDtGR65Cgib4AZS7k86_GJOXqL9_3kqwP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 12 Oct 2024 04:18:29 -0400 (EDT)
Date: Sat, 12 Oct 2024 01:18:19 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH] rust: workqueue: Enable execution of doctests
Message-ID: <Zwowy1ABlKJDbuOb@boqun-archlinux>
References: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
 <ZwowM_YKc8Ktzgzr@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwowM_YKc8Ktzgzr@boqun-archlinux>

On Sat, Oct 12, 2024 at 01:15:47AM -0700, Boqun Feng wrote:
[...]
> Otherwise this patch looks good to me.
> 

Oh, but you may want to Cc other Rust maintainers and reviewers next
time ;-)

Regards,
Boqun

[...]
