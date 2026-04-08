Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF33D1CD5
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656846; cv=none; b=TV9+Fi7cqWwj1GoBK8Wp5hfeu7QwRYpQkHzjWpaktujGU0fOX9xr/1Hte7oDpDpp9r59ENrWSTzM414UVwQC0DC0f89TR4Fsutt2CQDNjgcVyNToj1g47yCTyok9jZ5xuW/mKeRT5u+qy72bUNxk77/3ng+32urJebdDu+YpZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656846; c=relaxed/simple;
	bh=Ajh1kH0EH04xoJ5hb4yQC9k86L0NK6LiOGqekq+uiwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6YKZvwy/3M4G/wSkSgG8Oy3lm1xdzrFDrBFQhHPHysrhWIQTgcJihAPtcmW5L+qJ+aTL1pog3ya9ykWGapJ7g57zdfxnPZUeP312+ZbFoP8e+C9H1RJWQkaFrqOObm9NyG4jtKitlmkA3eJIQs8QNB+RmbMOmqNzUCvn+fYMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=jTmfBXcp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="jTmfBXcp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so6738195a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775656845; x=1776261645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vErTInlxRjeWcngKnHXzSGF2rVJW9g4tJWcacgmMs4Q=;
        b=jTmfBXcpDpNuL1stKo2hJ3wVIm9/QCK9P9WSujueIn5z5NCxESIt13qTKp3iB2cPbP
         oD15rHnkkDux6JxGXdDnL9gkA8Y8/+ZhA0KCDWEPB28H5Clf+gpo4+y05LKKLbbHdfOG
         Pe7ttJzJgkmeW2T3W3DLH2Mw6ex7zmbA8VQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656845; x=1776261645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vErTInlxRjeWcngKnHXzSGF2rVJW9g4tJWcacgmMs4Q=;
        b=SJGEQSCzowv/d0CTHm+qfpUnj3VVGatuXarmgaVpMdouS9GgNnX8wOXYp3h5MzQBE7
         2N0GEYM1HAcbFS7LIG0NZRh49DcLbzIF9mkUvvUHdIyjUDydX9DVdMzvqNZ38O3zfWr1
         SFdz4kFxzRxUR9IQbw4ePZHvCeEImoUTDr0DQUuaUOU16FDCJzbJuNCkggnNjkNbvzB1
         //5DflNBFjFyEEXeI86CPAp3Jc7D3B0i7yXRqGsbezE/H/v3h0u++dIBzoCksu3biOwF
         JT2hq8Ewaf1j7NNxp9vQe3zzA4L9mGk6G5MaAJftAJtHpmsKXXSjD+o2az7CqWmnKYX0
         H7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ci7HFRLkI874BE8dOYBbf57vvSoAnEGS4rJQcxxdeMMSLI85vBMlAcz+MtDong7pznb4cQga9Ucq+CZLaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJcUunxo4l8VZzAcIYxGkXlJygq57kCEQXZo7GP89YCssm74D
	iAx6gzIHViy4a5BSDEossM+/6NDL1QAIm5ZvzGYa6xnQK/wnWwD8vETg7AmDjph2A1k=
X-Gm-Gg: AeBDieuoZoFP7bvz2YeLqUz32/1oRGQLEkf2Cyr0FGK7K/5IHacPSW4FAspIv+L6Au/
	DtIB7fjJWYzYJwHoddPVQLz/latl2K0pdZlyiePbFjhY1P3tge72gtA5XiNcIlKIstCRo0Sj4AZ
	SnXUgTn/VP4Cv8A84Ulwj15VkvTOq13Ezl0g1ozNCPRjnB9Gfzwt8djSt8QHHwkgldz+cDiqiG9
	MRnqschVOAhDlBhLdjKNMjAaLT7UkAeh9dbRv2INqMhgWm8Zm9PFa4s3MM+2oDNKIuh+kWyj+55
	JDzmS1Ceun5BI3yC02j3RYcOjzsohZd/K9yRDtxeTQ0I6qX1A/G/knhHrd4cqqXRtMJyowwdRwH
	V1QO8vd8AdbmYEYdKH9+JSSW55oGuxdlAjmF0YzLECHPE6/3QGGt3RLpQWVm52mEQ3F417kYs/0
	kBvAqQwjRWgggHprBeLGpB63bYd2xEs79Y9+Tfi2oVXiicymwobK3EQwQgcDs=
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b281802cacmr224321255ad.29.1775656844749;
        Wed, 08 Apr 2026 07:00:44 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747612b7sm204465145ad.23.2026.04.08.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:00:44 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v4 1/5] rust: bindings: add io_uring headers in bindings_helper.h
Date: Wed,  8 Apr 2026 13:59:58 +0000
Message-ID: <20260408140007.8401-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408140007.8401-1-sidong.yang@furiosa.ai>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds two headers io_uring.h io_uring/cmd.h in bindings_helper
for implementing rust io_uring abstraction.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/bindings/bindings_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index faf3ee634ced..01f2c6044ae5 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -88,6 +88,8 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <linux/io_uring.h>
+#include <linux/io_uring/cmd.h>
 #include <trace/events/rust_sample.h>
 
 /*
-- 
2.43.0

