Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD138F920
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549739; cv=none; b=NCAjh4APR+t6Qxx6FcNFPrHmI8TqHQIFhN4mXGO6NDgwCMIpGr43DVdpiEZv91mfGzsPtDiljLSKUKXoqs2I/pBWq0CAk98KTKeDMT7Z+dprQ++EzrgYeywNo/AtQdXv+k67XMS/ezCmOVVXvzEN4MOyQsw4i6zXTsFdNDVOadQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549739; c=relaxed/simple;
	bh=EN/YbO4SVxnyiqZEtEBVYfgaPripwNy2s8TNjc/vILE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mc9XbDcNtXvC56YMWoGq4r3eNkjBclxFprs/GLycNrt8QlxrOJcWaoA6EtGedhzhq1Zhl5tDY0UnONUpqu/28u9EFOo93weBoq3f+oKrM4UKXI50oWjSfr+nlzfMzaZiYY1ShZEnriSPfyj0LTt8cJ99UodqVbMJ7nvEVGojolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxMy0JY6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxMy0JY6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488ba2919b9so5406765e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775549736; x=1776154536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/zCewPKsjv0bJbd4+saTzW0ZidD4sryHl3+ETybzZA=;
        b=pxMy0JY6kgZkVyvbFabcMjLQYWWbsuujWItf8Xgws3+o8z0vB0eWDLv9JJUcfaSGbd
         cqo1lYDCDllsPmbvW3NAjKztrWijEMq7OXl+QhPhJMY6vh9D9S0NppKiRHyadcvIivr5
         zk8+N1TMPxq/xWpSa0fG4lB96rztc4xHlSagTLGpeipLctwGLmrDqmQV5WUhJmYGEuiR
         VslKabZ+dKrDO3gAW/4lfaXNTfzYN/jdbe+10+YT4IzNiFLhIvIkFCoZWJNp6TRTjQ6x
         d51lxnkwv/u+PNVGwJZF0+U+lNR5iGBgJAPau93D3PZ5/lTvlH7OgGjIxnwr64F2vDV3
         tYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549736; x=1776154536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/zCewPKsjv0bJbd4+saTzW0ZidD4sryHl3+ETybzZA=;
        b=imFPTmCX8uNt5tlgmcpLhfvjQSFRTe1RkQ5yZhfUbY9D1/7YAUmXJzMr0SS02hKbUF
         4ZBSxh5Bv2Fs13byUrYDAqmWUlnxU9jwUYWIvQhhnhXGmd6KyUR4oI5kjAckNqF8FHSz
         u8blAHPFgLDjgoPpRRQmcTS5qZ3+2qF3mTRP9gQtcM/E6S/sCgeEY14upuWNa47d1Nk1
         Ey8xvRSDB0hIwbsEP49FCutqJzqrZeteOu8Rv3yWkW9a0hazCp0RsTEnadkEPgTrMc0R
         mL2qLcnpmeFoMMkB1dbpNx+Pd58oAaQcCY2gmGklQq6I+mU+xc1ZOZSdt5yYAtX92i9/
         Wqag==
X-Forwarded-Encrypted: i=1; AJvYcCUWjCBeGrqR7FeWHozzfdpOLjjSvxwHz9M5xy9MgU0fDEyn8sTJgSbIcWfaMZv81W39kso2FrGG+cBQyWbkow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14xoDH7IfaRKyxUk6edQJhAmKnD5d07qNv/H5K2BromL1aMNd
	UjwHOL5Vr8/GFDlAsnSZUSTuEJI29f0CLxiotYLvpCkHO+keOgvgVhG+nnVw0KTjAo2sdTzYN+M
	MaKYFJSF8m1mJ+zd6uA==
X-Received: from wrux13.prod.google.com ([2002:a5d:650d:0:b0:43b:4eb4:e4ea])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6cf:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-488a825003fmr73277915e9.22.1775549735831;
 Tue, 07 Apr 2026 01:15:35 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:15:34 +0000
In-Reply-To: <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch> <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
Message-ID: <adS9JslFrhFK57os@google.com>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
> The SAFETY comment for the call to ListLinks::fields in List::remove
> was left as TODO. Fill it in: the call is safe because T::view_links
> returns a reference to the ListLinks field of item, and references are
> always valid and non-dangling.
> 
> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>

Thanks. I agree that `item` being a reference is the only thing needed
for this to be sound, as reference implies that the pointer is not
dangling.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

