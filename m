Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF9279789
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432684; cv=none; b=PlmfaXyMAwqQrYNAu2gxG4/cDdmObzrPG7hba4BbtCd+0/uxR8an3VNTnX9+eTzidlAs32Aav8Pld6qxJdNLnl6QByujR2ys0mJafuaiZVsPFLBvO0N7eFFzbWmxOKVbo2mDJt+4X4S/HUvzryOmmRJmXk99Y/4qZvdo+eR0sO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432684; c=relaxed/simple;
	bh=5w3iOt7bx4YXe3uuZGSNrtCQB20LCWbDNaBLbSF/puo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uEt+PPi2qO9LsqPgr8brprTldRLoZcFYbVYtakXfKtDGsUbVYv6aw55QbRfe2FlUSUrTxe6B16XJXGi4A5uu/1z1k9wPh8cJdFv+lEU4lqOFEe8P/Ys8O9CUurUMPOzNFR13B/YL1OEdhW9phERyiQ4VN3oh+iyGvC+msZYGgDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oiarlWmS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oiarlWmS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so27295805e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748432681; x=1749037481; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YESEUHNULXjnKu632GnMNSEi7CRefD1s+NpQnb/WNfg=;
        b=oiarlWmSNnqq+ZKXlXCDsK89LbLyI8oI58y2Vm+ihgkKnVCdwGxJ6NRFX2tW3oImp/
         PBb+oBejls+8o1Erguti5kRYaZi1t/xYGV+UqW9qxQwwWGlhGjHUUw8y6zhc3jzhinuA
         eaH6DXQ64MVIZo1jyPSfEBcohDnZJsARt806yenyUFSeTEsmoEdKye8fvOkVOLlz4/xI
         qV9ZpUAtfSVMdEsC43yEeoc7P9pw5W3bmaTdgaF+lzdPKb2mW/Mc26VkcJuG43T8n5Aa
         +NiC0sYVBh0SZXrvd0j6AityOsZedslhxCOLZDSZYNnYowYGwQPr30th3MK2l8OLYsQF
         3cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748432681; x=1749037481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YESEUHNULXjnKu632GnMNSEi7CRefD1s+NpQnb/WNfg=;
        b=ai35cv9V9ep3P42IEY08uWnFquqejr8bSJVCq4CnUbHFL7Xcz9sMrGIl0vLN6yAj+s
         eiWzfEeWtJ39EBslVrDYUUU79XpfnM9O1ZkFPSfofo8wrdUPA96g2U0+UsSf/l98MYy5
         dkD1rGgjDN1acPTbOVaXT/Sge0ji5vDUgnOq9sPef+banScf7hYCy0p/lmqn6FvfTxrd
         YeCD7l5NDpJ1DckUB6Em1faWGv2s5aBwCZHNYRUec77m78WRrQSR/2c6lTaM5lmjKcyz
         zVUyVx9Xcc9KzM5eEKSDtbEpl46l+OTqc+rKhYij0nzWONxU91pcmVXzZOC9WiGwVqGV
         lYKg==
X-Forwarded-Encrypted: i=1; AJvYcCV8uozrc0cp5N8q/oHTmdqsgQlQ2CSPz3Yh+a1yrxR/LSkzvoc2QmzyZrMJv4SS/RvdNvATDUQ41AfBJUyNUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYvwI6EA/QiTCwEBtaCEX0BuXDw0DDj6klbf+NIYWpLBh8gcF
	NmM0Vow15i02NpIH07IGL987EQb9D1xJil35bLUxgSm/aBpzuOLVWkaVlgePNDUND+Guh1SNFSi
	DNJ4dOfDTMGVNFbEycw==
X-Google-Smtp-Source: AGHT+IFrdANS9CV9/9pHZOtJqQeMGzp4ixqVl0yKawCo3pc59IGgF9aalERcu0cITtJClcGXKVU9Vs70mqonTYc=
X-Received: from wmbjg14.prod.google.com ([2002:a05:600c:a00e:b0:450:cb9b:38ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:13d3:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4506b55d111mr12634255e9.6.1748432681772;
 Wed, 28 May 2025 04:44:41 -0700 (PDT)
Date: Wed, 28 May 2025 11:44:39 +0000
In-Reply-To: <CAJZ5v0iNwBhpmkwuo7Z_dGmLE5KQGONNRrt5kykXXKRoORTShA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520061944.pl3mqw2clo2roe3s@vireshk-i7> <CAJZ5v0gBRQ87bFk3-MCOudgvGWb29O_ihfz0Lo2kGcVpfSu=nQ@mail.gmail.com>
 <CAJZ5v0iNwBhpmkwuo7Z_dGmLE5KQGONNRrt5kykXXKRoORTShA@mail.gmail.com>
Message-ID: <aDb3JzdsrrLAxPlW@google.com>
Subject: Re: [GIT PULL] cpufreq/arm updates for 6.16
From: Alice Ryhl <aliceryhl@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 28, 2025 at 01:35:35PM +0200, Rafael J. Wysocki wrote:
> Two merge conflicts between this material and the mainline have
> emerged since v6.15.
> 
> I've resolved them (they appear to be straightforward to me), but I
> would appreciate double checking the most recent pm-cpufreq merge into
> linux-next:
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=25eb7dda15f182b7355488a5aca47078643633dc
> 
> and letting me know if it looks good.
> 
> Thanks!

Usually we keep them sorted:

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 88ab11d74fc7..2c917889d9ba 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,8 +10,8 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
-#include <linux/configfs.h>
 #include <linux/clk.h>
+#include <linux/configfs.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6eb61c87b616..3a618f82fb02 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -42,9 +42,9 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-pub mod clk;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;

Otherwise LGTM.

Alice
