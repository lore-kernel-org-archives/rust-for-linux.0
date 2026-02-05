Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD0149E17
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770264919; cv=none; b=ZRsD4PAagYEE8dlDOmEUJ+2FzQCM9GtGAUVyFYqnvkJACJGLrRBqBQYpJ3fTXm6/St5DR8llb+fu2g31Cl7D6cTmCEG1hyzRgbFk8OQsy9gEsfZ6juxa/Dppms25UZjFyy/mUIjXCce3d53tsJAoj69ch5KMidGeCMJL5aC7wrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770264919; c=relaxed/simple;
	bh=94QkaWvYKRG3/SDobFYsm0B+iO0ZgnHphjtFIbBLxng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlAeYINtXESCgArsBpDwzMT25cRc+4KbomCi+0CSx3kv3SnN70hWukVCxFFoNCIq4b/h451ZDFw3xmZhppecYJmsR61Z6fN4RQY/5WOtLCc5uIA8knbbAgE9IyuAcj4wFdoTG6oYzBZpDShBJAA2WR+d6vKQ4NujEIY18UnYiEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2+u62wx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2+u62wx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so242397a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 20:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770264919; x=1770869719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94QkaWvYKRG3/SDobFYsm0B+iO0ZgnHphjtFIbBLxng=;
        b=M2+u62wxiCmOb4mkVo56mI9lxyChVLbGSAckNKK/52hdag+f+lahkqkfOziw8lBa6w
         wlb69VfT0w5wDhiHAzRLlQJcNpEJ+OZIq9pC5Cr4vZizG5ApPQSaVyHWyxA8oK8fPV5S
         DDWjNHgjGDDBefa2iNZgk9g+gmHyKhN2LtdpX9YrB1f0f2AIETOC+NcLHxSi50DyiPpf
         VI6cYW5c6ia9Fz7ff+TsH6Ras/n2/GS9qm4Eecprj1DrxaOtfBATMw+CwlBn4G3Tqeuq
         TL82VBa3R3yBQcorP+3gd8m7SohanreRFZJx+XCyc91IcZDv10IVLIBs/kj+n6aAWL89
         +C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770264919; x=1770869719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=94QkaWvYKRG3/SDobFYsm0B+iO0ZgnHphjtFIbBLxng=;
        b=Ex25Kg0hIYXDXKZq7mWmJw9aS+dGquup7HoPtxpoSqSV4GdSWfVZBEah1UZ408kS5u
         OIc/NFiKFoHtycWqhIGgVGU3vxAXMzGqKtCMpx3jJOe7laERwJq6EyR/1fWKoRuTvwqK
         cCktkdLIjKHp+RvpwdAsUHJxq+I0BYadvX/63dDxgqF7ZeFo1nMsBYqjzvS6IaGxSfQ6
         Dx/l/bt0V9bujDiLAE4c6PY/fCZ/7WQ/4qBIWkja7+viL28Wqr1lHo9seK9ikOfzZv5K
         +tnsvV4jSATwE2GwLHfn1ovcOpfw4WspjC5VImMbB0x9uHxuN5f4VO+/PQMU8qy+qtGR
         9aUA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0wVsKMEUW+p/599MxlFx2G2wRD8kMBPDX2Bz/GNmEYRzBTa6caY7S9kHAs114RYpS5qB36tGZwVcOGIigQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LJ+dEcRM1ndoqba5QsOB4sS29OPk6LVEoG2LMK1JeotnojZa
	93cLH5lL/LP1BXfZGfA6KwFkXyf+ls+MbkC37Du5AF/tcMW+jBUY8axkh1PfaVYWTKQ=
X-Gm-Gg: AZuq6aJybj0UsJbRChCqPaEDQGc+rjVH6qwYa+aslNxD1k2HITOIO0xPLp4DwnalTEv
	eiwyhSJlHHdasj4LbFZKRoxlVxuKEBp4eqq35Kke/9q3UZlWo5+59/+HcFKBnD9jkZM8C6S7Gm1
	X7CqVmz5s8PVU5raHd1xu5tO2hdY2MjXyGC3xyUPtlH8iYc5vceYaPNTZAki9T60paeK24vW+rU
	xSuB79dZ7Vhnqb5bUL7IbAsDaqwsck+bbW/8JXYge3Ww5NxzssbAxLZGq8AykRsJc2tV0sn6ASO
	2CR8K167jiSh6RYL5TgncIz4gn1Jm9Rn2zeH20tJNX6NfzXMmeGCXgst4oi+EDr/Px+vNsSE0dV
	+qOBwQhsEpB3aN2dkXRUrB45BjOJUsFs2nH8En0jLiD5mnVSbWp9ayWRR/RSgAWB/IoBNvQD7zd
	9voj4=
X-Received: by 2002:a05:6a21:b82:b0:35f:5fc4:d88a with SMTP id adf61e73a8af0-3937247df13mr4958533637.49.1770264918788;
        Wed, 04 Feb 2026 20:15:18 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c72d5dsm3522167a12.19.2026.02.04.20.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:15:18 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: nathan@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: Makefile: bound rustdoc workaround to affected versions
Date: Thu,  5 Feb 2026 22:15:22 +0900
Message-ID: <20260205131522.2942928-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203221224.GA2703490@ax162>
References: <20260203221224.GA2703490@ax162>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 03, 2026 at 03:12:24PM -0700, Nathan Chancellor wrote:
> On Wed, Feb 04, 2026 at 08:48:43AM +0900, HeeSu Kim wrote:
> > The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
> > handle a rustdoc bug where target modifiers were not properly saved [1].
> >
> > This bug was fixed in Rust 1.90.0 [2]. Restrict the workaround to only
> > apply for Rust 1.88.x and 1.89.x versions that are affected by the
> > bug, preserving ABI compatibility checks on newer compiler versions.
> >
> > Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
> > version upper bound checks, mirroring the existing `rustc-min-version`.
> >
> > Link: https://github.com/rust-lang/rust/issues/144521 [1]
> > Link: https://github.com/rust-lang/rust/pull/144523 [2]
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
> > Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
> > Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>
> I assume Miguel will pick this up.

Thank you for the Acked-by!

> Minor meta comment: It is generally perferred to add a macro like this
> in a separate change to make it easier to backport if it is needed in
> the future.

I hadn't thought about that. I've split the rustc-max-version macro into
a separate patch as you suggested. Sending v5 shortly for Miguel to review.

Best regards,
HeeSu Kim
