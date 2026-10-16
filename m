Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83C4DA9C7
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158889; cv=none; b=CuvWDhvB8kl6oXU5ntNb30z2G9wq1gHFR+VajQLGMCklp+s/0uhtlJelstrcu4EyTSWlmW+neOz654oY+UbMDFSs8zO0YZMX6VbE+zHI5byrJ8Ya6TpgKseMHghjcI5BdB8SbQR8V8TJZRhqto1I5YT7IpiMrnL05YPOPeP98/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158889; c=relaxed/simple;
	bh=mqFXmG0+82kD8GDDaPBco0UAnX0A+bUqnYurXQmfV1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YCBJfGynBD+UTZb7gyAbBe6ygJDkX70QO/UHmNoAQnVuTN0HO0DpcPE9VRR/FOqY8NWkCltdINuGRY7lUO41IpGiyse3t7/gtSOr0W+G+40EhW8jOgEmceraiwCVxYzVkQDVkHcM/wg6yyThF6WTxOFsMPR8/bDzunmZnpC7swY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxh8SK97; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxh8SK97"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so3673035e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158886; x=1792763686; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=fxh8SK97hh8FxGnSWn87mqRin7ceMylKr0o3/DMs7ffJ7r7xQNdLyjsCGoLdov6Wjg
         wHqM/YKrkGYaWfzAO1evbAwBlZOPIvSRl8a0mcYkVOLunc1aHamHk+SZ9Iz1cIB8r0un
         lZ0LcRcXdQkNN3x9J5zDDUWoBdhmPwdhBkd0kyutRo+V5nfu6I92gsm18M4PGAyw05mT
         lCmQz+ExzmaI3VnDd1KYiG2M13MRjz+YfVjWpaDu5873B+2Od2enm1jBx8DpD8yIm+VJ
         FbCWYaAOGLFZrVpicK6md2AidwpygYUu3eI6myh4qIAO3ZYT1PlSROcrqBngOGxvRAMa
         t/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158886; x=1792763686;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=gHteZxDaxN+EnCtiVPkvPHDR6/4uYKX7bZntq0ctmcilU9GNmTkP4/J1hK47CsQbct
         +It33yiJjmZC6chUG6NHBOwSoH4RSuj27se+h6yO+7e26CMPI8G8FOWLWLT+hApBRdf/
         kcwnldIzYDJa7D81cRVL4CWM/OGUYZy+TmTDeE3BiBebmkSFZmaSpblojk7RY9ozR/iF
         sbo7nErVNXauXw5GZ5Lxn9bLuYCzp4AF+rp463ufNJIa7DjmXUFXDYSXc0fR0Qhz1j35
         S14I3XcmRJ2nHxspqg39WOdS2L8r4Dtv9EVZM770M7hr2n8YObWNVP+4nJE1DS45xwLP
         BMaw==
X-Forwarded-Encrypted: i=1; AKwUvBzOsZDGNFS0DdE2BxR60ga9FXxUtJhUMP/Ja8A047aYOTB3IxBrvibNmVF2AZzcpl9AnRbMdi/32QCgdyN5yg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjhvAm57bFYN3lcrq9Wb83clu4+QN/UMVhnM4637ONTc/ZBE2o
	zAa7kaAGLqRaJrEDK/XYLclxNua+LYBvvhcC6ccqfsDEKI/ttd1opkzfoJIQAILsJyYaKJTVpHf
	51A2ETRfzA7icOyn/eA==
X-Received: from wmaz19.prod.google.com ([2002:a05:600c:6d93:b0:4a1:99b0:134f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr488323585e9.10.1792158885671;
 Fri, 16 Oct 2026 06:54:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:37 +0000
In-Reply-To: <20260814230923.1292966-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-6-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-5-aliceryhl@google.com>
Subject: Re: [PATCH 5/7] rust: drm: wrap fops open with RegistrationGuard
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:03AM +0200, Danilo Krummrich wrote:
> Add a Minor abstraction with RAII release and a fops_open() wrapper that
> holds a RegistrationGuard (drm_dev_enter / drm_dev_exit) across the
> entire drm_open() call.
> 
> This guarantees that drm_dev_unplug() in Registration::drop() waits for
> the full open sequence to complete, so all files are visible in the
> filelist when iterating for cleanup.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I would consider whether drm_open() should be changed directly here, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
