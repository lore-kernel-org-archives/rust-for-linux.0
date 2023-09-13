Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6D3D6C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:36:16 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72919B6
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:15 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34f69780037so2771785ab.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694612175; x=1695216975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDlHZqYz6jPY5MbuaB5gDK5fWeIyxSLUrNQngZbBBlk=;
        b=YDR7oMVmN3bKuLkzrcbPnJvIIvtsJKVcP8rNyFrchop/8qCPOOEMiJ9+Eu4XDN85zF
         DCve+dxQ9UzQqvyhdjmnORynIc8tpCPfcabmhgQee0DS0uPMxlS86g4vw2S4Ffs9VWw7
         1mPopfAMc5V/Q11V8Vi4RV1p6QERqD3cV4vs7sQ8hlFX8WzgLTqLB0yjs6Mi0aIHvyI1
         6Pfa8BAJtVYfUKNAfY7jm7LXGQGwzszKlcFlyxV6M4RsgZrlZNGFdH9LJsm3QyNYyrQi
         j/Nlx7nTj4oyootxHxVOog3iFNZB0/Fh+jg3w050+4c7MjIno5QmtG+k0dx+Z9cUMDTG
         Ix7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612175; x=1695216975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDlHZqYz6jPY5MbuaB5gDK5fWeIyxSLUrNQngZbBBlk=;
        b=XSfRryJFqjobXjHUUy4z3C5Xcp2vAPsS/h+W3ufnYTVehArNmcXEYBoUnsNvDDaAlM
         QtM9kPL/tIhGS/s7akQCxfc2vmXbLiYRfC3lsAzt/b2Y3o6oqdzKb/j1/IUAQblID8qS
         L1FD7u3AkfqtIjtq6PGqRC3llelseI3sXKFfu2w4IiYLPcBXuZFtilcivvQcUc1xdaei
         9tGSYdOfOxuT0wICiMbiXMli7RDLFQwAlfGOmQReuzfr7xAb19/8Vz5kMLWAbAkZbr0n
         0GhnkpP08ouJtOwXhMYu0vFTD5npjpzB8S5SNu4IYEnOKMPhYutO01XuKawnvLPQuHez
         H8jA==
X-Gm-Message-State: AOJu0YxqVlbFO2M92v/dh+S01hrxnJLSpLDabTMVfIc08Y+RrM6AM5eS
	QnYxI/O5OaMvHF7P7du7tijTHCNASCA=
X-Google-Smtp-Source: AGHT+IHvcZFYTlacPc0WiPMFnsYIxGdiZkGdcVgl/ZP3pEOkJINNKurqe2HwL2l3btSk6JsTWJA1XQ==
X-Received: by 2002:a05:6e02:1a48:b0:34f:9f4a:c64d with SMTP id u8-20020a056e021a4800b0034f9f4ac64dmr1684881ilv.0.1694612174752;
        Wed, 13 Sep 2023 06:36:14 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id l14-20020a63700e000000b00573f82bb00esm8866602pgc.2.2023.09.13.06.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 06:36:14 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch
Subject: [RFC PATCH v1 2/4] rust: phy: add module device table support
Date: Wed, 13 Sep 2023 22:36:07 +0900
Message-Id: <20230913133609.1668758-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This macro corresponds to the kernel's MODULE_DEVICE_TABLE macro,
which embeds the information for module loading into the module binary
file.


Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/phy.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 2c5ac5e3213a..ffe1a609a7b2 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -649,3 +649,39 @@ unsafe impl<const N: usize> Send for Registration<{ N }> {}
 
 // SAFETY: `Registration` does not expose any of its state across threads.
 unsafe impl<const N: usize> Sync for Registration<{ N }> {}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! replace_expr {
+    ($_t:tt $sub:expr) => {
+        $sub
+    };
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! count_drivers {
+    ( $(($x:expr, $_y:expr)),* ) => {
+        0usize $(+ $crate::replace_expr!($x 1usize))*
+    };
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! mdio_device_id_table {
+    ($(($x:expr, $y:expr)),*) => {
+        [$(kernel::bindings::mdio_device_id {phy_id: $x, phy_id_mask:$y}),*, kernel::bindings::mdio_device_id {phy_id:0, phy_id_mask:0}]
+    }
+}
+
+/// Defines module device table.
+///
+/// This corresponds to the kernel's MODULE_DEVICE_TABLE macro, which embeds the information
+/// for module loading into the module binary file.
+#[macro_export]
+macro_rules! phy_module_device_table {
+    ($name:ident, [$($t:tt)*]) => {
+        #[no_mangle]
+        static $name: [kernel::bindings::mdio_device_id; $crate::count_drivers!($($t)*)+1] = $crate::mdio_device_id_table!($($t)*);
+    }
+}
-- 
2.34.1

