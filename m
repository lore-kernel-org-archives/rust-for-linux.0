Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D5298CC9
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808570; cv=none; b=kqfPAmYXDoxM6Hft/0vIoP7qZA5B0vWQKdf37p46rYXVio0EVbH04XRTWUjgrRMX5Mhppt+M/xhBq9b7qkxW80tGs1dPoQeuIJ008H70SwuDlJMUyeb0adwNFdLfXOelfMOzL1sl5sMQZpH9zDfTOKffv+U0HgE5eiJwIg/sdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808570; c=relaxed/simple;
	bh=cd10vY+LdNFm15kjf9buohLVZDsgfigdMJZaOhvjUZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dA5ZhYG6/FLhaGcrzFAtG26aYFQ2TPWMKYUd3FJa3P6x1j1vMoNBflUUA/RL//bzLQ+YchtrB9ab6VxAvibbozL0L0nKCiOCKDLFhyUCp90x3M6DY0K3KfiotJT1uSzuR3uagSrnNXoOyNJiqMWoNSuj/IpitYfpOeTBXlGDFbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHFNSybA; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHFNSybA"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-78f75b0a058so7330726d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808568; x=1759413368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq31dC2vDN2a94utvC/B02Ptv/MXvCOxOItQtZFE3ic=;
        b=kHFNSybAgLMmKvNMEsbdEliOxzUGNfq9vagPqAa/2P2ouxseJFVuYbQskZ+4fD8YM9
         9NIt3mmdbJMC+i3qWvQ08fGJ8MT9hIqSisd4lnXj5EEj6rC0nyJF4/rRHWEqGVdMJ5TL
         gEoIayc33yVrGOkqeZtXbi0WrcUmsIFnAkJ5nPhsZg4FZWVokLo9MqKqI85+ltSjprJy
         5PQRU4ClR3AHlJGgrE4p1TO/3VoLha0O/Nxi6ls+OYPcDCcsvgCCn9ibTvMFoc3nz5wB
         YfKsEWSRaFBxKQW9z03Jvmyf/Nx9L7D2xx/tZWHSPqvJNdBIGECg11eC0myYQxueOI66
         jyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808568; x=1759413368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq31dC2vDN2a94utvC/B02Ptv/MXvCOxOItQtZFE3ic=;
        b=tupbwQ55BwHli/iU3QSpVHHMrsm2lKgvb2yRj4PPu7QjQLWHLc4FkqcsP/ltXZLpKt
         pLmKQoYNGkuNabjrJtI8wtaTAhHxz1Kk/qaAjwn7lCePfmXNE0ta6ajGdVwdjNgv2lig
         RL5nwJzQKzDqIKMdrMTzSS5ZX7dD4nimEqzIWd9VumcvIFPD5NX23RATCd3KGukOVdjJ
         ACgB2hoWuC3SOg4bBt0hqIJ+WzsgjNpGxv7GVfqcjpoI51bLENXy+ggCxuR1lYujlwMb
         W/Ocq62pHTB2OoRc2ARF0/5KKFNj30595WiZRSt6JPXYyZYyybRBebcy/7wws8QvZ+xz
         puWw==
X-Forwarded-Encrypted: i=1; AJvYcCX0j5zuB9EQ4afaOm2xR0e2oRVtUSNrF1tAP2VhGeP6hn9oW9aJTl/Idb5x5WjU/DJIyA1FlgKZ6jDG3TG7Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDCtH0o7Z85JoV8XWxsIrffLGCR4mh7YmdZekl2FBZckvHcgy
	/5jBrNmwqQckZL1CTaCGIk230UVHwKkOryx2tzb2Lqr6ThkRD437Et7f
X-Gm-Gg: ASbGncuY/t8x3McVyt8hIpmM0rGcXDlWs/qLNZCWw0A5gYXgaEhF+3Dv8SVijAZfJ0y
	PExmKiTb27P0O4qZdsggetM1md2bksL+/di/bo4tQ2uK2Svg3ZZxl4AN+JNMfBQCNW+Sf93t+A5
	m1E6iBZn6TuWZd0r/YPlDek0rkGs9jfzWARXVHRJq+gGHvHzviz6lZbHKNVz0Vkm4HEyisPdzFG
	TtA0RRzSSzsmUmrCC4zLZAwIQdQFnkVAZ5VhneDvR0nX6zG7MyBFggUMQE/cjb20fGodv4mBvS3
	GPPIjk2z8saBryM6qkt0SkLgH8eZAl+9nY8EkQHk3fo6JVVs6sPOIYWLNhzf3OvoYKDS16jjP8q
	/dzPoomZ0X62nsXOqQdcAwcotW7/wuFTZ1qykiB9KR60WKHWclamxS79oZeDmvLoeBy8Ar7cpgF
	wtzbTyOnPizJKmvwjeMrFXFQyAPGgw95RjzsUkyfrYFYJNEDx8dOwZKFVwGrnBTU89M7pAuPN1M
	4WHP7g=
X-Google-Smtp-Source: AGHT+IEZhM30AGXNdbFILEQiyz/kr05nZm4O0BE8w754iMuzz8n1eM1enRH3Kra7C8BiuYUbQtPrdA==
X-Received: by 2002:a05:6214:3014:b0:80e:4f6d:23be with SMTP id 6a1803df08f44-80e4f6d25a9mr15832686d6.62.1758808567133;
        Thu, 25 Sep 2025 06:56:07 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:56:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:06 -0400
Subject: [PATCH v2 18/19] rust: io: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-18-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1724;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=cd10vY+LdNFm15kjf9buohLVZDsgfigdMJZaOhvjUZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNf162nJINfyau54ApOtSNUKBNqSEvAN/RUj/VaS1rCjXvJ9mtYy/yqZWgJQlP/HSnYEPjCYYdQ
 IPwDjgyMc4w4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/io/mem.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 6f99510bfc3a..2e42eb906061 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -4,7 +4,6 @@
 
 use core::ops::Deref;
 
-use crate::c_str;
 use crate::device::Bound;
 use crate::device::Device;
 use crate::devres::Devres;
@@ -44,7 +43,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -102,7 +101,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -164,7 +163,7 @@ impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
     fn ioremap(resource: &Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
-        let name = resource.name().unwrap_or(c_str!(""));
+        let name = resource.name().unwrap_or_default();
 
         let region = resource
             .request_region(

-- 
2.51.0

