Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1487D13C9DC
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442113; cv=none; b=ps9DRvm4YhqmUT7Vvqb3GKazB0QuM2IFqEgRyCipjEhk3s7KW47hZzqXI0XM72OcPXJf/yTC7h8+BI+7JRa2OTQ1NYIHgO9vQwB1L17I0hZEyyXn6/c6ke23N1tk/bpuDZpBpWXMPameHvR6sQZaqT1hBj8PxO9ZTw7w9Gh274k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442113; c=relaxed/simple;
	bh=qc6pEF7RUK+6H2CQ8rZ3p7kYl8fLqlSHhg1GGU3Rb4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1Fhb8zMLcbm7mehOecWMfYnjY/Q+In5tuMfou5RlCFoQPHwJEBFioHl/ygqEorSyzMAUxE6eCo70jRCGxxXNx+koEshLVUjsQwFf4ORbxsyLz74yoCp/LqpQIDNiXKndexWQGndfLZik1ABI/LYEJEXXFZgqXFR42xScerV0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=fkZMaWbe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="fkZMaWbe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a2ed9af7dso4904232a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1717442109; x=1718046909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tUpFHhiF2nyw1IxV5EDxG66GkJExfgKKAw3iF807fE=;
        b=fkZMaWbexVmsKA6qFpafp8+tfilne1t/Mzl3eZsQDtMwpWHEo7Sy5NRzVfnlO3CPve
         xdrcwJpQHv2gk87HOLcbx00vcsK5gIdBwpK9LFTcuDAZjZY1qHbalrBPh7iFO7MITv14
         Gt4yVB6s81ebJLDgpJucfaViePhYE8OS8dAvbMD9ndCrAOB5Jr/duCfWoN7H7+6fPGBA
         vG+9ra/7by8SAgo2dFRra3Idrw/o0iOAFJ+JELFAheH4hPZD2FswPVCt+E/VxgGl4SJ4
         PVs3CdOfOmMAGJIFA3x5sPpNOoo4pwgsL2YaEjoTzgRMbfOK7dkY6G/BvhUJ1OUzp73i
         mWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717442109; x=1718046909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tUpFHhiF2nyw1IxV5EDxG66GkJExfgKKAw3iF807fE=;
        b=AKDWbWCS2rueD9fMx5kZNhPGFFyfhXgNoYuUvfeG5mcGZArE/Od9jjCWHrdGV7XETu
         VuopVQPPTYRdsZolzhAhvpELMwomc+BAIPp0zWov7RP2N35qRMqxGLnQ8+PD8xIYdTej
         ji5wmWbYjAgFltrdh6/+OYpd7cF3tQA8zOuMNUj03QN0hxvq2Y1apIjZLuwCD9QuYV4T
         zRr2g1Xp6McvcHoMCSAijE8KKBLqhhwvx7asBrfzOQOgLZblW7vn3XYr9hvWVDj0G/NM
         gS9Xf3QS4kw/VlNJJpYLGANdX270r0quNLB+NdxcyGLrM5hXtbmOh4Y257vwIMB5eUh0
         7kJw==
X-Forwarded-Encrypted: i=1; AJvYcCWwOCMdqeElG7gxsYPp9Iede1MtF1Q0gUavquYKaKYpbo4MzgOf6X0p+yQKiDVPCcFvclWeNY5GOJsfjD8TiwdYs2115udDsBhWBBxfAuk=
X-Gm-Message-State: AOJu0YzWZ0K+fhWobi2VnxRji94na1XWQMiL3Q5le+M7QCZX6XQMENuO
	kLe057FyLtQDRUS9go5BpgV+DCyiNlt1YaVGjq9PAE3i2y1gBeT8AA3VWe5GnXs=
X-Google-Smtp-Source: AGHT+IEoqbuKYFvpOCuiH+8gNDCu/4aFEkYl2XoFeTC/yOfQKa78lw9IaRZ8gAnH0Tr0AvYERBtSVw==
X-Received: by 2002:a17:906:d044:b0:a59:c833:d274 with SMTP id a640c23a62f3a-a68209f7b4dmr785722366b.37.1717442109264;
        Mon, 03 Jun 2024 12:15:09 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fb54esm525980566b.61.2024.06.03.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 12:15:08 -0700 (PDT)
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
Subject: [PATCH v5 2/3] rust: block: add rnull, Rust null_blk implementation
Date: Mon,  3 Jun 2024 21:14:54 +0200
Message-ID: <20240603191455.968301-3-nmi@metaspace.dk>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603191455.968301-1-nmi@metaspace.dk>
References: <20240603191455.968301-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

This patch adds an initial version of the Rust null block driver.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 drivers/block/Kconfig  |  9 ++++++
 drivers/block/Makefile |  3 ++
 drivers/block/rnull.rs | 73 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/block/rnull.rs

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 5b9d4aaebb81..ed209f4f2798 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -354,6 +354,15 @@ config VIRTIO_BLK
 	  This is the virtual block driver for virtio.  It can be used with
           QEMU based VMMs (like KVM or Xen).  Say Y or M.
 
+config BLK_DEV_RUST_NULL
+	tristate "Rust null block driver (Experimental)"
+	depends on RUST
+	help
+	  This is the Rust implementation of the null block driver. For now it
+	  is only a minimal stub.
+
+	  If unsure, say N.
+
 config BLK_DEV_RBD
 	tristate "Rados block device (RBD)"
 	depends on INET && BLOCK
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index 101612cba303..1105a2d4fdcb 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -9,6 +9,9 @@
 # needed for trace events
 ccflags-y				+= -I$(src)
 
+obj-$(CONFIG_BLK_DEV_RUST_NULL) += rnull_mod.o
+rnull_mod-y := rnull.o
+
 obj-$(CONFIG_MAC_FLOPPY)	+= swim3.o
 obj-$(CONFIG_BLK_DEV_SWIM)	+= swim_mod.o
 obj-$(CONFIG_BLK_DEV_FD)	+= floppy.o
diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
new file mode 100644
index 000000000000..b0227cf9ddd3
--- /dev/null
+++ b/drivers/block/rnull.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! This is a Rust implementation of the C null block driver.
+//!
+//! Supported features:
+//!
+//! - blk-mq interface
+//! - direct completion
+//! - block size 4k
+//!
+//! The driver is not configurable.
+
+use kernel::{
+    alloc::flags,
+    block::mq::{
+        self,
+        gen_disk::{self, GenDisk},
+        Operations, TagSet,
+    },
+    error::Result,
+    new_mutex, pr_info,
+    prelude::*,
+    sync::{Arc, Mutex},
+    types::ARef,
+};
+
+module! {
+    type: NullBlkModule,
+    name: "rnull_mod",
+    author: "Andreas Hindborg",
+    license: "GPL v2",
+}
+
+struct NullBlkModule {
+    _disk: Pin<Box<Mutex<GenDisk<NullBlkDevice>>>>,
+}
+
+impl kernel::Module for NullBlkModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust null_blk loaded\n");
+        let tagset = Arc::pin_init(TagSet::new(1, 256, 1), flags::GFP_KERNEL)?;
+
+        let disk = gen_disk::GenDiskBuilder::new()
+            .capacity_sectors(4096 << 11)
+            .logical_block_size(4096)?
+            .physical_block_size(4096)?
+            .rotational(false)
+            .build(format_args!("rnullb{}", 0), tagset)?;
+
+        let disk = Box::pin_init(new_mutex!(disk, "nullb:disk"), flags::GFP_KERNEL)?;
+
+        Ok(Self { _disk: disk })
+    }
+}
+
+struct NullBlkDevice;
+
+#[vtable]
+impl Operations for NullBlkDevice {
+    #[inline(always)]
+    fn queue_rq(rq: ARef<mq::Request<Self>>, _is_last: bool) -> Result {
+        mq::Request::end_ok(rq)
+            .map_err(|_e| kernel::error::code::EIO)
+            // We take no refcounts on the request, so we expect to be able to
+            // end the request. The request reference must be unique at this
+            // point, and so `end_ok` cannot fail.
+            .expect("Fatal error - expected to be able to end request");
+
+        Ok(())
+    }
+
+    fn commit_rqs() {}
+}
-- 
2.45.1

