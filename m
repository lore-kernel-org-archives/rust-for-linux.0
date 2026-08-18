Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647693AB5C7
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066435; cv=none; b=ZQFlHEtdJQ7mo4NBty3LrpGQGXfLpBUU+WvosBVdfNHNT8uJK26tY01T9TDRSAYaBBdKm/9QtMM5LCSrzN7+IK4iCNZMdDqIw1Ys/6xsk57K6VrtAhMMLmdUefoFCQAuocILQW4gayYWK0fyhjlYQlm6NKw9rQWF5J9Rei75VRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066435; c=relaxed/simple;
	bh=/J5NsC9HXB9sVlaQvY4ZrGG/HvNODJXACbbshKQdfzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cV4+6J7nPJVpAcaEBbNfMWsZnjTdiryjenfg49C4+AzbDjJ44M/thIrjx5pO4ijW4SqeQ2mdjzNGG4kK2NLAC2SEykpT+CFKkIH4bOqPyhiLS8FvOXJISfqwQ5aos/EH29Hs5gAEXv48IDt/YKiRxnwZ9BhXww1TJUOqVydpuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swg/cDj/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swg/cDj/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e592da74so648762966b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066431; x=1787671231; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KM8t8bC061fLb+PbV5Os9mUZaMLxlCrSV1jD3Uk+0o=;
        b=swg/cDj/vvDIcrYOdrIDMyKfljF4UXws7X/68te4RPzz8Vsn3YU9svpUxMXXJB25jE
         xv22GtwPawqEMLHBgp2Y02ATidjag7fPQW99qwV/a01bulKSUEvOUVWY9+xnP4JVx0jd
         0Ld6GoYEqA2mt9xGDMcsJns+lCz06ba3O+ey+WvbWOn5X+aS5Ysy9LWAHwMLOPGOu8Er
         Fk6p/weSt+6D3gMQceVtfR8eDpNEGtFVPQKYTW+f9EhTr/lP0nBst1HMN2ndqgcLe0JR
         n/9IMEdxLVf884kuM2DjIRSIOCV4lSoCijg49K74UKsW54e0giQPdGP7lFPK+S7ob3Q3
         Y54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066431; x=1787671231;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KM8t8bC061fLb+PbV5Os9mUZaMLxlCrSV1jD3Uk+0o=;
        b=XwmSj14/V8Ryl+hztFwqkzwpnBaAeSJvbPKtotpYc0HHaB7OZy2E/od5zLpl597MFs
         LfIb6BJJywo4yeIK0csSTZPyZZhWD1CwmbA9YHcDHnW/w8nKjx7+456ivzCbp5d+F/Yf
         7HdZmmflaX/d3qiWb3n+YIDQ75b/8yxYPzcLmJohzwtPWDAZG7jfZyuJPgKbWQsCtPZt
         McfEcJPe14wXi2Un4tJcIeD/GMr+RJws4OgWiEskfM7uzkHi+tV2Ne2RrkBkwld3Dfqz
         ZKf1wA1WR2/x3edKtvQa/5oW04DVU0DESnCGSv2AqQGjMK/tFrD2bv9TwpDWvBXBMoNH
         Z5LQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFK2PnLXXbuDPuPJdoXZmk+E39zKnWkFpftHTNO7AZDpjy/JpZBFNwxTP5KInmBJLo5kcmHGNTqs9dJKwyoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTRxKmSMhzk4VBHQfaAO9qmdZUxAwtZdZuMpv26SDNODqiI1d
	qsqEKvVDCXcIpji5tDBCfuRO0WNp9gcsvNCqUFLJH5wy/mlmWiXPSNG8
X-Gm-Gg: AR+sD11uR3N5wNkNWwBJn/Vtdb3AaQcH2yuKl1V+V/wQKpoX7fS+Ou20mbhutaVxVrE
	wvhtyyg6IgVktEu/iRlLJJLXs7ZgHdtbQ9GSScAZXGQXfsaR/i+Bt+xDoeSQJmmESBgHGcqtcFC
	1DWaeQ/dI1uPoEiL2YVdQX3ENCtpGLe1gHJG5QV1dEaaaFvkDXKicORsfkLL3GDd7xpyvDTfeCK
	LYsXMubpAqukH93/HygueKjSP7KwqXLBXKrUne5hrXrH+rcS6GyjX+1FL4NDRAt7VHWYKBeBwKQ
	g5h+LT71z//fe6+OIp7m46SXjxw2Yy7BvKFVW/cUu+n3ync+mqrhNeVkbkuWqvOFdhMrbjVZzoD
	y+/QsQDobgW1WfSBzaElQmlnl1v5q35TNRBHKuXFjj86z0/a+9PeSQ15l2f8IXBjvbUYhiUBYBZ
	G3nG4rg3PYPNECdav4fYHT0/sgdMMrsKPLA9HfV0GDHGFDt2jDZIc598eP3sMu4hCSkMr/EvWOu
	WBicPPs1Jx3aRgIfrPWMopx
X-Received: by 2002:a17:907:1c1b:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c212a2ab2edmr1569238066b.17.1787066431294;
        Tue, 18 Aug 2026 08:20:31 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm213893266b.21.2026.08.18.08.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:20:30 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Subject: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
Date: Tue, 18 Aug 2026 17:20:20 +0200
Message-Id: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADV4hGoC/yXMQQqAIBBA0avErBNMIrKrRIvSsSbDQi2C6O5ZL
 d/i/wsCesIATXaBx4MCrS6hyDNQU+9GZKSTQXBR8boQbFmV1bgxuzuKTFaiNuWgei05pGbzaOj
 8fm33O+zDjCq+E7jvB/COjORxAAAA
X-Change-ID: 20260812-lockdep-kunit-9628f4bcad90
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066429; l=731;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=/J5NsC9HXB9sVlaQvY4ZrGG/HvNODJXACbbshKQdfzI=;
 b=oer8aPeWmFwIx+APE8r2x8FbO7IFOz1Zzo4XvroWDn9Xo9slWJni6vPJh1LcMCBXvIPyujXY6
 6HbMBdCofeVAL7R6K4t70uT/JcpHZdCJ/dA4LCzqbMdL0dUFNOVur4z
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Add configs that enable extra assertions to be emitted to KUnit test
cases. This makes a subset of concurrency related warnings fail unit test
cases, and not stay as silent warnings.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Malte Wechter (2):
      rust: kunit: add config to fail kunit tests if a lockdep warning is triggered
      rust: kunit: add config to fail kunit if TAINT_WARN is set

 lib/kunit/Kconfig    | 24 ++++++++++++++++++++++++
 rust/macros/kunit.rs | 21 +++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260812-lockdep-kunit-9628f4bcad90

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

