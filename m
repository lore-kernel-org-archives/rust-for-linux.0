Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79042FD691
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762508263; cv=none; b=MyaqVmASEwILtEoBIZqc5YippIBSTqkBRwIMB/0JVRPMqiFTY+2GYy1MnuGgTVDWDiA+oZ99ZXZgMV/wGM/HTlX0Qki7+s3tLjzxSFeT7DrFdrxYkSdm3zExXZdhIyffxmECxxeQZ1Y6UOOjvJzp9pSYwCDK7qJYVytY4mzG1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762508263; c=relaxed/simple;
	bh=d+fykfbo0yVSu5PSzD1il/dNIIo186gGMyzSZ6FzhPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jJ0UBkCxEsiTDE6/xBCu6e1rU7Qxsu8KL0qtF2CfejVSKuIRJo8+8dzM3REtWjlutVf6YHDJn5Pgwqx1XjN0StctUADpVmdUMRYuMt/LNYghf/A/QYidT7ZIINvcylrGcrLbbYxIOYFXDU5fsHPKR+GRe1BwwH28YZcfj/HjSA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDgsktyb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDgsktyb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so3995815e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508260; x=1763113060; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+AnBAo1ieXfvVE9W+nwSIevZrdDCppUWTkwbf9O15Qo=;
        b=pDgsktybRkhaxwGIrbn0QDqQ+hrQsLdJtQ4vwwhuLBBrtcaJB0eUVMAQ2Syt9Bcj2b
         G1NBqER7+ogZabRnbvehZkXLygKAMpy96vsDVOrT/i3xeZMlWV9eMHzn2fzYs2P/2KVC
         wPVnugSxBAi8CDIYucI7xVGF0Yl1KOVF44FtCjRWwyWMW3SnfDLBmiHF0dEn0q5UQWZ7
         +9qn/NOmC82JVMU50ywqFTDKYBhUsx3LWNvwyJXCi1skutpsHBtAPVjWqcVaUMsnYu2G
         EJrK6tlrLxJ/NqoGfmcexbjFfpPH2Eu8NC3Z1vt2cw+mTGXnSUUZ0G56MyG5snyz6K79
         NQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508260; x=1763113060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AnBAo1ieXfvVE9W+nwSIevZrdDCppUWTkwbf9O15Qo=;
        b=quWnbjkqlnj6vVR+e2+fy9Pl4i1GQEkbjS9EhQshazo870nt8V+B/uLFm+tS24lj+m
         Zb4hOGhrOjnNKlDSp/PvlJVTwR6MbGZWhZNOrwipc38OQEYAKoKiXWBYG3G/fW3h8YNU
         jcFhP2ZcUd13hjYCUe+4Bv+MMPgzqdE3R04KhUVWjytXykGBO2MYuDX93MOtg7VEECLw
         NGaW+zhHZTbZsCqrstSsMoUTtrGvr8VYGn0Az+nqXGlOMZSEBM6vj7wcEdc3CqkyeQhz
         DPzvFaNfdp9tPIOfgawyTR/PAfhbIThARtt7OaE8jrCk+C8r5EOcxx5lERahi3FPDwbU
         Hl2A==
X-Forwarded-Encrypted: i=1; AJvYcCWoDl1NoupkKDGyzz6qOVLNHDjmboNI2/uEiGgtzWMc/fKaehzABdkbeoo08LAwPiE26A85EDIYAs5jufLKUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJ7iHDrAxQgTOE6YZrokptk3ffkY5vcXyMyQ4QO3vu1vecI9A
	sLB8c6kNIKlfU1aqpayvSDnflMhcvCZYiB566t9RyKXVteQn8zhlhlVSUB+0NvMsRw9VB55iGYa
	+Iw7Qjp3oX8PppZPcCw==
X-Google-Smtp-Source: AGHT+IFx6JnB83u2hch19RaQnggflMp9yQa+OdndiPmwepxjVcH0thfA6gW27ocmbkG1cgsMwvesbWOHXfMAUhU=
X-Received: from wmlf4.prod.google.com ([2002:a7b:c8c4:0:b0:477:5506:8a6d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c2:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-4776bcbbb54mr23797035e9.20.1762508260292;
 Fri, 07 Nov 2025 01:37:40 -0800 (PST)
Date: Fri, 7 Nov 2025 09:37:38 +0000
In-Reply-To: <20251107091612.2557480-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107091612.2557480-1-dakr@kernel.org>
Message-ID: <aQ294kwmW_-vu_1f@google.com>
Subject: Re: [PATCH] rust: debugfs: Implement BinaryReader for Mutex<T> only
 when T is Unpin
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 07, 2025 at 10:16:07AM +0100, Danilo Krummrich wrote:
> Commit da123f0ee40f ("rust: lock: guard: Add T: Unpin bound to
> DerefMut") from tip/master adds an Unpin bound to T for Mutex<T>, hence
> also restrict the implementation of BinaryReader for Mutex<T>
> accordingly.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20251107134144.117905bd@canb.auug.org.au/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
