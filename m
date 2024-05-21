Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E557CF39
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300125; cv=none; b=q2NVF/Rk8DO3frtunjUYCdrBNd3qQ+D35iRTEVFuR8AqEbt884q30ba4RGN15o6R7NkMij3t8RGXpZAre/SA6IQlpufJr4GEW+2qH8fukTEOafIt9JuATcprfku5NuSLmj8UuIvT2I+5uqgBCa+KvwGThAWJB1h+fWw22Owz1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300125; c=relaxed/simple;
	bh=IRC2K7YZ6ze42KPSczBsuz2TVR6aN2+8yYeRSYMoCrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HF6y10Q1hvBIpcmB+lOyvb4SOQvc1uktO0CXF+91p8qN4+XuC3JsoobjfqTciYDedQrSxcrKnghRPdzAhdd+JZmVyjsarqcs0XlxAOdyValqbDJQyFnhua5BNJ+xrJPnMkftLxm+pR+W/NdM0jZMYdfnfdxF48Hft0OHXpzB8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=v3FN9nio; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="v3FN9nio"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59e4136010so906688366b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1716300122; x=1716904922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+GtHX6XKY9tFUoyMK9bmqW3d4RhtWji6/gwmQ8MUq8=;
        b=v3FN9nio3UnjYk5B7EbKOgCjPVeVJtkwv9gtNDLz7w0aY6q5jsi+aczqqpiPSZ6q30
         P7evKu5Ox0fzGNdS+u09rYYxAIuZ3lcPVSdmNv83jLbLNYn6g39t1z83UG0GzBzPZYAd
         L/DbompP7OPgH8Uf/yIi7kNc9/28+m9oWCkAmamnAS2vd96eZMVG5oiqza/szec3+0QU
         ItFoMmsRrHbSO0brr3z+BI/ZYkIC4us6n9UviQoBzeEX5mDS/rCKok2A/0xrhccsiDq/
         g0QNh6gUDVmyV1R4OE0jXFfCgDc9TwQ8wJ6kWC9vmn3lSC6uI98bkc3H4A4NbA9ubRMc
         fe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300122; x=1716904922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+GtHX6XKY9tFUoyMK9bmqW3d4RhtWji6/gwmQ8MUq8=;
        b=T2jvUdZ0RNyvd9G73/Q8ORHph5hi2zrNbjKlO11huDSgPvGUIly5oQdvzd80k9CKPR
         aF8CA0Lqt7o1dXq3BVzywOXG/akDu4SZCY9F91XgKn6/7Y1gW/Xs6mIanQkiWt3kjsc1
         H05bsxPbmxilR8OKFvzZobx4XkB8Mkmdqomc/oHjK9Ua/cnlmA5EeoF5ngIZ4InFSqxF
         d16s0pZdYenmdEpPq0LVpG0PawA80WsrGh/qqcIfTJMk/ODy+Xrwu5BsjIEqoXa3esiB
         Ic8I0AMZaTCmphGEfZhsfVglOmh3bsvMJPRRh7Jp+LOLrOs5ywA8x54HantxKCiQBOoe
         0vPw==
X-Forwarded-Encrypted: i=1; AJvYcCXiDKTDxcPrwL+FJLwfUmOk+HpV+JDcDowsUad6/O1sFMiJ+dK6vId+S2TWK8REPc44kp5sCzDxdVEzV9qtMmE5YTaNXTzZptEqgKArLiA=
X-Gm-Message-State: AOJu0Yzqx/oaoLjtwXOv2FPqkEYCEfMKQbjDqZ/BlrxWQxa0Sa30Jn8g
	Oy7CAN3uw+DoR6xbIT5bgP60ICSYKW4rsIS9kR7iOfEhSqjywTDB6KpsQs2uPHk=
X-Google-Smtp-Source: AGHT+IFmX7dJz+Qrv6+evrNe0L8CcN1Dd6QT6viHDT0Ot6ljSfJ/JUI7PcLoYlK0Avc/f7E/crLbLA==
X-Received: by 2002:a17:906:b0ca:b0:a59:9c58:763a with SMTP id a640c23a62f3a-a5a2d5ccb27mr2044629166b.46.1716300121938;
        Tue, 21 May 2024 07:02:01 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm1614766266b.225.2024.05.21.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:02:01 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.de>,
	Ming Lei <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Cc: Andreas Hindborg <a.hindborg@samsung.com>,
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
	Niklas Cassel <Niklas.Cassel@wdc.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>,
	open list <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for Rust block device driver API
Date: Tue, 21 May 2024 16:03:22 +0200
Message-ID: <20240521140323.2960069-4-nmi@metaspace.dk>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521140323.2960069-1-nmi@metaspace.dk>
References: <20240521140323.2960069-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

Add an entry for the Rust block device driver abstractions.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..62a13736e569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3657,6 +3657,20 @@ F:	include/linux/blk*
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

