Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9AD37BE63
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884308; cv=none; b=it0BfBcRdmuc+ja1skaXMXSQQtR8fW7fwJrf4BblBmIPnIRxjWRoHAjDkx3ISTi6NLxf6bMXU1EjYedEnrOQz4iw9Wh4lWhXQBhaPBXnE40HYgGQ1/Fob47Ao6QyefL9ZZMolBztO7T/I3aqLo/u/zu2ZIkObZ5HLxezM8imytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884308; c=relaxed/simple;
	bh=hRGB9oVjZrDC5m4XZKHO2WMi1uqtMLbDhKE3faTS22k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgbGpOrWp/q4+54OBBJFW/vFITLqV3zgjiEH1aTy7a0UZy4T33j26d4w32XJE0xnWqNCQgioOuyRrS4gM6zIgQLaragoehrcRiDTOLlIpsyA0BaCoIyHPB6ZFi2ClS29eMazpAuyixFQwbAvuF/vOrQxUY7ivGI+azqGp3GZQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5pNyYux; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5pNyYux"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f86167d39so615145166b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 14:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884305; x=1772489105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJnwuXlwPqYBkjbw57cs4hmL2PjDi3OofAmEvUVEuyo=;
        b=e5pNyYuxf0xHsF+XHzH0+Bhgh7yFJy58SnPuA5PH4pmpJl3fXe/OEFdVO86cMFyozs
         FnxMJxgDOKBEgCvNmMMEL8cerEMk91LmtZG3IvxHSOOCJuGTfr6wwePKf54KJ7TWxXc1
         3NXARy8GwkUi4TRFnU8VFwXbyHIVRmn+C/jwzBdRCDIOy0B++hxrolCH0gWRf/Wv2ghC
         SaA7yTUad6y4D8UCoaz8mdR6ITUX2wUZhPvZYEY8V/xTeFhe0pGuXdWMwKseQ8SEJjwA
         Mj28g7lFdgW9xPAx/67m+IzQxuCFgB5dEb8ytGWfw7+DG2N9QRcM9mVXyMrhzZAVPYCS
         /tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884305; x=1772489105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJnwuXlwPqYBkjbw57cs4hmL2PjDi3OofAmEvUVEuyo=;
        b=vQwH9iQ9aAnQcMAdRqzkVKRHLoeniJtJzxSIWXYXwut3MLIu56JIhtf5rzzOaHtoM0
         wQbyLCy2E36Yma6czVd8/nneLhMza+LCLFYfIxKmFgf+WUNexiHOyvSg36RW5KC3/juY
         YilvWnZmdFFl/eCTDQ3P9b3/MX5g7WKQ1XAaHTRqH9fL5FTKc0pRy7mgPy59bhoq5b1u
         m2QvJYMFA1ZZQuuC7haVN7dG1SD7Hfe9AF52VAWI5V6JidNIAwavMyXJSdzYHkgLf6Ur
         TxkJXfIWsc+IsM/4SUMm6w/suL+PBcY+BMfq4BOzIcDQu4oUxVX9Dvk0+Jhb3giq60FA
         SSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWYspWeSiRu4MTAMiWHnmTvyryD9bXcgBRpX/jgZxHX4iqQoQaPNdr5IMkaXwd4zg6457Dh6v39fxRjh586Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTBiYVq5EJ3hGY+++xdSd+8+8pmkgvgCuN62XsuHqa64STeG4
	+ATosP9LL7tp2cHY4wpLI1rrO0ap2R8EqugNF87yFJnXK6WpayM0w41f
X-Gm-Gg: AZuq6aKheP7Q35tA5wrbwExUUYhZkFcJ6JLmNZZrr0uRocR+XlWGmRtX3HV12Y1vPjy
	1sKFt3UPS3fEKftKyrIUUwA6b6eYyBEscgpvfPrk8Vzp2OLkB3EQmJSMbKTXylJIoBcUUi9zi5v
	1Jjswf8dTpe9mQweutaeiuS0J5x3kHxpCvaeWIUnn/YYpX2o/2fChhh+tsXyjbQuLE1FvZN0kP7
	bgBwQgnfcLO7K2Z3YL4+IM5zv3vP/9DPRlZS7FSTbQDaS8PAYs26hLGf7py79H+cLZLJ4OevC8T
	Xg5mL1OglD+FujIyDU0QqzJDHnpXASD6aFCkqVDCDCC8T6+OQ1bzWqUpwGfbsUT7fLLis7lkGkW
	5PfqQNUxrnwckMtwQqR9dBzrboLscyKxQeU4eRruUwWTvhXekIlzF8bQ/7t3Za08VdWpI2ypvvq
	Q+ujoTzz/m1MmFqKdWEZ4a+S9e61hOUdzq+/gnsAg8OjkXyTd+Q1SUrbfyDYefKXEhtnzxjlAh9
	zDgrV00LVe6oWJ5UnbsMqsdLkK0Xi473ZJ1RVEITX8AAmUxJEVvgcYAvWQQLDklODlhAjv9cYCp
	/BCpfw==
X-Received: by 2002:a17:907:9288:b0:b76:f57f:a2c3 with SMTP id a640c23a62f3a-b90819214c4mr711516866b.12.1771884305230;
        Mon, 23 Feb 2026 14:05:05 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (230.86.12.34.bc.googleusercontent.com. [34.12.86.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm359394666b.67.2026.02.23.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:05:04 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH net-next 1/2] rust: net: phy: expose genphy_config_aneg()
Date: Mon, 23 Feb 2026 22:05:00 +0000
Message-ID: <20260223220504.2102-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223220504.2102-1-iprintercanon@gmail.com>
References: <20260223220504.2102-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add genphy_config_aneg() method to phy::Device, wrapping the C
function __genphy_config_aneg(). This is needed by PHY drivers that
perform custom BMCR configuration before calling the generic
auto-negotiation setup.

The wrapper calls __genphy_config_aneg(phydev, false) directly since
genphy_config_aneg() is a static inline function not visible to
bindgen.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf..5ccadc5e2579 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -276,6 +276,15 @@ pub fn genphy_read_abilities(&mut self) -> Result {
         // So it's just an FFI call.
         to_result(unsafe { bindings::genphy_read_abilities(phydev) })
     }
+
+    /// Configures the advertisement and resets auto-negotiation
+    /// if auto-negotiation is enabled.
+    pub fn genphy_config_aneg(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        to_result(unsafe { bindings::__genphy_config_aneg(phydev, false) })
+    }
 }
 
 impl AsRef<kernel::device::Device> for Device {
-- 
2.43.0

