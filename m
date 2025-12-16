Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931F2494FE
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913080; cv=none; b=cEqaeE1cNyRnhTp7JlmBeChJJVdnzSbm+6hpThq8s9fs/Re9b8opkIku/oqEKY9ckSZ6BBgiEbpDwq9QBixxnri4PkxqnEcX58H1qYTyVzZWcQ8zsI7ZJF88Li22XoznD6PDNNY8174DpiSglzJIFv9HARCTtf6b9shkcm3deiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913080; c=relaxed/simple;
	bh=LqxxlS4/i6gwgoiVzwffeQkmGGsXyfqyFWcsijZbA9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KW8yuAfLNsLcTBY6L2SVmtRf9VPVFTn6rwX2hZ91soLRYWFtrmHEfjC1EG40qOxIUEh6yYDK/ARVXcPuvbWE096BfzZLYVhNDXu0j+D4KPKTJGVxpZJvIss3WmssJqgZ3TflBCrkkdGTiclnoFQqWqCWj0P3iRre35/erN9ZbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l/IlgWRv; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l/IlgWRv"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c0c7e0a8ac1so8082506a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 11:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765913077; x=1766517877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCT8CzXnMjLHmplwTh0qF+iMeCCzn47uGLMQ1Y0SyoE=;
        b=l/IlgWRvHseBsVZ3p1ZPtNHQpX/RuqvcKUn/Nqu4Fn4iJr4xl9K0H9HeyUy/62UJCm
         MrSaDPtbu/i4R1VI03eIyqelEIjBYDwQ+kn1qun9ZvZ/jf06pF0I+SRtfwJbDuN4TzRf
         ruMoYjhmmgm3GHPIWueJcykQp20pjiuMvStw9QXFRqYx5uvKKPL7MGt8YaqGszYFtkLf
         hIpVIP/ulYe3AtsO4FosafiMUKeNrr1Jz9a730wSM0EfCS04GiQplioScHPusjQQ5r/+
         tGO2koPd3DlY2waHPAbQxTF6Wrz3m7kyZncwM58dj2AhLJbsex/MhxS2FdKUgoCbY8Ba
         bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765913077; x=1766517877;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PCT8CzXnMjLHmplwTh0qF+iMeCCzn47uGLMQ1Y0SyoE=;
        b=t/t00EnZX73ufhVf1hsQ/6z9txZE7NT5FIF/SbzvBz6/2HT/zl1lSUNHQAS6GJxXOH
         Fsr7R5f1ySdX8RLCHzQWpW089lROewmkwnQyCPSzG7Aj4ioNobdFPKFqKTCCjZGPuTi/
         HF4ZQydZ8Pnwcae2Y+/2vH9EkGe590/lfqgKnPSUFo29jbvDuKd5925COQorLsT8R2+A
         4QO8ZAr7BderVszjQBPrBSm7vn+eC7gO0K6dubqIr3AMtV6Ys4NknVH2DZg8Z0LtPdn0
         rFdzvwIB10QlI+6JUrymgsIX6p7ADid9oeyvLhDB6q/Zb9iziMkuVYv5aztErrWrh04F
         0Wfw==
X-Forwarded-Encrypted: i=1; AJvYcCWcsmsdOqndXViCHMmVAVSIPHf5qJSszT1A3gWs3zEKM7XAdHXg3MTC+zG66HpcOa9sPhYoV1u1/yDaX30UvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo/L6I1kbhgkwaPCZNnss/YloHpYisIxnJjcYO+qcoNW/mICHr
	dJLTEK14cQclfzPWFyS0Cl4fNJ4BCN/Rx4q7WOIMzj1Vd7+R9EkoSfGSlXTk2huiNn+PWwhOe/M
	Cz2YA+a5T1g==
X-Google-Smtp-Source: AGHT+IEZ56QmOBawruH657K/DMJRgdLujdgWu4Kgy0A+2J7/sLSPvuD1WA8L51E9ZzFyYKVAHTLSSu8/ry+j
X-Received: from dybmk41.prod.google.com ([2002:a05:7301:ea9:b0:2a4:733c:4a27])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:800f:b0:2ab:ca55:89b6
 with SMTP id 5a478bee46e88-2ac30154a97mr11459558eec.41.1765913077347; Tue, 16
 Dec 2025 11:24:37 -0800 (PST)
Date: Tue, 16 Dec 2025 19:24:30 +0000
In-Reply-To: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765913070; l=1261;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=uW1WwinLWyYqTbUHU0Eo2e0sUZIdoSKVPOwpgjV/qUA=; b=h3e5Ae95fZbP4g67AnzxyJkPNgBZEPztDXN+WoNpffNh89NQBRgHMNr/dpn8SepcaIdPAHXJs
 4d9A1xQz9CkAhmcYVRwkEEVdrVYF7FLp/oQSb4l/kqEtQhSmnbk+s+G
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v3-2-42ecdc8c117e@google.com>
Subject: [PATCH v3 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample values
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The sample values for `family` and `machine` were swapped relative to
what the driver actually does, and doesn't match the field description.

Reviewed-by: Lee Jones <lee@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 Documentation/ABI/testing/sysfs-devices-soc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/AB=
I/testing/sysfs-devices-soc
index 5269808ec35f8e2b18516556f886c77f5fac9401..cb6776a4afe02a76fe27ac6fc23=
6babdc7865287 100644
--- a/Documentation/ABI/testing/sysfs-devices-soc
+++ b/Documentation/ABI/testing/sysfs-devices-soc
@@ -17,14 +17,14 @@ Date:		January 2012
 contact:	Lee Jones <lee@kernel.org>
 Description:
 		Read-only attribute common to all SoCs. Contains the SoC machine
-		name (e.g. Ux500).
+		name (e.g. DB8500).
=20
 What:		/sys/devices/socX/family
 Date:		January 2012
 contact:	Lee Jones <lee@kernel.org>
 Description:
 		Read-only attribute common to all SoCs. Contains SoC family name
-		(e.g. DB8500).
+		(e.g. ux500).
=20
 		On many of ARM based silicon with SMCCC v1.2+ compliant firmware
 		this will contain the JEDEC JEP106 manufacturer=E2=80=99s identification

--=20
2.52.0.305.g3fc767764a-goog

