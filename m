Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332134;
	b=um8z1xZG8rdOlO9lHbW6Isiar4bxYt3DqCnOhTdsmg+8TuctYaqln7IIVbktmll8IkZw
	 Pb5nMMcTE089vORbQtOfzlz0tWDXBfdUuBd0pUKXm6A6WWvaWV4KdBf1wHi5GV9hk3Hen
	 Q4eN6gVMxYTfdQOjslxB0R+YDOCIaSTq+VtMz3XL9lbx1iWPTBzK55D/6OnvxZLiYaarm
	 rHbc1wXEjCxiz7w8+rSigUUSMUqVyCM0d4vVvBpZaN1KF4OJxvxUwcYz+ULfigxLvPcJ2
	 Zoje7+9q6HWepLUvwyC+DJ8M52aH8SxKaEHIx0h54o++0KS/aKQ9kcy8T5jOPoo26ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
	b=I0FLnGRakeGqO02pIJ4B9920E5SaOceIYplHNA/EGqoXjzTmcATHa9mUITK2LgqICk5x
	 ZihdHlwTgJB6/KrC33PFPoVW1ItvO0qUCqZ40q3zTUwgLynbOy1kn5vVCZMyIcn/uVwF1
	 tU3H1iRxZ50TyYCQeH1q9eMOHXsAYNH/kFQhuLIo9vH6ck74Z0M+ImtFrdMNp3FKrHhsl
	 4py5B72K441+j7xDhgBTLCFGerXplcenOLat55jF+Uiur5aoEuifAfC81RkAwltTX4Bm2
	 HEvSCJHJT4na1Tu698p5WOAxKhDXrKYNMUqpDpwewli0OEo/8isProF5yJxjNgus28A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N/ceMGKt";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F64606A335
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F64606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/ceMGKt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso1630137f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332132; x=1794936932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=N/ceMGKtm+i6+xJoY9ITibg1IKT9/vxsdjK+ngauxjr0ae1Y7JjZGyDukNRKhbP7ED
         s3VJ80RzGE1YDa5olmFvHx2oHsnzrAcI8w8RkH6qp/gTkFqdylf9LBs44eFvi9HMKydn
         pDs9XnFbwxjFRI9kBCvwmfqSeU4ruP1ZbQOujrQ1wpnxRShtrDJ91RncqrI1CaZUUZax
         zYHzR/1taog5P0miN5xqemiagnB4QfBLKaLFvWiOC6AvrqmROL7wgpoqr0SG5S6eUO/A
         xTaWP1Q+gAoh8YfCXZWFXbrinXxzwsNvd+b7F3+5CXu/s7Yj7Ak3qHawQTY654pzTnHA
         qlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332132; x=1794936932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=YefdQJy63tQLTjCfGlutaTPRI+BpPhZ7ezRBkyhldNMLG0Z3woLF2VIDEQv3vsgsTy
         SHGmgU5sOSBFqqhf2guM58ylw9Z+2ZxqL5O8CVvKdjKag+dcZjpPg4bYeOT+jUHJfPMM
         UBDdmSLBomkoCZEFgB/gfM5YqHrLpy9b4RT+uWzGkxdHJm04q61rSqFezezrRYPE2mug
         CWPJEOg0u2LpIiMdw7DQzlt9FuI8Phhuk/sseZ6cNqzSXJ1BH8FJv0G+Uujl+vxktz5/
         m3IiThHj0VVrnq7dRLZVx+SJoB2MjFOTSVNRvoF6Dpg7lyVNNnj5FXJyoIsNS0xZEpnp
         U50A==
X-Forwarded-Encrypted: i=1; AL+hErHmBG7YYivsSevr9XVSzC8iAK9DTqUnCg8irrgUemkKzpsLiVXoYKoAFjvin8VuYx/J6tokFSD96Opnq9sjqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tm2Tw4WKkxf6hEy9Q9zQ05+fqflikMvyvxXKWmUOA+2PMPe/I
	BlQET8qL9SggKOyVKcR7Hs9kcNxb63D7SqFXWhizBEI2JuOuzHEheDw8
X-Gm-Gg: AYBFou1HTmm5EnCUbXgci9bKtTLtNcktGfyGPnq346dr+341Fy4JpiddV+MfJM4ySUQ
	fzu40tk1fumv1mdDaIbv2RAL/VoEBkGi1CBpgPfJ9B+XIUdwicr6UDwMHhzgRVhby2MQRyUXHDY
	XcdWhAG+ztffL9/B1KOIEdvFiqdENN40FKS/S5itAAw9kXSECzHZtyZ52PLTethH/DHA5XlVRbo
	tW/vFSo2H3VXj30vkiSVjWKJpgXT9LAFCEcFb59LzKvdD2zp13C7Nq4kMoQUywzmQ4T7ZEPKldo
	6X3JcM5bBcUieo7q3v16BECZ9nEhlJlFLZTEj1SET3aaiEknakR96sgzIVJFtaTlnU5But3EAfh
	L/jy2YLBWPSi0igJo6/AzJMODuR/yKFY7IJVhXQueqgnDIY0Y/RDOOs1cc21mXcJcVwtEFSqY91
	po2yaCkygfBfqRbAFDEmGyCgC6qGz3lfUoVFR9nQ3PiDNY1/kDFPEAXMC2SJI+VhRG8X75jGqF5
	4ouTaPzqrz2VgTojcQhoXhUdVPazoas2Zu07IUnTRY6GWQWcVtBXcVTQ9EHazix1brvUxwS3XSU
	guGSH8FbtKEeTfZiuJiYDzrBGcGqZ5MIS81KaV0fRQksXbjRgxk1aBefFyq8EgOyzqyJLt+3ZZz
	Q4btKQVcYt4d4bTdTQg==
X-Received: by 2002:a05:6000:40c8:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-498302fb9f3mr6993067f8f.35.1794332132102;
        Tue, 10 Nov 2026 09:35:32 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:31 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 1/3] kconfig: print the output of expr_alloc_and() instead of printing '&&'
Date: Tue, 10 Nov 2026 17:35:24 +0000
Message-ID: <20261110173526.1548434-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110173526.1548434-1-julianbraha@gmail.com>
References: <20261110173526.1548434-1-julianbraha@gmail.com>
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

Clean up expression printing for 'select' and 'imply' (which ANDs the
select/imply targets), to properly call expr_alloc_and() and print the
output, instead of printing a literal ' && '. 

This is necessary to ensure that any '&&' at the end of those lines can
wrap properly.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 1a3ad09a92d2..2b2166edeb25 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -761,19 +761,16 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 				 enum prop_type tok, const char *prefix)
 {
-	bool hit = false;
+	struct expr *expr = NULL;
 	struct property *prop;
 
-	for_all_properties(sym, prop, tok) {
-		if (!hit) {
-			str_append(r, prefix);
-			hit = true;
-		} else
-			str_printf(r, " && ");
-		expr_gstr_print(prop->expr, r);
-	}
-	if (hit)
+	for_all_properties(sym, prop, tok)
+		expr = expr_alloc_and(expr, prop->expr);
+	if (expr) {
+		str_append(r, prefix);
+		expr_gstr_print(expr, r);
 		str_append(r, "\n");
+	}
 }
 
 /*
-- 
2.56.0

