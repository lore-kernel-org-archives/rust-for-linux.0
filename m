Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558926F2AF
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770772110; cv=none; b=QnneYQ/Y1Na9PvuV0Y9rXh4MkpO4bR7R75D0DZGamqFxozb8RzbHo9CA9kZTXKf1kjzDWVAFYtzedfcPtYr+b9S86bkhyHCCXp7t//GWKminIBrnwHGLcgAHP/Q4NaexgrwmEk3T6fuP05r3lwmhVaWkS9t8BpPkwcMuaiHuntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770772110; c=relaxed/simple;
	bh=GyTr5A2j9IIqqKvUDAgCa+1wQmdDWS20FZz1ktFv6bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OWEZ+ysnWq+93UwMfMAPOZRmTMUiyLHIMGVQ8/32IpMF6yeFJ7thbYVnGZtzr5IqBA4u8ZfLGsX74jZPxbQ5sV6EI9qP2VZIGcicjfOTNj+nvgcPqxJYP1T9cfGN9tcP5Twv56Atb0BbINKd3DdP9TzWVJnvT1288Jf9VrtM0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUQn/DBf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUQn/DBf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a23f5915so42008265ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 17:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770772109; x=1771376909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfwWp2t/9khjgvGcWC9Uv1y2hbwrcLMsb6xETQEevAM=;
        b=YUQn/DBfy+CWjNUtUKLeYw/CqmjWrxN+jxw8r8RX4UlS2U2fU+yZCQ49OcxfTtqsRn
         YajBQ9rYxioxk4aUvcYN1oPu/CIcEOlBtmEYA8YO3kBA3eTl6RKX9Po8yYxfESIZXejp
         ky4RoKTU2iPYbZjlGjqwNbbWDoiek95MUjh2E4dvd6fkTAFnroK343qMkbQr3swsIQJa
         Mznm9/ZmL7W0CQnBhQML2Jv2sUCjOl/jtGdrBAT9+CFlhMyHTuD4msQd5eCohk+mqDM9
         O96glwLgFJ/u92UiJHP+ju/WDauMg4XnM0E3MtDQARCj2oNp2sBn0Qvp+/1Xxl6aFa9n
         aktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770772109; x=1771376909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfwWp2t/9khjgvGcWC9Uv1y2hbwrcLMsb6xETQEevAM=;
        b=SZ1dh62PejBUSWrFZnfBLDboNIQGhy9f2jMH3ICi9XMHixJCXnNr1SYqxYG+iQllLb
         78lLT92ZYO8qCnzBKNQoyjmiTRIDIEWq5xJEAQv+yRSBzCXHoLSSfoQnu/iFEfQSYoao
         IVCx0UHpSimyhXFd1JNxq1OI+6WojhxME0xMbHmoFR5opSe/fnr/b8+geu4juzfdDWHW
         6gqTX4Nbnk2SSGKEHH7q098BNJ1lWWaEp5qU6iGFW9AyH41JhG5eH2fQa/KOsR6y0N4K
         u9pHEgCRg8M+y/zEep4S8YIb3mJNOUgyl4oHF03D594UUsDmATAqFpZoBJ7xIDxPDfiD
         WdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWivF+SJ8Vt9vnS2i0kls5mbfJ3NbTEAmnNgPfbHYLEcCbBpZEC0GxrqWFT1yErFl8xG5s2eDxL2JPhWMYRUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGgZPPm7Jcpxv6K6Q+4qTuC9g/YnACOctUDhOUBJMLYlQwa3X
	cqMXP9bsbtsQE5Xyq6C7Eb8dQkFmvI7bKIeG89yoNGQ+fxWmBjpKNCie
X-Gm-Gg: AZuq6aI9xCpQiLJJ39SmFz7ejuKh0lhYg3ISSC5SXIUL7BL1cU83VAiJj9r7YD7Ocdh
	Xk5saHYjnouIC2wQWfB09WhodKSTbfAaDJEqeMb+AolWG/KVWArJJXDlwSMot3AO/jlqEE1uNSm
	+xBKv7QMpy9FpnFbgnwDqn5CjFj4OwIBFqwnYmYgX0wxMt4AUNJrE92kHDZU9h8IZc24RzKPTOy
	nXArB0ApeUQBKmtQ1DH05KcVpr9jlMkaESiFCBS0iDlFMotcxCFKfvR2m5lPbUDt9ZMXTsSDOLM
	xPVLsKtdD6Fet0KD3wiAVL2NSamXDp7sG+TsvsSsUWk4FHEUv7NDETNHFo2HmH/hdJiCDB7rIZ7
	WVx5eiMu+mG7w6FogOpsCVZcpPVNe0j3U/6IPDD0sfSFXoSYd+8EO5Zr+rvDXaWDoNrEx+s5jg6
	nUXVOQJnuwTi1DE2M6JehUkIQ9GXnY9EbJt87EvQzV5nYlSi2f0ghed3U=
X-Received: by 2002:a17:903:1108:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2ab29ce581cmr5116145ad.25.1770772108812;
        Tue, 10 Feb 2026 17:08:28 -0800 (PST)
Received: from [192.168.116.129] ([49.205.41.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964c62sm3074225ad.55.2026.02.10.17.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 17:08:28 -0800 (PST)
Message-ID: <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
Date: Wed, 11 Feb 2026 06:38:24 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
 <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
 <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@gmail.com>
In-Reply-To: <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/02/26 02:41, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 9:58 PM CET, Alice Ryhl wrote:
>> On Tue, Feb 10, 2026 at 9:54 PM Danilo Krummrich <dakr@kernel.org> wrote:
>> Yes that's what I meant. Only provide shrink_to() for those. After
>> all, if Kmalloc never actually shrinks when you call realloc, what's
>> the point of having KVec::shrink_to()?
> 
> Nothing, but eventually we want a generic impl of shrink_to() with A::realloc().
> But again, for now that's fine.
Thanks for the discussion. Just want to confirm my understanding
of the agreed approach:

Since VVec and KVVec are type aliases for Vec<T, Vmalloc> and
Vec<T, KVmalloc>, implementing shrink_to() on "only VVec and KVVec"
means writing separate impl blocks:

  impl<T> Vec<T, Vmalloc> { fn shrink_to() { ... } }
  impl<T> Vec<T, KVmalloc> { fn shrink_to() { ... } }

Is that what you had in mind, with the shrink logic duplicated
in both? Or would you prefer a shared impl with a trait bound to
avoid duplication?
