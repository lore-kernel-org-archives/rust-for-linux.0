Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB82E7F25
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428740; cv=none; b=Tl5tztKRbS8ZTmAwmmuYEPB8xdtBOEjiP//1mE6mGhVNrXtyzT3f3EaqjpNQJF3MiHcBRCJ+/ekI9Gajrt60JeulHw4sCfvC9J6FzIsXc8zsQKQm/C7PiXWU1tJ8B6yr0wP6ddXYdLtAFOUsrnVBfxqHVHH9RZAWtsQDzZ+3IaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428740; c=relaxed/simple;
	bh=8PJUiAxMn07nrgsxR/0urCL5MfqhEEgeM7+TpUdG1lc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S6CbwAVSNXSvBwcwgBjMCCiU+akuNjgt1ijNzcqt8olEzYVgFiDJvDWiCJvZa90ixS5F1MhG4pbfWCr2BZPIhc2jokhwtao2wkN9QppLCDvA0M4iaUNRuo5tDQ8/W9GhNMkjRn+poAPD1JnI66xLDfgtBAcAglJxiQ9yQycSL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WEtydfwk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WEtydfwk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47113538d8cso3974695e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762428737; x=1763033537; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pI4KxVsOrU0xDYslR/Hq61cmr/c2s2itghpzGG80OZ4=;
        b=WEtydfwkKxsAFoU83hSSnaJ+83+TftsyfCQYOv2ZpV5HBDnMX6O1ZTT27qQoqH/S9h
         XFSA9/C8iZhoM2jtRDdeiVDCsj+OMKh6H04mkglfBrYJrs4O2eBs3T5MQvfjB84nZBQg
         ZZJMChybdAVxElm7N6wGCnGPu6CWP7h9LM9SvTXfltlCQhzXfUXiXMVxa/TEJUNyTTvF
         vgVNsd5EwoEBQXzcjY7RMWmYY2QJaXR9I4QDHgdrew7XYFS1tFXN1djOfPboNJkslqG2
         c7jdhCBLcHA9dXWnCb4SZ2jon/rKZqCdQdQ2XguCOHKM67alcza/UfEr62/ZcjRzJlWy
         A9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428737; x=1763033537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pI4KxVsOrU0xDYslR/Hq61cmr/c2s2itghpzGG80OZ4=;
        b=ppQJJ+o5gNvQwAWdqX5dHVubVVNam+CHObsR5kvgupAZRTMWRHM9RGDOLyRL5L0qO3
         KCrAWj1kzWWZKR4v6/n+MehC8lzMaCUlcTIa/qEE9KBSRAAya+eQeHhi4aes/zI6izMV
         Rv/Em9olHC+V7daFaHxwFik3Xx50Nuzkd4FqK0Jf1/1x4DKSHqe8RRGEwfO6AD60HYhr
         piJS1xD4QPjlsSDkbvcWnIAR8Kf4EwdE//eIBiHNQWlnj33hjwtLb+f27nfStieP3/sL
         mEa+lPwd5FnDLszkxgxGhRx3TU3SvgC3aiPg1xQUor2BfqPUebIgt5xpggeaqOTsB/q3
         EuKw==
X-Forwarded-Encrypted: i=1; AJvYcCXhhmPpy9sR3ISRcViLsb2J+4e03WC3R+ZKoxAZng337dXKxtEtmWPp5k9ob9WGHYJrMjV7Q4MBE5UaZMXgPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqnGzzU28ZJ9rJK9NJvVBPWWYO+Kjq96wBm2tmhreI8ceoR7o
	IPInTlROGSDTN5sha3xKQww48JeZmfQWUgCPD6X/16cuzhoxmGAUoK5ARMMPj8hxFsRXZ65liNm
	HSKhcP71yVy5SbuycRQ==
X-Google-Smtp-Source: AGHT+IHHL7QNWakLO+U/Vin4WQXNt+KlP2Dp2qlMK/OrLhzbZjzGufGkPNGVdcItr6+Ft7e8srNqVj1i7yw3M3k=
X-Received: from wmco20.prod.google.com ([2002:a05:600c:a314:b0:477:54e1:e29e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5252:b0:477:be4:7a52 with SMTP id 5b1f17b1804b1-4775ce34dc4mr51049625e9.39.1762428737530;
 Thu, 06 Nov 2025 03:32:17 -0800 (PST)
Date: Thu, 6 Nov 2025 11:32:16 +0000
In-Reply-To: <20251106112015.214867-1-m18080292938@163.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106112015.214867-1-m18080292938@163.com>
Message-ID: <aQyHQFYGTodXADNU@google.com>
Subject: Re: [PATCH] rust: correct documentation comment for rbtree cursor
 peek_next method
From: Alice Ryhl <aliceryhl@google.com>
To: Hang Shu <m18080292938@163.com>
Cc: ojeda@kernel.org, Hang Shu <hangshu847@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 06, 2025 at 11:20:14AM +0000, Hang Shu wrote:
> From: Hang Shu <hangshu847@gmail.com>
> 
> The peek_next method's doc comment incorrectly stated it accesses the
> "previous" node when it actually accesses the next node. This commit
> fixes the documentation to accurately reflect the method's behavior.
> 
> Signed-off-by: Hang Shu <hangshu847@gmail.com>

Thanks.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

This should probably have a fixes tag:

Fixes: 98c14e40e07a ("rust: rbtree: add cursor")

Alice
