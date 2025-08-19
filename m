Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A428C27B347
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755580712; cv=none; b=Yc42SKH9yC/owFZ7NGhPJnz3cxKnZBtp4tMjjas15wcUt8anYsSY6Xf7Ditlb17SWWmw5+RZutOP5FDF0LYEvsTgM2yyfWD+1N0TucYS41uvZBk6ngxBg5Y3WkFYWvsqSgm3VG6+VtTsmYTa4UD5z1/9GlzQqNIQkgvdxRfT94g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755580712; c=relaxed/simple;
	bh=zdaBsgQUjZK5jZdjOTjQs2N2yClZHeBLvycKAPOGO88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tNbbI1CweYmZubGDAD4NYi7R6FlBON2r8kidQCEkD26YJsF9gv1b+TJPjXko8R4KVscjEQM6smNi6FOJwa9r3MywvKnKQFJP+u+wFppjGoP/fQZD+WSGzace2n5QpIyQL01kCpIiORhaFrtGg+voNoNpQg6M895tlnXLx78YILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eIZIaQrM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eIZIaQrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755580709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjX13QutZXnn1qKaednamt5UGEEWdjs4CWpwGUcPMo8=;
	b=eIZIaQrMaavJR9//oRxZTO4YcELBID1CcqXvxCb8WsS9i/6DQNp6fZWh9gq/5CUuuAFsYT
	YTEcIEfS8ETECUnWoSfYV12G8weqmGmlJwemKdNryF70qSqlB552CFmBNx72+cGFz24upQ
	AhCBqAtGIhV4EA60myWmGV7ZbCK97A8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-kiyweT20PXeOKky0nxA62g-1; Tue, 19 Aug 2025 01:18:28 -0400
X-MC-Unique: kiyweT20PXeOKky0nxA62g-1
X-Mimecast-MFC-AGG-ID: kiyweT20PXeOKky0nxA62g_1755580707
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323266d8396so4506376a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 22:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755580706; x=1756185506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjX13QutZXnn1qKaednamt5UGEEWdjs4CWpwGUcPMo8=;
        b=M0Eubf8M62PfAsQ6q3HOSw+1CgYCapj48CRcRojvuvKKGIj3fjPnf33GGX0KDxt7fR
         8xcOQK0wLoYzqn5cZcOBqCdR7fwSBkporgIs/mgkPvJGZf2X49TIs2VIxwupuxQVdqey
         sXI1ZWAViep22Tb/mXO8Cgo6PM6ZHsw7wAYX6SRLwEdGW/sGIylPB+5A0H/cEjyeyys2
         A3l6s1aNvgWCTr//m68UzPLYoVJIvhnHzxU7/o0cYyEq2F3zeiWfIk/73mT0pFOkyasN
         pCP7re7PkfBJxmJbqwuBqnGoN4iELOxCeI3QPt0e61ZWi0RGUf9y/6PR8WHoklibRv2C
         0g+w==
X-Forwarded-Encrypted: i=1; AJvYcCWQEoxM3y9DRUH0hupY9D9mhCzykbMDALa26FKJVC5nzsYleSQCfNXpuulbfo4Vcphc8Lpn1sMZvB79cJQqxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRxUM9aJgNB2ychBGWrxE3gL2QaHqoOWpKbN2l5blhxL3HIt0
	hzR+Z/4eJ4j7+wOnHfEfQqlPCgGqqo+1XH62VTl0Fm7nDVmZnmLEdwjZFW/1rkD9fYVN5urCn+h
	0f9oo53rv2KfYFgVDP+3CkJ5FCh9qgonHTjVwGRvZtuMxkJ0oZUK+Ppzxd9QImQEkUNqaHnrz4A
	rpyAA=
X-Gm-Gg: ASbGnctRaZeYGXOr0M5XeWKUfttcoESc5LdhLS6w7xENZmIDBlE7sRPrfzX6HTepUlc
	I9jCsI02ghAl+/zKJVUDvZ8NnzYQsgz/kLkvdqSt42fX/Qyx9ZjH8toJvIaE2SmXKixmP/QQTWy
	m2608vo0QhUAjaxr6QbDRTsohovbgLAVpQUkrT7T1c0UcX/xIvmNqGiPBqpN3ouUj58VlWnm+kH
	6oYPuIURx3Hh5lc0Bv84qCHmQE0W7RikBcWIqQdRtgDvIgTzo8kyx+ubYZkrwnUC1S1dilEU11N
	x8rixOReSvsOTCRS+31WbLW/rBVYzS00WQ==
X-Received: by 2002:a17:90b:52d0:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-32476a48131mr1753868a91.4.1755580706521;
        Mon, 18 Aug 2025 22:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKQtlvFs2YJ0QWir1GcVeLXlcL3oZn+i/4CwJGWIsBulVTOobg5SCDLAg5vIPERbvvmwB86A==
X-Received: by 2002:a17:90b:52d0:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-32476a48131mr1753837a91.4.1755580706064;
        Mon, 18 Aug 2025 22:18:26 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324d32e2b53sm367456a91.8.2025.08.18.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:18:25 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:18:20 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Benno Lossin <lossin@kernel.org>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	lee@kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rust-next 2/2] rust: samples: miscdevice: add lseek
 samples
Message-ID: <aKQJHOKOFn8i_F9Y@zeus>
References: <20250818135846.133722-1-ryasuoka@redhat.com>
 <20250818135846.133722-3-ryasuoka@redhat.com>
 <DC5W7UQHOJSG.310L4WJ0AKZFE@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <DC5W7UQHOJSG.310L4WJ0AKZFE@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yED5InDVzJHCUL6WUt1z8UBcHr3i2ayf2eXtxayblmE_1755580707
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 19, 2025 at 12:05:41AM +0200, Benno Lossin wrote:
> On Mon Aug 18, 2025 at 3:58 PM CEST, Ryosuke Yasuoka wrote:
> > +    fn llseek(me: Pin<&RustMiscDevice>, file: &File, offset: i64, whence: i32) -> Result<isize> {
> > +        dev_info!(me.dev, "LLSEEK Rust Misc Device Sample\n");
> > +        let pos: i64;
> > +        let eof: i64;
> > +
> > +        // SAFETY:
> > +        // * The file is valid for the duration of this call.
> > +        // * f_inode must be valid while the file is valid.
> > +        unsafe {
> > +            pos = (*file.as_ptr()).f_pos;
> > +            eof = (*(*file.as_ptr()).f_inode).i_size;
> > +        }
> 
> Please include abstractions for writing & reading the file position
> instead of using `unsafe`.

OK. I believe I probably need to modify on the kernel:fs::file::File to
add abstraction for writing & reading. I'll re-consider and send them in
v2 patch.

Thank you very much for your comment.

> ---
> Cheers,
> Benno
> 
> > +
> > +        let new_pos = match whence {
> > +            SEEK_SET => offset,
> > +            SEEK_CUR => pos + offset,
> > +            SEEK_END => eof + offset,
> > +            _ => {
> > +                dev_err!(me.dev, "LLSEEK does not recognised: {}.\n", whence);
> > +                return Err(EINVAL);
> > +            }
> > +        };
> > +
> > +        if new_pos < 0 {
> > +            dev_err!(me.dev, "The file offset becomes negative: {}.\n", new_pos);
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // SAFETY: The file is valid for the duration of this call.
> > +        let ret: isize = unsafe {
> > +            (*file.as_ptr()).f_pos = new_pos;
> > +            new_pos as isize
> > +        };
> > +
> > +        Ok(ret)
> > +    }
> > +
> >      fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
> >          dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
> >  
> 

