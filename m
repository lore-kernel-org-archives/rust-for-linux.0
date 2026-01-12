Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC119067C
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209869; cv=none; b=e1LwcPGq9lZDddkcy8HiC9oJUo6RlhVCBmgJylLV72s8tUF+Eoo8TPbEmVG1JEMdFwWLnTKRvoF7SBXXOL/onJcNWvTZUwm++T9wwLBRTpzGgGfEth1vg/QItHhMGJj2HdsxDLbf45zEOVY9QCq/TqrYuZHPh8tsbWqhsqha2Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209869; c=relaxed/simple;
	bh=plDEP1QHSI+RMh6t6UEps+xsg2EdBZq9Yuwj/Uklkbs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JqETuf9zayAqIf54XR8/zKoJ9aC0mRZ4V7gSC35YGrIYXyV6bBPo7Yd4e9WT4N9EIs0ddSpKHXkUXwVddz/4LFSgOvhTV1NA9h181rAz0tr/HgQrUu09k65OamuwOrSzj/HP2mo0zucFFMfnhBuWClTwD1m1vI3Z64T40RIzsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zmiKO+rJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zmiKO+rJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso54527805e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768209866; x=1768814666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzQ0oRZWQchLKIBnTW5O8Dv629b2eiX2V03W1bYmo7o=;
        b=zmiKO+rJEAlgh7jJqksJy3iGneWk54KRpMkAJTzl4qpm+i0HmYv2eceeblD4r0UoXq
         fCttOC4T65OQ0z7MWVKusVWkyoe4l1odfEkfM9LceYg4B39iwrVL4dzLFCstoyCYcyZp
         h38XulxxonzntGf84NJd66eMoR8dNtWVE+IASDPYa5o8nFFYmyaPr975Kq0QfLDAHKli
         8yogFqpQKVCW6Nx9U022281Tcr1/B+xkX+YJekzxzMNbc3oDFkjr//BAcAh38jh9NVZc
         7BAS2UfSz0aJkzTkD/H2DQ5/of1Njkl6GYCaGCoISnrLoHSRpDs+GKH0QCD3E6+3OdOx
         JdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209866; x=1768814666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzQ0oRZWQchLKIBnTW5O8Dv629b2eiX2V03W1bYmo7o=;
        b=XhmuiByqTqM9Gcx6J2lp4MDOyUWkxVfaY9oKWICrNVo1xK9U2kYNhs1YWlxWApLrwY
         X/u1Rh4x7PP7fXUBjiJCoZCkcLzTI4xY+/S9kBjKF23vg48WxO0dQzyAEyxrgQ3qqmn+
         wTw+jTvl0vkFvsyTqnncgflueni4VEIg/EFgz5OArkK95YsvpqyQLnOvUgkzWxiEdGWy
         zEo4y/QNBasQdpKfLtX19eb8LfPk3Q7mdkLsCsp0Rnye3mIS+FWytUx4GfkGyf782BL/
         tkIrDW7irPozsoxKl/1cZBEuObLnoysKFr2RQTz1ZtUG7cT7a5nDnMqAcIFPQgfLlBw1
         GjXw==
X-Forwarded-Encrypted: i=1; AJvYcCVYRmQxKqIqG1J7nH75KbiAR2tQblbLFYXKK7e9QFAWPfudQWGZQn54W2T7EMIh+/kSn2b/q8uQ0MRtHIi0iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/sEJ3HkCEmB0/kHfLeDdG2DHesDnHKPXe5fRHyChlKtPUKkCT
	5xNhekbIJyXwDvbF4xgmjc2UbAEI76o/tSFg7d316/weYD0Cd0uucJe26CAO6JRBC0Vhzrdarra
	AtelEoD3v06dKGLT2aw==
X-Google-Smtp-Source: AGHT+IGQur8AVW27Y86o/onzlcI/IDAyY89mC+Ubn26hQ/YoWHNhcqKiTav17VH3Oyj4/6VbzzJNxvDcyaSIVR4=
X-Received: from wmbh14.prod.google.com ([2002:a05:600c:a10e:b0:47a:916c:e045])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr198233175e9.33.1768209866482;
 Mon, 12 Jan 2026 01:24:26 -0800 (PST)
Date: Mon, 12 Jan 2026 09:24:25 +0000
In-Reply-To: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
Message-ID: <aWS9yf1iwWW-O0y6@google.com>
Subject: Re: [PATCH v3 RESEND] rust: cpumask: rename methods of Cpumask for
 clarity and consistency
From: Alice Ryhl <aliceryhl@google.com>
To: Yilin Chen <1479826151@qq.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 12, 2026 at 04:00:47PM +0800, Yilin Chen wrote:
> Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
> align with the established naming convention for constructing types
> from raw pointers in the kernel's Rust codebase.
> 
> Signed-off-by: Yilin Chen <1479826151@qq.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!
