Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443071;
	b=rw0OfkD7AwmfWV2Pu6yNUf0V7av9gSEEeKx4L+owW1N+9zRKJZe+JMIEGzqEzZmx7KmF
	 idPrmu7EL8sFGrPHoanzw3so6kJVIl8oVOi9Fspoi9Wbq3c0dPaYalNZp2uhqJNPlhGGr
	 GZSxq18buc4+hAUrt4QXZFI6U2/f0f7ErL7YqxdedX0YNHJMLeWgUYlCzRFardLElrCjB
	 Ejlzg36gN7tSoHjdeaFp5ehmqwfxrrvDG8WuKQpq3jIVGgCQbqzCsjdZAG5JrWkUhlkE7
	 +RxCfSP+N5vn9a6T9aZdgp4STXJuR+LM9zfd2haXR12vuiwUFd0XcwqwRBpqzZsrIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=51xyznyCe9WelvYeEXo4BU/h4Ecjz+qWRQ0TYPxSgHU=;
	b=jzdXSqkCgDBmgj9sFKb5AETR4bCWLGonIJh5n26i6xceUOo3jEaGk7XpSa/5BTUwjana
	 wQmGbo/ydJ7/Aout6aRApf4QKKGQYPUSNo1R3Z3ZvS53jmLUGeAgFCxnM+dpopp7u+hP1
	 JW/8PMiVg/oQxg20YPnClYBFPe283BMK2RzsfmvSyJeIrnW7rPMjviPQeUS8I6MnwUADE
	 1eriqHsiH6RIePw9UplIE4ek9LVy3krDG4t0E5yfKmcyZmEjzq9N6B0rp6hzqinx3MCkr
	 mmI079UQVuThEzFI3IiRNu2DlMzT1Agf0zzuT671X6iZMhRlRS6GAMbhiaVhDNydDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPQjtw2S;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5D606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 10:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPQjtw2S
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so804125eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793443065; x=1794047865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51xyznyCe9WelvYeEXo4BU/h4Ecjz+qWRQ0TYPxSgHU=;
        b=dPQjtw2SACLf3ETR8QxkgR7Te92fDh1hjirWXN2bkWeNt6pLlVwx0jkz2uxXVdSy2y
         ZfSbPGx7c7cuhDDPh0dOiWeHrgZM3AWu7uztKwIHin9UcHol3WqUuw8qalRqiUf0EfYQ
         JblG3WKndZMaKJElZJLujp/KUnXKp/NS8oJyNyIllfNP7rYT7BqqErkZmKOKNSQC21Tg
         xXI/FuWmlDZuLDMkCxI97IUgfbybSoAHJBW+Fiww9FJ2sQY6+Qkv5WP+KVqf0UISDGkg
         n4qBEg5fhJXOtqpk7wVABCK1hGu7SutDoHp2DKvKHROUlsRhM3d1G3zrAL+7AgLmoxqx
         pPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793443065; x=1794047865;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51xyznyCe9WelvYeEXo4BU/h4Ecjz+qWRQ0TYPxSgHU=;
        b=htRpMUiH8GBgsKET5x+PhvcSu3z2H9pa2Pn2TuMORc27eOQeBUoM2OU1vIpUIGSg4p
         hAkSUBK37McYrCPZQTDcvKnr3VP3XSLmph0KGAcwn9sq2z3W/nDvyWPAy4dopQcJVrx/
         jtTZi6rGEIYI0UZio+KwHhW/D1eEPPyFB15T3X4jPXnzvNhbnYUaI9HJqL7L432LhmhI
         kYhT9rkb6lxUAZSdu+wqyaPGvQ33+euYzPzcm9JaRVD5vxfbiItcqIexgu+fWT8MLQfn
         b+5n5D73jYWtRQyT1fbuUo97YkB5jL8BIp7CX6mH+7/Ttd5Kqln6SL/kZfO27kBHexRg
         qgYA==
X-Forwarded-Encrypted: i=1; AKwUvBwYk/lOfABqArFYO1i6yGzM1IFw+3zSYRKQkOcOGv/iObv4jNzWK7+x5HRU12cOuEi4HQBqVR8d6bTLYZpfpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRDXQhqI1eqWTqQz3wyLvWxKo+R0nhkVty7j42y7JesnFHIWhg
	2+8ArezJsQQK+UQfmdSY+07drwLCKqBvfIpzbsrTk4gxsOEf54ue7OI=
X-Gm-Gg: AYBFou0d1BN/niXVcHd35HoTxv5gFa6VutvnZDxHvmUcjNwP9hQBHF3F0QGcnPsWspD
	iXQWSu3baJpKj6eURERwuS9FTN8+9cx1LSg06zZot6hE1rdGt7QabPx2K/buxcBbrbqHccs58ni
	N2/PBATzG60LlCZpD+VqIVzHP6UYZRMCSTJBgFN4z6J8rjDQgKXtFOro7xRvMjimJ5RUzrlS5Op
	M2IjDchFXqQPj3Po5f0RAxoxJg+XCwM/wIdgeSU+tP6BPcCtb8gFd+wvrHpeg0smogry9kgerpu
	gdxOzhU4lSyWCHff6fA7QX7w64I1Umk3wd1r0DAofu/jYIQhsED291Y5crEQbZ1959THYDiNCb3
	A/LzaSAW5LJJmBIJ8emlNSM3d3sPbjz80eEMGYlAL5jsn5IpTzNktt01vDgP54YrZN8nLx8SlLh
	Y1Sg4D5bD1uTe1Zk8tH2Xc/aNReguARlt99BmPgUhoVFOaAL0ZxMSQvQrk6EDoRiV6uXi2Ovyzw
	WYEk5eGTK1kjNiAbyb2lkWibXAi+ll4FuwdyGREF3ejweL9DQlw3r+d2R5JL/WAXBk17q3nhjEE
	WTIpcTlOjImPjzVBuqWoxCOt2iU7zjs9nqL5bkamHNZjqP5IhLXj0yWC004vfQ==
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr6495441eec.9.1793443064825;
        Sat, 31 Oct 2026 03:37:44 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm17019810eec.3.2026.10.31.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:37:44 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 0/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Sat, 31 Oct 2026 18:37:34 +0800
Message-Id: <20261031103734.24734-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030020209.3833766-1-tomo@flapping.org>
References: <20261030020209.3833766-1-tomo@flapping.org>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tomonori,

Thanks for CC'ing me.

> Both series use the same module header, so whichever
> is applied later needs only a small rebase.

Agreed. My div64_s64() and div_s64_rem() can share math.rs with your
div64_u64() and div64_u64_round_up(). If your series lands first, I will
rebase patch 3 onto that module, preserving your unsigned helpers and
the common module header.

I have now posted v5 [1], which only changes the SAFETY comments relative
to v4. The first two patches still fix Delta independently of the math
module, so the behavior fix can be taken separately from the extraction.

[1] https://lore.kernel.org/rust-for-linux/20261031103206.24051-1-chenhan0017.work@gmail.com/

Best regards,
chenhan
