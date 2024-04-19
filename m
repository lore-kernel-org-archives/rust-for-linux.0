Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD491292F2
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713534848; cv=none; b=jp35en9VBA2iU+kEikNjtk0AA6pFha9Mbo9USGcAaF8Pcs6KOhQ5MsIMsSjWLSp8ArSLGZslAWF6Ypi99roQ++X/pJtAjEZmEFkUpJtnR7EYsjKT2Hi9pOsWodDjSo/NX79ZqWh7DyT5CGgkez+5+cwj4eRKJwc0jvsw7urnPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713534848; c=relaxed/simple;
	bh=jXQz9x1uOQ6eEOlhNAo6z/ngwGczgkwyleRkzUnc0+s=;
	h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type; b=FT2yKBNU3fkjyI6k9steDVzmRB7RCQ7oXXBO4j8wXDtJu3LKQRfpXNrOLNAbTw3fWbSNtVnB1L1gyw7xXYoLfYZ2bH5WZfXSEtm5ndvCTsBbY3ybQ2Rl15LHTIqMAgzHlbR8qs2GxeRpbhRXqxhjsRoPjpIGGuhKQphh24FNG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTy0u22b; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTy0u22b"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e825c6c10fso3416855ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713534846; x=1714139646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:from:subject:to:message-id
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YHbF+YkAmsx7Q17nYp7HCgecnl6kkP+ExoL173qsLo=;
        b=dTy0u22bpSD9O5aPgH6G6e7H1EwSxP4YEB2gSsjzIxQHdaaWXC6VEGjTPxFCEii79Y
         ut8N6URGq3NG4TVDRNwfwVOPDwB7flu8UMePteXnHlXw0Z9B+Bf+f+VsjdGdan7x42vR
         rWprAh1ZrBEubr8dgaLX53Pi0JupqLRQWhpG4Xr7l6jDnc5pO+swtTTeSzBE6PPKCxvI
         za6AqWIQT9HtAa/QGqxf1mEZgGAlEmz0Q4NYFdYCGwP3TObgtmiz+v5jv0KI5hl0A8q/
         XYKYev+zCtnBOmEYTLcXBvpnfjBw75Xly7fEovQ3S8wyC+7vGkhazw18hucv659W/hSp
         q/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534846; x=1714139646;
        h=content-transfer-encoding:mime-version:from:subject:to:message-id
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YHbF+YkAmsx7Q17nYp7HCgecnl6kkP+ExoL173qsLo=;
        b=rk7UdXiS20V8jhFkx0frZaIOFBs3URwjygrEY6u/6OOE3toV2qpbG7TQ3m9YO8s4Y8
         dSHSFjlXgNN8JMIy1CMhjT5ZJdeV3cMm33YprTrT/NtefcTqUGrph8wY1NQrXHz/IYBe
         SWWcUnre1W4UDlcMjc9FhGI5cNuiQxBMOGKkAhTP/UsMWcGBOvKlaRev91Q/H4H6JCDT
         1sXPJkNmhg4uHcpX8eHzQdplROAX2GGvwqSklwiNMJvT9ln2bFk3CTcQcxLEXOTvkiI5
         eXPB4RIU77nsXPCfiyJg6EGOAZtRS5kATtZS9kre0yxyVT7QcxtTauPzLy0p2GALpo29
         39sg==
X-Gm-Message-State: AOJu0YzRzQN8A/Nw3sLFdIyEVDCK+7BDlGYe2wiD7fPMlMzc0oIioqEt
	NYFdIqrioiDRGtuBJ7hVBH+uuGnhYuM0SpPhEHwQBXmkFTC8+e82exSS/g==
X-Google-Smtp-Source: AGHT+IH6HVTsq+jxAmChJx89tMK5xr/zkWUm2PWKrYf0ECtUQyE1AkllJtSDHKHl8rTiAhO9Q0sZGQ==
X-Received: by 2002:a17:902:8d8b:b0:1dd:b54c:df51 with SMTP id v11-20020a1709028d8b00b001ddb54cdf51mr2374216plo.4.1713534845651;
        Fri, 19 Apr 2024 06:54:05 -0700 (PDT)
Received: from localhost (p5315239-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.87.239])
        by smtp.gmail.com with ESMTPSA id c8-20020a170902724800b001e2a42a2e34sm3352231pll.65.2024.04.19.06.54.04
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:54:05 -0700 (PDT)
Date: Fri, 19 Apr 2024 22:53:53 +0900 (JST)
Message-Id: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Subject: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

This patch is necessary for a new QT2025 PHY driver in Rust:

https://lwn.net/Articles/969888/

Are there places to be fixed or imporved before sending this in the v2
of the PHY driver patchset?


-
This adds 'firmware' tag support to module! macro, corresponds to
MODULE_FIRMWARE macro.

A module can have multiple 'firmware' tags like 'alias'.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/macros/module.rs | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 27979e582e4b..5fdaac17a733 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -97,14 +97,22 @@ struct ModuleInfo {
     author: Option<String>,
     description: Option<String>,
     alias: Option<Vec<String>>,
+    firmware: Option<Vec<String>>,
 }
 
 impl ModuleInfo {
     fn parse(it: &mut token_stream::IntoIter) -> Self {
         let mut info = ModuleInfo::default();
 
-        const EXPECTED_KEYS: &[&str] =
-            &["type", "name", "author", "description", "license", "alias"];
+        const EXPECTED_KEYS: &[&str] = &[
+            "type",
+            "name",
+            "author",
+            "description",
+            "license",
+            "alias",
+            "firmware",
+        ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
 
@@ -131,6 +139,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "description" => info.description = Some(expect_string(it)),
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
+                "firmware" => info.firmware = Some(expect_string_array(it)),
                 _ => panic!(
                     "Unknown key \"{}\". Valid keys are: {:?}.",
                     key, EXPECTED_KEYS
@@ -186,6 +195,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("alias", &alias);
         }
     }
+    if let Some(firmware) = info.firmware {
+        for fw in firmware {
+            modinfo.emit("firmware", &fw);
+        }
+    }
 
     // Built-in modules also export the `file` modinfo string.
     let file =
-- 
2.34.1

