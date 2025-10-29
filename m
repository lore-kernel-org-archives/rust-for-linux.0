Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74D2EDD50
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741905; cv=none; b=iSapah2p8UT6v80gorc8IF+jNUk5QoROZ+p+y6fAxAXsI9lsWEJtOKgUNk2374AZHOLDiJFWE1E6ntK3yFeN51R9CrB5w1quF9q3Z1VRpi+pP+puU9Q1Z7oRfvQyfwUO1RO7D47IEZ4t10WgyRIM8q/kmJBdncn7sA/tyGDKvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741905; c=relaxed/simple;
	bh=Lis8XgSRnA5YJBARphY+01JX7JiGiM3xwyWmHXnsc2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cJ70VHTk1vVdK+XGcu/J9f4le+1fQaZcGUK9nnntlrPmiq5XSmw0x6F+cPvl+WkVF1ETFBQvCd/nLPETcWtcGj3EdUOELiarMZXX+xzbgJ3oxl8bxup/XKUj07lh/8Z59mS7Vjt5ZisAOTXdI2FLKM2IJ5AB5KOtGJkrIEwmfrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RZKycbMe; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RZKycbMe"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3f384f10762so4434509f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761741902; x=1762346702; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9cuzKWbb4KNIohtS4TrqwKkjylaSR6bB/ye8dvPygA=;
        b=RZKycbMe3C+Kh9HpXsB4fVWevZ/7JW6+SiqRzzH/rg/bNezYJomocEzcib1HS+RwLn
         CVmCFkRer0fjN4vSsZ466D+LsQNo+hIaVsC0faj+O/m3w3DGl/1hSNEVi/BEgUyWu4jk
         c1phhCfFYLmzidKxDPmOGawLhtY79iLRlKhjBwnyrPasH7i1z71G49JCBGVYb5dmeBP7
         Y1GHydTnNjiZn99is49dCz2pHL1uaesbICRK0WZppFClxast0sAiknLafL72rIZEJryT
         Pf3c3aw5VA5AefIuGxlBfhra8BAWHUaUmyCHMX2Laa04JXXV+qQh5S99HFfeqnlszc/i
         l8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741902; x=1762346702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9cuzKWbb4KNIohtS4TrqwKkjylaSR6bB/ye8dvPygA=;
        b=HZQAS6u5NF+Q50G8U7QMxo2uw1j6SL/X7xQIfUyI66AGp6etcLwM+/94drDOhVALTw
         pPv6Bjhie1XmZzksxFG4JLJ1t+HQ37B/i1tZEKmsgBTt4ekOBOCuOCyyyxhMRTS6ebAt
         QWUjFP6wJ0OtwE1vsF2wyjPAQsXYbecIOJ796cDcGmUrOmcR0KXAazwlcKLfavcyZVDF
         HMMvLxucDBy7txviv12xXsq2DcSJThzj5MwOPmlGbwzgEn4FnNmh8QSkLgHOzhZC/L9K
         +4Fx7gWvyUY8s+7SeVEdOob8m0aexpcDmDrEdYuZWM09E4TACE2siHmjXcCwpduvRxlG
         IOXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBRMy3wwLiNKTug+8z8YsayRdl5pr0sS4RiA2bi12vF6oGcFM3+fo5+20WkT0qRQ2I49bEM3EBvDZrbrMPNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLdOj2zsbaWcZ/xOkaL3AVpEUEQCNy3078dgpRz+ICED4Y3Uc
	OSg0p8LhjsKsq0NIGAMPz4taFhrhfMGHLSAE9rNZQXYLbi2pcz1dhKjYUjCM2D1IVD3r1Xl+vC0
	HPKwybFvFhrywfPay4g==
X-Google-Smtp-Source: AGHT+IF6tS2K+sHdcmYL2m3Gzf5P+hOD9oht3waH8CGyonRKx29wIX6mnYWr9P3YR2G4rkduuBWQ0BGNCYQ/n6g=
X-Received: from wmbgx3.prod.google.com ([2002:a05:600c:8583:b0:475:dca0:4de3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820c:b0:477:e70:592b with SMTP id 5b1f17b1804b1-4771e16e792mr30523355e9.2.1761741902165;
 Wed, 29 Oct 2025 05:45:02 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:45:01 +0000
In-Reply-To: <20251029073344.349341-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251029073344.349341-1-ojeda@kernel.org>
Message-ID: <aQIMTQZK49B1FbTA@google.com>
Subject: Re: [PATCH] rust: condvar: fix broken intra-doc link
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 29, 2025 at 08:33:44AM +0100, Miguel Ojeda wrote:
> The future move of pin-init to `syn` uncovers the following broken
> intra-doc link:
> 
>     error: unresolved link to `crate::pin_init`
>       --> rust/kernel/sync/condvar.rs:39:40
>        |
>     39 | /// instances is with the [`pin_init`](crate::pin_init!) and [`new_condvar`] macros.
>        |                                        ^^^^^^^^^^^^^^^^ no item named `pin_init` in module `kernel`
>        |
>        = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
>        = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> 
> Currently, when rendered, the link points to a literal `crate::pin_init!`
> URL.
> 
> Thus fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 129e97be8e28 ("rust: pin-init: fix documentation links")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
