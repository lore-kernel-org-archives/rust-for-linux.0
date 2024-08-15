Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36A1C0DCA
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743587; cv=none; b=W6/CVLnY/y3C1dxSu9uLfAOPZUyNeJPKAvRVBjk92r4NqAMqyJxuxEvjEaDBcCM1/hRXfRXLQGAqtxjPb/mirt32V7eOkR3svJA4DKSi/0wi4PFbYcsiNXnH0ZsEErQ9Kl7S+xFEGi5xt3miY5bMU5IbGPduFiGydCikY4+r7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743587; c=relaxed/simple;
	bh=u2NAoGPKAPKT+TpiqoFdPon2GiyhMXZdDU3h7zflpd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sp3xzazRhbp9nYDIpdQk74zpDb+8bxhUDZ9UFcML5EqjykS92s0nlBflvU0cNlEbRMMWajl/gg6pqU4IbraijUxbPrqg27kZIZk9ZFV4+5ZH8ymrZT3V+HIhwVyVOWCC6gprMhvahmUZPqxtXawpJm4hY2OXl9TBbGa+2V5txkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vlQ+e9jU; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vlQ+e9jU"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ad660add0fso15097437b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743584; x=1724348384; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvkihQVxilci4ahNE1D8FzulqWknfQTNlLMa6I6x8hA=;
        b=vlQ+e9jUjZcOlUACbuVApWiv2hKkg+gCV9rYJJBOuMYl5PzhW4Z4uf6aaqNVol20iu
         1xi/gaIuNtbwHL0hiXzWRLGbfxuwAbOx1kGWHS2ocDL2u+lTUOmowzYOfq14uaHoGW7V
         CRodc+WHbq9O0/q1KsvjTlBu+EspBPsu0FFFBkGIoUmbUc9WXN1sS+x8bX+JqShdwdqf
         mXjeswQOAwf57XDpfMQV+V923uLusqdIY6yA1YojOqk39DOTE+j0bjrh7iXx3W2NnMON
         H4eISkeXe0yFarXA0drBDsCupet+gy7adwGmLo2iglCKwDWtuqsdjnrsx0l5IUoBqsf/
         1DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743584; x=1724348384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvkihQVxilci4ahNE1D8FzulqWknfQTNlLMa6I6x8hA=;
        b=Xv0ZzmlkrE/MMaTgcVaEURQq9z0LPnqXuGhK386g9BicstEn0BuwKN41Y5tPER4lTG
         aysDMiXj86RK/Dy5wWHsbO5byPLmAhoy7x7AxD2lMCZwg9jaarhMZrUbVIsAJVZwrwFj
         5uTVz7rXoImHF7xwGwqSm4mfR0HVbIX+CQWId0oH1gOo0FkvBmEic/M4f5tPOGLlhhFb
         hX/LBQVmM098lvFOMBlLuo7n9exAPxBzj8lSZD0QUIKsqsJYOlrWtmQEl5W7CnACmcMh
         aUJDUr+8ka2f6ZiO9yIe+3n7ovfRMvIUGiXLFo8Iw/WC/Sk7x2yqnKJ2d+NFp8NLPWbe
         A+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX9hpQhiHFiIsEXZW2T92CzGyk+T5hl7NMVEN/9+biJpgvSaaPLns7ocUZGejkPxjuewnwTZU15abM785Dxhl1IW/0IvFtb34/2/qrlvGA=
X-Gm-Message-State: AOJu0Yx4COxWu93ZQOb3tjYz0ylhwnurlBZUc4YNqSlrQ4C0DL/GAXL6
	Dh2bHJWE0eibValeQf5n7VbIMVb/MsZxZNJUEujUfXxz908du62j3ry8aNQC4F0D2isbMoT1YDu
	yNFvtNDodtXOa/bP4HEcldtcrMw==
X-Google-Smtp-Source: AGHT+IG9S2PSLwKc0udu8I+6MHxXANcYb3L8yRqmH7TB0UIAP0u33tVkU9SrPY57CXk2d2U4eRcDrYniR8MuW7MasLc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:6208:b0:68e:edf4:7b42 with
 SMTP id 00721157ae682-6b1d42694c8mr59377b3.2.1723743583755; Thu, 15 Aug 2024
 10:39:43 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:21 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=u2NAoGPKAPKT+TpiqoFdPon2GiyhMXZdDU3h7zflpd4=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj06nYnAUNx8o66EBLX4cU2eInAJSpLP8qYpz
 sKtbF+ZNs+JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OgAKCRBMtfaEi7xW
 7h06DACM546WdYBdw7Q9mrV/mD1RWAUpswtCJqVQxJ1f5GKGao7eEcXupGQuIPnw5Ey1+gEthL/
 zUx8fmz4IOOWvMPnn54qc/0OYW6/yOLHQwIOrDeJJf1hMUgHTEdAad87xgKJCve78B3TGIfh2nK
 0yG7q7yEEOxwnfzUWqETFg86JLzNqDLEcF+Le7QPYIg1crSXxPSGj6Qiq+dIClVReWIE6CEXm6A
 jWmn1/KCkWAGpc279+B+yrNNeukRQIgxYLJ88G+cLlgO31F4vU6302m5gBkhobfa5+qVTq3iPBi
 l2Qpx22OOHSDBGGwUufoz7aw+kwon3jhDBACj7QQTb+EJlImWNzKGwUtNj/9Meh0Z3Xr4ZEiquw
 A0WEfBnHtAuLfLpMfn2gsfq/4/5XA4sjbgrBgGBx5xR+Oa1fZwoL0dsfPIBqAXw9LoxbFAMytxK plh5XkQf3fItnk4E4Zyj5I8eM3vUaUZ4Mr52o+5/5O182vI0Y8C1VVTNzQiI1HDbrRaK8=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-38-samitolvanen@google.com>
Subject: [PATCH v2 17/19] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With gendwarfksyms, we need each TU where the EXPORT_SYMBOL() macro
is used to also contain DWARF type information for the symbols it
exports.  However, as a TU can also export external symbols and
compilers may choose not to emit debugging information for symbols not
defined in the current TU, the missing types will result in missing
symbol versions. Stand-alone assembly code also doesn't contain type
information for exported symbols, so we need to compile a temporary
object file with asm-prototypes.h instead, and similarly need to
ensure the DWARF in the temporary object file contains the necessary
types.

To always emit type information for external exports, add explicit
__gendwarfksyms_ptr_<symbol> references to them in EXPORT_SYMBOL().
gendwarfksyms will use the type information for __gendwarfksyms_ptr_*
if needed. Discard the pointers from the final binary to avoid further
bloat.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/export.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index 0bbd02fd351d..cf71d3202e5b 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,9 +52,24 @@
 
 #else
 
+#ifdef CONFIG_GENDWARFKSYMS
+/*
+ * With CONFIG_GENDWARFKSYMS, ensure the compiler emits debugging
+ * information for all exported symbols, including those defined in
+ * different TUs, by adding a __gendwarfksyms_ptr_<symbol> pointer
+ * that's discarded during the final link.
+ */
+#define __GENDWARFKSYMS_EXPORT(sym)				\
+	static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+		__section(".discard.gendwarfksyms") = &sym;
+#else
+#define __GENDWARFKSYMS_EXPORT(sym)
+#endif
+
 #define __EXPORT_SYMBOL(sym, license, ns)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
+	__GENDWARFKSYMS_EXPORT(sym)				\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
 
 #endif
-- 
2.46.0.184.g6999bdac58-goog

