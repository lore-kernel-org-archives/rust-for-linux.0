Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE830171C
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jul 2026 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274385; cv=none; b=mCkARHmAXwc3EclAiOjDWlRSH1Y8vCuZAHQDP3KXNNgJt5jCBkEHKFFpOqxio5JgacOzuLrZ13CHBHFbCy6tZTwQ3j0U1F/FvZ+hCEJCQIDjdh1fDayu7x73KmF2ov5RxEOs4Kk0LYyTkt/Ms+zq6xXTDgM2OIZwnY3bfDhCyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274385; c=relaxed/simple;
	bh=wxt1DZW7D4hVvbkLcQ+lyPgqvCFI9lv+zU8l4HAu82U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVjkbFsP9QlIJIvUzw8MEPxGGMip7lRjDtRXaFlefkNJJODtbUHUxDWiJSx28UsQucDghX9wI1O6G5k+jHiKj3Q1NBNQ0vH3KFRW+1rsKCE+gcuR3EWfKnetmRpTECBwVKQ05EWiRwqHa6RQsg9YcK60/Vvg4REeQVG5rN/oc2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKSk83LV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKSk83LV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so14479725e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274382; x=1783879182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tV5ibFxxEGFY5w9PuVHtNxk5YR5ShLb2875PXplyBGA=;
        b=DKSk83LVU13Pfw7gS84WHTdiKOHA/HV6RXnIYqQTzHwnYH3/MVhyT7GLmvmgPDNz0G
         0hGSSffVRLr5OZKulPQl7H0cFMNxLTP352Gj4rIvwuWTjvPn9TUZKrAYh4RoSN5Nt0GS
         JrqoGc0oKMSv86O7Nl//LzRqfw358gYiE+bq6xCNF2nEAD/H4x7bDQsQQsZ8SZab28qK
         TTb/7/hAbDi7r3wpt0hSEeRTvi5M8BUhlSpkt9cbU6RC2BFyj1ilZHCGKo88NTdf8Oj4
         3OQcvpsKHsgbfJ+zmK8LUG8a1MsAD8WuhbgfhT3BeJZoU0hNVe7gwvvqp/pq4Js6vWZ4
         2njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274382; x=1783879182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tV5ibFxxEGFY5w9PuVHtNxk5YR5ShLb2875PXplyBGA=;
        b=kAK3D4iIenpyJsE6x08gWHS86Vv1NQnCWnNz7Qm/KTEwsVyF6GAsg27osntCCp4/xZ
         to+qXJ7R7Qr6J3eYZbu/7n+LF3/uYGp08hRt8XbKf+rzq8z1rK4TDbs1GYHGaSVrhXqv
         9GxGnSP+2g2YIGWn8GYD78iJmwVmp2aAezhYRPpxgpvl7vvqxOUyE0tcGFnAyQfBaWFS
         yPHSR76wfTnImcSZ1OUe3Erc8xjQNlgjBpk1MSNQQQ4LzcaB912pEL2jzpRRU85ONBJP
         6eP+wJPVPC6tsDLK8wV49nwtqAosET9z7kzYnfR3SJ7QYVI/y89hCtD153onyLjILMng
         bNkA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5XyecLRJqtCX6mXKn0cG7avIi3ln9o1Kub080Qm9Esu7/CcTBP6AxQJ0FetM3X4kxgPlHxl3n9SUsm5h8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRpZZp3Cf/0t8nYP/nfGZ80us+8zdqZDkzTdklczhQO3VSGCX
	gBBKStHLR/DXhpovTkvA/E5u44qqaHlo9MMVy9mhqIrta/GUlPwTI+OA
X-Gm-Gg: AfdE7cm3KK1jtV/YOveJ2/z7F+h0xIQ+npwCpeqNELhx2j+dkpCiu5LpQU9G0/BbUDi
	pwkyL5ZvMmaXA3R0MM53TKclSMyp68C5TmaPpMwDNfFXaXIqN+vbsd7pmyV0QOImsL4g5P6kHvv
	/G+SJiftdIfP2jw9CmeZu6xTEqMXotyC8dP7xan5htQ1EQ8O7d1uynfZ088mHYexIQ2/ZAZhoN9
	CDyXxowfEo0iCjlDTzJ6AtZwmQcBtoauBmT5eohlAwHpUYlYaY2dl1L1Q3yduH5M1exw1TWz3d9
	YG4zmYWPgc8CZPp77xqgtPZugexezfY5RraAX1MvQ+anRo6mtR1a6D740M5XDe7hacOYRgke4AS
	838PIR9O3XzUCT5VLjhnJEWQHIzo55BcHX+R3mUsBk3/dh034gVE8Wr2Kl2Htu8TOt4zLGyvCvF
	Byg5QmxanFg5lfGKdVYBI=
X-Received: by 2002:a05:600d:8489:20b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493d11cf2b5mr62215445e9.6.1783274381659;
        Sun, 05 Jul 2026 10:59:41 -0700 (PDT)
Received: from localhost (a89-182-201-232.net-htp.de. [89.182.201.232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9b4d850dsm18636736f8f.0.2026.07.05.10.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:59:41 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: nsc@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH] scripts/tags.sh: Prevent binary files appearing in cscope.files
Date: Sun,  5 Jul 2026 19:59:36 +0200
Message-ID: <20260705175936.4653-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
References: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PROBLEM

When executing the command `make COMPILED_SOURCE=1 cscope`, the resulting
`cscope.files` file contains filenames with the extensions *.rlib, *.rmeta,
and *.so.

SOLUTION

Modify the regular expression in the `all_compiled_sources()` function so
that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.

---

This is the first part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..c9dc2763a505 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -100,7 +100,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0

