Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009D3101B0
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556319; cv=none; b=WMTQcNempTJwaSSKyG8KnL9hG3VaR8eNW4ossykKW8HkFrD63EjruUz7JQ16XF6VHmCIxLNweknFdViMr9H6ExzAykJAL4OZd8yKGiIovWHexz8TXyg+S8OWDLQR0ONlsO1rrFVx/vANcmVdygJko0BTARoUTcrKBiKC32yhNhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556319; c=relaxed/simple;
	bh=dVZb5Pcu1XHbZt2SW9FpYlV89iSmsSjiuXxsiQfQLK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW/7M11vR0GidYmwB8ieqIBIjABK1tTmr6Octq2AIefAinyqI4Se3ybhSV2FgypooNeu4r13LtDne4E0nXCwHYsWrSJtScN0Q9ZW/y9g7odgS4YUzVLDlZZNHbuIZZDgQltiDboar4RjYRjsoYvtnSBj/YJHUk7DnnlT5MO0dbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7LPK/2Z; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7LPK/2Z"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-7ea50f94045so19390816d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556316; x=1761161116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcA+z8eYaRvOgVrZmY/xhbxjfSBJr0w9ghrKai5yQJ0=;
        b=A7LPK/2ZcjAQL7xVWJxRF0OckSL4EAYosmXjxRhaDABPim0FoifmCoQ8mQAampIf5B
         4jZRg5pwl75YHnlKyC22D8S2So9lb0zOgShysSwArYVYsW82bUXfh1iDgY2pnEsVr/8Z
         yGS12//9A2cCPi1raUg+rJ7IQt/YzJN2wImtSdvLw8XY0/dXHaxQpTgDOTnqDcxWcute
         QJdQTwwWMH/ibrbT6cTbKqeXJX10RMUqBS0OFXREuYLGgSdo6qfFC0oZJENulhbLbgA4
         Fig9gTCGtlIkaxrlmVrBJRi3bX6HkJQ0OXJidjO03JftgSDUsKJg+hV5Z3bcSA4r2ESd
         epuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556316; x=1761161116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcA+z8eYaRvOgVrZmY/xhbxjfSBJr0w9ghrKai5yQJ0=;
        b=Z9qidzga6cud2OpiFDo4Nmjk0SR+NkFSJqa+OrSzI05RP9c7uZzjJnWWONB0gaiNzo
         biTHig3xuD6/D8n+sdoOZO4kmMNzelf4HXNk74hcyNv/iuwWgx4kAgiGWHeJQ2SF2pM/
         PdzhHNzAdUY1Frvm7oXnCT8y1jGf1pKXZ8Jyolhug7wqAaA3czBQgbtJvV/wCYMsLUPP
         d6sU1zh1Sf82g5wd7aevyYQQi4nGiCVpJ07aLSOrUQVF7S9z+7iMS0E6nI9ov8OkbX0S
         kKHBAwIyh16ZWBUIq06ZbcRG0259+5FOxsK93jVw8Ifl3ai9VmOkOwpMFEIQKnJaXu3P
         v3QQ==
X-Gm-Message-State: AOJu0YxLxaBFFjBT+Ia0TxCFtqJvGdPj5Fbs8A5dmYShMwNZ+EGRNB2E
	07BJtpb0kFPJA/qrVAMpLDhuV/csvG+50+rWP3cjfbgtoPU/PVx+TXcaYBHV+z4J
X-Gm-Gg: ASbGncviTNYs6BDDb5jH0pEtGKQgUE3d8sOwagqyW3mnY1TZUhsf6QOWijrBqMN9ta9
	xLYa02Q+LOZgyiH9ox4rlzFturaNQAF8P+LaFjxsUiw10cm1aYLKhqba8pzMwjeF8Y4G4MznanK
	DJXKR5NnTXU8WUNV8ryt6A6ZXApgRIOqVoYkNqnXpiOnZQcxyE8qldCS60RLXgLcaykVn/vLLnw
	ei/sc8y6t6qZVKuvq99lMbtXlW4uVqbQhBejXbS/KT7CK14MUB9m7rnh7XUHRQCeirOlb/kqbmC
	bJRrLjeHVBMpkvsU1/Fn1ukgggCqYkpLPzgoLr0iX6lgwVnBhw/+atMrPEV2ZWnbHkEnoTGo08y
	C1PneU9EpYaMErJZ12ppZfBw7Qr61HZNazDiNCjI0goGeBYsWj6orxpt1HpdczHC0Cbq7idkkNp
	JKejzvnH2IxZ8HQeCEE5W/zesZnrQzQYu/9k0lUYZ26Ur9xUf4/WwpJ6oGCrqpYFAegB2pLbzzl
	PjCj7URXM3FtHq5whHEp3vhkcOyJvxzwgtyqlT72rXTAOBxggBV+VQ0nAeMehA=
X-Google-Smtp-Source: AGHT+IGtrSTY0FUSiNdgbPyhOIH/YvdyU5sl8fvg654fDJk8BbKW5z4ao5A5UXUjIURMYSPijzmsPA==
X-Received: by 2002:a05:6214:48f:b0:78e:f6cd:4704 with SMTP id 6a1803df08f44-87c0c5cd3aemr17462466d6.5.1760556315435;
        Wed, 15 Oct 2025 12:25:15 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:14 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:37 -0400
Subject: [PATCH v17 07/11] rust: debugfs: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-7-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=4568;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dVZb5Pcu1XHbZt2SW9FpYlV89iSmsSjiuXxsiQfQLK4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIygDVPZERtANioDtpZsLIsIx6DMuRfppWFXkHaK3hI5+YEfWJFA0uNjCcv/4Z25JqUAs3bOoMG
 11/p3YDZDuQA=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
support for read-only files").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/debugfs.rs                   |  2 +-
 rust/kernel/debugfs/callback_adapters.rs |  7 +++----
 rust/kernel/debugfs/file_ops.rs          |  6 +++---
 rust/kernel/debugfs/traits.rs            | 10 +++++-----
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 381c23b3dd83..8c35d032acfe 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,12 +8,12 @@
 // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
 #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
 use core::marker::PhantomData;
 use core::marker::PhantomPinned;
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index 6c024230f676..a260d8dee051 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -5,10 +5,9 @@
 //! than a trait implementation. If provided, it will override the trait implementation.
 
 use super::{Reader, Writer};
+use crate::fmt;
 use crate::prelude::*;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
-use core::fmt::Formatter;
 use core::marker::PhantomData;
 use core::ops::Deref;
 
@@ -76,9 +75,9 @@ fn deref(&self) -> &D {
 
 impl<D, F> Writer for FormatAdapter<D, F>
 where
-    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
+    F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
 {
-    fn write(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
         // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
         let f: &F = unsafe { materialize_zst() };
         f(&self.inner, fmt)
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 50fead17b6f3..9ad5e3fa6f69 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -3,11 +3,11 @@
 
 use super::{Reader, Writer};
 use crate::debugfs::callback_adapters::Adapter;
+use crate::fmt;
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
 use crate::uaccess::UserSlice;
-use core::fmt::{Display, Formatter, Result};
 use core::marker::PhantomData;
 
 #[cfg(CONFIG_DEBUG_FS)]
@@ -65,8 +65,8 @@ fn deref(&self) -> &Self::Target {
 
 struct WriterAdapter<T>(T);
 
-impl<'a, T: Writer> Display for WriterAdapter<&'a T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+impl<'a, T: Writer> fmt::Display for WriterAdapter<&'a T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.0.write(f)
     }
 }
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ab009eb254b3..ad33bfbc7669 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -3,10 +3,10 @@
 
 //! Traits for rendering or updating values exported to DebugFS.
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::sync::Mutex;
 use crate::uaccess::UserSliceReader;
-use core::fmt::{self, Debug, Formatter};
 use core::str::FromStr;
 use core::sync::atomic::{
     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
@@ -24,17 +24,17 @@
 /// explicitly instead.
 pub trait Writer {
     /// Formats the value using the given formatter.
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result;
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
 }
 
 impl<T: Writer> Writer for Mutex<T> {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.lock().write(f)
     }
 }
 
-impl<T: Debug> Writer for T {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T: fmt::Debug> Writer for T {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         writeln!(f, "{self:?}")
     }
 }

-- 
2.51.0

