Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407D342144
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900133; cv=none; b=s12bIbI8YfhurCoq0V8IxdjW7O/1X+6HJYUGmlQ3LM64Q6x6Tllhoj1z52DyZmQ5Rn5mdzsmZlVCUkF2E1ZJL1a3B89/+HwSFKQj66XEl8nuJOLrZhE0HFU6RXANXuXejMOtZt2c8ncK1A8vuT5diZIMRYQBiSguteIFRZH2MvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900133; c=relaxed/simple;
	bh=5G1toMb60JZ8rhjyNvtdhiquChUpbZo5oFeEGKhfiio=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ew490ERZSZwdiuiIg1eVy9/J2g8VSdQe/7Tyb77gj7hKuyQ4godvExXnLQljLZPn5lBbuBqjzI5GiFh5BKOYsheiHQYe7knOzZsz5x3qga3ViC+sKUSrErSLQ/0tpcR6PPvkdD/7RbParF2U9mCm7GJxW6NFRIMFEpSG33HhUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fUOwmOs4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fUOwmOs4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430fcfe4494so5222013f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768900130; x=1769504930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0gC0kf1LN2c3lXGpvzmQRYw5J4jv726UtOthXTVGD8=;
        b=fUOwmOs4FXe42z4jAd9oYFA/R5DmZval4lCtHOSUJyaRQ+QKRmDHBuT8s030EHooWQ
         czp4BkGo6A1kL/+PXECmWPgo5931noHqweN4Tdn3S7YAZddi4RY61pQJxVZWMYIIMnR0
         MJC0m0NYdjdx/T5SOaADwZjNHnZHRp4fGkNEm7DoR3hL3S0cEy/krlTrMnRyiJLthU60
         M0wnBI3lb0YRMbCVYGuABxQUdbrgrmEQ8IcETqWwuJOCo9oFkMe1ev0q9HmCIP+LmU3n
         XfA5FmrvOtALpqRFh15obYs7YUGAdFVEsqxkjvjL0tagwU2OD1zdKjRDCilhKDLOPW0v
         zEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900130; x=1769504930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0gC0kf1LN2c3lXGpvzmQRYw5J4jv726UtOthXTVGD8=;
        b=vNWXYMwryIa5wShNPmCb6h6tAPq9F7zsBKTqmVN6QmAo16gWUMGWPFNzKn00p0LMNg
         QLemCJ4qF0GP0kEJHfFT8tEy7EvkwWcOQwOxQ+bic7T8dOImvC+X8URc1TOkGehA4XCW
         qLtmE+d/Ok8mvJVo/ZuwZPsrtJLVTaOU3jb6LAZ2pLH5zkE3mkqQZhWRiiTTJOcAZtU9
         FParywjfbnoFHxlbyqvXeRJNWVuxrzrOnPyvWK6PhcgfhCjczSTMCTUlhxgq3uRh3xPw
         ph57icRC0nRsOaGdTaU+01eWWBAw/lM+EXr3UaoRgjlqe004xBX018PRUvmpOr6y33oy
         hYbw==
X-Forwarded-Encrypted: i=1; AJvYcCWShyb0heopszzWb8tR2Dtbet0MoA0WiiiC9C/O2vXuFDjszkCs5Bt1aPGa2YjNUOmcif/6nBfGpqHYMr0rRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvMgdP/OEqDCx04pkgHuh44CExcrijJbbUaPvsRB7mENBYV1Z
	jKUDZuKHiusWok2F4fe54bJ6+vU3iA6eIE9rObu3EWoHDQ2C5Fpum54A786MaUgOVTa4OOrfLE1
	qAPU/AFDRNtOlRnKGGw==
X-Received: from wrbhb6.prod.google.com ([2002:a05:6000:4906:b0:434:3054:ca87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1861:b0:432:dd71:8f2c with SMTP id ffacd0b85a97d-4356a03321dmr19272507f8f.10.1768900130207;
 Tue, 20 Jan 2026 01:08:50 -0800 (PST)
Date: Tue, 20 Jan 2026 09:08:49 +0000
In-Reply-To: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Message-ID: <aW9GIafnsiCVnUbD@google.com>
Subject: Re: [PATCH v2] drm/tyr: use read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, gary@garyguo.net
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 12:26:45PM -0800, Deborah Brouwer wrote:
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were not
> available in Rust at the time.
> 
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
> 
> This avoids unnecessary delays on start-up.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next, thanks!
