Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3B461DC9
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877749; cv=none; b=qzA0pbItgpMzMBnNlHmPeAUIYx2z6z/LUQ+ppcMUYEPNJihri+rxDXGQHt/ufTRu9QL+6ufukBZNAcWhWKfS+l+4cNKwJqK6UUldxhquZZnxW2JTjMCBGZpwuromMixmV+BiGtyuxUDvVkX9ZHSw1H52/qDLrF3huwoGfx1LCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877749; c=relaxed/simple;
	bh=SjDPOVEjjCLO/yuHAGOFLwCO2B82uxwIcKaPRHAXz5c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lNY/nt25FkH+ta66Fe2tAe27RItUL08s5Abaat8iLstGPiA7WvQ1F9XaG3+K5EB1QOdQpY/MdmkIdsSGTqf1h5o4ytPtRMEj0CpDVWcORqy4CxCw8+TnACPDnoVoEZQluL3XjufX8UumvIBnZwvL6XN6OcFbWfIn7RxxNyIlJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u7OCQpqH; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u7OCQpqH"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7d28772a67so278041966b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767877744; x=1768482544; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V5L4ahVUczpc7clktpgg6OANueJ6aYGxQVrrvy65a+s=;
        b=u7OCQpqH6yIRHnsOChTAmkTS6klZfmLJGJmYS0N4yyfDKfPVS+eEx5KtBqacXzGNEV
         POpvJDwYGQXMtdfq09cJpxJ4uW5EV4+9d3af091YNl8iFM8V1kmrUYnl5daCfICCsteZ
         NnROaLQT7HIKXFbFb63z1SHLaqfUR647mUfBE1c2l5yofXhfdkzCVSoa6MW+OWsiMnxV
         pjp6/83Be6PAHf50gyma6ZYKS9yCVU8cKdjt9hOT/eGfUNBLlcym0YUFjNyr/k5MBy4w
         Obf//CrGODaILcLd8MOsNehcm2BDBCn25emtLx5UwkoikaARbM6+VyITEbLn+sx3KI5x
         giPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877744; x=1768482544;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5L4ahVUczpc7clktpgg6OANueJ6aYGxQVrrvy65a+s=;
        b=J8rJXlPX054uKNOeJYj1Nd7AHsauF2X51uFUkLPizFyyoub2pmopZdjtX5pQGW1N8u
         SuUX3FXc2PEvFWEyprvI8Vim8j1MRtfzhKHa9TA1NEBbbKXCyCd6kMaYNPDrdY/sI8B4
         kTFyfQmyl9NuDgw2/ymDe8w3rnv8PDo2Kj/QWasHigO1AX0EE3b71TR0T+qgGUkxvirt
         dIbjt1bbjfOE82Cg1wNPSO0ga8kqNtTh/S4R18BUjf3ABWcJszY36fRMu0xZfS2w3lbB
         oVp6V6i8kfGaAIovlCgMZzyNIv5WB2Nm80c1MYFCmNgUSZjzNCvtsjJcDBKaaUoHd3+i
         ZHiA==
X-Forwarded-Encrypted: i=1; AJvYcCULAisH9HPKy45YkFnemY1C+IzkzWjgneYUwoFHvvIlovCZEYV/q0+bpipVTKF8nWfOa6HgOeWBmpTdRH6RxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeIz+VJdNbaWy2wfdHLZeV3y0/8HsICVQx8JqvI7qppOIS0av
	CBAU9Luh93CX0TB2VsgLDt9HXHsXUdUE0W48Ucd1mNXdWPk2fdRAF/+pLI2ONRxH5umaxSIGqiR
	gzTqyyRz0g61/U4KjhQ==
X-Google-Smtp-Source: AGHT+IGsFQIIOhmBJKafXO+70oCUxDC9cwQyqltNHoTwh/Pr2P0gHKWoS6/lfN74T2Q+UgNGyV7mmaOISSj/cfc=
X-Received: from ejctp6.prod.google.com ([2002:a17:907:c486:b0:b84:5092:9ce9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b8c:b0:b73:6dbc:39fc with SMTP id a640c23a62f3a-b8444f6f783mr642771366b.30.1767877744588;
 Thu, 08 Jan 2026 05:09:04 -0800 (PST)
Date: Thu, 08 Jan 2026 13:08:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGisX2kC/x3MwQqDMAwA0F+RnBdotSvTXxketEtrYFZJ3BDEf
 7d4fJd3gJIwKXTVAUJ/Vl5ygX1UEKYhJ0L+FENtam+seWGijPLTDYdtmTngRN+VRHHWhE3rGue td884QhlWocj7vb/787wARxNGqW0AAAA=
X-Change-Id: 20260108-gen-rust-atomic-helpers-msg-3943461645fb
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=SjDPOVEjjCLO/yuHAGOFLwCO2B82uxwIcKaPRHAXz5c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX6xr+rp7ZzNLr5ZskuKa0qlkoOYsbnph7mcG+
 ElljRjCp+qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV+sawAKCRAEWL7uWMY5
 RvA+EACWHRuZeNLJbzT7I05Ifb4Vi2xpEmD3UIsHQSVpcyPstTsg/WOTV8Lph4jdqO6Phei2OYo
 MkGwEtSvcQSznt27iyj/+ECUMaYgNJuTCQZKpx5/E/nUp7WAq16VZmO9Sa8SD4Ya4Uak8Aa02kt
 PRzehu6LzQuz9cnmXH8tAX5vdt7+XnwX1Z3aW9kTlNgxlGGx+XstVfiixnBQrI06rK+NFCJvWcL
 0ss90V595XWvbpuD5cjCrmPyxk5rOXt1D5hu5Uat9fIXLhjn1b3X5fGw7x7ZR1qo+gYZ/YgLG0L
 kLIu3HjiZ/Mp5WfIWmtc2NHLIE/o9p2gqN+/zpS7FXT1mAGw5Gyf5/1RS7GWz0gCVYWo0Sxo5YY
 CNMaAKbqnMjZjC7p2nhrEX6KDoFex+c9O8WovL9QfQHfS40mI6T8e12VYwOuj/0oe1pkQmU/O37
 mkZirphIKe7lcsbB6bljYM6Kbc5o/ObI/RWUF+KNepspix1ZkfxyNnRWowZptTltGH6ILvz1IVi
 DTwTLRBYyxs45tDDsx0o+78jvJ147FkdMk10ewSJj3THTS4255mL/zLTpr5l/5bDvb+0KNhVJXW
 hArYSQM0If3JTl1OmaP7xaqo9eCdVgIdR6J8UkDSGcOgb7oBoixp2KfVHSG0ld9igNwD3glHdF5 eSQJPQCxUxoBVRA==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gen-rust-atomic-helpers-msg-v1-1-d895a9667148@google.com>
Subject: [PATCH] scripts: atomic: check for argument in gen-rust-atomic-helpers.sh
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, running `scripts/atomic/gen-rust-atomic-helpers.sh` without
arguments results in a broken header file and grep errors:

    $ scripts/atomic/gen-rust-atomic-helpers.sh
    grep: : No such file or directory
    grep: : No such file or directory

The user may do this to re-generate the Rust helpers, not realizing that
they called the wrong script [1]. In this scenario, point the user to
`scripts/atomic/gen-atomics.sh` instead of failing in a cryptic way.

    $ scripts/atomic/gen-rust-atomic-helpers.sh
    call scripts/atomic/gen-atomics.sh instead

Link: https://lore.kernel.org/r/CAH5fLghgm2pPdKen2rv6MeSXAYG_j_eCqvM0b=VbTbUM9eswKg@mail.gmail.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/atomic/gen-rust-atomic-helpers.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
index 45b1e100ed7c63108ee6cb07e48a17668f860d47..1c76f8ae731de9ac069d489469b0383f256b1539 100755
--- a/scripts/atomic/gen-rust-atomic-helpers.sh
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -5,6 +5,11 @@ ATOMICDIR=$(dirname $0)
 
 . ${ATOMICDIR}/atomic-tbl.sh
 
+if [ -z "$1" ]; then
+	echo "call scripts/atomic/gen-atomics.sh instead" >&2
+	exit 1
+fi
+
 #gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, int, arg...)
 gen_proto_order_variant()
 {

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260108-gen-rust-atomic-helpers-msg-3943461645fb

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

