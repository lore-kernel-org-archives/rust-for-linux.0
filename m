Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFC285419
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Aug 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756456773; cv=none; b=YVZrjQdKKSYXnWWYAX8pCNHHmj7pz0UJM6cVsZ3Sbrx7VI8/YoMymDOkkmuvvourVEY1AIZkrg6iBkwzb/JK4ujJEFOYFOgeKZsVMjxETLNLRGxwKblIqboUptsowSARbC5YcE6hg3f2tCC7i3V8ItD9OY5rXQpV1FNYzUHNWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756456773; c=relaxed/simple;
	bh=ofdbL1dQDmdAjVuEgLtTz6fjrHzlLyxHt5yz8i38J8w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OJXTu0oDQdU3aEgFPXuV8ky1PvZ7cJqu5e1hvlvel/eAohgqi6aTdhRz/ZGebn9LBt7Zi2W3hT+5zSed6DZMRC/uJKoat5rS0YTvuXSNK/rGA+oj8hSQfjoYN+WITm5OF3VKC2b1lpYBSIbk3f5q77uOgKLaqb5PiZb+HeRASG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xEDWOLTi; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xEDWOLTi"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b80aecb97so2398365e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Aug 2025 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756456770; x=1757061570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UQEvQJki2jorAxK4pPiRW9zu4FuyXo0Nk/MFVc+zew=;
        b=xEDWOLTit1UdQuamVURP5KKi1HXLZGl+EnsP2NdDScYA5wXp7mI8FOK4oRO7du8rtV
         m4NG9+sCMxsDI980ukIgXGgNQtEDdEPCd0GviNnAok+7wt0uc0iQddtNfg+YkPwcz9sw
         0OHpwTNVYMPys9QBpvINAHq5DUOKgqpvUQxOqgf+BGucphSw/Xwua52CMTOZSCpV0JFM
         jqwFlfsV1AhVD9p9jncM1Der8CYJC15Q+CkM7btp0BDgG4wOnKnUb0WNbJT7/FQZhQl6
         N5V8sq+d1UiQyxCx2DR9deuEoLJWMdniVjJQ/hUGE0hU6imZtrbdHZDqEDTIslfzNcvp
         z9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756456770; x=1757061570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UQEvQJki2jorAxK4pPiRW9zu4FuyXo0Nk/MFVc+zew=;
        b=Q+8VvDImAsFWakk2ZzWZ//gacUWXBDS+rIC/mz2FDZ4kOV8hh/BeKog1UJ7aFaIXsN
         B/qK/US+QwEX8k/OBQJIC8WNxWeOBs6Zf3MhTL0JPOnD6Meg3k3dsuEdrbK8xCg6ZT2J
         UDLuV3r2HHRcIPRuZETUaLVRuCX9ECYVH0YWOYQtsPwH6u9GncPF+6jNJWBdbOoGjMss
         kCuc80dKXqqGU4cVMvAQdVSN1sjQ3Xx//aGE3Kai4wxaUgPWw9BSuBNALU4kW4juh//L
         vw7IFJO1UaZ1TlfZJetGMIwahIaaXTImKKraaZu1m03K3vr5GunDBMy+E3L2c1iJVq8V
         OwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVucS22e+YLJu5rxhUkgdIps5p1h+fbg9iGAEl9epY4pFfvR2xjtuFCwVFmnOPMw6WYhuM5YQspFLVYI76ENA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUqN4eAAe1VgyXcT4zECY9ugj8V+ayMH8rCHGzCoOgf+601bG
	3Nw593lfenfhv2wL0BIWtpJz/tBQ8+x4ZilfIDdh0cytNEvMchhR7/24CTCmsaK6rjaHq/ai/M9
	iqIhM0rpoDwT1VHYCjw==
X-Google-Smtp-Source: AGHT+IH3eYiN3fOA8XEY4ERscZ8isUlUhXtUHiGo3BZ8cQY2Ya/Sc9lUa6ETxq2sNQrBnDxAFOKNYLqb5kL+CSo=
X-Received: from wmbfa15.prod.google.com ([2002:a05:600c:518f:b0:45b:63e6:8e28])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5491:b0:456:1d4e:c127 with SMTP id 5b1f17b1804b1-45b5179cdf4mr239952455e9.8.1756456770629;
 Fri, 29 Aug 2025 01:39:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 08:39:29 +0000
In-Reply-To: <20250828133323.53311-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250828133323.53311-1-dakr@kernel.org> <20250828133323.53311-5-dakr@kernel.org>
Message-ID: <aLFnQbSq3O0R5X_c@google.com>
Subject: Re: [PATCH v4 4/5] samples: rust: dma: add sample code for SGTable
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 28, 2025 at 03:32:17PM +0200, Danilo Krummrich wrote:
> Add sample code for allocating and mapping a scatter-gather table
> (`SGTable`).
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
