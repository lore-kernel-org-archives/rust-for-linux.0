Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF52D0C7E
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105213; cv=none; b=tEQKO8+hMvOhoBSi+H5lK3zImf//xRUlxhE4JNAmwjj7bnRB0voTs2hkOeKMDp98TCHIBxEWOsv9UjqeaJt/P8gkF1gc7DPYaquuZ6tgA3F30WcoVygIus3T3XlrtIRadc7zfOrRioK5LqKi/T3aZtKJjRcBoE8gfpXEig28on4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105213; c=relaxed/simple;
	bh=zRhiH32I56VyWPe4Fr72V2VjcJ/u5/dW/hqk4y0Gk6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qljMroVENY8qaxgTuZNCL/E2PS7iOMvsvc1ezp8fh3eRPyh4oPx0/3bg9Qasnj5FTja2mAjs05Zl+WlSH5d9VUGnMHp658O3PZmAIL39Wa1OsH0Hqe2B8T0FxXZMd95XYLHFexUHY4AnTbq2xYNoj3V9MjKoL4Pv1QRN769cYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSJDqhVT; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSJDqhVT"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4e89d2eaca9so4311391cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 20:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761105211; x=1761710011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aRIdLyiAYODA3K+N158OGoOrRxM49M7T/gctII9qTo4=;
        b=aSJDqhVThFGaKPF93EFguOfCVn6OPZIeHfDJDeqNP6wGDr9v5z/ha8IqJxtlV6/PmS
         ETzz53ZzfAl6c4bSGlkp65omaW5CuvxcIS/+s6OsVJXZlwMuYsWzWtQ80nDXM+wV3UnA
         J2zA6rbKcGO9TYoOv/YPVwgg7Ujk+5dQbUfAu2z3vn6H60ALB2yA4zdRhknxRPHKG3j1
         Z6FdI19/OgBYGsX0dvAa9WF44ZGswueOD2pLTO0s00XwWKFkAz7ojtjFUUKlkxhSwF6F
         ioNZIXTkUJ3/qcTlWVBX/atoQXqhb23A/lhWJXRMk+cbI+jqSLqE9VCIuif1yMyt5q36
         sP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105211; x=1761710011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRIdLyiAYODA3K+N158OGoOrRxM49M7T/gctII9qTo4=;
        b=DeawRjdWu5w7UDlPqX8LdLDhS4P9ULOI3gSg7ZPkxpqYRx5+UGHdSBvMJSS7BpyBt0
         IWVo8fy1nvp0YuHg2CMF/sBxijhlkwiHp+ApoUYxFl67Ran/Jc0qzoeW6AcGUXifU4IF
         1ZxtQ0J+bDdepMytAKQENv6LZ9lemYwNIBFTp+Mf3ms/jLGNAGEy2i3p35f+8J0xiz/q
         RZ5teTjMplhrj6eIRjUPoVB674tvPyFxsb7s5Th1Y1TZsJ05U/42zJUYP05naPIiGNRM
         69etTfRlTGBqsSaAfGY2h5eTJX96FLOpUr2UvK3Tuanqar3wpbbFUc0EETVCgLCACOv3
         2DPQ==
X-Gm-Message-State: AOJu0Yys7FzoFsG79iDA2JoOKrw2IG1YQqK3s3F3FjXnQ28F1cl3lzW5
	KeY0P35OQEhOyqHkQiAZD+cGNTzP7WTLGOUNxUD5g8/CV7QJfgt7MTsD
X-Gm-Gg: ASbGncu/SaeS1SM8Ke5LA42WYirKIJtRpL9znhXxwsMEDLzmwBlK5i3SGZ186LptXiA
	FrabcPXCGDpL/+S0cgao8+x6QBtu+/CjtWIOaaorm8GXCxm+LjJNMrt2mLYY7NyYl16rDRrXTQz
	HuayxQ6Pc/MBdTm5hU0UwAGyNq+OGSUtY6dIbmxmiGh/7GvXeqDlH8h/bcutS/Q++FMxNumKqcd
	NXz6E23NJaT3BkxLoyt6kQ7jQwsySTszj+0FT6h8TlCY0rk6soLkYLhweEJz5c4ePF5TZ29xc8B
	CIYj2hDCbMKr+N+QthpEWiUP8dtLfkXoBsTHGBRsLKv0kO9sOOLuNI8DcK0tVhQHOVMBl5D16Hf
	i3z/TEkvk4kqufUHy1H/R4UpQIWtNZ6ipeevcxnykoMRqnKqBMP5KCjCkl2R1PLS2MF2n6qUSTm
	KwnfEPNxNdsdMD33oosu+YHfjZEw2yRUdXZK7/Qm+PPmkgm89oaVeKrYZhBxxmOiVgJ2iquNfTg
	cy8
X-Google-Smtp-Source: AGHT+IECF1DqbaKjt3jBSiLByYMx6gIODb85sVZjrsUQCnbvlPh0n5LlJOdNuvj3bJWC4J0vcRT82A==
X-Received: by 2002:a05:622a:14f:b0:4cd:601e:9d29 with SMTP id d75a77b69052e-4e89d20a473mr247846131cf.11.1761105211194;
        Tue, 21 Oct 2025 20:53:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab0f3b1dsm85523651cf.32.2025.10.21.20.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:53:30 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0FE27F40069;
	Tue, 21 Oct 2025 23:53:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 21 Oct 2025 23:53:30 -0400
X-ME-Sender: <xms:OVX4aP0kMo-N9xL6adRfQQJ3-vB902aRB17pBaeqcGmVrKqDUfCdkg>
    <xme:OVX4aKDMFc63gwHR14kr6Idjk3GpVH_izyp_TMFA07SdmKZrefJ7g5mv_3DAlvdx6
    y9rnuIsrAY2Og1fTjfCyjDQ2TIN8OyuAeK6NsFj2Sc2Q7G9oWNVjQ>
X-ME-Received: <xmr:OVX4aGB8gXvvuG_SR5PXhInW78URfhR7qVKS7-MYhtaBnfRNvAA4oBBOui68ZGjclqDXGyTdDTcXqSbKuPJuy7PrPCGdHWKwlTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedvheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:OVX4aLMNBvdaIiUNcLSMpWh_If7ZNXI2iOv6IIhE0t-9DOgLZnwrQQ>
    <xmx:OVX4aANapoWZUQ3_pVnpd0jUd1FLMM451A3x4_uNequNecHpHLC9fQ>
    <xmx:OVX4aPugn47FyRZ8pLNbrn3RaQOANTPqjzgfqOGArKuFqO3QKrAVdA>
    <xmx:OVX4aF8snIDVboWYbsFgCqBnbwegrWzhv1nYYn10Bh1nVfAtGBEZFQ>
    <xmx:OlX4aLHVCr7GRhbox-x5WYNih03N3sfTcoXpeEOcPVXmAUSVuBI65uz5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 23:53:29 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: [PATCH 1/3] rust: sync: atomic: Make Atomic*Ops pub(crate)
Date: Tue, 21 Oct 2025 23:53:22 -0400
Message-ID: <20251022035324.70785-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022035324.70785-1-boqun.feng@gmail.com>
References: <20251022035324.70785-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to write code over a generate Atomic<T> we need to make
Atomic*Ops public so that functions like `.load()` and `.store()` are
available. Make these pub(crate) at the beginning so the usage in kernel
crate is supported.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 016a6bcaf080..0bc6e7b04d67 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,9 +22,10 @@
 
 pub use internal::AtomicImpl;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
 
 use crate::build_error;
-use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
+use internal::AtomicRepr;
 use ordering::OrderingType;
 
 /// A memory location which can be safely modified from multiple execution contexts.
-- 
2.51.0

