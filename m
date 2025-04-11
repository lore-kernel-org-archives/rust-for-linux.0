Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D11D86F7
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362711; cv=none; b=auboNGsOIdakDxw5Rulaav3DGoiqxFwSp0fMQbKgF2pEECxuuUhFYFPZeAAG2XT/uFmLceWIVK6Z8Fza7tzzTNTnx7g0SNvxww5utxe4O3GJ3HtOm6Id3XV+XPQ2kqoz6oPEvmCeSY2J1udR2Zr5fjnQXhYTVwl22k7RLsqMINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362711; c=relaxed/simple;
	bh=gAZvl/DaOljYQvLbZyj1Aqor4TLX1CMBfFj4+/m1Sks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xou7akU/LrK62Sl5eoukDuUyTfhf6BIJtnXO+MJBjMezvC41qcO1Eq/unsmtjThgXe4sEynk6o/RWDRrbE4g+7V2znrBBsDPRbamhYI3F5M5O+ulZG7Z7YF9Psz08vzdxou/Vc/pSVAHeQ85/PJTJd3Vs7S2LUEqbGsMJMROIck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wJzEPBFa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wJzEPBFa"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so884636f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744362708; x=1744967508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtHjRHXFVscsRp8RZd9/bk5n+pzbeXXVGPWrgj5RJKk=;
        b=wJzEPBFalVvn+0R4xEo5IVttssP/2COSMEORHKeV/lZCypZW4kGiQnTo460Sukqgg/
         zRD4enU/FSe6iDj1srJ914C0gZKuE/kaoSK8jV3YpOmrq4rUr6r3pDXNvAW2TF4XLePN
         +PgkOepO4f/R4/qbOHUdj/pZ9SCVblv0KqGp3yv/j7bNJVpGeYJ6TmXBMQeSjDfteA5W
         5+rKnMUwz2ZoSNkJ+kCJXlUfS6z47WII8AK8tTGQRvLNmD3wrlyhQ7v3gwhjmrDI6jRN
         oX0RmKJyS/EkUTU/zgCQ81trAJ1UabzCaJZnvCIygsUe5eGCQZa9LdVCGxjOzzplFqdN
         0PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362708; x=1744967508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtHjRHXFVscsRp8RZd9/bk5n+pzbeXXVGPWrgj5RJKk=;
        b=QeDJaEWMAS3+/bcJ9pQiSwY216Ym33TybjcUobORm/akWMvvJHr1kkKSICaaUCJu1t
         STNsBMPYNB5BSrfeQt3Ps/LhifGCvf1LpfID2Sfo7RhXYFqElb5tYdu0/Mch9fiNFdft
         LmDLrlt0HV6rTADyy5fcy3JUx5SmA1XhfgLZAhpEH78r6pDICPBmLoAjwpJ6uEjeCOKx
         ftPHbQoci3ICYiq7AegJ+TqbQsYMkxqPm6bE+qE+xfc4OWwzimfjU0Bb+DT4YqRlhZIz
         BKdzOtTsPsAUqw+46GAbIDvIV3CBAbBlav9/fpS/w7NoCDnQoBl/zESPZdQm+vL+7SBO
         s+ag==
X-Forwarded-Encrypted: i=1; AJvYcCXywTu6BuElRG7E/T0MsvUEQ1ePNj91DU3BgTdfq3b+YKSEAWQuJMRuAN6Ryr4TvG4MnORPsahAwYLVgGP0yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTLVqjV1Y5W4JCVPUk7Pt8ZmEkp3Fwhlb3AlYejkt1PC9WZR4h
	YLZsJdf+ETtgI4fkBRGNrYmbtAvCKoMrpdY2QraOH1Aa1uZXS18wiwhaX4HFdcNooOqg8vF++tV
	PMxqVq1AdHCCccA==
X-Google-Smtp-Source: AGHT+IFmPqT5nyuRDbyNRE7tkIsN0LjnBOLCerUako+DE9rPENWe6gVZ3/VyaRuq0Z31vztid24ppGEI8txFJR4=
X-Received: from wmbg3.prod.google.com ([2002:a05:600c:a403:b0:43e:fada:96ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39eaaecaedemr1421448f8f.52.1744362708680;
 Fri, 11 Apr 2025 02:11:48 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:11:46 +0000
In-Reply-To: <20250410225623.152616-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410225623.152616-1-fujita.tomonori@gmail.com> <20250410225623.152616-3-fujita.tomonori@gmail.com>
Message-ID: <Z_jc0nFyQpGui9xo@google.com>
Subject: Re: [PATCH v2 2/2] rust: task: add Rust version of might_sleep()
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 11, 2025 at 07:56:23AM +0900, FUJITA Tomonori wrote:
> Adds a helper function equivalent to the C's might_sleep(), which
> serves as a debugging aid and a potential scheduling point.
> 
> Note that this function can only be used in a nonatomic context.
> 
> This will be used by Rust version of read_poll_timeout().
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
