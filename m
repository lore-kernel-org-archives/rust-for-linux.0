Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD73043D2
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766223826; cv=none; b=ILQF0hhRQe7jhTZM9g5+d40QdqXWrpi1ZjGUqMQtUupPC5AUSBoEDW6LVQ4u7XFEeVN/1J4xRuIrnQtDf+UEfvKkj5UXDGC+KMi11nGMddMsJxnvBgDcLDIuH2fEMaBLFShWvSz0DZq9bkiF615EKlHOBDBXLPi27E0BZdqT2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766223826; c=relaxed/simple;
	bh=B1V5BdMWYJ7dX4ma5o1Ess9sSgd6a15V8JGa1QtLizI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5RmqRpuK/cyFSwNF2N28wrlAwUovoL7w1SYzb1Il57CiS0QYivIMcdq1gyunTLl9yyuozRzVxLjtlQN0My1VneC9JzJbawpzBJAVUtosu1mmtSvrWZQxO+O7RCMegWCNPTVcR5rQThrcVi8oJN9yLfOSqB8JM82EAgRN9Khxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgkZy7uF; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgkZy7uF"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so2014405a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766223823; x=1766828623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+DGf/vx6D60cUkPKx91zV2PzsDMHYsMzCFXQyjo9W4=;
        b=lgkZy7uFAHem5BT8RC4OCHAc2aPNl46tUPyhchQtGCO2OHLsuSu1YjVsRWU8aaM0H3
         rYmNVjsehC4v/GZW17qCw2TnXYqEpWcY61vusLO7G0bccXEbKl/uPSRibiqSZvfr2vaE
         /dSzIeQpdi1/6hJmzAKlELgZSWtBepjguKZmvVqK4tk8533CvoT37w6qox+PDBs6Q7oK
         0yaFwbENI/DGJxyNU/k5iciVPuO6/MscFJAtIvwXLA7m0Wkyzmj6DfBL8/b2eA8rGyRK
         WTb3dFWWZSR88gIHPHtFkuJXpCk8C6G3aWgi6JhLa3JjRPsgjZKlfrBv28rltqBVNUVO
         aHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766223823; x=1766828623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+DGf/vx6D60cUkPKx91zV2PzsDMHYsMzCFXQyjo9W4=;
        b=ATtYpAeaa3SI9aVvC5OmnNODTEpydV6u3nlo7wT2bRdM9bMabMn/D6Bm8SH2mUOvj/
         G5aqdxB0DFZ+liXxwKrnujbKRLl9zNnd+HhFt18XaL4jEqhucHz49M5xK0E11MZTSRTJ
         rb+xE12J6ncZPYuw5FOpBxd1eg5Sj1hZOHTNc0bmQzt7kJiFFHwN9AthfqN3oUrnDuGn
         JITU3Cd33lFvksK0kuQrR2yNaJ+YS6YAt4mtUA/6ZBI0JBFHZrj/LoEpVEJk9sVlfG09
         vineMdXzKdGsj/ie8Pn9INdt/9W5ILKqvmAa4Y1U0a+J2OSbe0fy1dEjQzaXogoo3Y8S
         Is5Q==
X-Gm-Message-State: AOJu0YzQdFbx43VKRINh15iA1er1/lycnsQ1dHqbJB4IrphtRVVF5Bh6
	jU67JyzuNmMwQLlU7UAhG5811KtiQcGekN3c5jp9z8icNgL2Bdu8VzVuJh9e5Yt6
X-Gm-Gg: AY/fxX5/6eFlDMzwkT0CdJnLc3FhXwkbdlBYSXMpbyUkru+e930U3U5Ifw4vCMsBDHN
	yLo/3ibWjvnaQaDQ2IhuNqvml7S+cPxDmpLqVeMoFw1g/hVHyFNrf+yhnbKlhUj/g9oAl3TEl5F
	i/zzYGs3fhEHl+bE5AyucHSjN1C1vlWTBn+dz6DHeLnpjPkAiDodjvAnOOwdSjl3hz1p5Vm2bve
	G6zfVzrP47dXZHDvDumVrKYNwB5DXy4bMk0005poMO1HuC80ONrMRO2mX4PaDOTw9iisyaUg/L8
	u2gVy9SIGOy+gtzPRL/pOaoT1inscAO6zU4UCGEuKWlcPq7pb9kj5axtzXUO4aSXUAHillgvZvf
	2iG1FWW50zXNnKqiwsJ8zr5U2NczmfQUukv3AELFMm2WTCfBC8/eMR5zQuAXDZGUCqqLRzTCyvn
	uB+DNclCR9rg0oRIp7ep5LUQ0/ikVLtwNz3f3r39bh4Y55ARcHu2E956H+oymspZsP+FYQsHBMx
	/L2mtVlctoNvK3x
X-Google-Smtp-Source: AGHT+IGRripAWYenegDJMqtHB1irhxh5gAgeFQXbrOBA3y5X+elQkYccDodqS0FQa9iOmM337zoLRw==
X-Received: by 2002:a17:907:7eaa:b0:b76:3599:649e with SMTP id a640c23a62f3a-b8036f0a38cmr589164566b.11.1766223822540;
        Sat, 20 Dec 2025 01:43:42 -0800 (PST)
Received: from codespaces-4ad828.m1k4x3cq3poebda54cltipn05g.ax.internal.cloudapp.net ([4.210.177.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de10dfsm451307766b.36.2025.12.20.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:43:42 -0800 (PST)
From: Riccardo <riccioadami@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Riccardo <riccioadami@gmail.com>
Subject: [PATCH] rust: document safety requirements for fmt::Arguments dereference
Date: Sat, 20 Dec 2025 09:43:32 +0000
Message-ID: <20251220094332.12254-1-riccioadami@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Riccardo <riccioadami@gmail.com>
---
 rust/kernel/print.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 899bed9c08fd..5f54be97a6a0 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -25,10 +25,10 @@
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
     //SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
-// specifier during `vsnprintf` processing and always points to a valid
-// `fmt::Arguments` value created by the caller. The value lives at least
-// for the duration of this call and is only read here. It is not stored
-// or accessed after returning, so dereferencing it is safe.
+    // specifier during `vsnprintf` processing and always points to a valid
+    // `fmt::Arguments` value created by the caller. The value lives at least
+    // for the duration of this call and is only read here. It is not stored
+    // or accessed after returning, so dereferencing it is safe.
 
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
-- 
2.52.0

