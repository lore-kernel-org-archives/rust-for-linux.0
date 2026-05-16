Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B7384CCC
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968449; cv=none; b=Ys9hYHH1afOue3g1Dmt8yIkIQcq9zVqcQ7JjRz9WEiEASO8KqMcwU3dfE3HN0DeUo2oclTaQ+U10d2UA8EHLgdDpQ0b8VE7YSChDQeV9ckmLVjgEwd6WsY+H9XX3++JveA72svmy/uwQ26n5zFhIF3OaclqqwJ25kNMKuaiZPwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968449; c=relaxed/simple;
	bh=jz1nzUaADwE+K1cfDrDlEU5HkPkq87A/JGOsmNuUTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4V20WPT867lyd1wHqPy3fy0E1sspHF7N+IbvhdNHYupF+qzeqZhGPDUcNBXIy+c3XsNaNTEMgsde3dP3EtH8vI3kmx8bfps0AG9RXpuyzpP6F1oIpo/czRRfCHKLMtWZCJIQFFB2JCD7G0KDQahCgQ2suAjEwv635padtD0Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JshZZZGp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JshZZZGp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso7488975e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968446; x=1779573246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=JshZZZGpEBZAVzz6+EakEN3xOMEYQAOFnwucy7PU86hDls7D64gdM68+Ps1Opn5Uk+
         Sn3E0VMNI4de3jDzYdBbW/rpJbJAeLPLwV7LgXvyNp5HsNNuDjIzTpNK6B+v71jpsX0N
         Bo9u1hqhDZ6bpa1F8SpbE2sA/qIY2OiR+BExjbAg+bhs72LSokkNA8XAVZWFPKH11iaz
         X9Qa+m0LQrPL6uePlUXSdCfvmPCWea9mM11JjtoP6765UuS+BXTj8nxlbyhy3Al9kfjF
         9T6lkHKC2GVXUJLkhqgehB1JIpHEQjMr8OgZFZB1MG3uxSD0REpZUQz+jYR1iiKF19ff
         w2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968446; x=1779573246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=l0Ps786jwHgMAPlU1EV8RsD12zOQ+nRZw726ay0Yhh9wZapFIDgjr3JpmkCUmn0kE7
         EPwJPrBRdxWy7POPlZNPm1+SEu/iEfYFbFEmCcRrGEkjBwTdtCNwlCkkIqn9HjJHC89c
         IoGmXHlDUTDs5xL3U9PtIO8Nfw653Z1Y/Nd69umgZgXBQATTwO73VjBLfxSJaNxZFu41
         jskX8yOtszKLVn8xLh5rCfcDChPYQyV8hMBEjlyLWLpVmDkYIc7HOeVwWziyHUSxe4Ag
         lCaGQFDPU8C6GHeZUsZZNxrVB4sIbqeasgSJdWZjtRu1arHI8W9CupDnhm4ayV8nz+aK
         M2gA==
X-Forwarded-Encrypted: i=1; AFNElJ+R+wTnaPsWMSbLXxcLUNaATUGgeMJYClIVay4uD4arkqLWYhhM6P8p+UWmTiAqwXsPAFx0GDVLb2X9S6KJYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3Qp0QI/SF24vMtB3DK2dGBxlAM0dtP/3Ts7bTg9oAsPP+XYC
	wJiaqOOhRTAooYZRe7v/P32xQCpFs8uE88pKh+YqcJ+jQizWOiWKYX6O
X-Gm-Gg: Acq92OFXzvYwxS1EUNeWxztqtAgEJxvWZfqyxYNL3azmLoGc4M8VWjZ7GYlRhJhQ53k
	DY3cPhbN2FUJJol0xUHZCUES6F4k99xYAAhQbmjLFycNRu91pWbpbF/8ohNNX1C1J+L54LDDUbP
	uuqPeh5y7gWFzfN6zrtVR7/0AN80pzXNJrRDNsequiPOvBhbVzhHXqDebAoRlRUopExnJCIXaYx
	MvahvbXQxlgkwiX/VwgRrl8XxKRIwy8pRKy4CNwcQlbpo6i6KJI3LnL6O3RNkywmMsXzfWp9MF+
	Wj0nphpQlqhS+Bqccpt/faCzL34DWwqKYeo+f/f5lmpnSxguWRzPBiEurxa3eG0YeQMuTZvXb++
	XsvduNXYgybHmZxfIw0LBNP6/gaaXZhYpPKdKKBKSjQ/cSJLmihTP+bqakZQJ6xv3etrcKTRpGn
	Ev4Dht7LljnObzf0SJRT9L7GRkA82lj52/pi6W/MPqD4CoIqSj1Fbzf/s=
X-Received: by 2002:a05:600c:a11c:b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fe5fcdee9mr93789275e9.6.1778968446077;
        Sat, 16 May 2026 14:54:06 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:54:05 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v3 3/3] MAINTAINERS: create entry for kconfirm
Date: Sat, 16 May 2026 22:53:54 +0100
Message-ID: <20260516215354.449807-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..8f4f5a009228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13824,6 +13824,12 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.53.0

