Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383318A6D5
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729331563; cv=none; b=iUrDkxqDBpmYXSJ0SJ37XNU3r24SVx6bhwOnoGiWDRlZw8xteVo1ZKFcCGTxciDGZGPGYSI09x5o3XirMex1xGNSGOXJHiAX2FhowiuDWeG+qJ3nEM8oqW2kQjHmXHfvVy7sRslDOkDwq/fm0LPfzofESjOdM4irQrcz/6V/fYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729331563; c=relaxed/simple;
	bh=lDCndB3gKkyAAYXBBGEhiH5TPNsfVgbwUBprs/b8N0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOIiFXc/ez09YH0uulgHtnybYOWUSwrMX3i23RdoAxjzpecx8uvK8Rzw/zRbyRhc3JBisgdbT6JF0PDBd2DFRZQ4l2RjB89soZ3N/rHwk+bkfHBnT85JWemkEq37t1EpVWdfL3O9EgdcsLo5Z1MNB7IudS8t4qMKancPK7GKSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKhQxHHX; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKhQxHHX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2066362a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729331560; x=1729936360; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJs2rkh7ucjFwwoyRx8MC1MIeEyg8PhmiUNf361WLzA=;
        b=DKhQxHHXfyg1UOq6/DCLHHDO6zghDOEOvDZ+XtgQrt8sCCPURtAsl/J68w8eyi+xox
         YEX7+e2lc992fb5xQHc/JGmcIEptKqYT40B4AUoJvx/rRBQTJI69RLXB/kSmoKfaBK5F
         sBQhDTaB8o36iwJTpArF/hi/qDf3noSZdT7Nu6zwXnAy8jIS7WYt7a/v2F9eFV6IA+07
         7bSCombAYJvwAVF/Z+vQyzHqDnZcVbPnPeuw5QZyt5v/vkwqvqC/zaMkWWWiRqcbqTjl
         QweGjkjGERzsu9TmqSnD6do925Wc+xY6+xY9AaivR+895+sEWJCyoy61TS5NKaZtvspb
         3X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729331560; x=1729936360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJs2rkh7ucjFwwoyRx8MC1MIeEyg8PhmiUNf361WLzA=;
        b=BHl8Y+O7lZmKRRi43MVqUqn0nMHHqC3uG6OmpNzoCW2qf/E6lW6SkcGXbALj8fYbDI
         2iZGCKpqdJuabB9uFnIzOMWxkA1zWKkJamVGKDvUHtXSBOlJYlDngqs/6I21GwEPjAZN
         8zVNrifnwL+7EHHA1jfQlFUeDoI/zqI4vf6WFODxvdy/djEV247KVQ6yTHbLS8dtGocZ
         foO777RZKZJ78QNP1D5swyrJAwJdC48imRK5zTJf674w1+wHOB1ns61lHySi1wxPaaeh
         nnWxdLPN+vDim9DG5HmGPglyGwivHYmYGjEnMRcDOfhqh0h1iqBOabcIbDY11rSpYwRC
         B3WQ==
X-Gm-Message-State: AOJu0Yy6fQ1ZNoVBa3QsjKLOUawfGwlfKEiLcRUWtITvZ9IQVSGrtRmP
	x6gPUKjl+xgdO9G2paoxmp2wz7OWgEFaPMQwN8oWK4mWc35R3jUuPGnytawq
X-Google-Smtp-Source: AGHT+IFMydXXT1uCz1rHju9flR81E8QYN9rWpt0cRfmcrNoHl3PFxHkgVda1UJFC9JQx0xW+xCgKiQ==
X-Received: by 2002:a05:6a21:164e:b0:1d9:4cf:71aa with SMTP id adf61e73a8af0-1d92c4b7f9cmr6664216637.8.1729331560138;
        Sat, 19 Oct 2024 02:52:40 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc208cd3sm2680549a12.8.2024.10.19.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 02:52:39 -0700 (PDT)
Date: Sat, 19 Oct 2024 18:52:27 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: [PATCH] rust: kernel: fix THIS_MODULE header path in ThisModule doc
 comment
Message-ID: <ZxOBW2WeAnq_mFda@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The doc comment for `ThisModule` incorrectly states the C header file
for `THIS_MODULE` as `include/linux/export.h`, while the correct path is
`include/linux/init.h`. This is because `THIS_MODULE` was moved in
commit 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to
<linux/init.h>").

Update the doc comment for `ThisModule` to reflect the correct header
file path for `THIS_MODULE`.

Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
---
 rust/kernel/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48..032c9089e686 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -83,7 +83,7 @@ pub trait Module: Sized + Sync + Send {
 
 /// Equivalent to `THIS_MODULE` in the C API.
 ///
-/// C header: [`include/linux/export.h`](srctree/include/linux/export.h)
+/// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
 pub struct ThisModule(*mut bindings::module);
 
 // SAFETY: `THIS_MODULE` may be used from all threads within a module.
-- 
2.47.0

