Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1614B95C7
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892892; cv=none; b=mPUPbua31MFjF5FSahSTYGMWNcfRyEIeb5xWuS3leL52GLpANQqOdjPF/xHAc4np6fga53HxPLg54k69+sSzm8vZE2Cq9E1XEsLfPbOE47sM1phfcy4PbyixOO6RTnHe1SqMvVZPH5cjaJRF6bx/TpnszLxa5pvprtTjazE57sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892892; c=relaxed/simple;
	bh=dJX+goGiefWsdYvJxAHQh28fm4SwKCDYWfiw2wG9XPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkWGcoHAi9iAOCLYkzD5WqHsRPN7RE7c/S9iXSBdoVGRMNXzCe5rz3PpV859iS73LQYNGrq9SNz+qVBXGqRr3+NVJuDbavDVjFV/5Ar72d/90pKmDcRnCBFqXJlzskoI3Nrqubirr1UkVKEF810X/BR3VTblxjEvV3L7g8vnHx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=nyatMXj8; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="nyatMXj8"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1090135a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791892890; x=1792497690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsR5FKgrqHkN7GSSB4XxOg94MOrSNjHOlKhMZD0qpI4=;
        b=nyatMXj8nW95lEpTQxs5pa5aoX9p+Ot5Asuqv6XZUcPbPQb7s/satNsIsUYQ3ESaFP
         7TpfRAZl07aBLXmGyW4BaIOc/dPZPiG7Y23SWYImZ7ZFkp3C+WE1ecQyBNxVdXKrDuNA
         A4Jbv6Q6BviNF4Rsv/6K8qXkH/u4ziyHG2V81J2s+4Jzxt/i0Px313RmuVSEYuHOLDsg
         iqM6mJu1xC7JgbnNGApACWn3Wc9YTrWgXCYjJCJA0ir5ge6502DjWlUYy982Qi86QZ14
         d60+lugtIUlDJTgtKF6DT1k+GPO+T3C6nbIQJpRU79/rwNQwgHTsCvRMx+w79rXEf2p4
         lwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892890; x=1792497690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsR5FKgrqHkN7GSSB4XxOg94MOrSNjHOlKhMZD0qpI4=;
        b=MIeczoEjnOx9ZwSOjXS4lQPgGbWE7sP7W2nndnME66iUbtQT5nYlgv+h1oLbfPzqtO
         ZHgnBDKQtlift7b8quL4TiICxxmgWHAZR0sgHksqyUF0HneRQ9AyAmnORa0vcw5ayOdS
         zOg2pdE/KCkQt6uxBdLvqVjMdWmjvAPy21l4OAnxve8NhzD6hnzNRGdztENPdvYlhW4L
         r8o7z+OwN4fS+fTUsGpACQBVqG6YZX5ZnQoJbEV8gNHWvbfu8rRdbLNt0o73hev2RLrB
         GwvkpnOMb1T/UTL5QQ+SGbu6TE1ehSplTZS56t1yy0RyQOzaSDdmF8qOW2FMQMR4XGwj
         E+UA==
X-Forwarded-Encrypted: i=1; AKwUvBybw5VxQYo0+WmgQbVbp1KAVKqcIOmnqoCVyhdcG/FU1vwyysL7Z/nDZ9cEOTSoceZ9Hmd3awCXTXFgg/DqBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFDxRFB6TYW1dNc5xrlhCYVFOFmUsvGTfS9Zpd3g6TkDPL2/Ps
	nep3jWCqvf3zYZmm/a6vvpZhZxZVBJARqh3sFVqicEnLhLFMVQhNs0AyKu4qao98hg==
X-Gm-Gg: AYBFou1psnfckFNlfxCUIH4JGrZ6yuEyjwuwWpRsV6il9qneWvgq5li7hs0TIsaOrNg
	Hl/U711Zt2rH3CWkiKGDzV0ErFpKhnb6OyB6gr+bpp2JpvSnfUNmm4+VJgORumJsT1Ulrg3TIYn
	M/CoFVnUkwx+JBP0WXkY6Fb76f2jt+V1D/tVYzFuyxUCZ1c/CKTVwETaamRFBo0ucb9v/QoM5qM
	EovS/F06yd487FigSLcJm/YMP/3xcjjh0mbpS8q1L+WU8Eq/mHHEXHbiT12d5xwGgk76HRXRKv3
	REMvJWi5CLE7EoMfYeZD4X+eKwyGL+CtbWdnEpyVDv+SG5jZ+nvuTd7p2GONZ+TYCl9VIbgu86E
	7u+0r/QfcMgWFq0Ugs+tmznllABv1szSWKfJCBUE86rZYGbpETLz+7nGvuuQ6dclmZhH0gSTxhT
	dILtLk5wPgZ+S9BBtB3OdByeQDfHVmS0WYL8Xd7u6VALhYQjlDitPbi5pquMKi0Pn4rYe9jIz6+
	TvHz44aug==
X-Received: by 2002:a17:90b:258f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3ab3ae368c6mr9179459a91.50.1791892890015;
        Tue, 13 Oct 2026 05:01:30 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm16566838a91.15.2026.10.13.05.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:01:29 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 13 Oct 2026 17:30:39 +0530
Subject: [PATCH v3 1/7] greybus: connection: Export gb_connection_get() and
 gb_connection_put()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gb-uart-transport-v3-1-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=dJX+goGiefWsdYvJxAHQh28fm4SwKCDYWfiw2wG9XPs=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqzh2CeW6DMpVMU+ZQxNRDCnXlSuaerwVN3ctuU
 fJTNs/QPOqJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCas4dggAKCRAFzvXHieVa
 dORyEADiYUcx/P707yxNXqADkim7p+gQ3XRlwg5IsquK4bn+dBr1KEcrn5X0AYexO0DURoDPhG6
 bd0xKvbAiqz1ceAL6n9ThIpDPTBtjplksE89OP0ujEDvyQ/PZyZu8AuSzfFVVgjUYrr0s5OgBo4
 h7YuTtq7uhB04sMAcy/Gsm5ruot8lGssOT9cMqVTiV1vPoOtwCoBMmgkhqqtHt+Uv2GChGl16A6
 GmniVFK4aDqPAygkVCi5ogMH1wkRRJMaFZcQKJ9Ynev+aviDVCgfL7sC0C/C1ALp1QB1Q0fPRlp
 fdJyAEN4tbQBnRYHD1IvnmEOakduYxpefcBg6SuQm19cOsOlz8kJJvC/xyKNhpndVB3AfhmGZYr
 ivqz0A6nqo4XeOpaL5Et+RGMWEiGtRw2i7L/RKiYd8uCyikrJi3H1kpvy42MbbcTyYVHqG+y1cb
 i6gbWJyAFPhNI4sCrxR7hhoy/moLWr+d3QI52SD1N7xrJgCcd3rhoQRkIFQssgVkJ5JvSMoUsHq
 6OhE6a2/CUI5hV4tCB85lIBgbVD1/tlNR/Swa7FrQ1i8s4yDOkaIbTilAMfepODR9wIO2MbzLdx
 GIr1phhMYsYfGzCKB+8d3TlamjBbXXiNd5jidVmRbu/6ERSD9nHBrnAdA+eU90lFIOPw889WGyh
 hTWE74LFQ50LsqQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_get() and gb_connection_put() are currently private to
the core. Drivers that hold a connection reference obtained from a
lookup helper need to be able to drop it, and drivers that cache a
connection pointer need to be able to take one.

Make both functions non-static, declare them in the greybus connection
header, and export them so modular drivers can manage connection
references. The first user is Rust greybus abstractions, added later in
this series.

No functional change.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 6 ++++--
 include/linux/greybus/connection.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index bd04485decb3..f8fda22bc466 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -33,19 +33,21 @@ static bool gb_connection_cport_in_use(struct gb_interface *intf, u16 cport_id)
 	return false;
 }
 
-static void gb_connection_get(struct gb_connection *connection)
+void gb_connection_get(struct gb_connection *connection)
 {
 	kref_get(&connection->kref);
 
 	trace_gb_connection_get(connection);
 }
+EXPORT_SYMBOL_GPL(gb_connection_get);
 
-static void gb_connection_put(struct gb_connection *connection)
+void gb_connection_put(struct gb_connection *connection)
 {
 	trace_gb_connection_put(connection);
 
 	kref_put(&connection->kref, gb_connection_kref_release);
 }
+EXPORT_SYMBOL_GPL(gb_connection_put);
 
 /*
  * Returns a reference-counted pointer to the connection if found.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index d59b7fc1de3e..b53aad2270d6 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -128,4 +128,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 	connection->private = data;
 }
 
+void gb_connection_get(struct gb_connection *connection);
+void gb_connection_put(struct gb_connection *connection);
+
 #endif /* __CONNECTION_H */

-- 
2.56.0

