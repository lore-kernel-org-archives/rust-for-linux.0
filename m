Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99330E851
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556311; cv=none; b=cSuOMeSIcsN86wiVEmvZuyGJdAT5eLLxJgxc8K9KEX3+55CfwmpF67L98ONEzfi3VMaG3EmH+4qF+2EirIQXFw7uhPAn1PvSVdA6hYdrzzuUoyd3yB8i01MR/CEKaIoSNkbrI/vMHSHn8ca0bcVfGWNjxOBMQCaV4LJztW2lidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556311; c=relaxed/simple;
	bh=Qn1W1cp+yTwc3WIdXx1edrK3W/vliJQWYr2kDZAgGBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIRnnr5MDuw584oed45lf6/EWWUlrWuc55s+Qsu2va+F0s8X06vPUk/frkzKdE6xkl0fdagvFdgrBxbRqnAMv0+cdu0+ypmv4NbZDxJDF9E7mh2PaWmBCt353Fw3jO24inzCP8yHNZAmMwmHGAeEIQLESGb/M9nmw6PMdUuQxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQvM5R3/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQvM5R3/"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87bf3d1e7faso47864536d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556307; x=1761161107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z0UoCENjvPOzaJ7c22Y9TSWGsGdKl3uaGJR5NzjspE=;
        b=dQvM5R3/bTVeAHIbUhXqCyhCYZcU2V479ToP4Mb6X3gow/0QaV5XGpAwgYWc0SY7u1
         IYhjuFgyGlvae9b4GXv8CiXg0suQgSx2kZebwo4xpH0erARZy2n59Wi6ymlCm0tDOy0E
         FHEYKI5uQbt9WDEsqLKjaH9dH6vGzbHaATSNsXUCkzUfUplquBZNekAEM88lEJontwlH
         iVTxhLG9ogDBPN6jQO3d2fmWzzOC/86D53uLmLHMtC8imgpScq62ximwgdmzobps7DHN
         8Ol9VPg7wWJjldHLmBJmMT/P+OQRBuvNKCpye01ADsqKD0g1HV7dzO4zOyTIDpZJjOup
         Gy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556307; x=1761161107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z0UoCENjvPOzaJ7c22Y9TSWGsGdKl3uaGJR5NzjspE=;
        b=o0nZqpbbGqK5uIQSsPiyZKpo7a0M3AxOy7RBM7e9SoRFqoskA+BnFtY88bX5MirHhq
         G8DU8gja4I7ynuFYbt0fGfnC+E1RaIoAVqVysho+Kwzl01xwhs1gSH+ZJQu1tp2dENwM
         2Ofn1/izaWG+dHpUb+ByZKfOkM6g0NIFiPmr1TbH8ncB167F9Q3mgGkJlTUP86xuuz6Q
         lvRgYUnZ0N02hRJG19iNd1Z6MnApa/hTmIbVvQTBtlYG6NYrXzfDiVVhdBWKL45WVi0p
         Ue89YFqY1DQRdYt1AXcKnJn1TGk2Mw//GyoukpVg34tx0/5bHUDBnljUOFpjP7ohD3Mv
         T+FQ==
X-Gm-Message-State: AOJu0YyZjSOzkj9rLI+3tv+rX3UqZw6AznVoGV6qbpk9saYGUsNrmL4x
	eBxY1kFkH7z7lfJnLgRJEAvBChMs7+JPZSBGaUzgXSq+oxIIYSiJ+Eer+rNdvCNF
X-Gm-Gg: ASbGncsfF7S3ToEUS2RWV+cUmhnkXNV4FosyeZsjdR3v0f8WyzOtxsG/v5i6GXXjm6C
	EUhpwjiUDvPsCmYtSpPxygVroJ7gY1vcM/SqA67Xq1kcU9jyqb6UL8xHluoyYwhRpm89GEeE8Wi
	VuRNMhGpOYcrVSNP//E59SagHsNglBF1LyPYPJkPRsD7NHmZaF+xvWt2ITznhNtcQkTNxTD1SAP
	3Npi3QNwbi41fq11aCaH56VsLhJf2pyuRt9IuIpoNb1LwlaXHF1Qz3mWH595iE4QqMKSBPecYRq
	yTBIOnD3t+iPxCLOm/PkoGo+S3ob5x+XO93kQSMlFeADaXQC9aoJka05cXZO5GmQdmGV0HdGK42
	vL/IusPWrhMvlQlDDaIbs5+FX0lS7bNrUEiW9vQJWXDb8KFefuzHSMMt7/ozUS9Mtbup3rINLei
	CF/UUqf6qgaWPPtgR9j6Uximekf4RqkdIzivOuZUGfFV6sjAtC1c4DKEe+q+x9+40YY+f4GSitA
	LWHe2udxjXtq9OQwsAplhfxvgsofevOGvpKZkWFkiZQ4/26wdwFWIHAx8eTsfm2hgAodJevOQ==
X-Google-Smtp-Source: AGHT+IG2tULJ6h6PVvWUIOB2ZFPRQKa/V9qgfB8TRjULEb+0DCRZ6eO1hx3aZgOim3FIHrolDm9d/Q==
X-Received: by 2002:a05:6214:27e9:b0:803:3b8e:e9a5 with SMTP id 6a1803df08f44-87b2efc2c78mr410404166d6.36.1760556305773;
        Wed, 15 Oct 2025 12:25:05 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:33 -0400
Subject: [PATCH v17 03/11] rust_binder: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-3-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1147;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Qn1W1cp+yTwc3WIdXx1edrK3W/vliJQWYr2kDZAgGBI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPq4IgijUUTbPqcb/sFKSMvqN+uNEx3DeWVE1av3DAj4osSldGBCYfq78JujAqGy30VkSuPwWuG
 OpXoXaJlyWQ8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/error.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 9921827267d0..b24497cfa292 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -2,6 +2,7 @@
 
 // Copyright (C) 2025 Google LLC.
 
+use kernel::fmt;
 use kernel::prelude::*;
 
 use crate::defs::*;
@@ -76,8 +77,8 @@ fn from(_: kernel::alloc::AllocError) -> Self {
     }
 }
 
-impl core::fmt::Debug for BinderError {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for BinderError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self.reply {
             BR_FAILED_REPLY => match self.source.as_ref() {
                 Some(source) => f

-- 
2.51.0

