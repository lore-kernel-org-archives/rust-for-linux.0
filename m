Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DB2D8789
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678536; cv=none; b=TETgIDLtjU9w/1ixIhbT4QfJqNEWOJ9dl1PggctJyKQExh4JqRCCHUTl+Z5qWZ5Nv/NcAzJK8xwxVMBFalL46Yg1QrlR8azeWn4SASEeo4r/9OLe1rthZiDJsVoElktcVFQLy7zSIWegTvmBLcYu+eKasWShB9SSy9m1WsA9v70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678536; c=relaxed/simple;
	bh=zF0KJzDGb4FVwJYN7hE92OHSrRFWAOyPof8nv4wkan0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BsMUEyrKGtsQAwzlz40z/8oGTKskDgOrKw/XHYOIAaDlXrLo3l6TVRRd4x85yDBf86MJ8thZI7jM383k4bvp7ibbjkjCFJ5rXeqCjVaQCB4N0txjUZkH/2Ai8Z4xCCdao3v/s4b5c7m6cLHQ2BP1jkgqx+Yjy5fF/XR7HehOjKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fdUab7eR; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fdUab7eR"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3c380aa19c1so205532f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755678533; x=1756283333; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1tKyYSTPJPxeU53+y1RcwFkYkWpuTBa3RAA51ynQg=;
        b=fdUab7eRZrBgOuepxSVALOxiDozd3rsCAUwlR6Tr8Oh3+cWlB2Qa6rjlOmxExNZnh0
         37iQay8ASNrTqd2X6Qg5TY8aBr55JA057jlWROUztQ+yuQ5wWBD1xUAOaTjy+UB/gaRs
         41RJg5vofWpOA5G+1jvmW74gLQ7p3YjbP9smNI7WpGlpJ/cjz42aU06wxndr0t/6dQKi
         DXGbJKz1uDPabg8eHmpf6m4+CR+ODIrc98ZFfkbqOL+r0wkEWEuqw6g5B+D4/HnyBFA5
         0vO3SDbY7DsTrBG5NTWoN87KhhjuKSAzEAxF+pQEQSzFq0yY7uwGZPfCWDrb/bSQUNmw
         nFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678533; x=1756283333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1tKyYSTPJPxeU53+y1RcwFkYkWpuTBa3RAA51ynQg=;
        b=kEMKVNAUgjoKQP2xMsUTD7kxsn0WQQ4Ld0Sq9gFQ/o0PqnnPWnCOledRagcjsMfhdz
         lxYslCES+TpQL3IKR/+/MtV3EAUFKs/4sjzzkW8Qwpea+TKdI6XJh4h+WLgb7EB1/Jrh
         pc9Y7jqQe/iAoHxPN/0M7UDbqXCBF1Bi893Zu/DsgHxK1KbgV4xt6b9L0Os6svsdDHbW
         hIfijv3IgFA+0HNAFNmGg4kB52VBB9cm3p4UnMt6ShITvn/ZciNHbA/hYur31xT4rIIk
         wcBS/IQwPK3DYUpJ9xYcp4IIghQVvN4TsALSPTTveaFurJaqAOqg3a6x/fZQfPsJ4UhI
         wWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMCrhiWUarvHMqa4h8GPPydom1fv6vni0b33GJuFpU0IVsYENgJudXWVFwC7p8m1pNj4mjSn2jhO/4NZdWhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5GPxFwALgkXYspoTHscq7OMLtfXDJdmX49edtWheDFNOlAJd
	R+Zx4aVGZ0WRxh9p74f3i1erX26M4XLr586tlYuzZzOiL9ZB9YdU/80Xql0skqC6OSjd81duhOn
	ep0PM7IFaK33Qk3gwsw==
X-Google-Smtp-Source: AGHT+IFAyzNnBS6IDJSFSMEJ/UC4rW4CUjOyxVXmLmSBHEX87SDM2/8LeBdUjyimto1XFzjeWwzfcrQ1TRzdQh4=
X-Received: from wrs12.prod.google.com ([2002:a05:6000:64c:b0:3b8:e341:aea3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f8b:0:b0:3b4:9721:2b13 with SMTP id ffacd0b85a97d-3c32ca06babmr1467563f8f.14.1755678533695;
 Wed, 20 Aug 2025 01:28:53 -0700 (PDT)
Date: Wed, 20 Aug 2025 08:28:52 +0000
In-Reply-To: <20250819195841.238246-2-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819195841.238246-2-paul@paul-moore.com>
Message-ID: <aKWHRADe-EmKumGJ@google.com>
Subject: Re: [PATCH] MAINTAINERS: add the associated Rust helper to the
 CREDENTIALS section
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 19, 2025 at 03:58:42PM -0400, Paul Moore wrote:
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---

Acked-by: Alice Ryhl <aliceryhl@google.com>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d61f7246e5bf..0ee0098f2df8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6484,6 +6484,7 @@ S:	Supported
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
>  F:	include/linux/cred.h
>  F:	kernel/cred.c
> +F:	rust/kernel/cred.rs
>  F:	Documentation/security/credentials.rst
>  
>  INTEL CRPS COMMON REDUNDANT PSU DRIVER
> -- 
> 2.50.1
> 
