Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400432BE7D2
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763213018; cv=none; b=LIzYgv6LHWF95Z3djFM4Ysa4IhF4MDu5pMlLP3wB/XqaIoOg8cM0ARVob09ndKq7V8dGoA/JYVnYPoMHTH23lrlBu4jzZ5b3QtHp6JX3YqzSvkWq/cYO9ZrNpXKvSH01tloWMPJtlM98B+psdWoV1X8WN24UZ4x4nozUK0+vntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763213018; c=relaxed/simple;
	bh=EjClcYnmOjJ6isVaB4zvN0wa9ECbXhuGPQ6OxssMeeQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hOZOO4VEgttHbVjYF8UFl2RbUdFutZi8byUczpOuVYdxxsoiAjWSTdpbVnZlRaWMNPd5E5P+A6bz7vc8fKiTXMiYN7776xlbQ2U1P+wqow2eKpTd0GXuA1Jb06g/MMhjN9ff1nloGsHAuxJXZu4Ee8uuqyai7A7e7tZi6pFRuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDHYku+3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDHYku+3"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2980d9b7df5so28541065ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763213016; x=1763817816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQy+akyRN1YfjFRuvofEAF/FlcSfFY2LjzWFePaVdBk=;
        b=JDHYku+3LD1mcj3KiXcGdkxTbLqLBUMiu07W0OZyzRchmJHLJq0lbsQnfkhMj4OieE
         on0NcAfcb1PJ8wK6lW/6vfS39z/vrAwXtcZmOwqnBKxkLFavPvkHDTGXd6xv1RjyYP/d
         y7HQD8gGRvWDlH62+vwLttwxzWZUkCZ5B5cr8hFJ5X02fl2DLZgeq9pwAQCRXhoWInzJ
         Z44ozhZR5Ol6iqwfc5DBTiPwxP2Gxu0btKSTO1BCxGZjbzZSTHWm9RwbU/k9LIErRPt8
         wNsFT/hdeGBu8DW4GMwnKrjR7mKsxJv1ZRdiGakukZUM2jP3bnGPYWvgCzNjDBBgsUhU
         dhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763213016; x=1763817816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQy+akyRN1YfjFRuvofEAF/FlcSfFY2LjzWFePaVdBk=;
        b=rQ5/ITf1e+DeXU9q5ufvDSwmANxxz5HAhrjGTc8s8e39+tXKn5+72qPjX/jBUKj3jX
         louAm81zo2lUSz8jmIX5cYRlWQ1RTPr6yRVxgTFO/3WuI/jWRPK4o0duAAtP3FhOQB8N
         24u49MyBC9WuBD7GvUj1Q525vzjY9FLkWqAfKtZGzoRadn6umw3H/xuwjPvaetrvaqtB
         t2lgXRU/OBRhSfEz/mnQ4s62TKejabtwqHThE+VgniJ9Z3HDCxYqrafXE/3KBV49Bj2Y
         DxKaPgUTD0nPJ64DKSfumqpOQDbCBLXj9s0ttjT/dkfL/HIN324Dolsxjc5KDdRwX2uk
         pc5w==
X-Forwarded-Encrypted: i=1; AJvYcCWzd8nzdONRoAU9gmMgti/ijygPlkNdBZSAGJFauthGR0xEFVEWFeM3aOMAtVC2m1oOgGoz2xTFusNpmkbRNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLRA1ZZ8mAbOYTBkK/2q+rBbNFAkQaDpiOOXjJG0G9Z6eLt8+
	i8NaAVAXJoNpdotpdA2uVsPSTiTNx9YWKgtGixb4BZh66JepXvY1hhI7
X-Gm-Gg: ASbGnct7hI+NGAXiyQifOxAhBlgIKD1sJ13OUW9mMTivcVTrsjl+ujN3vpWmteXCHL8
	KpXN0nYg86lpQz5X5h+PTB0kMtLL/OVxMleFKY8ybhLjXwubiMC1BMWmiddab4xnFkSjKzcFqKm
	CIczNLax8Sv6HbFAHZKsw1uZF76uWykmUliabD8jxi2zzBDf+SRqyvwiRpvd4uV/zrRjYEJRssN
	Rlnz6AF5/L3t8pjT6sih2WOKNy+qTZ6ovwowPV4tA2ezPTstcyJzk135vf0yMdSekqd1PKPI6BU
	YxiTs3nCofWDZNgqHPn23NLU7lb0bzLPQfSJPSxYDfqZ7olx86Y92hZzuXs7xiJU+G0ZmCAm7VD
	A8WhcnupEwiD3j6eqtmfwD3Y3YtMUylCxuNlmJio1AU9J+4X9pOeWmfPz825uStBPXGjrPFZ5pQ
	ML/YyOhGlwLqC3hqP5SsAmacQDEIkl4DZ3vRA3GyJ5b/HH9cwjgTXYy2er3iLWCczOOr/W/Yd31
	ik=
X-Google-Smtp-Source: AGHT+IGP2KPGJ33U8jC6UUFHHVbWZVukLFIh+JLhhWVKNQwtA5aGbaQPjrHnwlVE1bjWyCyoaFInKA==
X-Received: by 2002:a17:902:e848:b0:294:def6:5961 with SMTP id d9443c01a7336-2986a752bccmr75400745ad.45.1763213016419;
        Sat, 15 Nov 2025 05:23:36 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm87059105ad.76.2025.11.15.05.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:23:35 -0800 (PST)
Date: Sat, 15 Nov 2025 22:23:24 +0900 (JST)
Message-Id: <20251115.222324.673595697251044200.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/3] rust: sync: Add
 smp_store_release/smp_load_acquire helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRglTQvGutpP3kE1@tardis.local>
References: <aRgOFGLqkolf4j4T@tardis.local>
	<20251115.152220.488086212368718494.fujita.tomonori@gmail.com>
	<aRglTQvGutpP3kE1@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Nov 2025 23:01:33 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

>> Do you mean that I should remove the VolatileOps trait and implement
>> AtomicBasicOps for i8/i16 using a dedicated macro like
>> impl_only_atomic_load_and_store_ops?
> 
> Right, I would want to avoid to use write_volatile() and read_volatile()
> directly as atomic operations, but rather we implement
> atomic_*_{load,store}() with WRITE_ONCE() and READ_ONCE(), and then Rust
> code call them. In this way we keep our kernel memory model bits on the
> C side.

Sounds good, will do in v2.

