Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F15429005
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230265; cv=none; b=VYWxhb+0VWr8gi9mK7IO2Y7ryYNW2EcwAgZAMtgE4LvQ5t+8GFOqzYt3r63oA0sd9HMC2Ha0Ev2MPcrLZIkR+doxdYbKntp4jIbOF1YoiBOJbYmPGSkHj6SG7qKyULUros++YkmctrxBjZhTIdyxDGAutFAmnuSi638eBAHrOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230265; c=relaxed/simple;
	bh=qM0/Sa/akYpAFTQhfHlvfVOQIqgdK93DDZ+kOkezo0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFoKI0Q8Y65xyEku5vSEVWe2q2E40izuRsxpSkpvPUIrjzAw810Wr0uvltBCqg7PipNGU99h1vXz5tRvf+ujxPZxpss2o4sfZLpHIpSR5VFHZXDmuVjWcxz+6YY19+J82sBMqyKhj5097tqTTJieWFE2caDPm5gnnte14jeQF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gwxjez4w; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gwxjez4w"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cede6375caso60235ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 19:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788230258; x=1788835058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TigSYxFnxWq9gKiGhMz2MZvb5kxbBnb0kPL72Ch9E78=;
        b=Gwxjez4wozRmwFvloTmovlsYIytqq9jXkqC+EFyGWiCF1PAZ1L49JqdxePWzmBPuCq
         baUrOP/m5+lUatVrFqWmG8/iRqwpRd8wjR7/YyxCDupUuvdmzOlgHPk90eapuoX6gVkM
         DtK6F2zw2ob7pNklmRoIqGqBWSbg6OGKBLmaVBlCZRkwjgUHzpw/WUviJ3WQldOxaTMt
         zrijCaEzFaN2aNtM1GnbkRPF4sRW2s8rn/Ea4wuWX1oCljRcVdroPpfKFw26LUd9c+UP
         nwKTLNXuPKrX6XVnD5RhotkgVCwWUBllcASVJiRcl/TGzZy+uzwnlrZWq31Rhqx6wKtj
         JlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230258; x=1788835058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TigSYxFnxWq9gKiGhMz2MZvb5kxbBnb0kPL72Ch9E78=;
        b=OdZRD+BevLqIRW3MMcMy99gsPKmi1xiyTREbukn24X7F1++MXhFKGwNG1US7wMNQPe
         YtXjEGiYGJZa+ADYfDV1xZavnjoP7u4EmATSeJJ5Lc6Z+K/ed08hwtcn2Cm4sjdD70yd
         peiIWRiFjhUzEXN9mNbceIq0lMJsr3QJKzjMeFWeryk1WQl+LL8V3eesnGPeDjVwYeIu
         OS6Zxs502FFscTE+xoUeR5MktMlmFXuSDbMZR5aRLOGncySiSelLS9QsEpgD8Di75DzE
         cU9EljnpSmPEUSBSwnY34e0sA3YcO6QhamvJfJiN2z8qLujVXW/AJj139qWahE/wX29i
         5xig==
X-Forwarded-Encrypted: i=1; AKwUvBwKNmUQjOH1oN58U4W+0icaCQ3nVBAae7ktinkj+RmMPW+dWcaLXstJMN141SGTX/jy9gOYfWkH/0Iq9ivfMg==@vger.kernel.org
X-Gm-Message-State: AFuF++lFCRy10fImiTAoghb651U+hjYdMWXTWGm3Eeyr2Rp/7s/LynLf
	6Ak1Q6DIOBImsvl20pUWcr4NztL/RIoeRH52e762mVe/Jco4rJF46ZPnUQ2ynakWOg==
X-Gm-Gg: AYBFou3X9L4owWJw0B3CwD6jGW/v77y3aC+TLDT7LV3/cWPfbzk5DjsZshOXMYWMBiV
	5as/PCCaBk9bQZsejqAhleXaOKy5R2RVXaNWohkFKwFUVqQFXc5jlsMYu/IVlTjDKQLD/BSSVRR
	wdNfLdYQg8qEAzg7QXFUFfxwpGxdfl6N3qwOr3EM/YR/2j1ul9Cx5i+6azSKBBFUYyLGlrP4eVK
	KCgTLMRNaGSMgRZ4aAiAbsw+uPCwqT4h5fhQLrqh1nwcTuqAVEb2kw6uHFyvC1mKvPX5spY/PDq
	U4d63VTDrdJm964Cp/ERHjfJxlm7Iwe0boWcbLPmfKg2R6wD8VAVZ06MsYldZwsq7IxEkh78JfO
	HRJMTaa+SreqN+i9T+7mASUsoJZxbJTWwmoS1ROQa9BL7DdVZW5jPnYDc/ZdTTsfxTNay+PKLQq
	/bJsYY6yLg1qVmucYEaapxUW8IfyNhYpaQo2LWe1Nq3WMV6XNdwCDMC2Bwc9PTlN7QFakWYQDTI
	yYJpKJyVTwTQcIcMec1H0+MQ9lDU7TGMdsKWDNrAyKpdIRaL9RqMH/ZWNaCutQ0/z12KuJMqPY7
	oL8vTwlXwDAQi8EjzQ==
X-Received: by 2002:a17:903:19c6:b0:2c6:a078:bfb7 with SMTP id d9443c01a7336-2d959b82c4dmr2821605ad.7.1788230257133;
        Mon, 31 Aug 2026 19:37:37 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f727bsm5288561a12.7.2026.08.31.19.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:37:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 02:37:32 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	"open list:RUST [PIN-INIT]:Keyword:bpin-initb|pin_initb|PinInit" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust_binder: reject mremap()
Message-ID: <apY6bAKxms37Xdt1@google.com>
References: <20260831224145.169403-1-cmllamas@google.com>
 <20260831224145.169403-2-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831224145.169403-2-cmllamas@google.com>

On Mon, Aug 31, 2026 at 10:41:43PM +0000, Carlos Llamas wrote:
> Binder does not support mremap() as it caches the mapping address in
> Inner::vma_addr. Moving the mapping breaks the IPC communication for the
> process and can temporarily leak pages during a shrinker reclaim.
> 
> Fix this by explicitly rejecting the .mremap() operation.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb%40google.com?part=2
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---

Sashiko had a couple of good points that I'll be addressing in v2.
--
Carlos Llamas
