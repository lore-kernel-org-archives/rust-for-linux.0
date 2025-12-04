Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7B342C99
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853982; cv=none; b=hi7RUKEaNk9kU7SVnaUB6j2PfDOs3/jLtTBA5DGZT/2EgK2V6Y+o80R0pxpP39tR1oCSzY54B3+cLSrSo0G1yzHr1Z4pu5/kACPIJNV+OK8mxV69TX2Euw8TTAUNd9Tdafjvq4SGhu/I7/YRdENx2UeCD5Dysy3VxDaqpBL7Hbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853982; c=relaxed/simple;
	bh=gpuduBE5ngF7CKc5w+w/wGN0EJhfhtx1LD4XBufKNOk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gsCc2I1uFve7bctFExFV6YbbWeDlovATv2Et3ULtmHr0+YTWxriljHH65NBQMJI75ZlTjLEWP8tGEZh0PZ988N1kD7Pdzu4WH/9vQYazIHApK7pie1ySAaPazXcEDn1PzJnCg7qdLPHLg0EObvbfLqendDA9ooHOTvS1/7PaG9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp2zs9eI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp2zs9eI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3437af8444cso779216a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 05:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764853980; x=1765458780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igKCTIjVWslPj/praAqkUjwRiMaXiYo199GSC8rvtKE=;
        b=Kp2zs9eIS2Kx4fxOhrfD3oK+K+W6BxwAJZTzy91dlV/iNA1R+ag4+FwiOQ286FJPgi
         RwtNn8KlfgOwlX1scvnNJQTyUjMjtMWlQ7XMomUKpqd3GrR81IMzcNb6YBOgnMEtUx8P
         5cCiZQNg7V5juv6D+XbCiuQdU4y8IqA60wIShSNTAjyQs1NmdUcJIzFatV4lFWesAXfp
         rGjhesov0nxQ98w5xJcPMWG2eDm7i9dWd2mAzk3gK9i61DOaWepkC1gEapPGKVuKEFfR
         NaKcn4aDTSZNkypq/HDTjQXYmlvyu7CsOQdAAgUVSkkaNoUU/zL/t4+GziizUWOgureL
         iTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764853980; x=1765458780;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igKCTIjVWslPj/praAqkUjwRiMaXiYo199GSC8rvtKE=;
        b=ibR1ihGJL7TPrZ2vXCwn/h1bV+A02hClEScgwc8fKnE0Odq/JX8Gv4u1XgDhHohktn
         u2F/PYuTAbdpAh8l8FjupESq6qKtkv96oi/+2GPZYFILnEYekxI8EJ4n5q4rQUbNhCO9
         Bi0UVzfM93QnDmf3NnCLv0Kdpfk87kQXQBAP/N+M1wcsA1Vl14azrCc2YBQ/0+anQZBw
         RwxS7zXCeXTD+cJQVgP81/XQqYWqv0FXhd3H29e1mjUf4iRa284ZedNqCXGj6QpiWgSx
         y9qS/y+uJlrc5gogDPRiP5Lkf3CaM1dYOF1dsy0ThPM5jzXKsJ0WNLNL+r6E3puqoZSv
         gceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUplG142AC/PdUnAs/yM8rxFNgcp+WKDzOVahEidTKi59lYJ5ntXDr/mJ94h/N0tVTZMQmPn8P3izT4D9wyoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8voZ48AIJjq0ZsRdDmEyfhIvq3GSOZUGAP9OXaOo4PzbtJLxq
	1LQmX8fItDRl5NiD+Zck4CS9QOdpKFJORFMKiDmNrwZIi9OZzA0fJK7f
X-Gm-Gg: ASbGncuU0TAy5+R8BFE56zKu0/F0LpZzX+pH20R0fM4MWa3oednvrfD70OnBNDdDO1X
	giKTfmX//faiopn17KNvbZEHLG6vgWu88/cBH3cMeoqAUtsvhpiW5Gio+tWi1IDEbQkeVBtaplq
	xUngtQBuAqps/B3++eYhjPIextAQJiD4eco90iYCQDCA8ERGKoY0V5c9bVYxkCNHwgkfztoNdQK
	Pja9OIfNlI5GdU6sUDQWpArZtH21QvG+yp9jcp83nwR1LXi7feOZ64rYSVPZmRtED3OxM5wejjj
	BJZhtpfUsgmzdvPM60or8MnPgEPBFyMjXc6C3jDbZJzah/NUkoJdRANfLIMFVvggrmHQO0phn5C
	OtCGyrqZv04pqlL0Mn4N+1Gc5PLYPHc+0co0ufciz4HLiJovNCDR+99swRupZkt5+G+HZ3gYz8/
	8FW1ExMwlQLwmNmq7Gy+QYQ9xom54fp+gr4N60d5JmxNz1OJ8sTTZOwhvL2ZABifyP
X-Google-Smtp-Source: AGHT+IEgfq4TftVMSfM8tppyvbbbkk6Dgo5biZcW8HvZ8wl/A44Tl2VYiC/LvriUPihyGpr8YJzcbw==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr7156213a91.15.1764853980410;
        Thu, 04 Dec 2025 05:13:00 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494ea7bb6bsm1963573a91.15.2025.12.04.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:12:59 -0800 (PST)
Date: Thu, 04 Dec 2025 22:12:55 +0900 (JST)
Message-Id: <20251204.221255.565451902531453581.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v2 0/4] rust: Add i8 and i16 atomic support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aTECy9UTxhfz3E91@tardis.local>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
	<20251203.124148.1859835796360203240.fujita.tomonori@gmail.com>
	<aTECy9UTxhfz3E91@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 3 Dec 2025 19:40:59 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

>> > This adds Atomic<i8> and Atomic<i16> support; including
>> > load/store(Relaxed) and load(Acquire)/store(Release) operations.
>> > 
>> > Relaxed operations are implemented in C's READ_ONCE() and
>> > WRITE_ONCE() macros.
>> > 
>> > load(Acquire)/store(Release) use C's smp_load_acquire() and
>> > smp_store_release() macros. They internally use the appropriate
>> > architecture-specific instructions.
>> > 
>> > v2:
>> > - Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
>> > - Rename smp_load_acquire() and smp_store_release() helpers
>> > - Simplify the macro to generate atomic methods
>> > v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
>> > 
>> > FUJITA Tomonori (4):
>> >   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
>> >     helpers
>> >   rust: helpers: Add i8/i16 relaxed atomic helpers
>> >   rust: sync: atomic: Add i8/i16 load and store support
>> >   rust: sync: atomic: Add store_release/load_acquire tests
>> > 
>> >  rust/helpers/atomic_ext.c            | 44 +++++++++++++++++++++++++
>> >  rust/helpers/helpers.c               |  1 +
>> >  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>> >  rust/kernel/sync/atomic/predefine.rs | 24 +++++++++++++-
>> >  4 files changed, 116 insertions(+), 1 deletion(-)
>> >  create mode 100644 rust/helpers/atomic_ext.c
>> 
>> Boqun, any thoughts on this?
>> 
> 
> Sorry for the late response, the patchset looks good to me, I'm just
> waiting for more reviews and some free time to take it.

Thanks for the update, and no problem about the late response. Please
take your time. I just wanted to make sure if there was anything I
needed to do on my side.

