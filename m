Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D617745
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741126; cv=none; b=X31cb9hkG0JkudIEE2gPmUXWtaPcYlO3zqW7ONLvg/HoHjiojfRb/TEnToPEb6T/89k1ZM7WZusgSC9lPDXZbv9FICiLvhatuHIoCXG0A9WBbv+EEPA63YkKKnpg9f6Vc0UoOUwbYy48uvZgbOV+9nabB31bVbk94QbXPusVG9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741126; c=relaxed/simple;
	bh=NeRhIX2s70/8YOgHWx7v51s/+2/3G1ev0ujzLTF/mos=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bps3UBYpS3ZMmoMTglrD8+AHO8dE8JpWBAGkhhiQw7aeppHFQJFFTDNCODq6Z/+wxqU4ylIKKcBvQQEHcbqCpskq2VA5ZQzcz+yuKKTW3ekfyCEliTv+NhfBUuMrBadGLppec8iFNYBND6/PPK53Rn4Va7D5v8hplRlaL7fGIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/8mOGKO; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/8mOGKO"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f81362fb1so861432f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 13:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741123; x=1787345923; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyoIjIfZucHsRYdjMujQvQKd5GmUzCCcE1oyGezxt+A=;
        b=Y/8mOGKOG6z/4248+GsZqFOsgMJ205KkXzuTLaVIIsUpEOntcOgGFoi6fspesxhULd
         h2q960h8LrMxHwty9/owMTv+7pu0f69bAnON3WwXMz8VzZHesBdBUxFjC9/QFrn1sqPT
         jHeLKsdYIwpqYD48C0eCLiG8j+UUAmmUfhqSU61Ht0Wd/I5sJMQYv/BfVVisfkQ1zqZR
         rPBb7Ryx4EA5FVZL0EQzXkts5ZPAxHeyFvsXXiDC8WgQeL2I89Lbn7RkD50yoYsekbHu
         4VIB4havJEgNt+4hQicqOQJ+nLMFyYr93ezYV5qrD0WqFL/coAVPingOGenst+ozFiyN
         m1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741123; x=1787345923;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyoIjIfZucHsRYdjMujQvQKd5GmUzCCcE1oyGezxt+A=;
        b=NTFAExS1xzWQUB65j4CRObDH3prrYGXJ3bWaLgoZFEnHD6qp9TglKW6Ye53j3DEpET
         eboQoSV6aWDtuaSdmX2yuYvPOT7HDcPyOIwGuEbEMt8Jrq1ABtajlmvIYdY5YznthwZh
         vrXYKK3t0mZP8So+voqQadzTzM5XBQjL/1PTXSeQaO39vEJV7bkZeMSC181Zcy2S3mm6
         9ZzNb9/U2LOX4dAY3EHNrSxJK0tGMACG0W+f5QGf0GvtTcaUpY4I63TK8RwIdwTppfnz
         vsfyROcWeZvkFkbi73xq8Qenv1cv7PkirFgqPC799fgYRT1TaohXQ4oDuIa0kWrpI7kP
         pK5w==
X-Forwarded-Encrypted: i=1; AHgh+RqrbNkforRFAOCUb6GAG9mqAr6Wh2Xem411F7QYSFHr/zBX9pOyP7bNvEzpZggDbGH4BJhUqGX9wi62KNocuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdCTFrZHxHZcw3/D4kRxFB+mPMuBNqmjgt1NKce7ECDYylIrl
	ubFfL9kVeMVLUlmmg3Y5H4A9wSqTo/r2hKjoBpG0wos6U/H8rmC73jYEuLuYtOlOcgfsNnwNRf2
	Z5iPkpWttiqHk9Hbx4g==
X-Received: from wrbdp18.prod.google.com ([2002:a05:6000:c92:b0:45e:e5ab:ec50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:461b:b0:47f:80ee:744f with SMTP id ffacd0b85a97d-48160799d3fmr14545735f8f.16.1786741123347;
 Fri, 14 Aug 2026 13:58:43 -0700 (PDT)
Date: Fri, 14 Aug 2026 20:58:42 +0000
In-Reply-To: <DKNUE8CVHMBF.2I9WPCF66RLA7@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731133253.661634-1-rafael@rcpassos.me> <202608102134.Dygd1Kx3-lkp@intel.com>
 <DKNUE8CVHMBF.2I9WPCF66RLA7@rcpassos.me>
Message-ID: <an-Bgkfg6LcbQDGs@google.com>
Subject: Re: [PATCH v2] rust_binder: speed up get_node_debug_info using
 lower_bound iter
From: Alice Ryhl <aliceryhl@google.com>
To: Rafael Passos <rafael@rcpassos.me>
Cc: kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org, 
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	Christian Brauner <brauner@kernel.org>, cmllamas@google.com, oe-kbuild-all@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 13, 2026 at 10:15:46AM -0300, Rafael Passos wrote:
> Hi Alice,
> 
> Do you want me to send a v3 with this rustfmt change ?

Yes please make sure your patch passes rustfmt.

Thanks, Alice

> On Mon Aug 10, 2026 at 4:29 PM -03, kernel test robot wrote:
> > ...
> >             {
> >                 let inner = self.inner.lock();
> >                 // cursor_lower_bound retrieves the "key" passed or the next existing larger key
> >    -            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr+1)){
> >    +            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr + 1)) {
> >                     let (_, node) = cursor.current();
> 
> Thanks,
> Rafael Passos
