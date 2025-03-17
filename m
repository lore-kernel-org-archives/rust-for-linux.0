Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151A1ACED7
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207778; cv=none; b=jFBPfm2qeGKX6FLOXwbB+Ph/eCgBywRsiZEI+b3ERhHhvj/ux5UursKJa//GGIJrXQ2YcNbekqrXIqo2fo/QxgazgQXFGa8OFN/ordLAb/VqGysgQzgXm4wWGuH1PLOQHCnG7sDsyjoenKqE8TisNwkVLgUEax1RqfPnBbd+ey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207778; c=relaxed/simple;
	bh=fNEj1B6FIZbVbIasOCYy/xUMqZR0pY2ne65RdVXEeIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WMhu4wH78aGyUUmkXh/DDBbO/XHuR9Pa3iunWtpdjUDFLg9q3KK45QQAuMchI0Vx05klZrPE20erH6B3U7uLnZ3r37sJAEJWsq07doNbofRTuxQDkrbMNdVENJP4aFXuHKvgpwJ+TPHFNxtAUVW07k19x9iWfuQWWZxmRT7qt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lELSILt5; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lELSILt5"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912fc9861cso1918366f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207774; x=1742812574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUhUAeqcJmBiRZRyh0/Vw0HdjnmMKCHnzf4Mk2t/YdE=;
        b=lELSILt5Z4i0hYBBqhOxCKeEEYPb3J9nv1U1VloaGz+oAKjTNIso1NZv0hI/jcPewr
         HUDNsQuFaweNtiMVN4tIe3TfwvjUInodLES5UiPdQS2LjxB9ws6v+wA9uoXYm3hr/SBp
         TrjNbeIRgAptNO0N5Cu9DqzO4UYsH4YRzqYp8lvOhnwbpmwoKppnGwx30rE3hcAfsrKN
         09Fy5AQ8N3NhZ7dS2oOCO+XyIMPYZsT+lhKKSUpExzj2v0LPCLVJfIAhNFWdN4vQTcM4
         KNvqVsv7vhfVcnz77Rf9HfT6bkKI2bqX89l6RSUIENdi7Q2BikO2YKz8H/Wf3R+L4fFv
         GIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207774; x=1742812574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUhUAeqcJmBiRZRyh0/Vw0HdjnmMKCHnzf4Mk2t/YdE=;
        b=vcHcV60x0g6ptsmvwlz6DmhdRi9v/ddeE8N0UwEuJE5udQtJ0xj8E/Lr9QAqU9NGUs
         uks/D3uJBvZNavcPGG98CA5sRoX7vGWAwIW9Y80AM4bkbwKY+7Nta0dMMw8+Dck/oa2I
         BtRXxsph0nRx676JC/3nF+MJMYWDCWg6kAU8uVnS24oYpTl529cbN77LwIxsfDq/VhP+
         98inn/V9u8mti8WYaJsykqd7seCcXtDIr0tcf1Vnlj9nva7fN3vzfdV5LCek1jBpwKVN
         a1fNP/io69ZJM6rnM34hgq0lBZDTpGYT72x25x4cUsdAHQbPMjxnKAzzaT5R78XC5EOG
         pPWg==
X-Forwarded-Encrypted: i=1; AJvYcCUArpdH5icFjfJS6kRK3qO53D0B2N1jHLBs17rp13evpjE9Lytu/d++lK9e3/6T1dA1UIARzhiK8n2B5sH0vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJqkKbC6cAp3SpNvdmfe8ay7FL6CLniVGg+ccBoojJWsd/nXm
	FQO+dO+0owD6SNSolWizJJnUaLiOSGsS1Io+uUH56QFwcJZOfGp+1G4GUOM7vwdiE1o6hB4iyAx
	v17tCmJtrEYqf7A==
X-Google-Smtp-Source: AGHT+IEDRuT4jeF31APtVDRn+52dfI5qIO0NyZ4yyRRLaTH0XTmTrze1FXueNqyHRzGXRwMUpME0lNXtGmnrHxM=
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:43c:f256:f4b3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cf:0:b0:391:39bd:a361 with SMTP id ffacd0b85a97d-3971d520041mr10369056f8f.18.1742207774479;
 Mon, 17 Mar 2025 03:36:14 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:36:12 +0000
In-Reply-To: <20250315154436.65065-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250315154436.65065-1-dakr@kernel.org>
Message-ID: <Z9f7HEpqiMNnwsLQ@google.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, andrewjballance@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 15, 2025 at 04:43:01PM +0100, Danilo Krummrich wrote:
> Extend the safety requirements of set_len() to consider the case when
> the new length is smaller than the old length.
> 
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/kvec.rs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..8540d9e2b717 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
>      ///
>      /// - `new_len` must be less than or equal to [`Self::capacity`].
>      /// - If `new_len` is greater than `self.len`, all elements within the interval
> -    ///   [`self.len`,`new_len`) must be initialized.
> +    ///   [`self.len`,`new_len`) must be initialized,
> +    /// - if `new_len` is smaller than `self.len`, all elements within the interval
> +    ///   [`new_len`, `self.len`) must either be dropped or copied and taken ownership of.

This should not be a safety requirement. How about instead adding a
guarantee to the caller that the caller may safely take ownership of the
values?

Alice
