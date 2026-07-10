Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109613F9294
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689786; cv=none; b=AoXPe3BzVGfNCBHKhoH++y7X0ANkofGChrVWlQS2UiZpcr76m1z2Ga/VsqCfPt/4WAgmkSNynwMc5VJW/iWdbq0/m7YfXCIYIyjoEMWaiYnsWizhalfS4pwBjRhCzXwZ2uFksZltWml/d3YBrylgRhAGdlCS+z4Uy1nFhs/N0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689786; c=relaxed/simple;
	bh=sowWdPL1N4bJddr5zojxh4J2Gx2uNWTKOncH4pcRFJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lSny2VVpJ9ldFLdZi5t5cp2eoxKRwTjznCQjYJzzyQ4Sn7PQUu8KeQ77JcN5lIalMkwVWncm8fdsEtOPF5+jjjfHb1JgKnVtcKxqmbjCbUabTUtD7zt918q8Plcua89MD6Tr4A+Hncwvp9dwiuJ3u1UUNo5mbxMmZH28FeKlu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJvEoOTn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJvEoOTn"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493ae2a6a72so9992455e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783689783; x=1784294583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhnEx/JJSQzYJbs5L6qf8iYhYeJFg/o22+QpnDmEIIs=;
        b=MJvEoOTnkezi+epWTNl0QfOgCug8XREgYDeMNmWBMMLxKJmjZYV4O5ZIw+Jo43GTAr
         68ceFJdU+RdekyZpcB56Eyq0fbaJOqZH5OY/E9wpe783KF5lpYxnoAUu+SCFam0rT1m3
         1WFZx7XaYF+xc/YQnsCU8+WFfmbq0Gcdly/Y9QOVWs8UrTc3ojx+BnrgTqCSC6RrgMCw
         m6HRRNS1BgIb8h6SyixDj4zqLJl0qwHp/+/fojxxOePb46jcyJziR4jP0Oh9kMdG8wS3
         bviD60S6Aig/FFULlUTto81BNcPQghSul7IzwIJkANa/b261NoETnIbEj7w/NEY05k38
         kg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689783; x=1784294583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhnEx/JJSQzYJbs5L6qf8iYhYeJFg/o22+QpnDmEIIs=;
        b=kSeIikYyZ+FPlF0i/08mTNaXm1l3ogHfQZHkc50z9XChpRmdkVY5rAojoAEzN7OeRb
         D8cNdm73vaa9VhB2oiS/jdxHAYjWdjv/Y7xBFwSBcoU3KDP8hr9u4iHOehtSe5b8TMpC
         Ga8ngW7brspsiyjajZ3Xi084b7OQiPL/xgGzJY+x/wLUqAEYATaaNxlS3EtCPo8rX6q0
         UF8i7JJHGDj9BT/mkGeaBfIBXWJFA8jOtDPZxDdJDazt6+NMzqxVhrZ37xSqiMvp28fR
         B/1HgBySR7rAfA268gBA4Aan0KUfhtYwhkCzChapFVLW+6st+NHTsGSXPdIi8P2SRhxW
         LP6A==
X-Forwarded-Encrypted: i=1; AHgh+RopCyux+1KkKoFX6kwAkQhYHe1p8eUyj9UU4q2Uwo/HAu1K0vr4zPd6wdZ6yoFRwS3TAYy1D/8HyPRnJSGJ9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxo3a/pKtkcI2Fq4p0hJY8lguDzpBBax72v06cWrR0g93xWfPY
	EAFaiUu9k378Tw2zkUegQyfYdlnlddfFZ07j/p6QeTBbN6Qc3WizIgT0FzqoIsxhIRJyk4U2p5W
	GHVXtf9BJcMhPL5yUfA==
X-Received: from wmpl21.prod.google.com ([2002:a05:600c:895:b0:493:b21f:6ccc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6297:b0:493:ee2b:c8c7 with SMTP id 5b1f17b1804b1-493ee2bcb92mr71010265e9.4.1783689783123;
 Fri, 10 Jul 2026 06:23:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:23:02 +0000
In-Reply-To: <20260709-fw-boot-b4-v6-2-ca391e1a4108@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260709-fw-boot-b4-v6-0-ca391e1a4108@collabora.com> <20260709-fw-boot-b4-v6-2-ca391e1a4108@collabora.com>
Message-ID: <alDyNmXQgRXAnlql@google.com>
Subject: Re: [PATCH v6 2/7] drm/tyr: add a generic slot manager
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boris.brezillon@collabora.com, samitolvanen@google.com, acourbot@nvidia.com, 
	alvin.sun@linux.dev, laura.nao@collabora.com, work@onurozkan.dev, 
	beata.michalska@arm.com, steven.price@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 09, 2026 at 02:36:42PM -0700, Deborah Brouwer wrote:

> +            None => {
> +                pr_err!(
> +                    "Slot allocation failed: all {} slots in use\n",
> +                    self.slot_count
> +                );
> +                Err(EBUSY)

This branch seems like something that can happen in normal execution, so
I don't believe we should print anything here.

Alice
