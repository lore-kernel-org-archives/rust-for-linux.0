Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32EC25742F;
	Wed, 28 Jan 2026 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624989; cv=none; b=Lpnmu7HnpSvTl+SzX8jO0ij2gEPciHjCsyuooCgm4+L+V3OVNxazWpcxW7Nka7M/CStBGu68VQq2XQJDJQIuRNVxY3qwOuGVTuuI8hxng1wx9ZgBSMsmIrRJtKMiGaVj4hhkniY7dW0V6As3S4a3+GI24Aa0zGOobxakBbp0nQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624989; c=relaxed/simple;
	bh=hIXy4ODNUDfyh2LDWRnsbyzoIBW5G1hBEd8Pqcu6hgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRjx6y3E5MB8gkoZLUZdLKj7SeKUrofHFtBl3c6xGV67ZieYuY4z+ZoBq9sWAvELJJK5tgKiAnQFmuaAxixmvm5VzsUigfhjxS+e6SONDDEQMvP22RK/6Naa40/U/78OirpJcdjbpaQubx+EyGsOwSCCrLiX6SQgPg3nVLSuIa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 97216F43B1A; Wed, 28 Jan 2026 19:29:39 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] nvmem: Document enum nvmem_type and its variants
Date: Wed, 28 Jan 2026 19:29:20 +0100
Message-ID: <20260128182925.13225-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128182925.13225-1-linkmauve@linkmauve.fr>
References: <20260128182925.13225-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These were previously undocumented, and while it is fine in C we emit a
warning whenever an enum or its variants aren’t documented in Rust.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 include/linux/nvmem-provider.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index f3b13da78aac..92e3d9a76137 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -25,6 +25,14 @@ typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
 					 size_t bytes);
 
+/**
+ * The possible types for a nvmem provider.
+ * @NVMEM_TYPE_UNKNOWN: The type of memory is unknown.
+ * @NVMEM_TYPE_EEPROM: Electrically erasable programmable ROM.
+ * @NVMEM_TYPE_OTP: One-time programmable memory.
+ * @NVMEM_TYPE_BATTERY_BACKED: This memory is backed by a battery.
+ * @NVMEM_TYPE_FRAM: Ferroelectric RAM.
+ */
 enum nvmem_type {
 	NVMEM_TYPE_UNKNOWN = 0,
 	NVMEM_TYPE_EEPROM,
-- 
2.52.0

