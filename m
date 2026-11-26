Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709168;
	b=I7QQdWCDxbqYHnn2/bbllIS5VcqwwmozZY/5tPa5gpgny0al1fhsLgAdXHN8PjFTSxJP
	 lSKw6B+XJ+WuFfXZC1MEvfqgiMhv29PUCc68ejp6c5BGhJFOtvp2yg/czX0HYp21a8fCF
	 0jcuhb/Cc67FVFYUSWRjv0mV0iDmi3+AOE8Ab9gADxaV7iyi2OiFiv4SzTDxQRHqrDTxj
	 aWLhWq/dtYMMEC8DUCqhj6UFyGTO1KyJOO9faXbtBIbO5+p1KZcILuEw8ArJQ8Sr3766c
	 nb0zT2K62HdAwbCYjTHfJiNX+G1EUWrQZE4sYft36gb4XbICPAQQizCUqj06PYTjYYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709168;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=6szz3JIe+2EagVt2iFHYcOqoDNNeZy/b4iIy8g//F4U=;
	b=OoWB/d1jE9t4iQDegrVS9Xa+1yMltTnse0nw3ADu1hPnwal3CLw6oTML/YAPeveRsNxj
	 AZ2VtXkSctDZnvOEE+jC0j6zS/sN4FKUE422e9g1hpGjmM0nL6/HbvBDpjPIoyBEA/8zH
	 jJksG3KaPfBP6fA8sUm97Wd/H7zr4jSHtI2sRdrLeRuG5o/GZa+qERtuLy4tv3faNtSvq
	 neWLCLLsa28qPszd2i0JqSLlRha++dTba2y6YKfLMDCcJSC0dy3y5GA/3luJSbw4CwlBT
	 lI593j4laUHhnksSvT12ZNyB9j+EnI9T+3e5mMFR/UPlFSN075fWfGTXxoYX3tsnFZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TtfsZjWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA57606A321;
	Thu, 26 Nov 2026 16:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TtfsZjWy
ARC-Seal: i=1; a=rsa-sha256; t=1795709087; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DVDttbD8RVxmi7V1oSiJISFk6r3uzAKi+C/RbIYDCRV60PhJHbOjKL/RqvedBIEBvcuqlpWw+DHGVK5pYPNxOy4H0yGEQsVFGqZle9vPSbUtF+Bj0sZksWR1hdY3RJOf6nsoDFYfNsWw7A+QOLeZba/3KoPBLiTRA+lrtv5W5S4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795709087; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6szz3JIe+2EagVt2iFHYcOqoDNNeZy/b4iIy8g//F4U=; 
	b=h/widPORPpds9B1MQnNj3Bz6wri7M5GzZkaaS2Q+FRvmQfFrgMqLXGRzzNeGP13eTMh7efe7cAle9yi0M/3sK+iFJg9zC1W12LmNi64vV34lcw3fiMZ5jWywVbJKweXlE666/dmtNFjhA+UV0tWJJ5FAssGpRUN65P6pqkJW09U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TtfsZjWyVP/VSuckY9ZHkJG0VKzJN+cK0OVzaEBpdu2FuAI2NqYGISHNTr0UjV8SdNcuEa+qxiLHWGUPBpTK3494RhVOUPIH/yim4PH2NLIFrpxTOApOW2FX0LgI+CUMTPaIiGc2Q0KuHHTdwsgpW35Ho1GoyYxRcnNqiXNv80U=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=6szz3JIe+2EagVt2iFHYcOqoDNNeZy/b4iIy8g//F4U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795709085055527.4889555397564;
	Thu, 26 Nov 2026 08:04:45 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 13:04:28 -0300
Subject: [PATCH 1/7] rust: reset: add reset control helpers
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-rust-reset-v1-1-9c4c3d029080@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
In-Reply-To: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

In preparation for the reset control abstraction added by the next
patch, make the static inline functions it uses available to bindgen.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/reset.c            | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..d8bcacb7d8ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24063,6 +24063,7 @@ F:	include/dt-bindings/reset/
 F:	include/linux/reset-controller.h
 F:	include/linux/reset.h
 F:	include/linux/reset/
+F:	rust/helpers/reset.c
 K:	\b(?:devm_|of_)?reset_control(?:ler_[a-z]+|_[a-z_]+)?\b
 
 RESTARTABLE SEQUENCES SUPPORT
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..c96634bfaacb 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -85,6 +85,7 @@
 #include <linux/random.h>
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/serdev.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7b..a5a127935961 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -92,6 +92,7 @@
 #include "rcu.c"
 #include "refcount.c"
 #include "regulator.c"
+#include "reset.c"
 #include "scatterlist.c"
 #include "security.c"
 #include "serdev.c"
diff --git a/rust/helpers/reset.c b/rust/helpers/reset.c
new file mode 100644
index 000000000000..ea2e6f09b7d5
--- /dev/null
+++ b/rust/helpers/reset.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/reset.h>
+
+__rust_helper struct reset_control *
+rust_helper_reset_control_get_exclusive(struct device *dev, const char *id)
+{
+	return reset_control_get_exclusive(dev, id);
+}
+
+__rust_helper struct reset_control *
+rust_helper_reset_control_get_optional_exclusive(struct device *dev,
+						 const char *id)
+{
+	return reset_control_get_optional_exclusive(dev, id);
+}
+
+#ifndef CONFIG_RESET_CONTROLLER
+__rust_helper void rust_helper_reset_control_put(struct reset_control *rstc)
+{
+	reset_control_put(rstc);
+}
+
+__rust_helper int rust_helper_reset_control_assert(struct reset_control *rstc)
+{
+	return reset_control_assert(rstc);
+}
+
+__rust_helper int rust_helper_reset_control_deassert(struct reset_control *rstc)
+{
+	return reset_control_deassert(rstc);
+}
+#endif

-- 
2.56.0

