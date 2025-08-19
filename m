Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8F1F4181
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612774; cv=none; b=Uh+4IcAJ5H9+NlMkAhpuLW9QI4+l4FwzkFH9b7YvjRKTk3Mn+cZJMXvSNOD0zgP3F3k1xYVBBfuVErxmP3yCkwEL0bGcKk2GE/pry3JGbd6WhQ7dBz4DCf7heFVGLJUBMSDJvP3y49I7T/q25pHAKhWN6MizOG3I99hmDsl2pbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612774; c=relaxed/simple;
	bh=3V0z30hzXwF9h8gKVpXsVSnFi0/6IwWc5rnalb0g0aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Zc6cDFM0smDxGV4njm9bLcE4xdMEazMSeoFk7JUZswWsg/gJaWfVJLPBtJkUzvMD7wATzxHQ7uMnAF4REE59EHBbDGyuIuC2diyHDuswY9NPFWiUXUupuZW2zTWNv82+rDpX7glM+aCAHYt+7mzajtu0Ac7dGEzzneAWzxBjLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iqzjPnh0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iqzjPnh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755612772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Tz22iSKZ8PdzAiXkoimq0HOH4BrSK4mX11OZtBTSdo=;
	b=iqzjPnh0fIm02kwjczO3YOUnoQhtD5xGqIOIGRFboVF+YMJxmS0MihPw68h364yBwGNPsX
	2j3swRIjM67WMdGEeNs5zNVPAlcqBOyJlgPecq8OfC3HeigitW0eJQbbzpZj9rsUEnLcm5
	OFh8NSl8/pLkDZETC6qIWM9cuIiQXOw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-lfw6F4pyM_OYxtxnila3Dg-1; Tue, 19 Aug 2025 10:12:50 -0400
X-MC-Unique: lfw6F4pyM_OYxtxnila3Dg-1
X-Mimecast-MFC-AGG-ID: lfw6F4pyM_OYxtxnila3Dg_1755612770
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e46a20so10152984a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 07:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612770; x=1756217570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Tz22iSKZ8PdzAiXkoimq0HOH4BrSK4mX11OZtBTSdo=;
        b=XFfsFmwSce4C/+3hkfOpT0/oqIsgDbRk3h1zPVu3ckb7HtYdcu0NMR1439gm2WAKFy
         gflP9bMje/6MaqFXjclE5c54jfgrP+cNg2IMfPfyDuAHmaye8GzM+KBoPWqy06Ci5Qeg
         +Ji6c2SKXlHZYlqxyAyzibgBIH4WbfiwXH8NG2w6/0NlJxb8zO9BrrSu8VPG0QLszwCW
         fFsCrmKEq5CmApQa/Ma69PiMv3I1BiSRLxxoM2gSUIYHCtsiIf/oSWHZljGP3+gmNuWc
         UOVw8laqWSbFpfV22SvwrxE43y5Jx7vMysB+BzggX1/UYTTlB8tgVdxginZcN2/j7Dyp
         AHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcCfYUL62aw2yT4OhM0q+6MKUpcDnEQyBgtnbuUZxrsqO0j6KRI98BUzfkr3S1c5VfiPhB14Zkn/ebE6FYDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydDxzrpgAFYU9k9Svl7FBPblyYxMtiBGCx6AIoT+rcgpivLk0H
	OPBTfbgCipUAMVSYvxOkh8Wx/2lldoJT3Yx4hNz9lzQRtE2L+MNAmWYaOB8avcE0rcElb8WydWq
	POZUievleX6vQvd1Bmqx0W7LIPUYJjzYBF/SAaF2Rt6MrFEAUr0SoO0uhoD7fcivFomfJ
X-Gm-Gg: ASbGncvSOzrbnwqTvFv4ZYApt0O5kETUuB/rn+MXACSthl7KoR/HZ77LOxvaaKASFXy
	JpD96rp5E2c2akCrgfs1z42ECrwpcZrVOFYm70MCWEcsZwUC26nHalKIN6lv7//oXcR+ls3IsZC
	1rq7O1Ovy5vOeKGg/fJn1Me+1P3Aha37mT0OR+GciIy2kPYEtKikwwuIVu5980wLqVSIMabJPvn
	hiJVCWAOZMD5Ss2MG2fRN1/7WZzK+ujUdpW5r9cEm7JhnNyyLkZw3FOgvgGLX8H0yogh9iDNhRs
	qe6gn9Jb50MtEkV7MGEKk3Fupe/V4q3ETA==
X-Received: by 2002:a17:90b:5584:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-32476a6ae7amr3859390a91.20.1755612769630;
        Tue, 19 Aug 2025 07:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPs2vzC4ASGHRd46PAct74FDOC62VGMtvuVe07NVQb4zpn+49Mi8TM8sz/fOnZED0AyqwrmA==
X-Received: by 2002:a17:90b:5584:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-32476a6ae7amr3859353a91.20.1755612769094;
        Tue, 19 Aug 2025 07:12:49 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1714sm2699391b3a.15.2025.08.19.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 07:12:48 -0700 (PDT)
Date: Tue, 19 Aug 2025 23:12:43 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, lee@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rust-next 1/2] rust: miscdevice: add llseek support
Message-ID: <aKSGW1SXcYleSdph@zeus>
References: <20250818135846.133722-1-ryasuoka@redhat.com>
 <20250818135846.133722-2-ryasuoka@redhat.com>
 <2025081836-unbraided-justness-4b43@gregkh>
 <aKQHQ4av5ZqfQ8Q1@zeus>
 <2025081935-railcar-playing-eb9d@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025081935-railcar-playing-eb9d@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xPHKgxUWydEcomfm6XWT_K22TMc9yv7OQjp5BYQKbls_1755612770
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 19, 2025 at 08:04:32AM +0200, Greg KH wrote:
> On Tue, Aug 19, 2025 at 02:10:27PM +0900, Ryosuke Yasuoka wrote:
> > On Mon, Aug 18, 2025 at 04:17:40PM +0200, Greg KH wrote:
> > > On Mon, Aug 18, 2025 at 10:58:38PM +0900, Ryosuke Yasuoka wrote:
> > > > Add the ability to write a file_operations->llseek hook in Rust when
> > > > using the miscdevice abstraction.
> > > > 
> > > > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > > > ---
> > > >  rust/kernel/miscdevice.rs | 36 ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > 
> > > What misc device driver needs any real llseek function?  The ones I see
> > > in the tree are only using generic_llseek or noop_llseek.
> > > 
> > > Do you have a specific misc driver that you want to write in rust that
> > > needs this call?
> > 
> > No, I'm not actually writing a practical misc driver. I'm just creating
> > a toy misc driver to use for testing.
> > 
> > In my toy driver, I need read, write, lseek, and ioctl to verify the
> > basic functionality of the device driver. I saw the Jones and Alice were
> > already working on read/write functions [1] and I believe they will
> > propose their patch soon. So I propose implementing lseek which
> > anyone does not work on currently. This is the background of my patch.
> > 
> > As you mentioned, lseek by itself probably doesn't have much meaning.
> > Should I wait for their read/write implementation to be finalized before
> > proceeding this?
> > 
> > [1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.E2.9C.94.20Miscdevice.20read.2Fwrite.20abstraction.3F/with/497953296
> 
> Yes, that would probably be best, because as-is, this patch can not
> really do anything :(
> 
> Also, we really want an in-tree user for the new functionality (not just
> in the sample driver), if at all possible going forward.

Got it. I'll try to include an in-tree user for it next time.

Thank you.
Ryosuke

> thanks,
> 
> greg k-h
> 

