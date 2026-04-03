Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588F392815
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228309; cv=none; b=MfRT3/e+I8fMaBFZRtcT+F6JQK3eTSmXoENc0AGj4xRuDp7to4ORFwL1WiO3CQUHb0nZLhLllpXjwBl+orxIMSWSGxCPI41QgNAakxxsqvm3A5TT45HfUWVNl0o0DEkMFjLmBtCizB6MstImhfUet+x/WL+3nvmqsQtmXzqs+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228309; c=relaxed/simple;
	bh=iTImCva7idid81PFgQ9iGnWeBWFund/U8kowNHQRO2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHYeIh/rlqwyNY/5MMp5KtYjCy5evxCzvA+hiwTB9jI/bmx2fHJjenyU/RjAYVMX3ovurXGl8RZuGhH7F8r01sFkjTSoNI2T8WbpRbfOanHIM+u19NZtthMvIY48FQxAntdSrfs1NHWDLw7rPFQ5jCJUBiRm8gvpiaQuQ2fgjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8xdxELy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8xdxELy"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso842716b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228308; x=1775833108; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/XQC98vdqHlSXICaicJyLajHPRR9Jaz0GQ0v3XHDoM=;
        b=O8xdxELyIZ7EyT14PrHjs0NmXAG16BHcUvUHMMFq2mSYBRZEZXPyghEaD6lOBFfIZR
         B1DbWJSySZP3IC2fVmJc9jjc5mMXh8Xjr7c3vSjcigeQl9xVnuiVyRUIyvfq1oI6dCjM
         UEg7zXE/HFtqSWdK74WJr2i/37r49wGhBDOViqXCWNSEfM6WVi/2egPAnjf982hNVlhK
         0YnEJYwIRDU/Pa0C0UZrtChjE+kzPkKVnFfqz/PCL1OHt6w8wIm6emLjxtqUvK1ZalvE
         9zb0jFtijrfLaAUJ0k9w7O8w0HlxVBeE65ZVh9WTvZoe6xwfogHuKdpGrUG5LndEoI5I
         y3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228308; x=1775833108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/XQC98vdqHlSXICaicJyLajHPRR9Jaz0GQ0v3XHDoM=;
        b=PyDAFVv0zafPm+rVTT9LZAbr65k6Wyqz7jJGXHc2ScPOIQAz3n8IVua53X5f3h4E/C
         GLqPeJ+ylWwh5kt9MwiDqicqdSE7eP/rVDHcYmn/f63eRz1R9YiQnuT4+DkERdrcfhYM
         7rwSyO/6bP/j4evBLdRBI4oZkDTj7P5WQ9DJf7CvVthtlls99/BSMpWnO8IF96O1wb7Q
         +0DwZvNi7bp8gi5pT5k0sfV00Ka404SPxLfcFQeJzR95SrpTzfnnduUaee00rCucnUWS
         jlQgcCHBP6LB9+FM830kVJwbFNO9HGbNmUYKDhLmibi9fKGgXCFYAgGq0Xsbt/wDj5Qu
         mj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUIyqAOfXdPfj3TmFTUBv1Tgaqouvk5+Ah8khcwhx+6jO9RtoF7Vn7Mjhtif7mEOd7WKdtJsdQhZbqTbEogpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QmQftzMO3AFxhjC0spccJ2Kh4hbDkBIDT9xaXszGgLfzf/SV
	v8VrWk+7LaGqAQWpG3Swy6GaWsmH8snpqzXiz8HQUcnvDn6UsZmpSiuF
X-Gm-Gg: ATEYQzw08FM8vZWSF3MqMol3lQEVRTqHhN+oMUBcYQrYecUZ0RZSrQ+XOO0k7ppT6WC
	8m/NBpP7iv/NYr8NZYKJ4zV3iryjPkV/yzTjuTdSB2tLc5GSbGhOL4MGjWzp74kusmEY1Xtlwvo
	JDQXy9VkpCGhx7Rkdi+VPGZFb8YKU3CwlTP4vSY3onV3yb5KHkjPghPkmvmhB9OUPGA3K0seUU6
	Ad6ocI+4wRNNl5XlJrpTd6QEE1bxHsUuYK36pJJwTID8gUUIhaSrZS7heSTQ7s3KmYkfejW9qVy
	/5bb2yYdSgaYYXaiqVkkOdltb4PPOJiJJsv2rmdgN4x2x60wYSpZWtK72snIBYqj4x8Lc6O79PW
	48wlJb76Vu7CTGixPB8rjwjfevQOETk2EW9cmY17AUQ563+cD+FDel8HyJGG+5KToWATLU5vuHt
	lJ2NfpPSY7l5FTTIrj1bguEsJbqI3ymago8m1Vgkf6zKk4+nG4etZ2QYmyB14aT/Sk9Wxvug==
X-Received: by 2002:a05:6a00:3926:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82d0da2c50cmr3484244b3a.5.1775228308163;
        Fri, 03 Apr 2026 07:58:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm6522973b3a.40.2026.04.03.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:58:27 -0700 (PDT)
Date: Fri, 3 Apr 2026 20:28:17 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 0/4] Rust support for powerpc
Message-ID: <ac_VLVEELvJ4KuI5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <CANiq72nUf7cikhf+kCdCgoydpMJZ7HuFWR8jzRvHSoGNGCv-0Q@mail.gmail.com>
 <acpBUJ9xdkS4b-zG@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acpBUJ9xdkS4b-zG@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Mon, Mar 30, 2026 at 02:55:32PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Sun, Mar 29, 2026 at 06:20:58PM +0200, Miguel Ojeda wrote:
> > On Sun, Mar 29, 2026 at 6:03 PM Mukesh Kumar Chaurasiya (IBM)
> > <mkchauras@gmail.com> wrote:
> > >
> > > We are actively working with our LLVM team to get the target for ppc,
> > > ppc64 and ppc64le in the rust compiler.
> > 
> > That sounds great -- I imagine you refer to a `-none` target? Are
> > there any links to e.g. upstream Rust issues or PRs that could be nice
> > to add for context, if any?
> > 
> I couldn't find any as of now. I'll try to fetch em and update
> accordingly.
Hey Miguel,

There are no issues or PR publically available yet. I have sent out a V8
without any links over this as of now.

Regards,
Mukesh

> > It may be good to put this in the commit message. Also, other links
> > that we should add:
> > 
> > Link: https://github.com/Rust-for-Linux/linux/issues/105
> > Link: https://github.com/linuxppc/issues/issues/451
> > 
> That sounds great.
> 
> > Thanks!
> > 
> > Cheers,
> > Miguel
> 
> Regards,
> Mukesh
