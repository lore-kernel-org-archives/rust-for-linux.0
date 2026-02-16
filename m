Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962022C21CC
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231160; cv=none; b=WodlE9IYoDB7jll8jO74JTz3VsksYIjhkRjjRoFXckzBesEdJauNmWwnOaCzFt5D1rC8/JfDSdD/OLl0O1p2F9U8Ra+rP5l+JWkM2IA69HKK7zkeyqT/0gsg1zEn9VMfIQKMa41iF1+w3jRy5lhemW6eFWy+Mc/BBQhBKiYnjKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231160; c=relaxed/simple;
	bh=okcDiHxVL7tNQh8cGFap+Bd3spPt+IwkFuOteJFAlQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a6CW2Pi4g7MHTydLkHoARPcOjcNC8fBHpThUbpfEOHDCz7zJspT7EctA2lPBhmV+cp6DMh7drlZP1z1O3O/0aqdl6xxK1rmN5IQNHLstXqLK/jjgmVXPSjRClYhpI91ehqVtu3HEkJBo6jZdmfBds/dp3DNp2f+wj+XSvkYstvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mxjDYBp9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxjDYBp9"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837f288194so16992785e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231158; x=1771835958; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucPLl8OY0Ir+SHtS9FBvWniFak/5oJhPZPFL09pWZEs=;
        b=mxjDYBp9PExC7gRXYtFOsNbyt+AnqfZtH+RvsKCXGonzI95WzMUsjYi19DdNS0dOL6
         gJvKFSNunkH/Cnyz7c3ozxRgsV4cDtMF3j7DRwppn9/QOHaQYRnDWn5zSOWYeuzuKaJS
         fYy65dr+VTe2FVliZ5Moy4OZbludN8YCBXzO3W5UERuIcIjXbWmF4hGa95Ixgm4WB8ED
         CMgK0lVdUILYv0fghcG3LUrE7w6zk4XSc4Ko3dHINzFXHG+KP6BtMsnKs14CLlDsXGMb
         ejDrc5M6lVu/xPVoEgTBDzuKkvim18yNfc39K0q1Rjx1FAL0+YV2jyDrNTmAqHByZoY2
         Birw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231158; x=1771835958;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucPLl8OY0Ir+SHtS9FBvWniFak/5oJhPZPFL09pWZEs=;
        b=K5BnE3JTU2Zh3Sni+0IEOVBt42BPNYX7655/u50wWD9ePFhVKf3xX/TRHI5g/ZkpEL
         A4j5g4mDkHJ0cWGwheFWpWu45WCa/GqA0iLNPtX9/siXKIA56kXzKwbj8CzTbKLhQAj1
         ty0O3dxrjKT66iGzK96G7MpC1lhJKXmxsTR0G9D8qlELJZnAbVSgQsYVH0apfLYDY1RJ
         x0RrJGG23ewBzzD+4ZOyZaDIrRlo9AIfAnwqRmSeBU7dLrTBXZET/HYXFMHSpi5Oey6s
         3T11rxei3ev17bMKRHOEgt2REWkm3A7WwJAnYT49PYPZIHOR5H+GnWy9OUru8Dy5f/ht
         zrcg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ddd8NXUhQ8rxMUxUuQ1o20e4yt9BMA9iOwqJRRTU2n01zj4tvjzGQWD2D32foWT5jjfnS6dbawkS2RWJ7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzykkx2jcMpFzDABO422YwhnzfOrf7P/01E1DQNyIrOGxXI+Al
	rOVPvDf8qLQti3tpDMsfmaA0i7i6fhukNr51sZo4RBK+UtmKKCEqb1iXzQbGtuaVOOHtWtS4m68
	B1jEkYcyzA9FP/ONuPQ==
X-Received: from wmsd11.prod.google.com ([2002:a05:600c:3acb:b0:47d:5a60:18ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0ca:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48378c5d9fcmr103300795e9.28.1771231157690;
 Mon, 16 Feb 2026 00:39:17 -0800 (PST)
Date: Mon, 16 Feb 2026 08:39:16 +0000
In-Reply-To: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
Message-ID: <aZLXtLc6_DPx2EpQ@google.com>
Subject: Re: [PATCH 0/2] rust: add a few helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:10:14PM +0100, Andreas Hindborg wrote:
> This series adds two helpers for obtaining information about the number
> of numa domans and cpu count of the system.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I'd make both #[inline].

Alice
