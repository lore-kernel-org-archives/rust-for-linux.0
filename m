Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC751A9F88
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231210; cv=none; b=DRL07GAOl3YzjdS2LlwkAQTT4pRobvKANFa/Jk5DQRlXEUWJWcAmWH+ThKLaf01uBV/ibe/ufmB0DzAB0C+78cmJhy4iaWTneF9AIWJPoZGOuLMP/ogfl3JS6OFMzbbnn4dJD+gCBTq37ZRGPCRX/Aw/O7IgujS6nniBUq9f0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231210; c=relaxed/simple;
	bh=oUjRjWRxo+gphPN2Ko6xQrzNtIVpaWE4lyOQdRwGEFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UwyK+n8aF+JR4B7lTAYF915QzWp0ekGcSc4h6IJtayDDyRko8I36iHfq1DDql1b0Qmb0Z5dITGk2JGFewhA2cJPXVK0KSKRwDaGw+zyq43nqPlEzCkt3taeIt2I5m4hj91SKiQYu22/jQFS/PVkDLlNphJ6zCGCQaWSzkWr+Ww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k/tvYVrV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k/tvYVrV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so14122235e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231208; x=1771836008; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TO2acffBthIDSTFjL+/ZA/O/dcuvRn5M/ufZQEwURoE=;
        b=k/tvYVrV3D/j1PIr034DF1UloMA7zgafphG+FdW6L2T0AFfMuQtePcFmZRg2ue28YH
         sXmxfbVltXIUWXZVIXuxW32uuoqoc3FHkNT5cfEAxf0TGOrrDKi3tC4WvZZufEladOqk
         ZrbTnYekEKSzlXOvgnKO1VT8ViSbpykmlreSrfrmHCBOlUu9kxcoMB6XrKCCkEcmNtpa
         x+n8ob868zWvNhBWcXFIooL/8AyAgHJkGWSO+/rmMUZ+iwNugxYJVIk+/glesRG0Bz0p
         hU5sv+jf1r/BbGj0GJi0ZcvFGf2PMkwB0SE7tHwEPWIZ5obTmKra+VmLNm/2kJGJNuNv
         JgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231208; x=1771836008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TO2acffBthIDSTFjL+/ZA/O/dcuvRn5M/ufZQEwURoE=;
        b=WTMCUhNhnBgScwYfCWyQDP2VgGHf4eYXSXvg40ArAsi4d6CjxmA357eaA8hIIm33il
         F3wkPMXEAnDhdUuN46Gg9fMv8nTQpz5jjRYqiIxfMFRLTnP3FVP/0s0JbXyDsPF3Ucbw
         Ay2AjgUPBQktK1lRvZVTvkzLcK9KmZaayCROF7ccDWTrcLEdU7MKFxxsSzjhWCB9XINd
         VvVz3kiNY19MEv9ntDEgOGATvFFRJI8C19usJWEfNB9pNYF6snjxQU7raHj+pF0HzcQw
         1cho//nKMIS8Y7rfxKkgD4/xIzkpWdmbCttUn45CXS586WjXoFG3dg6HH4HmQBZzZSl2
         28Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXdtpMDIkjUf9mfc/oIP+klk43/7YbvA6E/h7sgcnpf13FbdRCtCRMsnmPaZPHYcIzL8SQxL2GxnQ5a/Ys7xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPibB/dARBaA6CDGykr2k1y2LgUiPQ6EWTyn7imnLO/fjXSKFV
	apCF2XXa1yCN3JDs5obTxTC+m1m2sMHSKubfoizyrw6i4DH5swInXn5zBmqQahxLn/EBtLyerre
	ObNYgnFGKZZqOV0/bAA==
X-Received: from wmbjd20.prod.google.com ([2002:a05:600c:68d4:b0:482:ef67:407f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8709:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-48379bd731emr120608095e9.19.1771231207777;
 Mon, 16 Feb 2026 00:40:07 -0800 (PST)
Date: Mon, 16 Feb 2026 08:40:06 +0000
In-Reply-To: <DGFVQ8Y1LLY1.SKXJK85IK4JH@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in> <DGFVQ8Y1LLY1.SKXJK85IK4JH@kernel.org>
Message-ID: <aZLX5uqKbHwWJKqN@google.com>
Subject: Re: [PATCH v5 0/3] rust: alloc: add KVVec shrinking method
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, shivamkalra98@zohomail.in, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 11:13:15PM +0100, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 9:35 PM CET, Shivam Kalra via B4 Relay wrote:
> > Shivam Kalra (3):
> >       rust: kvec: implement shrink_to for KVVec
> >       rust: alloc: add KUnit tests for KVVec shrink_to
> 
> Greg, Alice, I assume you want to take this through the Android tree?

Binder usually goes through char-misc, and yes I believe that would be
the simplest.

> With the comments in patch 2 addressed,
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks!
