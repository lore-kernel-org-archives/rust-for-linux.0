Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FC18DF9D;
	Wed,  4 Feb 2026 04:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177912; cv=none; b=C3KZQ8duNQNNIWx0xNOT6hGa4zYzFR3jAzo/Abo4OsJWwhoeED68qJHcaoF7Ea+z8CvVUpda9Z38DXfFoxEzLALgQ1mpWyhSWBLOUyDq1+tQznkcHtgQICnQtMGZpZ3q0Xu/HVNJF3Q6uNX3C+Q+AvyZKESNp/6x3kDU4O6mr8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177912; c=relaxed/simple;
	bh=ID/e4DrwQ85n/9a+ACgHDCPIBAXh23ub43sRYUtSBO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ji4c6k7MuqYE1qkZfXAZK/lBBKTtpjSNMkjpLC5OEVRDSJ5Yw01Qgnl5lGumiWv2iSZsTaGHKCn2QR2pc21brrkzvAOD+CDe9Ne+ww8pU39qBdE3Ze8+9qPT1fXwynJpRqz1S1GzJVWfUEBE5HT/YjP8h9yzzPygG2LYc1Vorcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 10FA7F43B49; Wed, 04 Feb 2026 05:05:08 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
Date: Wed,  4 Feb 2026 05:04:58 +0100
Message-ID: <20260204040505.8447-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204040505.8447-1-linkmauve@linkmauve.fr>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another option would be to call u32::swap_bytes() on the data being
read/written, but these helpers make the Rust code as ergonomic as the C
code.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/helpers/io.c | 34 ++++++++++++++++++++++++++++++++++
 rust/kernel/io.rs | 18 ++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index c475913c69e6..514ad0377327 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -40,6 +40,23 @@ u64 rust_helper_readq(const void __iomem *addr)
 }
 #endif
 
+u16 rust_helper_ioread16be(const void __iomem *addr)
+{
+	return ioread16be(addr);
+}
+
+u32 rust_helper_ioread32be(const void __iomem *addr)
+{
+	return ioread32be(addr);
+}
+
+#ifdef CONFIG_64BIT
+u64 rust_helper_ioread64be(const void __iomem *addr)
+{
+	return ioread64be(addr);
+}
+#endif
+
 void rust_helper_writeb(u8 value, void __iomem *addr)
 {
 	writeb(value, addr);
@@ -62,6 +79,23 @@ void rust_helper_writeq(u64 value, void __iomem *addr)
 }
 #endif
 
+void rust_helper_iowrite16be(u16 value, void __iomem *addr)
+{
+	iowrite16be(value, addr);
+}
+
+void rust_helper_iowrite32be(u32 value, void __iomem *addr)
+{
+	iowrite32be(value, addr);
+}
+
+#ifdef CONFIG_64BIT
+void rust_helper_iowrite64be(u64 value, void __iomem *addr)
+{
+	iowrite64be(value, addr);
+}
+#endif
+
 u8 rust_helper_readb_relaxed(const void __iomem *addr)
 {
 	return readb_relaxed(addr);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..e6912e7ff036 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -256,6 +256,15 @@ fn io_addr_assert<U>(&self, offset: usize) -> usize {
         readq -> u64
     );
 
+    define_read!(read16be, try_read16be, ioread16be -> u16);
+    define_read!(read32be, try_read32be, ioread32be -> u32);
+    define_read!(
+        #[cfg(CONFIG_64BIT)]
+        read64be,
+        try_read64be,
+        ioread64be -> u64
+    );
+
     define_read!(read8_relaxed, try_read8_relaxed, readb_relaxed -> u8);
     define_read!(read16_relaxed, try_read16_relaxed, readw_relaxed -> u16);
     define_read!(read32_relaxed, try_read32_relaxed, readl_relaxed -> u32);
@@ -276,6 +285,15 @@ fn io_addr_assert<U>(&self, offset: usize) -> usize {
         writeq <- u64
     );
 
+    define_write!(write16be, try_write16be, iowrite16be <- u16);
+    define_write!(write32be, try_write32be, iowrite32be <- u32);
+    define_write!(
+        #[cfg(CONFIG_64BIT)]
+        write64be,
+        try_write64be,
+        iowrite64be <- u64
+    );
+
     define_write!(write8_relaxed, try_write8_relaxed, writeb_relaxed <- u8);
     define_write!(write16_relaxed, try_write16_relaxed, writew_relaxed <- u16);
     define_write!(write32_relaxed, try_write32_relaxed, writel_relaxed <- u32);
-- 
2.52.0

