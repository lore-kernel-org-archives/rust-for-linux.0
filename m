Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D148837;
	Sun, 22 Dec 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734860925; cv=none; b=u1266t2GZLkCAMoaMe3/G4LM/9aBj2o05S/QoBGqlXUVzAxiKIJd6Ok1sTIYRWotDn8zZQst3V1VdRwCTSA6IVHvzdE0RIUafS8Ul9CvMRfhtGZBr6qu/uDPA+eyiah3cbem7/M8hH7hG4JbC4570BIwGR8JNxYPgeqTM3+BnMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734860925; c=relaxed/simple;
	bh=ovJlSa9P8nxvJ3Tc/Qf7d9KljKGRwe/KE4X8gz7B1Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r0YqBj1WAjoNHL9RUWcnZxCAhaQ4jSDAgGzV4SnygDqtiwI+7DFlQwkEVMtP79JGd+UhkzzRMLJP/psrMOWi7s36M5csq8bUL4VVZWF4zWp7U+dNSM43d4g7iWLXkXFSN6esL5Ec/sTBEdCdiuiK931RAjMaf1DlHZ6loMVrJ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkdSxWGG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkdSxWGG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso28982805ad.0;
        Sun, 22 Dec 2024 01:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734860923; x=1735465723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IXtkPbgHQMzObcmQmD//MckOrWhn3BPuMn50lOW0RY=;
        b=IkdSxWGGFlvkxkXiSCH+JztjP5oqsMlu2qBH986cqyR4GMcQpaJJZ2iD2OluOJvuVx
         IcJdzbOOOUV1HGxGeTPi12FDcNH0XZitN86Mn0K5ESh0FwM1jr41LrF7jiP+iNh9e1WG
         phmJ6xWsdbwYVe8JZS55WOy56sLhk2wIDK6WnwdCjDGTYh121wlmsdpWzMHi4cTg4qoS
         nFMmW7POfqyhJ3084/AV1nchdcj8bTo3AL452WLdxkHBx3ZA1T4llxA9aMVjqNEJivpp
         wH6LAX81cACY3IcORlbffChil4kUoXz8W6uMO1sLKTLq0O/5XS/y/fa/ZygVC16wPlNg
         cm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734860923; x=1735465723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IXtkPbgHQMzObcmQmD//MckOrWhn3BPuMn50lOW0RY=;
        b=BjYxvQnbOI2xinZkF6A4BowbKQT4dT/G8jToGhwdNpwgLVD98hu5fBU9xV+jTIA1Lh
         /T7hbB2DbZoWYizp4/ft0HjNxLjiQabOKq+HxQcuCPFHXmgSP+F9XwuCgh3HOHFRZ9hu
         ddJNxn7NQaW4eB6sVHHs+HJkUqyFDoYDfhHlkaqsagU7ewxGnehKPFNx32O5CPAV7cf3
         gNfdQCPctaotDzuzZaOaYFp/BzlM2j0ErV7DbhL/mBu8QOxX2RD7NzyYa/vJMERgJlgR
         vwbSmbepj06yrJ8CSgHButzLxzUPvviPM2NfpL1IaoxCPOCg3jYvbQ4S8YVf9woidabW
         Tn2w==
X-Gm-Message-State: AOJu0YxGNLe8CSx6t1wkwRaPOjpliZ4ddpS4RBIPkJcW4+WD6/neL8FH
	q8rdNetwd1mHzKc2Z+7QYFjyWAz5YWEXqv/Z6WfAAhWp+UC/ASUtXdMBW6Bf33s=
X-Gm-Gg: ASbGncuf8Yk2qnBycamPN+Mzdh3blR55CgIW48LbsuClLKzAiGvWh6Zc6/yXqTvH5/6
	a6gkhuQz0JytBwXOYG5dzzJ7ZQUHXM0EVHLIc+SjW1nzh/jrC9MhiVdAnTd2X4e1AaXIKwDk/Gr
	CqjpklknooBCAqLUHyegiQQ5nkJTNv1gY9Nl3WfFLpJiuO/OOWnl6FydIl0Lc6i6og7RA2lYb3i
	DRbZUvHQmg7oxizZmdjQJKrm/NRV79G0yblcgrwdUd+1woAa9BJPEqEa85n3Xbhy1s27MemV6o8
	chNJvGmeLrw=
X-Google-Smtp-Source: AGHT+IEnH5FPdXwhS4QD89E4Cm99AxuJFoK+XBviT9T8cjLkKwJ718huPKvLpaWg1FeExfC7I/bPmQ==
X-Received: by 2002:a17:902:ce92:b0:215:5ea2:6544 with SMTP id d9443c01a7336-219e6e8c365mr107384625ad.7.1734860923261;
        Sun, 22 Dec 2024 01:48:43 -0800 (PST)
Received: from BiscuitBobby.am.students.amrita.edu ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b1ce01b8sm4630474a12.20.2024.12.22.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 01:48:42 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	shuah@kernel.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v2 RESEND] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Sun, 22 Dec 2024 15:16:58 +0530
Message-Id: <20241222094658.31263-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zulip links to https://rust-for-linux.zulipchat.com can break in
case of renaming the topic or channel if they are not message
links (which are permanent links).

If a non-permanent Zulip link is referenced then emit a warning
and direct the user to the Zulip documentation.

Permanent links are of the format:
https://.../#narrow/stream/x/topic/x/near/<numerical_id>

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1104
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..9b15484b5a95 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -735,6 +735,10 @@ our $obsolete_archives = qr{(?xi:
 	\Qspinics.net\E
 )};
 
+our $zulip_forums = qr{(?xi:
+	\Qrust-for-linux.zulipchat.com\E
+)};
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -3410,6 +3414,12 @@ sub process {
 			     "Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html\n" . $herecurr);
 		}
 
+# Check for permanent Zulip URL
+		if ($rawline =~ m{http.*\b$zulip_forums(?!(?:/#narrow/stream/.+/topic/.+/(?:near|with)/\d+)?($|\s+.*))}) {
+			WARN("PREFER_PERMANENT_URL",
+			     "Use permanent Zulip links when possible - see https://zulip.com/help/link-to-a-message-or-conversation\n" . $herecurr);
+		}
+
 # Check for added, moved or deleted files
 		if (!$reported_maintainer_file && !$in_commit_log &&
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
-- 
2.39.5

