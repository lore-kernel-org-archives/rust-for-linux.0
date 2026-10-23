Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760782;
	b=STBU6iN91bPzPARJRsGDXcpY3qao9TsLIAnmrYCoMPYBLBKwYh+cLy/BZ4zvq2HELaiZ
	 2QdrbgxqQ7uGSZw11XXcQHEHHf3kqID+AEjNCPrpeHTZ1Cb/+YqpoEB5wpz60BDAsMMwz
	 DfjF+hMyGxZG9cYlXjMTpCadOqyqS6JslhHygJjkLkxjFWimJ3QFXtHNTREXdAXtRI2Io
	 z1FJNLGcd3Xymat4Pu3It0yDdirrGZ4NKMFYojCfE0nyHOikRB1gK4vGCX2XrRdPKhoXX
	 IKUP7uha7oBLJVcq20tuwvy8Zm3+INP+2rUGB2ObAOTvTAjfrUxfZ3NW17LG5kKkbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dCW6xboVShvK6BXcKUk3+w8eNs87YVFBvzpbqmml1hc=;
	b=tj1QDmQVUTJrTxdDRCu/BL2kYvlo6z8vijHou7KvbAKImqymrYue1WyPUc8yMWhVe0HQ
	 KEOogzmT2QUmv6pa0Dg23bAd1uyNzJVZPL+KUn3zvcZjTqBGfuPpfTSsPKmJ8hzuEjre6
	 L5bGAYQam/gh9GX4aP1SElvb87LLpqrEQYiNgYLoJZfpxoeBhYs67khhnAyrmEJcnZLhP
	 GrNEHTaEs0XQoRqC+1CX8KmSeI70cnL9v9zWVCcBCb69x88Ypwla7M6g+eia8gkXM40Gf
	 mqrTAnW8tVER6ufEjOKsutjyEFAcA9NScSthq+2Ug+y2IlsuvdxCLd2xbgLfqoh6ZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dc5DLMyC;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551EA606A31B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 13:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dc5DLMyC
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so5875675ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760782; x=1793365582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCW6xboVShvK6BXcKUk3+w8eNs87YVFBvzpbqmml1hc=;
        b=Dc5DLMyCvdPYUuAT56E8MpaoE7rp8DKk0xhLStcbZ1leGc56clcDKUqo6+bQ4NDa+U
         LqZiXbq2+svfUCuJWO+J3lnRF9zia1Yr4wBXQFacE7RRB4Xyno6T5U/63ixf1CwxkrEk
         1Rqpf6uOrFx8GP2cPF/V9IjJlIBrS9qY1zVk7CxeFe//hollkXUdPCgzbO1vpm1vFFpS
         lPJTLSF0SYZ0HEL0CCRwkfEiv1glm6TEGc3Uf9G5w14Gd2GXbrM6Gqxn53sL1TxNveBV
         1dngriJaAjSxQQPUZ/vvdqSB5xo7zxTIeEy5Mdjvy1ZSQKdjR/fX5YdAw3KCSDXhRAx2
         VMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760782; x=1793365582;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCW6xboVShvK6BXcKUk3+w8eNs87YVFBvzpbqmml1hc=;
        b=RYu0rY45mNYi/d+AlX/Cipqt8Jc6MKkUcc/o2lVUBUbheHBIJXKPHvEKpXEC1OAJ8f
         upsdqKIIjXUSXJ6KTNsm8ZlYalx+4tMuoyvYy+MOwutIhD8BCSn70hNrqIIlnJ/f5Ckp
         JpuRO6uUf5AaMJux/TmQ65BU/QnB2Ohtb+jKUtEzpoFtPs70ScfioxWjOxyl7MKJg/O2
         Wjve2cMjWM24OtUs84WdsYNSIwfFocEHk7Ff2S6RR45uy2Sx60VV+n5hRYtOYb/bXzbe
         OeoZKuhOV38aFhYX3LsrUbKujlkyddX46IvMrfGmuPzyvL5b70bmOFeJtD4oAkmfx2Sn
         BKxg==
X-Gm-Message-State: AFq9FYLNQ6JSGyRGH2Fm+5LzoCHQc5+Gp7QkwZxLnugKJanFE1IPR6L+
	QmUw5LrONaJt1kAshA1dY3zC+5Ic2Di7SM/+/MNP5jiT4XhLlvzjvZg=
X-Gm-Gg: AYBFou2sB3wvIQbDy0LjiWZcU55OxCPuoc4+PJ0pJ15yoztauRmRQ7NL+djUxqJoCHb
	MTAh5MDL5p6abOdRnhMfrPwCXJnEo8CVdBqiANURjnMEwcrARxTM2AEL3zZiHoDTlxUdq0RsGD2
	e9W8GcnCiyjnpu+ICIL9SGnmMWCQJr8I+a9aQ2YVp/U4zV2t7nd7n9JESGpRdpau6oKyjEG0K+L
	83Nxp4Ec/X/dzHPVzSnS6lfxT8jJ2JeXcNA6PiE8wtSoKaipMQjPq9Q7ba2VzgGsTUWJ2oHL5pW
	OroLV1iQM/X/jFHE2w4hyX6cdPeIgxpOG7EWrzERZKj4vUo96/b2ARwfjp/Ca33hPdian7m/Si5
	+Il8kjSOunlw3fxtA1yXPbZhJMzt30kgNFB/Nu9mBHdaIC1CSwhWTaaUUroKHkGWJA8V1OXiKZL
	Ku5MQbKdEZc20byvIx6UX8mzmM4bfGFAKsvgVpSiewqJvTZYwEAwngcPZ751cmxY4zhmu38JfLw
	cAmS+Cn/iLlX3p72mlfpViDVGTY4KMcBB488k+BnaDnsOwHW3OaB0LZO4h3iOe44A90vou/G7di
	83OtsOSF9A==
X-Received: by 2002:a17:902:e5c8:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea7d09b8ebmr21044275ad.20.1792760781600;
        Fri, 23 Oct 2026 06:06:21 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b4fe14fsm9877765ad.70.2026.10.23.06.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:06:20 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: tomo@flapping.org
Cc: rust-for-linux@vger.kernel.org,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: math: add signed division and remainder helpers
Date: Fri, 23 Oct 2026 21:06:09 +0800
Message-Id: <20261023130609.178777-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021.183700.735437784476089878.tomo@flapping.org>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com> <20261017111134.22546-4-chenhan0017.work@gmail.com> <20261021.183700.735437784476089878.tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tomonori,

Thanks for the review and the follow-up suggestions.

I've sent v4 here:
https://lore.kernel.org/rust-for-linux/20261023130413.178487-1-chenhan0017.work@gmail.com/

> //! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).

Added the module-level link and checked its generated rustdoc target.

> How about matching the C function? Something like:
>
>     pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32)

V4 uses this interface. The 32-bit path returns both the C helper's
quotient and remainder. The 64-bit path uses Rust's signed operators,
with a comment explaining why the remainder fits in i32. The
documentation specifies the tuple order, truncation towards zero and
the remainder's sign.

Delta::rem_nanos() takes the remainder and converts it to i64, preserving
its public signature and panic conditions. div64_s64() remains available
for full-width divisors. Both helpers still reject zero and MIN/-1
regardless of the overflow-check setting.

The updated validation module calls both public helpers directly, checks
both tuple elements, and retains the Delta regression cases. It includes
i64::MIN divided by i32::MIN, whose quotient is 4294967296.

I have carried your Reviewed-by on patch 1. Since patch 3 now changes the
public interface, I have left its v3 Reviewed-by out of this revision and
noted why below the commit message. Could you confirm whether it also
applies to the updated patch?

Best regards,
chenhan
