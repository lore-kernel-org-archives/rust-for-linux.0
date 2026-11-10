Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332135;
	b=WNcFiH2uQ9n2DIwXtu93Vw60N6i7/SeKAtLLYvL8SPk86ElP+Cj9KLng2r5SNgAGwBLJ
	 nKFALUQejpHRavit5kkm8eXuUs7DzypNUc7pTu5YcWkcvzRaCrG6kYjPd75so/rNUtVjz
	 pcKdEImVqtQTlUnf3AryV2GXsku2NBzoI1LiivtgAp9yjgklOOC1Q7cDc8lqjzzpehAhu
	 Wb4pDYThdG+j7tuHF+6kdqTF9IdRlmqltuFRYDWOy/WBhRTFq4wPp2iIBIiia/kQXuv8n
	 zUFrMeL0PX7IjcpM0EbGSNOnqfaXTCCpJOExUOgpnT/lrhhT6mv6z/oZk1oqBUpeQCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CudlI7YketEzCVSJT03NZU5RlwZq59Cu0mkt/zIWBPw=;
	b=WqCExX1DTj0Qxm6d2jNAgXRwvzlINcNwNhXKqYf01ItOlGX8UM4CrBxOlklkmS0M8IP9
	 HX3wV4d2glQVJ89dOIbzEwL77h7ZdPWEhGlrk3oIAGQ/GGIhxqm1ylgBAIHuSeGYM45OJ
	 4AZLNixiJOuMkXodDJMk9/pJlDf1m1+ppXVwUc4VNUtC7lvz2o3byF/HihZTm/uueAiKx
	 vQaXzaqT9hiBYMeimr2MDqgN7JGk+cGrjetDC+hfoNhrWA54kNifBF7t/+CjqdTXipror
	 U74EPEphGtxZj1/bdgNES3u7iIjaEa24jV3vjapWsv86OH8ENEscwPoZ21dt/lAR34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s9qgm2i/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0F360A260C
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0F360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9qgm2i/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18208555e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332134; x=1794936934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CudlI7YketEzCVSJT03NZU5RlwZq59Cu0mkt/zIWBPw=;
        b=s9qgm2i/9+03MfM3S1l/idiyHA58y/rnTHyQrkzhO6na1MYnYJYXydyXF8sm+02jBR
         cEsOxqXlwX5t2AMLmZPVBN1M7yb25X3UnYkHgUNgzFireFINaE7w/9daaqpiI5mrUOH/
         8Wos3bdPFNycmg1avj9IdcaMZv4HLg+u1jkH5rv0MYs9Dcf2OLH8/If3ZGKQt/TTcBky
         rnUCfsDP4xnyZyWd3xQ1xMB968qjeTc3ELk9ZOGphEo0cchIO5cRCaCd8q0GI4/33fCI
         A5PLKw6TuYcptyPaT9yrfl5hCmdGMIKDtG3BQSR6kevpLwU0AhkbYspsYSICw9ON0i7E
         XeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332134; x=1794936934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CudlI7YketEzCVSJT03NZU5RlwZq59Cu0mkt/zIWBPw=;
        b=rV1IeMMeOvGecRS0XuHggKGW86u5jB1YaWf+7Bnt26tidsyrzisRfdhjDNVmQwsCTc
         tqEG3xYa1H296TVm+rYup+yNMHj7nioUSjF00cIwrqLZlqOmIyuQhKJ0jVVWOw6Zp3Rq
         EkIgcC8f69n+stZWGjXiS4A8k85yBcymf0p2wu4sTM0P8rBirIIXV4xAfUeI/ZRyUIDo
         mlhZgyZgH9EW+kZVbj6u+z0CNXLfEgSbhKqLPb/xLzjZwB+VGTQYf1T7FVHJLxyUpSQX
         TnEZWQfp6we+oHktrxfTKa1+pPdi5q/xvNvSe9k+Ty6hWGnFJdGwF07H+nVDUyjINF5l
         t08g==
X-Forwarded-Encrypted: i=1; AL+hErFQ/NZ9UK4Iqht/NhnI+p53Ab5i7xlR8skeFC1ciNBGC/qORagzwz+zllwt+1YLRCDEKGGfTf08PJ2UZ5IZGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fx+g3rUlCepfPsF8QdIzM775mGJU0FfNrHAIxVzRen/GLkTXj
	3yu3OWIfi1ZXSFujeUoG9rP2JXeiEt1pVU/gkJ3sgDOfmWaOCoV1Uwha
X-Gm-Gg: AYBFou28h4tk6w+xmfw5xy1SG8ng9O+mtiWzImyZiRr9pQPSXD35t+uWd5iLMRc7/YI
	u2M291q7vuuOyEbz0b8kvBNraJNg00lZVDJW3ACfav1MLNZ2oSyi0oDf/cyuWMiwN6PYhNGLUz6
	JVDglxMpIAaTmxCbT2v6YlaJgy3AXQvpepONJwhgH5Q4N8QkIFaGQPLORblCzaOT2xkFMebSuLw
	VAAaRbjy0602OGkb5FqtJWT7cwpTr46ETZhoUkpEz0UNfTX8jYZ8u8Esr9J3FyvejcOFxLbZtZu
	5QcF1Gbl5s+8zUC1aDzl7oLxeEK9nNKMYrSNiCRk1QMd29m0m3S6Z47RpTY7VOv7zz5JSgXu64e
	LHdQka03M7QPHYTB4KlxfmNLzg6ya1AiF9rxQn4I/aEQoYtJ1HpMUbBYh1sMwTqTTvQeuqdDb2n
	y5FAfcnxAntkWR7gCMenOlSpWT1N1awGetRZGBAACnsOkx0Lem/fsBtSgwktmUT81jBR8inefKx
	eKBPlht7emOEM55lsbsmN5+hDHe2N5ug9+RUBKaV184rCkwbFFZOCTdx27YxB/o0tspnfz+ZuE9
	J1/1bSq5B4cTznMvCnbVSIIdmati1vbkW6xvz9zsjwSDSTb51O1CCSRp7MIEZ2kewAjv8CLkwyQ
	eROsnu3Lq66dQDf/3qw==
X-Received: by 2002:a05:600c:310e:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ba023456eemr58674165e9.15.1794332133676;
        Tue, 10 Nov 2026 09:35:33 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:33 -0800 (PST)
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
Subject: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
Date: Tue, 10 Nov 2026 17:35:25 +0000
Message-ID: <20261110173526.1548434-3-julianbraha@gmail.com>
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

Horizontally scrolling through long expressions in menuconfig search is
overly time-consuming.

Let's wrap expressions (like in the 'Depends on', 'Selected by', or
'Range' sections) between tokens at the end of the window, such that each
line begins with the same indentation. Ensure the '!' negation stays
attached to the left side of the option symbol, and keep the value
annotation attached to the right side when wrapping.

Note that the 'help' textbox uses the same expression printer as search,
so this has the side effect of improving the formatting in 'help', too.

In the future, we should consider a larger revamp that would wrap all text
in the search window, allowing us to safely disable horizontal scrolling.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- properly support trailing '!' and leading spaces (sashiko / Nathan)

Link to v1:
https://lore.kernel.org/all/20261010095001.265759-1-julianbraha@gmail.com/
 scripts/kconfig/expr.c  | 28 ++++++++++++++++++++--------
 scripts/kconfig/lkc.h   |  6 +++++-
 scripts/kconfig/mconf.c |  2 +-
 scripts/kconfig/menu.c  |  7 ++++++-
 scripts/kconfig/nconf.c |  2 +-
 scripts/kconfig/util.c  |  2 ++
 6 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2b91d16bf14f..9284ccb20259 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1155,30 +1155,40 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 	if (sym)
 		sym_str = sym_get_string_value(sym);
 
-	if (gs->max_width) {
+	if (gs->max_width && !strchr(str, '\n')) {
 		unsigned extra_length = strlen(str);
 		const char *last_cr = strrchr(gs->s, '\n');
 		unsigned last_line_length;
+		unsigned int prefix_len = strlen(gs->s) - gs->wrap_pos;
 
-		if (sym_str)
+		/* Ensure the value annotation stays attached to the symbol on wrap */
+		if (sym_str && sym->type != S_UNKNOWN)
 			extra_length += 4 + strlen(sym_str);
 
-		if (!last_cr)
-			last_cr = gs->s;
+		last_line_length = strlen(last_cr ? last_cr + 1 : gs->s);
 
-		last_line_length = strlen(gs->s) - (last_cr - gs->s);
-
-		if ((last_line_length + extra_length) > gs->max_width)
-			str_append(gs, "\\\n");
+		if (last_line_length > gs->indent + prefix_len &&
+		    last_line_length + extra_length > gs->max_width) {
+			gs->s[gs->wrap_pos] = '\0';
+			str_printf(gs, "\n%*s", gs->indent, "");
+			while (prefix_len--)
+				str_append(gs, "!");
+			if (!sym)
+				str += strspn(str, " ");
+		}
 	}
 
 	str_append(gs, str);
 	if (sym && sym->type != S_UNKNOWN)
 		str_printf(gs, " [=%s]", sym_str);
+	/* Ensure '!' stays attached to the symbol on wrap */
+	if (sym || strcmp(str, "!"))
+		gs->wrap_pos = strlen(gs->s);
 }
 
 void expr_gstr_print(const struct expr *e, struct gstr *gs)
 {
+	gs->wrap_pos = strlen(gs->s);
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
 
@@ -1209,5 +1219,7 @@ static void expr_print_revdep(struct expr *e,
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
 			    tristate pr_type, const char *title)
 {
+	gs->indent = strlen("  - ");
+	gs->wrap_pos = strlen(gs->s);
 	expr_print_revdep(e, expr_print_gstr_helper, gs, pr_type, &title);
 }
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bbc99f75b416..a1d3e366fb76 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -65,6 +65,9 @@ struct gstr {
 	* wrapped not to exceed the max_width value
 	*/
 	int max_width;
+	/* Indentation of wrapped expression lines. */
+	int indent;
+	size_t wrap_pos;
 };
 struct gstr str_new(void);
 void str_free(struct gstr *gs);
@@ -101,7 +104,8 @@ const char *menu_get_prompt(const struct menu *menu);
 struct menu *menu_get_parent_menu(struct menu *menu);
 struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
-struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head,
+			      int max_width);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
 void menu_dump(void);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index ebfc5bd09c1c..ba258a032094 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -433,7 +433,7 @@ static void search_conf(void)
 		struct jump_key *pos, *tmp;
 
 		jump_key_char = 0;
-		res = get_relations_str(sym_arr, &head);
+		res = get_relations_str(sym_arr, &head, getmaxx(stdscr) - 10);
 		set_subtitle();
 
 		res_title = str_new();
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 2b2166edeb25..be5a19c8e0ed 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -689,6 +689,7 @@ static void get_dep_str(struct gstr *r, const struct expr *expr,
 {
 	if (!expr_is_yes(expr)) {
 		str_append(r, prefix);
+		r->indent = strlen(prefix);
 		expr_gstr_print(expr, r);
 		str_append(r, "\n");
 	}
@@ -768,6 +769,7 @@ static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 		expr = expr_alloc_and(expr, prop->expr);
 	if (expr) {
 		str_append(r, prefix);
+		r->indent = strlen(prefix);
 		expr_gstr_print(expr, r);
 		str_append(r, "\n");
 	}
@@ -790,6 +792,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 			prop = sym_get_range_prop(sym);
 			if (prop) {
 				str_printf(r, "Range : ");
+				r->indent = strlen("Range : ");
 				expr_gstr_print(prop->expr, r);
 				str_append(r, "\n");
 			}
@@ -828,12 +831,14 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	str_append(r, "\n\n");
 }
 
-struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head)
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head,
+			      int max_width)
 {
 	struct symbol *sym;
 	struct gstr res = str_new();
 	int i;
 
+	res.max_width = max_width;
 	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
 		get_symbol_str(&res, sym, head);
 	if (!i)
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 4c9c4ee7c3a7..83c13ff108d6 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -743,7 +743,7 @@ static void search_conf(void)
 			.target = NULL,
 		};
 		jump_key_char = 0;
-		res = get_relations_str(sym_arr, &head);
+		res = get_relations_str(sym_arr, &head, 0);
 
 		res_title = str_new();
 		str_printf(&res_title, "Search Results (%d)", sym_cnt);
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 0809aa061b6a..5b80393048cb 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -77,6 +77,8 @@ struct gstr str_new(void)
 	gs.s = xmalloc(sizeof(char) * 64);
 	gs.len = 64;
 	gs.max_width = 0;
+	gs.indent = 0;
+	gs.wrap_pos = 0;
 	strcpy(gs.s, "\0");
 	return gs;
 }
-- 
2.56.0

