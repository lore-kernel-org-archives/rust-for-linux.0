Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162832;
	b=1NDLKnATdtYjcIRJKLxQ72lWeiW/7R55DncRc/MEWSBUVeZSD0Eo2yN0b80q4i88ZotY
	 9aQiyP4L79WEfQkN+isSHzrhEaFiggOA5Tgqje/BAb1c3Ng4nA+PeAaD0kHtLuw1Fz5Gi
	 EBHqb2oZLPS86ys3wojeIfxBDPJrh/ImZddHX6TErJb/ECjQhK1k5XjpC7GifnL4GmlE0
	 rdKZFGwSD/52tDFI+jTpfpB8nMe1J7b6A6ZpmQ9Kg6dpgdsIg7kuXRjm+k+CATBQPkPb6
	 Fu7VD/ZVxLA+I0yEIp5Gj8C63NgG+NvG3j8wmwREtOYL0z/fyl6Nqxt/PAIB43TUy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
	b=4abX7m05AN04B7UtEQasrb9py9nbDCPdtGcRTEa2ACaZElssREryjUu0HM7fPaCPVROt
	 DCVUxG8zHj8tONVJ1ML3zsf6+FD+xHfsBO9bVElH6lJ2h/Eajbcx4JKeapaovnRidf7VA
	 Vcg4N9+eemGDGCj2rpfw491Q2uo81VrAZ8rY3j/12ABoVCnA5tExO0r5Ur0KuRW2pbEWq
	 cuJpITQYerdFTNk766uQd8rG3ZnaEoNBGT4ZDn21aReC0tAVukKfmIFcgBYNu3XbbDZE+
	 ofU/bBMFw+6O9cqGS6ca48ynGLbkAD4lkkNDYIUnlW7WF7JrabapvLnOznEpVSi1U8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc5AM36G;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED760A2608
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 08:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ED760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc5AM36G
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso711039e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 00:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162828; x=1795767628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
        b=fc5AM36GdktGMDpoqt5SSgfE5z2ejcEw0do7btOxbCGr9edQU+oAdfSBVJ0shBsOZn
         Y+tjijkasKiGMOjAABMHTdUBOMTv4jSizprmMg/cswB85i6sXT/SqUVT7e7NDPLfc0O3
         ak9zxhgOjl9VBO13/yt3Mb3Gf9Of94k6v8XenNO+gkHrt9M4EcIPzSJTc+95EB1MQ85S
         MueMUhy0sunRIo6gXwfk6TybGdaAUgxanN0PSCqioSaDlow8vsXepsZKLDiAllVCOkQ0
         QvSIu59sKN1/ZIoTxfyERrqzPflJHqpbXb9f+RwsXFdNaZh1+XA/YQPp84HP8yiwK2xS
         TZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162828; x=1795767628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
        b=L1JMtYSinOtBuKvMcXO2CCgfiwjrWCHcYEieAFHwjMfUJooIyZxxp/tJiElkFKDF6X
         /HwJiwg3+DHAvP3NkjIQinS6eoFiQaYs3L0XD9v8YsNDA26mXq94HWxKLAvZa57FLcNG
         KgKvFOv60IG1/Zp2JVdCLW3OfZVNFsVkFjTvTSVM9NUxtMMyzpu3c55gv7+TENgvejAp
         3weGLaLAJXN0eiHVQANQbL8IVzuA/wcwERBmTzO3SFae8aeUKI2qjIZj1dXlH1FROmL2
         tXSILA3v7dfL7UEfVkQxFPs4xHGBlJNYZYk/hKrnZ1kywsNAqD2y5hVL8XJ+rwwH/DAt
         R0yw==
X-Gm-Message-State: APuU4Z+v24b1zA8kmxTglmBnt9MHJjYIjfsTLhTwzYxfVFFix3Iavgj2
	NwOoIGGRMXdJw4R6//VZCqwPHnSvwi38FhxDl63GZeHlJ/MaA33k8Pc9RFCnPEcF3HA=
X-Gm-Gg: AZFdTZf6bb2aYQvtE26+yK2hYuKIagU66Bn/D28CVhyfKReI2Pwcf+zbHXj6bMX5Ogw
	sXzvAXBClH1DzoXL5Td+dFFbuChSlsRN5T6BVCIssoxsVNNghHWPEdh43+RUjZybqt3QDNqLLlm
	QOe2MaHcCNuZuZ/sSBe3GusvJMM4hZhPrOr2RSTY6GVGh0e1s+ugSn9C21oxFN3LB+Sfn+A6m1p
	4cq6WzjwmPWow8MPwoXyOmPx4CSVcsX5f5MPQmqsKK7jS1pibWOXWseUSzOxvo6vw/7gt/zOvgn
	ajG5rBXD0s5v+oZBkHcZnpN1Gp/HAi8kl9Tcx0uoBX7wVGWQW2MVGJZkbxJltsj7E/cKaqki2Os
	SLH+Hz3yWG5CX+NOtoGyj8AT4fwenBAYTSIzWtInU5FmGFbeWhGxF17vJOEJNR+grbL5etDEmRY
	zJNDq+YTzhph5ElcjBOcxe3w6J9YFE9Xm1nXCt10YqyXVKyNdHPJoeRHjJTIrMtfWtlrcakktAj
	1/V6npNewcZtlmd3cW60gtbKg5nw3CsNT2FOi+ulhfdYBD0YA+qaRSVPKndNkQ2voWxV+yhuu/a
	IfkQcWkOhNJ9Kt40PNnt5EMp/wsY0LFoQz4XL3RGxgTxyE2cXFUwj3UKpw==
X-Received: by 2002:ac2:51c5:0:b0:5c1:ac84:668a with SMTP id 2adb3069b0e04-5c1bc7d39eemr622417e87.29.1795162827934;
        Fri, 20 Nov 2026 00:20:27 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm399958e87.59.2026.11.20.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:20:27 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
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
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: macros: document emit_base in ModInfoBuilder
Date: Fri, 20 Nov 2026 10:20:24 +0200
Message-ID: <20261120082024.17776-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the emit_base method within the ModInfoBuilder
struct. Explain its role in formatting metadata strings, handling the
differentiation between built-in and loadable modules, and managing
linker sections and conditional compilation.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
Changes in v2:
  - Fixed the typo in my last name in the From and Signed-off-by lines.
  - Reworded the documentation: dropped an unverified claim about the
    reason for the module name prefix, and documented the `param`
    argument.

v1: https://lore.kernel.org/rust-for-linux/20261028155005.174417-1-mbkchelofficialdev@gmail.com/

 rust/macros/module.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 0a7b9e24c..6f4aacfe7 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -49,6 +49,20 @@ fn new(module: &'a str) -> Self {
         }
     }
 
+    /// Emits a single metadata entry into the module information table.
+    ///
+    /// This method formats a `field=content\0` byte string and places it into the
+    /// `.modinfo` linker section, except on macOS where `link_section` is omitted.
+    /// For built-in modules (`builtin == true`), the string is prefixed with
+    /// `<module>.`; for loadable modules, it is emitted without a prefix.
+    ///
+    /// The `param` flag selects which token stream receives the generated item: when
+    /// `true`, the entry is appended to `param_ts` (used for module parameters via
+    /// [`Self::emit_param`] and placed inside `mod module_parameters`); when
+    /// `false`, it is appended to `ts` in the main generated module code.
+    ///
+    /// The method also generates a unique static identifier using an internal counter
+    /// and applies `#[cfg(not(MODULE))]` or `#[cfg(MODULE)]` based on `builtin`.
     fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
-- 
2.56.1

