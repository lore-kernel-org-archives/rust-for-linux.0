Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934781E9919
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504536; cv=none; b=Vf9Z1hTQ891qJGwcw1/n8BF4Mf9LfU6am/aUGdwoJ9bVDInKtehIX7ebRZnfZkqHxdmXKuuRy7L3r0dkr5EVZEJnTu2ZrOZphHfSy08KNxfSq6ICxSu6YJ57vXzkLOFl9zWUyCOs0tmHg5JQFJF672OsjxsYJAGQYaRfx+lgPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504536; c=relaxed/simple;
	bh=60tvXHeVsn2fjy0lyiAVPB2Kuo4RYwjbvQo/aluYKk4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UEQx6RpbhMrQBiHeWv0R+qf+llajXTrylGQUJuzejXFrpG4EfCid0hN8Bs7TPrg1DRz1tvKyG0fNpnA/9ot963221Pbax5l7HLD//NJVUhDCsROQgr3lUx7kI+hPk/o+Mxke7ryMQGbqF5fmGBJwDp64pGViKMXptBvNK/jwwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UlQpk94Z; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UlQpk94Z"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-437159d3ff2so604127f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771504534; x=1772109334; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQgcSsW9smUP64WccQQTm9/3TGXmBjXVSJT057hAwi4=;
        b=UlQpk94ZvCBfKKPZQmwWctqr0O2DQrTbvVEyugOY0rPXJUT7ZAcpTFqs4arVvd8NzO
         9fDTUSDeCbMSElzAQFwU2qFypETWLZkGRJUbEwS/ap47pN20lDZknyEphlQgN5Goi/eF
         QJJhcIEiQkgE7N9eKcUaSuOQxI854jUfodHc/g/pRW9OTc2wBIs0+fd5wWykja4leuPO
         Crs1QVbbfOygnhihuqD65JNxmqcLYkp4AU2Fvn4v0ySjnkfycW36ssrgzzMqYsT2SL3K
         bx8Rt24wgQmfJxDbXRqfPmBE9m8KgDpozgwpbfHG2P65Pqh8oVuFI4RN0SIq3ntqTwAr
         YeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504534; x=1772109334;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQgcSsW9smUP64WccQQTm9/3TGXmBjXVSJT057hAwi4=;
        b=jrLOFuVyIOxXcbotdncOWQdhYCwB5ltMU05iWFd9G4Hi8Y1H8FgKoyUMTiPVL2bsuG
         XqyLrdQnQ0+cVab/MizVAUQxEKIquYumBGhBtn4a/a5aga5RLkZjw5amDpD9mjj9VDVt
         ATKpHYz4kS+xHJ8pL0JHJNJ2OLgZ1pBTWZVt+4g2RRR9oQi9LzvGHVu1NHjdNpS6c1Vx
         u12meq4HqTh7kXRkA/Dt4VtpcbMVcm88NFqrda0gKFHCN53U1vRLApTynGwa1vmU3opD
         vsyQmU0ZvnUoj577iJhwqO1Q2dqfOyDLNpIVtmc5qrOAzamKN/2KjPoKHfS4ieuTAprk
         cFjg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUf0kHXROwBcqLM7nX5hwGBoaD6gLHT+tiFt9xPED4S157Xu7Apu7voZFwB3CAzbBnmL50t/vbqb8Psj7gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FqCBvAIInj5/V6vBd4Gu/bru2kwTgsUqQXlGQ9V9q7SnpHHH
	c2RNDTGStcMQ7bvqYc9TE7Pso2QOXhFi0Gxu9EgEEqLgbnmrkWsSv1vsFbEx8Ao15j06CASQGfd
	NavZE7HsKXfB7uBIJ9A==
X-Received: from wrop10.prod.google.com ([2002:adf:f20a:0:b0:432:75d8:d550])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24c1:b0:435:b068:d3da with SMTP id ffacd0b85a97d-43796ab18ddmr38555090f8f.4.1771504533805;
 Thu, 19 Feb 2026 04:35:33 -0800 (PST)
Date: Thu, 19 Feb 2026 12:35:32 +0000
In-Reply-To: <20260219-atomic-sub-v2-2-8bd99cadf26d@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org> <20260219-atomic-sub-v2-2-8bd99cadf26d@kernel.org>
Message-ID: <aZcDlFwTNkUbeoDv@google.com>
Subject: Re: [PATCH v2 2/2] rust: atomic: update documentation for `fetch_add`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 01:20:10PM +0100, Andreas Hindborg wrote:
> The documentation for `fetch_add` does not indicate that the original value
> is returned by `fetch_add`. Update the documentation so this is clear.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
