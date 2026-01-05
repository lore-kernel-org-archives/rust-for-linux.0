Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023A03101C6
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649068; cv=none; b=HQy39lzyM7dwVkMzxgEXsnBtwHC3Grr4eJyqf//KW/iY+RYPex60g6rtzRNrijkIh2PBBx+6fufNHDKVi/R0nA2L6rNV8bcRrFZflEetVhaN5/l4sbZb4/MZY70MM6tRApMjSkwmuHCbInjViU0ZKGOMbUNpT05c1zupSASlgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649068; c=relaxed/simple;
	bh=5p0sIy50n1r3V3HYFDfPF8gjbX8rGZsROgs5AwmRn+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3ivdVS4mdZsf3qRiIYLuL0MlBPgSE9YRH5hiMZehhxSKDtfVJHpODAODtdTQOS7X0z5QxCjkTqwP8SU/yR5nHtqjM0vKxIBmiRgga8kjW0fXjkHHOAzyDWFW2A+6JsH7EUv0/YLpNwEKjJsa3vYPYApYMKtFyd/DeQitY/P6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8010b8f078so72911566b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 13:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767649065; x=1768253865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTD9LmkSSsC1Jd4T87qsHfQjMoBI0N5S+52DkRXb/UQ=;
        b=redxZEYpCdLoMnML6RpUUpj/cY11EzGp4yuDf169vw0PUxbUe/AsOISiGAikKifO7t
         GA8oZU/EIulrX5lsqH/WqiwxKrHJgpYVv/lqUDuNclgSOLdzQkJQ4gMNNOyicKk35Vu/
         NmXicZNjOr5ulGHfXEmfpq3dgtSo60nza/36WfJynh2DpGG8YwbYE7dO/kdCXNZ7RCn+
         BG0BsDNgnbQj+EphIn7uE9G6dgZEUaXPNAEyNtwzsBm7mD9nx6FlwkGBrtMwCmUL7kVZ
         p1ezkzD5CLqkJaljT6N9J8MyTF3bOF68F8r8seDu9M268Gx0a9XEMzVG3ugsnJ9nPGZa
         79lA==
X-Forwarded-Encrypted: i=1; AJvYcCUeGaGL+Wn5KtrRRFeLI1s5vGIhUeNSV7J4mcPplo818MzwkpWrOzNouD07/Wu/s424DLT6e2z3Cu8DKw3X2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydyPylINxkstGG5QxVsXKL2aqZmyw9pisLBEjHD0IetPwu6lT4
	z4c6oeehkgrO73zI/OGQxd1rAn2jjfIQb0HnVAQrujndWncH2vMTCl2XPJ6Z6aIeRBE=
X-Gm-Gg: AY/fxX7VvCsCIyy92r462zkF8yT20WL7R8lJLZARFbJRk4VEoYGG/GKbFDajboPGfXw
	mArcrMCwrJB43Xp6QWpdrZJpE6+hIFz0kcLm89bBpoDUbzBSaTMcluF72SmIXYJTveivcqaAJYR
	9/QpGKSupHpwwnu5XXILbUhnpDddNbFsIdV3EfZoqKcDPE3Q9CzMAVaXR0l8QJHsfqLxd+r+E9k
	KIe7b5N0RsS7Lt/DzQ1MfRsZW2pP1XCwddnIGJ9ck75NJighlUNCuh0bgAfbSTWBPlhJIbXWdml
	bFnW3OcqXUKvtuAZopeLOrlJ52ipt+GVzkTH8NPYarycCvNd2DXIXzsT9Vh6JyeT5kEAbNAxXxZ
	cw/u753LLn0mW3jls8CZ3MDsYfCCsOp3vMiwFQLLTZpNphv4y+/cZRhRUQeANWgUd3d+78d8s4I
	H99GCnXoRTTy19rlf42Agl0g==
X-Google-Smtp-Source: AGHT+IHnjMXaedyKs5tXcCQlJHrztbXwb0K0kypHqcfqy0iQzQ81Ohfv+2XU9rwJA6GN7fm0XXCGUQ==
X-Received: by 2002:a17:907:724e:b0:b76:7f64:77a5 with SMTP id a640c23a62f3a-b8426a6869dmr125033466b.20.1767649064977;
        Mon, 05 Jan 2026 13:37:44 -0800 (PST)
Received: from vps.markoturk.info ([109.60.4.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm35636866b.2.2026.01.05.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:37:44 -0800 (PST)
Date: Mon, 5 Jan 2026 22:37:42 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH v2 1/2] rust: io: remove square brackets from pci::Bar
 reference
Message-ID: <20260105213726.73000-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0

Remove square brackets since this section is not a part of doc-comment
so the reference will not be converted to a link in the generated docs.

Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marko Turk <mt@markoturk.info>
---
Changes since v1:
 - pci::Bar is re-exported so no need to change this to pci::io::Bar
 - instead removed the square brackets as suggested by Danilo

Link to v1: https://lore.kernel.org/lkml/20260103143119.96095-1-mt@markoturk.info/

 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..a97eb44a9a87 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -87,7 +87,7 @@ pub fn maxsize(&self) -> usize {
 /// };
 /// use core::ops::Deref;
 ///
-/// // See also [`pci::Bar`] for a real example.
+/// // See also `pci::Bar` for a real example.
 /// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
 ///
 /// impl<const SIZE: usize> IoMem<SIZE> {
-- 
2.51.0

