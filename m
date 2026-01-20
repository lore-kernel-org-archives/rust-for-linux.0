Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170C40F8C6
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905453; cv=none; b=BeBifqPfVL3NXS8DOM6Tqa14x/jEjqfh/2iIXl0ALpwStZxegdNGP3oray4sJ99SKYKSlUcY/c2W7wgs7VdahBkCNKltF1d1SF9WlfclCHTVMhTdeaRqaQ7ZQENx+1s9WrdV/niuKSvXLaI0acdC3QLQuFJrPfFUuIxEUCZsFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905453; c=relaxed/simple;
	bh=VAUYy2ss984yxO2S2BteJaEJBIiilvxqP2swAqdSvLQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g1Tz6XxmVKKwTkpE6w1nod66B92+93qsOTx9uGcO7vTqov/JqPwnfSvEFgQ0S6UmEye7z8QHPBwi+J6ixnKGP88yQ1zZZ8aWW3Nf42Yqz6HJqQU3zANFry1rfor87K1/wI2YVE2uh6OVOc0+1qdmGfOo+Zu99Ir35dUtAzpvd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UmyAWL/f; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UmyAWL/f"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4803a72daaeso10311415e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768905450; x=1769510250; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9vLBXNMAjUczujnOT8nZXcD9eSaIcT1JipxISSliZs=;
        b=UmyAWL/fpln0zn0yU4TE7kYmYUHWiJTgBcFod5CQFsvO9a0YcwzBcSTKFSTprB66I7
         Nwl30aDXu5GsHu6B0H00iRIFyVbnyCHWssqXAiPKYQ3M33x1JY/17fFnizjytk+2oUTe
         HJP+y8GJg6MoU4uqVUD/dwH7An2Og9MuH/jtzGZeuSJNw/8Qo9tyQbOxYZC91ug8qNVs
         8Qs1wMI/QrgN1qrzIAjxvmOdO9TlQlQItEIw2xFah5ZLRQzp+SJ/6damffnV/OKt8uQF
         uQh3vvudoTbN98Z2YwnQns6Dky8+VF7YmKz+lfmloCRt4ribr242gkCcUV7XukBhoOAR
         m8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905450; x=1769510250;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9vLBXNMAjUczujnOT8nZXcD9eSaIcT1JipxISSliZs=;
        b=ZpcCNLFxsV+x72P45FlpQXHGrlfa5MKmxaph/lNWDwxLYJlgdMKqh2n7rpd+dG/Ncz
         tB1KKz0w2bedvsW8alfwLCuCMPwKJWgTJB/yddVUV9WSJ27jRw4S4oz9hVweQvdsjLSn
         Rgi1PBH5z5wS6fJm4SBI5oBzzg4HdmrZ00nRvaqKqV86WjKDe2V8fW+SWL15arlNVe70
         2UorfA1843DYjMtRGrMnPv+KuFFFiiyPNdXUmLQYEZatp8JQH0R+WuJmTnXFOXxJeJjB
         ZulvQqesJfOUdHejc71rilM14MgCePr2Q9DfR5NdVOLfVjx0afSSayRfFzlyk5BOzhvR
         bReg==
X-Forwarded-Encrypted: i=1; AJvYcCWvpscFjCxZL/kTeuhHscVPgdhqu67jJOwiil5fp38Sy64qZZXnXmiZTNGeIw6Fft+tZ8bS+lnkazAqEVpcHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfPKX0CRYStMp2Deu3lCrhJN2cljoVwSBisfaCOe/TARwsiuAu
	vwHQOKKwKOAic/T0o7wiGB7pvKU5V5HIPqVwzuRFpOA2gVaZPjy7g+k1DL3iswucHBzKiHMporN
	rJm4Dtv2rK5FmklIa/A==
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:479:36b0:ff54])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4801e530e35mr174624385e9.2.1768905449791;
 Tue, 20 Jan 2026 02:37:29 -0800 (PST)
Date: Tue, 20 Jan 2026 10:37:28 +0000
In-Reply-To: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
Message-ID: <aW9a6KII98eI55HK@google.com>
Subject: Re: [PATCH 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 15, 2026 at 09:35:56PM -0300, Daniel Almeida wrote:
> This series adds ARef<T> support for both regular and delayed work items. 
> 
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
> 
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the above
> is possible in the future.
> 
> This is currently based on v6.19-rc5. I hope we can land all four commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.

Please send a new version that CCs workqueue maintainers.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

