Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332137;
	b=lr1lqkQUjNPvB3pab7VrCYEsszLZaBkmX0gFnE2sa7aDvqy5mhnb6U5tU2RZblArqtpZ
	 sLnztFL7tptCDDdxZGnb5kpN4JK3P0Y6zjCCcM97Uw0u1u8fc7g0bjJrxWpiAgjaVL1HK
	 mAwJKRTAZeC7dseG/O4Vy97TGDUWejvK35FbO9bj9opDXu2bhAikDE60HINUeEwWkbjIO
	 omvR5YVSJBiHc+aKu9QdLfD+CdLesO0pNgLKOakXfEIBXyBMJH6SHbsLJxT6GDeQ2E8Ja
	 o2xe+4FcZnoAFKPd6/QFJM6jdEfkNT6e+yt6ORz7yD8LJ2m7l5LInv7TNNnGj1Uw/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
	b=jF9XYEAbg6dgZ42pBwqtldHtXu7/NJKsMYyPBz2MmIv+zqe11QZ8P6fuF+uhzfhHFy09
	 cRTbsoG6cqoq+KZ6xqxWdyYGoTCFCzk8kF8QDyZY70tzFwgi5U6XR49kj3HO1NJa0qsTJ
	 W8arodFbAgASf5J2ErnL+M0QhUf6vWKvcHE+r0eDS6E/aVSOdLu+I5Si8rMX+ISnqs6xk
	 fxZDdBl98TvX5X0pCf3/4ZGVLL9gHO7TBu07sEezGXvPpD/1TO/y+LovnehaM43e+GrIl
	 ZCanX+O3sDdfhOFiddJH5GTpXRHqisIkVL9dGAQbSnMsA+wBLMKJeE8VcewaqXtek4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7460A261F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 17:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E7460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so28624085e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332135; x=1794936935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=aUlfYej77ygzmzcD1XknZ8Xa1J++Uv47fItDW84lx4AY49JfBMzyc2G6y75h1qFrGE
         Lv+JKxk4oNbdBT49Mezge9HBuGF5cJZuDRgqN/+rWMjrxaqBL7+1HjgOsMeGjkwR+W5B
         qgW5kVMlj9rUsmV0dTdvR4HS776XaIMmEP08OGplU+iX3fd55MiuYp1bEHZfHU1bl8q5
         EFYJoy20+HdKc1iUv+OJ9aKlQ9XhsQZGoYtclAeg+wsDp6kP387asDvDnw9/0Rro+2dL
         cDsnv2Ho0sh/BOcXxdI57h88hVGN4G2mcXqqSD+PWO14JqORz7V6Ku605f5il31tHiwB
         7ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332135; x=1794936935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=iUc4z2uiQ42lTCpMl1rOkweGcb2I6mSkiXJo2Vh2jr2wyqcSEag5UKSqJpudnJXKwy
         tXW0+xmjIRGAodLMAZVQQePBpHbCQjAMzhO65CfC71PRBAnlDDtBpoD9haOu3X4f/UN9
         aZt1/Pro/mluyZYh4/hw0uUa3wCMl0ug+vEl47NdBXwVdq1wg1om4L+srXbSZiNHVItr
         AtJUVJQFlaZAVnqjS6oRXL5Vxyar+nLuhuQXm/A2JfFfyYxMyTDRc1oe7jh5B5iDZlHs
         2qQvoTqWGdq8TQY49ODwHbgwv5KhA3/zWITskeCqaTTOm7RlD6M+BhlgUNr/7fpyNbsC
         gCjA==
X-Forwarded-Encrypted: i=1; AL+hErFebA2ayBEGbJODcyWUm33AGk8mkKtUmW+tAuGqwRSQCNHoeyFMKBxrT74O0QR+MUbcEWIbF02hDyBB4FMVmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8v4dODOqj7p5O4IjNEpayE9uEIqG2GzaF3gHBKk2YxovFvawlD
	ylaMbWZhLQMbaszTCf3qlFCMy8EQQUrvFQSTiGwRkbhxDpNz6o9X9vad
X-Gm-Gg: AYBFou1LqtjqkyAbvAOWT6lKMDsT/I3uKdpSDTbDhyhimLswg+6AbWpx8VtbeqkJRs3
	y3tMLyA2Zzga9TfdI/EcuR7w4+1c1jSKFz/O1JaBuJifMAw1FE9BWOZx27w51NyPaQLHVp2MoQF
	2Q/cJoznA8j2ddiN5FcOU9xGY0UOoWiRvS7u3rrO7ajyu+6j1ZJMvVGwwOrGKghCP1h66eIuPDp
	JPYtjFWyLGL+sKBrUJIApvopVpxuYX9StQ+eiTteUDsyuzBJuD1B/We/CWSgN1nsGuGIzkKpEgL
	VpiOBXT2A7LodKBT2btGmBlm680a3ygpW27Oxom5aYOvd6Zf1+NNbwcKKCmv5wLLVJ41Mj9IiZC
	Yyfws7Pj/gVy2CgsdqicK9nko0BIR4nOUxPVJnHZdl2u0hNQQ1bDwO3YlpvFSsope7SsnddMiv8
	dwH1WoThM2CVKTCh4G3njJphqIOO5IT9YNRlxxhXJnfRRkmoiejjHHsdxM0h3D5zR/+IFU9u8Fr
	JdUZRmgHxA4j3XC68H7s7AYvuGZkobTbvAqHTfVpRtcvKTJOh/cGhMJcbcWgySw+2AxhPuqSPeC
	l6cUPNDDM+HN2mLQ9fTn8WIZL24MBgNhSeN9XWyHvt4h5eIoceNGAWqBUdl+/5g1ymwaFhD1ne7
	+wtZB29qnWNac3PIK9w==
X-Received: by 2002:a05:600c:1d1a:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba08db09ebmr1603255e9.3.1794332135087;
        Tue, 10 Nov 2026 09:35:35 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:34 -0800 (PST)
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
Subject: [PATCH v2 3/3] kconfig: show continuation at the end of wrapped lines
Date: Tue, 10 Nov 2026 17:35:26 +0000
Message-ID: <20261110173526.1548434-4-julianbraha@gmail.com>
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

Add a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol name instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 0b3f2d7bc809..a539b617b62f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1167,12 +1167,15 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 		if (sym_str && sym->type != S_UNKNOWN)
 			extra_length += 4 + strlen(sym_str);
 
+		extra_length += strlen(" \\");
 		last_line_length = strlen(last_cr ? last_cr + 1 : gs->s);
 
 		if (last_line_length > gs->indent + prefix_len &&
 		    last_line_length + extra_length > gs->max_width) {
 			gs->s[gs->wrap_pos] = '\0';
-			str_printf(gs, "\n%*s", gs->indent, "");
+			if (gs->s[gs->wrap_pos - 1] != ' ')
+				str_append(gs, " ");
+			str_printf(gs, "\\\n%*s", gs->indent, "");
 			while (prefix_len--)
 				str_append(gs, "!");
 			if (!sym)
-- 
2.56.0

