Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62F329C56
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149663; cv=none; b=ZWdtAGo6snq1g4D1EN+GMGJJdzi5B7G4LPKMhWa+FQGNU6V9BMGGTzt5Szht4tTDCnISJfCESpM4aUw64xI5EZq9v/Qo1DRjpO74JiXpkQBmI5fuhkDhEa0LZ+pcO9ctOPsFFA+XH8DfXDWI3yMCY9C2p8VNWmcFUXqjLn7vVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149663; c=relaxed/simple;
	bh=PEStsCfUg1vck30VzbuzLY18WcACc8ezhy6sImv5QbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCM9e0pxFqLEyyfIr15NgzdVuVfu3V2bSDQpBH/Uhm895IhYBTpRC07p0JqfC0HGav6wOM+2EPHivmvFTiaG6fPFWrxL/GkWg/oy5YeHo6LJTBVuoZbiYY60cyZIWyMZlWxl+IRgiK4OcQoMNJSrNf2qnFnM/QVEC+P8SuWJecM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6f06dGg; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6f06dGg"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1461703eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149661; x=1772754461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL8jxHXJRXWZMH+LIIg5DtNI0nPNnxmf0FX4+vNJA2Q=;
        b=S6f06dGg0w8gcTAjDnQZFXinm4gT7G2IlqeGf9SbOBXlbC4O4laX551x+IMKXow3SR
         gk+avOwqge1Fhd641eqfxaYQqArsW2l8eeYa58wVU59hHmlxoQ8AK2+KO1WbyzLgduhs
         ESeLWXaYcQYro+Bq1Ooux5X1w8D6660PJgOU11W8Om0tipiGrKro1NjTDX02hi9hfvKd
         jxpc7pHYAHPYZatWITDmAikuGW0q4+x1rBfk16uuJzcqgtPy5JL1LwlhFIFwz4RoBbuf
         v9m6zq3ClKuZJvwuVxO5rddRUTjZS+7gewgKnl+3Mui044CI3irSdlbPOKTRW6dauVuW
         fA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149661; x=1772754461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CL8jxHXJRXWZMH+LIIg5DtNI0nPNnxmf0FX4+vNJA2Q=;
        b=SLGS0HjPiqB8IaQiywT2mdoBMxW7huWRkGGEErLrgRXlQZJGuXhun/KCPq/t+2uhj7
         V6e1A2RiUvE0MFwzlC9rf8eAeTeI4y5O1nk56nWcOtDxis5+wZuVeUb4Y4LbokoYN5KI
         C0cvBY8DbjeNBvgBXmBOcLCQNA2HVGdAntvqHSgZY6uTTqqmxSeisoS0evoqQY9oM04i
         +BQQWNfuEpHoS+6OT0UNUkEOXlqXesk8gxQBITnR/gcNgLoTRcviOvr4P8flRnw27u91
         +ddzZwLJ0hEHvReb02pa2K7UUFTGR0/VGh7J2B5zAZxk/fYmsBoXCHajVOcqqg6H9FH6
         ow5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi7nYeXkATf+UYccUVHRbs3SKbPyv3PvuWXWSVxSZC0CIwylrCKp7uhYFl+3XTSTZpxG6GDRPyMi+huL8meA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTkCa7ciYy+C5E5uzKHP1XUavJ3IHlgrHFiT+gMx3lRY1D5Uz
	+Xyrf8clG2bJ1aHEfybIS+Q7Rm81Sii376jVRG1cTreWk0L55qfWMZ6G
X-Gm-Gg: ATEYQzxe7xUfHfZjXBm4gDmedkND0siqx2Hnhyj+ZC7fU+9dxZG41qD1HCZJtilvByL
	KfNG6Fu4zvd6KC+nH7JFdaMqYRlNKnwfE0/AS5lLKjbH3hxgrG8GNdVwDZMC/EKj3ZSsHnxS9LX
	uDwME5o8v9DRGzwNEeDIyz7ulFspo/Sy59fJ1wXBCo40BcC6Bl9Z5CF+kUOrtPbqsSUYfdllrfW
	ZYL2aMRl3Y7why4Tlf5N/iMvYAXUYAqVj2Wnnh8hq3u9HP5LBCY44BfperxmBykuowBY/T/hlmG
	ExDof5CU+seY2R150AxmwZAXnv1xoMg/6Z1Z7aNwxDJS8k4RvartowtrH05c6f/0v720BIRfe+l
	6urjBBXYjTEOW+jusB/TUE+X70rkZOG0GUH+3oHmO0Wqil38Jq/pyxyecpF+SfOQHekKefSKv1w
	C+hOazeTznZrT1VMrewFrynJaVnsqq7IKh1hF5UIVAdw0wEdh3K2Ck+kmz3uUhGRSGaWh3Ya5LA
	g==
X-Received: by 2002:a05:7300:538e:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2bde1ff2aedmr322221eec.39.1772149660935;
        Thu, 26 Feb 2026 15:47:40 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f49d96sm2726909eec.27.2026.02.26.15.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:40 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] samples: rust_minimal: demonstrate string module parameter
Date: Thu, 26 Feb 2026 15:47:29 -0800
Message-ID: <20260226234736.428341-4-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a `test_str` string parameter alongside the existing integer
parameter (renamed from `test_parameter` to `test_int` for clarity)
in the rust_minimal sample module.

The init function now prints both parameters to the kernel log,
showing how string parameters are declared, defaulted, and read
back via StringParam::as_cstr().

Also add module-level documentation showing usage via insmod and
kernel command-line with dotted notation.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 samples/rust/rust_minimal.rs | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 8eb9583571d7..59955e95e31a 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -1,6 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Rust minimal sample.
+//!
+//! This is a sample module written in Rust. It is intended to be a minimal
+//! example of how to write a module in Rust. It does not do anything useful,
+//! except print a message when it is loaded and unloaded.
+//!
+//! It provides examples of how to receive module parameters, which can be provided
+//! by the user when the module is loaded:
+//!
+//! ```
+//! insmod /lib/modules/$(uname -r)/kernel/samples/rust/rust_minimal.ko test_int=2 test_str=world
+//! ```
+//!
+//! or via kernel cmdline with module dotted notation (when built-in and not built as a module):
+//!
+//! ```
+//! ... rust_minimal.test_int=2 rust_minimal.test_str=world ...
+//! ```
 
 use kernel::prelude::*;
 
@@ -11,10 +28,14 @@
     description: "Rust minimal sample",
     license: "GPL",
     params: {
-        test_parameter: i64 {
+        test_int: i64 {
             default: 1,
             description: "This parameter has a default of 1",
         },
+        test_str: string {
+            default: "hello",
+            description: "This parameter has a default of hello",
+        }
     },
 }
 
@@ -26,9 +47,13 @@ impl kernel::Module for RustMinimal {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+        pr_info!("test_int: {}\n", *module_parameters::test_int.value());
         pr_info!(
-            "test_parameter: {}\n",
-            *module_parameters::test_parameter.value()
+            "test_str: {}\n",
+            module_parameters::test_str
+                .value()
+                .as_cstr()
+                .expect("test_str has a default value")
         );
 
         let mut numbers = KVec::new();
-- 
2.52.0

