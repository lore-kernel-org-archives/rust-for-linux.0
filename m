Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006B2BDC2A
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941133; cv=none; b=aM/BkhqsowU65evgVEBYo87Twjslz2hvVndLuszi5BTQrltpK5T8g0Kk0XvX/b94zlzFU0AYzeY+1exBB2fsAEiJF3IH+qFKqTeckp2IqoZiT6tgcWdP1phW+Ujqju8s7hCU2a0OL26oz2SfObx/XqHHOTI7frjFWU3QAG1o288=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941133; c=relaxed/simple;
	bh=uFCQkqaDqxzWRXeqursEtkXC8InvxKjCAxBAsyErIrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f24qLDUM1jAOEX6DZ4+l/90CXXMe956sZxPPNebE4YuUcPfMvlA5SO9aOfC21TJLTfxPsFutz6FdBdzUvOiI8faaTQKIaA5O7mA3EmaFPvGbleeFq4WX9uUU59HAmv/9V+xJNJomrzzjo19CNVv7UifOhWZYjE0sLWSP1MKAq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KzHXsBRN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KzHXsBRN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eeafd4882so1595ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759941129; x=1760545929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe0JG+T87ZxryLGwcr3JQ+tSMOZN1k2GavGauckPJG4=;
        b=KzHXsBRNRcfHADcpSNxCFEtZ3gGQDPnwUk5Wl2d4EjjSouigVZxHg8TgM4PRx7hdeb
         DKSQtLb4TTu3+YTbpxfWsEXic2QtqQ6o8aE8K6wLatS+su4XO3ypEQDXemDIGn7jX9Bp
         URjlTxuGuBs5JkDJrwC+FO5sLIljvtwjeZPM5scEtlUlauvTJciAQkOuhKNG7NSNfS/V
         NUeXp6D0E8jATbdV9LOSengyvpf/jkK0N+Hpjv2HwCN3CdGWUoo2U7IwSkZdRMC3sIAT
         ZifVF5KpJjcC3Vbkrf8PnsWucQ11QUOU4IHPLkO3h0TB6zKbJ5nHRchtaAat1bDmUa63
         UbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941129; x=1760545929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe0JG+T87ZxryLGwcr3JQ+tSMOZN1k2GavGauckPJG4=;
        b=Di9oeOwWlkG+kAoj3pjtQJzQlpRJsISxBymc6MJa3U/j9Ev/fpMc4JrB0hkbe5tEou
         SF2UR5O2sEBQF2duQvveX9f0vIcZvd5GxibnoTAvx5x4x1XyTldO+88YOvNliO7sueEU
         H0xfaoa/28JFlLB7VdFCfaqlovS9ymoVqBcz0vJ6iNx/dQrgoxDe9PenLCBvkcYoUlQD
         0ljHwBXvvQP40paRFLhk6XdPCudPaOLulo6RWROICZWBLi4wh5RsooysLCj/2BCR1HT1
         LkDH/McGCAGRWWpZb7c2BB0NZzB/PfK6vZNuFHl5l00hqr9O+hIpJXDYR5v5GIKdMDPT
         PyLg==
X-Forwarded-Encrypted: i=1; AJvYcCXvgdRHTV4G8hlvWYR4cSs6i/QzdF2khwKDoYmb9YyxgGas0/T9/CqJhAR0MFLSgQBSl9SK07fmWLrmpi9Xvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBU3AJENpOATVeGNbApkLiIirmzHitpTzEBx950FD0bsYp686
	LfiFxDr5j1Kd80ZYyAa402ryPfSZ+FcbzvXuLVYIQwl4MqMcs8PpIVTON3TL7zGrYg==
X-Gm-Gg: ASbGncvi03TJNTLd57ILM5+agU0B/ftoQx/68ctJzB+lZUPtbIEY4K3TlAZLcK+GNt9
	G1zeyfBKAbjWd+2F82RLhV2NeLB0iRCyCBL8woHnpQQEs6DcH/Xu79BMOOVz5fZ40j2+T8nJgyY
	ZbzfBdp8302wiHMK+tCez/pCtC0OcEQ3sn+CbkeQyYhB4brfFK4LI8TNHMCFUCSgdBDHEuJPbxZ
	2n24Llbg3+Cz+r3cCbTMgP0/tCUxNZv1hdZUbaC+2I33Obn5NChMu/MTpdbH0+Js6W4k1qCs6nD
	gkvufcwr1u6sI8pAk4cibXQ8EBZxSRvWrp0On5BvRGVEAV6huPhwzzdtGrri8DceSO18LU4Oqg1
	76fVxJ4vG+Up5cCQ0UqGOlI/I2HjHOvoJV0Egm0cnfnfB6QLUf8+y1zB7moCpJH1DkW7VXHGeNg
	8tF3kfk8zJ3SgK0vjVVkKFw7xbWWDqUYoiLQU3wQDhMG9bHf97GyC3wb6MGKYP9cwqotRUzPxga
	Q==
X-Google-Smtp-Source: AGHT+IE4UeBVhlmr8nyjA+3MAY4U2585r8312anVnyz7SFqd1+ILwooYTIzTvCfZjIwwJ3yE1VoqjA==
X-Received: by 2002:a17:902:cf03:b0:271:9873:80d9 with SMTP id d9443c01a7336-29027620d94mr5687375ad.7.1759941128492;
        Wed, 08 Oct 2025 09:32:08 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51116b57sm3952329a91.15.2025.10.08.09.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:32:07 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:32:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust_binder: freeze_notif_done should resend if
 wrong state
Message-ID: <aOaSA0dPnY2I4a_D@google.com>
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-1-5376bd64fb59@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-binder-freeze-v2-1-5376bd64fb59@google.com>

On Tue, Oct 07, 2025 at 09:39:51AM +0000, Alice Ryhl wrote:
> Consider the following scenario:
> 1. A freeze notification is delivered to thread 1.
> 2. The process becomes frozen or unfrozen.
> 3. The message for step 2 is delivered to thread 2 and ignored because
>    there is already a pending notification from step 1.
> 4. Thread 1 acknowledges the notification from step 1.
> In this case, step 4 should ensure that the message ignored in step 3 is
> resent as it can now be delivered.

hmmm, I wonder what happens with 3 threads involved where the state goes
back to the (unconsumed) initial freeze notification. Userspace will
probably see two separate notifications of the same state?

> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/freeze.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
> index e68c3c8bc55a203c32261c23915d8c427569e3b0..74bebb8d4d9b24860eed34363ce69b1c6df58028 100644
> --- a/drivers/android/binder/freeze.rs
> +++ b/drivers/android/binder/freeze.rs
> @@ -245,8 +245,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
>                  );
>                  return Err(EINVAL);
>              }
> -            if freeze.is_clearing {
> -                // Immediately send another FreezeMessage for BR_CLEAR_FREEZE_NOTIFICATION_DONE.
> +            let is_frozen = freeze.node.owner.inner.lock().is_frozen;
> +            if freeze.is_clearing || freeze.last_is_frozen != Some(is_frozen) {
> +                // Immediately send another FreezeMessage.
>                  clear_msg = Some(FreezeMessage::init(alloc, cookie));
>              }
>              freeze.is_pending = false;
> 
> -- 
> 2.51.0.618.g983fd99d29-goog
> 

Acked-by: Carlos Llamas <cmllamas@google.com>
