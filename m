Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A6F288C0A
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132046; cv=none; b=VQ16Tf/dxcVtJG8G276FkBrgw4whL4+STP2xGCNRuCotQA9dW1NfNBKZLF5pqn9iQ0k16hrB6RvdXEyeQsRqeLKhtXGHZApbMW/fHw0d1ZYDi74P5VEAPLO74OMk/duS3EqWdSBdYQiJR7pALQc0cHREnOWosHmzMcCVjB4228Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132046; c=relaxed/simple;
	bh=/EjNQfLXtWWvihGRRRWbmenaK49RjMI0iONXWfR1iUY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O6fnacCacthd5dIL5czqQISihMK5uOhclEJfZUBf4dnzzOE8stnKkPsg/wyVcACxHjT9TYqMfb4qkMWByMmSUnnCINa9608HKXF9VJ0/ffLDg02nG0srDTQxKsFy0Yl9uqgYnVw2t48XRicfQSCWS2IDf+XtdBi24IgKvsYXThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kL6r7Zez; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kL6r7Zez"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so289429f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752132043; x=1752736843; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydBBirm2pVDFh/qwR+SLuObFjEFtWveCSkNHnXCNOF8=;
        b=kL6r7Zezw1A0+2L8vz6/b9dNCSlsWJvFpeFxNzA0OH9LdrW9+n2Pwg0iXwToalhX7K
         wlXjE+gF1QWgZ8a81t7Fq2cvoPZvdFOAsA+YCSXI4nVxOK99YTGA1YB7+8dxo+775MXk
         WQX+oV8RLGAmdVyUekYXXESDdAXffiIwfwIJo67Ju7oxUudHPLUmHVW49ajYOdxyRSNT
         Pk4LEfaQ4W1Puf3ASmG565y79GIOoeM/vBR7ja9d1CKyMBwXmc9jPlLTY8Y0xV41SEz2
         s1D1IVwBRDaswI+4rIl09eTcimT9nbvd8D018u0N3ET86XDSdstiuhuUYZNEi1nPqE3R
         DfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132043; x=1752736843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydBBirm2pVDFh/qwR+SLuObFjEFtWveCSkNHnXCNOF8=;
        b=UZKQaClo9xCc7wX5AQM6Ls/EDCqn+yqEGcOEvsod1bH2Zt3rC1jFrkyGQVpelpqi9H
         7ryjqpXjLYqjHa2NBnBDrIguMkQU6Y4ACWlyz1Dn2KCCg8lQ7ShoAY7IScPhjTL4y3Wj
         jYswG3gQrE3WOvovN+m0bbgF5YwuRqintNGva0nI1C1xdzo7sBG2kvs/ENLN5F+hIpVE
         87qb1hb/IVnrWDGLR6K7I1WWY+0LQE1mheG9YwPSA1++hDibSpfKWk2p/FP5THse+I1N
         00UieNM1HksBkiINifm6vFmPRLTVMFDD3bjaMxDRoLz7ve4Mc+kARECvhfxnB7LKfSaV
         q6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrtX3A3cDZGCmhg0GySPK856jJqgfasthTNvx+5TUuPlAFBzSPJZCWH3LvYVUS/jE+z7hl0dZV4mXu2TuNEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTwk1U7WoG3WM+GwnGMBBgZjZRCqwl7shJmTnNpoIhonQWK36
	yKM7V+MI+rkCVp0YzOyvynSeBNB7ie68Jc7/lvlc0Z3RbyiwEXTy5k4kq7iOFr4cwsr7j52sMxU
	i0B8UsUnOvMkzTTNHRQ==
X-Google-Smtp-Source: AGHT+IFR5Cy+iFU2VK2DkntUzGaoLVfXLIySQ/qebG+LUIw2knKi8RgFZEcMU2c6gIa5pjcK9SeZrnIeQNU3on8=
X-Received: from wrbay29.prod.google.com ([2002:a5d:6f1d:0:b0:3a5:aed9:81ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:210a:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3b5e8680bd5mr1253537f8f.24.1752132043449;
 Thu, 10 Jul 2025 00:20:43 -0700 (PDT)
Date: Thu, 10 Jul 2025 07:20:42 +0000
In-Reply-To: <20250709-init-remove-old-workaround-v1-1-a922d32338d2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709-init-remove-old-workaround-v1-1-a922d32338d2@gmail.com>
Message-ID: <aG9pytBqn3maW560@google.com>
Subject: Re: [PATCH] rust: init: remove old workaround
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 09, 2025 at 06:34:33PM -0400, Tamir Duberstein wrote:
> `Error::from_errno` is `pub` since commit 5ed147473458 ("rust: error:
> make conversion functions public"), thus remove this workaround which is
> no longer needed.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Huh. We should just have made it `pub` right away when we felt the need
to add this workaround.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
