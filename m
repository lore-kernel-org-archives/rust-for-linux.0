Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C83806A7
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683303; cv=none; b=bszxr4Q46DqzC+5KtNf4usbzBJ9GGu1XUoyo1vZjKOalbC6yvEO46Zeesyb7dQ4SbIda6esElCpMovV3kZiPsG0ZOdGi0y/hR1Pb1tV9Vgk1SGcVT+vhvv52JkEbPBFiQiiojVqf/ESZtmJh+8vVqAZsMZxLM2Y57Ce+ovEpazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683303; c=relaxed/simple;
	bh=1tfUCCYgZb4uZfs+PaogHdvmhz6596lAmbpmFuRcqYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pHZiSlEZVwahdK8Ccq9S2BBCdbFMsD5a5jJ48SNWeDgYLkAlJZAzqq4pgx8VtavIdbmNctYoSANcvgwR/6HbGt10yibu15yGnUc0GA6Ep4AEj/VywEg/4bYPfKLgf8QQNvqUCQhGtostWZdIM79YLkiWubeKNSvDY4wUFuaI4aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vjJTioCM; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vjJTioCM"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee1fe7b24so6835325e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769683300; x=1770288100; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SugG/T0IWIXxTiJpK1ZEQnI62y4cdXEx6zJHCxNGAko=;
        b=vjJTioCMu6BzQKY8XKjf0hxJM+GBZtzk6PpSrhvYpvZPBLlNuXDB0ajMeh9M3WO15i
         HqiWeV1FKhS4+xh2oXp6J915l/IB2eru40niTLwxC1enBc1f6wo3HMtIiAQvv90p5UU0
         0oWc9PGeDFzlsLe4e4WGXCUesVNVSNSswnP9VCGKrXrIcvJVgieqE/O6vehtxQ2+HYGQ
         jXg0zC5nIbosgN8khbk9cpptYq74YO9f3eOhjlSlhoixvXnNeFHIJSXEu0RwdpPf+G3K
         qUZJE9ZO3KOHtQhiBKatLPIyCK2KrUGM/CmR3UQcomM8bncRAMm8mHuMhu0wxjRfNXpW
         cLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683300; x=1770288100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SugG/T0IWIXxTiJpK1ZEQnI62y4cdXEx6zJHCxNGAko=;
        b=cBx8MHxzcrWTL1sWuLRMAkSLFZoE7tQXxIpmxQmDNd6yJIaeoIWB/2Mb+SlNqS1HD2
         oTcIMj1bv2+3yVofkKTdQ0RqKsOeFfiNsWubHNkrvo3FTF+ocDLtsC8qgSY9ndJ/rMtp
         Z3QQdeRWsciM147ORdLsNfdJqZJPrkCmGL/waq6qOV2Rzzr6Y0hz52ivp28zkJ0Qx0NW
         jv3eYrhAdMoNIRWl1YFYYnmJLM/uXeXMm8VmQUANyuqlDFYgcvOdLGnZ559OiqnJjdTi
         F4r1gLz+HxKcOdi/gu0tTch7kGpFr2EgKzIEfwPYCwRQ0ovKjcsImT/v/C/ndLX39XKB
         /StQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/nFhLWraT/J3Nl/qWtBC2zh1I+v6EnxYTfHjuksbuGD5whAiJy8oivo0AnDMbFEGSajUFy5KVI+tbEO6+hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KT1X6bkLASgCnSejJpbb2EwXGFxaRiz2cYmPFAAShLuV3SwL
	xIS7WwoLi+FQAYRAh6nm0F9I2tFNGcFSfaUKTWJaI3snMso3S3RMuCNd3XdbRyDYoEro8cDa3mB
	+BgZ+n6OUk7jle0fGaA==
X-Received: from wmok20.prod.google.com ([2002:a05:600c:4794:b0:480:680f:94dd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6444:10b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-48069c0fec0mr87626455e9.5.1769683300636;
 Thu, 29 Jan 2026 02:41:40 -0800 (PST)
Date: Thu, 29 Jan 2026 10:41:39 +0000
In-Reply-To: <20260129084119.32994-2-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129084119.32994-1-jongan.kim@lge.com> <20260129084119.32994-2-jongan.kim@lge.com>
Message-ID: <aXs5Y3xAFKyZr6nd@google.com>
Subject: Re: [PATCH v2 1/3] binder: handle PID namespace conversion for freeze operation
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, tkjos@android.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yury.norov@gmail.com, vitaly.wool@konsulko.se, tamird@gmail.com, 
	viresh.kumar@linaro.org, daniel.almeida@collabora.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	heesu0025.kim@lge.com, ht.hong@lge.com, jungsu.hwang@lge.com, 
	kernel-team@android.com, sanghun.lee@lge.com, seulgi.lee@lge.com, 
	sunghoon.kim@lge.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 29, 2026 at 05:41:17PM +0900, jongan.kim@lge.com wrote:
> From: JongAn Kim <jongan.kim@lge.com>
> 
> Currently, when a freeze is attempted from a non-init PID namespace,
> there is a possibility that the wrong process in the init namespace
> may be frozen due to PID collision across namespaces.
> 
> For example, if a container with PID namespace has a process with
> PID 100 (which maps to PID 5000 in init namespace), attempting to
> freeze PID 100 from the container could incorrectly match a different
> process with PID 100 in the init namespace.
> 
> This patch fixes the issue by:
> 1. Converting the caller's PID from their namespace to init namespace
> 2. Matching against binder_proc->pid (which stores init namespace TGID)
> 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> 
> This change ensures correct PID handling when binder freeze occurs in
> non-init PID namespace.
> 
> Signed-off-by: JongAn Kim <jongan.kim@lge.com>

> +	rcu_read_lock();
> +	task = pid_task(find_vpid(pid), PIDTYPE_PID);
> +	init_ns_pid = task ? task_tgid_nr_ns(task, &init_pid_ns) : -ESRCH;

You know this is making me think ... here we are obtaining a pointer to
the `struct task_struct`, then we convert it to a pid, and we compare
with the pid of the binder_proc's task.

Why not just outright compare the `struct task_struct` pointers?

Alice
