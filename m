Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9541238
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 11:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327972; cv=none; b=T6Bf8EKLkXjS4vHc0IhJMAGXrQxb5tdm/EEHZgGf8r1RY7rMxNW82xRlDtj5tAs7icvATYx8Kv8udGuc+JVa2jMmT9kHhZXThA0xhdJhI7DqaQfcEMNEW8ZW/CF3pLpDx1L8dryCySXfoUp621GD+EzOxTGsPtDICjrw8ryYhQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327972; c=relaxed/simple;
	bh=poKb8VxBrFQtoK1H4oQ1UgXa3OWgewJdw+oLXHq0Dns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW6+QAVuU/3a/0yqcb2ZsY2K47Rl8FGbhSFkp/dpKSnNXG8iSH0WU+zK/Gb+Wdh8y4BtKv13LU+IbYtX/6Uvt92ZxQrA975Nvi2hsD7Jds4OXK/AyloTWilC808TkkDcIrLhQwJzxxQ5O3EEzyY92kHALrzwciVOGED5SGCBANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=TPwjM3jM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="TPwjM3jM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44d084bfe1so620036266b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1710327968; x=1710932768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJhpLaBye+vDxABkGVxNk0R4/Je1BHTggYd+F9CS0JE=;
        b=TPwjM3jMqw80NkaKsRfTJcf8kAhvMWN4NrwL/mKZKZBzeEAgNwWUAEH2UFzY1ZyFXZ
         95PP6VA5FBk8NGCFWrMiLp16CF2UmGsZD1jK+R+JLTbxOfIR2Vwfe5F1dH3Dqo+HhMHn
         DD1fvIA98FBH17Zqga8Axn7fuwA1xpTqo8pc2cBRDFDPbqTgw0Zyzl6PLQw/oma9M/pK
         oR1guAO0pF+al7Z7EObuYOMOYhWuFljZuwULxSJEOKgCC+dLdD//C6Vt0PZnoFoOg4W9
         1IcWM42+GtYqxJVpl+imHtn7MK/0ORqFThIS00vHmONRFldclB2xPughk+iFTdAxBwvF
         xgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710327968; x=1710932768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJhpLaBye+vDxABkGVxNk0R4/Je1BHTggYd+F9CS0JE=;
        b=oaF+TFaXsEcWVRGgg7k39PxZEJEqxW870Xk6yCM6uSp0GvcMphTa/OsHBByYrk7/Xn
         ZmaKri1smM5rma6K/rzMbeyWKMJdaQ2W1QtD+Uvmb5VD0+j8dxRRl5ek25PkYRyrTV6y
         TV+fzTTsiwi2bM+hD9EP1Cqfw7qlrNdnypmF3RNGOpN+Nf9VHLduQu5/Bst3lkvxZWHb
         MlPRHDgd6t5OLcOKdPuyDtDKiad5xBLzftvcmw7igtC1TyCIeMOpSACi5hRbBiZdfsjA
         zcBeD43AIVSW+xwHRlvMveAKPCiyPBnUm29GgMuhuo5EL9EffZDXQA4/Q6TUvS1clF0V
         +RmA==
X-Forwarded-Encrypted: i=1; AJvYcCUgDk2shkeMbYakBPyetQEj12ORw70FJZIEUIyAQCPjgwPHDyI5S6nkle5ScMStMj7FyGhefo9KLXoZwLJZ90M4NF4dZ0a7boCOhfqDoMQ=
X-Gm-Message-State: AOJu0YxoMw0Mgbm8PJnCKHXJYh+FcuYn7dhZSzCLdiZYc3vgojty31qA
	ZxU5UOPs0n+LI0L/bhk2TSIZtF8tqeG+6Thu381hdjAxqeMXK24KZbwTbmjQWbg=
X-Google-Smtp-Source: AGHT+IH2kW+8cJvn0ZC8fmOzX8cVltqW6h1KgZezqvXcb0+MfBFkrVtJmrcgIoAGxQxFO9AZ2LURKQ==
X-Received: by 2002:a17:907:8a85:b0:a46:5dc4:dab9 with SMTP id sf5-20020a1709078a8500b00a465dc4dab9mr951325ejc.38.1710327968092;
        Wed, 13 Mar 2024 04:06:08 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id bf2-20020a170907098200b00a461e206c00sm3397412ejc.20.2024.03.13.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 04:06:06 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Cc: Andreas Hindborg <a.hindborg@samsung.com>,
	Niklas Cassel <Niklas.Cassel@wdc.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yexuan Yang <1182282462@bupt.edu.cn>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	Joel Granados <j.granados@samsung.com>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: [RFC PATCH 5/5] MAINTAINERS: add entry for Rust block device driver API
Date: Wed, 13 Mar 2024 12:05:12 +0100
Message-ID: <20240313110515.70088-6-nmi@metaspace.dk>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313110515.70088-1-nmi@metaspace.dk>
References: <20240313110515.70088-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1aabf1c15bb3..031198967782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3623,6 +3623,20 @@ F:	include/linux/blk*
 F:	kernel/trace/blktrace.c
 F:	lib/sbitmap.c
 
+BLOCK LAYER DEVICE DRIVER API [RUST]
+M:	Andreas Hindborg <a.hindborg@samsung.com>
+R:	Boqun Feng <boqun.feng@gmail.com>
+L:	linux-block@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://rust-for-linux.com
+B:	https://github.com/Rust-for-Linux/linux/issues
+C:	https://rust-for-linux.zulipchat.com/#narrow/stream/Block
+T:	git https://github.com/Rust-for-Linux/linux.git rust-block-next
+F:	drivers/block/rnull.rs
+F:	rust/kernel/block.rs
+F:	rust/kernel/block/
+
 BLOCK2MTD DRIVER
 M:	Joern Engel <joern@lazybastard.org>
 L:	linux-mtd@lists.infradead.org
-- 
2.44.0

