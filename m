Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E3D3C0A1A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988084; cv=none; b=ih0t7JOZyQy86pRFiu5TyNw6r6vOGTRbvXsSZAt+RFj+6Ab4cbjyzW07sg85/4OxRE1qKfuuKbvGVpx9zb3GZFt9lX6dt8NanyM+PsBcW6Pv36bY0rmRtgUWfdAHiMCvrq5kzi3YqgIeiAU8AhDaGCaUmr2UjmrRk9Qi0q1G49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988084; c=relaxed/simple;
	bh=He6nWqhkIDYGYE7ioFM7h6bIHX16EX1TUFeH5DSmEPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PlzaSAk1lw7ZUPd0byClaVID+HzkqkZups3kgVmMsGdGsU4SJvF+vH1KaNid3temFfADPPFhUScHPJtP1rX5e97Er/NeX7NbhpWZSeIDeso4KEKWf1e4zvgObpshEHEm1CMN/bKI0nXpSa3tY3BjPzquX7NtBVJx+ZWMpGpRjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nIwzxBpl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nIwzxBpl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-47345535410so1535793f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988082; x=1783592882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMtazuX0bc66JaizzdMVIGRkh949Y63EIq5B+vLN6Nw=;
        b=nIwzxBplT0MtvOyljtPrF6GLqXRTS6h2DmoVZYyOF9lIzDT/vGExFoxK8J4bRp6Xmf
         CSUh9MWENdC2XACDHM/a9CLRVH1nvNzU/sjC5ILUDQpkd1k8rM4zWIsjRxufblVE+CKe
         5QND0ia9zye8GTAhHy8GXik9jISn35Cr842GWgWPELaT1zn07yhG/UQso8aBM5M4YGnE
         5grp4kUFhyQNhM0dtziDKYS3HDe7/A9J4WGmKL/OTboJgmQcCn16Z7chYtMyy4XoRBEq
         RkJ1x0Fg1q5YvBCKt5foYgC5EdO6vhCZ5wTXeRrlTSpRP9ksNxf5kFna3ASIDVcFsYKT
         GBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988082; x=1783592882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMtazuX0bc66JaizzdMVIGRkh949Y63EIq5B+vLN6Nw=;
        b=GvsBCX2PBEb7+lDiXqWLyCNUKjF7s+nP989/gfO7UQiTc0iNnA80IzNuLetRf1I9f4
         6COm/Ojc4R156ftrChtkZE7JMZR6E6Aae/Z6iatrpMBnXAZhW0l0EUsuDeXL1OBCDtED
         xVlkvv8O19kbA7l0plxhCwdfNn1xtocs1C05yLVc6Qb1F265oPeLa2sOse/Q+0Mm8GJN
         5v65GFJOa+LD2Dn4sWXRsMrUG3xWUuXsoCV7vfoPg3oeEyR74a3w9rIjjmoyo1u5rdRo
         AqFk+MLMgNDlD8tSnIC9OzC2qwvmuT94hvHr643tbP9ojrM9swBWCvTtPTcMt7afx15+
         FFMg==
X-Forwarded-Encrypted: i=1; AHgh+RoKyzp7t8tSL05lyhVOJQAkVRSC6CNypfJEjK3JLN5jzwYJkACIkKBVIHxW/+nJdEmdm2AuNKqn+08Lz3vwYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYf87JXae5E7CuMlbWIj3CpzGa8J+VkMIU8xp7l2X1Ba7hy2G
	CN1oCVEejQIU2JxTuySB+LrFeJb2hfDwYNMmq0IJGqT4tEcC2Ylo7VzVoKLnOeXFUf1/aqFkOof
	3WCSTeuDYw2g2gSREtg==
X-Received: from wrbdo18.prod.google.com ([2002:a05:6000:c52:b0:46f:1272:763])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5e86:0:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-47759c267a7mr8258289f8f.3.1782988081493;
 Thu, 02 Jul 2026 03:28:01 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:27:59 +0000
In-Reply-To: <ahw3tFhLz9bMMJAO@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ahw3tFhLz9bMMJAO@v4bel>
Message-ID: <akY9L2CUlTFHA0dM@google.com>
Subject: Re: [PATCH v2] rust_binder: use a u64 stride when cleaning up the
 offsets array
From: Alice Ryhl <aliceryhl@google.com>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	brauner@kernel.org, cmllamas@google.com, mo@sdhn.cc, wedsonaf@gmail.com, 
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, May 31, 2026 at 10:29:24PM +0900, Hyunwoo Kim wrote:
> Allocation's Drop walks the offsets array (binder_size_t = u64 entries),
> cleaning up the objects, but it used usize instead of u64 for both the
> stride and the per-entry read.
> 
> On 64-bit kernels (usize == u64) this is harmless, but on 32-bit kernels
> it walks the 8-byte entries in 4-byte steps, iterating an N-entry array
> 2N times, and reads the always-zero high word as offset 0, cleaning up
> the object at offset 0 N extra times. As a result the referenced node or
> handle ends up with a lower reference count than it actually has (a
> refcount over-decrement), and binder's reference accounting is corrupted;
> for example, the owner can be notified of a strong reference release
> (BR_RELEASE) even though references still remain.
> 
> Change the stride to u64, and read each entry as a u64, narrowing it to
> usize with try_into().
> 
> On 32-bit ARM, when this over-decrement would drive a count below zero,
> the driver's existing refcount guard refuses it and fires:
> 
>   rust_binder: Failure: refcount underflow!
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
