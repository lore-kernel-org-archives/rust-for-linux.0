Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C028541A
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 05:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861588; cv=none; b=QaD8BP1j001yaCrAcN2V4X/aOIfY2xqFiw0poz1BocMrgU2edayaLYejTy13sSLmOOUPtfVg3sdAa6eSM1ygQnail8R4dcCWIT9nXNxefDuzJFdyuHjpOQiVfAxf82b8xwa7qPSXL7psJlxsA+Iwg9I/IbS4EBfvrZJ6nrubKwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861588; c=relaxed/simple;
	bh=uYSNtIPBdPAmo6t77BQul6Ldc+T8yPkkOv6hcDKrzNM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qyayq58QYvx9jjAR0VueP17m5OgdN1fC98jE6z9p9dsP2a/jWZrzZv5LCiKH3aWkILoVjdtYm4qjqxIC9ejvyaVBTb0XF8O2yQORryd3x6vtBKJ+F37y/3JkqDcXX1nVeQAMpY0c2tifqrITYhVUG39PoOHb/IoHr5cc8w6gkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z++BhpPf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z++BhpPf"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48fe40b61a3so73832575e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 22:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779861585; x=1780466385; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2hQNIjzUAzNKjF5a10PA5EGoBATFq7mHnm3HpuSFqE=;
        b=Z++BhpPfq/VfG293ucE/P8LE1JbANRLRCjjhX5EkkpDIfRLpqsIe3sfQwBBWb/Fnw6
         l+fdh+XT69zmacX+MCFFOW30Eu2iiQFerFSwqr86uh0TbIMz/RmssjsortyHxM3K4ewo
         OVGtiv7KwEVSEhKgvhq0HMr4mpKtuAPXi3kUPcabUZcVqQO6R71u/Wdm2ePqIgV/y1aA
         BOTdPxUeGrRNxROaAgHcV6OTtzHbQfvcwktrcZWkv1uHounh5j9Rpkfr6XvDKa60suhv
         O2q0G+RzFVBcZyPO+Z0GxaE8WMerIvt6FMDUOFfwLJKC3dHfLjhg04BrdQmrUmC4NLLR
         dr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861585; x=1780466385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2hQNIjzUAzNKjF5a10PA5EGoBATFq7mHnm3HpuSFqE=;
        b=s6PGsjunLbKZkiX4kNqVAMeJUNVU5ZJEbS9ge1l2tKlM/KjNjLq/81HSAnbiwiQsuw
         zlXfTu3BHm34aX5lpen/YJXE2iVSc2ShUQ3SiCmiBWbbGtLlcQK+lUC1BgMiumjLlghL
         P2VbTjE4WSbG2+QkNJ6n5J4jcBGO/uspK2gau57mAhA25YF5GBxqZNv0Wptt2SN+/tZ/
         pM1HmP+ZUH1h5+VIm6lrG0tXV36rQWRJhatDenzkBobTwJrn6hVC2GD0TIUmA5uExPzL
         /gY6ypwPaFAtpa2inSLfSVqwxjG0dnae0o9V/g7vsjVPwWQbULz6Pku6mms+6TWAoD0u
         BO2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ey16/+usx8KziuCuJ+pGt92Zns1OH3kDZVrOKTB5NaAbSp72SMyqlxYGJ/RirbFZ1lWWBFPwrMX2sQ0mRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CAO/LKRoLSpGji60lNsHS8Py8rhn74oUlfADl4WIp6Sm6tl7
	Ye+AK9mA4g4vG2N2FGt8i/XqBMpM55t3eNrA6qbK6D2t1ihxlxQsOalsx75fhg2kaMidTbOevoT
	LleNpuIHyvMYWsG9PpQ==
X-Received: from wmbjs3.prod.google.com ([2002:a05:600c:5643:b0:490:3f7b:9cf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr270384815e9.9.1779861584952;
 Tue, 26 May 2026 22:59:44 -0700 (PDT)
Date: Wed, 27 May 2026 05:59:43 +0000
In-Reply-To: <20260521165622.279953-5-japo@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <20260521165622.279953-5-japo@linux.ibm.com>
Message-ID: <ahaIT7BV-gMqcVh1@google.com>
Subject: Re: [PATCH v3 4/4] s390: Enable Rust support
From: Alice Ryhl <aliceryhl@google.com>
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 21, 2026 at 06:56:22PM +0200, Jan Polensky wrote:
> Enable building Rust code on s390 by wiring the architecture into the
> kernel Rust infrastructure.
> 
> Add s390 to the Rust arch support documentation, provide the s390 Rust
> target and required compiler flags, and set the bindgen target for
> arch/s390. Adjust the Rust target generation and minimum rustc version
> gating so the s390 setup is handled explicitly.
> 
> The Rust toolchain uses the "s390x" triple naming for the 64 bit target.
> 
> Rust support is currently incompatible with CONFIG_EXPOLINE, which
> relies on compiler support for the -mindirect-branch= and
> -mfunction_return= options. Therefore, select HAVE_RUST only when
> EXPOLINE is disabled.
> 
> Signed-off-by: Jan Polensky <japo@linux.ibm.com>

> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index b96ec2d379b6..296acf8f71aa 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -31,7 +31,11 @@ llvm)
>  	fi
>  	;;
>  rustc)
> -	echo 1.85.0
> +	if [ "$SRCARCH" = "s390" ]; then
> +		echo 1.96.0
> +	else
> +		echo 1.85.0
> +	fi

For other version constraints we have listed them in the Kconfig file to
guard the select HAVE_RUST or similar annotations instead of here. Is
this the best place to add this constraint?

Alice
