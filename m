Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FAC290D9C
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862273; cv=none; b=QayTq44T9Pl/GoiwqxZlsaFEtpNOQ2/V5SDXR7MZV/5JK/gTUZzeVmdjjBGmk/Do0H0dYLkS3hYhWhqny5QTUMI8gAafmorkjZtY6vNtLQCkbwLBLUwlP9N3CHPQSzHXVD+wrE5nOHdozPADX9r0moTHrZT7qr2TjvNmE/IXR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862273; c=relaxed/simple;
	bh=smz0s47ENzWJoVfL6gZB5jmHbvR//Sa4vQ9XJgjD1+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mPL9XdZtxkVPCFYKxy7vtQsk6qrGbn6b1e+vQqKwDSj0C5ZSxiMTs0LR/FwQNFiT9rddNU1jmYqqCyk2y5ZBfd6/gtGJMy8+soS0NrZZ11Pm0EEGOWFnEbATHCJ+w9Q9oz8ZxsBF0gbBjBi+gfAOIFA4F5dAbOnBwZMw6hEchpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yjHuj2w8; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yjHuj2w8"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ae3c5ca46f2so490040866b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753862269; x=1754467069; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibU44Ftq98mAdTatqw5GBxBTG4xcjjy5CLljWHMN/6g=;
        b=yjHuj2w8O8p2QS0gJCxMgEyhDiNsNWvkmhLpAXux7mK8JPVirSUuaLnUPWW5DMtfRB
         dhE+hC94aBJK80frGA+rXVXFmwTUx/AXoHEKdRq6RhMCj3Y08IyCNDeZB8UGhs0khUB3
         5XPNJ0VGUhJShHR1npu+Bj5ERc7hSLSbkPkaKAOktp1uVZx22eMrfrDomGLf/axRm6RC
         swiDOLdK/c2Z0QBisO6/R0WyO2NR84hX40gAPK4mUX+6ego3RTJgBkwDBM2rT6keNasQ
         dUtFqgq4pKmLIQWii8qfd343X2pW/m42G39hVURXTZLv3R3gxr6+0SxjIOArn7Dj1nPC
         ImjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862269; x=1754467069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibU44Ftq98mAdTatqw5GBxBTG4xcjjy5CLljWHMN/6g=;
        b=fDtmia3vkqLgA4rYiu5jMWA0tatcrjnivLAU7rbCokcw9qrfMFGz04GxAFOjYIBaCx
         Lr4vt1ByVrDmH4u1bbi2NpiLLByDMccSzVibmiIKBIwKnW8gd3xzArl4KAwSVZWZ5NKC
         QMQgn/9bSQ6np9oXFXeMXBjeYq1A2jiZFHjsOoQ6MbzdJVGGZvAOIQnRvV3F9mAiZsLM
         P7oCFtS3MAMBQNoDCOrr9C1TIk1YkJLsKCerUzCuY6pEcdZpbv0rrwBjebMKu1L8LNjI
         C/JyVhh7GYGh4JGYo1aD7VxSfkrWawLwogpMK6N/KgNWgyy6URcNnydGkw9ZPKYqsJ4X
         WBBg==
X-Forwarded-Encrypted: i=1; AJvYcCXRVIJb+touDrzz0e8g1gqQByJgy8ndIZgyQbEomdMRkA5OtzMPz1tYfNuEeG2P+s9spsZBNbJTgmZ4Bvl0ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmG53NtpB09QJvq2DRCQcoI02C7dKShhZ9MzXDqNO3hyp66XvR
	Z1Wsm5ysxctpaqNVVI6EEIpqoMJnGlfCUUnGkHH3iY9PYCc2zkg5Nhf6Flk9tplCoBux6aCjV8+
	Mfhcbq0BnKc4ZMIqaOA==
X-Google-Smtp-Source: AGHT+IEOVXeHC1r/hz+Tx2maJd+AAzxr+M2KzaJ+f1U+lCSeLVEGvFmmDtiCAtV/69p9x0JJxrpeeODxXzry/7k=
X-Received: from ejcvi1.prod.google.com ([2002:a17:907:d401:b0:ad8:9944:a3d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7247:b0:af4:dba9:3eb6 with SMTP id a640c23a62f3a-af8fd919a99mr303002066b.31.1753862269580;
 Wed, 30 Jul 2025 00:57:49 -0700 (PDT)
Date: Wed, 30 Jul 2025 07:57:48 +0000
In-Reply-To: <20250729-regulator-send-sync-v1-0-8bcbd546b940@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250729-regulator-send-sync-v1-0-8bcbd546b940@collabora.com>
Message-ID: <aInQfMf02dfsrgQ3@google.com>
Subject: Re: [PATCH 0/2] rust: regulator: relax a few constraints on Regulator<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 29, 2025 at 02:31:39PM -0300, Daniel Almeida wrote:
> This series implement two related changes to address a bit of an oversight
> on my end on the initial patch for the Regulator abstraction. Note that
> this is not a fix, as it just relaxes the constraints on the previous code
> as it is safe to do so.
> 
> Patch 1 removes some needless &mut self for functions that already provide
> their own locking on the C side.
> 
> Patch 2 implements Send and Sync. In particular, there is no reason for
> Regulator<T> not to be Send, and as discussed above, it is naturally Sync.
> 
> This is based on linux-next for now, I am waiting for 6.17-rc1 to be out in
> order to rebase.
> 
> ---
> Daniel Almeida (2):
>       rust: regulator: remove needless &mut from member functions
>       rust: regulator: implement Send and Sync for Regulator<T>
> 
>  rust/kernel/regulator.rs | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
