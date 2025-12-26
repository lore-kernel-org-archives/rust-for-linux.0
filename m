Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AA2686A0
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766780235; cv=none; b=Wuaf9Hhk0Go7lfcPE3d9h5bt1vR83Rza6g5F9i3ngOzsqZkSwFyivcLEnTauv3Q09rtPh2bXucayOPJ6UFJJdxpCJh3GMzUJ7uIcEu9BiWPiC3DSXeunwi7K6LGUAo1C7PCDiaJ5DMakGmTn3WyYYcdnhJGrTG0tIvFQsyvxys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766780235; c=relaxed/simple;
	bh=q9ccVZ75E1t6Iz8oTFKPOXXPyovi4Nj48RYiQMWWzIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GYl4vKQeHrj42q7hzhveC4V7oL+jxfIh5zWVBd14W7Vh9kHo6ycz6AWxlOgTBpK8qAK3pVzn4Hn1T2PybqRZrV60TzedI2OyrhQd208BxW20YyW/8psZP/MrU8XzILEh/QRuIhP2Gn19/LrP+lFtrCzXXX+7y58hrQQ/lTjHTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oAzVmchb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oAzVmchb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so199827715ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766780233; x=1767385033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5BajE6GC4alJzdat38pb+WqbRtu5IzHgH/U6QY15+M=;
        b=oAzVmchb/eugDTJAIgMlrwhjVMpBBWCrxLs4Sl8oSkIpaRl/5Q0fFia0Q/k0JvlcxM
         6TppQU7lkHdwdtfTEeDJEsTIHda9/bzP86fsTP1FaIrhg4mHqjJogY4r8k1dROXOY1vR
         EFZCZ1eLZm+52tOBxLk4iNMAuZwVYRL4TXStOVy8GvJENo7X78rhLJGQCr4O9/qOzty8
         tXRHJDQW7LYx9mmZNINh9z1nT2G8KHTjzSLCAiwFycdTuOTrVDfY8Sn/R5L1FXBrKASR
         LAV/tgmX9s+ud63gSnqcPK9EkDW2TGj/V+32UdbBIzFx4sGOMfsjcr9S3K64MoWHXNok
         L7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766780233; x=1767385033;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n5BajE6GC4alJzdat38pb+WqbRtu5IzHgH/U6QY15+M=;
        b=Ao7auiOMCjjBEpzfF36U1Nw4BphhfFBmZlNVy6fs1J1za9DqO4/uoWMq+zFXWcwmty
         gTvsZmLy1xvRYkG0w/kq7Wwn0a69UZTCmF81zlDOY50+zizDzbyJu2FZTCrBKjsTV+IL
         SMw2HgctfHoePhCEPeF+wwq9mgoCapVmou6SZ2hazmyxSpUj89WPIiZOVP59gS3cmFBY
         Wj5nGqYlygd0wzR4wdNTvbbf6IX2ttvmSeOb2t6/NHrc56FnTp9Snq6JGJQRiSlpKnzG
         9C+5HfqD3Uj3yJCX6tIIhdfTHiBARiPMiHw6Sn/AXqaq0SBedzYRVY57JjRbBeesFUks
         ScfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC/jiqB6NZWRbInIhIPH66aZKhXFkV01oUoIyW2ZME3yvcKAd8cLRLeGKKFfPknkzNjImcPySb/mq7rjI03w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3KjEXVgFF5972fPQrOwhdPPYp67kZihfqC8gpiIVYJ3MGXOhy
	D+4APP+8TSY7TrJn0OwvdVMURJUWt3AXaelWZCQAlm1o3rIguT0e/jluThgvPvOYbKjauF+kWi6
	P9LjQg9+h9Q==
X-Google-Smtp-Source: AGHT+IER0cckPtj42JVaxluGja7akI8AY3kDpI6WicheC9rZMTka+YXjLsTFwNoebAWThPMSHM7AhBTaGPoQ
X-Received: from dlc13.prod.google.com ([2002:a05:7022:38d:b0:11f:457b:a457])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b903:b0:119:e569:f268
 with SMTP id a92af1059eb24-121722ac40fmr18273733c88.17.1766780232743; Fri, 26
 Dec 2025 12:17:12 -0800 (PST)
Date: Fri, 26 Dec 2025 20:17:08 +0000
In-Reply-To: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766780228; l=1261;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Vyc9JG5KXpS/qLvfPeVNJI9OqD8eT7wmuEDYtRN9r14=; b=7Q3suO3QK0WxCf32bMHYCBfxWPMVux9uhXiE/LL6tJS/QCHrGBUnSonnMdrUquuB3Zbb458Ia
 WyhPexej8DQBsMQhAIkdPzuwFXhAetq1TYgC2A6LAmXccXZ5wh0V0Tq
X-Mailer: b4 0.14.2
Message-ID: <20251226-soc-bindings-v4-2-2c2fac08f820@google.com>
Subject: [PATCH v4 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample values
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
2.52.0.351.gbe84eed79e-goog

